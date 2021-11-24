

LevelUpMenuState = Class{__includes = BaseState}


function LevelUpMenuState:init(def, onClose)
    self.pokemon = def.pokemon

    self.HPInc = def.HPInc
    self.AttackInc = def.AttackInc
    self.DefenseInc = def.DefenseInc
    self.SpeedInc = def.SpeedInc

    self.onClose = onClose
    --Because, at this point, the pokemon will have already leveled up, we need to 
    -- project backwards into the past in order to provide an accurate chronicle.
    self.levelupMenu = Menu{
        x = 0,
        y = VIRTUAL_HEIGHT - 96,
        width = VIRTUAL_WIDTH,
        height = 96,
        items = {
            {
                --Only define onSelect for the first item, because our plain list flag ensures that this is the one called.
                text = "HP: "..tostring(self.pokemon.HP - self.HPInc).." + "..tostring(self.HPInc).." = "..tostring(self.pokemon.HP),
                onSelect = function ()
                    --print("HP selected!")
                    gStateStack:pop()
                    self.onClose()
                end
            },
            {
                text = "Attack: "..tostring(self.pokemon.attack - self.AttackInc).." + "..tostring(self.AttackInc).." = "..tostring(self.pokemon.attack)
            },
            {
                text = "Defense: "..tostring(self.pokemon.defense - self.DefenseInc).." + "..tostring(self.DefenseInc).." = "..tostring(self.pokemon.defense)
            },
            {
                text = "Speed: "..tostring(self.pokemon.speed - self.SpeedInc).." + "..tostring(self.SpeedInc).." = "..tostring(self.pokemon.speed)
            }
        },
        isPlainList = true
    }


end

function LevelUpMenuState:update(dt)
    self.levelupMenu:update(dt)
end

function LevelUpMenuState:render()
    self.levelupMenu:render()
end