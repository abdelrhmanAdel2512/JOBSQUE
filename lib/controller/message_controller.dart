import 'package:amit_final_project_1/generated/assets.dart';
import 'package:get/get.dart';

class MessageController extends GetxController{
 bool unRead = false ;
 void changeUnRead(value){
  unRead = value;

  update();
 }
List message = [
 {
  'name' : 'Twitter',
  'Content' : 'Here is the link: http://zoom.com/abcdeefg',
  'time' : '12.39',
  'read' : false,
  'image' : Assets.imagesTwitterLogo
 },
 {
  'name' : 'Gojek Indonesia',
  'Content' : 'Let’s keep in touch.',
  'time' : '12.39',
  'read' : false,
  'image' : Assets.imagesGojekLogo
 },{
  'name' : 'Shoope',
  'Content' : 'Thank You David!',
  'time' : '09.45',
  'read' : true,
  'image' : Assets.imagesShoopeLogo
 },
 {
  'name' : 'Dana',
  'Content' : 'Thank you for your attention!',
  'time' : 'Yesterday',
  'read' : false,
  'image' : Assets.imagesDanaLogo
 },
 {
  'name' : 'Slack',
  'Content' : 'You: I look forward to hearing from you',
  'time' : '12/8',
  'read' : true,
  'image' : Assets.imagesSlackLogo
 },
 {
 'name' : 'Facebook',
 'Content' : 'You: What about the interview stage?',
 'time' : '12/8',
 'read' : true,
  'image' : Assets.imagesFacebookLogo
},
];
}