Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B9B8BBBEC
	for <lists+linux-stm32@lfdr.de>; Sat,  4 May 2024 15:14:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF9CFC71291;
	Sat,  4 May 2024 13:14:54 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2077.outbound.protection.outlook.com [40.107.22.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FBA1C71286
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 May 2024 13:14:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUWsAuXgOKWq65PCrP9C+WmK/AFfmaCTCPRFukS/x2CYCw93S5laeahvxUYjKjd0pgj9JVyj13jj0RmcrgAeDgd70hzkOJvZRP5GhcDRrYpFJjHz+obdo016nNekOuqFcxx6UxlSPSiZNIZNaGzEfocf5gRCBx78gnlCx36a4eWUJaI+Ot9uu1xaOT/9xpAfI8t+UdlP0iyS1GFBCyaCq0cCMTuP5/AkW7dkEgdUmvMEzPkszbZg2wEtDc7d4jd6I0IoBa9OFDa4BlYBxwS2NGJ/i4s69gT7NPaRrSco1iijF3mim2quLCpJoqL4hbeGoUGu/r9Dhrx/atUdd0HAMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vokkuqgxyY5IUH8pE/dXW6vgGGl21pxNgCW/XhD57MY=;
 b=hHqFpmyRqlcw/4fqhS5W/oGJyszBYWmHxskkNIVpi9ofFyxfnaST8RJiKVnILgnZICeZtTqjr3qOO2s+uWNPOZQABxDTUtBkDcbdYtH5nxrQ4RjH8wB8ELXTouK3bAr4MdqEM1dKh5JhoBUtQldJLA5zCkGHmLydoAPKh2rlcDMhzlfTrGsJ1+6USjrsFnSwiwwP57xQIL18wsgyO0NtaNDpqpGlzzg1xNerwUNEfycduFNSx+u+DEF7+VUS7JywZS+oTqtuZF3K6o4+YB3gIZdq5WcpKvkT4ve7BIg4gRCuYMw8XQhzJPQL73u4utmh4DkNNRTLymRP8vsEwcdAyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vokkuqgxyY5IUH8pE/dXW6vgGGl21pxNgCW/XhD57MY=;
 b=iZnIReQ4wZWUttAX3CqmVOY/cy8r2jDJVTyW3auHbbvjzhM/6lPhBWaMzuaVvjFcMMkVEw5lp9xBPwQ8OOb3wIJ2V9Io5y7ggQD9n5Go8PmkJZp3PwpzGRW9H+kqj/OIZJHf4tJteLiUbW64KhA0qoTnqZq+37Lj+7it5wVTQTA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM9PR04MB8633.eurprd04.prod.outlook.com (2603:10a6:20b:43c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Sat, 4 May
 2024 13:14:50 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.036; Sat, 4 May 2024
 13:14:50 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 04 May 2024 21:20:07 +0800
Message-Id: <20240504-pinctrl-cleanup-v2-9-26c5f2dc1181@nxp.com>
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
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
 Dan Carpenter <dan.carpenter@linaro.org>, Tony Lindgren <tony@atomide.com>, 
 Stephen Warren <swarren@wwwdotorg.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714828815; l=1826;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=8mEXPtWcMD1dO1kfLyDNpVkp869sIls+8yPccG0G3Io=;
 b=Khs2zelGliaL8fmUviQXPXSVDQ1eQ1SaAtwroqFPpigDdALV264pqy390e4AFEOqYQgGi9tW5
 VAhx4S1rhRkBWvJ7B9Kn4+VsTHM/VeYcR3dExy9enWKyK+tvT3oIozz
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR06CA0230.apcprd06.prod.outlook.com
 (2603:1096:4:ac::14) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|AM9PR04MB8633:EE_
X-MS-Office365-Filtering-Correlation-Id: 6db9388f-6ac2-4d97-4849-08dc6c3c2db3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|52116005|7416005|376005|1800799015|366007|38350700005|921011; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHBINjBWOTAwOHJiQldRcllpRGdwK3dqa1pmcVo2cUlURHpMNks2ektQWVd4?=
 =?utf-8?B?Njgrb3BxYlEyMk8zaVJkZGY3QUxFOXI2S1dBcGJRVCsrTEhmY0J6YVg3QlBr?=
 =?utf-8?B?SHFWbVE1MVBjSVpTQzFLc096Q1ZIemRhOTVsTzhuazZmakEvMVRkMnJ6RUlC?=
 =?utf-8?B?dGxTcEVNM0pjbEZnL21jL3M2anlsejNkSWIxOFliZTRMQ3NzNGVjUkh0NS9w?=
 =?utf-8?B?dkkxOWFOYzYweUdiVXZKc2FNSkNXKytDa1lQVHVFRWxia2Y5MXB4SFd5dUYr?=
 =?utf-8?B?b1BFMFA1YWJ0bGFrSjV5VU94bTZ6dTJDb2dqRVFZRkxXRmo1cWhXZTBlRzlE?=
 =?utf-8?B?SGsvbHRjZERQcVRzcU1FSy9oaDYzeFBOWlFQVU1uemxDd281QnFRQWVFSVBo?=
 =?utf-8?B?MVVFMDRFMVh0UHVENmhQcDJweDZDL3oxVmpjenUxTHQwRUNCb3FKL2lYdFZX?=
 =?utf-8?B?ajM1Z3Z1N2UxMW1sOW9seVVqNDAyMFQ3MEtKbFRCa3FQSURFOXNvYmVaQkdh?=
 =?utf-8?B?SnNuNXpTQ1hycE1VMUJvWjllbDdVdXVNd1ZVdm5PekZacTFuNTNQYU53QVc5?=
 =?utf-8?B?a2NZWWEyOGFEQXo1aXpoUkFkd0UzZkY1QUhUdThUWXNPMGVLMlFRazcrMFFN?=
 =?utf-8?B?SFBJcFRCbGRaUkFKZG9sU3ExQXJ4WEtuQTdHTE9IS2RUS0V5bnFDVTBkcEtV?=
 =?utf-8?B?aVZSTlFQeU53Q2FpUmdRUUJWaERnREhoSDc1aExFcVJmdDJaWWRQUVNIdHRC?=
 =?utf-8?B?UVFmOWVyOWFvbFkreW5RNWR1bkdQYkxZZEFIRkI5N0svZmZicmM5SURPYUh3?=
 =?utf-8?B?NDE2Vk5lT1dXS2paM2NMVnlOdkpSeFZJdUloZW9ZQUVSdmNVWGZHTXZKeXlQ?=
 =?utf-8?B?eGZDbTBqQm9LWWhqSlcvTkJOekl1TGFoaERvOHFsYlVrdUpDSVUxQVZ3WEZj?=
 =?utf-8?B?OUpqc2NXTWxLNEFwa1M3SW1obUxGYlU0VUhQNllOS1lpVDc4RkNaY3RjZC9l?=
 =?utf-8?B?djgzcXB1b3JPZjFNaUtjZkdubU41eTZwRjJ2ekQ0RGR3N1N2UXlBcDFHMDdu?=
 =?utf-8?B?NW1nUUw1cWF4M2dleUNpOEdRdkxJcjFlRW9IK3ZwVEFVQmt3UjZhSHFhRENS?=
 =?utf-8?B?RW4xMEMrNndPRVJLRmxrdXFwZ3pMTmFIZ0lEMmpJNUNYak53RTYwMkJ5WmR1?=
 =?utf-8?B?WU9XQksyZTdVK243djUybzVaOWhxRVpIaUxvSlRnVjI3RVlNUFQ5MklVREVs?=
 =?utf-8?B?UDgrVlpRS3MzK28yWlptMkhvdkd2T1J3ZzNVS2JqZUh6SnpVTkRMdVVzZStN?=
 =?utf-8?B?OWdHZkRRb1FERHZ4c3NYeDRLUUN4d2ZkRVIwVmgrRFJiM1N5Zm5XTTRxT2po?=
 =?utf-8?B?enBjQXF4cUk0Ky9GNm44SGd3NU5NSVVCMmZoSkZIb0l5ZU9OKzc1WmVIV0Nu?=
 =?utf-8?B?S1J4MVNPUlpTRnozNVRhMGhoWE56eTNkRlhSYmJlSDI1KzV1SFY4Uy9jQllH?=
 =?utf-8?B?MHh1OERTQWhWYVVjUzdmbUUwVFRMaElYRU5WZzV5N0lKd1VYcHl5dmllNU1H?=
 =?utf-8?B?N3I0VUFWRjNyL3lmdmduaThYMk9XMDVTejZDSUNJYWh4aHAvSjl2M21hZE00?=
 =?utf-8?B?ay90OUZIV2hQRHZocFpRRTcyc2JTME81VC9sb2J1Wm1reEU0QitKaCsrZ20w?=
 =?utf-8?B?QklrVGw1cjFXSy9xcmMyangwbE5XeTNuSE8xS0hUdHJmcHlleFllMnBmTDBN?=
 =?utf-8?B?Y3JUN1I2U1k0ZGNSREZqR01PUUZETzFtVEpvaUFEWmdiZ0c2dFZqejRrZVhw?=
 =?utf-8?B?dkNRU2wrWHM2ZWEvejBndz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR04MB9417.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(52116005)(7416005)(376005)(1800799015)(366007)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzZjT1IxZGRmWTlYRkRMWS9JNDBpRERhZGQ5TkhUUkQ0NnlCTWo1VXBsVnNh?=
 =?utf-8?B?QUlPakNPMDJtSm9BL01EOUk2V1ZCTFdKOFlTT0Zud00zdWpySzlaZTZ5WXhF?=
 =?utf-8?B?TFJUa2tueWU2VkFQMHd0dk14Q2hjZzhzcVRIQ0dYVkgwc2xMNFdIVitaM2pr?=
 =?utf-8?B?Yjdvb2N1UDBpMGtZK3F1VTZiekFXNUlWYjAvSzdDVThwZmhZZFV3ZFdPT0Vp?=
 =?utf-8?B?ajFmR2lvRWo2YXdxYjBFZmVYL1RlUDJmNHV5Slp3RkwxRlNIelkwVXRGOFJo?=
 =?utf-8?B?WTg2ZkRLTE1aN1M2YnN1TENQb3lsRUtuMDc1YTJFTWZyUXN2QnNDMHJJZm1I?=
 =?utf-8?B?NWMxZXExTHNTSzFGMG9rR2V4NG5tWDQzcWl3eUsyTWN4VjBESnF6b1NaNzlR?=
 =?utf-8?B?SGRGWVlSRlRoU2g2dkFZQ1hjbE9BTHJ1MDhYRmZXRVJ0bERrWFF1c082QTBP?=
 =?utf-8?B?eUQ1UDJVLzRQOXZWVk1TOSt5eFdlbUpJeEVwMGhxcUZRcFRXdFJObWdYZ1hJ?=
 =?utf-8?B?Z3EvdkJFYnB6ZjFWakRJOWVxdi9hTi9YQUc4eXVPT2hKWkJ6cFlLaHBPd1Zp?=
 =?utf-8?B?czVudmdaQzM0VXJ3TFVNMTMyR0wvL0ZVUlNERkU0VVk2QmQzMTZOY3pRb2Fq?=
 =?utf-8?B?eG1xZGFFYm1qN3FxQlU2b2xObStYRWJ6TktRb1Y4RXJzZzVqSWVGNHVYQlJW?=
 =?utf-8?B?elhZUUpGd0hJUUlYYTVuYVpBd2pBVWZPalpKM0F3bGJ0QVJEWFJCcVdwYUF2?=
 =?utf-8?B?L0xCR21ORkdPZWFiaXppUVF0YzJZVjl2R2QrRFZIVnlFSE1WK21hZGVSOHRp?=
 =?utf-8?B?WHpWMlN0VXp3UFVzVjFrVXE4TUdtbjUyUHR5YUltdEZCSmNXOTNlV2VqZE9a?=
 =?utf-8?B?R2tVcHFhVzJqa3ZLd1FmT2lBZFhrR2hDWTl3S2JocDFuMkF3bEdBUkZpN2Vu?=
 =?utf-8?B?SUJsUFV0N1F3SDNEVzNFUjZPbkE5L0ZHVTBqOVZvVjZ6djBHUUE1eDU1ZGpp?=
 =?utf-8?B?SHRhMGRqUlBOQkJhN0RBM1p6MXdmT21ZTEhyVExlL0Q1UnRuL1ZGbWVRZTNN?=
 =?utf-8?B?QStBN09jNDN6SCt0SjF2WUhISmV4aXNCYVltZitWbEVXNkEyQUNDc2NJRVRs?=
 =?utf-8?B?UVNBNmxraGF6RCtsYXZsdHE2REFrSldpUHFUNmlQQzB2eXV2V2pnVkllMDBZ?=
 =?utf-8?B?Qmo1VzhXb0pJcVlFeTVEZi82NGk4SFR5T2RUVm1HMDM0VjFGRW82WXpnVjc1?=
 =?utf-8?B?R2JUd1BWRldwOXlpT2hibDdvelllRUoyNmFoVnE0bExqQksxQnY2cGF3Y29V?=
 =?utf-8?B?K0lwRVZtYWFXeXNjYjhPS0pKcUxmeTBPSlA0NWVmMnhjWkdDeDNEZVFnSWhK?=
 =?utf-8?B?Y1laa0duc1crMXI0NHl2NTFEaXNiVU1FbFNGZXpJaDNTNGFoWFZEUmVkZHA1?=
 =?utf-8?B?WGpKbXhNRHZyYmZ5dEZVdHRsUWd3c3BRalNaVmh2NjFVMW5JMEd4QTVhVXZh?=
 =?utf-8?B?QkF3eEVhYVVuK3JSbmhmTnhCUlNNVS9aTE1yRnhYYS94ekFmbzhhZVVqTjY0?=
 =?utf-8?B?S2JCekNDWlRGRjVuY1BVTTJ3dTNIRTNCU2E5eVpZR3c2VHVMQ25iQWVuU1Vy?=
 =?utf-8?B?UWtPUFg1YUV0RnZmWjRmV3J1U2lCVGRPamk1U2k2eGR5VFMwT0F1dHBOM09B?=
 =?utf-8?B?WHM5K0hyUkplaXc1MkJiMzZDSGk4UTJlRm1kQUYvOHdJR2NGUXEwbXJBdHU4?=
 =?utf-8?B?dHFmWm1EcFdBelBZa3VveHRYd01qd1lzY2tiVmt1YlhibExFci9nQWtrd3E0?=
 =?utf-8?B?VEhDclR0a3RKTG9rVFd4S2ZCRzYrdStGb1dSRDhQNVNCWk5XY3ZTaU92b0tK?=
 =?utf-8?B?b3VNWGFIVnBIT2VGR2NLTFcvKzhqbThON0Zkd2pLZWRzV0VQTHJUSy8rV3By?=
 =?utf-8?B?ZExhNDJQVmNhVzJvUitmeVcrSmtZbnIwVkZGcmpaeXpuRllqYk1wcWF4aVM0?=
 =?utf-8?B?TXpzWEtBN0JnbW9MNXZtNFhaWkJuWDY4ZTBEd0RDYlFCYkZraExhU1k1c3dO?=
 =?utf-8?B?S0JleFExR2NORk5RcUI4MUFuZ0hoenQ2Qmt2a1h4VGt2RUErakwvRkJCeXBT?=
 =?utf-8?Q?dr0YO6Zl9Z+lJa766eYq/7Cgv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db9388f-6ac2-4d97-4849-08dc6c3c2db3
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2024 13:14:50.1228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k1FOWtQcbK2S5D56WJHSNhwKVTAFFg62e5/lh421anpq5APRIQxJEDcrzvxs6j37GpD2sPQQcQ4kMMkZMFL5wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8633
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
 linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-rockchip@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 09/20] pinctrl: rockchip: Use scope based
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
 drivers/pinctrl/pinctrl-rockchip.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 3bedf36a0019..68391d6497c9 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3057,7 +3057,6 @@ static int rockchip_pinctrl_parse_functions(struct device_node *np,
 						u32 index)
 {
 	struct device *dev = info->dev;
-	struct device_node *child;
 	struct rockchip_pmx_func *func;
 	struct rockchip_pin_group *grp;
 	int ret;
@@ -3078,14 +3077,12 @@ static int rockchip_pinctrl_parse_functions(struct device_node *np,
 	if (!func->groups)
 		return -ENOMEM;
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		func->groups[i] = child->name;
 		grp = &info->groups[grp_index++];
 		ret = rockchip_pinctrl_parse_groups(child, grp, info, i++);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 	}
 
 	return 0;
@@ -3096,7 +3093,6 @@ static int rockchip_pinctrl_parse_dt(struct platform_device *pdev,
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *child;
 	int ret;
 	int i;
 
@@ -3115,14 +3111,13 @@ static int rockchip_pinctrl_parse_dt(struct platform_device *pdev,
 
 	i = 0;
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		if (of_match_node(rockchip_bank_match, child))
 			continue;
 
 		ret = rockchip_pinctrl_parse_functions(child, info, i++);
 		if (ret) {
 			dev_err(dev, "failed to parse function\n");
-			of_node_put(child);
 			return ret;
 		}
 	}

-- 
2.37.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
