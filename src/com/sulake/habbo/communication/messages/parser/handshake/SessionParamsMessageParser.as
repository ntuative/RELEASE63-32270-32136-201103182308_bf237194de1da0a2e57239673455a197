package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class SessionParamsMessageParser implements IMessageParser
   {
       
      
      protected var var_2069:Boolean;
      
      protected var var_2073:Boolean;
      
      protected var var_2110:String;
      
      protected var var_2070:Boolean;
      
      protected var var_2072:Boolean;
      
      protected var var_2071:Boolean;
      
      protected var _confPartnerIntegration:Boolean;
      
      protected var var_2831:Boolean;
      
      protected var var_2832:String;
      
      protected var var_2833:Boolean;
      
      public function SessionParamsMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_2069 = false;
         this.var_2073 = false;
         this.var_2110 = "";
         this.var_2070 = false;
         this.var_2072 = false;
         this.var_2071 = false;
         this._confPartnerIntegration = false;
         this.var_2831 = false;
         this.var_2832 = "";
         this.var_2833 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:int = param1.readInteger();
         Logger.log("[Parser.SessionParams] Got " + _loc2_ + " pairs");
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInteger();
            Logger.log("[Parser.SessionParams] Got id: " + _loc4_);
            switch(_loc4_)
            {
               case 0:
                  _loc5_ = param1.readInteger();
                  this.var_2069 = _loc5_ > 0;
                  break;
               case 1:
                  _loc5_ = param1.readInteger();
                  this.var_2073 = _loc5_ > 0;
                  break;
               case 2:
                  _loc5_ = param1.readInteger();
                  this.var_2070 = _loc5_ > 0;
                  break;
               case 3:
                  _loc5_ = param1.readInteger();
                  this.var_2072 = _loc5_ > 0;
                  break;
               case 4:
                  _loc5_ = param1.readInteger();
                  this.var_2071 = _loc5_ > 0;
                  break;
               case 5:
                  _loc6_ = param1.readString();
                  break;
               case 6:
                  _loc5_ = param1.readInteger();
                  break;
               case 7:
                  _loc5_ = param1.readInteger();
                  break;
               case 8:
                  _loc7_ = param1.readString();
                  break;
               case 9:
                  _loc5_ = param1.readInteger();
                  break;
               default:
                  Logger.log("Unknown id: " + _loc4_);
                  break;
            }
            _loc3_++;
         }
         return true;
      }
      
      public function get coppa() : Boolean
      {
         return this.var_2069;
      }
      
      public function get voucher() : Boolean
      {
         return this.var_2073;
      }
      
      public function get parentEmailRequired() : Boolean
      {
         return this.var_2070;
      }
      
      public function get parentEmailRequiredInReRegistration() : Boolean
      {
         return this.var_2072;
      }
      
      public function get allowDirectEmail() : Boolean
      {
         return this.var_2071;
      }
      
      public function get date() : String
      {
         return this.var_2110;
      }
      
      public function get confPartnerIntegration() : Boolean
      {
         return this._confPartnerIntegration;
      }
      
      public function get allowProfileEditing() : Boolean
      {
         return this.var_2831;
      }
      
      public function get tracking_header() : String
      {
         return this.var_2832;
      }
      
      public function get tutorialEnabled() : Boolean
      {
         return this.var_2833;
      }
   }
}
