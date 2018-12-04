//
//  ViewController.m
//  XZBinaryTree
//
//  Created by kkxz on 2018/10/17.
//  Copyright © 2018年 kkxz. All rights reserved.
//

#import "ViewController.h"
#import "BinaryTreeNode.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //二叉树调用
    //二叉排序树生成
    NSArray * arr = @[@7,@6,@3,@2,@1,@9,@10,@12,@14,@4,@16];
    BinaryTreeNode * tree = [BinaryTreeNode new];
    tree = [BinaryTreeNode createTreeWithValues:arr];
    NSLog(@"二叉排序树：%@",tree);
    
    // 二叉树中某个位置的节点（按层次遍历）
    BinaryTreeNode * tree1 = [BinaryTreeNode treeNodeAtIndex:3 inTree:tree];
    NSLog(@"二叉树中某个位置的节点：%@",tree1);
    
    //先序遍历,先访问根，再访问左子树，再访问右子树，典型递归思想
    NSMutableArray * orderArray = [NSMutableArray array];
    [BinaryTreeNode preOrderTraverseTree:tree handler:^(BinaryTreeNode * _Nonnull treeNode) {
        [orderArray addObject:@(treeNode.value)];
    }];
    NSLog(@"先序遍历结果：%@",[orderArray componentsJoinedByString:@","]);//7,6,3,2,1,4,9,10,12,14,16
    
    //中序遍历，先遍历左子树，再访问根，再遍历右子树
    NSMutableArray * orderArray1 = [NSMutableArray array];
    [BinaryTreeNode inOrderTraverseTree:tree handler:^(BinaryTreeNode * _Nonnull treeNode) {
        [orderArray1 addObject:@(treeNode.value)];
    }];
    NSLog(@"中序遍历结果：%@",[orderArray1 componentsJoinedByString:@","]);//1,2,3,4,6,7,9,10,12,14,16
    
    //后序遍历，先遍历左子树，再遍历右子树，再访问根
    NSMutableArray * orderArray2 = [NSMutableArray array];
    [BinaryTreeNode postOrderTraverseTree:tree handler:^(BinaryTreeNode * _Nonnull treeNode) {
        [orderArray2 addObject:@(treeNode.value)];
    }];
    NSLog(@"后序遍历结果：%@",[orderArray2 componentsJoinedByString:@","]);//1,2,4,3,6,16,14,12,10,9,7
    
    //层次遍历 广度优先
    NSMutableArray * orderArray3 = [NSMutableArray array];
    [BinaryTreeNode levelTraverseTree:tree handler:^(BinaryTreeNode * _Nonnull treeNode) {
        [orderArray3 addObject:@(treeNode.value)];
    }];
    NSLog(@"层次遍历结果：%@",[orderArray3 componentsJoinedByString:@","]);//7,6,9,3,10,2,4,12,1,14,14
    
    //翻转二叉树（递归方式）
    BinaryTreeNode * invertTree = [BinaryTreeNode new];
    invertTree = [BinaryTreeNode invertBinaryTree:tree];
    NSLog(@"递归方式翻转二叉树：%@",invertTree);
    
    //先序遍历,先访问根，再访问左子树，再访问右子树，典型递归思想
    NSMutableArray * invertArray = [NSMutableArray array];
    [BinaryTreeNode preOrderTraverseTree:invertTree handler:^(BinaryTreeNode * _Nonnull treeNode) {
        [invertArray addObject:@(treeNode.value)];
    }];
    NSLog(@"翻转二叉树-先序遍历结果：%@",[invertArray componentsJoinedByString:@","]);//7,9,10,12,14,16,6,3,4,2,1

    //中序遍历，先遍历左子树，再访问根，再遍历右子树
    NSMutableArray * invertArray1 = [NSMutableArray array];
    [BinaryTreeNode inOrderTraverseTree:invertTree handler:^(BinaryTreeNode * _Nonnull treeNode) {
        [invertArray1 addObject:@(treeNode.value)];
    }];
    NSLog(@"翻转二叉树-中序遍历结果：%@",[invertArray1 componentsJoinedByString:@","]);//16,14,12,10,9,7,6,4,3,2,1

    //后序遍历，先遍历左子树，再遍历右子树，再访问根
    NSMutableArray * invertArray2 = [NSMutableArray array];
    [BinaryTreeNode postOrderTraverseTree:invertTree handler:^(BinaryTreeNode * _Nonnull treeNode) {
        [invertArray2 addObject:@(treeNode.value)];
    }];
    NSLog(@"翻转二叉树-后序遍历结果：%@",[invertArray2 componentsJoinedByString:@","]);//16,14,12,10,9,4,1,2,3,6,7

    //层次遍历 广度优先
    NSMutableArray * invertArray3 = [NSMutableArray array];
    [BinaryTreeNode levelTraverseTree:invertTree handler:^(BinaryTreeNode * _Nonnull treeNode) {
        [invertArray3 addObject:@(treeNode.value)];
    }];
    NSLog(@"翻转二叉树-层次遍历结果：%@",[invertArray3 componentsJoinedByString:@","]);//7,9,6,10,3,12,4,2,14,1,16
    
    //翻转二叉树（非递归方式）
    NSArray * arr2 = @[@7,@6,@3,@2,@1,@9,@10,@12,@14,@4,@16];
    BinaryTreeNode * tree2 = [BinaryTreeNode new];
    tree2 = [BinaryTreeNode createTreeWithValues:arr2];
    NSLog(@"二叉排序树：%@",tree2);
    BinaryTreeNode * notInvertTree = [BinaryTreeNode new];
    notInvertTree = [BinaryTreeNode invertBinaryTreeNot:tree2];
    NSLog(@"非递归-翻转二叉树：%@",notInvertTree);
    
    //二叉树深度
    NSInteger treeDepth = [BinaryTreeNode depthOfTree:notInvertTree];
    NSLog(@"二叉树深度：%ld",treeDepth);
    
    //当前二叉树宽度
    NSInteger treeWidth = [BinaryTreeNode widthOfTree:notInvertTree];
    NSLog(@"二叉树宽度：%ld",treeWidth);
    
    //二叉树总节点数
    NSInteger totalNode = [BinaryTreeNode numberOfNodesInTree:notInvertTree];
    NSLog(@"二叉树总节点数：%ld",totalNode);
    
    //二叉树某层节点数
    NSInteger levelNode = [BinaryTreeNode numberOfNodesOnLevel:4 inTree:notInvertTree];
    NSLog(@"二叉树第4层节点数：%ld",levelNode);
    
    //二叉树叶子节点数
    NSInteger treeLeafs = [BinaryTreeNode numberOfLeafsInTree:notInvertTree];
    NSLog(@"二叉树叶子节点数：%ld",treeLeafs);
    
    //二叉树最大距离（直径）
    NSInteger treeDistance = [BinaryTreeNode maxDistanceOfTree:notInvertTree];
     NSLog(@"二叉树最大距离（直径）：%ld",treeDistance);
    
    //二叉树是否为满二叉树
    BOOL isFull = [BinaryTreeNode isFullBinaryTree:notInvertTree];
    NSString * str = isFull ? @"满二叉树":@"非满二叉树";
    NSLog(@"%@",str);
    
    //二叉树是否为平衡二叉树
    BOOL isAVL = [BinaryTreeNode isAVLBinaryTree:notInvertTree];
    str = isAVL ? @"平衡二叉树":@"非平衡二叉树";
    NSLog(@"%@",str);

}


@end
