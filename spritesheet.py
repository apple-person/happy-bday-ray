import pygame

class SpriteSheet():
	def __init__(self, image):
		self.sheet = image

	def get_image(self, frame, width, height, scale, colour):
		image = pygame.Surface((width, height)).convert_alpha()
		image.blit(self.sheet, (0, 0), ((frame * width), 0, width, height))
		image = pygame.transform.scale(image, (width * scale, height * scale))
		image.set_colorkey(colour)

		return image


import pygame

def load_moving_sprites(sprite_sheet, frame_width, frame_height, scale, color_key):
    moving_sprites = {
        'walk_left': [],
        'walk_right': [],
        'walk_up': [],
        'walk_down': []
    }
    
    # Frames 0-3: Walk down
    for i in range(4):
        frame = sprite_sheet.get_image(i, frame_width, frame_height, scale, color_key)
        moving_sprites['walk_down'].append(frame)
    
    # Frames 4-7: Walk up
    for i in range(4, 8):
        frame = sprite_sheet.get_image(i, frame_width, frame_height, scale, color_key)
        moving_sprites['walk_up'].append(frame)
    
    # Frames 8-11: Walk right (and create flipped left versions)
    for i in range(8, 12):
        frame = sprite_sheet.get_image(i, frame_width, frame_height, scale, color_key)
        moving_sprites['walk_right'].append(frame)
        
        # Create flipped version for walk_left
        flipped_frame = pygame.transform.flip(frame, True, False)  # Flip horizontally
        moving_sprites['walk_left'].append(flipped_frame)
    
    return moving_sprites
