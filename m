Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D73B1C525
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Aug 2025 13:44:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07223C3F933;
	Wed,  6 Aug 2025 11:44:02 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011066.outbound.protection.outlook.com [52.101.65.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB18AC3F932
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Aug 2025 11:44:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtXXj9UKodzwJZag58lGHzD/337vTg1HmN440+9OsSpkGDDWwtmoWqoEo+Z2Pl2g8VWixRCwKRy5pHZyZ7Sm/s7XKaQ2RXXrg7jgd4LeRSN88E81SGGQQ8jhRyfIcjJ50mezuprdZThDOGvr+vcOa7LD0RglxR15dwVJWyXJLB1chscYJjEgUB627THofW/boYdXaQWYng4OzjI4bo/gqmAs2asXTBAlht2nwvsWEoju3VNf1ILQYxZVR8xsHWspIllUuQ2JEPLjx8Oi0gKxFF+P8ZEAvM6wU0+zsmkf3Fwvdur+gIIcLKOM6UnarOwJ2YjpaKuqgRo7Ygyte0ojIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5rtlo0rG1y/W3Bg6TSVjOXBb+FTQf0+QpJ+pIxDmZs=;
 b=Ma59UQtgI1YjDhjHS7bBaMnb5F/Gw73k27vd8Ez94KelxeszRIuq2d+YBl53LCmZt1JD1MzXxFM2wM/nWZYXu07h+rD3OEFqXU1LUVmTerx3cm5P2+1zAnfh3qjPsnO7TFTriRuAhBHN2vi6SE66jDJ9auWl0hCbZfT2Bhlhsu2hcN+Iw7iGBT7+ibQmcsGlxzaHhCXnU6X3o6t80lOo7jVXGawWN5Rkw4oaPyUG1g6szg+ORqHC1y4H8hD2n0kOdAj3Je1VgV50e70Gen0y0taQjjYosmim4uKV1rM8Dml2movj2I2sASMK5TBl7ZvjjJ761xBBdwfc7I85L1V4cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5rtlo0rG1y/W3Bg6TSVjOXBb+FTQf0+QpJ+pIxDmZs=;
 b=A/O0Z0ZzuBsnWOaL6emuXVkoFSiQHJGvud/US+jBd1pbH9/Bsv9kqMm+yflmzE95SK3wqTeQT8PAGUOSAnadL0aexFnzJH7qwQZF5zd5r3qVyy41GMk9gcHv3afOv6NXVzXWB+oNZ0igu/l139/7RQWgTz+EjSAcsNSRQTPBxtF0TxFfZCSLsXMP+ot4HVCmJzOuSdaIUYHHFHgCs5gtf90VhClOkyoJ4SutZW4QdWh9Cnf8Ov2GXGOCTlBrc9fvuXDrPlGdKFGTBgJ43JfE6yUVxPKRXg123sqXxbXo39V2MCSxTB/O6g68ZzhxT/kU+oHUt5zUJyrgEpxSEscgQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by DB8PR04MB7002.eurprd04.prod.outlook.com (2603:10a6:10:119::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Wed, 6 Aug
 2025 11:43:59 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%7]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 11:43:59 +0000
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
Date: Wed,  6 Aug 2025 19:41:18 +0800
Message-Id: <20250806114119.1948624-11-joy.zou@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250806114119.1948624-1-joy.zou@nxp.com>
References: <20250806114119.1948624-1-joy.zou@nxp.com>
X-ClientProxiedBy: SI1PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::11) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|DB8PR04MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aa39d86-4096-4cc1-dd2e-08ddd4de880a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ss1h60HBCCa+Dj1PDKXQOxA43vQF9Vd/znK/MODrh2HIZONouxztFNzmR22V?=
 =?us-ascii?Q?WwxGoHim5U+s0I1KuaVrlYetu9o1a9+NZJ+f2d8+Wh+WNXQbfvKn/5125nAD?=
 =?us-ascii?Q?FvkcQgzlaIIY8lDsmb9VOjYOvX3nnTl0e8q3Yqp5XRy41z1LfZTO63TT6pI/?=
 =?us-ascii?Q?2U0rUTDtHlfGDlpAzluln8pt3zII4UplWmefRiBplJ7MIGCmzzLct2zVfphl?=
 =?us-ascii?Q?3qD0bTYMJMgq0WtsrXnyvSS8JHcMNo0YiPbnJdDufj1Ma9LaPmJAwhpGWHUF?=
 =?us-ascii?Q?0Tyu9RqhvHen6eZlLAmQY8I2781W3L/N86TWzkmvkGJcHvx+eZfTimDfD4tk?=
 =?us-ascii?Q?N4KaGj+QthCb6NXGZ/dZB96azFdIig7Ftk5WCwCeZSmYl3S96oezBwmsEb24?=
 =?us-ascii?Q?FveFYsMI4vhzdXYa/s9heGnnRZSGbt0Dp3y+DEn/X0/QTxH9Mnfx/PsIOHW1?=
 =?us-ascii?Q?82KzcGfTGo/RJuJOtN7avEsiGyZceIw/l5zE2jSJuTnR/RPPBB0BxIHTgx85?=
 =?us-ascii?Q?Ricj1K4eFF+AKrVDYrjo96yW/qDpe2g4TmArvgLxeXShFzNKnPLid4QyNwx6?=
 =?us-ascii?Q?j1Q5cXezblNx43+m6AJcuzqw7aLDST8Rrp695j+oVzCijBh1JQkxSTOKzlk5?=
 =?us-ascii?Q?HXIFiUzmtxCm+AhnRXFRb583bqO28kYJDKgagsiqcVWIKcOv6G3WKfxsl/Qi?=
 =?us-ascii?Q?n0MCG68s4fyjSG1JdMuIAnVy5GXpMYOJxLcQBLC3DMOkdmgG/9V9U2GfhiA2?=
 =?us-ascii?Q?oGCVUH3eNzmWW5nxKyF5ilsOUPFluYeVih1OZftbUY7w+mM4xLkLgf+vHJ/+?=
 =?us-ascii?Q?d5UMZnq9EMIGH//CBz3mcOZVBma0DiKZeghxI/j/outfFquH92XDorVEP5ij?=
 =?us-ascii?Q?LndJFhg6cgG8g4YVupAHDtZiuaN+7RKfkQHgpisu7X0b06APFN6yLLq+Ywzg?=
 =?us-ascii?Q?qnyEPgZjkfnautoJq0jeYtZ9UnOj2Yf+0BFVGWZk09jgE1Ffi8xbMiUfGdAM?=
 =?us-ascii?Q?z+2DWD+e9mN6u90VwRThqXZdsoTkffFMd4xlwNil/94XdFJAqrDtpamsXSL2?=
 =?us-ascii?Q?a6psZi/dHmFnbktGuz8Ms3DGjFrXzgq9MU0fQJCyw55JbCuqFM+CCTyjSQQA?=
 =?us-ascii?Q?qX4ABWCA7V7M80INK3CBCt/DS/FM0/OQOgP/3uW+JJqYCKIunTdgI4pm3YMM?=
 =?us-ascii?Q?Q58jXxS5apNkFkgp8H9W1sUfVwMqTuJVl+0a5JvKQ/Vhw5yqZ4cQo+kWlJ8R?=
 =?us-ascii?Q?QjoA05OSmgRyLVAGnXDFlnVo+JBwUGOYiQhcRExddHBOY7KQOwvC7KoGxeok?=
 =?us-ascii?Q?Vd8SZOiThS4oK2ufTATw9yZN2Vm8MbX7iTmgfGQqTkjuM83yrRjN8OE9EmkX?=
 =?us-ascii?Q?xo0bKnv7urFw1A4PPxwA3evzWG7iTJHay3xVhCWGL2itrS7uzxr1f1whz0Gm?=
 =?us-ascii?Q?IDDDjGFlCDmSeaaoE0pP9CIlBWrXDfuqJgpo8DQ1pwVmaqUlZOG4JeNo+wfC?=
 =?us-ascii?Q?bqZ7f3crUdUGvWk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9386.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(19092799006)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OnEskXmyqpJa9c+JF1Op6GiqADplf4Ek/Lvh2C4ns83cc8KzkNNWHlMTuHul?=
 =?us-ascii?Q?t7Ze5ULvszeFOupkKWlKdlYQLCly+hv9FBS3QAFcAAVI7v8r5ST9gGIleWZZ?=
 =?us-ascii?Q?FPuPPBAYYHa6Jt1jqYKbPjZ3uEcQsRI0vWkoOufzOYdWcztxc3iV6QK/fiMk?=
 =?us-ascii?Q?pucraUKXk5UryId4AbX1XCIkpID3rL4UqilVd5X8SH60bF/EG4k7OEENUKn7?=
 =?us-ascii?Q?ttPdSHVz+Dgy5nx6S0DlQHqpqHsNrJFYENjqc4Xawi1RICCdQRei2eF3xp4Z?=
 =?us-ascii?Q?eNrZjNUqhOszr1YGCVx8Ih3hLjz8LaAW+7PFc28nyU+cjxuU/29Vrn/JlQ5T?=
 =?us-ascii?Q?8WuTKuvBt3PsVy5s59H9jeYIvXuJRMHlfL2Wzp3oqw0iUp1dJp0C09S29hxH?=
 =?us-ascii?Q?mI+V9fILC8IUN1H1BxkVWlA3QF9cVxrw1VlcVX7BaZDK12HbZt+dn1y0cPn7?=
 =?us-ascii?Q?/LB4xUQvDkNYm1f6PcDh57QFJiYNBLJOKXPlCeBbUqg3eguGk+sdOxj30I9v?=
 =?us-ascii?Q?/Ms3CpHvkOxoHW0GWUfFetVOy2iFXMBkTzKugOMzA+dFeTQIj1auGRAzolQl?=
 =?us-ascii?Q?Q4h47525BDNPeh3XWHM14ibTrl5nso4UWyu60KExObqPGTZd7//CV9HMrpD+?=
 =?us-ascii?Q?NNc7/Z+mLvvD9RtXy1a7WB5WAYrNH4gDrLdDqprR2J9p1LMHHvm9qjgQgKnP?=
 =?us-ascii?Q?RcnRVrb5j9Ky3G4OUS+j1dLIve/G8HDWyhZMve5xhD1lw4TvI4AkYG5kezOB?=
 =?us-ascii?Q?VdwaoyN52igqRD0S1FVt6XYcjMBFrHYGthG7WT6ayS36z3pCBe2xm8SOpZYt?=
 =?us-ascii?Q?NoeTlKS7I6PW2Tj+Yvf3mEUhcxgFGTAgotYl1KVCpKPylLEtV8gP0qcfHvTS?=
 =?us-ascii?Q?KCtOARXErqEAF+5RLqhWyc0rWeg+w0Fm7H5l7o6ZKUi/zJf+VeQRSNbsknZa?=
 =?us-ascii?Q?mcpu9thXRR4LkI8leLHfijQRfnDIzjSfXNs6xoz5oHvAxb3p36/tLB4oUTov?=
 =?us-ascii?Q?TE/fcyqS4yk/+YP8OEhW02PB+iDwMskWecgJtkPLHiSqXp5AYOENRp+FxE1W?=
 =?us-ascii?Q?uVGOGXhur3c4U6HwjZYMW6jVJiallWEE7lMcB+QKZGQw+nnVLcKlu5GuleYB?=
 =?us-ascii?Q?9c4i8rOp/M2SaTiVhCN6YA/7eurBmtVDL9BjFOew/sCnnD3/ROLkKn6UzpmO?=
 =?us-ascii?Q?hH9ikckWb/7gftkNtiLzrliFeuNyriFTLzN4bfrp5g+LoLBYuQIgxu91vo+Y?=
 =?us-ascii?Q?Cdr9V7n2cunGPUJfNgKiLe/a9p4kvabqHApBKBMbwyxuiPeuZJN4FlpC0pJt?=
 =?us-ascii?Q?F1qNbQf+CrKrXOddusQdWmVihHuCC8hNN1Kmi/fFL5L6cBtRX9SGQv0xHIM9?=
 =?us-ascii?Q?6Aq/qTUd7iSqWhz5QsJLJ2hm6y7wZ+c5WGcGTlJwAdL8MyijeK13sjfAQTMm?=
 =?us-ascii?Q?tS7HCuA2eV6QwMBxx0Wq1++ar5pZYolj7zbidSRdA9rcacQXBzUWpibvW4tq?=
 =?us-ascii?Q?7gzYEvv1MTUcXbRmLAfxeKKoxU6BL50UInJwx/cMXFkLwrKFwAlWoKcazM4T?=
 =?us-ascii?Q?SJQQ9G6Y6alTGAHp+kXwtYQxkGukCIzgXfse4ob6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa39d86-4096-4cc1-dd2e-08ddd4de880a
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 11:43:59.0179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iyl5VVKAYqfp2Z2aPkk1/7FGDAd9no41FvQATqMoLLVuToaDcEwNHn9scYgRlYby
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7002
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-pm@vger.kernel.org, Frank.Li@nxp.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
Subject: [Linux-stm32] [PATCH v8 10/11] pmdomain: imx93-blk-ctrl: mask DSI
	and PXP PD domain register on i.MX91
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

