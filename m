Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6119BB043AE
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Jul 2025 17:25:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1ED9C3F930;
	Mon, 14 Jul 2025 15:25:49 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2072.outbound.protection.outlook.com [40.107.102.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09D1AC3F92E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Jul 2025 15:25:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmQxZHZ5wlndbeKoCJLirLqecz6PoRrK9QF1YvkqSC00akVxnNUExquEw4lKCes6K6HmLLJnvQLPYRjFYyRJOe0FdVo7nhvEjGcIHtG2rtfjNg3ls2g8NpXnGZkYV06NW4aF4Nek4IYtYpXmN9d9SfsV1RdTovfKIYkkknYIuQ91wsX770hoIJgD3MvKfJqYzCkCKIUttGBS5DWWwE8xPSPzcORUmpNkop74chvanAl/d6uRfheUfXaUOmyvL8f/kQmLM0LB3Kbxt8o1B9Run4AskDIvDnCFXeAuV/Aw3iLAeCTLuYilJFN54mfBmzxRenb3CTARUjsZxLeryPmmLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87xbCnaKD0sjesb3OxSg4tz0R9PkUNTTP2QJKjf/YaA=;
 b=tAkwtxN3z2IrvwZYdcwfHnFZDpLcKzp3o/r887PwuM82SCXOgPYNb2BMUjbpVTuRIGZL1Q8ERVWrDkcqoaabBr+90YLLi2MOpZyJFgfzvObtEZ0XwZFxJrsxVIy4IKslFZkkBreoqxfg+EcYe5ghY5IcJAp9NcB4cs+lK2NSwNio0VB6L5jVeN0J2ClCIwYf23/X6RQmTp8xc9UfGXdkykseaB0HChI8cbRNAXTlSE+yiFQXwSbPVEg3EaJrPmQ1KBxR7+Ekd7QeZr7vYfp2JGMstHARvCStJG16LP+ON2Q65G5tr8vfvcj1oDjaEmut4WVNbPOKSy7wmKX4XwKjKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87xbCnaKD0sjesb3OxSg4tz0R9PkUNTTP2QJKjf/YaA=;
 b=G1xG05bVOW1psl6K44YW9z7L77g0yRQfQQLcpMwGV1wAW+wT+91fUuLrdaqgDq57389o84HlptnpqKYbNNkt5UfuDUvGaTam+0znKyrSf7nSwQ6JHXlzuYEC4ySNMAhPIpTTp5NOTpOrfDHPWlkX10UK2FGFpBhMc8ipDDAGGsHXdHEY3i7TkdMzm9vBY8g9fhpmM5lzLeRbv3UvTP9R+XgHNkMdaIa+fZOjqSxuq8wSCu2jd5lYjiIoCnHZ8qkj0yE2FhygZQ6urfA4PltpNmtOdsAZTsQOv7sKZkj8jD5hu0u5Nr/t8ygU1mGzgTpnqXhREOaHlfnyC+tIy7zGcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BYAPR03MB3461.namprd03.prod.outlook.com (2603:10b6:a02:b4::23)
 by DS7PR03MB5592.namprd03.prod.outlook.com (2603:10b6:5:2c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 15:25:47 +0000
Received: from BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c]) by BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c%6]) with mapi id 15.20.8901.024; Mon, 14 Jul 2025
 15:25:47 +0000
From: Matthew Gerlach <matthew.gerlach@altera.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, dinguyen@kernel.org,
 maxime.chevallier@bootlin.com, richardcochran@gmail.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 14 Jul 2025 08:25:26 -0700
