Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70392AE3B5C
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jun 2025 11:59:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B916C3F940;
	Mon, 23 Jun 2025 09:59:46 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013035.outbound.protection.outlook.com
 [40.107.162.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 151A1C36B2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jun 2025 09:59:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UzW/Jxcxr0a+P0L8een8FCLMvOCVj/WX6XbkluIkORY6QHoGxzhngAqZPHXgs6Q3Qnh1JiV9L2LMP2EOSs7cgp8I3/oSAmhEjH4Lc+4hjiBpIS53S8tY0wRZCh3nPQEq1j41hNpQ6GimgYLBh83GzbgQeW8AN0GTocJQq/EJjrw93v4nsFJcSrZ9cgZFc9Qx8ENUpuswb/rPl43o6q193OANoM6QgJ5AOHUTYWUdBbr/eQpDua/92dQkjeYL4cPjABf9BWyeBV+PT5i2juK5KxZZZQbj6aF7TBLDVS5HBvJzfz8KYjiEtXDb8V4nET26h7S5eGSq4y7rzk1YTzFOnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbE+66LFmQJo5J/dMPCr9Rnd6W1EQB/Bi7cKlFllcso=;
 b=iAPCqufkfpxH1wJ9nPIBYI1TbY5PhK+bmJfp1ljnn71crqj2lGzJm6uHFNGs5E59FLJ8FHtQXJQvpsusG9zn7886svYF5llioCChhkz9etTKw3omPisQXUwkCQWG7+sJnv+/8anJYlHg25nkyfthpZEYysipeXbq0lvLS1WJvMQrp0uKeuIJhRn+e7K2eDW5A+5MyGsgY3LHgoQ/XlMtt3oxnPuPNmrYIQgNa6K/NnTQl8+Ehlx/DTAn7uFKkzWO036mXWlzzz2JndpyLzSMYdDqX/juxCVT1BFWmqm3GmMAcbOAVoDdpTFcaAjUM9nh7oZ3pBGwpqV9da2DGOAbJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbE+66LFmQJo5J/dMPCr9Rnd6W1EQB/Bi7cKlFllcso=;
 b=EiP7bQzs+72aR6/w1dhXbl/MKMN9ScgGIIaEuX0BqlseFixnIcwz/Dcy/SApTg66fjCIEk7lT3bWg9H+5QvK4eX3N6ry1EUdft0LW7ZfWX6/jqzOCrPfVYFjxFl0Ym4eJkKpIP0f+P4yf8r27qitfawcjNp3fDhI0hSnRMdiYtfrTuS5j0IuF4RA2Xrjh0cW/WJ2gnLjc/18lQx94wAfxU//GmqBA8hgH1A+iDAQ6jZbx964Yy2z/Wn4+Gh7i22XCbNzkLfDcLF0WM7JP93VByo4JesVTcGl1AKm/6BtSH+NxlTWSgiuQwS2xF9bHjfdMZfD0JUcQUxdsgndyBpecA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by PA1PR04MB10841.eurprd04.prod.outlook.com (2603:10a6:102:487::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Mon, 23 Jun
 2025 09:59:44 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%7]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 09:59:44 +0000
From: Joy Zou <joy.zou@nxp.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, catalin.marinas@arm.com,
 will@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 ulf.hansson@linaro.org, richardcochran@gmail.com, kernel@pengutronix.de,
 festevam@gmail.com
