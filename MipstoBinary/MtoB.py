from collections import deque
from sys import stdin

def code():
    cs = "lw sw add sub mult div less great mod or and nor addi brch jump"
    css, cds, rgs = cs.split(), {}, {}
    for cd in range(len(css)):
        binario = ''.join(str(1 & int(cd) >> i) for i in range(4)[::-1])
        cds[css[cd]] = binario
    for cd in range(16):
        binario = ''.join(str(1 & int(cd) >> i) for i in range(4)[::-1])
        rgs["r{}".format(cd)] = binario
    return cds, rgs

def main():
    global ins, codes
    codes, regs = code()
    c = deque('# '.join(stdin.readlines()).split())
    c.append('#')
    setI =["00000000000000000000"]
    while len(c):
        s, instruction = '', []
        while s != '#':
            if s != '': instruction.append(s)
            s = c.popleft()
        bits = codes[instruction[0]]
        if not instruction[len(instruction)-1][0].isdigit():
            for n in instruction[1:]: bits += regs[n]
            assert instruction[len(instruction)-1] != "r15", "r15 is reserved for zero '0'"
            bits += "0000"
        else:
            for n in instruction[1:][:-1]: bits += regs[n]
            assert instruction[0] == "jump" or instruction[0] == "brch" or instruction[2] != "r15" or instruction[0] == "sw", "r15 is reserved for zero '0'"
            if instruction[0] == "jump": bits += "00000000"
            if instruction[0] == "brch":
                bits += ''.join(str(1 & (int(instruction[len(instruction)-1])-1) >> i) for i in range(8)[::-1])
            else:
                bits += ''.join(str(1 & int(instruction[len(instruction)-1]) >> i) for i in range(8)[::-1])
        setI.append(bits)
        tmp = []
        for b in range(len(setI)):
            if b%3: tmp.append('"{}", '.format(setI[b]))
            else: tmp.append('"{}", \n'.format(setI[b]))
    print(''.join(tmp))

main()
