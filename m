Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 174BD90CA64
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2024 13:52:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE581C78001;
	Tue, 18 Jun 2024 11:52:36 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31542C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2024 11:52:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvwV+VOGGV5RKnUN5mL3ik6RWJOHV0NzdbVLN0P6D6ErZkiNnR506+2MIfTjJGtucYuBBBbuZgCiHW3aNT0Z15lMbi5HSebBAvrdYtoKOKvW//vSiMv/1R7whNiIw1F9ucDkyCXHw2Vdf0K8KJujr0vTh9FZb6m3YueAzgF+rOOtwikDm36bolfC28KTmIXluyQguQi6NyT001O9u2cz0JIhdMBftOAGBeyOwTQlfaYOsXffOOr2xqo3KoBOnrE5o/4cYam8js3rLQgu397BL+n5l9mm8+8eHEqQahRrVPZB9Pnpus4dc78+cQSJlxeX3EfAoVDaXwXoC2VK7F1GxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ob8M1bPNzqLDN3k9UxJQTeihDCtpO6gbZ63AwWYXKSE=;
 b=nVg0BMaM5RQCg6iffvgLxoJt3aDzHfu7PmSh31i56NF8vTMvAUGYJqn9NOr0XNtOBy3t5dyYMphYyBrjaqb2ooLtIR3OtoWQ7O1ZjtgqzxtP1/WD1CqG4M6JTDiA0YOPFoHyN47W0b6ovzzg0thclhuAegrdAl8BSQdw2xgKdeV/ZjBye7tKLnRTy5Jmu0sK0Mb3En7LvjdsRnMeCwQsIj3QMLn5LcIYRIYwVeBmqBUcY+YyMYDPRKi3g6N7UOnoAw3n/JHPfr2fXRaKLkOFRYjVndhvcetfDJLYwo5v2XHu35aXfOAT5n/SyonbFUt3UI+gnA5TYp9d/1yRYK57zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ob8M1bPNzqLDN3k9UxJQTeihDCtpO6gbZ63AwWYXKSE=;
 b=Olab9tLokXMkmdZf0aQEV89Z3YGpoYteKk8mkcdM4cbKYW5mU4JoVH4O5hsn41YYM1unXrmgpz92j6L1tweOPyxQIyiQMkxFS2yatl20KLChrYzel2h/Mc8FQOZ2yxsj4A8fypo6RZwTipo4sYUvO4cSA7KHiH17vc3yRFoHyE8=
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by PR3PR04MB7323.eurprd04.prod.outlook.com (2603:10a6:102:88::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 11:52:27 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%5]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 11:52:27 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>,
 Wells Lu <wellslutw@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Emil Renner Berthing
 <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, Hal Feng
 <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Viresh
 Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 "soc@kernel.org" <soc@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner
 <heiko@sntech.de>, Damien Le Moal <dlemoal@kernel.org>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Aisheng Dong <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, "Ghennadi Procopciuc (OSS)"
 <ghennadi.procopciuc@oss.nxp.com>, Sean Wang <sean.wang@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, Joel
 Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>, Tony
 Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>
