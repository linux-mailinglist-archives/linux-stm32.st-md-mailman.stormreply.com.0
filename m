Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5493CB1665F
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jul 2025 20:38:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A32A7C30883;
	Wed, 30 Jul 2025 18:38:19 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012050.outbound.protection.outlook.com [52.101.66.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6BBCC3087B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jul 2025 18:38:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIQuzhm4gNCNIFEmXfcqA8lXO8qbXD/V7mknBKWsYV7ENWfwTKmQHnPEWhC/j/YPumDJtgGbywAoBVYs+TrjUnwMw9kuOzwYos1iJtWZY/chp9vtp4XMdx8EENCrKnJLBglpSs4tmHmhuVD+g0nwDQbgsKdZj0yhmNUC0YLzhog/PhW7gvx3RrCwtidwtbv/Ay7EXbas/qAcplY25GedGVdt0jMXS/aav6QAgPeewi6NbNdjGnyzIS4egOHpmYqWpggdB1I7zR9yKgUPutBfC3kWUgOA0uLrmCdceyEe5/OCQIKJkc4BVirpjf1fUjEo/ZNlzu/4q23tM+4MBUpygA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ow4E2QxbxTPTx/+loy6vtXsS4kRIFkT5NJfeMcr6Ns4=;
 b=ff5aojeERQ4k/6/qdpHyocjf/XS1/wi09tjbOEhQcQWCi0BX/TiAu/73ZMpD2M16/Dj2ozY99r8zzikWfekqaSggeHqM7r7agZ0Me+oNh22rk6eplVdiEv/6cMcsYCnu9JLGyXSaCK+g45iqkY2zzDKLqZNAcca6rZqI4A2s4MltGmmZMGL5M1OFchs6wUZCzc7OEJMkKqX13ATu8BXNvym+QThAWIvdSevGUZm2jSOcNxNEopQHGbNVn6Di5g8p2tO0KAYSnGq8xx/fsPmZGW96Qt9YiLI+ZdupgJnhHDONtHka59nLNU5pOIW2e3N9kCglPZqWA3m9wYqL9Jb8vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ow4E2QxbxTPTx/+loy6vtXsS4kRIFkT5NJfeMcr6Ns4=;
 b=OCQKvrzW5tTEZPiL4jhOgl/zxHUoqfqDUvKjCiosKqQi6SyWOejn72EnEhDWjPfb5BIKsLusPB5IBbmxyJ6gdJxWFUtxflI8l/qfX+Dxt/h88XRGjmBhbEVnTf3thviBEoBWtPbtXj23E4Y+bwbldalzXiD9bfFh3JnvfODl+dsa/W4iiXEUGXBIYNmqph1iHe0Lqu8T4HHqiQOAQMf+qIjdkqRG5SW7DagvtH06qwhKjlHMLhSrDdBkgCmPU65lrGcpc36NE2WHi/ZvbYC1FKRTwg86S0oSefNTJDY1HL0vnk5xI+7NfO1ZC9fMcoe5Xnjt7TM6wrBcZfdnfUYr+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10723.eurprd04.prod.outlook.com (2603:10a6:102:491::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Wed, 30 Jul
 2025 18:38:16 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8989.011; Wed, 30 Jul 2025
 18:38:16 +0000
Date: Wed, 30 Jul 2025 14:37:54 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <aIpmgpXME1BmThxU@lizhi-Precision-Tower-5810>
References: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
 <20250730-topic-dma_genise_cookie-v1-2-b505c1238f9f@oss.qualcomm.com>
 <aIpKz495WI1SJTeB@lizhi-Precision-Tower-5810>
 <20250730180417.GC21430@pendragon.ideasonboard.com>
Content-Disposition: inline
In-Reply-To: <20250730180417.GC21430@pendragon.ideasonboard.com>
X-ClientProxiedBy: SJ2PR07CA0009.namprd07.prod.outlook.com
 (2603:10b6:a03:505::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10723:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e69cf81-b665-4cda-18ff-08ddcf983f4b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|366016|19092799006|1800799024|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xXuoMVdSP8ixNHwu/35qkXvlmxORnoCgPeNhosTIV8U7OtTvilbrSxTWAZGf?=
 =?us-ascii?Q?BgIJV/gj4VubQsvpFYP+lpOnvTqO5a8dTVwzvqlAydAZf2zrlwsYjUmgrimK?=
 =?us-ascii?Q?skP3g3+7mHBcsZ/5FVgsFlVFPKEd8qubheCqyqwEm6kCktR2DpwyU6ms1Trw?=
 =?us-ascii?Q?JdyXaCqUzGLG0kgYWZ5ilfcyU5HL5xaXotRAcPbAoIxCCd/c24rmbeed8bJD?=
 =?us-ascii?Q?uJXKn/CSPcUWRL4AswKtvXNze1C3lkOSFUO79Z6W4U2kyDIAN2YpgCGmdBi2?=
 =?us-ascii?Q?/uk+KTOyFEcon4Oa+tPiSksdTApCl/9SptjwHDFDV94rZnxgu3wQ5lYqOBbK?=
 =?us-ascii?Q?o0hqA4S3ivvTWCnHw41bywIZQX8JWRT5r1zttm6coInVEwtVPEz0TjlDNCJ+?=
 =?us-ascii?Q?RsFF4NTi7cRLvDBRRX1FSWJrbMYcfwvs91BqC0RPz/RKmeGPduVr0CQF6VYz?=
 =?us-ascii?Q?H6YFzXRwJm+sg9lCvVxnwGW9ie6oZJ7/aID2B9RKWFDttubWgCrmC0VSVQpv?=
 =?us-ascii?Q?MsHm9Wd3lPBczvJ8z4vwRhsd3WX+LzlDDNEPHYmiVvkt3fKFzDbcCPU820d/?=
 =?us-ascii?Q?Cm1R6zzixEBNWjoMCoFlKCZ7j38TtjFdr1VuW/ksg+rSflQUgMHzvfTRao81?=
 =?us-ascii?Q?lzbqjt+mu/HNiYlGFUC/reX4QKdIZyOkEUJzFuzDA70NakAUzXibHc3825hp?=
 =?us-ascii?Q?1mOi2cINDSvBlP/3VwUlwyB114NwJLSOGQaiTDNEUK3kFJEP3PADcbAsv8D/?=
 =?us-ascii?Q?MUu/oL8dbPspy6NeKjTGs0LK5FYImo4J80FHEet8bxHZ5yCHFPXWVTVy2JZ/?=
 =?us-ascii?Q?lkcwyp4k1MEuXXAHGmOPHwEp2SaA6GTZY0uGyqRC/JhTc1Evrbmf8F7L5OTb?=
 =?us-ascii?Q?Ke3y2JE71hLfashSpEvWn8vZ12XSDp92VA2o1gC5mdkiYO4jqlr++0CS1dUk?=
 =?us-ascii?Q?YsPvg/wDd5Y/FWyom/8z5OgQdvxI2nTW2ZkQlS2nRc2MnFyaLZQFqNbNhsas?=
 =?us-ascii?Q?FjmSrevcINAJ+fm9qO1Zx0Z1yikOClHvgtECdIz9Kmxjr+tNPp82yPg4u+EN?=
 =?us-ascii?Q?GtrvlKmScEv879GY/PH6Nv4YIXcHNJb4VWKE2prUPhc8Hu+KKSg4Shwr6xSE?=
 =?us-ascii?Q?NfJlHXp/p2vj6+g80jbZgnh5rMg/HX7zVsFst507VEAPaDSwj4/JHh00jwZv?=
 =?us-ascii?Q?V4GyQAYxPMSlDZ5+lohDEN2bQtRjxakxsoHZ8V2Sv9kPieMk8taKi7Th5gln?=
 =?us-ascii?Q?l4Bx85ZwqnyPzxzczbrLh27fp5CwiGK2VYjOdqlEAvRylDXyylxrx/5V8d+0?=
 =?us-ascii?Q?+/S6XXPyxDx+6LWWBilYKSRWun/Cl/S4U9Yg/2MZbJVZtZ8qXapFQS55jlSR?=
 =?us-ascii?Q?dPtGICPw/2IjGGtVRplOQretTtPf2qdUXgwmnTm+tS4+G8scjAtozKXV/jX5?=
 =?us-ascii?Q?6giSn1+BmsICrU5NYMcmLm/1fDMxK06ZrIHlL16R9/ezvhpdcMKBw/2TFUsW?=
 =?us-ascii?Q?9wwtsFW2VJ0tGfbh+gElHb/Bgcx8mR4qYwGo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(366016)(19092799006)(1800799024)(38350700014)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?erfhfvzrvw1TaC9WAxiw09hnkl301cjc/Y4Au/lINap3xVSqVFn+pQMTMyVu?=
 =?us-ascii?Q?3eNDRRnq01hNc9BC/KrEmCGePQFmh7R3vqurottySAhRzLVBVrwZB0WbRxmA?=
 =?us-ascii?Q?6DNYvoN8hoBTbz0D4CwM3lRtpeJ2YEfOJECVzfAQ3pwZlpZHL9lSYx6QVKeR?=
 =?us-ascii?Q?kQbmmuNP5P4IigTLQOHeMXKa7J0m1VEi2kTjHQHqKETwHmNELoT46gC8O5EJ?=
 =?us-ascii?Q?ZolZo8D+cqcpJ83z8jLkofcTdI+N9whnlxoHBK9DCGy42xK1REJlzy04MFTZ?=
 =?us-ascii?Q?basEm4RLMHKMn6XCZFS3ZoIltViGB3/FJ/KI4FWwHuQeVEDjEmDMnVGIt92E?=
 =?us-ascii?Q?DNW0jKtrmsCuF9CQjHGeo2VRSYA/F1Hd75/6XhAmcYVORobBO9rMSioUDmxk?=
 =?us-ascii?Q?gYcDTHwaVCOJz7Zx77rgfTcoHhqti6q32FMcM+yt17K5DuoJTkk7sphoOBg9?=
 =?us-ascii?Q?X+q7KHd/RYwXYdau9ggDomrD55+uddPOj8uHt9cbXNutaP8eZEP7BJ6WZqu2?=
 =?us-ascii?Q?Fj6gXmwSnUly4BhJ8rkuuLVkdIlmliwcVLBVJwApWOMjCyFFI99eeHT7kJc/?=
 =?us-ascii?Q?PQbEbyH3qLVu8ul1xmL56UsGG/UdbTSQK9BQHNyfHpyuw39VFVx53ycUA9D2?=
 =?us-ascii?Q?jj0+Vmb1xQMjBgruT1IQl0sGXRHIxmIlC3GuhDWA6w8XfUsZWb/+dSuCbb29?=
 =?us-ascii?Q?87C3+Z81GdoPXJsu6/cXT7V4lEEQbOFx7dFFyMjGHUh/L9Ej2T+5gUbRIwUC?=
 =?us-ascii?Q?2PN6Cc/lQq3AtsVrPrwll76VSzjxPapreYgQwHx+19PUd32gaaAfLtfO13xW?=
 =?us-ascii?Q?sa1E88DYwKTH1dr39hFf2WRywo1A+JCN5veAczHSsaXkGl6xi+7HYPOlz7xx?=
 =?us-ascii?Q?UhkftVIttekJvJpIhPy35yw8Fi9XrtC3sR92ytrn51fvRz9eQuUKwtveHV8/?=
 =?us-ascii?Q?E3EbwkW4e9qkzlC/5CXF+p/qGV2cFN6IEt+Z27G8fm4AgyDHN7J2hW8nj/pP?=
 =?us-ascii?Q?ze1naBXCDwwdoAcNfY1LuuiYNszsmSklUHvGkAD4kqRuEqQDXSl6fbE6bffx?=
 =?us-ascii?Q?fXgOD6RwwTJnDNvS0IoCL7NWN2sDrs8KXDKpNM8OfFgtLs2MvRgv3YER8ors?=
 =?us-ascii?Q?HJr1Dx8i3X2iJZPFMrWPGFOAZLyxU06pCNxpPqR70gibR3fp9X8cgTeko24O?=
 =?us-ascii?Q?BjRwPQ92LV5ZT/WTU0f+YQOc2eHHv6CtQhJ22AKtPRixqHUb+jK7KkiJ01pw?=
 =?us-ascii?Q?sHv2Pqp8W7Pgy/rT76UZ5Ajq83ZHvEO6isCT0tt0wA8wpBx+ZS7h9mhrbunq?=
 =?us-ascii?Q?KGeXrcpVEcTcx0SDjgOlozXJOXbvIZRmabe1RLfBX3x/YsFnoqRGVR8UvLsG?=
 =?us-ascii?Q?i6a/voQTkxZeVQhghzT//LtQe6TO6TEmEbEAz69+IY8Z84aBZ+16yWxPvVtr?=
 =?us-ascii?Q?PE7gLJG+2cg9FQdLB48Abf4vx7N53+XAV4X8+PouyIgd9TGwHY3+WwDF7mVx?=
 =?us-ascii?Q?a/RS2n5LPO6u13A+g3wf0l+RZPBlwW2vuEkD4YVOGWjnQXyyVtyQKdB004JK?=
 =?us-ascii?Q?XUXGq9M0U1IkggFowxfNB9clRmLVJTRmxggHGBip?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e69cf81-b665-4cda-18ff-08ddcf983f4b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 18:38:16.2735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5jLR84cUhbLtriAiKz1D0Osymb8O4Q5auaBHM35G9jyb4NqQULBWyzJQdvyVXXWYnBqHOtmOGj+z2lxjY250g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10723
Cc: imx@lists.linux.dev, Geert Uytterhoeven <geert+renesas@glider.be>,
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Paul Cercueil <paul@crapouillou.net>,
 Laxman Dewangan <ldewangan@nvidia.com>, linux-i2c@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, linux-spi@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>, Janne Grunau <j@jannau.net>,
 Takashi Iwai <tiwai@suse.com>, Magnus Damm <magnus.damm@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-msm@vger.kernel.org,
 Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
 linux-mips@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
 asahi@lists.linux.dev, Viken Dadhaniya <quic_vdadhani@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Mark Brown <broonie@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 Sven Peter <sven@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Saravana Kannan <saravanak@google.com>, Scott Branden <sbranden@broadcom.com>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, linux-sound@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Takao Orito <orito.takao@socionext.com>, dmaengine@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Neal Gompa <neal@gompa.dev>,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Daniel Mack <daniel@zonque.org>
Subject: Re: [Linux-stm32] [PATCH RFC 2/6] dmaengine: Make
 of_dma_request_slave_channel pass a cookie to of_xlate
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

On Wed, Jul 30, 2025 at 09:04:17PM +0300, Laurent Pinchart wrote:
> On Wed, Jul 30, 2025 at 12:39:43PM -0400, Frank Li wrote:
> > On Wed, Jul 30, 2025 at 11:33:29AM +0200, Konrad Dybcio wrote:
> > > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > >
> > > The DMA subsystem attempts to make it theoretically possible to pair
> > > any DMA block with any user. While that's convenient from a
> > > codebase sanity perspective, some blocks are more intertwined.
> > >
> > > One such case is the Qualcomm GENI, where each wrapper contains a
> > > number of Serial Engine instances, each one of which can be programmed
> > > to support a different protocol (such as I2C, I3C, SPI, UART, etc.).
> > >
> > > The GPI DMA it's designed together with, needs to receive the ID of the
> > > protocol that's in use, to adjust its behavior accordingly. Currently,
> > > that's done through passing that ID through device tree, with each
> > > Serial Engine expressed NUM_PROTOCOL times, resulting in terrible
> > > dt-bindings that are full of useless copypasta.
> > >
> > > In a step to cut down on that, let the DMA user give the engine driver
> > > a hint at request time.
> > >
> > > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > ---
> > >  drivers/dma/amba-pl08x.c                       |  3 ++-
> > >  drivers/dma/apple-admac.c                      |  3 ++-
> > >  drivers/dma/at_hdmac.c                         |  6 ++++--
> > >  drivers/dma/at_xdmac.c                         |  3 ++-
> > >  drivers/dma/bcm2835-dma.c                      |  3 ++-
> > >  drivers/dma/dma-jz4780.c                       |  3 ++-
> > >  drivers/dma/dmaengine.c                        | 20 +++++++++++++++++---
> > >  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c |  3 ++-
> > >  drivers/dma/dw/of.c                            |  3 ++-
> > >  drivers/dma/ep93xx_dma.c                       |  6 ++++--
> > >  drivers/dma/fsl-edma-main.c                    |  6 ++++--
> > >  drivers/dma/img-mdc-dma.c                      |  3 ++-
> > >  drivers/dma/imx-dma.c                          |  3 ++-
> > >  drivers/dma/imx-sdma.c                         |  3 ++-
> > >  drivers/dma/lgm/lgm-dma.c                      |  3 ++-
> > >  drivers/dma/milbeaut-hdmac.c                   |  4 +++-
> > >  drivers/dma/mmp_pdma.c                         |  3 ++-
> > >  drivers/dma/mmp_tdma.c                         |  3 ++-
> > >  drivers/dma/moxart-dma.c                       |  3 ++-
> > >  drivers/dma/mxs-dma.c                          |  3 ++-
> > >  drivers/dma/nbpfaxi.c                          |  3 ++-
> > >  drivers/dma/of-dma.c                           | 18 +++++++++++-------
> > >  drivers/dma/owl-dma.c                          |  3 ++-
> > >  drivers/dma/pl330.c                            |  3 ++-
> > >  drivers/dma/pxa_dma.c                          |  3 ++-
> > >  drivers/dma/qcom/bam_dma.c                     |  3 ++-
> > >  drivers/dma/qcom/gpi.c                         |  3 ++-
> > >  drivers/dma/qcom/qcom_adm.c                    |  3 ++-
> > >  drivers/dma/sh/rcar-dmac.c                     |  3 ++-
> > >  drivers/dma/sh/rz-dmac.c                       |  3 ++-
> > >  drivers/dma/sh/usb-dmac.c                      |  3 ++-
> > >  drivers/dma/st_fdma.c                          |  3 ++-
> > >  drivers/dma/ste_dma40.c                        |  3 ++-
> > >  drivers/dma/stm32/stm32-dma.c                  |  3 ++-
> > >  drivers/dma/stm32/stm32-dma3.c                 |  4 +++-
> > >  drivers/dma/stm32/stm32-mdma.c                 |  3 ++-
> > >  drivers/dma/sun4i-dma.c                        |  3 ++-
> > >  drivers/dma/sun6i-dma.c                        |  3 ++-
> > >  drivers/dma/tegra186-gpc-dma.c                 |  3 ++-
> > >  drivers/dma/tegra20-apb-dma.c                  |  3 ++-
> > >  drivers/dma/tegra210-adma.c                    |  3 ++-
> > >  drivers/dma/ti/cppi41.c                        |  3 ++-
> > >  drivers/dma/ti/edma.c                          |  3 ++-
> > >  drivers/dma/ti/k3-udma.c                       |  3 ++-
> > >  drivers/dma/uniphier-xdmac.c                   |  3 ++-
> > >  drivers/dma/xilinx/xilinx_dma.c                |  3 ++-
> > >  drivers/dma/xilinx/xilinx_dpdma.c              |  3 ++-
> > >  drivers/dma/xilinx/zynqmp_dma.c                |  3 ++-
> > >  include/linux/dmaengine.h                      |  7 +++++++
> > >  include/linux/of_dma.h                         | 16 +++++++++-------
> > >  sound/soc/apple/mca.c                          |  2 +-
> > >  sound/soc/renesas/rcar/dma.c                   |  2 +-
> > >  52 files changed, 146 insertions(+), 68 deletions(-)
> > >
> > > diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
> >
> > ...
> >
> > >  						const char *name)
> > >  {
> > > diff --git a/include/linux/of_dma.h b/include/linux/of_dma.h
> > > index fd706cdf255c61c82ce30ef9a2c44930bef34bc8..9f9bc4207b85d48d73c25aad4b362e7c84c01756 100644
> > > --- a/include/linux/of_dma.h
> > > +++ b/include/linux/of_dma.h
> > > @@ -19,7 +19,7 @@ struct of_dma {
> > >  	struct list_head	of_dma_controllers;
> > >  	struct device_node	*of_node;
> > >  	struct dma_chan		*(*of_dma_xlate)
> > > -				(struct of_phandle_args *, struct of_dma *);
> > > +				(struct of_phandle_args *, struct of_dma *, void *);
> >
> > I suggest pass down more informaiton, like client's dev point. So we can
> > auto create device link between client's dev and dma chan's device.
>
> Is .of_dma_xlate() really the right place to do that ? If you want to
> create a device link for PM reasons, isn't it better created when the
> channel is requested ? It should also be removed when the channel is
> freed.

I remember just need record client device pointer here.

>
> >
> > DMA Engineer device
> >    DMA chan device
> >        consumer clients' device.
> >
> > If consumer device runtime pm suspend can auto trigger DMA chan's device's
> > runtime pm function.
> >
> > It will simplifly DMA engine's run time pm manage. Currently many DMA run
> > time pm implement as, runtime_pm_get() when alloc and runtime_pm_put() at
> > free channel.  But many devices request dma channel at probe, which make
> > dma engine work at always 'on' state.
> >
> > But ideally, dma chan should be resume only when it is used to transfer.
>
> This is exactly what I was going to mention after reading the last
> paragraph. Is there anything that prevents a DMA engine driver to
> perform a rutime PM get() when a transfer is submitted

DMA description is a queue, It is hard to track each descriptor submit and
finished. espcially cycle buffer case.

And according to dma engine API defination, submit a descriptor not
neccessary to turn on clock, maybe just pure software operation, such as
enqueue it to a software list.

Many driver call dmaengine_submit() in irq context,  submit new descriptor
when previous descriptor finished. runtime_pm_get() can NOT be called in
atomic context.

And some driver submit many descripor advance. Only issue_transfer() is
actually trigger hardware to start transfer.

Some client use cycle descripor, such audio devices.  Some audio devices
have not free descriptor at their run time suspend function, just disable
audio devices's clocks.  Audio devices run time suspend, which means no
one use this dma channel, dma channel can auto suspend if built device link
between audio device and dma chan devices.

Some DMA client have not devices, such as memory to memory. for this kind
case, it need keep chan always on.

issue_transfer() can be call in atomic context. but trigger hardware transfer
need clock and runtime_pm_get() can't be called in atomic context.

Most case issue_transfer() is call in irq handle, which means device should
already be in runtime resume statue.  DMA engine can safely access their
register if using device link.

Frank

> and a put() when
> it completes ? (Logically speaking, the actual implementation would
> likely be a bit different in drivers, but the result would be similar.)
>
> > >  	void			*(*of_dma_route_allocate)
> > >  				(struct of_phandle_args *, struct of_dma *);
> > >  	struct dma_router	*dma_router;
> > > @@ -34,7 +34,7 @@ struct of_dma_filter_info {
> > >  #ifdef CONFIG_DMA_OF
> > >  extern int of_dma_controller_register(struct device_node *np,
> > >  		struct dma_chan *(*of_dma_xlate)
> > > -		(struct of_phandle_args *, struct of_dma *),
> > > +		(struct of_phandle_args *, struct of_dma *, void *),
> > >  		void *data);
> > >  extern void of_dma_controller_free(struct device_node *np);
> > >
> > > @@ -45,16 +45,17 @@ extern int of_dma_router_register(struct device_node *np,
> > >  #define of_dma_router_free of_dma_controller_free
> > >
> > >  extern struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
> > > -						     const char *name);
> > > +						     const char *name,
> > > +						     void *data);
> > >  extern struct dma_chan *of_dma_simple_xlate(struct of_phandle_args *dma_spec,
> > > -		struct of_dma *ofdma);
> > > +		struct of_dma *ofdma, void *data);
> > >  extern struct dma_chan *of_dma_xlate_by_chan_id(struct of_phandle_args *dma_spec,
> > > -		struct of_dma *ofdma);
> > > +		struct of_dma *ofdma, void *data);
> > >
> > >  #else
> > >  static inline int of_dma_controller_register(struct device_node *np,
> > >  		struct dma_chan *(*of_dma_xlate)
> > > -		(struct of_phandle_args *, struct of_dma *),
> > > +		(struct of_phandle_args *, struct of_dma *, void *),
> > >  		void *data)
> > >  {
> > >  	return -ENODEV;
> > > @@ -75,7 +76,8 @@ static inline int of_dma_router_register(struct device_node *np,
> > >  #define of_dma_router_free of_dma_controller_free
> > >
> > >  static inline struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
> > > -						     const char *name)
> > > +							    const char *name,
> > > +							    void *data)
> > >  {
> > >  	return ERR_PTR(-ENODEV);
> > >  }
> > > diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
> > > index 5dd24ab90d0f052bb48f451cf009dc2e9128014d..43d48e4ac8161ee9955120fe64f7b911bfdfe1ca 100644
> > > --- a/sound/soc/apple/mca.c
> > > +++ b/sound/soc/apple/mca.c
> > > @@ -926,7 +926,7 @@ static struct dma_chan *mca_request_dma_channel(struct mca_cluster *cl, unsigned
> > >  	char *name = devm_kasprintf(cl->host->dev, GFP_KERNEL,
> > >  				    is_tx ? "tx%da" : "rx%db", cl->no);
> > >  #endif
> > > -	return of_dma_request_slave_channel(cl->host->dev->of_node, name);
> > > +	return of_dma_request_slave_channel(cl->host->dev->of_node, name, NULL);
> > >
> > >  }
> > >
> > > diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
> > > index 2035ce06fe4c4aeaa8620d817910a5319732fa58..dcbff2fc61a0472adea226371016a128563b3cd0 100644
> > > --- a/sound/soc/renesas/rcar/dma.c
> > > +++ b/sound/soc/renesas/rcar/dma.c
> > > @@ -204,7 +204,7 @@ struct dma_chan *rsnd_dma_request_channel(struct device_node *of_node, char *nam
> > >  		}
> > >
> > >  		if (i == rsnd_mod_id_raw(mod) && (!chan))
> > > -			chan = of_dma_request_slave_channel(np, x);
> > > +			chan = of_dma_request_slave_channel(np, x, NULL);
> > >  		i++;
> > >  	}
> > >
>
> --
> Regards,
>
> Laurent Pinchart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
