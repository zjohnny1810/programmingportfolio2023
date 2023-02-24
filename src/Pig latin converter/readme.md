//add important statments
import java.util.Scanner;
// set up class
class Main {
  public static void main(String[] args) {
    // creat scanner
    Scanner scan = new Scanner(System.in);
    System.out.println("pleas type a word ");
    String fullName = scan.nextLine();
    fullName = fullName.toLowerCase();
    int count = fullName.length();
    //split the word into two parts
    String partOne = fullName.substring(0,1);
    String partTwo = fullName.substring(1);
    // move the firt prat of the word to the back and ad ay
    String result = partTwo + partOne + "ay";
    System.out.println(result);
    scan.close();
  }
}
