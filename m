Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF45B1C50A
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Aug 2025 13:42:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 027B4C3F933;
	Wed,  6 Aug 2025 11:42:25 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013063.outbound.protection.outlook.com
 [52.101.83.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E822C3F932
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Aug 2025 11:42:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h3ARd7PhrBPtqBfUmmAilpclQuQHTpSMbLThi7mSwzTxAJwpjlMvLVJ4A3Jdzu1DG7zA1YqEfcM6YqwNBjblilVw+Niwppd6PT0wEGzsJpgpk4z0xpHhBniOXxAy5WdNvFBz+P0kUIevKVmQmTEJ5I0MD2HmvROwJiuPDVHcuzmrajSX9ytuJCigO6NhR8cccjfa93WAowimGxN5mntyOQlvvjdA9mFMRfnX9iseiBqU2AbdQtv5g6gdJgJmQO2DAzfMMvHKA/fb8bIXy3M20r6YiEvc2zUGd5hwrMaVCC9o/uHadER5sN9yGqnJx+7ML9kkKLZjyoJVt4HSH2r8tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbE+66LFmQJo5J/dMPCr9Rnd6W1EQB/Bi7cKlFllcso=;
 b=vHSF9m45SYdXGiGWsQNwbIg0tJAPqo/F52D7sS5/cktyKSYUR/v2wjy/ZI87WhPUapczw2DUp1PdrgS7uWeVJeiE6dDInY8xbBb75oqN9zxgGMKp53THYyN8R3xC0JNJb3nzU148sxQWJ41Ig9IhDj3FJC1122/VScBfEksNkZoC6gjLaU4UQ/HHiie1AxaqdCrThp+ehUPWzA0nK7jSfvzvLwtoukDa6qxsX16Uml6+kenfDltdd3yZALU/ve1FrUGdz5RI95QOK2Nxk9dCezYvhxXwH4mtda63ML6TWYM4eomdutq/O9hqBK/8rqIRKKeHyQXP6GMBd7cjJRd3gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbE+66LFmQJo5J/dMPCr9Rnd6W1EQB/Bi7cKlFllcso=;
 b=SL8rKXuziH4FiKpIERCUe5qPuF1OSfTaLV5BbjR8TFeJ23pFrudGR228ApMUxVovMKY8iK60MxOiINDuPghwvU+1KWgknSIdN9T59LJ0xcd6WH22WdkWUiG+jnc6elAmQKPnIlZEKz/arCr67wJoHaMHRJVJX5SYx+XtKN+Sdl6vdAgjwOj4Fa7GeyJ6/DJOZYGddRdr4CbHWW3it8V37rghth2jqbtrwXpgLRQIXRXWAQPRUeDvQXdWKM956R2yUtN/cXQKJo+duObQrQG04qpeXgEKUxQUXo9V1wB2VpQJzRytywMg7p28OIJruKXOjBjgExJB8RIhVLxCxstCJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by AS8PR04MB8312.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 11:42:22 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%7]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 11:42:22 +0000
From: Joy Zou <joy.zou@nxp.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, peng.fan@nxp.com, richardcochran@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, ulf.hansson@linaro.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, frieder.schrempf@kontron.de,
 primoz.fiser@norik.com, othacehe@gnu.org, Markus.Niebel@ew.tq-group.com,
 alexander.stein@ew.tq-group.com
