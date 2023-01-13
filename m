Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C90668A39
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jan 2023 04:35:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AF3DC65E55;
	Fri, 13 Jan 2023 03:35:23 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2077.outbound.protection.outlook.com [40.107.20.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14781C65E45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jan 2023 03:35:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGMx94EqBydJnMYy/tf230X4reny5kPC6YqWHQ+6uDaaPskFFz4dbgc482f1l4UKmyLD6RYhB4eF5Yvlwar1CPoeWaaRQqRoUJR6TfHQPEZ7o4Ayzk2kXmAHSXR+/vPfRu0qvLyoyvkLXfkdEDglfPHOCVZbr/2Bkjo9OYbMVm+zAcJtxSKras23dEAAmhiBiexRPstNun/lQWIXLLYmuDNpLrMqy7Er7PN7BZRQvH1D9+byjnD/ZlLrs/IurcjIW0wA3tcLrZTpo0Q2xYL8soGnm8zNWQuRgSIRJM0N+YG+PdYC+5Gav+rnWaU+0sw/pZcgsbdRuGZfhN8WdNipfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXa8M+G8KNPlvAU4FbLbbSvCwweX4FklR9YyAUkcKWY=;
 b=V3VQXRIuL+3qKo+5H+W+JlU8ofZOGG5SSbLMROBrzXYqMpCjEfis1d1kifgHSywQg0g9zqLc/5LG4E3KCRo/WYnM2Yj6kfe8QwrULZRSqFO7W8LcbsKlbkx0+oF6kmtQDsvm+8rkfRTqVQZIZBWM1ypogMxUUovpvhrys03vZ9J2vlxomNgIdg/zJfHNmfqGcdVIkr/aXvZVSweDPbm1iQgoycuQh6UjtJBvIAq37m+diGxA4OSsK7X51MtHd9GZFmxXaCP9EWI+o+leNmwxGZgPtcv06vcsONuQH26SdOnRp2bG85vl7zGB8Yysri3zhWIWcpr6sC3GNbY7AMrnbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXa8M+G8KNPlvAU4FbLbbSvCwweX4FklR9YyAUkcKWY=;
 b=oM9N6TY/ktIX7H/3lCqjJVo3G6LROwHvuAygXPMnLvXXbuIOVKKeoM2LBR1raYqH9wg11TEdenRCoyG0l3a0Be3R7FfRMTRPWlwgKV5znlTugiihEMoJU69jMpf77UCWhiXR+CyTL0OEkrhMYeAwaUwYgUVrqxsfqTykjkAn79c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from HE1PR0402MB2939.eurprd04.prod.outlook.com (2603:10a6:3:db::18)
 by AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 03:35:21 +0000
Received: from HE1PR0402MB2939.eurprd04.prod.outlook.com
 ([fe80::76a3:36aa:1144:616c]) by HE1PR0402MB2939.eurprd04.prod.outlook.com
 ([fe80::76a3:36aa:1144:616c%12]) with mapi id 15.20.5986.019; Fri, 13 Jan
 2023 03:35:20 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: wei.fang@nxp.com, shenwei.wang@nxp.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Date: Fri, 13 Jan 2023 11:33:47 +0800
Message-Id: <20230113033347.264135-8-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113033347.264135-1-xiaoning.wang@nxp.com>
References: <20230113033347.264135-1-xiaoning.wang@nxp.com>
X-ClientProxiedBy: SI2PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::8) To HE1PR0402MB2939.eurprd04.prod.outlook.com
 (2603:10a6:3:db::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2939:EE_|AS8PR04MB8247:EE_
X-MS-Office365-Filtering-Correlation-Id: deacf900-0f46-4fcd-30bb-08daf517325b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6BYiBj2wJMHd7Q48vM6MTE/RQcPzk+V3k2Cge3dey2Sctq7HDuBe5l5vrNt0BP5Q04JCDNCnydGL5x1c5rMqPQ6zADzpawzeiHYbEHiiAthg/K1H7aWu/bk7lsjaUjlrsIKFEYPaOXXUFspg3z/S1rblgUusQOB6iowkHOvqzX+MBx5s9PixoqMifgFxYGKH/DKRsqYIIVV45d46HV6FJ4vZ0UyHyvyToOj0CGCCfrLEOz6iIkutLiCQp0F2Ty2vHwDXEhLVhm/4yoi1R5Oe2oYmt+F4U8j+Vq4hgYEnqQhxWXDTCERzGSgtyu3YmMAqgUDaAUo+cz4wmInlsxin5NgCFdAe2rrQ6720a4MNbWn8XtygZFzwj2ui5/aaZPicVRmzaj5rXWLrQ3WgfIJlXERtb+M4CKJWowz1OGBrjQRYndZJnaS0v5eui7aKTrt3DnQD19gwIKPgiY0jA7zKikatj8PSufnZpPvn8JwhOGxqxs5aP8Q1ElbSVw3o5h0uVFOLjtrO2QvRFiO7UeZo8RmvQuACxqWmJ/rQ0YzISyN7RWTjmBZkMupV8/OGuYgewKHIC0cTvnZv+1LH6DeXPqu7lL52Z6YTrTi6Cfsc5hNoBbrcI0RuzNqc+KhwwT3V3/Ocgg3bYV7UpkFToc22nSxVxi45Kg9aUpOIVogVarWq5dDgW3lP1wU1G3f2FIVS5dP/or1q7J8FTK+t4UMgetwNSdikDwtNIH7f9Z8MF/8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0402MB2939.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(451199015)(41300700001)(66556008)(8676002)(66476007)(66946007)(4326008)(5660300002)(7416002)(921005)(316002)(8936002)(2906002)(86362001)(38100700002)(478600001)(6486002)(36756003)(52116002)(38350700002)(6666004)(186003)(26005)(6506007)(1076003)(2616005)(6512007)(83380400001)(473944003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U+1eXERge9Z7ifrGcfksWOIZ5y3Kxf7hrLLCg6Y1mjSvW2oFn2EM+PGy++xn?=
 =?us-ascii?Q?AidBS0d72gnE9R3eKNsTipeZRpS2qCDKqSDWpicsNSjnHrwBl90F5EycDlPK?=
 =?us-ascii?Q?HOaEjRrq1jwOVPqAorPRKiLNdhOqvUYw9tlraK2qNosEwVUvJ85U0wB4Lv9r?=
 =?us-ascii?Q?o7+ymdHRbkDJNkkCubMWiE0DZuup00JiaALesVZvuKlR6rxzaSBZLi0+N8xY?=
 =?us-ascii?Q?cwL0mrPsxkektYDRbEMDE9dNUkzZp1CtXJ0pVS9PgSYxiiROvydw6UaNolZ9?=
 =?us-ascii?Q?nLisLiHa8SfJoxpx/UrEgfhpxgwQ3ryg5m7TK18BY9Habbwjg7mt0a/enCaw?=
 =?us-ascii?Q?lNZiHjca9lED9b+chOUrgvQRcg+BeL9uv7R/1QnoVP1+PyozyuBLr56MRk/9?=
 =?us-ascii?Q?WRptgFiUJ2R653uLjSw0AlIVn2SU8677Ko1CbYGTBJD6Y/ohy7AIozlHECtA?=
 =?us-ascii?Q?cnjNX3pSBLe4kLB3HCZiS2hxEem73jNyIK9xU4U4uGP5uIVd4S1mQRbBiJiI?=
 =?us-ascii?Q?ZXUfsx6F3hQ3eZbUk55nPLP+dPUTkmkIFVb9L9EI0JRWj0Z+zj5SnMWvll2o?=
 =?us-ascii?Q?vJQ7Di3ik6NTjeRobQZKlF9tOMj933BNCyWuwZb2rM+KgSUhBjbyLOgc+XrX?=
 =?us-ascii?Q?peNUouliadEqg/kb9MNJJUJ0VPJXy7FSwM8cEL03PdfZk0Q6nAj0PZTBkiAB?=
 =?us-ascii?Q?EbNVfpAIx9GFuz0xOVAvZGkeRNOW08XjLeCDz7zjcJkdBy0HJkhZGIE2ePMc?=
 =?us-ascii?Q?4EC6DjPfhtUhvVRBqsVi92fCnyBAI5NAZe6gdmAQd5ZV1tKZLnq4XIdGhLEG?=
 =?us-ascii?Q?SwFt3mro0IneO4iXVUNXR3X4M97KCCa+OWm8mTlSdeHVVBSKv5s1il5wK1Ul?=
 =?us-ascii?Q?s2fQjvdXtgeFFyXOQwPTNaGYZPmUxVXqTOzG5fVuJAYU7IkgIe5Y3ty44gMV?=
 =?us-ascii?Q?dFpMTGjBgsZfn6lyPvHsJEKc05XL5GTe34ezM/qSPVFLQ8DhqEWnZwHdyjEb?=
 =?us-ascii?Q?koqw2oGtAWm+hEUPPbgG8d3OKcMbbpW4gOFKZ0dz1YheomUPgkC3vf9NZiLh?=
 =?us-ascii?Q?udqrVynxflWgOHLeVaiNXmtPRckn+iJ8bX73hCUYXl6NHCC5jE8gIew9Tmp9?=
 =?us-ascii?Q?46VEduTGKTTWGAaSuGV1NAv4z/PHwv8kfxEp+R3O3OMG0QvOhwmsamIyK+nx?=
 =?us-ascii?Q?HMP2+6YQNIRgOnPEyPIeaJp0TdiPSSVuXeBP2HZc+HohV2+AngybltVd/UxW?=
 =?us-ascii?Q?JKXi/fGk9UbzmAoMH9wFMFxctHJxmDhlk8kqcGvMX+gC6v7tMSWQoe+eJnvX?=
 =?us-ascii?Q?z6k3EvciH7XImimQvh54oG5/rXSmgl3rstpfMlfrdxMUAKXUt4czi7ROoAgz?=
 =?us-ascii?Q?jWV+k3KAw72XZB4ZP4VtoMRmMKuV68YEOP1BE9mE+AqF7eamuAIW5u7vcIG0?=
 =?us-ascii?Q?Ks2oEdMjmKhu5Hiu3YW62+xw+z/DN1uTJE9+1TeTlMYCytLOydqiNCd+R9T2?=
 =?us-ascii?Q?HYbchc3Ky4mRSatdzfkDBinERjXavKCvFRs3+aMd9+b7g4mvI3xlFpnLqI0z?=
 =?us-ascii?Q?7g+N2+/F+Om5Qze6IPe+P12bvIdDBiwp4hxsdWn6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deacf900-0f46-4fcd-30bb-08daf517325b
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB2939.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 03:35:20.8142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVTW2KNUo3TLoeUrc6oreWXcKHe48w3hAXiHmBYZwxh8rrzbwCZYyt5maZvdT6cnJ6hY/gwJARgyOq2NnUyxkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8247
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH V2 7/7] arm64: dts: imx93-11x11-evk: enable
	fec function
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

Enable FEC function for imx93-11x11-evk board.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
New patch added in V2 for FEC
---
 .../boot/dts/freescale/imx93-11x11-evk.dts    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index 6f7f1974cbb7..cdcc5093c763 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -55,6 +55,26 @@ ethphy1: ethernet-phy@1 {
 	};
 };
 
+&fec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy2>;
+	fsl,magic-packet;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clock-frequency = <5000000>;
+
+		ethphy2: ethernet-phy@2 {
+			reg = <2>;
+			eee-broken-1000t;
+		};
+	};
+};
+
 &lpuart1 { /* console */
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
@@ -104,6 +124,25 @@ MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
 		>;
 	};
 
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_MDC__ENET1_MDC			0x57e
+			MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x57e
+			MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x57e
+			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x57e
+			MX93_PAD_ENET2_RD2__ENET1_RGMII_RD2		0x57e
+			MX93_PAD_ENET2_RD3__ENET1_RGMII_RD3		0x57e
+			MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC		0x5fe
+			MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL	0x57e
+			MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0		0x57e
+			MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1		0x57e
+			MX93_PAD_ENET2_TD2__ENET1_RGMII_TD2		0x57e
+			MX93_PAD_ENET2_TD3__ENET1_RGMII_TD3		0x57e
+			MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC		0x5fe
+			MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x57e
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX93_PAD_UART1_RXD__LPUART1_RX			0x31e
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
