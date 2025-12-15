function(add_raylib_app APP_NAME)
    add_executable(${APP_NAME} ${ARGN})

    target_link_libraries(${APP_NAME} PRIVATE raylib)

    target_compile_features(${APP_NAME} PRIVATE cxx_std_20)

    # Asset path automatico
    target_compile_definitions(${APP_NAME} PRIVATE
        ASSETS_PATH="${CMAKE_CURRENT_SOURCE_DIR}/assets/"
    )

    # Warning ragionevoli (opzionale)
    if (MSVC)
        target_compile_options(${APP_NAME} PRIVATE /W4)
    else()
        target_compile_options(${APP_NAME} PRIVATE -Wall -Wextra)
    endif()
endfunction()

