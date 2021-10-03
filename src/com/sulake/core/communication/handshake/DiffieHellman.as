package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_863:BigInteger;
      
      private var var_2552:BigInteger;
      
      private var var_1832:BigInteger;
      
      private var var_2563:BigInteger;
      
      private var var_1451:BigInteger;
      
      private var var_1831:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1451 = param1;
         this.var_1831 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1451.toString() + ",generator: " + this.var_1831.toString() + ",secret: " + param1);
         this.var_863 = new BigInteger();
         this.var_863.fromRadix(param1,param2);
         this.var_2552 = this.var_1831.modPow(this.var_863,this.var_1451);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1832 = new BigInteger();
         this.var_1832.fromRadix(param1,param2);
         this.var_2563 = this.var_1832.modPow(this.var_863,this.var_1451);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2552.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2563.toRadix(param1);
      }
   }
}
