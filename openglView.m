//
//  openglView.m
//  hw6_ios
//
//  Created by Winnie Zeng on 2/23/14.
//  Copyright (c) 2014 Winnie Zeng. All rights reserved.
//

#import "openglView.h"
#import "CC3GLMatrix.h"

typedef struct {
    float Position[3];
    float Color[4];
    float TexCoord[2];
} Vertex;

/*
const Vertex Vertices[] = {
    // Front
    {{1, -1, 0}, {1, 0, 0, 1}, {TEX_COORD_MAX, 0}},
    {{1, 1, 0}, {0, 1, 0, 1}, {TEX_COORD_MAX, TEX_COORD_MAX}},
    {{-1, 1, 0}, {0, 0, 1, 1}, {0, TEX_COORD_MAX}},
    {{-1, -1, 0}, {0, 0, 0, 1}, {0, 0}},
    // Back
    {{1, 1, -2}, {1, 0, 0, 1}, {TEX_COORD_MAX, 0}},
    {{-1, -1, -2}, {0, 1, 0, 1}, {TEX_COORD_MAX, TEX_COORD_MAX}},
    {{1, -1, -2}, {0, 0, 1, 1}, {0, TEX_COORD_MAX}},
    {{-1, 1, -2}, {0, 0, 0, 1}, {0, 0}},
    // Left
    {{-1, -1, 0}, {1, 0, 0, 1}, {TEX_COORD_MAX, 0}},
    {{-1, 1, 0}, {0, 1, 0, 1}, {TEX_COORD_MAX, TEX_COORD_MAX}},
    {{-1, 1, -2}, {0, 0, 1, 1}, {0, TEX_COORD_MAX}},
    {{-1, -1, -2}, {0, 0, 0, 1}, {0, 0}},
    // Right
    {{1, -1, -2}, {1, 0, 0, 1}, {TEX_COORD_MAX, 0}},
    {{1, 1, -2}, {0, 1, 0, 1}, {TEX_COORD_MAX, TEX_COORD_MAX}},
    {{1, 1, 0}, {0, 0, 1, 1}, {0, TEX_COORD_MAX}},
    {{1, -1, 0}, {0, 0, 0, 1}, {0, 0}},
    // Top
    {{1, 1, 0}, {1, 0, 0, 1}, {TEX_COORD_MAX, 0}},
    {{1, 1, -2}, {0, 1, 0, 1}, {TEX_COORD_MAX, TEX_COORD_MAX}},
    {{-1, 1, -2}, {0, 0, 1, 1}, {0, TEX_COORD_MAX}},
    {{-1, 1, 0}, {0, 0, 0, 1}, {0, 0}},
    // Bottom
    {{1, -1, -2}, {1, 0, 0, 1}, {TEX_COORD_MAX, 0}},
    {{1, -1, 0}, {0, 1, 0, 1}, {TEX_COORD_MAX, TEX_COORD_MAX}},
    {{-1, -1, 0}, {0, 0, 1, 1}, {0, TEX_COORD_MAX}},
    {{-1, -1, -2}, {0, 0, 0, 1}, {0, 0}}
};

const GLubyte Indices[] = {
    // Front
    0, 1, 2,
    2, 3, 0,
    // Back
    4, 5, 6,
    4, 5, 7,
    // Left
    8, 9, 10,
    10, 11, 8,
    // Right
    12, 13, 14,
    14, 15, 12,
    // Top
    16, 17, 18,
    18, 19, 16,
    // Bottom
    20, 21, 22,
    22, 23, 20
};

const Vertex Vertices2[] = {
    {{.8944,.4472,0}, {.8944,.4472,0, 1},{0, 0}},               // 0
    {{.2764,.4472,.8506},{.2764,.4472,.8506, 1},{0, 0}},        // 1
    {{.2764,.4472,-.8506},{.2764,.4472,-.8506,1},{0, 0}},       // 2
    {{-.7236,.4472,.5257},{-.7236,.4472,.5257,1},{0, 0}},       // 3
    {{-.7236,.4472,-.5257},{-.7236,.4472,-.5257,1},{0, 0}},     // 4
    {{-.3416,.4472,0},{-.3416,.4472,0,1},{0, 0}},               // 5
    {{-.1056,.4472,.3249},{-.1056,.4472,.3249,1},{0, 0}},       // 6
    {{-.1056,.4472,-.3249},{-.1056,.4472,-.3249,1},{0, 0}},     // 7
    {{.2764,.4472,.2008},{.2764,.4472,.2008,1},{0, 0}},         // 8
    {{.2764,.4472,-.2008},{.2764,.4472,-.2008,1},{0, 0}},       // 9
    {{-.8944,-.4472,0},{-.8944,-.4472,0,1},{0, 0}},             // 10
    {{-.2764,-.4472,.8506},{-.2764,-.4472,.8506,1},{0, 0}},     // 11
    {{-.2764,-.4472,-.8506},{-.2764,-.4472,-.8506,1},{0, 0}},   // 12
    {{.7236,-.4472,.5257},{.7236,-.4472,.5257,1},{0, 0}},       // 13
    {{.7236,-.4472,-.5257},{.7236,-.4472,-.5257,1},{0, 0}},     // 14
    {{.3416,-.4472,0},{.3416,-.4472,0,1},{0, 0}},               // 15
    {{.1056,-.4472,.3249},{.1056,-.4472,.3249,1},{0, 0}},       // 16
    {{.1056,-.4472,-.3249},{.1056,-.4472,-.3249,1},{0, 0}},     // 17
    {{-.2764,-.4472,.2008},{-.2764,-.4472,.2008,1},{0, 0}},     // 18
    {{-.2764,-.4472,-.2008},{-.2764,-.4472,-.2008,1},{0, 0}},   // 19
    {{-.5527,.1058,0},{-.5527,.1058,0,1},{0, 0}},               // 20
    {{-.1708,.1058,.5527},{-.1708,.1058,.5527,1},{0, 0}},       // 21
    {{-.1708,.1058,-.5527},{-.1708,.1058,-.5527,1},{0, 0}},     // 22
    {{.4471,.1058,.3249},{.4471,.1058,.3249,1},{0, 0}},         // 23
    {{.4471,.1058,-.3249},{.4471,.1058,-.3249,1},{0, 0}},       // 24
    {{.5527,-.1058,0},{.5527,-.1058,0,1},{1, 0}},               // 25
    {{.1708,-.1058,.5527},{.1708,-.1058,.5527,1},{0, 0}},       // 26
    {{.1708,-.1058,-.5527},{.1708,-.1058,-.5527,1},{0, 0}},     // 27
    {{-.4471,-.1058,.3249},{-.4471,-.1058,.3249,1},{0, 0}},     // 28
    {{-.4471,-.1058,-.3249},{-.4471,-.1058,-.3249,1},{0, 0}},   // 29
    {{0,1,0},{0,1,0,1},{0, 0}},                                 // 30
    {{0,-1,0},{0,-1,0,1},{0, 0}}                                // 31
};
const GLubyte Indices2[] = {
    0,9,8, 2,7,9, 4,5,7, 3,6,5, 1,8,6,
    0,8,23, 30,6,8, 3,21,6, 11,26,21, 13,23,26,
    2,9,24, 30,8,9, 1,23,8, 13,25,23, 14,24,25,
    4,7,22, 30,9,7, 0,24,9, 14,27,24, 12,22,27,
    3,5,20, 30,7,5, 2,22,7, 12,29,22, 10,20,29,
    1,6,21, 30,5,6, 4,20,5, 10,28,20, 11,21,28,
    10,19,18, 12,17,19, 14,15,17, 13,16,15, 11,18,16,
    31,19,17, 14,17,27, 2,27,22, 4,22,29, 10,29,19,
    31,18,19, 12,19,29, 4,29,20, 3,20,28, 11,28,18,
    31,16,18, 10,18,28, 3,28,21, 1,21,26, 13,26,16,
    31,15,16, 11,16,26, 1,26,23, 0,23,25, 14,25,15,
    31,17,15, 13,15,25, 0,25,24, 2,24,27, 12,27,17
};
*/

