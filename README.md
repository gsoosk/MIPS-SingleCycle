# MIPS-SingleCycle
This is a Single Cycle MIPS implementation
* [Pipeline version](https://github.com/gsoosk/MIPS-PipeLine)
* [MultiCycle version](https://github.com/gsoosk/MIPS-MultiCycle)

### Logical Instructions
![img1](https://github.com/gsoosk/MIPS-SingleCycle/blob/master/img/1.png)

| Instruction Operation    |                                | fn  |
|--------------------------|--------------------------------|-----|
| ADD                      | Add without carry in           | 0   |
| ADDC                     | Add with carry in              | 1   |
| SUB                      | Subtract without carry in      | 10  |
| SUBC                     | Subtract with carry in         | 11  |
| AND                      | Bitwise logical and            | 100 |
| OR                       | Bitwise logical or             | 101 |
| XOR                      | Bitwise logical xor            | 110 |
| MASK                     | Bitwise logical mask (and-not) | 111 |

### Immediate Logical Instructions
![img2](https://github.com/gsoosk/MIPS-SingleCycle/blob/master/img/2.png)

### Shift Instructions
![img3](https://github.com/gsoosk/MIPS-SingleCycle/blob/master/img/3.png)

| Instruction Operation    |              | fn |
|--------------------------|--------------|----|
| SHL                      | Shift left   | 0  |
| SHR                      | Shift right  | 1  |
| ROL                      | Rotate left  | 10 |
| ROR                      | Rotate right | 11 |

### Memory Instructions 
![img4](https://github.com/gsoosk/MIPS-SingleCycle/blob/master/img/4.png)


| Instruction Operation    |              | fn|
|--------------------------|--------------|---|
| LDM                      | Load memory  | 0 |
| STM                      | Store memory | 1 |

### Condition Jump Instructions
![img5](https://github.com/gsoosk/MIPS-SingleCycle/blob/master/img/5.png)


| Instruction Operation    |                     | fn |
|--------------------------|---------------------|----|
| BZ                       | Branch if zero      | 0  |
| BNZ                      | Branch if not zero  | 1  |
| BC                       | Branch if carry     | 10 |
| BNC                      | Branch if not carry | 11 |

## Simple Jump Instructions
![img6](https://github.com/gsoosk/MIPS-SingleCycle/blob/master/img/6.png)
## Other Instructions 
![img7](https://github.com/gsoosk/MIPS-SingleCycle/blob/master/img/7.png)
