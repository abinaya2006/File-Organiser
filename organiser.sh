read target

for file in "$target"/*
do
        if [[ -f  $file ]]
        then

                ext="${file##*.}"
                ext="${ext,,}"

                case "$ext" in

                        jpg | jpeg | png | gif | bmp | tif | tiff | webp | svg | ico | heic | heif | raw | cr2 | nef | arw | dng | psd | ai | eps | indd | jfif | avif | apng | ppm | pgm | pbm | pnm | hdr | exr | xbm | xpm | icns)
                                folder="images"
                                ;;
                        mp3 | wav | flac | aac | ogg | m4a | wma | alac | aiff | ape | opus | amr | mid | midi | ra | rm | au | snd | ac3 | dts | caf | mka | weba | 3ga)
                                folder="audios"
                                ;;
                        pdf)
                                folder="documents/pdfs"
                                ;;
                        zip | rar | 7z | tar | gz | bz2 | xz | tgz | tar.gz | tar.bz2 | tar.xz | iso | cab | z | lz | lzma | ace | arj | rpm | deb)
                                folder="zips"
                                ;;
                        doc | docx | odt | rtf)
                                folder="documents/word"
                                ;;
                        xls | xlsx | xlsm | xltx | xltm)
                                folder="documents/spreadsheets"
                                ;;
                        ppt | pptx | pps | ppsx | odp)
                                folder="documents/presentations"
                                ;;
                        webm | mkv | flv | vob | ogv | ogg | rrc | gifv | mng | mov | avi | qt | wmv | yuv | rm | asf | amv | mp4 | m4p | m4v | mpg | mp2 | mpeg | mpe | mpv | m4v | svi | 3gp | 3g2 | mxf | roq | nsv | flv | f4v | f4p | f4a | f4b | mod)
                                folder="videos"
                                ;;

                        *)
                                folder="others"
                                ;;
                esac

                mkdir -p "$target/$folder"
                mv -iv "$file" "$target/$folder/"
        fi
done

echo "Successfully organised!!"