const Vertex Vertices[] = {
    {{.8944,.4472,0}, {.8944,.4472,0, 1},{0, 0}},               // 0
    {{.2764,.4472,-.2008},{.2764,.4472,-.2008,1},{0, 1}},       // 9
    {{.2764,.4472,.2008},{.2764,.4472,.2008,1},{1, 1}},         // 8
    
    {{.2764,.4472,-.8506},{.2764,.4472,-.8506,1},{0, 0}},       // 2
    {{-.1056,.4472,-.3249},{-.1056,.4472,-.3249,1},{0, 1}},     // 7
    {{.2764,.4472,-.2008},{.2764,.4472,-.2008,1},{1, 1}},       // 9
    
    {{-.7236,.4472,-.5257},{-.7236,.4472,-.5257,1},{0, 0}},     // 4
    {{-.3416,.4472,0},{-.3416,.4472,0,1},{0, 1}},               // 5
    {{-.1056,.4472,-.3249},{-.1056,.4472,-.3249,1},{1, 1}},     // 7

    {{-.7236,.4472,.5257},{-.7236,.4472,.5257,1},{0, 0}},       // 3
    {{-.1056,.4472,.3249},{-.1056,.4472,.3249,1},{0, 1}},       // 6
    {{-.3416,.4472,0},{-.3416,.4472,0,1},{1, 1}},               // 5
    
    {{.2764,.4472,.8506},{.2764,.4472,.8506, 1},{0, 0}},        // 1
    {{.2764,.4472,.2008},{.2764,.4472,.2008,1},{0, 1}},         // 8
    {{-.1056,.4472,.3249},{-.1056,.4472,.3249,1},{1, 1}},       // 6
    
    {{.8944,.4472,0}, {.8944,.4472,0, 1},{0, 0}},               // 0
    {{.2764,.4472,.2008},{.2764,.4472,.2008,1},{0, 1}},         // 8
    {{.4471,.1058,.3249},{.4471,.1058,.3249,1},{1, 1}},         // 23
    
    {{0,1,0},{0,1,0,1},{0, 0}},                                 // 30
    {{-.1056,.4472,.3249},{-.1056,.4472,.3249,1},{0, 1}},       // 6
    {{.2764,.4472,.2008},{.2764,.4472,.2008,1},{1, 1}},         // 8
    
    {{-.7236,.4472,.5257},{-.7236,.4472,.5257,1},{0, 0}},       // 3
    {{-.1708,.1058,.5527},{-.1708,.1058,.5527,1},{0, 1}},       // 21
    {{-.1056,.4472,.3249},{-.1056,.4472,.3249,1},{1, 1}},       // 6
    
    {{-.2764,-.4472,.8506},{-.2764,-.4472,.8506,1},{0, 0}},     // 11
    {{.1708,-.1058,.5527},{.1708,-.1058,.5527,1},{0, 1}},       // 26
    {{-.1708,.1058,.5527},{-.1708,.1058,.5527,1},{1, 1}},       // 21
    
    {{.7236,-.4472,.5257},{.7236,-.4472,.5257,1},{0, 0}},       // 13
    {{.4471,.1058,.3249},{.4471,.1058,.3249,1},{0, 1}},         // 23
    {{.1708,-.1058,.5527},{.1708,-.1058,.5527,1},{1, 1}},       // 26
    
    {{.2764,.4472,-.8506},{.2764,.4472,-.8506,1},{0, 0}},       // 2
    {{.2764,.4472,-.2008},{.2764,.4472,-.2008,1},{0, 1}},       // 9
    {{.4471,.1058,-.3249},{.4471,.1058,-.3249,1},{1, 1}},       // 24
    
    {{0,1,0},{0,1,0,1},{0, 0}},                                 // 30
    {{.2764,.4472,.2008},{.2764,.4472,.2008,1},{0, 1}},         // 8
    {{.2764,.4472,-.2008},{.2764,.4472,-.2008,1},{1, 1}},       // 9
    
    {{.2764,.4472,.8506},{.2764,.4472,.8506, 1},{0, 0}},        // 1
    {{.4471,.1058,.3249},{.4471,.1058,.3249,1},{0, 1}},         // 23
    {{.2764,.4472,.2008},{.2764,.4472,.2008,1},{1, 1}},         // 8
    
    {{.7236,-.4472,.5257},{.7236,-.4472,.5257,1},{0, 0}},       // 13
    {{.5527,-.1058,0},{.5527,-.1058,0,1},{0, 1}},               // 25
    {{.4471,.1058,.3249},{.4471,.1058,.3249,1},{1, 1}},         // 23
    
    {{.7236,-.4472,-.5257},{.7236,-.4472,-.5257,1},{0, 0}},     // 14
    {{.4471,.1058,-.3249},{.4471,.1058,-.3249,1},{0, 1}},       // 24
    {{.5527,-.1058,0},{.5527,-.1058,0,1},{1, 1}},               // 25
    
    {{-.7236,.4472,-.5257},{-.7236,.4472,-.5257,1},{0, 0}},     // 4
    {{-.1056,.4472,-.3249},{-.1056,.4472,-.3249,1},{0, 1}},     // 7
    {{-.1708,.1058,-.5527},{-.1708,.1058,-.5527,1},{1, 1}},     // 22
    
    {{0,1,0},{0,1,0,1},{0, 0}},                                 // 30
    {{.2764,.4472,-.2008},{.2764,.4472,-.2008,1},{0, 1}},       // 9
    {{-.1056,.4472,-.3249},{-.1056,.4472,-.3249,1},{1, 1}},     // 7
    
    {{.8944,.4472,0}, {.8944,.4472,0, 1},{0, 0}},               // 0
    {{.4471,.1058,-.3249},{.4471,.1058,-.3249,1},{0, 1}},       // 24
    {{.2764,.4472,-.2008},{.2764,.4472,-.2008,1},{1, 1}},       // 9
    
    {{.7236,-.4472,-.5257},{.7236,-.4472,-.5257,1},{0, 0}},     // 14
    {{.1708,-.1058,-.5527},{.1708,-.1058,-.5527,1},{0, 1}},     // 27
    {{.4471,.1058,-.3249},{.4471,.1058,-.3249,1},{1, 1}},       // 24
    
    {{-.2764,-.4472,-.8506},{-.2764,-.4472,-.8506,1},{0, 0}},   // 12
    {{-.1708,.1058,-.5527},{-.1708,.1058,-.5527,1},{0, 1}},     // 22
    {{.1708,-.1058,-.5527},{.1708,-.1058,-.5527,1},{0, 1}},     // 27
    
    {{-.7236,.4472,.5257},{-.7236,.4472,.5257,1},{0, 0}},       // 3
    {{-.3416,.4472,0},{-.3416,.4472,0,1},{0, 1}},               // 5
    {{-.5527,.1058,0},{-.5527,.1058,0,1},{1, 1}},               // 20
    
    {{0,1,0},{0,1,0,1},{0, 0}},                                 // 30
    {{-.1056,.4472,-.3249},{-.1056,.4472,-.3249,1},{0, 1}},     // 7
    {{-.3416,.4472,0},{-.3416,.4472,0,1},{1, 1}},               // 5
    
    {{.2764,.4472,-.8506},{.2764,.4472,-.8506,1},{0, 0}},       // 2
    {{-.1708,.1058,-.5527},{-.1708,.1058,-.5527,1},{0, 1}},     // 22
    {{-.1056,.4472,-.3249},{-.1056,.4472,-.3249,1},{1, 1}},     // 7
    
    {{-.2764,-.4472,-.8506},{-.2764,-.4472,-.8506,1},{0, 0}},   // 12
    {{-.4471,-.1058,-.3249},{-.4471,-.1058,-.3249,1},{0, 1}},   // 29
    {{-.1708,.1058,-.5527},{-.1708,.1058,-.5527,1},{1, 1}},     // 22
    
    {{-.8944,-.4472,0},{-.8944,-.4472,0,1},{0, 0}},             // 10
    {{-.5527,.1058,0},{-.5527,.1058,0,1},{0, 1}},               // 20
    {{-.4471,-.1058,-.3249},{-.4471,-.1058,-.3249,1},{1, 1}},   // 29
    
    {{.2764,.4472,.8506},{.2764,.4472,.8506, 1},{0, 0}},        // 1
    {{-.1056,.4472,.3249},{-.1056,.4472,.3249,1},{0, 1}},       // 6
    {{-.1708,.1058,.5527},{-.1708,.1058,.5527,1},{1, 1}},       // 21
    
    {{0,1,0},{0,1,0,1},{0, 0}},                                 // 30
    {{-.3416,.4472,0},{-.3416,.4472,0,1},{0, 1}},               // 5
    {{-.1056,.4472,.3249},{-.1056,.4472,.3249,1},{1, 1}},       // 6
    
    {{-.7236,.4472,-.5257},{-.7236,.4472,-.5257,1},{0, 0}},     // 4
    {{-.5527,.1058,0},{-.5527,.1058,0,1},{0, 1}},               // 20
    {{-.3416,.4472,0},{-.3416,.4472,0,1},{1, 1}},               // 5
    
    {{-.8944,-.4472,0},{-.8944,-.4472,0,1},{0, 0}},             // 10
    {{-.4471,-.1058,.3249},{-.4471,-.1058,.3249,1},{0, 1}},     // 28
    {{-.5527,.1058,0},{-.5527,.1058,0,1},{1, 1}},               // 20
    
    {{-.2764,-.4472,.8506},{-.2764,-.4472,.8506,1},{0, 0}},     // 11
    {{-.1708,.1058,.5527},{-.1708,.1058,.5527,1},{0, 1}},       // 21
    {{-.4471,-.1058,.3249},{-.4471,-.1058,.3249,1},{1, 1}},     // 28
    
    {{-.8944,-.4472,0},{-.8944,-.4472,0,1},{0, 0}},             // 10
    {{-.2764,-.4472,-.2008},{-.2764,-.4472,-.2008,1},{0, 1}},   // 19
    {{-.2764,-.4472,.2008},{-.2764,-.4472,.2008,1},{1, 1}},     // 18
    
    {{-.2764,-.4472,-.8506},{-.2764,-.4472,-.8506,1},{0, 0}},   // 12
    {{.1056,-.4472,-.3249},{.1056,-.4472,-.3249,1},{0, 1}},     // 17
    {{-.2764,-.4472,-.2008},{-.2764,-.4472,-.2008,1},{1, 1}},   // 19
    
    {{.7236,-.4472,-.5257},{.7236,-.4472,-.5257,1},{0, 0}},     // 14
    {{.3416,-.4472,0},{.3416,-.4472,0,1},{0, 1}},               // 15
    {{.1056,-.4472,-.3249},{.1056,-.4472,-.3249,1},{1, 1}},     // 17
    
    {{.7236,-.4472,.5257},{.7236,-.4472,.5257,1},{0, 0}},       // 13
    {{.1056,-.4472,.3249},{.1056,-.4472,.3249,1},{0, 1}},       // 16
    {{.3416,-.4472,0},{.3416,-.4472,0,1},{1, 1}},               // 15
    
    {{-.2764,-.4472,.8506},{-.2764,-.4472,.8506,1},{0, 0}},      // 11
    {{-.2764,-.4472,.2008},{-.2764,-.4472,.2008,1},{0, 1}},     // 18
    {{.1056,-.4472,.3249},{.1056,-.4472,.3249,1},{1, 1}},       // 16

    {{0,-1,0},{0,-1,0,1},{0, 0}},                               // 31
    {{-.2764,-.4472,-.2008},{-.2764,-.4472,-.2008,1},{0, 1}},   // 19
    {{.1056,-.4472,-.3249},{.1056,-.4472,-.3249,1},{1, 1}},     // 17

    {{.7236,-.4472,-.5257},{.7236,-.4472,-.5257,1},{0, 0}},     // 14
    {{.1056,-.4472,-.3249},{.1056,-.4472,-.3249,1},{0, 1}},     // 17
    {{.1708,-.1058,-.5527},{.1708,-.1058,-.5527,1},{1, 1}},     // 27

    {{.2764,.4472,-.8506},{.2764,.4472,-.8506,1},{0, 0}},       // 2
    {{.1708,-.1058,-.5527},{.1708,-.1058,-.5527,1},{0, 1}},     // 27
    {{-.1708,.1058,-.5527},{-.1708,.1058,-.5527,1},{1, 1}},     // 22

    {{-.7236,.4472,-.5257},{-.7236,.4472,-.5257,1},{0, 0}},     // 4
    {{-.1708,.1058,-.5527},{-.1708,.1058,-.5527,1},{0, 1}},     // 22
    {{-.4471,-.1058,-.3249},{-.4471,-.1058,-.3249,1},{1, 1}},   // 29

    {{-.8944,-.4472,0},{-.8944,-.4472,0,1},{0, 0}},             // 10
    {{-.4471,-.1058,-.3249},{-.4471,-.1058,-.3249,1},{0, 1}},   // 29
    {{-.2764,-.4472,-.2008},{-.2764,-.4472,-.2008,1},{1, 1}},   // 19

    {{0,-1,0},{0,-1,0,1},{0, 0}},                               // 31
    {{-.2764,-.4472,.2008},{-.2764,-.4472,.2008,1},{0, 1}},     // 18
    {{-.2764,-.4472,-.2008},{-.2764,-.4472,-.2008,1},{1, 1}},   // 19

    {{-.2764,-.4472,-.8506},{-.2764,-.4472,-.8506,1},{0, 0}},   // 12
    {{-.2764,-.4472,-.2008},{-.2764,-.4472,-.2008,1},{0, 1}},   // 19
    {{-.4471,-.1058,-.3249},{-.4471,-.1058,-.3249,1},{1, 1}},   // 29

    {{-.7236,.4472,-.5257},{-.7236,.4472,-.5257,1},{0, 0}},     // 4
    {{-.4471,-.1058,-.3249},{-.4471,-.1058,-.3249,1},{0, 1}},   // 29
    {{-.5527,.1058,0},{-.5527,.1058,0,1},{1, 1}},               // 20

    {{-.7236,.4472,.5257},{-.7236,.4472,.5257,1},{0, 0}},       // 3
    {{-.5527,.1058,0},{-.5527,.1058,0,1},{0, 1}},               // 20
    {{-.4471,-.1058,.3249},{-.4471,-.1058,.3249,1},{1, 1}},     // 28

    {{-.2764,-.4472,.8506},{-.2764,-.4472,.8506,1},{0, 0}},     // 11
    {{-.4471,-.1058,.3249},{-.4471,-.1058,.3249,1},{0, 1}},     // 28
    {{-.2764,-.4472,.2008},{-.2764,-.4472,.2008,1},{1, 1}},     // 18
    
    {{0,-1,0},{0,-1,0,1},{0, 0}},                               // 31
    {{.1056,-.4472,.3249},{.1056,-.4472,.3249,1},{0, 1}},       // 16
    {{-.2764,-.4472,.2008},{-.2764,-.4472,.2008,1},{1, 1}},     // 18
    
    {{-.8944,-.4472,0},{-.8944,-.4472,0,1},{0, 0}},             // 10
    {{-.2764,-.4472,.2008},{-.2764,-.4472,.2008,1},{0, 1}},     // 18
    {{-.4471,-.1058,.3249},{-.4471,-.1058,.3249,1},{1, 1}},     // 28

    {{-.7236,.4472,.5257},{-.7236,.4472,.5257,1},{0, 0}},       // 3
    {{-.4471,-.1058,.3249},{-.4471,-.1058,.3249,1},{0, 1}},     // 28
    {{-.1708,.1058,.5527},{-.1708,.1058,.5527,1},{1, 1}},       // 21
    
    {{.2764,.4472,.8506},{.2764,.4472,.8506, 1},{0, 0}},        // 1
    {{-.1708,.1058,.5527},{-.1708,.1058,.5527,1},{0, 1}},       // 21
    {{.1708,-.1058,.5527},{.1708,-.1058,.5527,1},{1, 1}},       // 26
    
    {{.7236,-.4472,.5257},{.7236,-.4472,.5257,1},{0, 0}},       // 13
    {{.1708,-.1058,.5527},{.1708,-.1058,.5527,1},{0, 1}},       // 26
    {{.1056,-.4472,.3249},{.1056,-.4472,.3249,1},{1, 1}},       // 16
    
    {{0,-1,0},{0,-1,0,1},{0, 0}},                               // 31
    {{.3416,-.4472,0},{.3416,-.4472,0,1},{0, 1}},               // 15
    {{.1056,-.4472,.3249},{.1056,-.4472,.3249,1},{1, 1}},       // 16
    
    {{-.2764,-.4472,.8506},{-.2764,-.4472,.8506,1},{0, 0}},     // 11
    {{.1056,-.4472,.3249},{.1056,-.4472,.3249,1},{0, 1}},       // 16
    {{.1708,-.1058,.5527},{.1708,-.1058,.5527,1},{1, 1}},       // 26
    
    {{.2764,.4472,.8506},{.2764,.4472,.8506, 1},{0, 0}},        // 1
    {{.1708,-.1058,.5527},{.1708,-.1058,.5527,1},{0, 0}},       // 26
    {{.4471,.1058,.3249},{.4471,.1058,.3249,1},{0, 0}},         // 23
    
    {{.8944,.4472,0}, {.8944,.4472,0, 1},{0, 0}},               // 0
    {{.4471,.1058,.3249},{.4471,.1058,.3249,1},{0, 1}},         // 23
    {{.5527,-.1058,0},{.5527,-.1058,0,1},{1, 1}},               // 25
    
    {{.7236,-.4472,-.5257},{.7236,-.4472,-.5257,1},{0, 0}},     // 14
    {{.5527,-.1058,0},{.5527,-.1058,0,1},{0, 1}},               // 25
    {{.3416,-.4472,0},{.3416,-.4472,0,1},{1, 1}},               // 15
    
    {{0,-1,0},{0,-1,0,1},{0, 0}},                               // 31
    {{.1056,-.4472,-.3249},{.1056,-.4472,-.3249,1},{0, 1}},     // 17
    {{.3416,-.4472,0},{.3416,-.4472,0,1},{1, 1}},               // 15
    
    {{.7236,-.4472,.5257},{.7236,-.4472,.5257,1},{0, 0}},       // 13
    {{.3416,-.4472,0},{.3416,-.4472,0,1},{0, 1}},               // 15
    {{.5527,-.1058,0},{.5527,-.1058,0,1},{1, 1}},               // 25
    
    {{.8944,.4472,0}, {.8944,.4472,0, 1},{0, 0}},               // 0
    {{.4471,.1058,-.3249},{.4471,.1058,-.3249,1},{0, 1}},       // 24
    {{.5527,-.1058,0},{.5527,-.1058,0,1},{1, 1}},               // 25
    
    {{.2764,.4472,-.8506},{.2764,.4472,-.8506,1},{0, 0}},       // 2
    {{.4471,.1058,-.3249},{.4471,.1058,-.3249,1},{0, 1}},       // 24
    {{.1708,-.1058,-.5527},{.1708,-.1058,-.5527,1},{1, 1}},     // 27
    
    {{-.2764,-.4472,-.8506},{-.2764,-.4472,-.8506,1},{0, 0}},   // 12
    {{.1708,-.1058,-.5527},{.1708,-.1058,-.5527,1},{0, 1}},     // 27
    {{.1056,-.4472,-.3249},{.1056,-.4472,-.3249,1},{1, 1}}     // 17
};
const GLubyte Indices[] = {
    0,1,2,  3,4,5,  6,7,8,  9,10,11,    12,13,14,
    15,16,17,   18,19,20,   21,22,23,   24,25,26,   27,28,29,
    30,31,32,   33,34,35,   36,37,38,   39,40,41,   42,43,44,
    45,46,47,   48,49,50,   51,52,53,   54,55,56,   57,58,59,
    60,61,62,   63,64,65,   66,67,68,   69,70,71,   72,73,74,
    75,76,77,   78,79,80,   81,82,83,   84,85,86,   87,88,89,
    90,91,92,   93,94,95,   96,97,98,   99,100,101, 102,103,104,
    105,106,107,    108,109,110,    111,112,113,    114,115,116,    117,118,119,
    120,121,122,    123,124,125,    126,127,128,    129,130,131,    132,133,134,
    135,136,137,    138,139,140,    141,142,143,    144,145,146,    147,148,149,
    150,151,152,    153,154,155,    156,157,158,    159,160,161,    162,163,164,
    165,166,167,    168,169,170,    171,172,173,    174,175,176,    177,178,179
};

