import java.util.Scanner;
public class MarkovMatrix {
	public static void main(String[] args){
		double[][] markovMatrix=new double[3][3];
		System.out.println("Enter a 3-by-3 matrix row by row:");	
		Scanner input = new Scanner(System.in);
		for(int i=0;i<3;i++)
			for(int j=0;j<3;j++)
				markovMatrix[i][j]=input.nextDouble();
		if(isMarkovMatrix(markovMatrix))
			System.out.println("It is a Markov matrix");
		else
			System.out.println("It is not a Markov matrix");
	}
	public static boolean isMarkovMatrix(double[][] m){
		double[] sum=new double[3];
		for(int i=0;i<3;i++)
			for(int j=0;j<3;j++){
				if(m[i][j]<=0) return false;
				sum[j]+=m[i][j];
			}
		if(sum[0]==1&&sum[1]==1&&sum[2]==1) return true;
		else return false;
	}

}