The i.MX91 is derived from i.MX93, but there is no DSI and PXP in i.MX91,
Add skip_mask in struct imx93_blk_ctrl_data, then skip DSI and PXP for
i.MX91 Soc.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
Changes for v8:
1. modify commit message.

Changes for v7:
1. Optimize i.MX91 num_clks hardcode with ARRAY_SIZE().

Changes for v5:
1. The i.MX91 has different PD domain compared to i.MX93,
   so add new imx91 dev_data.
---
 drivers/pmdomain/imx/imx93-blk-ctrl.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx/imx93-blk-ctrl.c
index 1dcb84593e01..e094fe5a42bf 100644
--- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
@@ -86,6 +86,7 @@ struct imx93_blk_ctrl_domain {
 
 struct imx93_blk_ctrl_data {
 	const struct imx93_blk_ctrl_domain_data *domains;
+	u32 skip_mask;
 	int num_domains;
 	const char * const *clk_names;
 	int num_clks;
@@ -250,6 +251,8 @@ static int imx93_blk_ctrl_probe(struct platform_device *pdev)
 		int j;
 
 		domain->data = data;
+		if (bc_data->skip_mask & BIT(i))
+			continue;
 
 		for (j = 0; j < data->num_clks; j++)
 			domain->clks[j].id = data->clk_names[j];
@@ -422,6 +425,15 @@ static const char * const media_blk_clk_names[] = {
 	"axi", "apb", "nic"
 };
 
+static const struct imx93_blk_ctrl_data imx91_media_blk_ctl_dev_data = {
+	.domains = imx93_media_blk_ctl_domain_data,
+	.skip_mask = BIT(IMX93_MEDIABLK_PD_MIPI_DSI) | BIT(IMX93_MEDIABLK_PD_PXP),
+	.num_domains = ARRAY_SIZE(imx93_media_blk_ctl_domain_data),
+	.clk_names = media_blk_clk_names,
+	.num_clks = ARRAY_SIZE(media_blk_clk_names),
+	.reg_access_table = &imx93_media_blk_ctl_access_table,
+};
+
 static const struct imx93_blk_ctrl_data imx93_media_blk_ctl_dev_data = {
 	.domains = imx93_media_blk_ctl_domain_data,
 	.num_domains = ARRAY_SIZE(imx93_media_blk_ctl_domain_data),
@@ -432,6 +444,9 @@ static const struct imx93_blk_ctrl_data imx93_media_blk_ctl_dev_data = {
 
 static const struct of_device_id imx93_blk_ctrl_of_match[] = {
 	{
+		.compatible = "fsl,imx91-media-blk-ctrl",
+		.data = &imx91_media_blk_ctl_dev_data
+	}, {
 		.compatible = "fsl,imx93-media-blk-ctrl",
 		.data = &imx93_media_blk_ctl_dev_data
 	}, {
-- 
2.37.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
