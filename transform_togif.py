from moviepy.editor import VideoFileClip

def mp4_to_gif(input_video: str, output_gif: str, fps: int = 10, resize: float = 0.5):
    """
    Converts an MP4 video to a GIF.
    
    Parameters:
    input_video (str): Path to the input MP4 file.
    output_gif (str): Path to save the output GIF.
    fps (int): Frames per second for the GIF (default is 10).
    resize (float): Scaling factor for resizing (default is 0.5, 50% size).
    """
    clip = VideoFileClip(input_video)
    clip = clip.resize(resize)  # Resize for smaller file size
    clip.write_gif(output_gif, fps=fps)
    
if __name__ == "__main__":
    dir_transf = [['outputs/simple_video_sample/svd_xt/paragliding/000000.mp4', 'paragliding']
                  ]
    for full, name in dir_transf:
        input_video = f"{full}"  # Change this to your video file
        output_gif = f"transform_gifs/{name}.gif"
        mp4_to_gif(input_video, output_gif)