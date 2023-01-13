Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F7A668A37
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jan 2023 04:35:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FC97C65E55;
	Fri, 13 Jan 2023 03:35:09 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2072.outbound.protection.outlook.com [40.107.21.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C553C65E45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jan 2023 03:35:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bTo9i8GaoLlXUUSU0l9fWW85ASUqLtBux9fhA+a6qSzMukkhUznz1xeA2omffSEl7fDzel+rJAyAxtIPKTFvVmeCMgXmw2tDn78IjHr/8PrrZEuHMI2mS0F37Wn0GWLcEgCnGrl+3MxsaUulo5j4rQqoZMIMUDueEUidLKY74aTwKrB5SFgo34VisfA0u75HOqxSy53rnvYJHZsJbnXrkXaGD1VUPJMh1t4sudB3o1mThS6uL7pcy6PVmb1TxRBSYjdt2ZTe3kMWD3TKhsG+W+TBu+5flN7Yj46x5454IPCFw3qF6LQc0qKGzx87Y8zT3pQFwpRbO65qcH2ok9QKHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjVSMwgw/1OBFcekpx/NPA7/lrMdZ8dc4ZcV50mZO44=;
 b=OeBivRL+fzSIT0Vu3Tp/0y3OkuJyWUTd0YBcrSWgON2Ivmx5WzIw4IjrNnZ8G5dyd4IowWMIHoy2NZtrEGY8h0hQK3sXCj4k0JT0j9LxEwv8mPZwT14htm17b4UwCbR1vixWX3CnAA/5oLbIaMS2BRR85Epvwq0nF8En52YBXBjphCVqVag0baBBAtCyoIlIduxTBIRVdGmFAxvk1OyErEMsSj5kslYzBSktv8n7FInfkI+P9uPSUKwV9NzKCqa4nA6I0UOZE82S/fRevDex9gi83TPU1gCtSJg6llyf4Y+9kE483eNmaQCFSZNmmqlVrEJgLVp53d1dRpSMu6gvRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjVSMwgw/1OBFcekpx/NPA7/lrMdZ8dc4ZcV50mZO44=;
 b=cBVC5A9gMhgQ5w/tt6WNlbJaTzesn1r2L4L1HNwdIeMQJwvzXkhDPU+eNi+N8K0+4sNtvne2DKmVgNMQNNNR8VNvNg03ytIMdkhzwViEnI9fTCKA+9PCqxOyVJAvoYlajW7AMMZRuUjADxxu8lC3lLvD/zWM64j3IyoKtToa+Qo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from HE1PR0402MB2939.eurprd04.prod.outlook.com (2603:10a6:3:db::18)
 by AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 03:35:06 +0000
Received: from HE1PR0402MB2939.eurprd04.prod.outlook.com
 ([fe80::76a3:36aa:1144:616c]) by HE1PR0402MB2939.eurprd04.prod.outlook.com
 ([fe80::76a3:36aa:1144:616c%12]) with mapi id 15.20.5986.019; Fri, 13 Jan
 2023 03:35:06 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: wei.fang@nxp.com, shenwei.wang@nxp.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Date: Fri, 13 Jan 2023 11:33:45 +0800
Message-Id: <20230113033347.264135-6-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113033347.264135-1-xiaoning.wang@nxp.com>
References: <20230113033347.264135-1-xiaoning.wang@nxp.com>
X-ClientProxiedBy: SI2PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::8) To HE1PR0402MB2939.eurprd04.prod.outlook.com
 (2603:10a6:3:db::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2939:EE_|AS8PR04MB8247:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d7618a3-f82e-4096-010b-08daf517299f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qQZQhpAI3otWX5/iGs9UYtOiD9nONmk2K/1Q/UcSYy8KMHydnnRn/dMK38OB++WJ8SKgkp4QqsWrwAzEJoHEgJONCBqllYuDpOGdenqDOJbDiVeZqckrH56JC113dwvTJV4mb8Qjd6AGdDJlo7MCdXdDtecsLSr1vpmkvcO6hzbYO5QdtKHxjYzuiMIJqOjrhwm5RTsgfTdTMGjqKyXX+nj4CdF85deBavUog8SyhbBE8TlsbDu9A/ej5VvX8jKoYEpigl/0gHw35q1y7MsPZiwp4BAxU457dvMNYU/35ls3lvUEgsV/qPrTB4mKGmY6vZEKKvULEF2+wXzX6xlw7A4SaM/SodnIfyB9bdeb9VgsfUw0q1B/rxAH5u8cRS9RXmrqdl9rLKcAUEzOmLjVvBc1lZ84eC66RAOsbehNMNUgSgpzvYsMKL6iCpSZrAcd+UeQVtL+kssP/xSwyv8Lfrv76JgARqSOr2gp4irPDbdW7sCyhYPfZS9YexNjxdiPv6ZYKqOyMsQZCKFT8pylzXQ4X7+ZG1vSnVz21+H1rPR/HskZ60OrJ+OpMhIjAW2nlqWF9qmVvqcnwY8CuEzXIzB0SmXsp3XUbi3h9fFhyfpZP8MYkmzh3fKwnJIxYj34e4ALkF90j/eB7ln3q0+TFszV7IZf61VAGHhIS7WS6V0Pv7vWj1c++tGbx+1cg827w3b/s40U5QnN9kW6i5iyPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0402MB2939.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(451199015)(41300700001)(66556008)(8676002)(66476007)(66946007)(4326008)(5660300002)(7416002)(921005)(316002)(8936002)(2906002)(86362001)(38100700002)(478600001)(6486002)(36756003)(52116002)(38350700002)(6666004)(186003)(26005)(6506007)(1076003)(2616005)(6512007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mcXB5w5pa/35o4yGo1EggBzA/+/emTJbx8b0e1S/6UllY6v7SGzmUyqUtMN+?=
 =?us-ascii?Q?3BqhY629k3Ja9hzDQ34MrnNaJITMC9DcfYQajrFxkOzPGqZxsFaJbDxgy8Ck?=
 =?us-ascii?Q?2TosfM9A3vxCGCJbP66zRgucnZw7m3Otbyrns1lHTvNUxa8LyQNsNVShi+El?=
 =?us-ascii?Q?xcjBaRrcT/IUdozwIazJ2IbRT2ZaY6Ms/5m8770xvANym0RstE3Xw1VSD6c5?=
 =?us-ascii?Q?3QC39AlOP1BcJ/Jxe4Dzv7CdrbvaahfaLwPnBgWXPaO/rG85sSinkLSRhSRI?=
 =?us-ascii?Q?dE82atNXV41oX5VFu9YD5VJ1BaG1T0Ki4mIet0FkKfdy0pIOOw2sfvwZqpGm?=
 =?us-ascii?Q?7+2q4jeRPZVrtDXenhHJdJcvT0Fh4MH+smyB0BdzyMkQHq//C1PW9C4bnaVX?=
 =?us-ascii?Q?pdrkb16re9jpr0YSFRaeG1/DDVHe7cXZ6S776CfLAA/u93yA24F9m3DUy2xR?=
 =?us-ascii?Q?lhXYSkS7+bWDjpEnAzAA7x3NGjdkLRwsnn6DjnBPJ/wFLWYxK3E46nynUftk?=
 =?us-ascii?Q?mAFXvk+Ta1Ha573SRGV8D1BrJig9zIMc+bY3nEMOpU4MkKh4COR3WQH087N4?=
 =?us-ascii?Q?ll8X5IYkJz97iBNDqA940uoWPf3MLgGldC+NIZAZKJM4dr/fHH72KlHrvoLs?=
 =?us-ascii?Q?0AZXThyDGzZIZ9iYMxqLKfIzACWCco46ouxcUxykZ4ODpTR/opm8ZPJ5nLmp?=
 =?us-ascii?Q?kjtinEfWK0bMDWaSgh8/TdH3SonIT1eYfYNAhgxXERp0AsJkUodZI6obYF33?=
 =?us-ascii?Q?93hTQG45o12Rtis9MnwLSssox6/o1xA83gMJdCj1Gn/o5eMvL3X1GQPXbrtk?=
 =?us-ascii?Q?jI3dTBPQKRrLEGUMEIBLrKJdsM3CADjROrYO04r2mKQrDzhUkfH7I90PYneY?=
 =?us-ascii?Q?lTgVCmWjYyftyvkhrWk+nyS4ehr1yAOpudXf/dzpR1/ZNOZRhYIg2gdUSYi0?=
 =?us-ascii?Q?/rh6LpcgoORgrsBCgWxm7Czs7T49sm2uafEfpIZR+YWS97sVfg/UcCq9kxrU?=
 =?us-ascii?Q?nlYWLw4zm0+Ye7PYWtNSmMpYM8nEfNn75dxR2fW8yVHSiyWTbNDWDwkwGIMx?=
 =?us-ascii?Q?1tMLNSROAzIeb1RgtGYsiEUo0Mz8Il1sU+c9uOWkC+SqAr2h2HBTIOKlxtDa?=
 =?us-ascii?Q?iijo9JpA6KRg4TtLwyMomqSAz3AK0jhB1POgUewiG5OPbpgqJyDfMj/dhq8h?=
 =?us-ascii?Q?OI7sW/8a9Q2R3d5O7bXb9M1wjK49lsbm0As2d9XVXmvLOP7WBhiN2f0L3mtP?=
 =?us-ascii?Q?Uw74OmEi2B4j4HEf0n0vS0KmseF+ODUwrJPWJeVfV9RtiYHgN4n4KS/4HFSy?=
 =?us-ascii?Q?s4NOQsJXSYpJhpfXtaagO61MY7ujYdkh68uG4JoPVDf7rSsvdglUKyZ20SDP?=
 =?us-ascii?Q?A0az1nDF3WUahaNery9ao9rkmbnRzjtQNSBd5Q0tJ0xw96Vb8In/zKOqEH/F?=
 =?us-ascii?Q?y2QqeqnZEoBmPTCn2RpSomTY124UVKEWNBXumGL6gtnDjhuQb/u2TSiOzdsI?=
 =?us-ascii?Q?vvRNNftEjzMj59P8rs7ytWvNOnagR5BZpJUtXZvfmBKCWEcYwGURm/AF2d7P?=
 =?us-ascii?Q?iMhUry0egKeBe437Re6rmy7bG10msDT9vMANWydf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d7618a3-f82e-4096-010b-08daf517299f
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB2939.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 03:35:06.0654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AEsbzH2Kcxy2wuk9MvuWM4Lqx1bTg9agMWfp6mDwd2oOPPhVbVvXhxCwTjBw6+vJMhGaBvwLIDZZDmaA1IHmLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8247
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH V2 5/7] arm64: dts: imx93: add FEC support
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

Add FEC node for imx93 platform.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
New patch added in V2 for FEC
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index ff2253cb7d4a..12e0350ad35a 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -586,6 +586,32 @@ eqos: ethernet@428a0000 {
 				status = "disabled";
 			};
 
+			fec: ethernet@42890000 {
+				compatible = "fsl,imx93-fec", "fsl,imx8mq-fec", "fsl,imx6sx-fec";
+				reg = <0x42890000 0x10000>;
+				interrupts = <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX93_CLK_ENET1_GATE>,
+					 <&clk IMX93_CLK_ENET1_GATE>,
+					 <&clk IMX93_CLK_ENET_TIMER1>,
+					 <&clk IMX93_CLK_ENET_REF>,
+					 <&clk IMX93_CLK_ENET_REF_PHY>;
+				clock-names = "ipg", "ahb", "ptp",
+					      "enet_clk_ref", "enet_out";
+				assigned-clocks = <&clk IMX93_CLK_ENET_TIMER1>,
+						  <&clk IMX93_CLK_ENET_REF>,
+						  <&clk IMX93_CLK_ENET_REF_PHY>;
+				assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
+							 <&clk IMX93_CLK_SYS_PLL_PFD0_DIV2>,
+							 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
+				assigned-clock-rates = <100000000>, <250000000>, <50000000>;
+				fsl,num-tx-queues = <3>;
+				fsl,num-rx-queues = <3>;
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