@implementation openglView

+ (Class)layerClass;{
    return [CAEAGLLayer class];
}


- (void)setupLayer {
    _eaglLayer = (CAEAGLLayer*) self.layer;
    _eaglLayer.opaque = YES;
}

- (void)setupContext {
    EAGLRenderingAPI api = kEAGLRenderingAPIOpenGLES2;
    _context = [[EAGLContext alloc] initWithAPI:api];
    if (!_context) {
        NSLog(@"Failed to initialize OpenGLES 2.0 context");
        exit(1);
    }
    
    if (![EAGLContext setCurrentContext:_context]) {
        NSLog(@"Failed to set current OpenGL context");
        exit(1);
    }
}

- (void)setupRenderBuffer {
    glGenRenderbuffers(1, &_colorRenderBuffer);
    glBindRenderbuffer(GL_RENDERBUFFER, _colorRenderBuffer);
    [_context renderbufferStorage:GL_RENDERBUFFER fromDrawable:_eaglLayer];
}

- (void)setupDepthBuffer {
    glGenRenderbuffers(1, &_depthRenderBuffer);
    glBindRenderbuffer(GL_RENDERBUFFER, _depthRenderBuffer);
    glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH_COMPONENT16, self.frame.size.width, self.frame.size.height);
}

- (void)setupFrameBuffer {
    GLuint framebuffer;
    glGenFramebuffers(1, &framebuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, framebuffer);
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0,
                              GL_RENDERBUFFER, _colorRenderBuffer);
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, _depthRenderBuffer);
}
/*
- (void) drawCylinder {
    int i, j, k;
    // sides
    glBegin(GL_TRIANGLE_STRIP);
    for (j=0;j<=360;j+=DEF_D) {
        glColor3f(1.0,1.0,0.0);
        glVertex3f(Cos(j),+1,Sin(j));
        glColor3f(0.0,1.0,0.0);
        glVertex3f(Cos(j),-1,Sin(j));
    }
    glEnd();
    
    // top and bottom circles
    // reuse the currentTexture on top and bottom)
    for (i=1;i>=-1;i-=2) {
        glBegin(GL_TRIANGLE_FAN);
        glColor3f(0.0,0.0,1.0);
        glVertex3f(0,i,0);
        for (k=0;k<=360;k+=DEF_D) {
            glColor3f(1.0,0.0,0.0);
            glVertex3f(i*Cos(k),i,Sin(k));
        }
        glEnd();
    }
}
*/


