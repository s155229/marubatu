//画面の状態(0:タイトル画面, 1:ゲーム画面, 2:リザルト画面) //<>// //<>//
int state = 0;

//コンピュータとの対戦か否か(true or false)
boolean cpu = false;

//先攻後攻の判定
boolean turn = true;
int turnCnt = 0;

//駒盤(5:空白, 1:〇, -1:✕)
int[][] table = new int[3][3];
int result;
int x;
int y;

//勝敗
int winner;

//画像
PImage titleImg;//タイトル画像

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
  //タイトル画面
  if (state == 0) {
    background(127, 175, 255);
    image(titleImg, 0, 0);

    textSize(24);
    fill(255, 0, 0);
    text("Please press the key!", 180, 250);

    if (keyPressed) {
      state = 1;
    }
  }
  //ゲーム画面
  if (state == 1) {
    background(255);

    line(50, 130, 350, 130);
    line(50, 230, 350, 230);
    line(150, 30, 150, 330);
    line(250, 30, 250, 330);

    if (cpu == false) {
      if (turn == true) {//先攻
        fill(0);
        text("Player1", 500, 330);
      } else {//後攻
        fill(0);
        text("Player2", 500, 330);
      }
    } else {
      //CPU対戦のときの処理
    }


    if (table[0][0] == 1) {

      ellipse(100, 80, 50, 50);
    } else if (table[0][0] == -1) {

      line(75, 65, 125, 105);
      line(125, 65, 75, 105);
    }
    if (table[0][1] == 1) {

      ellipse(200, 80, 50, 50);
    } else if (table[0][1] == -1) {
      line(175, 65, 225, 105);
      line(225, 65, 175, 105);
    }
    if (table[0][2] == 1) {
      ellipse(300, 80, 50, 50);
    } else if (table[0][2] == -1) {
      line(275, 65, 325, 105);
      line(325, 65, 275, 105);
    }
    if (table[1][0] == 1) {
      ellipse(100, 180, 50, 50);
    } else if (table[1][0] == -1) {
      line(75, 165, 125, 205);
      line(125, 165, 75, 205);
    }
    if (table[1][1] == 1) {
      ellipse(200, 180, 50, 50);
    } else if (table[1][1] == -1) {
      line(175, 165, 225, 205);
      line(225, 165, 175, 205);
    }
    if (table[1][2] == 1) {
      ellipse(300, 180, 50, 50);
    } else if (table[1][2] == -1) {
      line(275, 165, 325, 205);
      line(325, 165, 275, 205);
    }
    if (table[2][0] == 1) {
      ellipse(100, 280, 50, 50);
    } else if (table[2][0] == -1) {
      line(75, 265, 125, 305);
      line(125, 265, 75, 305);
    }
    if (table[2][1] == 1) {
      ellipse(200, 280, 50, 50);
    } else if (table[2][1] == -1) {
      line(175, 265, 225, 305);
      line(225, 265, 175, 305);
    }
    if (table[2][2] == 1) {
      ellipse(300, 280, 50, 50);
    } else if (table[2][2] == -1) {
      line(275, 265, 325, 305);
      line(325, 265, 275, 305);
    }

    //勝敗判定
    x = 0;
    y = 0;
    for (; x < table.length; x++) {//行
      if (table[x][y] + table[x][y + 1] + table[x][y + 2] == 3) {
        winner = 1;
        state = 2;
      }
      if (table[x][y] + table[x][y + 1] + table[x][y + 2] == -3) {
        winner = 2;
        state = 2;
      }
    }

    x = 0;
    y = 0;
    for (; y < table.length; y++) {//列
      if (table[x][y] + table[x + 1][y] + table[x + 2][y] == 3) {
        winner = 1;
        state = 2;
      }
      if (table[x][y] + table[x + 1][y] + table[x + 2][y] == -3) {
        winner = 2;
        state = 2;
      }
    }
    if (table[0][0] + table[1][1] + table[2][2] == 3) {//斜
      winner = 1;
      state = 2;
    } else if (table[0][0] + table[1][1] + table[2][2] == -3) {
      winner = 2;
      state = 2;
    }
    if (table[0][2] + table[1][1] + table[2][0] == 3) {//斜
      winner = 1;
      state = 2;
    } else if (table[0][2] + table[1][1] + table[2][0] == -3) {
      winner = 2;
      state = 2;
    }

    if (turnCnt >= 9 && winner != 1 && winner != 2) {
      winner = 0;
      state = 2;
    }
  }
  //リザルト画面
  if (state == 2) {
    background(255);
    fill(255, 0, 0);
    if (winner == 1) {
      text("Player1 Win!", 230, 180);
    } else if (winner == 2) {
      if (cpu == false) {
        text("Player2 Win!", 230, 180);
      } else {
        text("CPU Win!", 230, 180);
      }
    } else if (winner == 0) {
      text("Draw!", 250, 180);
    }

    if (keyPressed) {
      exit();
    }
  }
}

