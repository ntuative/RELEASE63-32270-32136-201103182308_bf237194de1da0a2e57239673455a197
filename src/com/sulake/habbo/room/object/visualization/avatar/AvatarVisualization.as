package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
      
      private static const const_925:String = "avatar";
      
      private static const const_592:Number = -0.01;
      
      private static const const_593:Number = -0.409;
      
      private static const const_927:int = 2;
      
      private static const const_1269:Array = [0,0,0];
      
      private static const const_1270:int = 3;
       
      
      private var var_578:AvatarVisualizationData = null;
      
      private var var_532:Map;
      
      private var var_478:Map;
      
      private var var_1218:int = 0;
      
      private var var_883:Boolean;
      
      private var _figure:String;
      
      private var var_983:String;
      
      private var var_1219:int = 0;
      
      private var var_579:BitmapDataAsset;
      
      private var var_867:BitmapDataAsset;
      
      private var var_1624:int = -1;
      
      private var var_1622:int = -1;
      
      private var var_1625:int = -1;
      
      private const const_926:int = 0;
      
      private const const_1764:int = 1;
      
      private const const_1738:int = 2;
      
      private const const_1739:int = 3;
      
      private const const_1268:int = 4;
      
      private var var_1588:int = -1;
      
      private var var_244:String = "";
      
      private var _postureParameter:String = "";
      
      private var var_1626:Boolean = false;
      
      private var var_1623:Boolean = false;
      
      private var var_1627:Boolean = false;
      
      private var var_1333:Boolean = false;
      
      private var var_586:Boolean = false;
      
      private var var_1334:int = 0;
      
      private var var_1336:int = 0;
      
      private var var_2193:int = 0;
      
      private var var_697:int = 0;
      
      private var var_699:int = 0;
      
      private var var_580:int = 0;
      
      private var var_1335:int = 0;
      
      private var var_1069:Boolean = false;
      
      private var var_1629:Boolean = false;
      
      private var var_1067:int = 0;
      
      private var var_698:int = 0;
      
      private var var_1628:Boolean = false;
      
      private var var_1068:int = 0;
      
      private var var_59:IAvatarImage = null;
      
      private var var_702:Boolean;
      
      public function AvatarVisualization()
      {
         super();
         this.var_532 = new Map();
         this.var_478 = new Map();
         this.var_883 = false;
      }
      
      override public function dispose() : void
      {
         if(this.var_532 != null)
         {
            this.resetImages();
            this.var_532.dispose();
            this.var_478.dispose();
            this.var_532 = null;
         }
         this.var_578 = null;
         this.var_579 = null;
         this.var_867 = null;
         super.dispose();
         this.var_702 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_702;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.var_578 = param1 as AvatarVisualizationData;
         createSprites(this.const_1268);
         return true;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number, param3:Boolean) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:* = false;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1.getUpdateID() != var_176)
         {
            _loc4_ = false;
            _loc5_ = false;
            _loc6_ = 0;
            _loc7_ = "";
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_258) > 0 && param3);
            if(_loc5_ != this.var_1626)
            {
               this.var_1626 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_382) > 0;
            if(_loc5_ != this.var_1623)
            {
               this.var_1623 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_409) > 0;
            if(_loc5_ != this.var_1627)
            {
               this.var_1627 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_657) > 0 && param3);
            if(_loc5_ != this.var_1333)
            {
               this.var_1333 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_1099) > 0;
            if(_loc5_ != this.var_586)
            {
               this.var_586 = _loc5_;
               _loc4_ = true;
               this.updateTypingBubble(param2);
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_125);
            if(_loc6_ != this.var_1334)
            {
               this.var_1334 = _loc6_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_266);
            if(_loc7_ != this.var_244)
            {
               this.var_244 = _loc7_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_870);
            if(_loc7_ != this._postureParameter)
            {
               this._postureParameter = _loc7_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_1067);
            if(_loc6_ != this.var_1336)
            {
               this.var_1336 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_575);
            if(_loc6_ != this.var_697)
            {
               this.var_697 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_516);
            if(_loc6_ != this.var_699)
            {
               this.var_699 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_376);
            if(_loc6_ != this.var_580)
            {
               this.var_580 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_203);
            if(_loc6_ != this.var_1624)
            {
               this.var_1624 = _loc6_;
               _loc4_ = true;
            }
            if(this.var_699 > 0 && param1.getNumber(RoomObjectVariableEnum.const_376) > 0)
            {
               if(this.var_580 != this.var_699)
               {
                  this.var_580 = this.var_699;
                  _loc4_ = true;
               }
            }
            else if(this.var_580 != 0)
            {
               this.var_580 = 0;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_866);
            if(_loc6_ != this.var_1067)
            {
               this.var_1067 = _loc6_;
               _loc4_ = true;
               this.updateNumberBubble(param2);
            }
            this.validateActions(param2);
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_1038);
            if(_loc7_ != this.var_983)
            {
               this.var_983 = _loc7_;
               _loc4_ = true;
            }
            _loc8_ = param1.getString(RoomObjectVariableEnum.const_196);
            if(this.updateFigure(_loc8_))
            {
               _loc4_ = true;
            }
            var_176 = param1.getUpdateID();
            return _loc4_;
         }
         return false;
      }
      
      private function updateFigure(param1:String) : Boolean
      {
         if(this._figure != param1)
         {
            this._figure = param1;
            this.resetImages();
            return true;
         }
         return false;
      }
      
      private function resetImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_532)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         for each(_loc1_ in this.var_478)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         this.var_532.reset();
         this.var_478.reset();
         this.var_59 = null;
         _loc2_ = getSprite(this.const_926);
         if(_loc2_ != null)
         {
            _loc2_.asset = null;
            _loc2_.alpha = 255;
         }
      }
      
      private function validateActions(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 < 48)
         {
            this.var_1333 = false;
         }
         if(this.var_244 == "sit" || this.var_244 == "lay")
         {
            this.var_1335 = param1 / 2;
         }
         else
         {
            this.var_1335 = 0;
         }
         this.var_1629 = false;
         this.var_1069 = false;
         if(this.var_244 == "lay")
         {
            this.var_1069 = true;
            _loc2_ = int(this._postureParameter);
            if(_loc2_ < 0)
            {
               this.var_1629 = true;
            }
         }
      }
      
      private function getAvatarImage(param1:Number, param2:int) : IAvatarImage
      {
         var _loc3_:* = null;
         var _loc4_:String = "avatarImage" + param1.toString();
         if(param2 == 0)
         {
            _loc3_ = this.var_532.getValue(_loc4_) as IAvatarImage;
         }
         else
         {
            _loc4_ += "-" + param2;
            _loc3_ = this.var_478.getValue(_loc4_) as IAvatarImage;
         }
         if(_loc3_ == null)
         {
            _loc3_ = this.var_578.getAvatar(this._figure,param1,this.var_983,this);
            if(_loc3_ != null)
            {
               if(param2 == 0)
               {
                  this.var_532.add(_loc4_,_loc3_);
               }
               else
               {
                  if(this.var_478.length >= const_1270)
                  {
                     this.var_478.remove(this.var_478.getKeys().shift());
                  }
                  this.var_478.add(_loc4_,_loc3_);
               }
            }
         }
         return _loc3_;
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean, param4:Boolean = false) : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param4 || var_461 != param1.getUpdateID() || this.var_1588 != param2.updateId)
         {
            _loc5_ = param3;
            _loc6_ = param1.getDirection().x - param2.direction.x;
            _loc6_ = (_loc6_ % 360 + 360) % 360;
            _loc7_ = this.var_1624;
            if(this.var_244 == "float")
            {
               _loc7_ = _loc6_;
            }
            else
            {
               _loc7_ -= param2.direction.x;
            }
            _loc7_ = (_loc7_ % 360 + 360) % 360;
            if(_loc6_ != this.var_1622 || param4)
            {
               _loc5_ = true;
               this.var_1622 = _loc6_;
               _loc6_ -= 112.5;
               _loc6_ = (_loc6_ + 360) % 360;
               this.var_59.setDirectionAngle(AvatarSetType.const_36,_loc6_);
            }
            if(_loc7_ != this.var_1625 || param4)
            {
               _loc5_ = true;
               this.var_1625 = _loc7_;
               if(this.var_1625 != this.var_1622)
               {
                  _loc7_ -= 112.5;
                  _loc7_ = (_loc7_ + 360) % 360;
                  this.var_59.setDirectionAngle(AvatarSetType.const_51,_loc7_);
               }
            }
            var_461 = param1.getUpdateID();
            this.var_1588 = param2.updateId;
            return _loc5_;
         }
         return false;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1764);
         this.var_579 = null;
         if(this.var_244 == "mv" || this.var_244 == "std")
         {
            _loc2_.visible = true;
            if(this.var_579 == null || param1 != var_101)
            {
               _loc3_ = 0;
               _loc4_ = 0;
               if(param1 < 48)
               {
                  this.var_579 = this.var_59.getAsset("sh_std_sd_1_0_0");
                  _loc3_ = -8;
                  _loc4_ = -3;
               }
               else
               {
                  this.var_579 = this.var_59.getAsset("h_std_sd_1_0_0");
                  _loc3_ = -17;
                  _loc4_ = -7;
               }
               if(this.var_579 != null)
               {
                  _loc2_.asset = this.var_579.content as BitmapData;
                  _loc2_.offsetX = _loc3_;
                  _loc2_.offsetY = _loc4_;
                  _loc2_.alpha = 50;
                  _loc2_.relativeDepth = 1;
               }
               else
               {
                  _loc2_.visible = false;
               }
            }
         }
         else
         {
            this.var_579 = null;
            _loc2_.visible = false;
         }
      }
      
      private function updateTypingBubble(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.var_867 = null;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1738);
         if(this.var_586)
         {
            _loc2_.visible = true;
            _loc5_ = 64;
            if(param1 < 48)
            {
               this.var_867 = this.var_578.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
               _loc3_ = 3;
               _loc4_ = -42;
               _loc5_ = 32;
            }
            else
            {
               this.var_867 = this.var_578.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
               _loc3_ = 14;
               _loc4_ = -83;
            }
            if(this.var_244 == "sit")
            {
               _loc4_ += _loc5_ / 2;
            }
            else if(this.var_244 == "lay")
            {
               _loc4_ += _loc5_;
            }
            if(this.var_867 != null)
            {
               _loc2_.asset = this.var_867.content as BitmapData;
               _loc2_.offsetX = _loc3_;
               _loc2_.offsetY = _loc4_;
               _loc2_.relativeDepth = -0.02;
            }
         }
         else
         {
            _loc2_.visible = false;
         }
      }
      
      private function updateNumberBubble(param1:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc3_:IRoomObjectSprite = getSprite(this.const_1739);
         if(this.var_1067 > 0)
         {
            _loc6_ = 64;
            if(param1 < 48)
            {
               _loc2_ = this.var_578.getAvatarRendererAsset("number_" + this.var_1067 + "_small_png") as BitmapDataAsset;
               _loc4_ = -6;
               _loc5_ = -52;
               _loc6_ = 32;
            }
            else
            {
               _loc2_ = this.var_578.getAvatarRendererAsset("number_" + this.var_1067 + "_png") as BitmapDataAsset;
               _loc4_ = -8;
               _loc5_ = -105;
            }
            if(this.var_244 == "sit")
            {
               _loc5_ += _loc6_ / 2;
            }
            else if(this.var_244 == "lay")
            {
               _loc5_ += _loc6_;
            }
            if(_loc2_ != null)
            {
               _loc3_.visible = true;
               _loc3_.asset = _loc2_.content as BitmapData;
               _loc3_.offsetX = _loc4_;
               _loc3_.offsetY = _loc5_;
               _loc3_.relativeDepth = -0.01;
               this.var_698 = 1;
               this.var_1628 = true;
               this.var_1068 = 0;
               _loc3_.alpha = 0;
            }
            else
            {
               _loc3_.visible = false;
            }
         }
         else if(_loc3_.visible)
         {
            this.var_698 = -1;
         }
      }
      
      private function animateNumberBubble(param1:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1739);
         var _loc3_:int = _loc2_.alpha;
         var _loc4_:Boolean = false;
         if(this.var_1628)
         {
            ++this.var_1068;
            if(this.var_1068 < 10)
            {
               return false;
            }
            if(this.var_698 < 0)
            {
               if(param1 < 48)
               {
                  _loc2_.offsetY -= 2;
               }
               else
               {
                  _loc2_.offsetY -= 4;
               }
            }
            else
            {
               _loc5_ = 4;
               if(param1 < 48)
               {
                  _loc5_ = 8;
               }
               if(this.var_1068 % _loc5_ == 0)
               {
                  --_loc2_.offsetY;
                  _loc4_ = true;
               }
            }
         }
         if(this.var_698 > 0)
         {
            if(_loc3_ < 255)
            {
               _loc3_ += 32;
            }
            if(_loc3_ >= 255)
            {
               _loc3_ = 255;
               this.var_698 = 0;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         if(this.var_698 < 0)
         {
            if(_loc3_ >= 0)
            {
               _loc3_ -= 32;
            }
            if(_loc3_ <= 0)
            {
               this.var_698 = 0;
               this.var_1628 = false;
               _loc3_ = 0;
               _loc2_.visible = false;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         return _loc4_;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean, param4:Boolean) : void
      {
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:int = 0;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:* = null;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:* = null;
         var _loc32_:* = null;
         var _loc5_:IRoomObject = object;
         if(_loc5_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(this.var_578 == null)
         {
            return;
         }
         var _loc6_:IRoomObjectModel = _loc5_.getModel();
         var _loc7_:Number = param1.scale;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:int = this.var_697;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = this.updateModel(_loc6_,_loc7_,param3);
         if(this.animateNumberBubble(_loc7_))
         {
            increaseUpdateId();
         }
         if(_loc13_ || _loc7_ != var_101 || this.var_59 == null)
         {
            if(_loc7_ != var_101)
            {
               _loc9_ = true;
               this.validateActions(_loc7_);
            }
            if(_loc11_ != this.var_697)
            {
               _loc12_ = true;
            }
            if(_loc9_ || this.var_59 == null || _loc12_)
            {
               this.var_59 = this.getAvatarImage(_loc7_,this.var_697);
               if(this.var_59 == null)
               {
                  return;
               }
               _loc8_ = true;
               _loc16_ = getSprite(this.const_926);
               if(_loc16_ && this.var_59 && this.var_59.isPlaceholder())
               {
                  _loc16_.alpha = 150;
               }
               else if(_loc16_)
               {
                  _loc16_.alpha = 255;
               }
            }
            if(this.var_59 == null)
            {
               return;
            }
            this.updateShadow(_loc7_);
            if(_loc9_)
            {
               this.updateTypingBubble(_loc7_);
               this.updateNumberBubble(_loc7_);
            }
            _loc10_ = this.updateObject(_loc5_,param1,param3,true);
            this.updateActions(this.var_59);
            var_101 = _loc7_;
         }
         else
         {
            _loc10_ = this.updateObject(_loc5_,param1,param3);
         }
         var _loc14_:Boolean = _loc10_ || _loc13_ || _loc9_;
         var _loc15_:Boolean = (this.var_883 || this.var_1219 > 0) && param3;
         if(_loc14_)
         {
            this.var_1219 = const_927;
         }
         if(_loc14_ || _loc15_)
         {
            increaseUpdateId();
            --this.var_1219;
            --this.var_1218;
            if(!(this.var_1218 <= 0 || _loc9_ || _loc13_ || _loc8_))
            {
               return;
            }
            this.var_59.updateAnimationByFrames(1);
            this.var_1218 = const_927;
            _loc18_ = this.var_59.getCanvasOffsets();
            if(_loc18_ == null || _loc18_.length < 3)
            {
               _loc18_ = const_1269;
            }
            _loc17_ = getSprite(this.const_926);
            if(_loc17_ != null)
            {
               _loc21_ = this.var_59.getImage(AvatarSetType.const_36,false);
               if(_loc21_ != null)
               {
                  _loc17_.asset = _loc21_;
               }
               if(_loc17_.asset)
               {
                  _loc17_.offsetX = -1 * _loc7_ / 2 + _loc18_[0];
                  _loc17_.offsetY = -_loc17_.asset.height + _loc7_ / 4 + _loc18_[1] + this.var_1335;
               }
               if(this.var_1069)
               {
                  if(this.var_1629)
                  {
                     _loc17_.relativeDepth = -0.5;
                  }
                  else
                  {
                     _loc17_.relativeDepth = const_593 + _loc18_[2];
                  }
               }
               else
               {
                  _loc17_.relativeDepth = const_592 + _loc18_[2];
               }
            }
            _loc17_ = getSprite(this.const_1738);
            if(_loc17_ != null && _loc17_.visible)
            {
               if(!this.var_1069)
               {
                  _loc17_.relativeDepth = const_592 - 0.01 + _loc18_[2];
               }
               else
               {
                  _loc17_.relativeDepth = const_593 - 0.01 + _loc18_[2];
               }
            }
            this.var_883 = this.var_59.isAnimating();
            _loc19_ = this.const_1268;
            for each(_loc20_ in this.var_59.getSprites())
            {
               if(_loc20_.id == const_925)
               {
                  _loc17_ = getSprite(this.const_926);
                  _loc22_ = this.var_59.getLayerData(_loc20_);
                  _loc23_ = _loc20_.getDirectionOffsetX(this.var_59.getDirection());
                  _loc24_ = _loc20_.getDirectionOffsetY(this.var_59.getDirection());
                  if(_loc22_ != null)
                  {
                     _loc23_ += _loc22_.dx;
                     _loc24_ += _loc22_.dy;
                  }
                  if(_loc7_ < 48)
                  {
                     _loc23_ /= 2;
                     _loc24_ /= 2;
                  }
                  _loc17_.offsetX += _loc23_;
                  _loc17_.offsetY += _loc24_;
               }
               else
               {
                  _loc17_ = getSprite(_loc19_);
                  if(_loc17_ != null)
                  {
                     _loc17_.capturesMouse = false;
                     _loc17_.visible = true;
                     _loc25_ = this.var_59.getLayerData(_loc20_);
                     _loc26_ = 0;
                     _loc27_ = _loc20_.getDirectionOffsetX(this.var_59.getDirection());
                     _loc28_ = _loc20_.getDirectionOffsetY(this.var_59.getDirection());
                     _loc29_ = _loc20_.getDirectionOffsetZ(this.var_59.getDirection());
                     _loc30_ = 0;
                     if(_loc20_.hasDirections)
                     {
                        _loc30_ = this.var_59.getDirection();
                     }
                     if(_loc25_ != null)
                     {
                        _loc26_ = _loc25_.animationFrame;
                        _loc27_ += _loc25_.dx;
                        _loc28_ += _loc25_.dy;
                        _loc30_ += _loc25_.directionOffset;
                     }
                     if(_loc7_ < 48)
                     {
                        _loc27_ /= 2;
                        _loc28_ /= 2;
                     }
                     if(_loc30_ < 0)
                     {
                        _loc30_ += 8;
                     }
                     else if(_loc30_ > 7)
                     {
                        _loc30_ -= 8;
                     }
                     _loc31_ = this.var_59.getScale() + "_" + _loc20_.member + "_" + _loc30_ + "_" + _loc26_;
                     _loc32_ = this.var_59.getAsset(_loc31_);
                     if(_loc32_ == null)
                     {
                        continue;
                     }
                     _loc17_.asset = _loc32_.content as BitmapData;
                     _loc17_.offsetX = -_loc32_.offset.x - _loc7_ / 2 + _loc27_;
                     _loc17_.offsetY = -_loc32_.offset.y + _loc28_ + this.var_1335;
                     if(this.var_1069)
                     {
                        _loc17_.relativeDepth = const_593 - 0.001 * spriteCount * _loc29_;
                     }
                     else
                     {
                        _loc17_.relativeDepth = const_592 - 0.001 * spriteCount * _loc29_;
                     }
                     if(_loc20_.ink == 33)
                     {
                        _loc17_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc17_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc19_++;
               }
            }
         }
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_341,this.var_244,this._postureParameter);
         if(this.var_1334 > 0)
         {
            param1.appendAction(AvatarAction.const_322,AvatarAction.const_1547[this.var_1334]);
         }
         if(this.var_1336 > 0)
         {
            param1.appendAction(AvatarAction.const_753,this.var_1336);
         }
         if(this.var_2193 > 0)
         {
            param1.appendAction(AvatarAction.const_770,this.var_2193);
         }
         if(this.var_699 > 0)
         {
            param1.appendAction(AvatarAction.const_814,this.var_699);
         }
         if(this.var_580 > 0)
         {
            param1.appendAction(AvatarAction.const_651,this.var_580);
         }
         if(this.var_1626)
         {
            param1.appendAction(AvatarAction.const_323);
         }
         if(this.var_1627 || this.var_1333)
         {
            param1.appendAction(AvatarAction.const_521);
         }
         if(this.var_1623)
         {
            param1.appendAction(AvatarAction.const_228);
         }
         if(this.var_697 > 0)
         {
            param1.appendAction(AvatarAction.const_302,this.var_697);
         }
         param1.endActionAppends();
         this.var_883 = param1.isAnimating();
         var _loc2_:int = this.const_1268;
         for each(_loc3_ in this.var_59.getSprites())
         {
            if(_loc3_.id != const_925)
            {
               _loc2_++;
            }
         }
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         this.resetImages();
      }
   }
}
