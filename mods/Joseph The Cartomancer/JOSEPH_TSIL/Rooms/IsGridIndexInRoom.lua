local GridInRoomShape = {
	[RoomShape.ROOMSHAPE_IH] = function (gridIndex)
		return gridIndex >= 30 and gridIndex <= 104
	end,

	[RoomShape.ROOMSHAPE_IV] = function (gridIndex)
		return gridIndex % 15 >= 4 and gridIndex % 15 <= 11
	end,

	[RoomShape.ROOMSHAPE_IIH] = function (gridIndex)
		return gridIndex >= 56 and gridIndex <= 195
	end,

	[RoomShape.ROOMSHAPE_IIV] = function (gridIndex)
		return gridIndex % 15 >= 4 and gridIndex % 15 <= 11
	end,

	[RoomShape.ROOMSHAPE_LTL] = function (gridIndex)
		if gridIndex < 224 then
			return gridIndex % 28 >= 13
		else
			return true
		end
	end,

	[RoomShape.ROOMSHAPE_LTR] = function (gridIndex)
		if gridIndex < 224 then
			return gridIndex % 28 <= 14
		else
			return true
		end
	end,

	[RoomShape.ROOMSHAPE_LBL] = function (gridIndex)
		if gridIndex > 251 then
			return gridIndex % 27 >= 13
		else
			return true
		end
	end,

	[RoomShape.ROOMSHAPE_LBR] = function (gridIndex)
		if gridIndex > 251 then
			return gridIndex % 27 <= 14
		else
			return true
		end
	end
}


function TSIL.Rooms.IsGridIndexInRoomShape(gridIndex, roomShape)
	local IsInRoom = GridInRoomShape[roomShape]

	return not IsInRoom or IsInRoom(gridIndex)
end

