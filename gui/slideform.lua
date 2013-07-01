----------------------------------------------------------------
-- Copyright (c) 2013, Bacioiu "Zapa" Ciprian
-- All Rights Reserved. 
-- Slide Form element for Derick Dong's GUI Framework for MOAI
----------------------------------------------------------------
--[[
DESCRIPTION HERE ONCE DONE
]]

local _M = {}

require "gui/support/class"

local awindow = require "gui/awindow"
local text = require "gui/text"
local label = require "gui/label"
local awidgetevent = require "gui/awidgetevent"

_M.SlideForm = class(awindow.AWindow)

local SCROLL_BAR_WIDTH = 5

function _M.SlideForm:init(gui)
	awindow.AWindow.init(self, gui)

	self._type = "SlideForm"

	self._posX = 0
	self._posY = 0
	self._entryPoint = { x = 0, y = 0}

	self._SlideFormEvents()

	self._BACKGROUND_INDEX = self._WIDGET_SPECIFIC_OBJECTS_INDEX
	self.BACKGROUND_IMAGES = self._WIDGET_SPECIFIC_IMAGES

	self._fullText = ""
	self._lineHeight = 0
	self._lines = {}
	-- self._maxLines = 20

	self._scrollBar = gui:createVertScrollBar()
	self:_addWidgetChild(self._scrollBar)
	self._scrollBar:registerEventHandler(self._scrollBar.EVENT_SCROLL_BAR_POS_CHANGED, self, "_handleScrollPosChange")



end

function _M.SlideForm:Draw( )
	print("DRAW IT MOFO!")
end



function _M.SlideForm:setBackgroundImage(image, r, g, b, a, idx, blendSrc, blendDst)
	self:_setImage(self._rootProp, self._BACKGROUND_INDEX, self.BACKGROUND_IMAGES, image, r, g, b, a, idx, blendSrc, blendDst)
	self:_setCurrImages(self._TEXT_BOX_INDEX, self.BACKGROUND_IMAGES)

end

function _M.SlideForm:getBackgroundImage()
	return self._imageList:getImage(self._BACKGROUND_INDEX, self.BACKGROUND_IMAGES)
end

return _M