void mouseClicked() {
  //ゲーム画面
  if (state == 1) {

    float a0 = dist(100, 80, mouseX, mouseY);//[0][0]
    if (a0 < 50 && table[0][0] == 0) {
      if (turn == true) {
        table[0][0] = 1;
        turn =! turn; 
        turnCnt++;
      } else {
        table[0][0] = -1;
        turn =! turn; 
        turnCnt++;
      }
    }

    float a1 = dist(200, 80, mouseX, mouseY);//[0][1]
    if (a1 < 50 && table[0][1] == 0) {
      if (turn == true) {
        table[0][1] = 1;
        turn =! turn; 
        turnCnt++;
      } else {
        table[0][1] = -1;
        turn =! turn; 
        turnCnt++;
      }
    }

    float a2 = dist(300, 80, mouseX, mouseY);//[0][2]
    if (a2 < 50 && table[0][2] == 0) {
      if (turn == true) {
        table[0][2] = 1;
        turn =! turn; 
        turnCnt++;
      } else {
        table[0][2] = -1;
        turn =! turn; 
        turnCnt++;
      }
    }

    float b0 = dist(100, 180, mouseX, mouseY);//[1][0]
    if (b0 < 50 && table[1][0] == 0) {
      if (turn == true) {
        table[1][0] = 1;
        turn =! turn; 
        turnCnt++;
      } else {
        table[1][0] = -1;
        turn =! turn; 
        turnCnt++;
      }
    }

    float b1 = dist(200, 180, mouseX, mouseY);//[1][1]
    if (b1 < 50 && table[1][1] == 0) {
      if (turn == true) {
        table[1][1] = 1;
        turn =! turn; 
        turnCnt++;
      } else {
        table[1][1] = -1;
        turn =! turn; 
        turnCnt++;
      }
    }

    float b2 = dist(300, 180, mouseX, mouseY);//[1][2]
    if (b2 < 50 && table[1][2] == 0) {
      if (turn == true) {
        table[1][2] = 1;
        turn =! turn; 
        turnCnt++;
      } else {
        table[1][2] = -1;
        turn =! turn; 
        turnCnt++;
      }
    }

    float c0 = dist(100, 280, mouseX, mouseY);//[2][0]
    if (c0 < 50 && table[2][0] == 0) {
      if (turn == true) {
        table[2][0] = 1;
        turn =! turn; 
        turnCnt++;
      } else {
        table[2][0] = -1;
        turn =! turn; 
        turnCnt++;
      }
    }

    float c1 = dist(200, 280, mouseX, mouseY);//[2][1]
    if (c1 < 50 && table[2][1] == 0) {
      if (turn == true) {
        table[2][1] = 1;
        turn =! turn; 
        turnCnt++;
      } else {
        table[2][1] = -1;
        turn =! turn; 
        turnCnt++;
      }
    }
    float c2 = dist(300, 280, mouseX, mouseY);//[2][2]
    if (c2 < 50 && table[2][2] == 0) {
      if (turn == true) {
        table[2][2] = 1;
        turn =! turn; 
        turnCnt++;
      } else {
        table[2][2] = -1;
        turn =! turn;
        turnCnt++;
      }
    }
  }
}