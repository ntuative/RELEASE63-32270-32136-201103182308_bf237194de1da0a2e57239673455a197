package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1194:Boolean;
      
      private var var_1193:Boolean;
      
      private var var_1460:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1194;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1193;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1460;
      }
      
      public function flush() : Boolean
      {
         this.var_1194 = false;
         this.var_1193 = false;
         this.var_1460 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1194 = param1.readBoolean();
         this.var_1193 = param1.readBoolean();
         this.var_1460 = param1.readBoolean();
         return true;
      }
   }
}
