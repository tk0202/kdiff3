find_package(
    Qt5 ${QT_MIN_VERSION}
    REQUIRED
    Test
    )
add_definitions(-DAUTOTEST)

ecm_add_test(commentparser.cpp ../CommentParser.cpp
    TEST_NAME "commentparser"
    LINK_LIBRARIES Qt5::Test
)

ecm_add_test(CvsIgnorelist.cpp ../cvsignorelist.cpp 
    TEST_NAME "cvsignorelisttest"
    LINK_LIBRARIES Qt5::Test
)

