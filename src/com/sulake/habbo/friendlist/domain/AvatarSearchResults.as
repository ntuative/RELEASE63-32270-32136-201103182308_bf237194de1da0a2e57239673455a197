package com.sulake.habbo.friendlist.domain
{
   import com.sulake.habbo.communication.messages.incoming.friendlist.HabboSearchResultData;
   import flash.utils.Dictionary;
   
   public class AvatarSearchResults
   {
       
      
      private var var_423:IAvatarSearchDeps;
      
      private var var_221:Array;
      
      private var var_1825:Array;
      
      private var var_1991:Dictionary;
      
      public function AvatarSearchResults(param1:IAvatarSearchDeps)
      {
         this.var_1991 = new Dictionary();
         super();
         this.var_423 = param1;
      }
      
      public function getResult(param1:int) : HabboSearchResultData
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         for each(_loc2_ in this.var_221)
         {
            if(_loc2_.avatarId == param1)
            {
               return _loc2_;
            }
         }
         for each(_loc3_ in this.var_1825)
         {
            if(_loc3_.avatarId == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function searchReceived(param1:Array, param2:Array) : void
      {
         this.var_221 = param1;
         this.var_1825 = param2;
         this.var_423.view.refreshList();
      }
      
      public function get friends() : Array
      {
         return this.var_221;
      }
      
      public function get others() : Array
      {
         return this.var_1825;
      }
      
      public function setFriendRequestSent(param1:int) : void
      {
         this.var_1991[param1] = "yes";
      }
      
      public function isFriendRequestSent(param1:int) : Boolean
      {
         return this.var_1991[param1] != null;
      }
   }
}
