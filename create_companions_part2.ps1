for ($i = 28; $i -le 60; $i++) {
    $name = "Companion" + $i
    $file_path = "resources/companions/" + $name + ".tres"
    $content = "[gd_resource type=\"Companion\" load_steps=2 format=3 uid=\"uid://comp" + $i + "]\n\n[ext_resource type=\"Texture2D\" uid=\"uid://d1x2y3z4w5\" path=\"res://assets/art/ui/icon.svg\" id=\"1_icon\"]\n\n[resource]\nname = \"" + $name + "\"\ntexture = ExtResource(\"1_icon\")\nmax_hp = " + (10 + ($i * 2)) + "\nhp = " + (10 + ($i * 2)) + "\nattack = " + (2 + [Math]::Floor($i / 2)) + "\n"
    Set-Content -Path $file_path -Value $content
}