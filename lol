public class Calculator {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        String string = scan.nextLine();
        try {
            Parser parser = new Parser(string);
            long a = parser.getA();
            long b = parser.getB();
            char operation = parser.getOperation().charAt(0);

            switch (operation) {
                case '+': {
                    long max = Long.MAX_VALUE;
                    long c = max - a;
                    if (c < b) {
                        throw new StringResultException();
                    }
                    System.out.println(a + b);
                    break;
                }
                case '-': {
                    System.out.println(a - b);
                    break;
                }
                case '*': {
                    if (b == 0) {
                        throw new ArithmeticException();
                    }
                    System.out.println(a * b);
                    break;
                }
                case '/': {
                    if (b == 0) {
                        throw new ArithmeticException();
                    }
                    System.out.println(a / b);
                    break;
                }
            }
        } catch (StringArgumentException ex) {
            ex.printStackTrace();
        } catch (IllegalArgumentException ex) {
            System.out.println("Неверная операция");
        } catch (ArithmeticException ex) {
            System.out.println("Нельзя делить на ноль");
        } catch (StringResultException ex) {
            System.out.println("Слишком длинный результат");
            System.out.println("Слишком большое число");
        }
    }
}
