package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1680:int;
      
      private var _name:String;
      
      private var var_1495:int;
      
      private var var_2275:int;
      
      private var var_2270:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var _figure:String;
      
      private var var_2272:int;
      
      private var var_2273:int;
      
      private var var_2276:int;
      
      private var var_2274:int;
      
      private var var_2271:int;
      
      private var _ownerName:String;
      
      private var var_534:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1680;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1495;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2275;
      }
      
      public function get experience() : int
      {
         return this.var_2270;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2272;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2273;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2276;
      }
      
      public function get respect() : int
      {
         return this.var_2274;
      }
      
      public function get ownerId() : int
      {
         return this.var_2271;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_534;
      }
      
      public function flush() : Boolean
      {
         this.var_1680 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1680 = param1.readInteger();
         this._name = param1.readString();
         this.var_1495 = param1.readInteger();
         this.var_2275 = param1.readInteger();
         this.var_2270 = param1.readInteger();
         this.var_2272 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2273 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2276 = param1.readInteger();
         this._figure = param1.readString();
         this.var_2274 = param1.readInteger();
         this.var_2271 = param1.readInteger();
         this.var_534 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
