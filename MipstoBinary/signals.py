from collections import deque

class Signals:
    def __init__(self):
        self.binary = []
        self.names = ["Branch", "PWrite", "IorD", "MemRead", "MemWrite", "MemtoReg", "IrWrite", "AluSrcA",
                    "regWrite", "RegDst", "PcSrc", "AluSrcB", "AluOp"]

    def bits(self, nums, option):
        bits = deque()
        for b in option: bits.append(b)
        for n in range(nums-len(option)): bits.appendleft("0")
        self.binary.append(''.join(bits))

    def choose(self, val):
        text = ["    jump/0, branch/1, alu/2? : ",
                "    read2/0, 4/1, inmidiate/2, branch/3? : ",
                "    +/0, -/1, */2, //3, =/4, </5, >/6, %/7, or/8, and/9, nor/10? : "]
        if val: text = [["","",""], text]
        else: text = [text, ["", "", ""]]
        for n in self.names:
            if n == "PcSrc":
                print("PcSrc? : " if not val else "", end="")
                if not val: print('')
                option = input(text[0][0])
                option = int(option) if len(option) and option.isdigit() else 0
                option = 0 if option < 0 else (2 if option > 2 else option)
                option = "{0:b}".format(option)
                self.bits(3, option)
            elif n == "AluSrcB":
                print("AluSrcB? : " if not val else "", end="")
                if not val: print('')
                option = input(text[0][1])
                option = int(option) if len(option) and option.isdigit() else 0
                option = 0 if option < 0 else (3 if option > 3 else option)
                option = "{0:b}".format(option)
                self.bits(3, option)
            elif n == "AluOp":
                print("AluOp? : " if not val else "", end="")
                if not val: print('')
                option = input(text[0][2])
                option = int(option) if len(option) and option.isdigit() else 0
                option = 0 if option < 0 else (10 if option > 10 else option)
                option = "{0:b}".format(option)
                self.bits(4, option)
            else:
                option = input((n+"? : ") if not val else "")
                option = "1" if option == "1" else "0"
                self.binary.append(option)
        result = ''.join(self.binary)
        self.binary = []
        return result

s = Signals()
count = int(input("How many signals are you looking for?: "))
while count:
    count -= 1
    print('"{}",'.format(s.choose(0)))
