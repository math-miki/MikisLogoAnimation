void setup() {
  size(1200, 700);
  frameRate(60);
}

int SCENE_COUNT = 1;//初期値は1
int theta = 0;
int lineLength = 0;
void draw() {
  background(255);
  if (SCENE_COUNT == 1) {
    if (frameCount == 1) {
      theta = 180;
      frameRate(180);
    }
    if (theta>-90) {
      SCENE_COUNT_1_DRAW();
      theta--;
    } else {
      SCENE_COUNT_1_FINISH(true);
      frameCount = 1;
      SCENE_COUNT++;
    }
  } else if (SCENE_COUNT == 2) {
    if (frameCount == 2) {//frameCount == 2 で初期化(全フレームにてframeCountが1になっている)
      lineLength = 1;
      frameRate(180);
    }
    if (lineLength<=900) {
      SCENE_COUNT_2_DRAW();
    } else {
      SCENE_COUNT_2_FINISH(true);
      frameCount = 1;
      SCENE_COUNT++;
    }
  } else if (SCENE_COUNT == 3) {
    if (frameCount == 2) {//frameCount == 2 で初期化(全フレームにてframeCountが1になっている)
      SCENE_COUNT_3_FINISH(true);
    }
    if (true) {
      SCENE_COUNT_3_DRAW();
    } else {
      SCENE_COUNT_3_FINISH(true);
      frameCount = 1;
      SCENE_COUNT++;
    }
  }
}
/*
  finishが入れ子になっているので問題あり.
 */
//SCENE1
void SCENE_COUNT_1_DRAW() {
  fill(0);
  noStroke();
  arc( 1050, 150, 100, 100, radians( theta ), radians( 180 ) );
}
void SCENE_COUNT_1_FINISH(Boolean hoge) {
  fill(0);
  noStroke();
  arc( 1050, 150, 100, 100, radians( -90 ), radians( 180 ) );
}
//SCENE2
void SCENE_COUNT_2_DRAW() {
  SCENE_COUNT_1_FINISH(false);
  stroke(0);
  strokeWeight(50);
  line(1050-lineLength, 124, 1050, 125);
  lineLength++;
}
void SCENE_COUNT_2_FINISH(Boolean hoge) {
  if (hoge) {
    SCENE_COUNT_1_FINISH(false);
  }
  stroke(0);
  strokeWeight(50);
  line(150, 124, 1050, 125);
}
//SCENE3
void SCENE_COUNT_3_DRAW() {
  SCENE_COUNT_1_FINISH(false);
  SCENE_COUNT_2_FINISH(false);
}
void SCENE_COUNT_3_FINISH(Boolean hoge) {
  if (hoge) {
    SCENE_COUNT_1_FINISH(false);
    SCENE_COUNT_2_FINISH(false);
  }
  ellipse(150, 150, 50, 50);
  //arc(150,150,100,100,)
}
//SCENE4
void SCENE_COUNT_4_DRAW() {
  SCENE_COUNT_1_FINISH(false);
  SCENE_COUNT_2_FINISH(false);
  SCENE_COUNT_3_FINISH(false);
}
void SCENE_COUNT_4_FINISH(Boolean hoge) {
  if (hoge) {
    SCENE_COUNT_1_FINISH(false);
    SCENE_COUNT_2_FINISH(false);
    SCENE_COUNT_3_FINISH(false);
  }
  line(124, 150, 124, 550);
}

void SCENE_COUNT_5_DRAW() {
  SCENE_COUNT_1_FINISH(false);
  SCENE_COUNT_2_FINISH(false);
  SCENE_COUNT_3_FINISH(false);
  SCENE_COUNT_4_FINISH(false);
}
void SCENE_COUNT_5_FINISH(Boolean hoge) {
  if (hoge) {
    SCENE_COUNT_1_FINISH(false);
    SCENE_COUNT_2_FINISH(false);
    SCENE_COUNT_3_FINISH(false);
    SCENE_COUNT_4_FINISH(false);
  }
  line(124, 150, 124, 550);
}