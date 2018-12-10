
set(SRC main.cpp)

add_executable(game WIN32 ${SRC})

foreach(source IN LISTS SRC)
    get_filename_component(source_path "${source}" PATH)
    string(REPLACE "/" "\\" source_path_msvc "${source_path}")
    source_group("${source_path_msvc}" FILES "${source}")
endforeach()

set_property(TARGET game PROPERTY CXX_STANDARD 17)

set(libs SDL2)
foreach(item IN LISTS libs)
    target_link_libraries(game PRIVATE ${item}) 
    add_custom_command(
        TARGET game
        POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy
            $<TARGET_FILE:${item}>
            $<TARGET_FILE_DIR:game>
    )    
endforeach()


foreach(item IN LISTS SFML_LIBS)

endforeach()