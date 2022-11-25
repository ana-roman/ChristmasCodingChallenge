import std.file;
import std.string;
import std.stdio;
import std.format;
import std.algorithm;
import std.array;
import std.typecons;
import std.uni;
import std.conv;

void main() {
	challenge1();
	challenge2();
	challenge3();
	challenge4();
}

void challenge1() {
	foreach (line; File("../../input-1.txt", "r").byLine) {
		if (line.strip().length == 0) continue;
		writefln!"%d"(line.count!(c => c == '(') - line.count!(c => c == ')'));
	}
}

void challenge2() {
	ubyte[3][3] keypad = [
		[1, 2, 3],
		[4, 5, 6],
		[7, 8, 9]
	];
	int x = 1;
	int y = 1;
	foreach (line; File("../../input-2.txt", "r").byLine) {
		line = line.strip();
		if (line.length == 0) continue;
		foreach (c; line) {
			if (c == 'U' && y > 0) {
				y--;
			} else if (c == 'D' && y < 2) {
				y++;
			} else if (c == 'L' && x > 0) {
				x--;
			} else if (c == 'R' && x < 2) {
				x++;
			}
		}
		writef!"%d"(keypad[x][y]);
	}
	writeln();
}

void challenge3() {
	int[3] sides;
	ulong validCount = 0;
	foreach (line; File("../../input-3.txt", "r").byLine) {
		if (line.strip().length == 0) continue;
		int c = formattedRead(line.strip, "%d %d %d", sides[0], sides[1], sides[2]);
		if (c != 3) continue;
		if (
			sides[0] + sides[1] > sides[2] &&
			sides[1] + sides[2] > sides[0] &&
			sides[0] + sides[2] > sides[1]
		) {
			validCount++;
		}
	}
	writeln(validCount);
}

void challenge4() {
	int[char] registers;
	foreach (c; 'a' .. 'z') registers[c] = 0;
	alias Instruction = Tuple!(string, "op", string[], "args");
	Instruction[] instructions = readText("../../input-4.txt").strip()
		.splitter('\n')
		.map!((s) {
			string[] words = s.split!isWhite;
			return tuple!("op", "args")(words[0], words[1 .. $]);
		})
		.array;
	
	bool isRegister(string s) {
		return s.length == 1 && s[0] >= 'a' && s[0] <= 'z';
	}

	int resolveValue(string s) {
		if (isRegister(s)) {
			return registers[s[0]];
		}
		return s.to!int;
	}

	int lastSound = 0;
	size_t instructionIndex = 0;
	while (instructionIndex < instructions.length) {
		Instruction instruction = instructions[instructionIndex];
		string op = instruction.op;
		string[] args = instruction.args;
		char reg = args[0][0];
		if (op == "snd") {
			lastSound = resolveValue(args[0]);
		} else if (op == "set") {
			registers[reg] = resolveValue(args[1]);
		} else if (op == "add") {
			registers[reg] += resolveValue(args[1]);
		} else if (op == "mul") {
			registers[reg] *= resolveValue(args[1]);
		} else if (op == "mod") {
			registers[reg] = registers[reg] % resolveValue(args[1]);
		} else if (op == "rcv") {
			if (registers[reg] != 0) {
				writefln!"Last sound: %d"(lastSound);
				break;
			}
		} else if (op == "jgz") {
			if (resolveValue(args[0]) > 0) {
				instructionIndex += resolveValue(args[1]) - 1;
			}
		}
		instructionIndex++;
	}
}
