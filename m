Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5616B8B8A7A
	for <lists+linux-stm32@lfdr.de>; Wed,  1 May 2024 14:51:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20481C7129F;
	Wed,  1 May 2024 12:51:13 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2047.outbound.protection.outlook.com [40.107.13.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4697C7129E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 May 2024 12:51:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mx2AIyIGzfd5Q77t/6LKVx/pkHtkuA2Yj0BCsuwrQVDHwErQBzHCXeXnqjYohlr3QMElIR6WaLBzrn6wDFgMN2/o7kyNeGkBirwKGPTKRbGx4qDcbY/qWfjZ/HgLidONo7R2mF02FD2MW2+WlFwbUMdWSBTMAJb+BcW4HEbaF6JhNyTqqBoE9ACTKBlCXjNENbd2z55sc+LWPiMQnZcXJnd8dRRVRT9q4mVEsYJcDZYCzuwA++YRz5ESw4KUJ2yctoeDpSykjgtwf5Xf2E2H4vaFYpF6ygESZO2/Ex6elMMwkmB0IjKr78b9FALhVuF9S7mmwyAaqjZdKIaCfc17Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKdrrsLcFbXA49UIlhYel38tScIuaU0cV37+EwKMmJc=;
 b=jWJIiTtQ2JWx1tXUI3O/a+3V4flt/DVMAVhRT9e/oUUR3d8sLCGsR49oPGzLJEcaPE2XgAqq0wQk5foByxskM0c1vBtfr2LSDG4zpTtRvRylt9ZeHpFsgoptWwW0sTPX/KPIfRieHn2qNTAjIuJL1kGrq3OQQTTjIWnXtdt8N//1aqtXiCFBTgaUDsZI0fueepUQFlLNQyQnKfwuHZapZE6f4+KcLpUXUQiUUKwGcqNJmmz7RlxinXZeYGObXK9uriPebFBJhqwVn1HdzGRQgIE6mnlZbz+U952vQX5Nkxj6xtYe2UmQDeiHoEbJUyE54wCsZ25Ug7rWmSFSuMpQ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKdrrsLcFbXA49UIlhYel38tScIuaU0cV37+EwKMmJc=;
 b=J2Oo6RqI3waIqz8/6pJE5VIjvbMXZSe5gUN6zo25Gx2wRaUYN3JXtAC7WssgiIVDpRHrMpNXfPVN/IOqJkvmJI0vAVG7VqGK1VpTktBlB9Z+s3qmpAcohAoUsisgnz/QGmQAAxIrC7PvIy9KaMJvF6Z72sok1m3zgN1+94QRUjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DBAPR04MB7448.eurprd04.prod.outlook.com (2603:10a6:10:1a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.38; Wed, 1 May
 2024 12:51:03 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7519.031; Wed, 1 May 2024
 12:51:03 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 01 May 2024 20:56:08 +0800
Message-Id: <20240501-pinctrl-cleanup-v1-10-797ceca46e5c@nxp.com>
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
In-Reply-To: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, 
 Wells Lu <wellslutw@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Viresh Kumar <vireshk@kernel.org>, 
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Heiko Stuebner <heiko@sntech.de>, Damien Le Moal <dlemoal@kernel.org>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714568179; l=4898;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=VzwfunaS6oe6w00xXDeMo+Rdw8rpK6f5f57ZNP6p+Dc=;
 b=YiGY2Rbt/DyQTdPhzE0bccyp3SEualuIWcMVbzLs6lRVW3PSd10C6Ggee5a8mAP3Fy9euQt33
 dt4PDc3LBg3BrTeQEfKFaGCAetnU0PJZf9U8UlJdlsGdqeAQHUFcjkh
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0064.apcprd02.prod.outlook.com
 (2603:1096:4:54::28) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|DBAPR04MB7448:EE_
X-MS-Office365-Filtering-Correlation-Id: 14565aa8-5af1-4eda-0f3b-08dc69dd5c53
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|376005|7416005|52116005|366007|921011|38350700005; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bU56UC9JUFZ3bU1zQ0F3RVRBbDV3c093Z3lrV2pqUGMralZJN1RnMDcxZFUz?=
 =?utf-8?B?ZjI0cHpRMVg0UmJmblFyeHpTSFhqdlhjZlVkYXRDRHk3OFEwTWlNSndTSDNQ?=
 =?utf-8?B?VEw2SDMrRVVBTWpMTExuV2JLdmVyZG1FSFU5VUpabW9WZUVDbk5iL2JQSnYv?=
 =?utf-8?B?SHVYT0ptRHhGNUJpZTEvTkZHeWI0WTl0MCtHQ2M1ZFV2SVQ2UDdDdTh6bEFL?=
 =?utf-8?B?NUY3U3VFVTBQblpSUlVZM0czRVRvbTJERkJ4Q3p4VkNPT3FiMVZrQWZMWVlv?=
 =?utf-8?B?anhINFhQNGJxWEExLzlVNktLTUNTSmp6NWhadGVNRGNPaktsZHRCQXByVWxR?=
 =?utf-8?B?em1IZTdSNXZtZDhqMmE2clgvRVZIRVdFcEs5dnphS3NlSXI4OW5nbi9XU1RP?=
 =?utf-8?B?czRxdkM0enE0WHF6WG5sdGJuZFVZUlRLUlhUSGFxZndoMEpvSzJMdWNUTm1U?=
 =?utf-8?B?SVNKYUlGY3ZQT2hSUWNJby9WSWlCR0Foc3R4UXo4TnlxRkZld2ZYcms2dWxW?=
 =?utf-8?B?ZHNzcFd6bENZUUdUUzBiNVo0am5mWW93Q3M4NnEyTmVTbk1zQlhrUzFYNGdz?=
 =?utf-8?B?d0pkYXlWSHJScXNWMzI3dWROQTdkdEplNS9UM2JGK3ArYlhMZHRGRC84R3NB?=
 =?utf-8?B?UEVQeVl2dDgwZ25veFdQcnpiZWhTNGw1ZTZDNkdLNld5MytXbnMyQVBNRnY3?=
 =?utf-8?B?ZGhGRXhTdkR4eTRUYmhHb2duVmIvZjJEd3lReFlScy9HbkFZSUxEUkVjMFBN?=
 =?utf-8?B?UzBUdFNjNmh4Kzk3MGVsWW5PdTBkMkZqWDJ0azk3UTk3ZlM0dlJBMkJnRnBw?=
 =?utf-8?B?cmFjMW5Ub1czblk5VTh6TnBvMTFNQWlxWUF4RUw0RTFESFduT2h6R1hEN1Vl?=
 =?utf-8?B?Zng2Mm1FMEZhRzU2MHRSOHR4dGpxd3BXOS9oYjZjMVhaSkhkZkdCR0NXL2l2?=
 =?utf-8?B?VC9DS3BFY2tzRWZZaVhiL2VHUStFT0J1NG1ya25CZmg5aDBTenFjRXBMNys2?=
 =?utf-8?B?Tm5pUEFjQmhKTzk1NzlTSldYSVJRV2pPV2NrRGtmMjExNGRuOWRBTUZFVW45?=
 =?utf-8?B?RlhGZitNb3NqWUhRODZnZ3hPNWRaVTNOWlpaWmVyajgrTFI0UDlNeXh2aEwx?=
 =?utf-8?B?R09VTVZmaC9lRmNvNTVsU0traVlCUTdwYk5zNUJRV3hpVG5uRm1id2pDNGpV?=
 =?utf-8?B?MGo2RER1cFdFOTdlRU1NRFd2cmtkYU5WRHZCdldDN0hTd0xOMXhuRERVTVVE?=
 =?utf-8?B?eUg0WTkvS1h5dnIvR2VsS0lsVDIvWGoxYXFKNEZmQms3amkxZFpzTldXY1hE?=
 =?utf-8?B?SHFJWTY2ODN4YmYvRGYrZU5HK2R4cytoSmo5dUx0c0FrTjlmajRyTEQ3c3JG?=
 =?utf-8?B?aWxIbWErM2pWeFVQaGNuNUVEV1VBbjJ0UURlRVlhQnVhN2M5UnFGWDlNdVl1?=
 =?utf-8?B?b3Z0elZtSGlBYXQveWxMVW14VGhzcktxTUxwTmxmQ285eWFBVUJ2NGpKMTBv?=
 =?utf-8?B?YTFpVERuOS9OZzdHN3MzUllFQ1lQblpBL0o1eUFSZkhuZEtHM2pxRG5ES2tS?=
 =?utf-8?B?cjFSSkhCNWo0Rm5naFdESHdHTjFteEdkaGxMMXAzUDZETW51WWpsR1BrTFNU?=
 =?utf-8?B?QXU5NU91SlZBaWpmNGdrNCtrRi8wZUw2MXAzcXM3U0NEVitXSXprTTYweUd5?=
 =?utf-8?B?T2NBd0czOHhaZWVHVFVqN3lNSXlqZkJoUjF4U1EwQXV6RWdHMVlFTGl1R3hj?=
 =?utf-8?B?a2cvZUl2T2dycVEwOVYySm1neEsrbUIxYWIveEdkdmJzcitHSGlpQkVqVDZV?=
 =?utf-8?Q?Fp5i67KJAnTJbFGNEOaKDpzC9uzZnDDDKVjOk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR04MB9417.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(7416005)(52116005)(366007)(921011)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVIvWE1aWGlVNWtwaVJ4Q0pXOHhHSysrVngwYk9lRUV0aXZVN1Q3bnVtQW0r?=
 =?utf-8?B?RlZvTTkzbFlicjVwSVozTUx2VWt5c3NpTHdXWklwTjNkbDFQK1RGNXBGTDVK?=
 =?utf-8?B?akVJeklVcE9ad3NrUCt3dUxrbjdIWmROMHBYckNBNFI3VjRrQ2FnUHp1bFdq?=
 =?utf-8?B?MjJqQjVEY1lsc1pwLzVQNWp5bHBVamRpa2FNVG5sVmRMMHlJN2ZieG5nZTM3?=
 =?utf-8?B?aTA0TkZPYmZxU0R5dXVtRnhVUVJOQVZrT1VyaEdFMTdmNzdCOTV2WXpIWWx4?=
 =?utf-8?B?MHZxN0pQbWxPT2pzdzdycDJjUldqYWQyQTcyMDR5TG9BYzVLQkdzSzNseGg3?=
 =?utf-8?B?QUpMZnEzbXhxeUVUQWJhQ05VQWU1aDNvdndBTkh3Yk02NURDUmdkSlFFdDRk?=
 =?utf-8?B?ZVBjZTJTVEFwQ09FOUdYd0ZTRlpjRjluSkVpVHlJdVg0bFhYNkhxVUo4cTRl?=
 =?utf-8?B?ZndNaWpLOGNsNmdVa0NSZExsUHZRS2EvVlRCNTV5WC9LdSs2M1U1OHV5Q3Bi?=
 =?utf-8?B?dWNxcDV6dUhlbEM2aHdrd29qTEpkZi9WaFR3dlBCZjNURkpkbkVZclpVcG5P?=
 =?utf-8?B?a2l0NXozeFFiNUZLNlRzSzRCUHZuVXYzTTVRejVDNWt4Z2FzUTFPZXpnSnZT?=
 =?utf-8?B?dko5YTFzcXJQcWoxd1lxcDJPaG9DcXBQUEpoT2tTNEN4SVNBeG5TSE5tZ0dF?=
 =?utf-8?B?OC80Y2NYSlpEVVdXSENCSTgwZUxWYUtwdU9HKzZlbnBMUVM5UWVCUjRINThm?=
 =?utf-8?B?bURQWE5QUEpueUxxc3o3ZlkvM0FZZE55dW5Oek9zTklmRFFDYVZhb3pYSzEv?=
 =?utf-8?B?TndQMnBwaWhYUXVaTlhzUjY5WmNMdXVwYlJoR3dNZ3g2RW9DbWt3a3VxV2RO?=
 =?utf-8?B?WHorRXNUeTJtQTdxcFJ4dDZzYzdqL1p4NDUxSnp1L1FlbXVjQjZjak15bDlr?=
 =?utf-8?B?NDRuZXFBOXI2ampKcklMa2pEeHVVNWFocVFIc1ByL25CYjhLZ1FNZFpaUjZY?=
 =?utf-8?B?T3lQRlpHcHhqWG9nc2MwMjNqbUVPVEo0eGdnNzMrVnQ4dEZSTzBnTmw4VUpE?=
 =?utf-8?B?Q3laeC9RZG5uUlRtQUxOSkxadllqOHhZSm5lVkJ1WkJWQmlUampWcFRzcG9D?=
 =?utf-8?B?enRsK2haa1hxRWJ0VWIzNThjdGtURlJJOTBiazFjWkw1TmNhV3VqTGgva1pO?=
 =?utf-8?B?NU00NGFmWFNSbjFYYi8zMHNXeStBb3BycW5yZXBZa1pnZXYzeE9RblVHbXFF?=
 =?utf-8?B?L2swaFZHMXZiTlBvZjhmdjdVUTQrOTIveU9TdFp3M2o0WXdRWGRJVjZNZ3R6?=
 =?utf-8?B?YzhSdmRUWVB1R1JpZ21LOCtkY1FndVpHdDVLZnQrRjJCamVtNjJaZ2Y5empj?=
 =?utf-8?B?czVRWFIxNW9jZlVEaTZhV2g1bVR1UmdRV1ZiQjV0RGxZZXhLNERpaStTcVJs?=
 =?utf-8?B?eTRXRkZhc0Qxd3Ara00wWklXZDkvOHM4ZHBVV0x3YUc3bDJ6MTR4SjdzV3Fj?=
 =?utf-8?B?b21KditBTzlUMGJmNG5ZbXFMeVFWcU1DcEZwcTZFSXJBbzZWT1daNlRDb05S?=
 =?utf-8?B?SDVvTWExVzY1WDU4Q1RHVUhpMDhLWjFCZWtScXdvNFUwcWZkZmxJT00xOTFB?=
 =?utf-8?B?ZWplMnVTelVKSVhyYjkwbGlUcUt2TUpBK1k1S0h6UFdLRmRXK091T0kvcHZ4?=
 =?utf-8?B?MVorVUd3N1gvb3IreVZFbDV2SU5iOGdHWXpzdnliMURlcG1GZ0RiamFZb0dy?=
 =?utf-8?B?R3Y1UWtaeTFHOUo2SGxZZWZYTWhGUGk1Y2dUL1FzV1ZHSzdrS1dMU0xkZGJi?=
 =?utf-8?B?OXJadjVxRExQT1Z2MzNMUUlCVWVzb096V2o2bWRrSkxLZGtGZVFGbDF6eDN4?=
 =?utf-8?B?UE9mVU1QYXN0dmV4REJKREVKZU5tQlpjUDJ3SDV6VHloRDBEVXUvR1o3ZEpy?=
 =?utf-8?B?NnhjREJRUGYydXFEY0V3bzRBWVlZbEZIRkRzajhkZnpqamhZUmJpY1BsdGtt?=
 =?utf-8?B?bmVpSitOQlNEVHJoTXZvcWh0YUczWGlnVExMY1FhRkJJZ1BaOTZtMEdDcVk3?=
 =?utf-8?B?eVdIbWRmWWpIVkRaUVNadVJodXh3bHpUYkJ3QlhqMzJYTzNUNzVTTXh3azdC?=
 =?utf-8?Q?cV3FtoK5eTfi3+DDa0l+d/V2g?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14565aa8-5af1-4eda-0f3b-08dc69dd5c53
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 12:51:03.8718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nw4pC/jn3hWGaBhQpXBQx9748jz/R/WAXvIar8/EH1DUCFNqD6AUSWNmbXQlCObeEqGpzymgQdNsgseCwyj+Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7448
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
 linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-rockchip@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 10/21] pinctrl: st: Use scope based
	of_node_put() cleanups
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

From: Peng Fan <peng.fan@nxp.com>

Use scope based of_node_put() cleanup to simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/pinctrl-st.c | 40 ++++++++++++----------------------------
 1 file changed, 12 insertions(+), 28 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index 5d9abd6547d0..2d77160f3654 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -812,7 +812,7 @@ static int st_pctl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	const struct st_pctl_group *grp;
 	struct device *dev = info->dev;
 	struct pinctrl_map *new_map;
-	struct device_node *parent;
+	struct device_node *parent __free(device_node) = NULL;
 	int map_num, i;
 
 	grp = st_pctl_find_group_by_name(info, np->name);
@@ -837,7 +837,6 @@ static int st_pctl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	new_map[0].type = PIN_MAP_TYPE_MUX_GROUP;
 	new_map[0].data.mux.function = parent->name;
 	new_map[0].data.mux.group = np->name;
-	of_node_put(parent);
 
 	/* create config map per pin */
 	new_map++;
@@ -1161,7 +1160,7 @@ static void st_parse_syscfgs(struct st_pinctrl *info, int bank,
 static int st_pctl_dt_calculate_pin(struct st_pinctrl *info,
 				    phandle bank, unsigned int offset)
 {
-	struct device_node *np;
+	struct device_node *np __free(device_node) = NULL;
 	struct gpio_chip *chip;
 	int retval = -EINVAL;
 	int i;
@@ -1179,7 +1178,6 @@ static int st_pctl_dt_calculate_pin(struct st_pinctrl *info,
 		}
 	}
 
-	of_node_put(np);
 	return retval;
 }
 
@@ -1195,10 +1193,10 @@ static int st_pctl_dt_parse_groups(struct device_node *np,
 	struct property *pp;
 	struct device *dev = info->dev;
 	struct st_pinconf *conf;
-	struct device_node *pins;
+	struct device_node *pins __free(device_node) = NULL;
 	phandle bank;
 	unsigned int offset;
-	int i = 0, npins = 0, nr_props, ret = 0;
+	int i = 0, npins = 0, nr_props;
 
 	pins = of_get_child_by_name(np, "st,pins");
 	if (!pins)
@@ -1213,8 +1211,7 @@ static int st_pctl_dt_parse_groups(struct device_node *np,
 			npins++;
 		} else {
 			pr_warn("Invalid st,pins in %pOFn node\n", np);
-			ret = -EINVAL;
-			goto out_put_node;
+			return -EINVAL;
 		}
 	}
 
@@ -1224,8 +1221,7 @@ static int st_pctl_dt_parse_groups(struct device_node *np,
 	grp->pin_conf = devm_kcalloc(dev, npins, sizeof(*grp->pin_conf), GFP_KERNEL);
 
 	if (!grp->pins || !grp->pin_conf) {
-		ret = -ENOMEM;
-		goto out_put_node;
+		return -ENOMEM;
 	}
 
 	/* <bank offset mux direction rt_type rt_delay rt_clk> */
@@ -1260,17 +1256,13 @@ static int st_pctl_dt_parse_groups(struct device_node *np,
 		i++;
 	}
 
-out_put_node:
-	of_node_put(pins);
-
-	return ret;
+	return 0;
 }
 
 static int st_pctl_parse_functions(struct device_node *np,
 			struct st_pinctrl *info, u32 index, int *grp_index)
 {
 	struct device *dev = info->dev;
-	struct device_node *child;
 	struct st_pmx_func *func;
 	struct st_pctl_group *grp;
 	int ret, i;
@@ -1285,15 +1277,13 @@ static int st_pctl_parse_functions(struct device_node *np,
 		return -ENOMEM;
 
 	i = 0;
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		func->groups[i] = child->name;
 		grp = &info->groups[*grp_index];
 		*grp_index += 1;
 		ret = st_pctl_dt_parse_groups(child, grp, info, i++);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 	}
 	dev_info(dev, "Function[%d\t name:%s,\tgroups:%d]\n", index, func->name, func->ngroups);
 
@@ -1601,7 +1591,6 @@ static int st_pctl_probe_dt(struct platform_device *pdev,
 	int i = 0, j = 0, k = 0, bank;
 	struct pinctrl_pin_desc *pdesc;
 	struct device_node *np = dev->of_node;
-	struct device_node *child;
 	int grp_index = 0;
 	int irq = 0;
 
@@ -1646,25 +1635,21 @@ static int st_pctl_probe_dt(struct platform_device *pdev,
 	pctl_desc->pins = pdesc;
 
 	bank = 0;
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		if (of_property_read_bool(child, "gpio-controller")) {
 			const char *bank_name = NULL;
 			char **pin_names;
 
 			ret = st_gpiolib_register_bank(info, bank, child);
-			if (ret) {
-				of_node_put(child);
+			if (ret)
 				return ret;
-			}
 
 			k = info->banks[bank].range.pin_base;
 			bank_name = info->banks[bank].range.name;
 
 			pin_names = devm_kasprintf_strarray(dev, bank_name, ST_GPIO_PINS_PER_BANK);
-			if (IS_ERR(pin_names)) {
-				of_node_put(child);
+			if (IS_ERR(pin_names))
 				return PTR_ERR(pin_names);
-			}
 
 			for (j = 0; j < ST_GPIO_PINS_PER_BANK; j++, k++) {
 				pdesc->number = k;
@@ -1678,7 +1663,6 @@ static int st_pctl_probe_dt(struct platform_device *pdev,
 							i++, &grp_index);
 			if (ret) {
 				dev_err(dev, "No functions found.\n");
-				of_node_put(child);
 				return ret;
 			}
 		}

-- 
2.37.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
