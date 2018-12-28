# MIPS-SingleCycle
This is a Single Cycle MIPS implementation

### Logical Instructions
![img1]()

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
![img2]()

### Shift Instructions
![img3]()

| Instruction Operation    |              | fn |
|--------------------------|--------------|----|
| SHL                      | Shift left   | 0  |
| SHR                      | Shift right  | 1  |
| ROL                      | Rotate left  | 10 |
| ROR                      | Rotate right | 11 |

### Memory Instructions 
![img4]()
| Instruction Operation fn |              | fn|
|--------------------------|--------------|---|
| LDM                      | Load memory  | 0 |
| STM                      | Store memory | 1 |

### Condition Jump Instructions
![img5]()
| Instruction Operation    |                     | fn |
|--------------------------|---------------------|----|
| BZ                       | Branch if zero      | 0  |
| BNZ                      | Branch if not zero  | 1  |
| BC                       | Branch if carry     | 10 |
| BNC                      | Branch if not carry | 11 |

## Simple Jump Instructions
![img6]()
## Other Instructions 
![img7]()