- (void)render:(CADisplayLink*)displayLink{
    glClearColor(0.9, 0.9, 0.9, 1.0);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glEnable(GL_DEPTH_TEST);
    
    CC3GLMatrix *projection = [CC3GLMatrix matrix];
    float h = 4.0f * self.frame.size.height / self.frame.size.width;
    [projection populateFromFrustumLeft:-2 andRight:2 andBottom:-h/2 andTop:h/2 andNear:4 andFar:10];
    glUniformMatrix4fv(_projectionUniform, 1, 0, projection.glMatrix);
    
    CC3GLMatrix *modelView = [CC3GLMatrix matrix];
    [modelView populateFromTranslation:CC3VectorMake(sin(CACurrentMediaTime()), 0, -7)];
    _currentRotation += displayLink.duration * 90;

    _currentRotationY += (currentTouchPosition.x - startTouchPosition.x) * 0.1;
    _currentRotationX += (currentTouchPosition.y - startTouchPosition.y) * 0.1;
    _currentRotationX = fmodf(_currentRotationX, 360.0);
    _currentRotationY = fmodf(_currentRotationY, 360.0);
    
    //NSLog(@"%f, %f",_currentRotationX, _currentRotationY);
    [modelView rotateBy:CC3VectorMake( _currentRotationX, _currentRotationY, 0)];
    [modelView scaleBy: CC3VectorMake(_scale1, _scale1, _scale1)];
    glUniformMatrix4fv(_modelViewUniform, 1, 0, modelView.glMatrix);
    
    // 1
    glViewport(0, 0, self.frame.size.width, self.frame.size.height);
    
    glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _indexBuffer);
    
    // 2
    glVertexAttribPointer(_positionSlot, 3, GL_FLOAT, GL_FALSE,
                          sizeof(Vertex), 0);
    
    glVertexAttribPointer(_colorSlot, 4, GL_FLOAT, GL_FALSE,
                          sizeof(Vertex), (GLvoid*) (sizeof(float) * 3));
    // texture
    glVertexAttribPointer(_texCoordSlot, 2, GL_FLOAT, GL_FALSE,
                          sizeof(Vertex), (GLvoid*) (sizeof(float) * 7));
    
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, _floorTexture);
    glUniform1i(_textureUniform, 0);
    // 3
    glDrawElements(GL_TRIANGLES, sizeof(Indices)/sizeof(Indices[0]),
                   GL_UNSIGNED_BYTE, 0);
    
    [_context presentRenderbuffer:GL_RENDERBUFFER];
}


