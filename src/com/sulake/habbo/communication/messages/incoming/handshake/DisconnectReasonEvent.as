package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1833:int = 0;
      
      public static const const_1629:int = 1;
      
      public static const const_1490:int = 2;
      
      public static const const_1985:int = 3;
      
      public static const const_1811:int = 4;
      
      public static const const_1920:int = 5;
      
      public static const const_1698:int = 10;
      
      public static const const_1887:int = 11;
      
      public static const const_1883:int = 12;
      
      public static const const_1946:int = 13;
      
      public static const const_1813:int = 16;
      
      public static const const_1922:int = 17;
      
      public static const const_1932:int = 18;
      
      public static const const_1816:int = 19;
      
      public static const const_1810:int = 20;
      
      public static const const_1958:int = 22;
      
      public static const const_1913:int = 23;
      
      public static const const_1834:int = 24;
      
      public static const const_1867:int = 25;
      
      public static const const_1856:int = 26;
      
      public static const const_1844:int = 27;
      
      public static const const_1862:int = 28;
      
      public static const const_1797:int = 29;
      
      public static const const_1993:int = 100;
      
      public static const const_1879:int = 101;
      
      public static const const_1837:int = 102;
      
      public static const const_1923:int = 103;
      
      public static const const_1853:int = 104;
      
      public static const const_1929:int = 105;
      
      public static const const_1998:int = 106;
      
      public static const const_1849:int = 107;
      
      public static const const_1965:int = 108;
      
      public static const const_1988:int = 109;
      
      public static const const_1850:int = 110;
      
      public static const const_1815:int = 111;
      
      public static const const_1873:int = 112;
      
      public static const const_1931:int = 113;
      
      public static const const_1997:int = 114;
      
      public static const const_1911:int = 115;
      
      public static const const_1831:int = 116;
      
      public static const const_1999:int = 117;
      
      public static const const_1951:int = 118;
      
      public static const const_1888:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1629:
            case const_1698:
               return "banned";
            case const_1490:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
