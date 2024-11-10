
local G2L = {}

-- StarterGui.Arduino
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
G2L["1"]["Name"] = [[Arduino]]
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
G2L["1"]["Enabled"] = false

-- StarterGui.Arduino.Root
G2L["2"] = Instance.new("Frame", G2L["1"])
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(29, 29, 29)
G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["2"]["Size"] = UDim2.new(0, 200, 0, 35)
G2L["2"]["Position"] = UDim2.new(0.5, 0, 0.8, 0)
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
G2L["2"]["Name"] = [[Root]]

-- StarterGui.Arduino.Root.TextArea
G2L["3"] = Instance.new("Frame", G2L["2"])
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21)
G2L["3"]["Size"] = UDim2.new(1.02, -16, 1.58571, -33)
G2L["3"]["Position"] = UDim2.new(0, 6, 0, 6)
G2L["3"]["BorderColor3"] = Color3.fromRGB(51, 51, 51)
G2L["3"]["Name"] = [[TextArea]]

-- StarterGui.Arduino.Root.TextArea.Title
G2L["4"] = Instance.new("TextBox", G2L["3"])
G2L["4"]["TextXAlignment"] = Enum.TextXAlignment.Left
G2L["4"]["TextSize"] = 12
G2L["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["4"]["TextColor3"] = Color3.fromRGB(131, 131, 131)
G2L["4"]["BackgroundTransparency"] = 1
G2L["4"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["4"]["Size"] = UDim2.new(1.08511, -16, 2.46667, -33)
G2L["4"]["Text"] = [[Enter Command...]]
G2L["4"]["Name"] = [[TypeArea]]
G2L["4"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)

-- StarterGui.Arduino.Root.TextArea.Title.UIStroke
G2L["5"] = Instance.new("UIStroke", G2L["4"])
G2L["5"]["LineJoinMode"] = Enum.LineJoinMode.Miter

-- StarterGui.Arduino.Root.TextArea.Title.UIPadding
G2L["6"] = Instance.new("UIPadding", G2L["4"])
G2L["6"]["PaddingLeft"] = UDim.new(0, 7)

-- StarterGui.Arduino.Matches
G2L["7"] = Instance.new("Frame", G2L["1"])
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(29, 29, 29)
G2L["7"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["7"]["Size"] = UDim2.new(0, 200, 0, 197)
G2L["7"]["Position"] = UDim2.new(0.5, 0, 0.90554, 0)
G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
G2L["7"]["Name"] = [[Matches]]

-- StarterGui.Arduino.Matches.ScrollingFrame
G2L["8"] = Instance.new("ScrollingFrame", G2L["7"])
G2L["8"]["Active"] = true
G2L["8"]["ScrollingDirection"] = Enum.ScrollingDirection.Y
G2L["8"]["CanvasSize"] = UDim2.new(0, 0, 0, 0)
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21)
G2L["8"]["VerticalScrollBarPosition"] = Enum.VerticalScrollBarPosition.Left
G2L["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["8"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
G2L["8"]["Size"] = UDim2.new(1.02, -16, 1.098, -33)
G2L["8"]["ScrollBarImageColor3"] = Color3.fromRGB(28, 43, 54)
G2L["8"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)
G2L["8"]["BorderColor3"] = Color3.fromRGB(51, 51, 51)
G2L["8"]["ScrollBarThickness"] = 1

-- StarterGui.Arduino.Matches.ScrollingFrame.UIListLayout
G2L["9"] = Instance.new("UIListLayout", G2L["8"])
G2L["9"]["Padding"] = UDim.new(0, 5)
G2L["9"]["SortOrder"] = Enum.SortOrder.LayoutOrder

-- StarterGui.Arduino.Matches.ScrollingFrame.UIPadding
G2L["a"] = Instance.new("UIPadding", G2L["8"])
G2L["a"]["PaddingTop"] = UDim.new(0, 8)
G2L["a"]["PaddingLeft"] = UDim.new(0, 8)
G2L["a"]["PaddingBottom"] = UDim.new(0, 10)

local UserInputService = game:GetService("UserInputService")

local isPlaceholderText = true

local function resetTextArea()
    G2L["4"].Text = "Enter Command..."
    G2L["4"].TextColor3 = Color3.fromRGB(128, 128, 128) -- Grey color for placeholder text
    isPlaceholderText = true
end

local commands = {}

function addCmd(cmd)
    table.insert(commands, cmd)

    local matchLabel = Instance.new("TextButton", G2L["8"])
    matchLabel["TextXAlignment"] = Enum.TextXAlignment.Left
    matchLabel["BackgroundColor3"] = Color3.fromRGB(29, 29, 29)
    matchLabel["TextSize"] = 11
    matchLabel["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    matchLabel["TextColor3"] = Color3.fromRGB(255, 255, 255)
    matchLabel["AnchorPoint"] = Vector2.new(0.5, 0.5)
    matchLabel["Size"] = UDim2.new(1.0534, -16, 0.28788, -33)
    matchLabel["BorderColor3"] = Color3.fromRGB(54, 54, 54)
    matchLabel["Text"] = tostring(cmd)
    matchLabel["Name"] = tostring(cmd)
    matchLabel["Position"] = UDim2.new(0.48298, 0, 0.0514, 0)

    local matchLabelUIStroke = Instance.new("UIStroke", matchLabel)
    matchLabelUIStroke["LineJoinMode"] = Enum.LineJoinMode.Miter

    local matchLabelUIPadding = Instance.new("UIPadding", matchLabel)
    matchLabelUIPadding["PaddingLeft"] = UDim.new(0, 3)

    matchLabel.MouseButton1Click:Connect(function()
        onMatchClick(cmd)
        G2L["4"]:CaptureFocus() -- Refocus the text input
    end)
end

function findMatches(input)
    local matches = {}
    for _, cmd in ipairs(commands) do
        if string.find(cmd, input) then
            table.insert(matches, cmd)
        end
    end
    return matches
end

function displayMatches(matches)
    -- Clear previous matches
    for _, child in ipairs(G2L["8"]:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end

    -- Display new matches
    for _, match in ipairs(matches) do
        local matchLabel = Instance.new("TextButton", G2L["8"])
        matchLabel["TextXAlignment"] = Enum.TextXAlignment.Left
        matchLabel["BackgroundColor3"] = Color3.fromRGB(29, 29, 29)
        matchLabel["TextSize"] = 11
        matchLabel["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        matchLabel["TextColor3"] = Color3.fromRGB(255, 255, 255)
        matchLabel["AnchorPoint"] = Vector2.new(0.5, 0.5)
        matchLabel["Size"] = UDim2.new(1.0534, -16, 0.28788, -33)
        matchLabel["BorderColor3"] = Color3.fromRGB(54, 54, 54)
        matchLabel["Text"] = tostring(match)
        matchLabel["Name"] = tostring(match)
        matchLabel["Position"] = UDim2.new(0.48298, 0, 0.0514, 0)

        local matchLabelUIStroke = Instance.new("UIStroke", matchLabel)
        matchLabelUIStroke["LineJoinMode"] = Enum.LineJoinMode.Miter

        local matchLabelUIPadding = Instance.new("UIPadding", matchLabel)
        matchLabelUIPadding["PaddingLeft"] = UDim.new(0, 3)

        matchLabel.MouseButton1Click:Connect(function()
            onMatchClick(match)
            G2L["4"]:CaptureFocus() -- Refocus the text input
        end)
    end
end

function onMatchClick(match)
    -- Code to handle match click and fill the typing area
    G2L["4"].Text = match
end

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end
    if input.KeyCode == Enum.KeyCode.Semicolon then
        G2L["1"].Enabled = not G2L["1"].Enabled
        if G2L["1"].Enabled then
            G2L["4"]:CaptureFocus()
            task.wait()
            G2L["4"].Text = ""
            G2L["4"].TextColor3 = Color3.fromRGB(255, 255, 255) -- White color for user input text
            isPlaceholderText = false
        else
            resetTextArea()
        end
    end
end)

G2L["4"].FocusLost:Connect(function(enterPressed)
    if enterPressed then
        G2L["1"].Enabled = false
        resetTextArea()
    end
end)

G2L["4"].Changed:Connect(function(property)
    if property == "Text" and not isPlaceholderText then
        G2L["4"].TextColor3 = Color3.fromRGB(255, 255, 255) -- White color for user input text
    end
end)

G2L["4"]:GetPropertyChangedSignal("Text"):Connect(function()
    local input = G2L["4"].Text
    local matches = findMatches(input)
    displayMatches(matches)
end)

resetTextArea()

addCmd("print")