Thread-Topic: [PATCH v2 00/20] pinctrl: Use scope based of_node_put() cleanups
Thread-Index: AQHaniSxdGSRMxSwNUygtutwA8lIt7HNryvQ
Date: Tue, 18 Jun 2024 11:52:27 +0000
Message-ID: <AM6PR04MB594163BAB898D8689A94056F88CE2@AM6PR04MB5941.eurprd04.prod.outlook.com>
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB5941:EE_|PR3PR04MB7323:EE_
x-ms-office365-filtering-correlation-id: 8c85b28a-9d67-45fe-bd67-08dc8f8d2053
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|366013|1800799021|376011|7416011|921017|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?aWRpL3NsR2IzSEZ4dmYzcGVsQUNUMnA5bzFtZEdKU1Nhb3gvOUlIVzFDMjEx?=
 =?utf-8?B?L0c2T1dFcWkzRURxSzhSVU8weDAvMExETytzYTJjazhBcWp0SG40VDR1ZHlR?=
 =?utf-8?B?cFdhR2x3RHZzYytIWVZybWNtQ0ZsOTlJL1BTS3NuNEE0STltdEdwcjJxdURH?=
 =?utf-8?B?Q01JWFU0akVWd3FlWVZFTXY2R1V1US9uQlo4cVRTVXQ1ZCtLb0x0NC92akV4?=
 =?utf-8?B?Y3ExVEhqRTQxOGxqMmIvckVKOHlMRVFXMzZsQ294cG1BVjhHSytpSTJjSHN5?=
 =?utf-8?B?bVBEblg1c2ovM3QyeDBWcDRsdFBZZk43NDNOWGlFbGQ4NkNHemp1WDhySGho?=
 =?utf-8?B?dXlrelpJWENoWUx6RGFpSVd3MmhiYjJjaHUzVmtVSXpPTGRqcE1oZlBMZ2xv?=
 =?utf-8?B?cVNQR0J5MHFLR0dXVE9PTTZlRHZLNklxaDhPdGRKMVdLR0VTSE5rYU1EWjR3?=
 =?utf-8?B?eXVZd1EyV0FucExjZ3lJTitnQkdiVWJoNVlPdWNtTWhrRjB1SEhmcndaQ21m?=
 =?utf-8?B?d2R2V1pCZUVFLzNlVWpOaDZtcEhvNERHWDFFSXg4RlRkYnNvb1FWZjg5cHA0?=
 =?utf-8?B?dzd2M2F6dVdMUGpYRk5zUFcrdTc4L1VhKy9UMFJuaSs3ekgzOFhMdEs5bWx6?=
 =?utf-8?B?MHIxaURtNE5YSG5DejZPWWl0Q3VvdFVIdmx2cE1RRTRKUlNMOGsxWWdJV2t1?=
 =?utf-8?B?VWdEMjBHMGV5eXkyckRaWEcwTmd1b0Z3RXVjcXgyQ0ZKN1BLY3U4c2VmVlJj?=
 =?utf-8?B?L08yNGNZdGlxVlBNWWZnVE5EOUhGbjA3bzdRNmN4NDM1YW5WZjVsMzVyQW5Q?=
 =?utf-8?B?KzlHZFZwOWF3eHo4K1NmWUN0N0lMQTFGaHJDQVZ3Nk9RTys1UjV0ODk5VG13?=
 =?utf-8?B?bGpoVXBKNG9pT0pxTUNvRzZGd0Qzc1JYSGZKQ3JweVZrN2xIbGUwZGtEQjYr?=
 =?utf-8?B?TVRmb05GWmFKMU01TVhmWFBJcEpOeGFBRk05aHNhVXRPNENIbUpLKzNoSlVS?=
 =?utf-8?B?RjVieE0wTVg0MmlEbEQxVzNZSnQ5V2RQM1VDTXlhQUV4bEpaamhZclRlOHhy?=
 =?utf-8?B?QmpJMzh5U2VqYjJER2ZMUGc3ZkZUYjM2Y0gxOFIxcFcxUkRmWjFqaVVCVXFk?=
 =?utf-8?B?bWFKWllLVVFCVFc3a3dwUDdDZlNXN3pnOVBPdGFYMStBT2Q5aU9vY3p3U0Rq?=
 =?utf-8?B?NkMxb1UyaXIrcHVWY2lCNmVmUXpmRVc2QWhTYkVBYjhiWmJGOVhvMTNLbi9R?=
 =?utf-8?B?VkYzYjRkZU81TnlZYjFRT29DQ0s5Q3h5NytSNC8rMDNEbys2amx0LzFvcG5t?=
 =?utf-8?B?YzAyZGlrVld3N2tZNFRPNUNxdkdIaEt4QmgxVXVidmltWC8zeTVBVkkyaEdy?=
 =?utf-8?B?VWY1SWhCOU9rTVN2TFA1aEdqOFBTRU1OOXhVZFFycjhldkdwY3E1bVY0NDU3?=
 =?utf-8?B?Z2tnZ0dtNVJKd0NJa0JnbERuWEY0dWlmczZ5bWVEVWljNXFiWmdvUTVJUUxj?=
 =?utf-8?B?YmtXQzlnMkgzUjExZ0x2aisycFhid3Urd09GTVR1UlJRVWg5N1NjM0RaN2tt?=
 =?utf-8?B?bjZ1NEJpcEdRVWJndTRZWkpqZDJzMW5QRmRDTWgvY3E4L0JGQ3NNVTFJMFIw?=
 =?utf-8?B?NElzRnl1aFJPdGdObkIyR0E5dGFJYkZzeW9WVGVJSW1PbGw5Mit1VXR3MWpX?=
 =?utf-8?B?eXY5UEJCZWtoSkdVTUFOTFA2akxFMzI0MzNia052dFNpNXp4T1REMmQ2Q2pi?=
 =?utf-8?B?VDIyaHpJRkZ1SUduUXVYQTlQMGo3aVB4Vm83cXAwYnRVU2Q5Sk14OVlCdk9s?=
 =?utf-8?B?RE1KU3hvTkhiUkp0bXRiZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5941.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(376011)(7416011)(921017)(38070700015);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnVCTzRMVVRPbHBOTTJ3UmRpb1VMWlB1VVpTakxWdHMrSG5nbzNXeGwzWEYx?=
 =?utf-8?B?SzhVUnJpOG1VS29rbFluVWxyR2EyY2FMNHN0SjJzWHhMR3FVaFQ3cld6aGNv?=
 =?utf-8?B?Ny9DdUZWMFN0LzZKQ3NSazJuV3ljOVlZNmp5N20rQTUzR3hnZ3MvSHh4MTVE?=
 =?utf-8?B?cWRRdCtkY0JmS2VOUW5NZ2Y0WGlDR0xRMm1mNE50Qzc3ZldXdkpmd1VDZHVH?=
 =?utf-8?B?WmRtdHZ3ZG9XMDFxWlJLdFgrNkxhNFFNcmR2RWk3QWQvaTV5OXV6NEdmRE5x?=
 =?utf-8?B?enZEL1lPa0ZOWnMrMkM1K29PQWtkbkNWVSsyU1hVN1FSenB3ZEczaFRid3Z5?=
 =?utf-8?B?TTQxNmFlMXR0OTZkVzhDckRRdXA2b1MzWlFkUE5yQXlZdnVPbENZYk5EQmFG?=
 =?utf-8?B?V1VWRXJsSHJtQ0N1MmI4eXU3U2w4T0ZpWXRlODVacVFmek5PckRLaDBpYko0?=
 =?utf-8?B?UTBXNTNiRlpwU1ZSS3oxWE9KS2NNekwrNm13Q3BobVBuWTFZYy9nbTRDTG5p?=
 =?utf-8?B?Q0FBZkRSN0xoK1NjanRZZENLRjJFYk9QcHNMOENaWkcyOWgwNEdLZHoxTGZN?=
 =?utf-8?B?cTdMdDhMcWh1QkpDRXhLMS9xSy8wWUw0elpaajNOWFJIOUdLMFZ4MUJQZCtx?=
 =?utf-8?B?dXhPUGUvS2prODNVcjYxTVdtS3FOWElSaFVqOVNYT1BtMk1EU0g0ZHJ0VWk5?=
 =?utf-8?B?cjFldWUzRGJybEVxRUYxeDhMNVlpakF2eWNvREpsNklnc1lNa2paenlRbkFU?=
 =?utf-8?B?K0kxN1J2b0J5bkxvZHdJaVp2c3ErNFNiUDhvTk1RRmozSWU5WEErU3FwUCtN?=
 =?utf-8?B?UUo5U3d6Nm5ScmdiNEdhRE0xVGJQNWpmZW10RnlqRGdobFFNTUlwMFMrdEZX?=
 =?utf-8?B?MUViOGIwUkU3VXZaZkpJRDMxYXdrYmNBVXdxaUJEMDV3aS9lZldvdXhibFo5?=
 =?utf-8?B?OHQzWWlvd1U1NEtkTktibXRacG5jQk5laVE3ZFVITWdyVFBCSlNSejFNM0Z3?=
 =?utf-8?B?WXRkc3I4VlYyTThhek5QZE1kQm1udUNIMUVDeFY3Mk9SaTFtRnZsdnNvMkhB?=
 =?utf-8?B?RWxPV29FYkNoUEw0U1RYeFFqQkxKbnkyL3NPL281eCs5RXIvcG5CNFBVZWNm?=
 =?utf-8?B?NVNFSTJlV013RENjSzNscEpiZStGNXUyekxPOWRPRWovakdBY1hYb28vNExJ?=
 =?utf-8?B?NktDME14UFJVMTNBWFc2OHFjNWE3L0VrVEJ1UFVrNEFGRWhIY3I3emEvdHZO?=
 =?utf-8?B?b1ZuR3JaNG5LelJKTy9hWEVKUHd2dWV1QXUxN2RRbFFzaVdKNXJ5K3ZEOTRh?=
 =?utf-8?B?Y1Nlbi9DQm0vdG00ZjcwY20zdkRnck1nODdoQ1E1NFpHNzFsU3dMNGkwMHF5?=
 =?utf-8?B?Q3ZuV2x4WEtkWFhiamsycHpZMGZPOGlBY012YWdxTVNDUW9iajlnZ1ZSbG1w?=
 =?utf-8?B?MnhldksxL0lvQkx1aGhzdUorLzNFSkxtcUtrdE9vN3YxbG55bERsNXc0K0ZO?=
 =?utf-8?B?ZUU1TmxkRzFNWkdEYmUrVWRaMlpBZUVSbEduc21qUk1VM0llNnZ0Uzg1TEhT?=
 =?utf-8?B?YWNCdVNBVEd5V05lUzJhZEx5V0NZblRUTjZFN1dubVlRcEtCZ3FiNGZJZnc1?=
 =?utf-8?B?VGgrQ2RFV1o0Vko5cXA4REUvRTFTN3paS3hWZ2VnV0F2ckFnaVQrM1hwVWov?=
 =?utf-8?B?OHpxNE1GZUpNMCtjZWE0UXpRbXBmalpza0paM2xUQm5qaFVFRGY2SzZJL1F4?=
 =?utf-8?B?czVqWUwyWnBkZTVWRG1MaWJqcG9SSFMybmp1VllPQ2RUS29INkQwUHlxSG5O?=
 =?utf-8?B?M2hvYk1GNFFBa2s4c0RBNEhtQjJ3Y1ZqbGxNNytkMFpJWVkrTjhXaUN1UnFp?=
 =?utf-8?B?N2Y4dmVuZ29YTnJnV2Y3cnVRODA0dzhlaXRLYlJTYXVpUnJtejJBYWpiZkRz?=
 =?utf-8?B?cjNEcjd4N092WTBWR2dLWE1zZ1hMdUpQcTk5cm84YlplcFJtZGR0bGdvMVFv?=
 =?utf-8?B?VWh0UEYzZk91TExTTjBzV2UvS1hPU2FWdkxjaGpnTnNxK0ZqV3B0dUhZaVQx?=
 =?utf-8?B?OHhXY3kva0FmU2l1M213VHRiR1RmSUx2YXh2b0d1L1lkMFcwQlIySXlRMDdM?=
 =?utf-8?Q?g2FE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c85b28a-9d67-45fe-bd67-08dc8f8d2053
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 11:52:27.4786 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FhHfvr7PNMfBbKPFZDejAS8RHoY9ikJ+MPeT/Yr0kyIlzeFbGybLNj73Xnfbk4CS0Jvwt1OkDQrBlig5aE49DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7323
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 00/20] pinctrl: Use scope based
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

