# Testbenchs

## fpu
```
iverilog -o fpu ../src/modules/floatingOperation.v ../src/modules/bigALU.v ../src/modules/smallALU.v ../src/modules/normalization.v ../src/modules/rounding.v ../src/modules/shiftRight.v ../src/modules/ucFloat.v ../src/modules/fpu.v ../src/testes/fpu_test.v
```
```
vvp fpu
```
## FloatingOperation
```
iverilog -o flop ../src/modules/floatingOperation.v ../src/modules/bigALU.v ../src/modules/smallALU.v ../src/modules/normalization.v ../src/modules/rounding.v ../src/modules/shiftRight.v ../src/testes/floatingOperation_test.v
```
```
vvp flop
```

## shiftRight
```
iverilog -o shiftRight ../src/modules/shiftRight.v ../src/testes/shiftRight_test.v
```
```
vvp shiftRight
```

## normalization
```
iverilog -o norm ../src/modules/normalization.v ../src/testes/normalization_test.v
```
```
vvp norm
```

## SmallAlu

```
iverilog -o salu ../src/modules/smallALU.v ../src/testes/smallALU_test.v
```
```
vvp salu



