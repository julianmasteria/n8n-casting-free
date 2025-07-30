#!/usr/bin/env python3
"""
Versión mínima (alpha) – analiza una carpeta con imágenes JPG/PNG
y genera un CSV dummy con el nombre de archivo. Se sustituirá por
la versión completa más adelante.
"""
import argparse, csv, pathlib, sys

EXT = {'.jpg', '.jpeg', '.png', '.webp', '.bmp', '.tiff'}

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--input', required=True, help='Carpeta con imágenes (recursiva)')
    ap.add_argument('--out', required=True, help='CSV de salida')
    args = ap.parse_args()

    root = pathlib.Path(args.input)
    files = [p for p in root.rglob('*') if p.suffix.lower() in EXT]

    with open(args.out, 'w', newline='', encoding='utf-8') as f:
        wr = csv.writer(f)
        wr.writerow(['file_path', 'faces', 'notes'])
        for p in files:
            # sólo un placeholder: marcar 0 caras y "pendiente"
            wr.writerow([str(p), 0, 'pendiente'])

    print(f'CSV creado: {args.out} ({len(files)} filas)')

if __name__ == '__main__':
    main()
