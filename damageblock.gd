[gd_scene load_steps=4 format=3 uid="uid://byeka635aj4me"]

[ext_resource type="Script" uid="uid://cknr15bgarl83" path="res://damageblock.gd" id="1_5p85m"]
[ext_resource type="Texture2D" uid="uid://nw8463u677x7" path="res://glitch.jpg" id="2_mt0q5"]

[sub_resource type="RectangleShape2D" id="RectangleShape2D_llic7"]
size = Vector2(378, 330)

[node name="Brick" type="Area2D"]
collision_layer = 16
script = ExtResource("1_5p85m")

[node name="Sprite2D" type="Sprite2D" parent="."]
texture = ExtResource("2_mt0q5")

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
position = Vector2(-1, 0)
shape = SubResource("RectangleShape2D_llic7")
