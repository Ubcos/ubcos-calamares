#!/usr/bin/env python3
"""Generate Ubcos logo for Calamares branding."""
import struct, zlib, math, os, sys

def write_png(filename, width, height, pixels):
    def chunk(name, data):
        c = name + data
        return struct.pack('>I', len(data)) + c + struct.pack('>I', zlib.crc32(c) & 0xffffffff)
    raw = b''
    for y in range(height):
        raw += b'\x00'
        for x in range(width):
            raw += bytes(pixels[y][x])
    png = b'\x89PNG\r\n\x1a\n'
    png += chunk(b'IHDR', struct.pack('>IIBBBBB', width, height, 8, 6, 0, 0, 0))
    png += chunk(b'IDAT', zlib.compress(raw, 9))
    png += chunk(b'IEND', b'')
    with open(filename, 'wb') as f:
        f.write(png)

def create_logo(size, output_path):
    pixels = [[(0, 0, 0, 0) for _ in range(size)] for _ in range(size)]
    
    bg_color = (30, 33, 48, 255)      # #1e2127
    accent = (97, 175, 239, 255)      # #61afef
    white = (255, 255, 255, 255)
    
    # Draw circle background
    cx, cy = size // 2, size // 2
    r = size // 2 - 10
    
    for y in range(size):
        for x in range(size):
            d = math.sqrt((x-cx)**2 + (y-cy)**2)
            if d < r:
                t = d / r
                pixels[y][x] = (
                    int(accent[0] * (1-t) + bg_color[0] * t),
                    int(accent[1] * (1-t) + bg_color[1] * t),
                    int(accent[2] * (1-t) + bg_color[2] * t),
                    255
                )
    
    # Draw "U" letter
    letter = [
        [1,0,0,0,1],
        [1,0,0,0,1],
        [1,0,0,0,1],
        [1,0,0,0,1],
        [1,0,0,0,1],
        [0,1,0,1,0],
        [0,0,1,0,0],
    ]
    
    lw = size // 15
    lh = size // 15
    ox = cx - (5*lw)//2
    oy = cy - (7*lh)//2
    
    for ry, row in enumerate(letter):
        for rx, cell in enumerate(row):
            if cell:
                for py in range(lh):
                    for px in range(lw):
                        ny = oy + ry*lh + py
                        nx = ox + rx*lw + px
                        if 0 <= ny < size and 0 <= nx < size:
                            pixels[ny][nx] = white
    
    # Draw circle outline
    for y in range(size):
        for x in range(size):
            d = math.sqrt((x-cx)**2 + (y-cy)**2)
            if abs(d - r) < 3:
                if pixels[y][x][3] == 0:  # Only on transparent
                    pixels[y][x] = accent

    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    write_png(output_path, size, size, pixels)
    print(f"Logo generated: {output_path}")

# Generate logos
create_logo(128, "/usr/share/calamares/branding/ubcos/logo.png")
create_logo(64, "/usr/share/calamares/branding/ubcos/icon.png")
create_logo(256, "/usr/share/calamares/branding/ubcos/languages.png")
print("All Calamares logos generated!")
