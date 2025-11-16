for ($i = 28; $i -le 60; $i++) {
    $name = "Companion" + $i
    $file_path = "resources/companions/" + $name + ".tres"
    $content = "[gd_resource type=\"Companion\" load_steps=2 format=3 uid=\"uid://comp" + $i + "\"]

[ext_resource type=\"Texture2D\" uid=\"uid://d1x2y3z4w5\" path=\"res://assets/art/ui/icon.svg\" id=\"1_icon\"]

[resource]
name = \"" + $name + "\"
texture = ExtResource(\"1_icon\")
max_hp = " + (10 + ($i * 2)) + "
hp = " + (10 + ($i * 2)) + "
attack = " + (2 + [Math]::Floor($i / 2)) + "
defense = " + (1 + [Math]::Floor($i / 3)) + "
speed = " + (1 + [Math]::Floor($i / 4)) + "
"
    Set-Content -Path $file_path -Value $content
}