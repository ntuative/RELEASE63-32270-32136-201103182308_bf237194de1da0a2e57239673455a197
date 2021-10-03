package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_349:int = 1;
      
      public static const const_224:int = 2;
      
      public static const const_281:int = 3;
      
      public static const const_396:int = 4;
      
      public static const const_272:int = 5;
      
      public static const const_408:int = 1;
      
      public static const const_713:int = 2;
      
      public static const const_873:int = 3;
      
      public static const const_717:int = 4;
      
      public static const const_221:int = 5;
      
      public static const const_697:int = 6;
      
      public static const const_839:int = 7;
      
      public static const const_222:int = 8;
      
      public static const const_388:int = 9;
      
      public static const const_1935:int = 10;
      
      public static const const_730:int = 11;
      
      public static const const_437:int = 12;
       
      
      private var var_456:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_456 = new Array();
         this.var_456.push(new Tab(this._navigator,const_349,const_437,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_526));
         this.var_456.push(new Tab(this._navigator,const_224,const_408,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_526));
         this.var_456.push(new Tab(this._navigator,const_396,const_730,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1229));
         this.var_456.push(new Tab(this._navigator,const_281,const_221,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_526));
         this.var_456.push(new Tab(this._navigator,const_272,const_222,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_688));
         this.setSelectedTab(const_349);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_396;
      }
      
      public function get tabs() : Array
      {
         return this.var_456;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_456)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_456)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_456)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
