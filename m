Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AA6AD8A57
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 13:23:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58371C32EB0;
	Fri, 13 Jun 2025 11:23:13 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010037.outbound.protection.outlook.com [52.101.69.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DDA1C36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 10:05:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvxdZLCD+X5qj+QRVWmAPlRnr3FgVld0nh92zK1/Adw19Sy0JZ2EIkIZhm6BuZ32cLsrj9WrVpODd+7uhRX/HU3ybfdDpObq/wx+mGdjPLEFBD5DZVOYkjfsGzhl8Xw2cIw3HPkEd/b9XuhcN6omf95PFyUfjsaZv/aKWN8vM+rWwhVcgrZAA3ki1Ia7QlaTxNw6RRbEtdDcNtiG4C89MXGj9eJO4w9bQ4v/dv6jaHps28GKsrOMzZ6zDUE8saSNdPKf0YQ2rVqeWbTd4su4SQ5Icjn/yQ3SeTvP+Xl/6TfF+0vfyz4+5HAlsj8jeEHxjcVAjrUga2zmM2vX9dMoHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eC46Zkpw6d3lBo3+a+RaoeCgnAIh3kmQCFRudHTfIGo=;
 b=fzG1PU9i+LTAvolFoR8BQf85aENNmesapMX1HTl31yV7jEgByrUZowp0DSgJGAi9380yBejcbY5ShMWvL83LG81aiNrVMXoaMygh7w2+2SUjVd6XWpsPAgEOodSaazbZ1hUS2dICH2+WeEAUGPavdq4hGvV8KfQdPNVBCsJep+rVdIjz7ku0Nt1wntjt5CNLhWYjeduEWBlKT6WlIchj8j1GxVFzxV8/oyWYCWogioJZLLLg0bQ9ZDhhIDRT5eItaqk3zexLsd4dD4TyYFwQiU5aBJdRx6jXGyVgQHBBq/hx5G7XKmfRgy7XBRn0JW+no1VHx+dkf+QCYni+v6SUZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eC46Zkpw6d3lBo3+a+RaoeCgnAIh3kmQCFRudHTfIGo=;
 b=NSxZzJ+qXnJv3tlKYx9Td6S1vQFwa7Gk3Q7yP3rmoevI/h17WG9MNyg3x61P3hG4+Z7qiOH1F8VuFQUzMz97nFh+2vX1Wiheyy0VhU7n53AnNWIwVXcMXSfx3Jjuo+KcYQg/iwV/6cafLrC9LznopUSoYYaWc9CK2CbQM19ENUt323bAHJYgNLps/o8skiqWmW/VVUmpJWSzQe1Z2OpIH2CMyd8g15+DZJT/FYoSG3XxSRu7mMPmwPNubDfFKXAVC9dHZyZQxgede3PYgPb4EOtiaBP+IbRQYx20fDBqegmBJiHZwm7UxFq6P6Dnyxu4v8FzYivSHiqwYOdJgX2DLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by GVXPR04MB10681.eurprd04.prod.outlook.com (2603:10a6:150:226::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Fri, 13 Jun
 2025 10:05:51 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%7]) with mapi id 15.20.8813.018; Fri, 13 Jun 2025
 10:05:51 +0000
From: Joy Zou <joy.zou@nxp.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, catalin.marinas@arm.com,
 will@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 ulf.hansson@linaro.org, richardcochran@gmail.com, kernel@pengutronix.de,
 festevam@gmail.com
