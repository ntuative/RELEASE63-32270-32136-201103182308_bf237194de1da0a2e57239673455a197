package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenPetPackageMessageComposer implements IMessageComposer
   {
       
      
      private var var_386:int;
      
      private var var_2184:String;
      
      public function OpenPetPackageMessageComposer(param1:int, param2:String)
      {
         super();
         this.var_386 = param1;
         this.var_2184 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_386,this.var_2184];
      }
      
      public function dispose() : void
      {
      }
   }
}
