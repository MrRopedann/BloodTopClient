--------------------------------------------------------------------------
--									--
--									--
--mission.lua Created by Robin 2004.12.27.	--
--									--
--									--
--------------------------------------------------------------------------
print( "loading mission.lua" )

--lua函数返回值定义
LUA_FALSE					= 0
LUA_TRUE					= 1

MIS_TREENODE_INVALID	= 0	-- 无效类型
MIS_TREENODE_NOMAL		= 1	-- 普通任务
MIS_TREENODE_HISTORY	= 2	-- 历史任务
MIS_TREENODE_GUILD		= 3	-- 工会任务
		
MisData = {}

function AddMisData( id, name, tp )
	if id == nil or name == nil or tp == nil then
		print( "AddMisData: Function parameter error! Id = , Name = , tp = ", id, name, tp )
		return
	end
	
	if MisData[id] ~= nil then
		print( "AddMisData: Original quest ID overlayed when setting new quest date! Original data id = , name = , tp = , new data id = , name = , tp = ", id, MisData[id].name, MisData[id].tp, id, name, tp )
	end
	
	MisData[id] = {}
	MisData[id].name = name
	MisData[id].tp = tp
	
	print( "Set Quest: ["..name..">> ID["..id.."] Type["..tp.."]" )
end

function GetMisData( id )
	if id == nil then
		print( "GetMisData: Obtained quest details, parameter error! id = nil" )
		return LUA_FALSE
	end
	
	if MisData[id] == nil or MisData[id].name == nil or MisData[id].tp == nil then
		print( "GetMisData: Obtain quest notice failed! Have not found target quest data notice. ID = "..id )
		return LUA_FALSE
	end
	
	return LUA_TRUE, MisData[id].tp, MisData[id].name
end

AddMisData( 100, "\205\224\231\226\224\237\232\229 \232\241\239\251\242\224\237\232\255", MIS_TREENODE_NOMAL )