Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB64B1C952
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Aug 2025 17:52:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FC10C349C0;
	Wed,  6 Aug 2025 15:52:08 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012053.outbound.protection.outlook.com [52.101.66.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF0A5C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Aug 2025 15:52:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QgQxbSIwnqXYuXXdaMnMy8n6FFZbrh9e0JjbJ3mahr9szgThGoH5AnFNJsAy2t9VUcQaXC1QEpWu3CxoLo89+0wDhqJtSACHkRWMno2ogbSoW1n7Mix/IkNd4aRZUARsyCP52NDSkBEYAGAOE2uotCBuf/NGqclGd5WFOjhBwzcksRujmM55yM8DmXi+e58798b75/H7lfxAhMEAszRpeLv4S7HTNMJ6fWBQ37hvBr2Obc8TeiTzzFpFeytoQzM8DI00v4s2jO5iTGsP1eq6eMIT40cAnHvExTTTBFPxAoef3ZYN9d0E/SsOJfTd+Ghk4W4s/IQ1XnsGBk1KTXydZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPS3sOzrIfP3sCcZ8/IhKRjJg7Ada0og1yH2AZu1dVE=;
 b=e5LaEdr4f0YjcKrDXC9RPYv65aUMRusZHoMNiMR4VT1XBwYFw7bjqlr8pE6Nq63/aBhBbhgGGQ5iFTgO0zDEAF8xzGgbjgtUoCVFvAWup4nHw20WncneQnWDEiQ/tN5Cnw5C5jtCffn9h1Stv9sLlO06+xaKwNEtE3+nn7GfIU+b5t2llGEE/MPg0XiVGF93OsQtA5Fk1RvjNDvAyC7DMFLEWZeyabYKqQvzoBoTR2Yw0sCv8kp7a1buWTkuZ60a4tU2zFQKQHjvLc99vdHnsk/UJYTXlq3g25bTqfsP6kKhxk3jYBoK2rQ9BoG976NH4fBpKvTzrmVMQWSmxQnV8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPS3sOzrIfP3sCcZ8/IhKRjJg7Ada0og1yH2AZu1dVE=;
 b=H21vPT7X3CPNtBjW7FO390PtiZfJF4mAvJKdx1N8fD/hLUrgBEo+lOrO5+4RXguZIZT3Dja1hNZbv6ZgL0jpkykUjp63rfnV43aH3PpZf4B+U4xN+XLn8Nqekre0lSVxML9ln4wf87GEkRkwFT81ngHYkRo9h1gcOyiJsf3fPirFPqE79wXGkzmdwutnSOA8Q+15Er0RmjuluhHfDx4l7f2v8wQmdeeAaaM5bdYu2OGEWk0R5eCpEYcotHe9bY/DgCZZ83e9raX0ERKCi8QTvWkywyedJizFh20pACXXLtjPuGrGY8VOIM03UOHJm4sh4hpBTga/heTzbePAOZkWDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7471.eurprd04.prod.outlook.com (2603:10a6:800:1a7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Wed, 6 Aug
 2025 15:52:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 15:52:05 +0000
Date: Wed, 6 Aug 2025 11:51:54 -0400
From: Frank Li <Frank.li@nxp.com>
To: Joy Zou <joy.zou@nxp.com>
Message-ID: <aJN6GozZ9c/apcdP@lizhi-Precision-Tower-5810>
References: <20250806114119.1948624-1-joy.zou@nxp.com>
 <20250806114119.1948624-11-joy.zou@nxp.com>
Content-Disposition: inline
In-Reply-To: <20250806114119.1948624-11-joy.zou@nxp.com>
X-ClientProxiedBy: PH0PR07CA0079.namprd07.prod.outlook.com
 (2603:10b6:510:f::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: 9acf3a41-6a3c-496a-4efe-08ddd501310c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZCWmXBfb2KXY/MZEIufyMdDW2TFiP3s2yGSpaCs1XvLTU+rmjym52AbyWiLa?=
 =?us-ascii?Q?lXT7rmyqMXcqc2sTCsto6J+Hd0zvKYr5ROo/1XUssgw6NiawuVgE7bxdgtG7?=
 =?us-ascii?Q?9y6ovNpjTPHBlyOIeWJg7e3DtbQIDhguI0Mqlt+KQqrLOJr89E2qkAAAA7Mi?=
 =?us-ascii?Q?FjZj138bOSl34kDdeoONktyr6Rd8MNA2blcprt1vsrLhjfe2UP+hjj8Q44pJ?=
 =?us-ascii?Q?Yy/PINb4/W/jvYjDuRdyaDUrldcbKv7AjO0ImohROPYIEGuAkNzuPMOQMilm?=
 =?us-ascii?Q?rchyoudPQFTKDL++A2CeAKvu+Rnt1d+W7HVBysBjYyEmJ/UrH9n+PkkP8SDu?=
 =?us-ascii?Q?bU1XAHzyVaxCmqPXK0EDFA2tb6juczMmpbY/rtJXJ8AvUM2gb2QUsh1z1/cA?=
 =?us-ascii?Q?fGvxsBe84GDkqFCtfm3X7ylaT5uYGD0EYvixguwk276I7nLSGGfchxhb7w+E?=
 =?us-ascii?Q?LQ/4RdzznroJB0sZxmkh2O3PdSj3+hRD0TrA5U1upWofeIp7HoDb9SmeBiBU?=
 =?us-ascii?Q?JHgvdvu0+5Qgf/A9educ+1H0HtldH3zZ3CIzpOdQgnwsbruaosEK8NLF0TdJ?=
 =?us-ascii?Q?6xoZBRfxAqbHqwJfZUM7aFivejCa/HiYNBf5JQEiMTnIMb3OvhEHj4DW2yAU?=
 =?us-ascii?Q?GdI37W4Pwn+JlSSwo6KJu2ov9XVbX1Nmx18RWroYTQrsxvImcz+hmF/izYwK?=
 =?us-ascii?Q?lmM6UrCOuuQPT/smPGegcIIPdTEQrlKhGh5qRTwWwvTwFl7sYvqFLI5iu+rB?=
 =?us-ascii?Q?G4uYShstAGKipqVQN69DC9YwBfY2/xMft3VIWcj76TqU1mvhXTjqkdcjxeko?=
 =?us-ascii?Q?bgDQLgEiEGZNbuADnfckQYC/YB7ueAXMKQ2lN7ZNZ+RRsa36a10hecj/QV7C?=
 =?us-ascii?Q?I6gdbcPx0v5aVSQ2zttNS4lpDW2XveeXv6GvUVMgXmPuI9UzsnY+74jWyFgz?=
 =?us-ascii?Q?iqYJ8PFpSSk0EfR4PQot755MCfPNMa9nOFlPNL+mPZPREQl/NGxsZhLYhhnZ?=
 =?us-ascii?Q?UlMs8FCmC9t2rYTz+GzEaa5oNg3TPT1VINagYOhkL5QuYDMtrV1ZBn0KVTjT?=
 =?us-ascii?Q?sdxw7xUT2gOvjV8OTvEZ3vW/rNdXw7LZhFJY/NaYpjppteskBdw70gNxxdKR?=
 =?us-ascii?Q?pt3p1XaSU9jP6B8wEHAofXKu36V5eSrM/cvzuiRUk8rPvyYHkbTwEZkF1edD?=
 =?us-ascii?Q?GAgUAkuarjBgvY1cEJjxa4RGXdY30Wr94OvFtSe4+//9pmefG/tryfDSpwPA?=
 =?us-ascii?Q?3VSnLtGLTWY80VXsKVNxK75uDkF+8u7nXMlEydL97Q33CCcGk6/pJNqMxzUo?=
 =?us-ascii?Q?Msr8nBlnOy2DTTZ10hoQfGwMFqKmp+PAgoZdkZjOLXRgYHJQhSHBNNG8hJN/?=
 =?us-ascii?Q?66TZyE++xFVEjWiMTirontdaMl54EpUX3mimWRrtYikG99+5w3foXFBJh6Ns?=
 =?us-ascii?Q?hwaEoby2W8qISCF7J+8HKvewldeC07KyICZcG73UgMub/Us4k1aVQw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rs+Aku7NtDqZvBWAQ/sFSpz2Ptn5cyeKhopLuj6XN5zmMq3F3aKASJuyl39M?=
 =?us-ascii?Q?UvdxI8Tm41eYy17CMOJJYmNDDR3BnOjmrxSLfYA4MCwiqmno224KHd1v8Hkb?=
 =?us-ascii?Q?DBhJ+vGgrZ27o9+Ba97L9IbTrNsWu/AjH+rCFlyeoPhPGLWmE30bAn4Wadqa?=
 =?us-ascii?Q?LaUyRWxDENIRpbdBgzw2EuljK6u+MayTevURJHJ+EI0PYMUFsAaTi3rB6uxu?=
 =?us-ascii?Q?qOTd+1t0hJVHFr4wDbqZrdEf1nC5siJJYuqK2rVolOXnbXbXswzqHXbRdemn?=
 =?us-ascii?Q?SMFsVJZjtdf/N4TkhbtuAA4Xll0xOSSZilqx6M9B4QtTMIKYkl5xh0VUi7Vj?=
 =?us-ascii?Q?6jIuptJlDMsDRrGdyc1tQmM2iuQjGKl5h3C8wfp3xTSPNnupqoumHC1AWyGT?=
 =?us-ascii?Q?UmT1odtGQpUkQJOmwfsIV+Hq2AT1GeNmnOH0FmRy/DUjakhyN9sxwsKa2em8?=
 =?us-ascii?Q?yTrdDyYtrQqAqomUhFtjeXkloLdAexb/nRd+ml4m2UU4FQJ1OmDbNNiFlIJ6?=
 =?us-ascii?Q?mOZNwnB9edo/s6sUxXrUyKoBt2EbcQ5G+571U5AWoatsTCGwcWdwpIxdINpE?=
 =?us-ascii?Q?GnTerSPPtdLwRUyisOEoPP+Naf4gzfJ7+AoKI8vs+vKLPXFZ9nj+bZ5xt8K9?=
 =?us-ascii?Q?mEEZKH8NOvBr0gkpQW3V4xVvUgtUIhbRpihWQy/fqQCiAac7sTJiX/5Ma4wH?=
 =?us-ascii?Q?u7YokwulxlvXi7kSghlBdIAy6HbwSwx0eEyRvIuw1wEwB93XSL472xbb5PSm?=
 =?us-ascii?Q?0wYyFC4V0kAFfkfzpVskrhtJKHAf+NrowIl55MpT9t3RGaZR5MFpIkmSEEMa?=
 =?us-ascii?Q?xjnQjFxWfo+AiJS34RNYaeisO++XVMk65DTamqE8o6Ck4ETzzcIP0bkC3EuU?=
 =?us-ascii?Q?i3StuhUOJO5mjMGPMEYbaX4xIVXjKDwKYKW36zGw1KU9KPNe37/HyAPUY+nR?=
 =?us-ascii?Q?eYB/iJOl9Sef3rZyrbmXmUYZKT49Psr5LfujHYfP6OPT1xemdafXD5BrcuO6?=
 =?us-ascii?Q?QBKy9nEmcbWa92EccfgKxZ4FJMozgxzdnipHfzgcrtfM8LqlE0s4HUwIvKX1?=
 =?us-ascii?Q?E/0gfSpsMi+dO7rZT9uM+Z6wsKQeTUl+gRuJrBmgpC5L4gZ7OwNEu9YWNl6l?=
 =?us-ascii?Q?tFq3g8BVhM3tA2DMEWo+3w8me31cOwyAoWH4fcrlC78dJPmC7KAEDgEBOCWk?=
 =?us-ascii?Q?ujxbPyYqUjBa8Vb5APQSgt5WnvoKFHshTQcFX+iUNdkJQiW/xmvn+DSJVcvO?=
 =?us-ascii?Q?nzYsHKqXqmrrq5QM4M7SHrP96aboKdVYHE1XKlCPqNothEIqc8sWp3n1vM10?=
 =?us-ascii?Q?1yloIBBP96XgH0zND4SNiJ6wo5O3e8H65+uj4mzbX6FRidRTIUA2VVjW4/sG?=
 =?us-ascii?Q?vL9yRZS0zMh/mM2I64Anpo/4Xvd5f+BoRuHOmJJRgIxBUV8liO8WohoithIX?=
 =?us-ascii?Q?WNL5En2YSUu8AmprjjlRA1CZMD//E3h4aKvbJNBJqgfBGMn7Gn2UQswC5vOW?=
 =?us-ascii?Q?8vdsyDKxk3CO2wLyht5qQQdN/lvCNuhwnZFGXdmhCnmditifgNGW+1/stsQo?=
 =?us-ascii?Q?ydSor6UkugVgQimlPSI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9acf3a41-6a3c-496a-4efe-08ddd501310c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 15:52:05.2571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /JL3ryB9Dr76hp/8ndM50h4BbV06J3RVKRXOVsvnhcyoII0npTS/ufwY+ZSfenZ0MeD9SXeYJBKX0JC4Y/KBhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7471
Cc: imx@lists.linux.dev, peng.fan@nxp.com, alexander.stein@ew.tq-group.com,
 catalin.marinas@arm.com, edumazet@google.com, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 Markus.Niebel@ew.tq-group.com, festevam@gmail.com, frieder.schrempf@kontron.de,
 primoz.fiser@norik.com, kuba@kernel.org, ulf.hansson@linaro.org,
 pabeni@redhat.com, richardcochran@gmail.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, kernel@pengutronix.de, linux-pm@vger.kernel.org,
 othacehe@gnu.org, s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, shawnguo@kernel.org,
 davem@davemloft.net, linux@ew.tq-group.com
Subject: Re: [Linux-stm32] [PATCH v8 10/11] pmdomain: imx93-blk-ctrl: mask
 DSI and PXP PD domain register on i.MX91
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

On Wed, Aug 06, 2025 at 07:41:18PM +0800, Joy Zou wrote:
> The i.MX91 is derived from i.MX93, but there is no DSI and PXP in i.MX91,
> Add skip_mask in struct imx93_blk_ctrl_data, then skip DSI and PXP for
> i.MX91 Soc.
>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Changes for v8:
> 1. modify commit message.
>
> Changes for v7:
> 1. Optimize i.MX91 num_clks hardcode with ARRAY_SIZE().
>
> Changes for v5:
> 1. The i.MX91 has different PD domain compared to i.MX93,
>    so add new imx91 dev_data.
> ---
>  drivers/pmdomain/imx/imx93-blk-ctrl.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx/imx93-blk-ctrl.c
> index 1dcb84593e01..e094fe5a42bf 100644
> --- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
> @@ -86,6 +86,7 @@ struct imx93_blk_ctrl_domain {
>
>  struct imx93_blk_ctrl_data {
>  	const struct imx93_blk_ctrl_domain_data *domains;
> +	u32 skip_mask;
>  	int num_domains;
>  	const char * const *clk_names;
>  	int num_clks;
> @@ -250,6 +251,8 @@ static int imx93_blk_ctrl_probe(struct platform_device *pdev)
>  		int j;
>
>  		domain->data = data;
> +		if (bc_data->skip_mask & BIT(i))
> +			continue;
>
>  		for (j = 0; j < data->num_clks; j++)
>  			domain->clks[j].id = data->clk_names[j];
> @@ -422,6 +425,15 @@ static const char * const media_blk_clk_names[] = {
>  	"axi", "apb", "nic"
>  };
>
> +static const struct imx93_blk_ctrl_data imx91_media_blk_ctl_dev_data = {
> +	.domains = imx93_media_blk_ctl_domain_data,
> +	.skip_mask = BIT(IMX93_MEDIABLK_PD_MIPI_DSI) | BIT(IMX93_MEDIABLK_PD_PXP),
> +	.num_domains = ARRAY_SIZE(imx93_media_blk_ctl_domain_data),
> +	.clk_names = media_blk_clk_names,
> +	.num_clks = ARRAY_SIZE(media_blk_clk_names),
> +	.reg_access_table = &imx93_media_blk_ctl_access_table,
> +};
> +
>  static const struct imx93_blk_ctrl_data imx93_media_blk_ctl_dev_data = {
>  	.domains = imx93_media_blk_ctl_domain_data,
>  	.num_domains = ARRAY_SIZE(imx93_media_blk_ctl_domain_data),
> @@ -432,6 +444,9 @@ static const struct imx93_blk_ctrl_data imx93_media_blk_ctl_dev_data = {
>
>  static const struct of_device_id imx93_blk_ctrl_of_match[] = {
>  	{
> +		.compatible = "fsl,imx91-media-blk-ctrl",
> +		.data = &imx91_media_blk_ctl_dev_data
> +	}, {
>  		.compatible = "fsl,imx93-media-blk-ctrl",
>  		.data = &imx93_media_blk_ctl_dev_data
>  	}, {
> --
> 2.37.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
