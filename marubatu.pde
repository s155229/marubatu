//画面の状態(0:タイトル画面, 1:ゲーム画面, 2:リザルト画面)
int state = 0;

//コンピュータとの対戦か否か(true or false)
boolean cpu;

//先攻後攻の判定
boolean turn = true;

//駒盤(0:空白, 1:〇, 2:✕)
int[][] table = new int[3][3];
int x;
int y;

//勝敗
int winner;

//画像
PImage titleImg;//タイトル

void setup() {
  size(640, 360);
  for (y = 0; y < table.length; y++) {
    for (x = 0; x < table.length; x++) {
      table[x][y] = 0;
    }
  }

  titleImg = loadImage("titleImg.png");
}

void draw() {
  if (state == 0) {//タイトル画面
    background(127, 175, 255);
    image(titleImg, 0, 0);

    textSize(24);
    fill(255, 0, 0);
    text("Please press the key!", 180, 250);

    if (keyPressed) {
      state = 1;
    }
  }
  if (state == 1) {//ゲーム画面
    background(255);

    line(50, 130, 350, 130);
    line(50, 230, 350, 230);
    line(150, 30, 150, 330);
    line(250, 30, 250, 330);

    if (turn == true) {//先攻
      fill(0);
      text("Player1", 500, 330);
    } else {//後攻
      fill(0);
      text("Player2", 500, 330);
    }
    
    
    if(table[0][0] == 1){
      ellipse(100, 80, 50, 50);
    }else if(table[0][0] == 2){
      line(75, 65, 125, 105);
      line(125, 65, 75, 105);
    }
    if(table[0][1] == 1){
      ellipse(200,80,50,50);
    }else if(table[0][1] == 2){
      line(175,65,225,105);
      line(225,65,175,105);
    }
    if(table[0][2] == 1){
      ellipse(300,80,50,50);
    }else if(table[0][2] == 2){
      line(275,65,325,105);
      line(325,65,275,105);
    }
    if(table[1][0] == 1){
      ellipse(100,180,50,50);
    }else if(table[1][0] == 2){
      line(75,165,125,205);
      line(125,165,75,205);
    }
    if(table[1][1] == 1){
      ellipse(200,180,50,50);
    }else if(table[1][1] == 2){
      line(175,165,225,205);
      line(225,165,175,205);
    }
    if(table[1][2] == 1){
      ellipse(300,180,50,50);
    }else if(table[1][2] == 2){
      line(275,165,325,205);
      line(325,165,275,205);
    }
    if(table[2][0] == 1){
      ellipse(100,280,50,50);
    }else if(table[2][0] == 2){
      line(75,265,125,305);
      line(125,265,75,305);
    }
    if(table[2][1] == 1){
      ellipse(200,280,50,50);
    }else if(table[2][1] == 2){
      line(175,265,225,305);
      line(225,265,175,305);
    }
    if(table[2][2] == 1){
      ellipse(300,280,50,50);
    }else if(table[2][2] == 2){
      line(275,265,325,305);
      line(325,265,275,305);
  }
  }
  if (state == 2) {//リザルト画面
  }
}

void mouseClicked() {
  if (state == 1) {//ゲーム画面
  
    float a0 = dist(100, 80, mouseX, mouseY);//[0][0]
    if (a0 < 50 && table[0][0] == 0) {
      if (turn == true) {
        table[0][0] = 1;
        turn =! turn; 
      } else {
        table[0][0] = 2;
        turn =! turn; 
      }
    }
    
    float a1 = dist(200, 80, mouseX, mouseY);//[0][1]
    if(a1 < 50){
      if (turn == true) {
        table[0][1] = 1;
        turn =! turn; 
      } else {
        table[0][1] = 2;
        turn =! turn; 
      }
    }
    
    float a2 = dist(300, 80, mouseX, mouseY);//[0][2]
    if(a2 < 50){
      if (turn == true) {
        table[0][2] = 1;
        turn =! turn; 
      } else {
        table[0][2] = 2;
        turn =! turn; 
      }
    }
    
    float b0 = dist(100, 180, mouseX, mouseY);//[1][0]
    if(b0 < 50){
      if (turn == true) {
        table[1][0] = 1;
        turn =! turn; 
      } else {
        table[1][0] = 2;
        turn =! turn; 
      }
    }
    
    float b1 = dist(200, 180, mouseX, mouseY);//[1][1]
    if(b1 < 50){
      if (turn == true) {
        table[1][1] = 1;
        turn =! turn; 
      } else {
        table[1][1] = 2;
        turn =! turn; 
      }
    }
    
    float b2 = dist(300, 180, mouseX, mouseY);//[1][2]
    if(b2 < 50){
      if (turn == true) {
        table[1][2] = 1;
        turn =! turn; 
      } else {
        table[1][2] = 2;
        turn =! turn; 
      }
    }
    
    float c0 = dist(100,280, mouseX, mouseY);//[2][0]
    if(c0 < 50){
      if (turn == true) {
        table[2][0] = 1;
        turn =! turn; 
      } else {
        table[2][0] = 2;
        turn =! turn; 
      }
    }
    
    float c1 = dist(200, 280, mouseX, mouseY);//[2][1]
    if(c1 < 50){
      if (turn == true) {
        table[2][1] = 1;
        turn =! turn; 
      } else {
        table[2][1] = 2;
        turn =! turn; 
      }
    }
    float c2 = dist(300, 280, mouseX, mouseY);//[2][2]
    if(c2 < 50){
      if (turn == true) {
        table[2][2] = 1;
        turn =! turn; 
      } else {
        table[2][2] = 2;
        turn =! turn; 
      }
    }   
  }
}