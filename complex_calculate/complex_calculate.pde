void setup(){
  // example for using class Complex
  Complex a = new Complex(2,'+',2);
  a.calculate();
  
  Complex b = new Complex(3,'*',4);
  b.calculate();
}

void draw(){
}

class Complex {
  float rNum;
  char op;
  float total, cNum, num2;
  
  Complex(int realNum, char operator, int complexNum){
    rNum = realNum;
    op = operator;
    cNum = complexNum;
  } 

  Float calculate(){
    // calculate part of complex number
    num2 = cNum * sqrt(-1);
    
    // calculate real number with complex number
    if (op == '+'){
      total = rNum + num2;
    }
    else if (op == '-'){
      total = rNum - num2;
    }
    else if (op == '*'){
      total = rNum * num2;
    }
    else {
      total = rNum / num2;
    }
    println("Total is :",total);
    return total;
  }
  
  void showTotal(){
    println("Total is :",total);
  }
}
