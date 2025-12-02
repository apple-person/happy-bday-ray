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

def load_moving_sprites(sprite_sheet, frame_width, frame_height, scale, color_key):
    moving_sprites = {
        'walk_left': [],
        'walk_right': [],
        'walk_up': [],
        'walk_down': []
    }
    
    def create_animation_sequence(row_start_index):
        feet_together = sprite_sheet.get_image(row_start_index, frame_width, frame_height, scale, color_key)
        frame2 = sprite_sheet.get_image(row_start_index + 1, frame_width, frame_height, scale, color_key)
        frame3 = sprite_sheet.get_image(row_start_index + 2, frame_width, frame_height, scale, color_key)
        
        # Create sequence: feet_together -> frame2 -> feet_together -> frame3
        return [feet_together, frame2, feet_together, frame3]
    
    # Row 0 (frames 0-2): Walk down
    moving_sprites['walk_down'] = create_animation_sequence(0)
    
    # Row 1 (frames 3-5): Walk up  
    moving_sprites['walk_up'] = create_animation_sequence(3)
    
    # Row 2 (frames 6-8): Walk right and create flipped left versions
    right_frames = create_animation_sequence(6)
    moving_sprites['walk_right'] = right_frames
    
    # Create flipped versions for walk_left
    moving_sprites['walk_left'] = []
    for frame in right_frames:
        flipped_frame = pygame.transform.flip(frame, True, False)  # Flip horizontally
        moving_sprites['walk_left'].append(flipped_frame)
    
    return moving_sprites
