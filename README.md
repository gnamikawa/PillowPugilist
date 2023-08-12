# PillowPugilist
Gamiest of gamejams

# Bullet workflow
-- copy a bullet scene
-- change the sprite
-- change the collision radius
-- change the damage
-- change the movement pattern

# VN workflow
-- inherit the vn scene
-- change the "next scene" on the VN scene root node
-- add "VNSay" nodes as children of the "Actions" node
-- set their sprite + text (if either is missing it reuses the value)
-- once the player goes through all actions, it loads the scene set on the vn root

# Weapon workflow
-- inherit the base weapon
-- set the weapon bullet
-- choose the weapon shooting pattern thingy

# Enemy workflow
-- inherit the base enemy
-- change its movement pattern
-- set its weapons (can have multiple because each is independent, just make sure to have it as a direct child)
-- change its hp
-- change its score
-- make sure collision checks out with the sprite

# Boss workflow
-- bosses are like normal enemies but their movement
is replaced by BossController which takes BossMovement children nodes
which define where to move and what weapon to switch to upon getting there
(with optional waits before moving!)
-- bosses should have their next_level set so that when the player wins, it loads the next level

# Cala notes
-- after the last level, maybe have a victory section in the VN thingy
-- after which we load the main menu through the next_level on the VN root node
