Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AAFB13D57
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jul 2025 16:37:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6540CC36B2E;
	Mon, 28 Jul 2025 14:37:07 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011006.outbound.protection.outlook.com [52.101.70.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C139FC36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jul 2025 14:37:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aYaLteqrGPEx2jiVTvJAKx8x+s6suC0EThTMdkpfYRn/jTsde1mTcPugV7tNi+FQ3HXNEptMRYR5QrAkTg6pXFmkDvtFE2vOHHFfeEjQPNGoQbxgP+hpqgp5pqgLiBTqYuS1k6o/ex5ChbM2ZYuyqrqQ2Ipx8jAdu7dZ1Ll+hjYNQmVNfPARgOio6eRV2lpgs5+W3bh4Kf/jfpXYwZ+BgITlg7rGz4XMrqgU25tvy5wdquHOFP4sSu8Z/uwkRxgN3e4nWkn4MYG0xa9Av3M6NuL0Kncf9qmiWsL1j1kBKPOvSAqPsuDkIYtOMZoyQd2+9UnE0hI9Q23ss2nsk8wxNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzdwymuihivEhs2ucVWztprOxzoJTAYSdFrBid0d558=;
 b=YCDbko2SMUR0P50NKetqaCKwrDInILochWYEDIN9hx5zO9UARgK69x+2gOXzBW0lt5WUXtJDp0gBNIPDpKZaHDDGTXRf1Wt0Fr/9oTGyLQpseFiDGQOa7xxZMs2dVp/I9pM5IH9OfQ6mmIY+RPUvLI0qubqrvJL+9dd5cMCVOAFESTZoldvb3RaGRe47STyWt39GfZ/ZYVy3n0BmFGNXziedU3tG4huCrVE+AaPqdtpd3t/LjIhk96+JRB2kOjFJPYW7OjEvfj+S+iKykYwnOkIqwhkpireY5rH6O+NWkgLxKxmORYg1UtuocWVdNWQ/vRdFC5eV+RlEzvDK33G5JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzdwymuihivEhs2ucVWztprOxzoJTAYSdFrBid0d558=;
 b=WX2JW0RZ00I1Y3DDQsB9K0VWfooUnxn/8DJ1QYZkRnV58SJr9F6ZuN8Bu9rTPHK7Fqft1K19l7Q278mmhLc7kuBAj4jPShgbbZgO/tu+00ECFmDiwow0G7Qc0fo9+3Jve1CWcWDZxbGHnrLK+N5lANDCjX7JEqKrJ8wh+x26iTCUyam+JslNKjMB5qXofzZZiJDyOVxFLgU6tcEsjdYdSjyVxKfYOTq2stoS7BDfgscxjJAtV7t2dk2Z9jkenuf1+JmmyuBCtqig17DYsA114T/XHAZZNFS45C69VjJrr6Qbx7/KnubPl6gazXsKsRX4n7rpgHkWtU0B3dQ+Y+16+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7781.eurprd04.prod.outlook.com (2603:10a6:20b:2a6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 14:37:03 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 14:37:03 +0000
Date: Mon, 28 Jul 2025 10:36:51 -0400
From: Frank Li <Frank.li@nxp.com>
To: Joy Zou <joy.zou@nxp.com>
Message-ID: <aIeLA6lQkVxPcRyj@lizhi-Precision-Tower-5810>
References: <20250728071438.2332382-1-joy.zou@nxp.com>
 <20250728071438.2332382-10-joy.zou@nxp.com>
Content-Disposition: inline
In-Reply-To: <20250728071438.2332382-10-joy.zou@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0019.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: d3d97685-ad99-4061-28af-08ddcde43820
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TnFRLhvYLKQ5ZNXhUwB6Nf4kr7ANAdSwtwphbV7WMpisSqIxToLIZEHzJNHj?=
 =?us-ascii?Q?biGQhtNyfHHpbSwLppNVM9Nf0pADA+XAbwKAhUdvLO5STJQc4Q1skoyhixtl?=
 =?us-ascii?Q?13xhQV6I5z8ZKl0Tja3HsanWqFQU/PJf1E8bU0wlQnxsFHuzH3aZ7U/APBCj?=
 =?us-ascii?Q?0fXdEHoa9UMG2tEk2JcqOPM0gr7VAGb4DRfrtRRBXhthXtA1c6Sa5rtZoNvg?=
 =?us-ascii?Q?G6RyzO/P/LTnHDJJX9xz37u5YR5qFo+trCO+gh+cxEfTMxOu/lmHkUYTpuMk?=
 =?us-ascii?Q?ucr6Z+JGSyjUGHkI3jqCCSRGPjy4/PZiuUz+Pc3a7mWKC5C3McO6J8FsfxE2?=
 =?us-ascii?Q?ikrR+/CBGckLXSU/a4MbWWCt1mNsh83bL2wq4nKtwMk8e9ZVo2i8ob6aKdmN?=
 =?us-ascii?Q?6yl5IBfU2+jfyAOwdq9o74TLWKxl52GaGQxxNTwmRWl4dDG0Fvw3z6DMs75R?=
 =?us-ascii?Q?Hasje1FYgaSa7s22Ir+Z6DeLxSZ6ckYYkjP4kcMsBBSDHakLa63wpkCFU/aw?=
 =?us-ascii?Q?Gc/rVAkuDPWCHiUaYricOSTkujkQF26jP+qKv+I5tB+AiVbDxYJHQagRoV3l?=
 =?us-ascii?Q?YrL9gEPole66Abqkf9X7778bbwEYA3TzheekUkUfyoRe/639jha4kX38woB0?=
 =?us-ascii?Q?0WfVjaKkTeH1JbAeuFIr/gluUIKlNLEKpRM5PBj2R9aMTPwZZh+AUUpaxzXH?=
 =?us-ascii?Q?8Cp7wXwRMhqsA04hZGmImkxi1TlVYjktpcYEhQxFA/XAl7On5moECUv2kQnA?=
 =?us-ascii?Q?DXY+yqVxCJzBb5kFZO25wNjIJqDExhzbuNUzftlRQeTNoKb+1BTmoivbj+Rw?=
 =?us-ascii?Q?O8/kaZ/rkWx7N0mH48K2m2QlDpKTDP6PZoBGmDw2eTbIvO1OeIDconKvbTNJ?=
 =?us-ascii?Q?I3FUXD3b78qHSzSeFDQUTTpsE0Dm4tP2wr0Ci4eUvtaQVgnrmNVTcY/z/oj4?=
 =?us-ascii?Q?keD5ZruUSooZA1ii0Vhbn2g2O+EFXWvGMb/4H6w+FlAavL8QAtDCAdIBgNsA?=
 =?us-ascii?Q?jaqnd5jMLSS6IHTEL7ZfzlJfOwK36odQe/pJGlwWMi4+l/BhMbMPyWqsOnS+?=
 =?us-ascii?Q?XmTn/gK80Lag2reMo+DQNUhHHbWFKEXfKpi97yJMGB+SyJzJpgxeLK0ctVLs?=
 =?us-ascii?Q?8dCAYy38j8TK0HGlzbVJqA3nwEiIDkvtki+Qg9xSmTdiw3YB3MuEkdvXb4EF?=
 =?us-ascii?Q?lq35S+1ne8C1Yu0wXRmRn7m7J6sBUeU8H+DBUWBLlR6FkOwoKy2fN9hAy+lU?=
 =?us-ascii?Q?LnE78zgqJYS+s7PStAoqTAytQmxx0ws9IqnlE2elTlvf5Nvcf3jeNoFEBmCV?=
 =?us-ascii?Q?vr2bt8OiSNN+pw8DSOM+kOEgJ3Y95oGROtAeu1dyvCSsT4Ztpv4xcBcMPRSW?=
 =?us-ascii?Q?JInBa3tLny4ZtCVbdhkb5qQBh+Qcc4/mjQjd4X7tmd8T/RZ/zEEN6W+7qwHN?=
 =?us-ascii?Q?uuhnzSSxI79uK2W7ogjz+1k6C+/hKH0MvIoT5mPdD+ZlEN2XZe93ag=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wnVygVJYy5Pm/gwBUql6ddraU4vEHfWrl3vPIxZ9sGjxNeYb4ArvZjq1jUYJ?=
 =?us-ascii?Q?uc7l3HiVi9ZQ+NVfGcWCokhs4hziK3e3AxxlM/Hu67V3bOHEkadgbmy/G8U5?=
 =?us-ascii?Q?YLcZYCc1IHFwoTAUhlJOTj+VWiLJcv1aK5yV+3PpfareRzl7uv3MbrzkCooM?=
 =?us-ascii?Q?JYY8LsDnoUYN8CeZ5p6zPoJDI8abiecMsjKQloyYD08n/sAEm/MIqFUHs1pd?=
 =?us-ascii?Q?zr5x1K+fM76kTIJsmlWMnRBTp0vcVmrgLNuxSKPkN42ljSsX6XLC8dniPV3M?=
 =?us-ascii?Q?1lwb9xoMXLB6psjfeFCu64U6A+BrymglAjQOZBHTz66OOV/Zaya+aPEugVHD?=
 =?us-ascii?Q?0rasoT1mapqTQFrlQ/WnrncP8yXVPeoj2AD6hyiBYh314obf67g158WuMABo?=
 =?us-ascii?Q?mGxnqP41AwcvwDfGmK88gxs3NEduZJ7U9TJ1tO9omWOuloKpmUwnifcdHV0Y?=
 =?us-ascii?Q?28LpulgRJJ8JG+Kj5C94w8svdJu3Ypa3a/8b04bcLmcZQ0FUYeF6jt0FcM41?=
 =?us-ascii?Q?Smc340FANejCyy8RHtwQWuZlkEpPtTnqAcEJszoBNT42G+Aofg1cJwXQhPZL?=
 =?us-ascii?Q?VFDF7Ibv3lhqYJ1+SkF0mbcBfSBuKbC0EzkBbBsKunNgNOgT/KoWOOV5oRWS?=
 =?us-ascii?Q?1TI1foLvcm7zSRVwqcEFUh1rQxwbH20ZIgBaaUmW98BTs6hoc2hbWUlRPu2e?=
 =?us-ascii?Q?S56B/huCQeERFkGjoZUxkx0FAeOD9K+ILqJCIel0wuhRyw+OreRGn5KwAnkW?=
 =?us-ascii?Q?PqalZSRNvq5foQUb6OtzbeDto9lkGa67hKvKZIqY8tI/xGnfwK+F4KKbie2+?=
 =?us-ascii?Q?uTHvSfVW3LnVR4tOZD8rH1qmo7Zz2pychMzn/COz913BtqmtMFJ7h39HtxIu?=
 =?us-ascii?Q?rWhBdggqLg3LA+LnW1nA9IBOvwO+6eAKGqqZfk9AN7BqwdWDQ78PCkLrHl3x?=
 =?us-ascii?Q?mQzZUSKAXeUs64iG9LuL7GpOy2RgVVWvqaTbOulegXpIHYK8Ako2znWRHFLa?=
 =?us-ascii?Q?7qtHLfSSi2npK/ljep5tizSVaHpM53vA4owZ9XoU9bb5oQCEJvBR1WPKUK0F?=
 =?us-ascii?Q?qCMnudO3J7zeI3p6bi+/6kObDzeiZAFPn0HEyObClTWiPgxwzaBSfOENfBXF?=
 =?us-ascii?Q?5Wy8ugt75NMFetD6oZ1yDNjpBU9j/UQYdZUdrqckY4slOpie7glGUDZobJ+q?=
 =?us-ascii?Q?75OaYJ7HUOuM0cKih5tkmYflkUcWf2/mO3WXqxsory80hUeDx6YT4VSe2EG7?=
 =?us-ascii?Q?I0g14RLdTS/GM2oGU5PvICq+udI5t80CVlF3ifGY/tTgGBNUN1FE+keZZqhs?=
 =?us-ascii?Q?OWV4Vq/EMULdCd9gCd/oThHz1V5BbItmGFCyAnn5dRX6i4gNYosyvep9NBtX?=
 =?us-ascii?Q?HwDv8XMcR1yUAVAd0WvBK415eQ1qhGuYeNQjx/DQA3QSJFXI/OOG3X6rP8pW?=
 =?us-ascii?Q?S3Yzl4lle7YBO92+trb9JNdG7tNR03GcttU/nAFts8T/IcgcmpeN4909MaYk?=
 =?us-ascii?Q?R9BNMKQGHOHwY7/Tlj7IrJWpn86PDG+4hPZy9S/y11jLlSI/LspD+NABYRd4?=
 =?us-ascii?Q?kyJY8Zi67huS5UO+Cz4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d97685-ad99-4061-28af-08ddcde43820
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 14:37:03.6525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5e91gUYe5R0OVKcCwI6iukJUOBsuxoPjPdqi0cLzu19y+2LEost3gp5weXCZp4H24BlsyVxxvgEp1VcYN0pt1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7781
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
Subject: Re: [Linux-stm32] [PATCH v7 09/11] pmdomain: imx93-blk-ctrl: use
 ARRAY_SIZE() instead of hardcode number
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

On Mon, Jul 28, 2025 at 03:14:36PM +0800, Joy Zou wrote:
> Optimize i.MX93 num_clks hardcode with ARRAY_SIZE().
>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes for v7:
> 1. Add new patch in order to optimize i.MX93 num_clks hardcode
>    with ARRAY_SIZE().
> ---
>  drivers/pmdomain/imx/imx93-blk-ctrl.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx/imx93-blk-ctrl.c
> index 0e2ba8ec55d7..1dcb84593e01 100644
> --- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
> @@ -418,11 +418,15 @@ static const struct regmap_access_table imx93_media_blk_ctl_access_table = {
>  	.n_yes_ranges = ARRAY_SIZE(imx93_media_blk_ctl_yes_ranges),
>  };
>
> +static const char * const media_blk_clk_names[] = {
> +	"axi", "apb", "nic"
> +};
> +
>  static const struct imx93_blk_ctrl_data imx93_media_blk_ctl_dev_data = {
>  	.domains = imx93_media_blk_ctl_domain_data,
>  	.num_domains = ARRAY_SIZE(imx93_media_blk_ctl_domain_data),
> -	.clk_names = (const char *[]){ "axi", "apb", "nic", },
> -	.num_clks = 3,
> +	.clk_names = media_blk_clk_names,
> +	.num_clks = ARRAY_SIZE(media_blk_clk_names),
>  	.reg_access_table = &imx93_media_blk_ctl_access_table,
>  };
>
> --
> 2.37.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
