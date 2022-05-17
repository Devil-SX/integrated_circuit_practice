# Basic Elements of VHDL

[TOC]

## **Entity**

ports

```vhdl
entity entity_name is  
port (  
	port_1_name : mode data_type;  
	ort_2_name : mode data_type;  
    .......  
    Port_n_name : mode data_type  
);  
end entity entity_name;  
```

**mode** :in,out, inout ,buffer

**rules of port name**

\- Port name consist of letters, digits, and underscores.
\- It always begins with a letter.
\- Port name is **case insensitive**.

**Generic**

Generic must be declared before the ports.Generic does have a mode.

```vhdl
entity entity_name is  
generic (  
    generic_1_name : data_type;  
    generic_2_name : data_type;  
    ........  
    generic_n_name : data_type  
);  
port (  
    port_1_name : mode data_type;  
    port_2_name : mode data_type;  
    ........  
    Port_n_name : mode data_type  
);  
end entity_name;  
```

## Architecture

context

can contain both **concurrent**（并行） and **sequential**（顺序） statements

```vhdl
architecture architecture_name of entity_name is 
	-- signal declarations
begin  
	-- functional RTl (or structural) code 
end architecture_name;  
```

### Process

process is **Concurrent Statement** used in Architecture

```vhdl
optional_label: process (optional sensitivity list)
	--declarations
begin
	--sequential statements
end process optional_label;
```

- A process may contain any sequential statement.(Such as wait?)
- A process cannot have both a sensitivity list and wait statements
- A process must have a sensitivity or wait statements
- 同一个结构内的process并行执行，process内部顺序执行

```vhdl
process
begin
  if (ALARM_TIME = CURRENT_TIME) then
    SOUND_ALARM <= '1';
  else
    SOUND_ALARM <= '0';
  end if;
  wait on ALARM_TIME, CURRENT_TIME;
end process;
```

### Wait

[VHDL Reference Guide - Wait Statement (uci.edu)](https://www.ics.uci.edu/~jmoorkan/vhdlref/waits.html)

wait is sequential statement used in **process** or **procedure**

```
wait until condition;
wait on signal_list;
wait for time;
wait;
```

wait on 和 process 的sensitivity list 作用一致

wait 和 sensitivity list 不能同时出现

## Configuration

link （我不明白这个模块怎么用）

```vhdl
configuration configuration_name of entity_name is  
--configuration declarations  
for architecture_name  
  for instance_label : component_name  
     use entity library_name.entity_name(architecture_name);  
end for;  
--  
end for;  
end [configuration] [configuration_name];  
```

## Package

分为**包首**和**包体**

# Procedure 和 Function

[VHDL Reference Guide - Procedures (uci.edu)](https://www.ics.uci.edu/~jmoorkan/vhdlref/procedur.html)

[【FPGA学习笔记】VHDL语言学习笔记（四）并行语句：并行赋值、process、子程序（procedure、function）](https://blog.csdn.net/yang_jiangning/article/details/104999516)

# Objects

## Constants

`constant number_of_bytes integer:=8;`

## Variables

Variables are assigned by the assignment operator "**:=**".

:=是直接赋值，初始化和variables的赋值都是使用:=

variables在process里声明，只能在process里赋值

​	`variable index: integer :=0;`

## Signals

Signals are assigned by the assignment operator "**<=**".

<=是延时赋值，对应现实实际电路信号的传输，signals除了在初始化时使用:=，其它时候使用延时赋值

```vhdl
Signal sig1: std_logic;--std_logic 是啥，引入了库看上去像是
Sig1 <= '1'
```

# Data Types

## Scalar Types

Integer, Floating point, Enumeration, Physical(?)

## Composite Types

Arrays, Record

一个是同种类型，一个是不同种类型并且拥有不同的名字（类似C的Structure）

VHDL的数据类型好多

[Data Types in VHDL (technobyte.org)](https://technobyte.org/datatypes-in-vhdl/)

为什么需要signed和unsigned，和integer又有什么区别[How to use Signed and Unsigned in VHDL - VHDLwhiz](https://vhdlwhiz.com/signed-unsigned/)

（signed 和 unsigned 就像一个数据类型）

# Operators

Logical Operators 用的是英文描述

**Relational Operators** 

- = Equal to

- /= Not Equal to

**Arithmetic Operators**

- & Concatenation

- mod Modulus
- rem Remainder
- abs Absolute Value
- ** Exponentiation

Shift Operators

# Library

`library <library_name>;`

`use <library_name>.<package_name>.all;`

包含在ieee library里的package

- **std_logic_1164** 含有std_logic,std_logic_vector数据类型（std_logic不只含有0和1的状态)和一些逻辑运算函数
- **std_logic_arith** 含有signed和unsigned数据类型，算数运算
- **std_logic_unsigned**，**std_logic_signed** 对于带符号运算和不带符号运算std_logic_vector，需要引入的库

[VHDL的数据类型 - 李好123 - 博客园 (cnblogs.com)](https://www.cnblogs.com/lhkhhk/p/11845169.html)

# Instance

## Component

先声明需要例化的模块，再例化它

[ VHDL中元件（模块）的例化_cc雨落的博客-CSDN博客_vhdl元件例化](https://blog.csdn.net/qq_36143127/article/details/104695210)

注意例化时=>连接的方向

# Test

[用vhdl写testbench文件的简单方法_vhdl测试文件怎么写](https://blog.csdn.net/chiyiwei7384/article/details/79753435)

# Others

--单行注释

/* */多行注释（不行会报错）

'event 表示信号跳变

[vhdl, What does others => '0' mean? (computer-programming-forum.com)](http://computer-programming-forum.com/42-vhdl/8625dca6593d01d5.htm)

[VHDL Reference Guide - If Statement (uci.edu)](https://www.ics.uci.edu/~jmoorkan/vhdlref/ifs.html)

# Reference

[亲民编写：重拾VHDL和Verilog系列（一）——VHDL编写结构 - 鯎鯎 - 博客园 (cnblogs.com)](https://www.cnblogs.com/bakasen/archive/2012/08/20/2647799.html#:~:text=VHDL中有两种赋值方式，一种是直接赋值，一种是延时赋值。 还有一种不太像赋值，而是像指向的方式，port map,(符号是"%3D>")，这里不把此方式当作赋值。 variable 就是直接的代表，当赋值后，左值将等于右值。)

[介绍这三个结构比较好的文章：Using Entity, Architecture and Library in VHDL Designs (fpgatutorial.com)](https://fpgatutorial.com/vhdl-entity-architecture-library/#:~:text=VHDL Architecture The architecture is the second part,an architecture with a previously defined VHDL entity.)

[如何在vscode上配合modelsim写VHDL代码_Yetjj的博客-CSDN博客_vscode写vhdl](https://blog.csdn.net/Yetjj/article/details/117457896)