Hi Linus,

> Subject: [PATCH v2 00/20] pinctrl: Use scope based of_node_put()
> cleanups

st/stm32/renesas patches are picked. Would you handle the remaining
ones?

Thanks,
Peng.

> 
> Use scope based of_node_put() to simplify code. It reduces the chance
> of forgetting of_node_put(), and also simplifies error handling path.
> I not able to test the changes on all the hardwares, so driver owners,
> please help review when you have time.
> 
> This patchset was inspired from Dan's comments on pinctrl-scmi-imx.c,
> thanks.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v2:
> - Drop aspeed changes per Andrew Jeffery
> - Drop changes to code pattern that of_node_get(or other refcount
> increasing) followed by of_node_put. That said, but I still have a change
> for samsung pinctrl that drops several of_node_put places. If this is not
> welcomed, patch 20/20 could be dropped.
> - Add Fix tag for patch 1
> - Add A-b for patch 4
> - Drop unneeded {} in patch 8 Per Dan Carpenter
> - Add a new patch 18.
> - Moved patch [19,20]/20, in case people are not happy with the
> changes, the two patch could be dropped when apply if no v3 patchset.
> - Link to v1: https://lore.kernel.org/r/20240501-pinctrl-cleanup-v1-0-
> 797ceca46e5c@nxp.com
> 
> ---
> Peng Fan (20):
>       pinctrl: ti: iodelay: Use scope based of_node_put() cleanups
>       pinctrl: tegra: Use scope based of_node_put() cleanups
>       pinctrl: stm32: Use scope based of_node_put() cleanups
>       pinctrl: starfive: Use scope based of_node_put() cleanups
>       pinctrl: sprd: Use scope based of_node_put() cleanups
>       pinctrl: spear: Use scope based of_node_put() cleanups
>       pinctrl: renesas: Use scope based of_node_put() cleanups
>       pinctrl: st: Use scope based of_node_put() cleanups
>       pinctrl: rockchip: Use scope based of_node_put() cleanups
>       pinctrl: equilibrium: Use scope based of_node_put() cleanups
>       pinctrl: at91: Use scope based of_node_put() cleanups
>       pinctrl: s32cc: Use scope based of_node_put() cleanups
>       pinctrl: nomadik: Use scope based of_node_put() cleanups
>       pinctrl: mediatek: Use scope based of_node_put() cleanups
>       pinctrl: freescale: Use scope based of_node_put() cleanups
>       pinctrl: bcm: bcm63xx: Use scope based of_node_put() cleanups
>       pinctrl: pinconf-generic: Use scope based of_node_put() cleanups
>       pinctrl: freescale: mxs: Fix refcount of child
>       pinctrl: k210: Use scope based of_node_put() cleanups
>       pinctrl: samsung: Use scope based of_node_put() cleanups
> 
>  drivers/pinctrl/bcm/pinctrl-bcm63xx.c              |  4 +--
>  drivers/pinctrl/freescale/pinctrl-imx.c            | 25 ++++-----------
>  drivers/pinctrl/freescale/pinctrl-imx1-core.c      | 16 +++-------
>  drivers/pinctrl/freescale/pinctrl-mxs.c            | 18 ++++-------
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |  4 +--
>  drivers/pinctrl/mediatek/pinctrl-paris.c           |  4 +--
>  drivers/pinctrl/nomadik/pinctrl-abx500.c           |  4 +--
>  drivers/pinctrl/nomadik/pinctrl-nomadik.c          |  4 +--
>  drivers/pinctrl/nxp/pinctrl-s32cc.c                | 31 ++++++------------
>  drivers/pinctrl/pinconf-generic.c                  |  7 ++--
>  drivers/pinctrl/pinctrl-at91-pio4.c                |  7 ++--
>  drivers/pinctrl/pinctrl-at91.c                     | 14 +++-----
>  drivers/pinctrl/pinctrl-equilibrium.c              | 21 +++---------
>  drivers/pinctrl/pinctrl-k210.c                     |  7 ++--
>  drivers/pinctrl/pinctrl-rockchip.c                 | 11 ++-----
>  drivers/pinctrl/pinctrl-st.c                       | 37 +++++++---------------
>  drivers/pinctrl/renesas/pinctrl-rza1.c             | 14 +++-----
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c            |  7 ++--
>  drivers/pinctrl/renesas/pinctrl-rzn1.c             | 23 ++++----------
>  drivers/pinctrl/renesas/pinctrl-rzv2m.c            |  7 ++--
>  drivers/pinctrl/renesas/pinctrl.c                  |  7 ++--
>  drivers/pinctrl/samsung/pinctrl-exynos.c           | 16 +++-------
>  drivers/pinctrl/samsung/pinctrl-samsung.c          | 19 +++--------
>  drivers/pinctrl/spear/pinctrl-spear.c              | 13 +++-----
>  drivers/pinctrl/sprd/pinctrl-sprd.c                | 14 +++-----
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 27 +++++++---------
> drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 18 +++++------
>  drivers/pinctrl/stm32/pinctrl-stm32.c              |  4 +--
>  drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         |  7 ++--
>  drivers/pinctrl/tegra/pinctrl-tegra.c              |  4 +--
>  drivers/pinctrl/ti/pinctrl-ti-iodelay.c            | 37 ++++++++--------------
>  31 files changed, 133 insertions(+), 298 deletions(-)
> ---
> base-commit: bb7a2467e6beef44a80a17d45ebf2931e7631083
> change-id: 20240429-pinctrl-cleanup-e4d461c32648
> 
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