Date: Wed,  6 Aug 2025 19:41:09 +0800
Message-Id: <20250806114119.1948624-2-joy.zou@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250806114119.1948624-1-joy.zou@nxp.com>
References: <20250806114119.1948624-1-joy.zou@nxp.com>
X-ClientProxiedBy: SI1PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::11) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|AS8PR04MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: 606f4d72-4495-400a-d27a-08ddd4de4e85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EwC51frHGIVppn6T4T8cWx+9y+9cc5rViWb3Np6/cgZ/HEJTQTyErUA+Jbrk?=
 =?us-ascii?Q?aQn2Vo0U+BDxDYyJKZbJXpuemUapuAKyrjcfFBilYWdUlcqMdtRv+9n2fl5H?=
 =?us-ascii?Q?5k336ERfGxC558Xm7xLT5wbYLcS3SVG3xRsYkYBgTL7tAZNutM7nUt3640Yq?=
 =?us-ascii?Q?iUeiyk3o6O1KiMtLchXKmqc1g9Q/yvIsj3vHjZzIP1MNm3z83EoPrzViqmpi?=
 =?us-ascii?Q?vFuncKHg98wRriWTkU7VtJYBACxXef/2OT+BnIvGfWUp7ZeYYokT1MJHYdnl?=
 =?us-ascii?Q?8yjRoQ9JAIWu0aE+LhJAcHEMAaUykCcG3fjZsvEss8if4zM0CG271MKB5J/B?=
 =?us-ascii?Q?HGv1Q5C7gqtyYNxi0GoiBMrm6QWiG4QDzQ1u+MsFl97pafWHEvVMkrHaDCJP?=
 =?us-ascii?Q?g5euhupy7k2LHq0ZtExapZKs/Ysye3mzqxw+vL9Rx5so+4sZa+6+ndLuh0Zz?=
 =?us-ascii?Q?tEEmqHoAbyLChwLeMTHr5yOD56COzifEusn2ekwpHLGqZIZzzlBD0c43aWD2?=
 =?us-ascii?Q?eV5JrcVIBKQgrPQlrB/OuFvlmUV1C2SZa+Yo04UFKNxN9FmrGUk3guL5KGCW?=
 =?us-ascii?Q?P4V40AXTiuyEXfJ+fNgs78e7Mv4bGQPnYJccVK83hkzZFEWBzA20J4TODPYZ?=
 =?us-ascii?Q?2hNv6pPccTwy2+MNKF9O3zmpGXBZ8T1P2RCUxZ9fXNqP7NIsGu04fBAsleSC?=
 =?us-ascii?Q?4Ncff1SlY1KSt0CSW9NG6xmluW1vcd28fGODuCQXFQHg/EoMM6RhQ4QAlAkH?=
 =?us-ascii?Q?hy4nd9CuPBTXg3qNlO7hjUCFvCeshH0J5wJCDZyi6heThkWaNQfpKLvq+BvM?=
 =?us-ascii?Q?Fhbmhq9u3zaTjB3ojOYeCxYquDsMtX8oR1XFotHkt0SXSLOk//eVu3u2Kqeg?=
 =?us-ascii?Q?inLR5e+CYucwswg2cXPRg5czqWtthBtjGRE9EXK/ys4RR4l4Xesbe4pVvsHg?=
 =?us-ascii?Q?62+CG5RSiBGdNV/3Yq6DT/BUcRPLtP3nD4TOIrPROIYHjctRjsS0MnbT0g6V?=
 =?us-ascii?Q?4NLc0ym1zsVxfcD/M7ubgSoown+4cOEXNDm8AvzXzJsJjt7qrxYm2i+GXhwE?=
 =?us-ascii?Q?SB8VX/aKPf4nJVL1mRFjpNFp4VfbUF2Su00E4vT5pcqqAaeKXnHmQ6vgkI7m?=
 =?us-ascii?Q?t/DSW7ucdMLHf6xNlRg36myOve5wP767R6MwcxDGlOMi2xz6Z45pxxzKbEED?=
 =?us-ascii?Q?KjSy70M2SZUyNd/iz7e1lKSdTNQzjAWpwTUdnH+bmry/4ntZYk/dBt9kKGQg?=
 =?us-ascii?Q?qVQLe2LQ7rYxWVqR6jYl00hTN+30BLIDxVP80LVZJcANVn5QmdTH27eGhLT0?=
 =?us-ascii?Q?RODv6SuAlfPuNY0PuxF27+taQPhY6tbnkypH6v53WY3D619VACPQg3l1stRR?=
 =?us-ascii?Q?aYhV7jSuCIiMB5ZTy5V/E5E3aRjsa2kFGoabFSePcSOch0pIwVE6HV0n/PN4?=
 =?us-ascii?Q?xZ/q/W5yo5HtRS/pJlJnDYMHaLH+gelve/7KytBIj6mRP9E8td3XYmhJ1RiA?=
 =?us-ascii?Q?EvlCZhksDPsRlmI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9386.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9pFsCaAcPG0OgEH6wUooe5t445xDnkuoN5eW8L5cb1VGzQD3iUPp8z2KAeI8?=
 =?us-ascii?Q?aqxxsWNChNrJ6XWTXInrfM3fDR+Y1OZ5QH9YC/S8lIaxE90ohcbrLC32fYDs?=
 =?us-ascii?Q?ufN2Kvjwb1RPwr9PZHQfsoLwZ3Uq+HuQqGHQaR3c3myLDbrkilh9tsFyUgKQ?=
 =?us-ascii?Q?uXDVzT88XQeOlGu8ReFJNYHtW1PnhHVr5tDeNGlrVRjy4i4OcR0n3jKIRB0w?=
 =?us-ascii?Q?u7Q3MJ+tBjTqE6A0oiFZOeOQfU+2kWp36aOb00TF9BHSND4qT4BI8lf/yOjE?=
 =?us-ascii?Q?kBy0PLPQHjh6cHJ6NCqLYgrlLn2UI9hv+apiv0DOowrkKH3E1NJZ0iZK7+kl?=
 =?us-ascii?Q?rnSm8WgFNrZOdHiF1Pi5kdQtqUtRvCgw9UiuknKuj0/ntlldAjh5FbeVRsnp?=
 =?us-ascii?Q?fFD8oXpcHrsWTHplRo/d94xx3I1J3V8YqMwPquX3spvchl96a6OQEh06D4K7?=
 =?us-ascii?Q?TuK6jgNNNzv34BOpm4RxThtOb6sQcT2xdUWXjl4hU/UP55LUuvEMncEOYMir?=
 =?us-ascii?Q?L8fi50dC67LKwDT0bC6hQ3Q9ryUkTcasDlM8hH1TgQ2DDg/FSYlP7mZAKC2/?=
 =?us-ascii?Q?moy6ukeBsmXaarNg83c0q432u6UjVwNceer8IhNCJjeeJvFCK6JZ4myIu8kC?=
 =?us-ascii?Q?spUmd5+6eH5YVdc1YMGeXjR8ka179hvn0rhBF0o+z95hPI4U40zqjSId58Vw?=
 =?us-ascii?Q?D/oYGOROczhmuLbPOCRDAq06NYVvnKodW9bq+zO+OntckqweSrI2uLdo/Jx7?=
 =?us-ascii?Q?s2mvOSRkxFxbEDSeb64Bs2beJ4p/qJWrhG7EPX5oY9e4RmHFlBq6jXEaFchU?=
 =?us-ascii?Q?rPmPdufmAMXC9ZWhRlxz/kOvjY3/p1U+eDlkIitgh6RUdW31XtGlGT2RamVw?=
 =?us-ascii?Q?3eN8cG0jpTRICpwlx16+04haqsq1gqXJUZL7u++azlIAJXAJV0UYSNim1hEE?=
 =?us-ascii?Q?uPJCtA9p9R3lLmIgi5llU7W03Jy0hJuP4X3SHrG7a0nWy9rWOd/5c2H/91Il?=
 =?us-ascii?Q?JUGOId0MP+A+JO3XX+QC6GPZQvM9ycdYd/V1Vk6N3JTSHaxzWduhaCQEXYqS?=
 =?us-ascii?Q?P/ITsL5U8Cfx65sO1O+iaOXZZCwNQwOPjfgfRwfmaRFSvpUnq46D9q2A1+79?=
 =?us-ascii?Q?ficLwNPXlXXuqpkfYeiMLH7L9tZXl670gzhrV1GgWh8lQyoT9Va7s/jlu0hZ?=
 =?us-ascii?Q?kYYbplboxEvSRdiOOUGKnCHARGtPc6JAQ0jGLocJwwcRJsp0Q65lHAfnrbms?=
 =?us-ascii?Q?stLH+YfPGeDP8BEnf4Z/y17mHyiVJ5xYtDn0XyexF4lHRFYQ+Vf8O9RNHINx?=
 =?us-ascii?Q?T8KWBdrr0G/ZMkqVFKKaM2iRFFF0JfhhtWlf8diOd1mOkfMSHHfKNJ7zCxbU?=
 =?us-ascii?Q?68QHWaFsKMinamf+i+2AjoGIqeZV+BKj5DiV997ZkBE7TWqceqD+12wQgsUZ?=
 =?us-ascii?Q?yeyx097MJkRznxl8CoccKdb77j7Vyeu2Acmt7tc4slyfKB6p3zUTQEwks5PK?=
 =?us-ascii?Q?oSRhffGgaTsCrTdgAcbyCZ3xgM2jZ8FmH1p6mJEeqnMO6Ud8hvXJHtotU0lu?=
 =?us-ascii?Q?4fNfV8u/DD304+D4+sYAilDaETfOe2ICd+g+7zc0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 606f4d72-4495-400a-d27a-08ddd4de4e85
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 11:42:22.5852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUST0ihsIJDvWVr6N0J1oIUvDyvpK7EFSNbxfllpW0CuiyNzcSDFL8aSe9u1wH/+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8312
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-pm@vger.kernel.org, Frank.Li@nxp.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
Subject: [Linux-stm32] [PATCH v8 01/11] dt-bindings: arm: fsl: add i.MX91
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