Date: Fri, 13 Jun 2025 18:02:47 +0800
Message-Id: <20250613100255.2131800-2-joy.zou@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250613100255.2131800-1-joy.zou@nxp.com>
References: <20250613100255.2131800-1-joy.zou@nxp.com>
X-ClientProxiedBy: SI2PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::21) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|GVXPR04MB10681:EE_
X-MS-Office365-Filtering-Correlation-Id: 0da86958-8a9e-4800-3861-08ddaa61e064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UdEEg71kR43V1IJYaZF6lscyJIl+DBbEhlqSc2xcEfQugF1fGy6WzkE88vk3?=
 =?us-ascii?Q?2Z43OiLk6dIn1w/4B015rLmlv2FxUSjmInsn3WqVrnzJoA6iO8IJy4iJTdwt?=
 =?us-ascii?Q?XLvGx5u0sVYfeqZrfQbbhy82XnRGZU5Xv7Z/yrjGazKYeQvWjIAMzWKzyqm/?=
 =?us-ascii?Q?7y71ECDR3jlfxfod8T+n01XUudu9x4SB3zPfY1CDXY7yh6+WyJSDEepYoDcP?=
 =?us-ascii?Q?MK+2K3kW6K6Fp4JhK9tYWl9QBSetidPOeF7068fV7ACPFQ+4YAQrzfn9zt5W?=
 =?us-ascii?Q?g6xnTvGtuPWrBJk57M7qU+3sDcSRdNmqNp0oHd4LGhmlVtx95RNJQi08pQrP?=
 =?us-ascii?Q?gVYl3FI/2pQLqavmHjooGIv/iHxyDQFo+xcdKdKLOC1MzIFtd7kxiXAII6yo?=
 =?us-ascii?Q?iolUkDvI3swQXLl06KBNn9nxUGmWEz179uq61Fl6FCFR5nUbVg+XH9dCdl78?=
 =?us-ascii?Q?5dApCvl85ESRcXXvGLP1XZ6qPZuk65ffjRryJaklC5Yu8xTVScqB8Jdl/tbO?=
 =?us-ascii?Q?2ue5C+LTzHzLjC0TaMdriRBOgJyxho24HeHQBS6WI8Y6z069DK3gnZAtoBG8?=
 =?us-ascii?Q?cm5Ba/eW6ycF5ot1Z/EDILLb9ywCCxed+oSm5YclE/l7AJ2ReDjD/w0iS5Xi?=
 =?us-ascii?Q?Ms4VHH+XEKa4FnnC/9G+JKluo1J6NaB6LjJPasE8kAmZtZvsSZxCoW6ah6Gf?=
 =?us-ascii?Q?EG1w1G221uxQk6PteAwX7/1I4Qln5wwdftIX2gvlNrqZs85m4hs7+TWRn43P?=
 =?us-ascii?Q?qzHQIJ6TmWbDXX0OJ5u2/vi7iKMiGhlIKtfGs2CboOHr59jnIj2gUZm72YkM?=
 =?us-ascii?Q?dv2Ck+Ryy8Za9kcmS2yn4EYyi6PXGGfH0dR4tq2hZKXpOtER5I2ebScPFRHq?=
 =?us-ascii?Q?TqEK5GU3xPuFZBCtrjR4x0LnSn3mqNu9YkYV4SAtVmmhaTycFzEOlZiBaavz?=
 =?us-ascii?Q?LQOnMhRghFTOQlkTj1SHrbvSN4PvA8VLmuugTlmvGGzMcyFbrbwIjini1JX5?=
 =?us-ascii?Q?Qzf0FNPR0bKsHKrhxR94ifNQNvNr62tdYuhw/aT/l7PmMhfp272LIYSCyYuG?=
 =?us-ascii?Q?VC6RWvDdqUcXatxhahDrWaen3TxQbo2RJUAr2H5i8xri+0xpOlI8P3hfOGPd?=
 =?us-ascii?Q?goABzQ8FDNTUFFdGflTXDChn8W1cRYnOcXlQy3GMDU6IGlGtP+BgKYaXvP6g?=
 =?us-ascii?Q?QXhRXIZsdF9pbISb+Zcs9MfCyhFX6Ksti2h/EAMhoLkgjTbx1OnamY2YRFJ0?=
 =?us-ascii?Q?GP/7cckKNiGciCKKIXjJZUYwFa4c1qSImcRPEqahn6u5RdR/mKrtgoUh0Pop?=
 =?us-ascii?Q?UcTtLvYfbI43c7w02+YBudnx4zF2AZdx++dPatupIjDmy+V6pyIQabOfv1R9?=
 =?us-ascii?Q?4aigeQ2wo5a6dwQP5UndKcS+UfQdd76foF4TfN2wrShIHx5NZIduxgvtCzDQ?=
 =?us-ascii?Q?l20PWGel+DQwyT/UZJR/oDzCDCV/UwA+pvkyWqKFLqYXYwxsVO5t2KJsG/k2?=
 =?us-ascii?Q?TYBv0ICvuxYysCs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9386.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Aej2B1aqwn7Wr0a5IgpnFqTswdJRAS4ICzvfGK2XCyzHmPTTqFG/IpEr9q6p?=
 =?us-ascii?Q?blB3xiY5DfOJuoO8LqKbrnYF5zpPbLDnZLRBLS9P/DcP2/fNz5iR2n6fALjU?=
 =?us-ascii?Q?eIHc/dQugXBTM2Ijg1zv8rQbbQ9f8uQyhu3uroYbmrxHMF71M+BjU+V3bsV8?=
 =?us-ascii?Q?SgYWUztrZyYIt+lBSaWVECiMOAS/rGVXKmXtag5bowj8JOncMrZNSPLF5Z9T?=
 =?us-ascii?Q?Sjd7oiWnTclGLzp41Wc6vFoF9vKYImJw9AEMu8IX1wXvmgQvZieMG9MOq/c8?=
 =?us-ascii?Q?ht8iFRU7AKjKgoSzlqSXe2qU9IoIg1D3bW3MwKUpMjws6WopSH1Jz26bW33m?=
 =?us-ascii?Q?DCwLqJ/czsvBonHSnV2PRjuby0QOQ01D16nkAKdQ2Yd9SI8pbTu+90bF2dwU?=
 =?us-ascii?Q?wNT76J8aCuopwMK0t6JWv//QtpYCQoMXSUVqOW2ELnnWF8fgKPqSgIFQfkfi?=
 =?us-ascii?Q?PXUPWx0lM7nmDb3tnr/+elr7j5Uiwkrn85KVjaPkANQpvArtfNBQl7Z/2nyx?=
 =?us-ascii?Q?m5uJ74GFFlzs+Qt7wnWZBJNr5YEJCDzWoNaoi/flJ3rIoLu+bFaKefAMQLCP?=
 =?us-ascii?Q?ArKfmP8t0ihjrjT5yTII/HBQaMHrvw2aUCB83yj45GeeMglcxuIANK3ZKRaq?=
 =?us-ascii?Q?9G9RjqzeqMrqIfig+WLag3GmtnCO22b4BFM5CaO/2kGtOhyLB7XdvKb8iRM5?=
 =?us-ascii?Q?fWI8wuy/0hkyisOrtQsPJpBQbI5gzSQGilTYUCuEdv+v+5jgfu9lDahSKzz5?=
 =?us-ascii?Q?L63EGafuSUXi8eFyjMw8oKqZpKs1YqXEOTQOnRmv0Mfq7V/RFzmy1+tyWq4e?=
 =?us-ascii?Q?B6kjhIErBf+s0dSuLIZTwHhTdd+ntn6HxcBYTeM1gNpLI4S4jEQqiuvxKnHe?=
 =?us-ascii?Q?sEv9CjgyBhBIBdxIkQC3ySXB3kfjbxaxNJg6TmtGkCCBTr20qNsZCfJxCka3?=
 =?us-ascii?Q?vEMDkFfqj7k8bvmiaXGda8OL7ex2vpRsM6KrbDMymMBGInhiX36l+qisjBEl?=
 =?us-ascii?Q?7eGYVJTnGKqPncASudpQ2zq+Mt5ip5ty+qkf6flAYnG5oHe1m3Z+TnAzH6ot?=
 =?us-ascii?Q?S8biu++2iTsaMihFY/zEoPMQxkFljvUo8oQV4jrhXNn0568A59o5X2DJXFhk?=
 =?us-ascii?Q?KB3MuPxWxC/Q1jg1obHkX0kBQKElTKWbCxBpBRMxlQHRh6HX2qOMeYskdm/K?=
 =?us-ascii?Q?jaACbYyK8Fbmci1UPTR4MflEkLPvHaJtL7My1qon+nuDjyisaZzk8B9AYi8S?=
 =?us-ascii?Q?h33sZWj9td8IHtw8RJqh7PC+Nl5zTvJ+sZmaEQ7+Ye6u6zOIx4YhELVVb7Qe?=
 =?us-ascii?Q?CE63Ka6CdF9Ego1v4qNxqhvx/w0iIO7idD998YdKhjkEgr4dIXgeOMsTO5eS?=
 =?us-ascii?Q?6PvV9uXT+iek3z46qu12Wg+vITVEvRhaT8osyNR0nyTUOY95uSRs/cxX2WJ+?=
 =?us-ascii?Q?IhEIEbOEAF5RzgCVRQt2MZ6E7/odAtAJ5vDvlm3HMo/HbXH/2vDoDFPOgpcR?=
 =?us-ascii?Q?RbtIz0DPDKH28wsSmI5nh/17fUQF1hIy49YkZZpY5bFATj56dqPsBJ/kQ8c0?=
 =?us-ascii?Q?+zblRLj8zItFGLgY5924++QEVVzJpPk24pGUqgrg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da86958-8a9e-4800-3861-08ddaa61e064
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 10:05:51.3192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8sPY65zQ5/RZAUnL33s6dL3ZZFklLMYFwKzQH+53Q9xDEEQall0M4K07ifxDrom
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10681
X-Mailman-Approved-At: Fri, 13 Jun 2025 11:23:12 +0000
Cc: aisheng.dong@nxp.com, devicetree@vger.kernel.org, peng.fan@nxp.com,
 ye.li@nxp.com, ping.bai@nxp.com, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-pm@vger.kernel.org, frank.li@nxp.com, linux-kernel@vger.kernel.org,
 xiaoning.wang@nxp.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 1/9] dt-bindings: arm: fsl: add i.MX91
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

Add the board imx91-11x11-evk in the binding docuemnt.

Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
Signed-off-by: Joy Zou <joy.zou@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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
