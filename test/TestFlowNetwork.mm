//
//  TestNetworkClasses.m
//  TestFastEMD
//
//  Created by Till Hainbach on 25.03.20.
//  Copyright © 2020 Till Hainbach. All rights reserved.
//

#import <XCTest/XCTest.h>
#include <iostream>
#include "FlowNetwork.hpp"
#include "CostNetwork.hpp"
#include "utils/utils.h"

@interface TestFlowNetwork : XCTestCase

@end

@implementation TestFlowNetwork

std::string const targetString = R"(Flow Network:
vertex: [to : cost : flow]
0: [27 : 1414 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
1: [27 : 1000 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
2: [27 : 1414 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
3: [27 : 2236 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
4: [27 : 1000 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
5: [27 : 1000 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
6: [27 : 2000 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
7: [27 : 1414 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
8: [27 : 1000 : 0] [28 : 2828 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
9: [27 : 1414 : 0] [28 : 2236 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
10: [27 : 2236 : 0] [28 : 2000 : 0] [29 : 2828 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
11: [28 : 2236 : 0] [29 : 2236 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
12: [28 : 2828 : 0] [29 : 2000 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
13: [27 : 2236 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
14: [27 : 2000 : 0] [28 : 2236 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
15: [27 : 2236 : 0] [28 : 1414 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
16: [27 : 2828 : 0] [28 : 1000 : 0] [29 : 2236 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
17: [28 : 1414 : 0] [29 : 1414 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
18: [28 : 2236 : 0] [29 : 1000 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
19: [28 : 2000 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
20: [28 : 1000 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
21: [28 : 1000 : 0] [29 : 1000 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
22: [28 : 2236 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
23: [28 : 1414 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
24: [28 : 1000 : 0] [29 : 2236 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
25: [28 : 1414 : 0] [29 : 1414 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
26: [28 : 2236 : 0] [29 : 1000 : 0] [30 : 0 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
27: [0 : -1414 : 0] [1 : -1000 : 0] [2 : -1414 : 0] [3 : -2236 : 0] [4 : -1000 : 0] [5 : -1000 : 0] [6 : -2000 : 0] [7 : -1414 : 0] [8 : -1000 : 0] [9 : -1414 : 0] [10 : -2236 : 0] [13 : -2236 : 0] [14 : -2000 : 0] [15 : -2236 : 0] [16 : -2828 : 0] [31 : 3001 : 0] [30 : -3000 : 0] [31 : -3001 : 0]
28: [8 : -2828 : 0] [9 : -2236 : 0] [10 : -2000 : 0] [11 : -2236 : 0] [12 : -2828 : 0] [14 : -2236 : 0] [15 : -1414 : 0] [16 : -1000 : 0] [17 : -1414 : 0] [18 : -2236 : 0] [19 : -2000 : 0] [20 : -1000 : 0] [21 : -1000 : 0] [22 : -2236 : 0] [23 : -1414 : 0] [24 : -1000 : 0] [25 : -1414 : 0] [26 : -2236 : 0] [31 : 3001 : 0] [30 : -3000 : 0] [31 : -3001 : 0]
29: [10 : -2828 : 0] [11 : -2236 : 0] [12 : -2000 : 0] [16 : -2236 : 0] [17 : -1414 : 0] [18 : -1000 : 0] [21 : -1000 : 0] [24 : -2236 : 0] [25 : -1414 : 0] [26 : -1000 : 0] [31 : 3001 : 0] [30 : -3000 : 0] [31 : -3001 : 0]
30: [0 : 0 : 0] [1 : 0 : 0] [2 : 0 : 0] [3 : 0 : 0] [4 : 0 : 0] [5 : 0 : 0] [6 : 0 : 0] [7 : 0 : 0] [8 : 0 : 0] [9 : 0 : 0] [10 : 0 : 0] [11 : 0 : 0] [12 : 0 : 0] [13 : 0 : 0] [14 : 0 : 0] [15 : 0 : 0] [16 : 0 : 0] [17 : 0 : 0] [18 : 0 : 0] [19 : 0 : 0] [20 : 0 : 0] [21 : 0 : 0] [22 : 0 : 0] [23 : 0 : 0] [24 : 0 : 0] [25 : 0 : 0] [26 : 0 : 0] [27 : 3000 : 0] [28 : 3000 : 0] [29 : 3000 : 0] [31 : 3001 : 0] [31 : -3001 : 0]
31: [0 : -3001 : 0] [1 : -3001 : 0] [2 : -3001 : 0] [3 : -3001 : 0] [4 : -3001 : 0] [5 : -3001 : 0] [6 : -3001 : 0] [7 : -3001 : 0] [8 : -3001 : 0] [9 : -3001 : 0] [10 : -3001 : 0] [11 : -3001 : 0] [12 : -3001 : 0] [13 : -3001 : 0] [14 : -3001 : 0] [15 : -3001 : 0] [16 : -3001 : 0] [17 : -3001 : 0] [18 : -3001 : 0] [19 : -3001 : 0] [20 : -3001 : 0] [21 : -3001 : 0] [22 : -3001 : 0] [23 : -3001 : 0] [24 : -3001 : 0] [25 : -3001 : 0] [26 : -3001 : 0] [27 : -3001 : 0] [28 : -3001 : 0] [29 : -3001 : 0] [30 : -3001 : 0] [0 : 3001 : 0] [1 : 3001 : 0] [2 : 3001 : 0] [3 : 3001 : 0] [4 : 3001 : 0] [5 : 3001 : 0] [6 : 3001 : 0] [7 : 3001 : 0] [8 : 3001 : 0] [9 : 3001 : 0] [10 : 3001 : 0] [11 : 3001 : 0] [12 : 3001 : 0] [13 : 3001 : 0] [14 : 3001 : 0] [15 : 3001 : 0] [16 : 3001 : 0] [17 : 3001 : 0] [18 : 3001 : 0] [19 : 3001 : 0] [20 : 3001 : 0] [21 : 3001 : 0] [22 : 3001 : 0] [23 : 3001 : 0] [24 : 3001 : 0] [25 : 3001 : 0] [26 : 3001 : 0] [27 : 3001 : 0] [28 : 3001 : 0] [29 : 3001 : 0] [30 : 3001 : 0]
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

- (void)testArrayFlowFill{
    typedef FastEMD::types::ARRAY INTERFACE;
    static const unsigned int SIZE = 80;
    FastEMD::CostNetwork<int, INTERFACE, SIZE> cost(costVector);
    FastEMD::FlowNetwork<int, INTERFACE, SIZE> flow(cost.size());
    FastEMD::Counter<int,  INTERFACE, SIZE> counter(cost.size(), "counter", true);
    flow.fill(cost, counter);
    
    std::stringstream flowStringStream;
    flowStringStream << flow;
    std::string flowString(flowStringStream.str());
    FastEMD::utils::showStringInequality(flowString, targetString);
    
    XCTAssert(flowString == targetString);
}

- (void)testVectorFlowFill{
    typedef FastEMD::types::VECTOR INTERFACE;
    static const unsigned int SIZE = 80;
    FastEMD::CostNetwork<int, INTERFACE, SIZE> const cost(costVector);
    FastEMD::FlowNetwork<int, INTERFACE, SIZE> flow(cost.size());
    FastEMD::Counter<int,  INTERFACE, SIZE> counter(cost.size(), "counter", true);
    flow.fill(cost, counter);
    
    std::stringstream flowStringStream;
    flowStringStream << flow;
    std::string flowString(flowStringStream.str());
    FastEMD::utils::showStringInequality(flowString, targetString);

    XCTAssert(flowString == targetString);
}

- (void)testOpenCVFlowFill{
    typedef FastEMD::types::OPENCV INTERFACE;
    static const unsigned int SIZE = 80;
    FastEMD::CostNetwork<int, INTERFACE, SIZE> const cost(costVector);
    FastEMD::FlowNetwork<int, INTERFACE, SIZE> flow(cost.size());
    FastEMD::Counter<int,  INTERFACE, SIZE> counter(cost.size(), "counter", true);

    flow.fill(cost, counter);

    std::stringstream flowStringStream;
    flowStringStream << flow;
    std::string flowString(flowStringStream.str());
    FastEMD::utils::showStringInequality(flowString, targetString);

    XCTAssert(flowString == targetString);
}

@end