Date: Mon, 23 Jun 2025 17:57:24 +0800
Message-Id: <20250623095732.2139853-2-joy.zou@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250623095732.2139853-1-joy.zou@nxp.com>
References: <20250623095732.2139853-1-joy.zou@nxp.com>
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|PA1PR04MB10841:EE_
X-MS-Office365-Filtering-Correlation-Id: 5af9e7b1-3bed-44ee-e4be-08ddb23cad9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|52116014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gGlk4MfTiO7Q6JwEegHvjOmqj4LhilH8j9y6FgH5H11r40xm74KGQA7f9iUv?=
 =?us-ascii?Q?zgGGeAeqcgmQxbl8qDkgBR48VTS+a+vVF0hCUOPihoPnrM1PfuzpJKAy0y2Q?=
 =?us-ascii?Q?HCNYH0/pI/tkf9F2N+r1YPIvMFolaT/H3+zqO1AfiZprBl0r1Gb/ePOjGwd3?=
 =?us-ascii?Q?vA4rsQGQYSxn0DgVvnYIecBIZO0npXrOw3k5VGi0JcuOzVGo88rrqLWJOGlm?=
 =?us-ascii?Q?kNZQ0gHMctgD9JvQH75gX8xWjECdrkDrEYWvL40GqKAnHbvnx1hS5smWPXFG?=
 =?us-ascii?Q?YYhMGhBncQEPe8vzJQ7FgsqJuGnnzEC9TXE5BDyenly4b9w1HM8yrZy36MDr?=
 =?us-ascii?Q?mSTP/yaFR/mhT0RmRPQimqF/cLSpoiCW0r9QWsz+g1MIZ8KwRiSlg5zj/OMF?=
 =?us-ascii?Q?EDIC7VucHikxD5dDmqlPl1hxiQjG5iUIKLvEfHDeFnGx2mYYd1nGFgD87Iui?=
 =?us-ascii?Q?9oQOhNcgLNny7f02XB8asDXQgunDYAYwSiC/ynhs77p/dewWYt7st090ANb7?=
 =?us-ascii?Q?qoE9q7br7ozSTHAoFgg77BvkkO+OgcGZ8MR/21ya78PxvCu1/Ik5ygioXgJy?=
 =?us-ascii?Q?rvNHRjfvQ1Xl6TVYb1wJ38Bp91tyDn/tHdfOvABG/dKq+Pn/r5a6+dm/P91P?=
 =?us-ascii?Q?D6QJPBmPKRCqxquVVQxhtXAmOAqcnhY7wlcJ55KsXJ0FSgN15qYsqKvg2RLf?=
 =?us-ascii?Q?NJ0cxuMCkrt8Prj3uvkRgjGzrKd/dAno/HCf2Zrdgw0wcEPn2QUa7I/qmkL0?=
 =?us-ascii?Q?I74Sz2qDsCSAjnBdgSc+mnLloWxe2UA43a+4cHDXaW4UEz8LgbyayF+XQbAG?=
 =?us-ascii?Q?I9YTAOsEM+7RLEpG6btP82QjeXdjJG9YacK5/JfEAdKH206TOLy4N2zwVXXe?=
 =?us-ascii?Q?y3csTP4pzoCfV/A1dUTqTjlGhk2EoEjugksROldWiPRJJR0RBZojuzmy2aNV?=
 =?us-ascii?Q?cWb4tz6CjxF5CF2NBBWvRJe2h9pgJLO0LdQNzYumVH24z0UzY+4gsS87XWQ9?=
 =?us-ascii?Q?wvszvgY8FxsgXcdrj7RaWnizYMHkPM7TFKN1QPuzlLiNgrWsjRWG56HAeR1x?=
 =?us-ascii?Q?8522Y5F3wlri3UOa2CLeDs0MT61o/XLNqFze0b219cLeGOuUj42TG3nuHuc9?=
 =?us-ascii?Q?x37gIXuMEKJuYPL4W70r0SRaCsueQAmW5ogX7MGWJAGJVNqSeMJFoDABdf+c?=
 =?us-ascii?Q?XIrNFM9oGhpq3fhneaCBcOlpn1Wn+yb7LwmgQ0cFn0DT9s6qVYlydgLvlh5E?=
 =?us-ascii?Q?MjSJwU+WVs4wOzAvsp/Ns6mQhI69xekituZgZ4dwF4IPLUXBVC08M5KgI5x5?=
 =?us-ascii?Q?kx7jdQZM70m3gHIk/SKjRMtwhmBbl1Lq/xGSy6B2C3uqQcK7KPQzOqVz2Pea?=
 =?us-ascii?Q?JH2Bj9Bur+4+KnI37hP38p60aaEcw2ZKZHWKuKx+LyztzLI1xvYhOX3SqO8A?=
 =?us-ascii?Q?+3ROKMhcshAFMOndbQ/mlHWfJqv7/wh82citYtOn/j9K9tOOCWIpp4fNH0r6?=
 =?us-ascii?Q?tIBgCf/NkEWnMhQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9386.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(52116014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yCo5LxKQc1rIZHoUmcMMv2UK1PRGJarjnuvo/HKZhJymFxteKEq4jHNEg50B?=
 =?us-ascii?Q?YccWc4GkFEHLf8gtMb8dwtXxrIx8oSIMfNiPpFzI35jIp7JXVvvd9mpsTFDv?=
 =?us-ascii?Q?g4aibauQQXAT0KtMmkxjanfuN37WH9AonFAGJWMoiku1/9hEszhYN2OciNQ6?=
 =?us-ascii?Q?RXlXCODp2+GAozUZliEP1m2D/NMLEQ4S1V3ipU+Qv3MOPcgcpakqyF5fJC1D?=
 =?us-ascii?Q?DhmgsU1irymvK/OQ6T8KH0PCd+JtBzZtq0eGLOAEt24pCHJ9+I3mBxDzu9Lv?=
 =?us-ascii?Q?1psQqjOBaPf3RV8xFD3kTu183sjD/oYMrdaWne7gqlp7KP9JEmmjLdSyrw/a?=
 =?us-ascii?Q?9aaeRsmvNaLsz2sy87X4WBnoA8uQ6Mlpj+ouk8o7AJujOMqGEutyTu7yAvy4?=
 =?us-ascii?Q?Zrj61xnNuR7YBbKyNLrAYWHbCtW8q4nKleTBO2zuRKTCGmwhp6forw0Rac3n?=
 =?us-ascii?Q?jU35vweluVnnw9b+7y35fAcep68ojmrEuhAfPORWDsmRR+vn3GWUosjPJ9I1?=
 =?us-ascii?Q?Mmeq5w2CvlSMCtx2nf88xDjm5Grqu2xxFSc+gZM8fpnCDHrHpX7SK4OsgiCz?=
 =?us-ascii?Q?SFMiGuZx0L14+KEo7DId2f+0lHYQ8uMwF5NS+uzyAISnk6CRx+cy2uAzOzMA?=
 =?us-ascii?Q?PxFMxoL5sFFbMA8hFb/ZaRYZpRjAxS7p5zUWfLHHLK8S0t1jw7GGSOStIjHN?=
 =?us-ascii?Q?NJTcDnhro85TK82XmmJf2d4j8X+o+S8ktlowNMKsYokVrkw3n9tOYP5dz+L4?=
 =?us-ascii?Q?Sj8DJSnWsut72gNTaDxhj2fxxdBOtTNkniUTl8n/rObSnNQo2TC0+dSC+7+6?=
 =?us-ascii?Q?HTy7vID2rFFDyI5l/Av+sRHTrN0ZSg6Z44KxZQHP8CMeJbdOIph141ylqQnC?=
 =?us-ascii?Q?t1WVW4kYqWFRiapz8rNQWHAz9rnLF4rtwmJ6BFGmf6D4amJ5GHD01prFDRoS?=
 =?us-ascii?Q?w/6wv1nLjaPXbI9GucgAqGlMMtZqk+IQgDncQ2elbEw/XG+sYNzPVZnz/R8u?=
 =?us-ascii?Q?0IP1z72ti/5ALNVXh8sBmAqWbfTkNdhBB6fJvPeYIepTZJrPxgLIM02c4w3b?=
 =?us-ascii?Q?+zMbYHvlt5IZd7Ggi+6kuEMYxCPB/KaFXNPesI07Cz5FBzlaqdF8o/bjk0Bf?=
 =?us-ascii?Q?HWadnFVhRa9u2IngP8FESlAlKl8r8pYucA4xAoWOCjN+6msmw2iJUGiynzyY?=
 =?us-ascii?Q?bdRRM/PGwhoQFjOc3ooIMUhJwm2J9xLXzbZrLgJ/W8xFTcIecz38QV6+goTe?=
 =?us-ascii?Q?sU9OcukkJGmjFhov9/7OGINorSqmxFlb4PxViopG1pN+j4mZJT7QJ/viyOJC?=
 =?us-ascii?Q?ugoOV0tftnWfve1Z2oRc2Jmhs4TzCO16g/mvKEjm8rL1CegwbarESnnMtCLc?=
 =?us-ascii?Q?IvcffIGxY6IXndhYmZIIhwi509EKZXU75Dn4csK5yN+IfFhAfck/BHf118oX?=
 =?us-ascii?Q?p4obmp4rhhWvi+mOfJSKKxyG4CNvKolHiCMGAXUEE7JsVLNL3SSyCMePY2iw?=
 =?us-ascii?Q?mBcQ4gwzzMXDWSa/mLTsN6YvOTOl1D85kgrcF5H2RX1qw5UskS1gXa2B/kJ5?=
 =?us-ascii?Q?PDK/rjdScnGx0JmXeQuruMCnJpAHvAF0AqNLFZJB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af9e7b1-3bed-44ee-e4be-08ddb23cad9b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 09:59:44.0294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ZFtkwDidwHrZdPHx2pyBlGMt92OLTzKJF1CngOvbh8CUmpDeUOvtul7jTw1FrGS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10841
Cc: aisheng.dong@nxp.com, devicetree@vger.kernel.org, ye.li@nxp.com,
 ping.bai@nxp.com, imx@lists.linux.dev, netdev@vger.kernel.org,
 frank.li@nxp.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.or
Subject: [Linux-stm32] [PATCH v6 1/9] dt-bindings: arm: fsl: add i.MX91
	11x11 evk board
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

From: Pengfei Li <pengfei.li_1@nxp.com>

Add the board imx91-11x11-evk in the binding document.

Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
Signed-off-by: Joy Zou <joy.zou@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes for v6:
1. correct the commit message spell.

Changes for v3:
1. add Acked-by tag.
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d3b5e6923e41..a778666b1d42 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1374,6 +1374,12 @@ properties:
               - fsl,imx8ulp-evk           # i.MX8ULP EVK Board
           - const: fsl,imx8ulp
 
+      - description: i.MX91 based Boards
+        items:
+          - enum:
+              - fsl,imx91-11x11-evk       # i.MX91 11x11 EVK Board
+          - const: fsl,imx91
+
       - description: i.MX93 based Boards
         items:
           - enum:
-- 
2.37.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