Message-ID: <20250714152528.311398-3-matthew.gerlach@altera.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250714152528.311398-1-matthew.gerlach@altera.com>
References: <20250714152528.311398-1-matthew.gerlach@altera.com>
X-ClientProxiedBy: BYAPR02CA0001.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::14) To BYAPR03MB3461.namprd03.prod.outlook.com
 (2603:10b6:a02:b4::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3461:EE_|DS7PR03MB5592:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e420c25-22aa-47d9-56c5-08ddc2eab4df
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kXlh8dHxei9n0efRjOUd56tXMt/OPxvgjEuaF9TozXfqi3poE68Qtro5x2xq?=
 =?us-ascii?Q?7u08LnjGJoKKfrae3QKbsk+T0eW53/eKBx3pqz30ulp7uEX1Cex6mGsIEycG?=
 =?us-ascii?Q?fsA/c1jqIbWFkzF8n9cyQD3GNdQQVwpSqfJVh7UvZ5LU2uRUPCt/5gTx+hah?=
 =?us-ascii?Q?UnXyLTQ6/ivhIjrb1x2VXr3T/DriUPLbY5LNElWuqMbgBe1fYpezoDST5naC?=
 =?us-ascii?Q?ulG8zdzSvX8xDbFWLAPWYusgLadLbEJ2paR9ys6xji8gs8PfOmcDH9oeYS6E?=
 =?us-ascii?Q?o7jW+JrpRbR7bxokW2wK7R/dpcOYm71q/yTfYSOWxkefDzo3vVekXnypc0aj?=
 =?us-ascii?Q?TQpHAj+ny01QDQVxsGnXO0XrYPj81nqvNDHyUZ1z9seGCtsfbEnPvPLDUOjp?=
 =?us-ascii?Q?+NDOlAd7w/AQxb8mVmyuGzkzZmQXgGE2EBXKDGlILIYpS8KOIplrcW85fvix?=
 =?us-ascii?Q?PsUeXTgawz0RngjaexfysIMXmQT6NKsbC5OhrI8DoRsztuPPEJkuKER1eRfp?=
 =?us-ascii?Q?SK42n2LqaVdgqCMcCWFUTC1RoXQKt63XIzS5YeVn+loOrbws6WuQ3T+zpJDY?=
 =?us-ascii?Q?XSgroldjh1Ej2wPoMC9CBHSZcNnqRII9TF85vUSBo835ooikZvXrxabMFrP+?=
 =?us-ascii?Q?H3ouX/EIMx3z6mv01zo+gkmGgOWzTEX1woBZHKz0dV3fVAZ0UiqBcTHXxtZo?=
 =?us-ascii?Q?sx7RsS0vAx5RRhHFB2vOS3XC+aXGDlZzMSqBT1hI0LUON4LbDcVZJH5gCCHy?=
 =?us-ascii?Q?xQInMfjgi0oPexthJywa3x5B0rnxIavB+LbACkQw3RCNk/tNFniVBIGw5yaW?=
 =?us-ascii?Q?Uuk6Rlg9S5GiRvMeVLiz5mRFRw50Z6fXv+EA2dDtEn0D7azb16LaoRwvXlZd?=
 =?us-ascii?Q?Wp6U2L7xPBOEEHCULs60y3btuZrK/asVw0mIRdmsxdjDrragPweW0fs+Lr2U?=
 =?us-ascii?Q?DWQ2UHVgMkyYnpZ/JgOcwSRRTGBIvUiKkUgl5wbnXRmMcpIqFELaD5gk4Sap?=
 =?us-ascii?Q?HC34EhdfgVfwo1OoBeAe+YrXQ/rFb72pVlShljjpD4n50L8BNJAcrGyxxYEW?=
 =?us-ascii?Q?sE/qaOIgLJeFGcrxFSdr1JVTRbZHQqeJPOgBadsFhnVoTK20uamB+fQgYxZt?=
 =?us-ascii?Q?++M1TRpU06IipRNWwI0gGmianW3e1DxE/+W4fHTvK4zGJWTZevwidEbqz/SM?=
 =?us-ascii?Q?n4owkhoUI4/2tlPYJKV+VJD9hadXNEAybNRaJh9vQ6RGJ9yzB2T5IwsLgQw2?=
 =?us-ascii?Q?Fac7nOoWENfMOof8bmC5Y5jQUhBM2ETP4CndAXCh3uNRYN7SeFph6ZK3ksg+?=
 =?us-ascii?Q?saqQ3e5bJ3bc0IKkujdK3S7yZhoUV54gwRKiI+39ziNbPDS+82MVxorh1tbE?=
 =?us-ascii?Q?WkDqWyySk0o36ETqF4Rp69+4J6HcT7MeHE9OfOrIHvGOiyJk+CVvzAB0XOXL?=
 =?us-ascii?Q?S8pp6buismfrFtiWYfQl508Bx3tPTlJ8P5jNVGZ1h1YewfuvoHwInQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB3461.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FnTcXYsVT68EZIqH4nD9XmErlE0CdfPb/5oKgjzdeyjFsSuGl4L/Qz+sgI/S?=
 =?us-ascii?Q?aDXx/Ob+6Z72l9dpV2RK1SLwzZCIS+C0UdoxkNM35uqaa1Sjg9g0Gio2+aHH?=
 =?us-ascii?Q?m1D0Ms7fWoPjGt2pvDTeFJyxrp/jkiZGfaAydFT9uUyCGhc32XvQJnLXCgzt?=
 =?us-ascii?Q?KVw4lzodzGsi1tH3MNo2XDleeDgyDKVvma2g7arq/hjMnswAu/v3/9A73ya0?=
 =?us-ascii?Q?vhcuRcNJSDvmjGxJ/8f964UFpmnYvelt8OeF54XyTI5Vs5chc+gCKCGvZhvj?=
 =?us-ascii?Q?RAiqX9AhqWRD/Bs/OF5dwrOc+5bBxyqrIjclMunhWiypU8jFhxB1113KcK7v?=
 =?us-ascii?Q?Fy7ACHH+IoXT+XjKrRU08ZfRDNN0MeicIdrG0aoeK4lUAQDyfbKmwKyyW90Q?=
 =?us-ascii?Q?PS0c/fq3NjA4IwdsmIrQwM9UlToC8P5v324eXhbpSTqVelnJsOX+mYwELoD0?=
 =?us-ascii?Q?mN9dXC+fdrL/f5chUmQpVlqrXJL57/a6Q5iwCP4bOzeSKy1wCiMbciengEEj?=
 =?us-ascii?Q?i0A0f+b1MHqF1ys8yBdv6rbDrdtjYMF2JEISSxPMEQ5qyG/9TN+a1OaB49JA?=
 =?us-ascii?Q?BJ62WDZft2baSmQXYrAuVqBETL5XDHCECXpbUSZHYBaE2rn1hCgg1lXAZtav?=
 =?us-ascii?Q?F1R1nNbLK9MvHkBaJlVgMXmQ+xXzycY7p2XCxGRuH0YWQOXTVMVczVKVKPO2?=
 =?us-ascii?Q?YaSP/Czf9HplDncZ/DnNHu2BgfOdUUhpKCm0taNdz5cRwLRho5a+36DVfgyk?=
 =?us-ascii?Q?0W4JbleIKiNmmup9uKQQ1N0l6u45glE+U3DMBUVJvmp02TfIcGR0o/cANEZh?=
 =?us-ascii?Q?tqCtP/GpQTOoEs6/vI5x+HzWvjo6CobYxVeJ6jmRBEOrq4IBCOIaF7o/4um2?=
 =?us-ascii?Q?hdrj2nYrxstRguJevC3FmuhoA+cyG30Q+qrNTNMGjliXuWYHQ8CLHfd1fxAU?=
 =?us-ascii?Q?vcZo1IEQnR+E67d/Ilc9KpGsreFnyUHD4UHhlh6Uyk9XfIAQ4aNTVXRkSNJ6?=
 =?us-ascii?Q?HTDOawm9EXCbB4jZSbUlxqG0yksb/HwQ0LxqjTv00p7tFWyHi//JcoIQjgtR?=
 =?us-ascii?Q?TDccFch9A8grYR8o0EbDmw2FTFtNRc75vc5vrkROTVyf6sN2101ChXpVwh3L?=
 =?us-ascii?Q?65fxOFe2LTbSHcsn6/qDjf+2ZaYUL4IdHU/w44yHeEVdI43Uwy1kqTx+jAK0?=
 =?us-ascii?Q?3tXJ8vdeis2iZN1cbL6H0xQ5d4pzTOxEJZdbXPXnAKlZfxcoEHnnd9M0DzwZ?=
 =?us-ascii?Q?oAMaU1ktQ4qeJLdKfRoMZG5liSs33khQFZ9jeMN2IGsrBzuS3AC4Nkmx9idP?=
 =?us-ascii?Q?AwBmd9GCOa+JLhxQnEdYBeDeIGXrBKOYt4B9+FW58uPbGhv5PmG8Aw1tWraa?=
 =?us-ascii?Q?S+q7aHYvsIzaBD/57eg3auYALIGuPt1ETXfIQjOCK4zTMkH0X9UYZ0S/Dg18?=
 =?us-ascii?Q?gmLoL0J13cfAu6plbppgzzYMlvPYz7CczyYtFxfoZU4jytBtHtT11L2GMbCd?=
 =?us-ascii?Q?nyICfqym1ZXZaS8i67AMCQwx8pHkyEOGsKJs/CgNhHg/gi6VMmHSs1zRQ9ZH?=
 =?us-ascii?Q?+yYNeRb570FMSwbDRfjFGZlfC43pmz15SnHbikCKwpzw//Ue6ihIVWKyWesD?=
 =?us-ascii?Q?Gw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e420c25-22aa-47d9-56c5-08ddc2eab4df
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3461.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 15:25:47.1625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5eLjXeKFJuFu4L0debZARMVbw0t+6EIuSixeulymhnYuqpTGIIe+sBVht/TMdwPf4jhrtqNc4ymazsi6rdx63A53AV5exuYqrGdmCOV244E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5592
Cc: Mun Yew Tham <mun.yew.tham@altera.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>
Subject: [Linux-stm32] [PATCH 2/4] arm64: dts: Agilex5 Add gmac nodes to
	DTSI for Agilex5
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

From: Mun Yew Tham <mun.yew.tham@altera.com>

Add the base device tree nodes for gmac0, gmac1, and gmac2 to the DTSI
for the Agilex5 SOCFPGA.  Agilex5 has three Ethernet controllers based on
Synopsys DWC XGMAC IP version 2.10.

Signed-off-by: Mun Yew Tham <mun.yew.tham@altera.com>
Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi | 339 ++++++++++++++++++
 1 file changed, 339 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index 7d9394a04302..83581e7a85ab 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -486,5 +486,344 @@ qspi: spi@108d2000 {
 			clocks = <&qspi_clk>;
 			status = "disabled";
 		};
+
+		gmac0: ethernet@10810000 {
+			compatible = "altr,socfpga-stmmac-agilex5",
+				     "snps,dwxgmac-2.10",
+				     "snps,dwxgmac";
+			reg = <0x10810000 0x3500>;
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			resets = <&rst EMAC0_RESET>, <&rst EMAC0_OCP_RESET>;
+			reset-names = "stmmaceth", "ahb";
+			clocks = <&clkmgr AGILEX5_EMAC0_CLK>,
+				 <&clkmgr AGILEX5_EMAC_PTP_CLK>;
+			clock-names = "stmmaceth", "ptp_ref";
+			mac-address = [00 00 00 00 00 00];
+			tx-fifo-depth = <32768>;
+			rx-fifo-depth = <16384>;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <64>;
+			snps,axi-config = <&stmmac_axi_emac0_setup>;
+			snps,mtl-rx-config = <&mtl_rx_emac0_setup>;
+			snps,mtl-tx-config = <&mtl_tx_emac0_setup>;
+			snps,pbl = <32>;
+			snps,tso;
+			altr,sysmgr-syscon = <&sysmgr 0x44 0>;
+			snps,clk-csr = <0>;
+			status = "disabled";
+
+			stmmac_axi_emac0_setup: stmmac-axi-config {
+				snps,wr_osr_lmt = <31>;
+				snps,rd_osr_lmt = <31>;
+				snps,blen = <0 0 0 32 16 8 4>;
+			};
+
+			mtl_rx_emac0_setup: rx-queues-config {
+				snps,rx-queues-to-use = <8>;
+				snps,rx-sched-sp;
+				queue0 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x0>;
+				};
+				queue1 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x1>;
+				};
+				queue2 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x2>;
+				};
+				queue3 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x3>;
+				};
+				queue4 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x4>;
+				};
+				queue5 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x5>;
+				};
+				queue6 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x6>;
+				};
+				queue7 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x7>;
+				};
+			};
+
+			mtl_tx_emac0_setup: tx-queues-config {
+				snps,tx-queues-to-use = <8>;
+				snps,tx-sched-wrr;
+				queue0 {
+					snps,weight = <0x09>;
+					snps,dcb-algorithm;
+				};
+				queue1 {
+					snps,weight = <0x0A>;
+					snps,dcb-algorithm;
+				};
+				queue2 {
+					snps,weight = <0x0B>;
+					snps,coe-unsupported;
+					snps,dcb-algorithm;
+				};
+				queue3 {
+					snps,weight = <0x0C>;
+					snps,coe-unsupported;
+					snps,dcb-algorithm;
+				};
+				queue4 {
+					snps,weight = <0x0D>;
+					snps,coe-unsupported;
+					snps,dcb-algorithm;
+				};
+				queue5 {
+					snps,weight = <0x0E>;
+					snps,coe-unsupported;
+					snps,dcb-algorithm;
+				};
+				queue6 {
+					snps,weight = <0x0F>;
+					snps,coe-unsupported;
+					snps,dcb-algorithm;
+				};
+				queue7 {
+					snps,weight = <0x10>;
+					snps,coe-unsupported;
+					snps,dcb-algorithm;
+				};
+			};
+		};
+
+		gmac1: ethernet@10820000 {
+			compatible = "altr,socfpga-stmmac-agilex5",
+				     "snps,dwxgmac-2.10",
+				     "snps,dwxgmac";
+			reg = <0x10820000 0x3500>;
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			resets = <&rst EMAC1_RESET>, <&rst EMAC1_OCP_RESET>;
+			reset-names = "stmmaceth", "ahb";
+			clocks = <&clkmgr AGILEX5_EMAC1_CLK>,
+				 <&clkmgr AGILEX5_EMAC_PTP_CLK>;
+			clock-names = "stmmaceth", "ptp_ref";
+			mac-address = [00 00 00 00 00 00];
+			tx-fifo-depth = <32768>;
+			rx-fifo-depth = <16384>;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <64>;
+			snps,axi-config = <&stmmac_axi_emac1_setup>;
+			snps,mtl-rx-config = <&mtl_rx_emac1_setup>;
+			snps,mtl-tx-config = <&mtl_tx_emac1_setup>;
+			snps,pbl = <32>;
+			snps,tso;
+			altr,sysmgr-syscon = <&sysmgr 0x48 0>;
+			snps,clk-csr = <0>;
+			status = "disabled";
+
+			stmmac_axi_emac1_setup: stmmac-axi-config {
+				snps,wr_osr_lmt = <31>;
+				snps,rd_osr_lmt = <31>;
+				snps,blen = <0 0 0 32 16 8 4>;
+			};
+
+			mtl_rx_emac1_setup: rx-queues-config {
+				snps,rx-queues-to-use = <8>;
+				snps,rx-sched-sp;
+				queue0 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x0>;
+				};
+				queue1 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x1>;
+				};
+				queue2 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x2>;
+				};
+				queue3 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x3>;
+				};
+				queue4 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x4>;
+				};
+				queue5 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x5>;
+				};
+				queue6 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x6>;
+				};
+				queue7 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x7>;
+				};
+			};
+
+			mtl_tx_emac1_setup: tx-queues-config {
+				snps,tx-queues-to-use = <8>;
+				snps,tx-sched-wrr;
+				queue0 {
+					snps,weight = <0x09>;
+					snps,dcb-algorithm;
+				};
+				queue1 {
+					snps,weight = <0x0A>;
+					snps,dcb-algorithm;
+				};
+				queue2 {
+					snps,weight = <0x0B>;
+					snps,coe-unsupported;
+					snps,dcb-algorithm;
+				};
+				queue3 {
+					snps,weight = <0x0C>;
+					snps,coe-unsupported;
+					snps,dcb-algorithm;
+				};
+				queue4 {
+					snps,weight = <0x0D>;
+					snps,coe-unsupported;
+					snps,dcb-algorithm;
+				};
+				queue5 {
+					snps,weight = <0x0E>;
+					snps,coe-unsupported;
+					snps,dcb-algorithm;
+				};
+				queue6 {
+					snps,weight = <0x0F>;
+					snps,coe-unsupported;
+					snps,dcb-algorithm;
+				};
+				queue7 {
+					snps,weight = <0x10>;
+					snps,coe-unsupported;
+					snps,dcb-algorithm;
+				};
+			};
+		};
+
+		gmac2: ethernet@10830000 {
+			compatible = "altr,socfpga-stmmac-agilex5",
+				     "snps,dwxgmac-2.10",
+				     "snps,dwxgmac";
+			reg = <0x10830000 0x3500>;
+			interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			resets = <&rst EMAC2_RESET>, <&rst EMAC2_OCP_RESET>;
+			reset-names = "stmmaceth", "ahb";
+			clocks = <&clkmgr AGILEX5_EMAC2_CLK>,
+				 <&clkmgr AGILEX5_EMAC_PTP_CLK>;
+			clock-names = "stmmaceth", "ptp_ref";
+			mac-address = [00 00 00 00 00 00];
+			tx-fifo-depth = <32768>;
+			rx-fifo-depth = <16384>;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <64>;
+			snps,axi-config = <&stmmac_axi_emac2_setup>;
+			snps,mtl-rx-config = <&mtl_rx_emac2_setup>;
+			snps,mtl-tx-config = <&mtl_tx_emac2_setup>;
+			snps,pbl = <32>;
+			snps,tso;
+			altr,sysmgr-syscon = <&sysmgr 0x4c 0>;
+			snps,clk-csr = <0>;
+			status = "disabled";
+
+			stmmac_axi_emac2_setup: stmmac-axi-config {
+				snps,wr_osr_lmt = <31>;
+				snps,rd_osr_lmt = <31>;
+				snps,blen = <0 0 0 32 16 8 4>;
+			};
+
+			mtl_rx_emac2_setup: rx-queues-config {
+				snps,rx-queues-to-use = <8>;
+				snps,rx-sched-sp;
+				queue0 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x0>;
+				};
+				queue1 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x1>;
+				};
+				queue2 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x2>;
+				};
+				queue3 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x3>;
+				};
+				queue4 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x4>;
+				};
+				queue5 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x5>;
+				};
+				queue6 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x6>;
+				};
+				queue7 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x7>;
+				};
+			};
+
+			mtl_tx_emac2_setup: tx-queues-config {
+				snps,tx-queues-to-use = <8>;
+				snps,tx-sched-wrr;
+				queue0 {
+					snps,weight = <0x09>;
+					snps,dcb-algorithm;
+				};
+				queue1 {
+					snps,weight = <0x0A>;
+					snps,dcb-algorithm;
+				};
+				queue2 {
+					snps,weight = <0x0B>;
+					snps,coe-unsupported;
+					snps,dcb-algorithm;
+				};
+				queue3 {
+					snps,weight = <0x0C>;
+					snps,coe-unsupported;
+					snps,dcb-algorithm;
+				};
+				queue4 {
+					snps,weight = <0x0D>;
+					snps,coe-unsupported;
+					snps,dcb-algorithm;
+				};
+				queue5 {
+					snps,weight = <0x0E>;
+					snps,coe-unsupported;
+					snps,dcb-algorithm;
+				};
+				queue6 {
+					snps,weight = <0x0F>;
+					snps,coe-unsupported;
+					snps,dcb-algorithm;
+				};
+				queue7 {
+					snps,weight = <0x10>;
+					snps,coe-unsupported;
+					snps,dcb-algorithm;
+				};
+			};
+		};
 	};
 };
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
