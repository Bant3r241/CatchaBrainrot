local lg = love.graphics

local gui = {
    width = 600,
    height = 400,
    tabs = {
        {name = "Discord Tab", icon = "D"},
        {name = "Brainrot Management", icon = "B"},
        {name = "Player Management", icon = "P"},
        {name = "Player Tab", icon = "P"}
    },
    toggles = {
        {name = "Aimbot with Webslinger", state = false},
        {name = "Anti Traps", state = false},
        {name = "Speed Boost req.", state = false}
    },
    activeTab = 1
}

function love.load()
    love.window.setMode(gui.width, gui.height, {resizable=false})
    love.window.setTitle("Pulsar X / Steal A Brainrot")
end

function love.draw()
    -- Draw background (simulating the textured surface)
    lg.setColor(0.8, 0.8, 0.75)
    lg.rectangle("fill", 0, 0, gui.width, gui.height)
    
    -- Draw main window
    lg.setColor(0.15, 0.15, 0.15)
    lg.rectangle("fill", 20, 20, gui.width - 40, gui.height - 40, 5)
    
    -- Draw title bar
    lg.setColor(0.1, 0.1, 0.1)
    lg.rectangle("fill", 20, 20, gui.width - 40, 30, 5, 5, 0, 0)
    
    -- Draw window controls
    lg.setColor(0.7, 0.7, 0.7)
    lg.print("X", gui.width - 40, 25)
    lg.print("□", gui.width - 60, 25)
    lg.print("_", gui.width - 80, 25)
    
    -- Draw title
    lg.setColor(1, 1, 1)
    lg.print("Pulsar X / Steal A Brainrot", 30, 25)
    
    -- Draw tab area
    lg.setColor(0.2, 0.2, 0.2)
    lg.rectangle("fill", 30, 60, 180, gui.height - 90)
    
    -- Draw tabs
    for i, tab in ipairs(gui.tabs) do
        if i == gui.activeTab then
            lg.setColor(0.3, 0.3, 0.3)
            lg.rectangle("fill", 30, 60 + (i-1)*50, 180, 50)
        end
        
        lg.setColor(1, 1, 1)
        lg.print(tab.icon, 40, 75 + (i-1)*50)
        lg.print(tab.name, 70, 75 + (i-1)*50)
    end
    
    -- Draw toggle area
    lg.setColor(0.25, 0.25, 0.25)
    lg.rectangle("fill", 230, 60, gui.width - 270, gui.height - 90)
    
    -- Draw toggles
    for i, toggle in ipairs(gui.toggles) do
        lg.setColor(1, 1, 1)
        lg.print(toggle.name, 250, 80 + (i-1)*40)
        
        -- Toggle switch
        lg.setColor(0.4, 0.4, 0.4)
        lg.rectangle("fill", gui.width - 100, 75 + (i-1)*40, 60, 25, 12)
        
        if toggle.state then
            lg.setColor(0, 0.8, 0)
            lg.rectangle("fill", gui.width - 85, 78 + (i-1)*40, 30, 19, 10)
        else
            lg.setColor(0.8, 0, 0)
            lg.rectangle("fill", gui.width - 100, 78 + (i-1)*40, 30, 19, 10)
        end
    end
end

function love.mousepressed(x, y, button)
    if button == 1 then
        -- Check tab clicks
        for i, tab in ipairs(gui.tabs) do
            if x >= 30 and x <= 210 and y >= 60 + (i-1)*50 and y <= 110 + (i-1)*50 then
                gui.activeTab = i
            end
        end
        
        -- Check toggle clicks
        for i, toggle in ipairs(gui.toggles) do
            if x >= gui.width - 100 and x <= gui.width - 40 and y >= 75 + (i-1)*40 and y <= 100 + (i-1)*40 then
                toggle.state = not toggle.state
            end
        end
        
        -- Check window controls
        if x >= gui.width - 80 and x <= gui.width - 70 and y >= 25 and y <= 45 then
            -- Minimize (not functional in this example)
        elseif x >= gui.width - 60 and x <= gui.width - 50 and y >= 25 and y <= 45 then
            -- Maximize (not functional in this example)
        elseif x >= gui.width - 40 and x <= gui.width - 30 and y >= 25 and y <= 45 then
            love.event.quit()
        end
    end
end
