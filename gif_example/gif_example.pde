/*first open a gif in a new tab (make sure the url ends with .gif) then paste link into split on ezgif.com
then upload, split to frames, then download as a zip file
*/

PImage [] gif;//makes an array for the images
int frames;//how many frames there are
int f;//what frame is playing

void setup () {
  size (600, 600);
  frames=9;
  gif=new PImage [frames];
  
  for (int i=0; i<=frames-1; i+=1) {
    //if you want to specify a folder, have to do folder_name/image_name, or just name the folder data and it will do it automatically
    gif [i]=loadImage ("frame_"+i+"_delay-0.2s.gif");//split this string and add 'i' in the middle
  }
}

void draw () {
  image (gif[f], 0, 0, width, height);//will play the different images
  println (frameCount);//shows you what frame is playing at the bottom
  if (frameCount%2==0) f=f+1; //if you divide the frames by 2 and the remainder is 0, then play it-->plays half the frames
  if (f==frames) f=0;//resets it to 0 so it can loop from the beginning again
}
