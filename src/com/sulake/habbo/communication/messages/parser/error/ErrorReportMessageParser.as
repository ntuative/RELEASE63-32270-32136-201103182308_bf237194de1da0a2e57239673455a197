package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1664:int;
      
      private var var_1740:int;
      
      private var var_1741:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1740 = param1.readInteger();
         this.var_1664 = param1.readInteger();
         this.var_1741 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1664 = 0;
         this.var_1740 = 0;
         this.var_1741 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1664;
      }
      
      public function get messageId() : int
      {
         return this.var_1740;
      }
      
      public function get timestamp() : String
      {
         return this.var_1741;
      }
   }
}
