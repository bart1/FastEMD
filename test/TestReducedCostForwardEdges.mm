//
//  TestReducedCostForwardEdges.m
//  TestFastEMD
//
//  Created by Till Hainbach on 01.04.20.
//  Copyright © 2020 Till Hainbach. All rights reserved.
//

#import <XCTest/XCTest.h>
#include <iostream>
#include "ReducedCostsForwardEdgesNetwork.hpp"
#include "CostNetwork.hpp"
#include "utils/utils.h"

@interface TestReducedCostForwardEdges : XCTestCase

@end

@implementation TestReducedCostForwardEdges

std::string const targetString = R"(Reduced Costs For Forward Edges Network:
vertex: [to : reduced cost]
0: [27 : 1414] [30 : 0] [31 : 3001]
1: [27 : 1000] [30 : 0] [31 : 3001]
2: [27 : 1414] [30 : 0] [31 : 3001]
3: [27 : 2236] [30 : 0] [31 : 3001]
4: [27 : 1000] [30 : 0] [31 : 3001]
5: [27 : 1000] [30 : 0] [31 : 3001]
6: [27 : 2000] [30 : 0] [31 : 3001]
7: [27 : 1414] [30 : 0] [31 : 3001]
8: [27 : 1000] [28 : 2828] [30 : 0] [31 : 3001]
9: [27 : 1414] [28 : 2236] [30 : 0] [31 : 3001]
10: [27 : 2236] [28 : 2000] [29 : 2828] [30 : 0] [31 : 3001]
11: [28 : 2236] [29 : 2236] [30 : 0] [31 : 3001]
12: [28 : 2828] [29 : 2000] [30 : 0] [31 : 3001]
13: [27 : 2236] [30 : 0] [31 : 3001]
14: [27 : 2000] [28 : 2236] [30 : 0] [31 : 3001]
15: [27 : 2236] [28 : 1414] [30 : 0] [31 : 3001]
16: [27 : 2828] [28 : 1000] [29 : 2236] [30 : 0] [31 : 3001]
17: [28 : 1414] [29 : 1414] [30 : 0] [31 : 3001]
18: [28 : 2236] [29 : 1000] [30 : 0] [31 : 3001]
19: [28 : 2000] [30 : 0] [31 : 3001]
20: [28 : 1000] [30 : 0] [31 : 3001]
21: [28 : 1000] [29 : 1000] [30 : 0] [31 : 3001]
22: [28 : 2236] [30 : 0] [31 : 3001]
23: [28 : 1414] [30 : 0] [31 : 3001]
24: [28 : 1000] [29 : 2236] [30 : 0] [31 : 3001]
25: [28 : 1414] [29 : 1414] [30 : 0] [31 : 3001]
26: [28 : 2236] [29 : 1000] [30 : 0] [31 : 3001]
27: [31 : 3001]
28: [31 : 3001]
29: [31 : 3001]
30: [27 : 3000] [28 : 3000] [29 : 3000] [31 : 3001]
31: [0 : 3001] [1 : 3001] [2 : 3001] [3 : 3001] [4 : 3001] [5 : 3001] [6 : 3001] [7 : 3001] [8 : 3001] [9 : 3001] [10 : 3001] [11 : 3001] [12 : 3001] [13 : 3001] [14 : 3001] [15 : 3001] [16 : 3001] [17 : 3001] [18 : 3001] [19 : 3001] [20 : 3001] [21 : 3001] [22 : 3001] [23 : 3001] [24 : 3001] [25 : 3001] [26 : 3001] [27 : 3001] [28 : 3001] [29 : 3001] [30 : 3001]
)";