- (GLuint)compileShader:(NSString*)shaderName withType:(GLenum)shaderType {
    
    // 1
    NSString* shaderPath = [[NSBundle mainBundle] pathForResource:shaderName
                                                           ofType:@"glsl"];
    NSError* error;
    NSString* shaderString = [NSString stringWithContentsOfFile:shaderPath
                                                       encoding:NSUTF8StringEncoding error:&error];
    if (!shaderString) {
        NSLog(@"Error loading shader: %@", error.localizedDescription);
        exit(1);
    }
    
    // 2
    GLuint shaderHandle = glCreateShader(shaderType);
    
    // 3
    const char * shaderStringUTF8 = [shaderString UTF8String];
    int shaderStringLength = [shaderString length];
    glShaderSource(shaderHandle, 1, &shaderStringUTF8, &shaderStringLength);
    
    // 4
    glCompileShader(shaderHandle);
    
    // 5
    GLint compileSuccess;
    glGetShaderiv(shaderHandle, GL_COMPILE_STATUS, &compileSuccess);
    if (compileSuccess == GL_FALSE) {
        GLchar messages[256];
        glGetShaderInfoLog(shaderHandle, sizeof(messages), 0, &messages[0]);
        NSString *messageString = [NSString stringWithUTF8String:messages];
        NSLog(@"%@", messageString);
        exit(1);
    }
    
    return shaderHandle;
    
}

