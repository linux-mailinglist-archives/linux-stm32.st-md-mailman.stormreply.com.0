Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFA38B8AB4
	for <lists+linux-stm32@lfdr.de>; Wed,  1 May 2024 14:53:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFD9BC712A2;
	Wed,  1 May 2024 12:53:47 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2069.outbound.protection.outlook.com [40.107.22.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C72B6C7129E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 May 2024 12:53:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrKJRJhrAXXi4i/+hJ1j9UdpHP6FNcrQn0czFC9LXFQmQ1uSkEB7GR3LWWmZMgGTG9LkBvN7vksBwqUi1t/QTes918QjXcjCE/6cRCeAYzaTCZSxDkNRcGzUuD/qXqqFXP9hr5uxDO2qZS7mZ7mx0v94SZjtryETWDNSr2AG42069jK+x8HFnhgd8U7osV0ZGPdeTUeHxj78Z8DavGulcyaYMngCb4BcJ23r1+dR5pkUa9DPphAqku6QxRiBqQTuqrkPzawnpi9lUuPtqvv7mRQKnHrAaJqwkrWExgVJxUBAWpPnvHfFRoV2I3W3u5DC7Kr97vXliWw/mc/CuVcLlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/HN0uRuWCWJNe64LQrS5DariOLht/eVTftGm18bK78=;
 b=l6RwEFZACPoVhJluOHFVBI7404cwKjbhdcTkQfV7s+pXF2DvE0zDcVrPbV7STu+icsFCwieWq7YY3327y8n5uESrBn11x6r0r0eA2C2fHn+x8leJHCLWWhQnWcsrS9U+nMBoW/7mrxO3PKu7NCngvfa9KjLorlxmgzeU/qckET+J+VjrtjxWY5+H1Mq7nUNfAMuNmIC5/HQ0Hm4MV3EKcIMZ/KxG5ie2JD1eJexyLfNFp4kpqO4yzY1Zunvv8rkG9MRXONWdLaZleOENz4H7qKalMYyuIdf1r/hVjxWOrt0qdc5pZdjZxgFE5rhzrsb5NavX5aozKi3DI7qmjB2wtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/HN0uRuWCWJNe64LQrS5DariOLht/eVTftGm18bK78=;
 b=K2kLC9l5lAUrG/78F6bbfqzg4obvd9TrGhg4Nx1bTHYElLOBWA7zy41Lor9jbtQ6E3G83iXxQ8YpoojMX3umsHMeZ4p9PVVKqDUCurBTX9NXcLIdMk1nwHUcnl5rhDhNsuSs4WQQh1lDQSshFtTxAlIzsBmTJfu0u9Vt4XXiMVs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DBAPR04MB7432.eurprd04.prod.outlook.com (2603:10a6:10:1a9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.28; Wed, 1 May
 2024 12:53:45 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7519.031; Wed, 1 May 2024
 12:53:45 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 01 May 2024 20:56:18 +0800
Message-Id: <20240501-pinctrl-cleanup-v1-20-797ceca46e5c@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714568179; l=1515;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=h0a9LV3oYSEF4ccWiOP3By2vye9Q4bNslLUZUu2GcUk=;
 b=SXVAnIHFcdSsBSSywnFDOPtR6P41Bx05UTk5YENmkF0qjYhIsrg7zH8yQPwm7asnMsPxjxU9Q
 2b97znrgTqNAgUnmN2vMF5Tp2B1upQ99/QV5V2XBdTEDCoOEv2AncJh
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0064.apcprd02.prod.outlook.com
 (2603:1096:4:54::28) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|DBAPR04MB7432:EE_
X-MS-Office365-Filtering-Correlation-Id: 2309f409-67c7-41f7-b48a-08dc69ddbc82
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|52116005|7416005|376005|366007|1800799015|921011|38350700005; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2hxQVowSG9Hd1kvV2RyYk9wTFFRL29oNVB2blNtdHJFS1FtNjZYMHJTN1pD?=
 =?utf-8?B?LzFuYnMvRnpYSG41dTEzTzRXeko5aXZrMkFZN3VSR2d1ZUJCZ3MxRnJsaGwx?=
 =?utf-8?B?V2luVWtvSVh4T3hxNHlnUjd1b0JxOFQ0MnRvQkovY2hRSzNVSXQ2V01Zc0tS?=
 =?utf-8?B?dHFnVThQWTlzaWp3bmFwNVQrRUVQQVRERWJrVEdIMnBpYVlpTE45M0FWSjY0?=
 =?utf-8?B?YmZKL25CYVlwWGxMUzE2MEIzOEh5NENjLzF6eGNRcGtrNXp2NFp1aWJxVVdw?=
 =?utf-8?B?aDJyZG5TK0E1QTJVblY5YjRyVVE3SVdNcEtaaHBxcEZQWGtwUlV0c0JsbVdQ?=
 =?utf-8?B?cWp4aUIwaXB6bEY0MmpvRkIzOGtBYnYvU1phdmE1MFRVQVVRMklWMFhsdzhV?=
 =?utf-8?B?cHZTK2M3T0tFUmg0cklXajNSMFg0UmtjaTk2SW1heG5kR2ZOdlEweSs2MUk1?=
 =?utf-8?B?cnNUdjhGRkF2UVJZK1dnYmp2VUZvTXplQzJ5VTNZUEVKdUVOZ3lPSFJYTm5Q?=
 =?utf-8?B?R1RsbGdaVk9CcEdDZlhQNkRrVXl5MGNtMWlBU3A1MDc3MDZuazVrT1BIZ3Z2?=
 =?utf-8?B?R285VVZ1WlV1RG84NDJEZGZoakJMcUtLNm5aN1JVc3l3OHNGYUU5NFdwVUV3?=
 =?utf-8?B?aHIxTkp2Zi9vM1czYVlLK2ViOU9abkZSbWVabDUrWnZSOVFSK2NOUGI1Ukxx?=
 =?utf-8?B?eCtnSEVCR0E2TWxQYTVQaml4T3RDRWVEaXJkYkd6RVBacmpCeEVWamp6aE9j?=
 =?utf-8?B?UTFGZUFsR1BuTUd0aldrTTVic1R0ZFBaREhkbys3SytXOVkvbXFRRFR3Ti9W?=
 =?utf-8?B?dVN6ZkZEOFJKNVl5aXJ0V29NbW5pNHdjRUJETXRXaU1IczlhMUgzZ2wzSkt1?=
 =?utf-8?B?Sk05NGF6VEh3anVJd1VPUnkvV0lVYUxNV3ZJR3R0U2hMTFlLcDFqVHZzd3hx?=
 =?utf-8?B?djh3YjJKUGhNQTB1T0F2c25INzVmK1ZQUUs3c0hyS2pxZzhIUUREbUhUdVVE?=
 =?utf-8?B?czllN3YvRk90eUF4WWs3OXpCRkNIcXpPTTRRZXlvT0llM0pDeFBLRXBwZzc2?=
 =?utf-8?B?ejJZUnN1QllnZ1VONFZIRk9WZTdWbDVoaWROdERKQ3ZHdmR3Rkh0R0gyZU84?=
 =?utf-8?B?VlRyckc2WFliK2M2WUpZUVZMZTlUSjNqdm51NWZmWGZhRDdjNldjUGxLOUlt?=
 =?utf-8?B?ai9jVXBvdDE0VDlBRWFweDNnTUxhaFRHTHhFU2N6VkM2dzBKbENIdHV3M3o4?=
 =?utf-8?B?c3dPSzd5M1A2U2tGVEVRR0U5bFdQYjVGMXJTU05LN2VFNnVob29GNjg2eHZp?=
 =?utf-8?B?UCtENXVGU0RQazZwejZZMktnUUhHWHRBdFdtTUtlcmRubjhYUjRzWm93VUFE?=
 =?utf-8?B?V1lWU1pWYlRneThKQWFqL0g1MVlyMVBkNDZhZjJhVEM0R25HbWR3UStFU1JG?=
 =?utf-8?B?enppYUxOUUJaU2FrclA2ZERCVm9jaUZrMlRPUEw2QUZQTG9jTk9XVnZhS0or?=
 =?utf-8?B?UTdjTzFoOFdLNldaMmxwSDJNbkNVZldqRVJrS1J1WlRmZFNWbTBwbEpLaFQ4?=
 =?utf-8?B?R2hINUUxeTNRK3dQZ1lIcWY1eFl3U2o4RjlMcDJJSGVORkNQVE5teXY4STYr?=
 =?utf-8?B?ZGlMSlFCTE14eHFYZllzZkh6Z3ZRZ1c0WXR6VnpTV0ZFRGNrUnNoWEhNQUI4?=
 =?utf-8?B?L1hLZjNBd096U1B3QXdrYzAxZzBEeVpaNGJ5cDhaTERCRTRCbXhaREpFNGE4?=
 =?utf-8?B?NS9nMUliTkZ5T3IzbGxLWjVGSDBiZGdNeWtETFhWMnNuelVhR1hWUkYvK3JK?=
 =?utf-8?Q?TsEGHqdtKPsXsuXIpL38Xv98n/eFhraku9fPs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR04MB9417.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(52116005)(7416005)(376005)(366007)(1800799015)(921011)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDA3MDMrL2FXU0NPLzJ3Q3JYQjBmWVJWWmdrdEJ5NUNNSEh5MjF6dkUxMnl3?=
 =?utf-8?B?TmVHV2l6WmVLdE0vRlkwL1hGbjlraTFGUkRoTlM3TlZ5Q2txQ0x3OXVZcy9B?=
 =?utf-8?B?ZUE0TVFFUHV6TmJVZ2p4TTBYNlRQS3UyYXppaDlSVldpcFJSZWNON2FyT2U1?=
 =?utf-8?B?ZG52cXNGTHFBdlFiZjhLLzlydmtDanFmcmM3RE1wcGFnaTdyZFlQK3ZOZkR3?=
 =?utf-8?B?dlhxWmxEdjgvdHFpbzI2VVllbFJ4Q2FjM25nclNTUmJFdHN5RTRpU2NtOUtG?=
 =?utf-8?B?bHhDemNPWVNjUUJaYUkyVWtqWERMOHpOUTlvT003bjZOYisveFlxSnBVeHUw?=
 =?utf-8?B?WEw4U0JVb0t1cGdsWTVKRlhKQzBBNW1VV2c0ZmNTb25yaEpseS9hZi9ZSytN?=
 =?utf-8?B?TElId2YvMnRLTXlFT1FabVlVa2xzSW5CSkVQRXNCbzBYeERReDk3TUlncGN3?=
 =?utf-8?B?L0hZdjI2ejM2U2FWRFh6RXNTOGVEUVV2ZFcrMnV0blh4Z1dMUHVTZFE1ekJU?=
 =?utf-8?B?WE9jQW15QTZZTCtLdTV3QWQxR0RFOHZXZkxBRGY5Yy85QTU3M3VxK1NHa05N?=
 =?utf-8?B?dFpnMm90NTlnT2JIcmNzMjE3dzYzV28rZGdhZktmQlAvZm5YbnR3cjhNRkJv?=
 =?utf-8?B?RjB6M1pJK0lHblkyQTZkaXVmV20rcTRDTW5JT1VvSGl0VFFQaDVmQnFERFZu?=
 =?utf-8?B?cXF6VTEySi9Ud09SVkc4Y0ZudkRkWHVzbm14ZGZwcGtYRDVXbjhVaWVPSmNV?=
 =?utf-8?B?VllPT2dMaWR6Y0FoWjBrR1d2VFB1SmZsay9sdkdFWE1JYmQrTkM1TzJISFBl?=
 =?utf-8?B?cGYyTXVCeUxjMnEyWm5YR3MxRVcrNTgvdy9XU2k1V3dDa3BHWXpMMkR0V0Ur?=
 =?utf-8?B?L0swNFFKT3llRGRtMnRFbUgvYmN2YmJhZFZLTXdJYkpEZkRpZFhSYURFbG5v?=
 =?utf-8?B?cTRQbElGb2tLYlltN2o5OWJONFV1RXJtNmxWSEczQXNPQXVjV0ltbnlHcTVB?=
 =?utf-8?B?SW0yS01LNkFmajBKc2ZBdnhnUFcvWm1jU2w3WklwMlJYbUpRbFo3NU9FR0tG?=
 =?utf-8?B?U2lGb0pUdW9CdGp2blZKS3ZuMy8xaGZuYm9zeDRCOXdoZ3FkWnhGK1A2RWNN?=
 =?utf-8?B?UkpBb21XaVVkMEU5MzkxKy9zYWZaTWhuZFh5aCs0ZXdROGdDbE93clU1ZkQ1?=
 =?utf-8?B?ZEY1cDA5MktLWEsvNmJiTGhkQnBVaEVUcmNsdWQrY0pkSVNjS09tdTFPMWgx?=
 =?utf-8?B?WGJYUVh3WTduYlJkZTFPZ2Fmc1FjTlgwZC9uWTVvandZaDh5ek9MUnZDdmFQ?=
 =?utf-8?B?bHpIbVRJdzhtaVJBM1Zid0JydmVrTkZEdGZqbk1oN3RsYndFTUQ0a0hkYUkx?=
 =?utf-8?B?Z05LZFhsRFFreEltZlJ4V0V5enF0ejRNYWsxM0plWmd3bFhjTEJqUGxPQUpo?=
 =?utf-8?B?U2NjVUVhTXpUQnFaYllyMkp4UVRDUE1BZENlTmFPWnhPTjVkSFAvK1Bxc3FT?=
 =?utf-8?B?M2xWcktxSmh4SWdSOFpCK1g4alJsYkRLdnZNWFZCeXo4WXNrREFwNlI0QkdJ?=
 =?utf-8?B?c3I0SjlDRzBML1RwSERIMSswRm9rNzBUdG5lbmhuMWsvR3dXWjB5U3Q0MFdO?=
 =?utf-8?B?Q3ZheHFSclVnSXE3Y1dhUWNrZGpUUXl3ZzRJdVdzSEh6NTBXQkZXYzhLa1V5?=
 =?utf-8?B?WmNPN1pXQzFFazYrWTdnQWxoN2JWcmRURDhwczg2all6L1JydG1wb3MxbUZI?=
 =?utf-8?B?L3czU2FZdTk0OFE4alBRRHR0b0tCWHc4R0Q2Q3I0QlFHZlV5ZkI3NEdVREpV?=
 =?utf-8?B?WGt4RGZaVXNOQTQ3dURyQWU1WXVRNWpUU3QyYVUvaUVzMzBLMWxxcWs1MWRE?=
 =?utf-8?B?NitCejVEcUxyNmxDZTBNRTF6OWhtNEtoTldQK3hVT041dDNRVXZYMnZpTDRx?=
 =?utf-8?B?NWU5UUVZVzc1TC9qek93NHpaYmVMYXpsWnlEWnZLNnNUZDR5eEY2WjhlYkRL?=
 =?utf-8?B?RnQyWndPSGtrUEZHcExHOXRtMFZaWE94RmRqeFB0UkpqZzRuU085TjZhckFP?=
 =?utf-8?B?WGZzdHRDejFPZ2dDTm8wc1pHQnQ3ZENoekplbGxkUGlhTndVUi9hYUZsZitY?=
 =?utf-8?Q?rJmSr/hXbAjZa+tYu/cqgQHtJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2309f409-67c7-41f7-b48a-08dc69ddbc82
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 12:53:45.2588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7Hq6vl1hoEdKBQfGyXFYIZ+fqMoLhYMh1DhSQi9POJ/KCDU7AREbfyGyyrtUObiPRdCGCkfUxBwOXpIskS6rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7432
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
 linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-rockchip@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 20/21] pinctrl: aspeed: g5: Use scope based
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
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 5bb8fd0d1e41..61fbfddb5938 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2629,14 +2629,13 @@ static struct regmap *aspeed_g5_acquire_regmap(struct aspeed_pinmux_data *ctx,
 		return ctx->maps[ip];
 
 	if (ip == ASPEED_IP_GFX) {
-		struct device_node *node;
+		struct device_node *node __free(device_node) = NULL;
 		struct regmap *map;
 
 		node = of_parse_phandle(ctx->dev->of_node,
 					"aspeed,external-nodes", 0);
 		if (node) {
 			map = syscon_node_to_regmap(node);
-			of_node_put(node);
 			if (IS_ERR(map))
 				return map;
 		} else
@@ -2648,7 +2647,7 @@ static struct regmap *aspeed_g5_acquire_regmap(struct aspeed_pinmux_data *ctx,
 	}
 
 	if (ip == ASPEED_IP_LPC) {
-		struct device_node *np;
+		struct device_node *np __free(device_node) = NULL;
 		struct regmap *map;
 
 		np = of_parse_phandle(ctx->dev->of_node,
@@ -2660,7 +2659,6 @@ static struct regmap *aspeed_g5_acquire_regmap(struct aspeed_pinmux_data *ctx,
 				return ERR_PTR(-ENODEV);
 
 			map = syscon_node_to_regmap(np->parent);
-			of_node_put(np);
 			if (IS_ERR(map))
 				return map;
 		} else

-- 
2.37.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