std::vector< std::vector<int> > const costVector ({{27, 1414, 30, 0, 31, 3001},
{27, 1000, 30, 0, 31, 3001},
{27, 1414, 30, 0, 31, 3001},
{27, 2236, 30, 0, 31, 3001},
{27, 1000, 30, 0, 31, 3001},
{27, 1000, 30, 0, 31, 3001},
{27, 2000, 30, 0, 31, 3001},
{27, 1414, 30, 0, 31, 3001},
{27, 1000, 28, 2828, 30, 0, 31, 3001},
{27, 1414, 28, 2236, 30, 0, 31, 3001},
{27, 2236, 28, 2000, 29, 2828, 30, 0, 31, 3001},
{28, 2236, 29, 2236, 30, 0, 31, 3001},
{28, 2828, 29, 2000, 30, 0, 31, 3001},
{27, 2236, 30, 0, 31, 3001},
{27, 2000, 28, 2236, 30, 0, 31, 3001},
{27, 2236, 28, 1414, 30, 0, 31, 3001},
{27, 2828, 28, 1000, 29, 2236, 30, 0, 31, 3001},
{28, 1414, 29, 1414, 30, 0, 31, 3001},
{28, 2236, 29, 1000, 30, 0, 31, 3001},
{28, 2000, 30, 0, 31, 3001},
{28, 1000, 30, 0, 31, 3001},
{28, 1000, 29, 1000, 30, 0, 31, 3001},
{28, 2236, 30, 0, 31, 3001},
{28, 1414, 30, 0, 31, 3001},
{28, 1000, 29, 2236, 30, 0, 31, 3001},
{28, 1414, 29, 1414, 30, 0, 31, 3001},
{28, 2236, 29, 1000, 30, 0, 31, 3001},
{31, 3001},
{31, 3001},
{31, 3001},
{27, 3000, 28, 3000, 29, 3000, 31, 3001},
{0, 3001, 1, 3001, 2, 3001, 3, 3001, 4, 3001, 5, 3001, 6, 3001, 7, 3001, 8, 3001, 9, 3001, 10, 3001, 11, 3001, 12, 3001, 13, 3001, 14, 3001, 15, 3001, 16, 3001, 17, 3001, 18, 3001, 19, 3001, 20, 3001, 21, 3001, 22, 3001, 23, 3001, 24, 3001, 25, 3001, 26, 3001, 27, 3001, 28, 3001, 29, 3001, 30, 3001}
});

- (void)testArrayReducedCostForwardEdgesFill {
    typedef FastEMD::types::ARRAY INTERFACE;
    static const unsigned int SIZE = 80;
    FastEMD::CostNetwork<int, INTERFACE, SIZE> cost(costVector);
    FastEMD::ReducedCostsForwardEdgesNetwork<int, INTERFACE, SIZE> forwardEdges(cost.size());
    FastEMD::Counter<int,  INTERFACE, SIZE> counter(cost.size(), "counter", true);
    forwardEdges.fill(cost);
    
    std::stringstream forwardEdgesStringStream;
    forwardEdgesStringStream << forwardEdges;
    std::string forwardEdgesString(forwardEdgesStringStream.str());
    FastEMD::utils::showStringInequality(forwardEdgesString, targetString);
    
    XCTAssert(forwardEdgesString == targetString);
}

- (void)testVectorReducedCostForwardEdgesFill {
    typedef FastEMD::types::VECTOR INTERFACE;
    static const unsigned int SIZE = 80;
    FastEMD::CostNetwork<int, INTERFACE, SIZE> const cost(costVector);
    FastEMD::ReducedCostsForwardEdgesNetwork<int, INTERFACE, SIZE> forwardEdges(cost.size());
    FastEMD::Counter<int,  INTERFACE, SIZE> counter(cost.size(), "counter", true);
    forwardEdges.fill(cost);
    
    std::stringstream forwardEdgesStringStream;
    forwardEdgesStringStream << forwardEdges;
    std::string forwardEdgesString(forwardEdgesStringStream.str());
    FastEMD::utils::showStringInequality(forwardEdgesString, targetString);

    XCTAssert(forwardEdgesString == targetString);
}

- (void)testOpenCVReducedCostForwardEdgesFill {
    typedef FastEMD::types::OPENCV INTERFACE;
    static const unsigned int SIZE = 80;
    FastEMD::CostNetwork<int, INTERFACE, SIZE> const cost(costVector);
    FastEMD::ReducedCostsForwardEdgesNetwork<int, INTERFACE, SIZE> forwardEdges(cost.size());
    FastEMD::Counter<int,  INTERFACE, SIZE> counter(cost.size(), "counter", true);

    forwardEdges.fill(cost);

    std::stringstream forwardEdgesStringStream;
    forwardEdgesStringStream << forwardEdges;
    std::string forwardEdgesString(forwardEdgesStringStream.str());
    FastEMD::utils::showStringInequality(forwardEdgesString, targetString);

    XCTAssert(forwardEdgesString == targetString);
}


@end
