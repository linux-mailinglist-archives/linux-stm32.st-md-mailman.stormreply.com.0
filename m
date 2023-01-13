Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47909668A36
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jan 2023 04:35:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D5C5C65E55;
	Fri, 13 Jan 2023 03:35:02 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2079.outbound.protection.outlook.com [40.107.21.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82074C65E45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jan 2023 03:35:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQrc4qHkSlxpSIws78NQdNP5GMz87BqRMm4vkVM7xEJAKITmGFi8OL2dUTKN7JAfhI9ZpA5Qoe4z2MMm8HDHuvM1oAZUrUd9QxeQHAL5U0UQWlaScFuNg/4BXWMzu7Gm7K/RehD2aADIjHdbdbiUT5p3986qSTHiVHq6gyc7TusIKJay47jPipGlyx9Za460PIUX/gFVS7Qd395mtmPZ0wKoBpHC2ulfZmiK/ic699AKG8WFnLWJ7kUaBGYC0XnPf1uc6BkyR+w8r0hmX/2GhMdWRDxza01FleekrENjAPJPbLn4gVtyMrJ9Rsb+H5hPx/0y83xnEOizneQnJi9H1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IET9tyMod0cGIFgLHsSsai8dRQ7jHHtxIRGJXSMiZI8=;
 b=eCQCle4HpCnPqK79HuVyoEiZ8Z5f8u7MRlP1Xog3oSVDPMAl1556IXleI/D4WEFlxcHGg1X6PvBXzU/groz+tPHPV9RFt+V4EV/gElbocdfRX8RcqY7+3q8n/5bwF+45LbCrn7B+8VxawQFWRWa90p6007j0+io/9H1ImwPwXFKDBwLfO+cIcoSqDBtCCA3UfeygR14U2f3zua3i0CNVfZIkEcNSa2bNo21JABYogZ+zYOkFeAvDA7/nhCNY+venbqSyYGCJ0v25kVJP1ngTmox3lR0yn/ktpojbekCKNGbOFheUAqfaoJ+6hOyx9SvhfUgHqTY+tkpqrKewhiNJvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IET9tyMod0cGIFgLHsSsai8dRQ7jHHtxIRGJXSMiZI8=;
 b=Fbqs0re7g0NbPjkMLU+M9Sax1d2pu7yGkLJMNUL/Un+IP3c2p5sL856ZkYb+KGFgvYNCjDqENBMIu2j9anpjMXG6DWl7Ejtz0WH7aq5nl3RP5N1i9KkLPXJ9iH+R1GDcHyDH87LBc7GFAu4ZfsJTPKdYcxajdEdp3JVK7Pkb/VM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from HE1PR0402MB2939.eurprd04.prod.outlook.com (2603:10a6:3:db::18)
 by AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 03:34:59 +0000
Received: from HE1PR0402MB2939.eurprd04.prod.outlook.com
 ([fe80::76a3:36aa:1144:616c]) by HE1PR0402MB2939.eurprd04.prod.outlook.com
 ([fe80::76a3:36aa:1144:616c%12]) with mapi id 15.20.5986.019; Fri, 13 Jan
 2023 03:34:59 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: wei.fang@nxp.com, shenwei.wang@nxp.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Date: Fri, 13 Jan 2023 11:33:44 +0800
Message-Id: <20230113033347.264135-5-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113033347.264135-1-xiaoning.wang@nxp.com>
References: <20230113033347.264135-1-xiaoning.wang@nxp.com>
X-ClientProxiedBy: SI2PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::8) To HE1PR0402MB2939.eurprd04.prod.outlook.com
 (2603:10a6:3:db::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2939:EE_|AS8PR04MB8247:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dd1e3ff-b084-495a-5df6-08daf5172556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rPZhxDTRK0oOfiULu5yHYSDjV5aEVFtI2gh784fSe06hhG4hsUkwf4mHK7vgEPCI1MQ+VWCX5DQJ4ZK8az9UyZ+SgAPaR4I+fVCfzAouF6MiQQd6Hsa5XUqYE7JKRWCUkk5klKXusp4/8o0+LW4BJQuiMrceMgzpQRzWUMLf95kqvwaLYnPSmmaGEQu/dj3ZGVn+r/Md2ElvJJq/mJg3JD6gKeiesnSLHHCcaG5e8pSn5imMde7PbuRj+iZnDAWr2l8revl13GTRxSqqwoobFI3h8pzAmJWjWES3xY6QVPlJabRF0nowjuhu++UyrssytsM5RRZVRrXt3yzJSFZSDrU87d9c0k+dizxPaUvD3AFRZAV6bBbws89e4LJ9p0WuBay5MppZTSe5qqK6gt/DST02OS6drxw/ZsDDBkrCjuFE/FmhE3/C5pQGzDCyZZpHhO4oUrYIRVGM5ACuY2cg0KbpbDe9pu/anCRZGnu1iMtBQ1pfwkMYLiV+BcrldXPDlj24L96Y3dt8r4srfL/hY5B+A51640OrT6W5pdNnAa3550tULC9ElwcoyXExxJJpXdpl0/mjZu2yN+k9YTBejkkJzk7x56SveHqAqVVtr2S1Rl0QIio2lTYPPuE9z+fosCaEA2VF418WDcgl2nsiO78s45XFCAZrEmJyP4GqXs+gBEu0mjrCx5UTfu8hwk8z/pANJJ/s2hjDyCLWQ9QfuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0402MB2939.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(451199015)(41300700001)(66556008)(8676002)(66476007)(66946007)(4326008)(5660300002)(7416002)(921005)(316002)(8936002)(2906002)(86362001)(38100700002)(478600001)(6486002)(36756003)(52116002)(38350700002)(6666004)(186003)(26005)(6506007)(1076003)(2616005)(6512007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?66p33hH27Jpj+Fqv3eiZ+mgxFDb3rTu88tWAJ1lKnT2joiwpAgG+5Ngu2dN+?=
 =?us-ascii?Q?tLICF2szM0eKDWwsTWCgdBrPapHwfnQI3aQXVX7h0AEqcK3sontAPJE1NTIl?=
 =?us-ascii?Q?swgx7IKCzQsun/IQPpRk9A9Urave2WaTkugMQuI8lHI64tyWwNTLO1zHwy53?=
 =?us-ascii?Q?XH32SiWFCgAewnP0IrwbAQMM6lpxdcMqtqOB5Skg6KeQgAZEmHUGCkt+k+Ig?=
 =?us-ascii?Q?H2gBNq817+/d9TyxjeVgvCKckPPWPvkQ0kP+0K8hZBmqpyhUrbvG5SmD0y2v?=
 =?us-ascii?Q?uFSV51imbz1x+lBuw2fnARfwuTZHXzG61K1JCrkr2JCg44g+EwoNQIt8WFri?=
 =?us-ascii?Q?BinnLASe3ev5YubnGo0Iq5xc8fkGL86UsmEAd2fWARUDAIvrp0I0WU6d+dnD?=
 =?us-ascii?Q?jUpMijhMDAiwsQn3TfrRxwi7dAU3vSTENDLoctMccnAFxAqDFz4rabJ81Y2J?=
 =?us-ascii?Q?6KXn42RrJvNibYOie3PDQjEBtmHypKH0p8PaGxHUSxG+aFZbmcUCJzshv6W/?=
 =?us-ascii?Q?n0aBP45CQduyv6W9p8KJ7e6mLa8HeMagIuD8KJhF+dLbX0o8+rYRHV3QLe8d?=
 =?us-ascii?Q?LfNXsy0Q6JI677PCsaOR0y+biDHm6LT+17DJyKHfZzQRlK+G/NdLlPldG2PN?=
 =?us-ascii?Q?7cdBDCl+Gkwl9+mVN/ZDE5OQ3jCcdeKd5VEJLUABPwUARb+YzN0fBnl40JI/?=
 =?us-ascii?Q?ZAUyuGOzbuurjTNZUjkDIFsqGsCv1W98Np6MEWUSpM71PHquEmrypnXqRNvb?=
 =?us-ascii?Q?gbzVmI8zn/Q18OoyCELbdWStN9x8lF4lcVb+bN3VPlFcHW1/TcGi05cI1j5k?=
 =?us-ascii?Q?DuAkor6mTBx0Q8m3pOzJZDfkIgbqLpmnvbn0caJFQLt7stVsQxpZ5G7LKHnB?=
 =?us-ascii?Q?HQc66wWYfyV/YTz6gr+mVsVKGAJgCKJxGVUwcktSYglSuAvIofWprm5HUpvd?=
 =?us-ascii?Q?9meBph640xFoV1yxN8kjzOrDCAvg2oJCMiXJKt0LFLrqk0Ca89n4kJC6YG2i?=
 =?us-ascii?Q?1I3w/wpq6qcrcaYddEa6YtnNLTmUz9Cy8hEX5FjwjMgxNWsABE5DiNQmg2Kj?=
 =?us-ascii?Q?WGjvbAYI+OW98zWpRkbHQZUCRWR2yuIap71HhPFRa+iXR1VZfsCkiIWmR8QB?=
 =?us-ascii?Q?9p498mHGDBVdPZrfRCmjREQm/pDOfo/F1hxgGBbn8B3YL1Scpejbdr774XHU?=
 =?us-ascii?Q?LUCwu6yjW00Z0K0rOljuBhyVkH7dUxl8Bc9RMGdJFkm0uuur9OqAvLuVGmrP?=
 =?us-ascii?Q?rISzabpdzYGIkwivcEF7rY4i6FtaIEPE/CSCJz1+UCOXmngXcpVAyp/5xzF3?=
 =?us-ascii?Q?h/GNVLK/sVmVdtGcmBDKmTZOpHR+hAjNUaRA68UWbgE1LILkJgjhhxqy3FhH?=
 =?us-ascii?Q?y6Q2+f9ZBuoQxP5CsECROeOsrY2xUOR+oy+nvlRnLhc7Xx++Fyuh2dPhBl/k?=
 =?us-ascii?Q?zGLXvltWtqblus/R9DwiHu8KCEd3Xd4ec25ZCtKXLFAn1/l0FrKzcG/nfogn?=
 =?us-ascii?Q?qLX0M32h4qiEwpTXw82VVWREuT954TfRd0Bj+aYFAkpKVGJuLvxOPcWmgXeq?=
 =?us-ascii?Q?W7oWbavvxKf+vAHBr99XlIvMxh8F+RTTTzrbOrYY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd1e3ff-b084-495a-5df6-08daf5172556
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB2939.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 03:34:58.8785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yS7UnjsmVMWxqxQtjZsUJlFYBWfG+sY2VzgKk0kjGp56IjcPDesHR+GFlTr4QPrubnv2iNtSuewxmv1PVRqK9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8247
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH V2 4/7] arm64: dts: imx93: add eqos support
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Add EQoS node for imx93 platform.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
New patch added in V2, split dtsi and dts changes into separate patches
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 6808321ed809..ff2253cb7d4a 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -564,6 +564,28 @@ usdhc2: mmc@42860000 {
 				status = "disabled";
 			};
 
+			eqos: ethernet@428a0000 {
+				compatible = "nxp,imx93-dwmac-eqos", "snps,dwmac-5.10a";
+				reg = <0x428a0000 0x10000>;
+				interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "eth_wake_irq", "macirq";
+				clocks = <&clk IMX93_CLK_ENET_QOS_GATE>,
+					 <&clk IMX93_CLK_ENET_QOS_GATE>,
+					 <&clk IMX93_CLK_ENET_TIMER2>,
+					 <&clk IMX93_CLK_ENET>,
+					 <&clk IMX93_CLK_ENET_QOS_GATE>;
+				clock-names = "stmmaceth", "pclk", "ptp_ref", "tx", "mem";
+				assigned-clocks = <&clk IMX93_CLK_ENET_TIMER2>,
+						  <&clk IMX93_CLK_ENET>;
+				assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
+							 <&clk IMX93_CLK_SYS_PLL_PFD0_DIV2>;
+				assigned-clock-rates = <100000000>, <250000000>;
+				intf_mode = <&wakeupmix_gpr 0x28>;
+				clk_csr = <0>;
+				status = "disabled";
+			};
+
 			usdhc3: mmc@428b0000 {
 				compatible = "fsl,imx93-usdhc", "fsl,imx8mm-usdhc";
 				reg = <0x428b0000 0x10000>;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
