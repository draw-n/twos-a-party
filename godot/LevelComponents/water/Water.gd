extends TileMap
func _process(delta):
	var all_tiles = tile_set.get_tiles_ids()
	for i in all_tiles:
		tile_set.tile_get_texture(i).pause = get_tree().paused
