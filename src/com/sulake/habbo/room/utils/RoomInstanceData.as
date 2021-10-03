package com.sulake.habbo.room.utils
{
   import com.sulake.core.utils.Map;
   
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_731:TileHeightMap = null;
      
      private var var_1124:LegacyWallGeometry = null;
      
      private var var_1125:RoomCamera = null;
      
      private var var_730:SelectedRoomObjectData = null;
      
      private var var_729:SelectedRoomObjectData = null;
      
      private var _worldType:String = null;
      
      private var var_496:Map;
      
      private var var_497:Map;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         this.var_496 = new Map();
         this.var_497 = new Map();
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1124 = new LegacyWallGeometry();
         this.var_1125 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_731;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_731 != null)
         {
            this.var_731.dispose();
         }
         this.var_731 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1124;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1125;
      }
      
      public function get worldType() : String
      {
         return this._worldType;
      }
      
      public function set worldType(param1:String) : void
      {
         this._worldType = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_730;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_730 != null)
         {
            this.var_730.dispose();
         }
         this.var_730 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_729;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_729 != null)
         {
            this.var_729.dispose();
         }
         this.var_729 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_731 != null)
         {
            this.var_731.dispose();
            this.var_731 = null;
         }
         if(this.var_1124 != null)
         {
            this.var_1124.dispose();
            this.var_1124 = null;
         }
         if(this.var_1125 != null)
         {
            this.var_1125.dispose();
            this.var_1125 = null;
         }
         if(this.var_730 != null)
         {
            this.var_730.dispose();
            this.var_730 = null;
         }
         if(this.var_729 != null)
         {
            this.var_729.dispose();
            this.var_729 = null;
         }
         if(this.var_496 != null)
         {
            this.var_496.dispose();
            this.var_496 = null;
         }
         if(this.var_497 != null)
         {
            this.var_497.dispose();
            this.var_497 = null;
         }
      }
      
      public function addFurnitureData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_496.remove(param1.id);
            this.var_496.add(param1.id,param1);
         }
      }
      
      public function getFurnitureData() : FurnitureData
      {
         if(this.var_496.length > 0)
         {
            return this.getFurnitureDataWithId(this.var_496.getKey(0));
         }
         return null;
      }
      
      public function getFurnitureDataWithId(param1:int) : FurnitureData
      {
         return this.var_496.remove(param1);
      }
      
      public function addWallItemData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_497.remove(param1.id);
            this.var_497.add(param1.id,param1);
         }
      }
      
      public function getWallItemData() : FurnitureData
      {
         if(this.var_497.length > 0)
         {
            return this.getWallItemDataWithId(this.var_497.getKey(0));
         }
         return null;
      }
      
      public function getWallItemDataWithId(param1:int) : FurnitureData
      {
         return this.var_497.remove(param1);
      }
   }
}
