Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0F8B0BF0E
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jul 2025 10:36:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30615C32E8E;
	Mon, 21 Jul 2025 08:36:44 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013019.outbound.protection.outlook.com
 [40.107.162.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7ECB7C32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 08:36:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6KnQT4VPHwnUXaYy1NS03PQQ0J35K6ruWkNYksmx0aPKv/Z+XxO3I1re/ocgBqEXvZGuJ+/lyz5VIR9Hc2tBp1hwnQF9oqtq8HChe306ciRUKtAKwXSiL6V00Q23AjuezOiBM9P0jFC8/zFC3l5Ac3t6WliEE27B41B2pj70tai0NTqcxsDUTOEokXVUD+Xzl0B4z30MvHezztNzKARCxJiKOHHX90doD4J6o4fN9r/lDpI27+bLyELcV7Tg8zds8U53LjCxGaSJMHL6hukfG5CNA4ousu8YAaqIz5LZd9i1AV2nXlzJGXRPRzlQ+wL1lR016gXCXaBjem31HKBhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyIEjbIBlIbc54EHBdLN7/7mtFwlLBQ1SOHaTx2O9cs=;
 b=PFY4q7XaBZ8xgATmQ4/w6gsC3l/Sjd4/yDXdCtnQKe7c/YqwPvdaFT0xKD3rpvrAXPOaJjJro+ecz0Y2mzRWVV38xK5Wj6lGIySv0qM3HHTdutdDzHaPGba9hQ6+rwR5KkPXxUmIAQaaKOY3iPb3RbbP+IjrkCbjmzK0FxMgIryevw3sZu2GPUxfhi7t2DwrNyw6nmNtSqrSfaklHpiBYFBiEZ90lrhQ4pafcv4iT7K7uLNog697taK9Y3k2IEGXilR/BKoTzeP/wNVHS0naHJqYr3N/K2VwPK6sPv5FZWQtN3r7+EXBx3lTPze7+Nc9mRwlqO1DcpGpu4UldtGhXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyIEjbIBlIbc54EHBdLN7/7mtFwlLBQ1SOHaTx2O9cs=;
 b=FjyZHw3Z3GX3asY+aylQt49d2RzhQtzW8ZbBqD7T9c/kKlIc98XBTYHr6p5nvzYR1suXfOpG8r4ZoMYwC38/sN/dBeyoVpvg52jAtRmxJlwicXLQ9Ou9A1ldzJWI46n5GNDhn7g7lMWMaXQ4sMP514c8nc6krfLsqj+NVLtF6eyt5WjVUJbsBkqeEHESL1iqfOKYYwHqslCgqeXqce2PocWgevsSJoOqVlO54zcwvKjd3tyPCaOcEDuttcSdZjULQ0P9BdLKtdjCtRejVOwG4poVz9rQdM8J78v+us4C3dcP4KZFx/sUnsLlaaaBkseeRuBbUkGkqDg4wKdvCOrD5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9925.eurprd04.prod.outlook.com (2603:10a6:150:112::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 08:36:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 08:36:40 +0000
Date: Mon, 21 Jul 2025 17:47:05 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Message-ID: <20250721094705.GF4844@nxa18884-linux.ap.freescale.net>
References: <20250717090037.4097520-1-primoz.fiser@norik.com>
 <20250717090037.4097520-3-primoz.fiser@norik.com>
Content-Disposition: inline
In-Reply-To: <20250717090037.4097520-3-primoz.fiser@norik.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB9925:EE_
X-MS-Office365-Filtering-Correlation-Id: bb421a75-faef-4873-5cc5-08ddc831b6b7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|366016|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v7AuwTyRNQFP+N6euWYeLw7S5JrxIY+iOIzUhaqQ0PPZQdHPyl/XtijhkW4g?=
 =?us-ascii?Q?9nfvcrCp10hXc9Ovd8bvWAr2DTvAaNUXIH60TRlxljcH19q3oDiiM9my32dD?=
 =?us-ascii?Q?mJcO1+xvJKvoLcajzCeRnZJWZA6rRnpnIaacmUj1km70FF5K5zvDIznFWxeb?=
 =?us-ascii?Q?uievTbyYo5X6cT9NvGMFarETYWR82sL1sSqIZebX1bbzBtDjqvvEScCRP9c4?=
 =?us-ascii?Q?teSX9OWacHyxHLh3MaXeoIhax3SHlQ0en2eNWwT3zbQDWnm9qwdTOS0NYzgv?=
 =?us-ascii?Q?fLbO3sr3UF2JFsEvbuCDIUVCN5dg3z2g8p0H4OfrXvURQB3PgFBn7s5wz2+e?=
 =?us-ascii?Q?ZeaX2U/pTZgnbkN/01QEQWTWtzpZFRhzSHqZeSq23mZH8dwKYHJyQvvHDeJ/?=
 =?us-ascii?Q?Qx4YUC92TpSyghDQ22irT6vjw576jiGAcrV+H+804atS1ps8AwOR0vimKPl0?=
 =?us-ascii?Q?5FUJ4E5z/t6xnom0HpCtCHoOmqqMQfg2NTjGLmMYr7WRtBNBagzaJ3yAOmcT?=
 =?us-ascii?Q?NPYfwAzpatUB1DO7uUQxKB0zMDaUUclaoOaz1J4uVIyoitX6JnoRE5KUVy1B?=
 =?us-ascii?Q?MuG/JOAodhG8gEyrhXaYR/Vidu70Mu68GqT28PxPFRJbw6s6MRsB5KOSAnGK?=
 =?us-ascii?Q?qSO36T8W0VqqDX8JKtWf4S0O0SRARLr1hD3m9l9tkqvsWJM3rv+ocbtaC/Ru?=
 =?us-ascii?Q?h4tuWfqnSAMhYgZl8ZtiAFFX7UVW3QzEkbMmiSrgr5A2iOKYBtGd3Jg0eFhL?=
 =?us-ascii?Q?9qLDWCLnhGLGa9WXqmK1QhOX/6SgDFQK/PjO6VBbZEYKIPP7R3mb2p8fmAAM?=
 =?us-ascii?Q?dwIJvcMl94Igv8/BkaEUlr2PNwnwuhaauRW7zhPNLF0E/OKHyyafHvPnEE40?=
 =?us-ascii?Q?XB2gwhgeP/PKi5dTa4NMSqvw+9obMyWo53C2hkw5Vd5JJOZNosyrnfWscusW?=
 =?us-ascii?Q?2Mi5VhOQf7es3km3egcdgmMct5+xBUhiMf5YoxKUhXU4X9E1CqAXtlQAYeMH?=
 =?us-ascii?Q?wiE12ICwIAUvNcLirz6KbyoBX3KCkZxePaW7nYksBSV6cEjj2LAI2jYA2onx?=
 =?us-ascii?Q?t2fBUGVWnMFpJD32xt3CtGCzg0juC411pr1PtimAl5ZoJQLhm4ehYB0szS4M?=
 =?us-ascii?Q?ODduugNTSxPKRiS3P0J1MT0X3kfO+xLTi6TdfY31wHbdJU596pOqTfJ2IzXO?=
 =?us-ascii?Q?leK/DOM8emCsJsUIaSflRhUO/0E/ZZAwVBN2T4nKiiV9JvB/ARMJPHkNheWF?=
 =?us-ascii?Q?sewxGjUJbPTWUS0VT29vZ2MtcQAq5GJHwE/OYB/6+hZQEA/zrryu5fzPb4Xt?=
 =?us-ascii?Q?EHEIZYHmgbqTNXq83c3NKHe1xC0/0idLHdSksVSNrdfOtbRdx2kObV7+h5x7?=
 =?us-ascii?Q?QZUnd/uMuQ+ENcvqQftVflhOuRJMDE2EtNonnfQwCBVTg5y7gefNgu5eTpGZ?=
 =?us-ascii?Q?GZIE3em1KS0HrO8B4mKmhfcRxZIR0eML4Od052e2Tu6QFlI63Rip+w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(19092799006)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1auKVO+gPL1sYyezb2w+4zgdX4ksa/YZqMcVTm9Mnm4BTkL3m4ozHmTQ+2ic?=
 =?us-ascii?Q?DDP/VgfwflROgeT6ti+cXKImgEqzMlf0hkLDpCrx0n2/9RD5HTHwrDnO68Lj?=
 =?us-ascii?Q?Oyz0BFzlfpeHklgfyBl6njCZcd6OdA6thUTHabIFQ7sNfgu71NUN9x+L6jUx?=
 =?us-ascii?Q?YlpPr7fu6vJQVu8aoPnBuO6qRaRzdfuQzDT42mAAmmsQdGeIExy+/Aobpzp9?=
 =?us-ascii?Q?Xm2Uq7B5Hn0kTDGyETxMM/SfJN0GsgboRPwU1oM5G75VucwvfP1LGIVD8XoM?=
 =?us-ascii?Q?YgCHKwuYMYnMjBKBZPosvQ0jgXXQA/oUTPdOc+8xj3zL9vHRXrUZ1FkykYKo?=
 =?us-ascii?Q?svg07Dg/qROqlLZbjVXn0zQ9FRsIQzP+yzv87OPPsq2GhO6RGimKl3hPX8zg?=
 =?us-ascii?Q?dhhj8Gv2avBTsdsLe9rwrTbnTGH89o2bS0J4e3Nze+dpkMcZBR9h980njTJB?=
 =?us-ascii?Q?3X9O2NpLnBs4aL9jX1ZtOdbmct2A8ZdGYSSZwLqowYm1uztBTkLRoG/V4Uf4?=
 =?us-ascii?Q?3JW1oQ9SIiZ9DFhgfRenJHa3CeHVF1cIkjdseZk4Xf6mKJOKTdkxUKNtGFDk?=
 =?us-ascii?Q?3bHjohsT5JmKfVOqehNCFKyArYPbl59+TvBZF/fWjAHMAwqkTXxNd8ayoclt?=
 =?us-ascii?Q?2XHbL6yqvqXNtrOYZMlr11zm5TwDLuabUve8Uq5wl4t8/7zmCOAPi2wxorH9?=
 =?us-ascii?Q?UuqY5Ul7kvc/4kZfjW5w9FQL5lMcSBwY2hdF6MhvmpX1Sw+McNAyipKl4HmH?=
 =?us-ascii?Q?rbmKJSL0TNOsm+5dzETBkwmYpw4QlOUoa3Rx6IE3SIs5IAAsuXegFa6rgvAG?=
 =?us-ascii?Q?md3MiChyq3kLqi4jiVP2MR4hKOzlIFuUZy0GavTh2DsIKaZkha7qpND5t9Ae?=
 =?us-ascii?Q?1VzdsG3ZbxEg8WHp4X5SV/hapCMLzhb0pBzqgUFMO7jCw8VmYRMw+tlT6CbM?=
 =?us-ascii?Q?Vu8N0R54Q62ohDwrnjzXjTd425Vcq/PbfModMYqsFFr9EzZd4WMsxOwtoEWT?=
 =?us-ascii?Q?oX5FdI0Y/hCNjmJb36r3nWXg/VZ62t7JycNWLWVZu884lJ44g8Hzaa+ScT+G?=
 =?us-ascii?Q?zg08Q3St52tNH35AAa6FWPXYVvSZKGNPMLN1tMFpZYZVk6pD5nFYvSjSdTmH?=
 =?us-ascii?Q?Tdzp8c7AmlkfP1fpxyhiccm6FQ/HyJEKQvwUzE9sQ8XMJkS59cEqYvvO3zqF?=
 =?us-ascii?Q?2eAg2wyzVcF8Z4DnIA3KwHNV/3wFaPOjhsi01K7tXC1mDCvnNkiVJNpsz5db?=
 =?us-ascii?Q?FmdbmkKeo2KmcfABsqXvvtr/YEcnva0GLWJWaIwHFn3hWMJ5aPjz1bVwNc9q?=
 =?us-ascii?Q?GEqs7V8WXit9ryc6bDWi8Aw8p5HAdHncK2XSGaEeY5H6IgdmJla3z+XDDOM4?=
 =?us-ascii?Q?5W4jozaLO5Qa//zyHVlMHdFSzc+WNCtq7OFjRMPQsE/q7vnEBNTh1pOOLz/k?=
 =?us-ascii?Q?tmHQ4nLGdGQTt0uDrRVJf5WEk1GDkVOAQadXC65bPIDRE9dQTZ7eBcsVMmke?=
 =?us-ascii?Q?I6Az8rq65YleOSHEb5RYhQECEBVRIYIvSnvD4nStadGxL26b35sc+LHB+xFA?=
 =?us-ascii?Q?mlqbPLlQwwtJgCvop8SjHMGcfU9OK0pqgmCUjDbf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb421a75-faef-4873-5cc5-08ddc831b6b7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 08:36:40.2124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wd2q7DjJEWYs1IndsikVIPS0FRPX0OMntBhEjGfc03dNN93o3eMApLlN4d53njGSprPQ18AFcWXTsZk7/9Ekyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9925
Cc: imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, upstream@lists.phytec.de,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Wei Fang <wei.fang@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] net: stmmac: Populate netdev of_node
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

On Thu, Jul 17, 2025 at 11:00:37AM +0200, Primoz Fiser wrote:
>Populate netdev of_node with device of_node so that the network device
>inherits the device tree node information in case of platform device.
>On the other hand, when stmmac_dvr_probe() is called from pci device,
>of_node will be NULL preserving current behavior.
>
>With this in place, when initiated from platform device, udev will be
>able to export OF_* properties (OF_NAME, OF_FULLNAME, OF_COMPATIBLE,
>OF_ALIAS, etc) for the network interface. These properties are commonly
>used by udev rules and other userspace tools for device identification
>and configuration.
>
>Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
>---
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>index f350a6662880..dfd503a87f22 100644
>--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>@@ -7487,6 +7487,7 @@ int stmmac_dvr_probe(struct device *device,
> 		return -ENOMEM;
> 
> 	SET_NETDEV_DEV(ndev, device);
>+	ndev->dev.of_node = device->of_node;

You may need to device_set_node.

TBH: I am not sure why device_set_node does not increments the refcnt,
while device_set_of_node_from_dev has. But this driver supports
non-OF platform, so using device_set_of_node_from_dev may not be good,
and I would suggest use device_set_node.

Regards
Peng

> 
> 	priv = netdev_priv(ndev);
> 	priv->device = device;
>-- 
>2.34.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