- (void)compileShaders {
    
    // 1
    GLuint vertexShader = [self compileShader:@"SimpleVertex"
                                     withType:GL_VERTEX_SHADER];
    GLuint fragmentShader = [self compileShader:@"SimpleFragment"
                                       withType:GL_FRAGMENT_SHADER];
    
    // 2
    GLuint programHandle = glCreateProgram();
    glAttachShader(programHandle, vertexShader);
    glAttachShader(programHandle, fragmentShader);
    glLinkProgram(programHandle);
    
    // 3
    GLint linkSuccess;
    glGetProgramiv(programHandle, GL_LINK_STATUS, &linkSuccess);
    if (linkSuccess == GL_FALSE) {
        GLchar messages[256];
        glGetProgramInfoLog(programHandle, sizeof(messages), 0, &messages[0]);
        NSString *messageString = [NSString stringWithUTF8String:messages];
        NSLog(@"%@", messageString);
        exit(1);
    }
    
    // 4
    glUseProgram(programHandle);
    
    // 5
    _positionSlot = glGetAttribLocation(programHandle, "Position");
    _colorSlot = glGetAttribLocation(programHandle, "SourceColor");
    glEnableVertexAttribArray(_positionSlot);
    glEnableVertexAttribArray(_colorSlot);
    _projectionUniform = glGetUniformLocation(programHandle, "Projection");
    _modelViewUniform = glGetUniformLocation(programHandle, "Modelview");
    
    _texCoordSlot = glGetAttribLocation(programHandle, "TexCoordIn");
    glEnableVertexAttribArray(_texCoordSlot);
    _textureUniform = glGetUniformLocation(programHandle, "Texture");
}

