#!/bin/bash

----------------

inject = appel ce constructor----------------

public class Operator
{
string operation;
public int Execute(int x, int y)
{
switch(operation)
{
case "Add":
return x + y;
case "Subtract":
return x - y;
case "Multiply":
return x * y;
case "Divide":
return x / y;
default:
throw new InvalidOperationException("Unsupported operation");
}
}
}
you'd have:
public abstract class Operator
{
public abstract int Execute(int x, int y);
}
public class Add : Operator
{
public override int Execute(int x, int y)
{
return x + y;
}
}
// etcpublic class Operator
{
string operation;
public int Execute(int x, int y)
{
switch(operation)
{
case "Add":
return x + y;
case "Subtract":
return x - y;
case "Multiply":
return x * y;
case "Divide":
return x / y;
default:
throw new InvalidOperationException("Unsupported operation");
}
}
}
you'd have:
public abstract class Operator
{
public abstract int Execute(int x, int y);
}
public class Add : Operator
{
public override int Execute(int x, int y)
{
return x + y;
}
}
// etc


--------------------
