import java.util.Scanner;
public class FourInALine {
	public static void main(String[] args){
        gameStart();
	}
	
	public static void gameStart(){
		char[][] checkerboard=new char[6][7];
		int[] columnNum=new int[7];
		String player1="Red";
		String player2="Yellow";
		int go=0;
		while(true){
			System.out.print("Drop a red disk at column(0-6):");
			Scanner input1 = new Scanner(System.in);
			go = input1.nextInt();
			//input1.close();
			if(ifwin(player1,checkerboard,columnNum,go)) {
				System.out.println("The "+player1+" player won");
				break;
			}
			System.out.print("Drop a yellow disk at column(0-6):");
			Scanner input2 = new Scanner(System.in);
			go = input2.nextInt();
			//input2.close();
			if(ifwin(player2,checkerboard,columnNum,go)) {
				System.out.println("The "+player2+" player won");
				break;
			}
			
		}
	}
	public static boolean ifwin(String player,char[][] checkerboard,int[] col,int go){
		char p=player.charAt(0);
		checkerboard[col[go]][go]=p;
		printCheckerboard(checkerboard);
		col[go]+=1;
		for(int k=0;k<4;k++){
			if(checkerboard[col[go]-1][k]==p&&checkerboard[col[go]-1][k+1]==p&&checkerboard[col[go]-1][k+2]==p&&checkerboard[col[go]-1][k+3]==p)
				return true;
		}
		if(col[go]>=4)
			if(checkerboard[col[go]-2][go]==p&&checkerboard[col[go]-3][go]==p&&checkerboard[col[go]-4][go]==p) return true;
		/*if(col[go]>=4){
			if(go>=3&&checkerboard[col[go]-2][go-1]==p&&checkerboard[col[go]-3][go-3]==p&&checkerboard[col[go]-4][go-3]==p)
				return true;
			if(go<=3&&checkerboard[col[go]][go-1]==p&&checkerboard[col[go]+1][go-3]==p&&checkerboard[col[go]+2][go-3]==p)
				return true;
			
		}
		*/
		for(int k=0;k<3;k++){
			int m=go+col[go]-1;
			if(m>=3&&m<=6&&m-k-3>=0)
				if(checkerboard[k][m-k]==p&&checkerboard[k+1][m-k-1]==p&&checkerboard[k+2][m-k-2]==p&&checkerboard[k+3][m-k-3]==p)
					return true;
		}
		for(int k=0;k<3;k++){
			int m=go-col[go]+1;
			if(m>=0&&m<=3&&m+k+3<=6)
				if(checkerboard[k][m+k]==p&&checkerboard[k+1][m+k+1]==p&&checkerboard[k+2][m+k+2]==p&&checkerboard[k+3][m+k+3]==p)
					return true;
		}
		
		return false;

	}
	public static void printCheckerboard(char[][] b)
	{
		for(int i=5;i>=0;i--){
			for(int j=0;j<7;j++){
				System.out.print(" | "+b[i][j]);
			}
			System.out.println(" |");
		}
	}

}