- (void)setupVBOs {
    
    glGenBuffers(1, &_vertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(Vertices), Vertices, GL_STATIC_DRAW);
    
    glGenBuffers(1, &_indexBuffer);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _indexBuffer);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(Indices), Indices, GL_STATIC_DRAW);
    
    /*
    glGenBuffers(1, &_vertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(Vertices2), Vertices2, GL_STATIC_DRAW);
    
    glGenBuffers(1, &_indexBuffer);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _indexBuffer);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(Indices2), Indices2, GL_STATIC_DRAW);
     */
}

- (void)setupDisplayLink {
    CADisplayLink* displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(render:)];
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

/* gesture detection and recognition BEGIN */

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *aTouch = [touches anyObject];
    currentTouchPosition = [aTouch locationInView:self];
    startTouchPosition = [aTouch previousLocationInView:self];
    
    [self setupDisplayLink];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    startTouchPosition = CGPointZero;
    currentTouchPosition = CGPointZero;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    
    startTouchPosition = CGPointZero;
    currentTouchPosition = CGPointZero;
}

- (IBAction) respondsToSingleTapGesture:(UITapGestureRecognizer *)recognizer {
    NSLog(@"single tab");
}

- (IBAction)respondsToPinchGesture:(UIPinchGestureRecognizer *)recognizer {
    if (recognizer.scale < 1.0)
    {
        _scale1 *= 0.9;
        _scale1 = _scale1 > 1.0? _scale1 : 1.0;
    }
    else
    {
        _scale1 *= 1.1;
        _scale1 = _scale1 < 3.0? _scale1 : 3.0;
    }
    NSLog(@"pinch gesture");
}

