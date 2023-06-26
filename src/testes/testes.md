# Testbenchs

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


