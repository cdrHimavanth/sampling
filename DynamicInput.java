import java.util.*;
class InputClass{
    static int takeInput(){
        Scanner sc = new Scanner(System.in);
        int a = sc.nextInt();
        return a;
    }
}
class InputClass2 extends InputClass{
    static int takeInput(){
        Scanner sc = new Scanner(System.in);
        int a = sc.nextInt();
        return a*2;
    }
}
public class DynamicInput {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Please enter the number of \"rows\"");
        int rows  = sc.nextInt();
        System.out.println("Please enter the number of \"columns\"");
        int columns = sc.nextInt();
        int[][] a = new int[rows][columns];
        InputClass2 inp1 =new InputClass2();

        for (int i=0;i<rows;i++){
            for (int j=0;j<columns;j++) {
                System.out.println("Please enter the value for Row: " +i +" and Column: " +j);
                a[i][j]=inp1.takeInput();
            }
        }
        for (int i=0;i<rows;i++){
            for (int j=0;j<columns;j++) {
                System.out.print(a[i][j]+" ");
            }
            System.out.println("");
        }
    }
}