/* gesture detection and recognition END */

// Texture handling
- (GLuint)setupTexture:(NSString *)fileName {
    // 1
    CGImageRef spriteImage = [UIImage imageNamed:fileName].CGImage;
    if (!spriteImage) {
        NSLog(@"Failed to load image %@", fileName);
        exit(1);
    }
    
    // 2
    size_t width = CGImageGetWidth(spriteImage);
    size_t height = CGImageGetHeight(spriteImage);
    
    GLubyte * spriteData = (GLubyte *) calloc(width*height*4, sizeof(GLubyte));
    
    CGContextRef spriteContext = CGBitmapContextCreate(spriteData, width, height, 8, width*4,
                                            CGImageGetColorSpace(spriteImage), kCGImageAlphaPremultipliedLast);
    
    // 3
    CGContextDrawImage(spriteContext, CGRectMake(0, 0, width, height), spriteImage);
    
    CGContextRelease(spriteContext);
    
    // 4
    GLuint texName;
    glGenTextures(1, &texName);
    glBindTexture(GL_TEXTURE_2D, texName);
    
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, spriteData);
    
    free(spriteData);        
    return texName;    
}

// Initiate and set up
- (id)initWithFrame:(CGRect)frame
{
    self.userInteractionEnabled = YES;
    _scale1 = 1.5;
    self = [super initWithFrame:frame];
    
    UITapGestureRecognizer *singletapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToSingleTapGesture:)];
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToPinchGesture:)];
    // Specify that the gesture must be a single tap
    singletapRecognizer.numberOfTapsRequired = 1;
    
    // Add the tap gesture recognizer to the view
    [self addGestureRecognizer:singletapRecognizer];
    [self addGestureRecognizer:pinchRecognizer];
    
    if (self) {
        [self setupLayer];
        [self setupContext];
        [self setupDepthBuffer];
        [self setupRenderBuffer];
        [self setupFrameBuffer];
        [self compileShaders];
        [self setupVBOs];
        [self setupDisplayLink];
        //[self render];
        _floorTexture = [self setupTexture:@"bubble-dropper.jpg"];
    }
    return self;
}

// Replace dealloc method with this
- (void)dealloc
{
    [_context release];
    _context = nil;
    [super dealloc];
}

@end
