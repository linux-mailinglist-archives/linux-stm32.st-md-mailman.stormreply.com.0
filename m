Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D4CAE3B67
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jun 2025 12:00:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA7DCC3F954;
	Mon, 23 Jun 2025 10:00:33 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazon11012045.outbound.protection.outlook.com [52.101.71.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 938A9C36B2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jun 2025 10:00:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lInKNCCMHD4/vmVvvuED9tD4ACGkdWYEq+fm4F+Al8Gqu1Rkyd/TOUsb1GnFzbSfv2e4NBngJX6ddW1Ci2+NMDvbS1nX9JilvmWPE6+AaCid+bAE803u0JBMugUj1uITOelN3DJH41O1vkKFfBnx4yPugHaNK8OlGD8Y226ASR8dTXM0Z2gJ/2Gmip/5bD/WHfFeCFM3Ir5RxlwIW35m4AS0fjOa2rSE+3zOsmP22Qi9t+8nEHPxMJhhROe3kch3E3IvxpHy7vbECc4BEcilJT/Bq8gWaXgi8erR+OXNejEInjqVjBMjl9E0UIpQw1aLxVbGl9N3IAdSXzolwxWClQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2ksZJlSWYHJVbTyu5SRsk3bW/EQKjuVuTzVJgKZrsk=;
 b=yOvv/9CekjmjgnnqMidfAdN23mAmgIVtnsz4Q20+2dmjr6gcH7TzGzpQiLMk9fEJ5Ou/Uxspi4HKUIUynpwzjnnLTa0CgyOxo6FlELm1lSx1lnt5i9Amx8v5me8aXQ6I+SZOMp8WXxvdeJZbK/fyOn/6GvOVe0y2g9UFCAUkgeZ5sgbosdR8ZEuP2oLoS3+3X3kbfMc55bpCVAnmZ1gw0kWtbaetSPyuRTH/GnSStjvDpdaI4A/SLmlweF/xJz78TdpKjVHfOeF9hJzEGYXmLrv0V1ioD9hPwDVg7K0GLL2xZVzU/cGxM+fGlyEu7Xy8Ry/KgsctgKBhUMto9VWRDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2ksZJlSWYHJVbTyu5SRsk3bW/EQKjuVuTzVJgKZrsk=;
 b=BjCELc3iht//6VEgo6edELWzC8IKK+qCFrcLzg49j223yc6zpSW/8Q0Oyslyu6BN/jAt9t6hXjW6qsJLTVlES8A4H+XbgYDcGdb+fvQKxWoDTUlTFXkx2bE755wPdcaorWTd87JonIuoizJPHoRyJu0kIGFhJbLVB2tpgmZ57/x/QylZvuhJ1CXzo7vtgVaeaAFx/NmLoU7bfubS46PU+XuMPynLz2I3U0Q6K+2qO+4NP/AzoBXDNYz2iTud/WvEIjF4r64N+vaXB6Y4LVSyLvMkQsUJOiruI58JJ0EmEGxpkOIO/deR8G6ve0+UKf09OHmTGiUv5HTmX1X2JxMTEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by PAXPR04MB8256.eurprd04.prod.outlook.com (2603:10a6:102:1c6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 10:00:31 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%7]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 10:00:31 +0000
From: Joy Zou <joy.zou@nxp.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, catalin.marinas@arm.com,
 will@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 ulf.hansson@linaro.org, richardcochran@gmail.com, kernel@pengutronix.de,
 festevam@gmail.com
Date: Mon, 23 Jun 2025 17:57:29 +0800
Message-Id: <20250623095732.2139853-7-joy.zou@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250623095732.2139853-1-joy.zou@nxp.com>
References: <20250623095732.2139853-1-joy.zou@nxp.com>
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|PAXPR04MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: aa816994-f805-4c4d-5789-08ddb23cc9d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S1luDXTB+Qo4NVad8bw4lcETm66QOM0AIzY7qKWV1CKgfvYRLl20VzeYj4ux?=
 =?us-ascii?Q?UvadmlVYM/H1j3HANc6A/mpMVG0vh6Feudn9BzKYSSPJ0eMKZdNu9f1SmSVR?=
 =?us-ascii?Q?orPO7/BOqe5/omxHfI8fsIg9vtAlPE7074KuHZmYRLHWcmXYAba9I4K5xO3K?=
 =?us-ascii?Q?MxfhCyDICDhUVqhMBkbMfsL11wXxDpyEvmYDWSBxiAO1XminbiMOzvi/VA+8?=
 =?us-ascii?Q?rlplu5wFe1GnwEMG/jU5HzWMnqKfDjzLHwaAffg9RE7FMh7PYQuNP5XAceDd?=
 =?us-ascii?Q?IWKA0DezpxsWjoifvjxpY3i6KcxCpktrtvpvWMlv/ReVepQubg3rgKaQ7cH7?=
 =?us-ascii?Q?2FrndY5AqPY8loO6INt7GH8GklW+Vx+vjKwydXgXKRsm/e2KRWscCaQzy03q?=
 =?us-ascii?Q?kcjtx9ezamoGRJtp1zEriKGedNPrP1ePCmgC+UtIKSPxN01CHgiWztMNnaqR?=
 =?us-ascii?Q?GVpFi1QF3k1vdgFpYdOgfLEnrWvptgQlCNV6m+ZjkPxZ5Sc2Hs9KQwzINUKF?=
 =?us-ascii?Q?irGQ/m8c1wPfHd6wn7rDVfLXcjthiP9GDR2j5ZNDM6ufE3Dl++HFOulUxar5?=
 =?us-ascii?Q?16puC2PxnGAXV/H4tPMOCnfDUoTyllW7EoQpyVytOoAGm4w7OPoU/Q5jhjmi?=
 =?us-ascii?Q?XZvSe2DZj/QAYnlZjSV/vVhN/+BkzpyimnwsHwo+BD3pWJwHsWXneBm+6mHO?=
 =?us-ascii?Q?eVCv2paPXeogSMKgd1xuGFCjPrQ2tUIOfE5nmIAzmhXNBLshAmQ/zdoWMC/f?=
 =?us-ascii?Q?Y1IVu8/lRDQUrGCuGV42vi4BfQ7BAOehpsQmCqOmxcjFLmKSA5nLZ9aWHHV3?=
 =?us-ascii?Q?zeZVznIedLx9RGu3zdVPZXrBATnxfN6n0u8txUKDBwZubAfjLtEM3j+RN9Bn?=
 =?us-ascii?Q?dG+brGL0N1e+DusYs37GFqSdmL4XEth56auPSsGC30KxfphTG3CVBWfFL9XL?=
 =?us-ascii?Q?ZdPfceuv2MqxLsDiR1UZ8fQj8vOBru7rNZZXW/P972TSU3ytaMraACHuk4Ob?=
 =?us-ascii?Q?msWCqdS9BZM3cZbHnCgEMBXyIA0B9EtCLddstzcG+BAiTLG+lwJJpfKck9LR?=
 =?us-ascii?Q?+NtjBfSSGAmuXjGcpU/XXZcyPfzeQEbShfn84T9Z9ErFgOPoF7zfBPdMW6nU?=
 =?us-ascii?Q?GvNy9DVTRVcIDLQFiPfjLOcByS0jXm6P6fyZy6liVy/Am5eAAPBBbsCuZJQJ?=
 =?us-ascii?Q?iWvSFvcuQTi1NcIVBjYiRNbiRkVlDPwqq082pxohVBGVSmukw/HI9TXhQkgq?=
 =?us-ascii?Q?FN9oSsBX00tQGUuKo240qugsF5VYNUYVsK4zbXaUXrDAXc+0ZgT0kus33wSr?=
 =?us-ascii?Q?j3VncDFLI6xpOf6Ab9FzQSp2bi/HtMYTLZHtMY4YPGxMTOrpGiKokhRCJ+Ut?=
 =?us-ascii?Q?4y9ZjyPI/zj8AOMY9uBlJZbAEoPsKHg2Qrk+lckYcoGqs1cgAZoz9cCmJPPd?=
 =?us-ascii?Q?1UCa7VtBDARn3xaHMsfuljyiQoduy0PFJgfsdtEknuyWH2MMkcSL+BwyMFQU?=
 =?us-ascii?Q?n8IxWim3e7YzzGo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9386.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KxwW2H+0Me/QoDFG3oIlMX01DBdSXwNem/WjtYMJMP6Cbv89Hb817c7AvjSq?=
 =?us-ascii?Q?YzwPmITeOlztiuEBR44xAKX2TTUhAdX7KT7DZF4TBRe398nerUEGJKPbclPx?=
 =?us-ascii?Q?a/Fm/yu7bIWkaeqphsQuWzbF/Rcz4md+CO8De0TSRVDyPi82lSF3SRi2bmzm?=
 =?us-ascii?Q?o0Oi2sv5IW95OD/WYxMjYKNC63YL4X9b9s8pnS4xAi6SU6FFe+0VZFsSVwMA?=
 =?us-ascii?Q?1KnoHwLFNDo8kPXbliGcPol63Dzh/oDIvTZyCSLEXJknwQI1bhreM+Jj3aMX?=
 =?us-ascii?Q?+w2DioG3kFiDoQLxw3xXLGMxWscavnqPz0+yZU6lzPoDUen84uj+NqAKLJFr?=
 =?us-ascii?Q?twIipbdYnTr6bXCXBTOyFxtx+PBrXCAjN7mUloL53cY0RIXq6eQy7sgvxUwP?=
 =?us-ascii?Q?JMq3u/YiksGndnHaJCo3Wf2plEegcBWCoMdmpdQvKw3+JIlXPP40huJkoeIy?=
 =?us-ascii?Q?hSbiGseVegiHux1evOFWNz23R7tD6V5lItrri6eVRxaIKqZYk9BRh7jOUwlV?=
 =?us-ascii?Q?zPs0Q8NmMypliUROlvaAvmXUbzyFYQ9qdD6p3WUhSGsaOGqD6qse1LOU0mM9?=
 =?us-ascii?Q?lb0l6cwSspe6uTuPB3cq9WYmVdMXDRmPy8mg+THV9MaLfbR9C5N4x8lh5Oo9?=
 =?us-ascii?Q?lkfOE5ad/Cxqsq2SZzudo0l+2a2Tmg/Sl/srXDR+X0WtOuIJPI4q+V5aZttn?=
 =?us-ascii?Q?dzUzmUgsQzVDI2cn54kZRhrjcysDGbVoPfuUCQTAxLGD7PL6Rk2SUXPQ94Aa?=
 =?us-ascii?Q?59wcCiNvKJ8nrowivOmKehjRbjBxtjeZVEl/qGupZ0IOQfpoUjxMsp5mth3u?=
 =?us-ascii?Q?DfBpmWdiSb7fLZN/WjV+iTPP9iopps5wFSNuUpAjaTfWOVA2SyYQ4c2+hwtA?=
 =?us-ascii?Q?fTHV+Atqkjci4c0Q822iZR+glaNMk/7IEk3iOMIrtKsn3Ipdoyrae8+8UEUH?=
 =?us-ascii?Q?+vUQSWEjd5LsIg7ZNMk+D+QFWEFinO6QDzIJNZI2eu6ozs69nPR9vJjk8Vcj?=
 =?us-ascii?Q?6eS7kEXoljHoFTMX378qMHl217rlpw8CiApRTL7+jE8xYlhWEH1kWGI3nccH?=
 =?us-ascii?Q?CFoL5bpNzodezNZB+TYcclXvgPFggK1+Ap5Zd3smu2BCN+YJyllKsq5uEXeu?=
 =?us-ascii?Q?Sux7ko1CZaNx9vrXT0cmxazPF8D9EZaPCWb/ZCiRILmWUR10vjyyrtWxPNXN?=
 =?us-ascii?Q?h9L+ne2VMJhbpTmQHl3n/AK64Idq2jUBrsDnNCxivOmy5tJipmRkJmJgmj5/?=
 =?us-ascii?Q?73sW5c5LUrewq15b/0xPK6pSaPwN7bKoyUqiX+KsDZRmEy02siWuU+6y/xMW?=
 =?us-ascii?Q?uXhSmon0tYCKNkKhGgbuNXlcz/H67uWQ3ApFtmZC6v3NHOzGJrt+jEuXjmos?=
 =?us-ascii?Q?ZMTuNynLnff/8jAYd6cbcTtr9oY7+rQfDsysSk4czi/x6Qy53gcO0kCINlNM?=
 =?us-ascii?Q?2fKfARQ5aa5Zldf4cvRAzZWS4lnkha3JjJENbfFV+LuBbA6k9NzoFRq6DWJg?=
 =?us-ascii?Q?49gjThBIYOUHm3sVjsUqOqqjV7K4NsGFG71KG2js61Abhmlnu1G3lO2+kata?=
 =?us-ascii?Q?bDIINw7n35RatMiUulKmQzQA3ZH2DBsOkG34y+iX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa816994-f805-4c4d-5789-08ddb23cc9d5
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 10:00:31.2771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0XlHKnvYuI7jiamDyH7knyO1us1BsCLpku42ZOPe32YnBim0IcUe9dTY5oYhnHF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8256
Cc: aisheng.dong@nxp.com, devicetree@vger.kernel.org, ye.li@nxp.com,
 ping.bai@nxp.com, imx@lists.linux.dev, netdev@vger.kernel.org,
 frank.li@nxp.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.or
Subject: [Linux-stm32] [PATCH v6 6/9] arm64: dts: freescale: move aliases
	from imx91_93_common.dtsi to board dts
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

These aliases aren't common and need to drop in imx91_93_common.dtsi.
The part aliases are moved from imx91_93_common.dtsi to imx91-11x11-evk.dts
and imx93-11x11-evk.dts for the convenience of customers.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
Changes in v6:
1. add new modification for aliases change.
---
 .../boot/dts/freescale/imx91-11x11-evk.dts    | 13 +++++++
 .../boot/dts/freescale/imx91_93_common.dtsi   | 34 -------------------
 .../boot/dts/freescale/imx93-11x11-evk.dts    | 19 +++++++++++
 3 files changed, 32 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index 0acd97ed14da..52b3f57ba347 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -15,7 +15,20 @@ / {
 	aliases {
 		ethernet0 = &fec;
 		ethernet1 = &eqos;
+		gpio0 = &gpio1;
+		gpio1 = &gpio2;
+		gpio2 = &gpio3;
+		i2c0 = &lpi2c1;
+		i2c1 = &lpi2c2;
+		i2c2 = &lpi2c3;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
 		rtc0 = &bbnsm_rtc;
+		serial0 = &lpuart1;
+		serial1 = &lpuart2;
+		serial2 = &lpuart3;
+		serial3 = &lpuart4;
+		serial4 = &lpuart5;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
index 2a2ed0266c1e..7c8c68151b14 100644
--- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
@@ -18,40 +18,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		gpio0 = &gpio1;
-		gpio1 = &gpio2;
-		gpio2 = &gpio3;
-		gpio3 = &gpio4;
-		i2c0 = &lpi2c1;
-		i2c1 = &lpi2c2;
-		i2c2 = &lpi2c3;
-		i2c3 = &lpi2c4;
-		i2c4 = &lpi2c5;
-		i2c5 = &lpi2c6;
-		i2c6 = &lpi2c7;
-		i2c7 = &lpi2c8;
-		mmc0 = &usdhc1;
-		mmc1 = &usdhc2;
-		mmc2 = &usdhc3;
-		serial0 = &lpuart1;
-		serial1 = &lpuart2;
-		serial2 = &lpuart3;
-		serial3 = &lpuart4;
-		serial4 = &lpuart5;
-		serial5 = &lpuart6;
-		serial6 = &lpuart7;
-		serial7 = &lpuart8;
-		spi0 = &lpspi1;
-		spi1 = &lpspi2;
-		spi2 = &lpspi3;
-		spi3 = &lpspi4;
-		spi4 = &lpspi5;
-		spi5 = &lpspi6;
-		spi6 = &lpspi7;
-		spi7 = &lpspi8;
-	};
-
 	cpus: cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index 8491eb53120e..674b2be900e6 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -12,6 +12,25 @@ / {
 	model = "NXP i.MX93 11X11 EVK board";
 	compatible = "fsl,imx93-11x11-evk", "fsl,imx93";
 
+	aliases {
+		ethernet0 = &fec;
+		ethernet1 = &eqos;
+		gpio0 = &gpio1;
+		gpio1 = &gpio2;
+		gpio2 = &gpio3;
+		i2c0 = &lpi2c1;
+		i2c1 = &lpi2c2;
+		i2c2 = &lpi2c3;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		rtc0 = &bbnsm_rtc;
+		serial0 = &lpuart1;
+		serial1 = &lpuart2;
+		serial2 = &lpuart3;
+		serial3 = &lpuart4;
+		serial4 = &lpuart5;
+	};
+
 	chosen {
 		stdout-path = &lpuart1;
 	};
-- 
2.37.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
