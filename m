Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 951A9B164DA
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jul 2025 18:40:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56D06C30883;
	Wed, 30 Jul 2025 16:40:18 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013017.outbound.protection.outlook.com [40.107.159.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6B16C3087B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jul 2025 16:40:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6NOZOhc6Ma7zH+7czGHhcDpktXW3qc9Lx371jtJX6oONyKgJjvrEEqDQuSLhbEJK0pFP40xKnnZ1Se0E6gfm28qJY3v9yrKqdL6zoT+Co/+of+lJNnLGvpgfAXgcMIhg9gIxnRNxGJ969w0ov8nHhIEoahUbWp5dehpQbz4sIT0KNXvX2JNFiPJsyUiN/PelL8eYh004d5FNGohypWE01Xcy3Cy02Nb04o0iSUMyLOC6l542mMl3JTD6PDHf6vhzhaK4Nb2/AYnYdRnDhTLDBWn9aJwzmFioz4BSmrTsWxUddmat7coit1FkVVivVYTptfj6wuHewk+d29nxv1Fng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8MIT2K5T5ezME4Gm1jvglttEant7zDYt4FDU1EdwRo=;
 b=v5pbTmx/LgqSveH3g2wTq7aXleuVm6S/mToNmcwQXo6VO5TiTkO73zkEL0/y31T7AlFWV/QlPQwrW9JYwfyCuOgtrnh0CvyLNKb82+xFihbwOV4GVEGGBrlOljZuX3zbj1Hc4K77e/rswcPSCh318NlpXLJrefiwGFbVBz0TNHyJVUjY+Ikba7ORKjsewuQNpLpp5+QBE/uloBPb9DLNNoQ2LI5EqlDR2+yk9EtBEMfSb0FQcqCUHhIqt7ZBrbWdwtJWDcm2f0MwoxLNm4IIeFq3zX1lGfnxqwRgSPdwIIl9YQaVJ97Sg65jrQ1D92kmtkliLaJtXIDs607cZ/Mt/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8MIT2K5T5ezME4Gm1jvglttEant7zDYt4FDU1EdwRo=;
 b=Bl4y4F7uLk3sN8ChHsHG8GcZ1w3Q/yXuMtZ1hLMrs8p/VElbpgXHlxIM0aF2PsHy7zWDYxREM/c94mdpDmz/fMU8sl5qhdk4pB/kRT6LUCOMeLhh+bX5WcUnrd4LrJkMVFkcAM6mkYkZUVnWFbwNL8CizCMa/Bu/uspU3cat98DCMcFaHGOjb92HfuLGInRrkD3FATrhQCQIg34XV5nL7ItN4PuhtzXeHQ8jVyhovLSm2yEl26GOENfWrEL4vK8G/69z1xOr8HasJdy2PKAT8ZeizZsj9lhn6nOdufzYIJSqsi0Otg+A0e5K1BYDj7rqqHhjnyD7U96Fv1FEX/GIQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV1PR04MB10193.eurprd04.prod.outlook.com (2603:10a6:150:1a4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 30 Jul
 2025 16:40:12 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 16:40:12 +0000
Date: Wed, 30 Jul 2025 12:39:43 -0400
From: Frank Li <Frank.li@nxp.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Message-ID: <aIpKz495WI1SJTeB@lizhi-Precision-Tower-5810>
References: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
 <20250730-topic-dma_genise_cookie-v1-2-b505c1238f9f@oss.qualcomm.com>
Content-Disposition: inline
In-Reply-To: <20250730-topic-dma_genise_cookie-v1-2-b505c1238f9f@oss.qualcomm.com>
X-ClientProxiedBy: SJ0PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:a03:333::31) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV1PR04MB10193:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a7415d3-d0aa-4717-a4fc-08ddcf87c0bb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|366016|376014|7416014|52116014|1800799024|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?34HVH0vNZ3El1M25vzeB+41u1HDcAt1G8bNHZEw6xC7pdR5DJ+TWkNWvHRhW?=
 =?us-ascii?Q?fPL7rZ8ex3CE6RjHpC6TsWprZCdwVRoaWmpOyk5JCSj/qDrNEvwwcAaDzAu2?=
 =?us-ascii?Q?UN7o3iMUOhzVsHWK1vl2jSJf+EXjl1suaUfOZCAkYqVOrEKdTWUL2lR/f/bd?=
 =?us-ascii?Q?3DK+jnxA9aJaapP2vHlwQ92JOwbMSvW+h6ixhxOjYkaoKy5EiyayYv5/K3fV?=
 =?us-ascii?Q?SCUPWEO1nnuo9rfeOv5bsGeUrYmEp6kaY9FFeY0heyPmQwUWMw/E+4TDLf02?=
 =?us-ascii?Q?Taw4MRNu4N4KEesHSmyUSaXlDkzTUQ8cEvhH7LvsouCvBovrDt6ezcwMkOTK?=
 =?us-ascii?Q?Vu6KmNRiZlzjCjxR4qcr8tHY2b1T70nohmgV42XLNtLuE+miMlnq5gUwWfE4?=
 =?us-ascii?Q?G8h2xmWQgei0IEzHuCMMkUCNpT2QCz/1GYbntkN3CsBVLKPJ23sQuL3zYNZ2?=
 =?us-ascii?Q?n97gTObn1wIJhAlS80SmTaFKBuQyeeR8507kSphtkDjw8pmaQ5Q9EQKXremD?=
 =?us-ascii?Q?Hbo84EwqiqYXOCH7hsfA0MQXBBYIuEZiXyJSiJf26zCOVe67aG/wiFhlFzao?=
 =?us-ascii?Q?lVzMQ2gZ35tD1e0x4aZzjehZgRfTEVxSqUoWoY5cRO6/9L7sd65tkXyoQW2/?=
 =?us-ascii?Q?gjdSZfHBhYRj7fcOBL9yI4UWMyALo3f6kz5rt2sqsl/UR4o4u9MBymb5AYAy?=
 =?us-ascii?Q?+8BKlg8h3mbiO5Jp2wNKgMyZwDT5oEC1MmTGqGAhfdvulFzPgUFJuiwFY18/?=
 =?us-ascii?Q?NzTlnIqwGNmAk9ERzHTbfe5UrOILDjDoh9N57XKWNK0P058VNvaJX7Ho6SKA?=
 =?us-ascii?Q?7wg7FOevMk5l416rBab0hV4I0vT6X23DqSSzhVkCqUMbYKR58Xr0EsubYCLw?=
 =?us-ascii?Q?U/OwRXviY/cy0THHiKTYik+Osaj/gXT09OnAixkuEBxwLqLi5Ij0Y/gCnK2j?=
 =?us-ascii?Q?pZLl7C9MsSnAsfPMvePfxILLKqKwBg2xuhuLzSrEVC3wUU9EF3KxKl7tN8Hj?=
 =?us-ascii?Q?3ETwBBfvUub4aKhRDOe334yvvianovYJKVKtqsdyVjf2ZA8g+tpz8OeyToJp?=
 =?us-ascii?Q?VERVT/o0vK7tEQjNXP7f+CC1oOzHN1ICvetMYuRqcfvIqvCHSvpboR/tYwB4?=
 =?us-ascii?Q?6OneFqOW43qFxpw3MPTrGUv2Z9QFZRe/uAS+c0RxXxLj2JJdPQ+N1N1CHREa?=
 =?us-ascii?Q?IeTxv4DnXUk2hBrw5WGJbDE3xx1PZAOgXhAqDPKGhDkUr0O0sZWgLCfxVzdI?=
 =?us-ascii?Q?jjFoXoy2yp/wBk/faXMF9pTclAmiAkjGOXsW/FsQ3YTw9yQzfKzN56sJL2Fc?=
 =?us-ascii?Q?TZex1crlSsSWNy/4DvFbKg/+dwDSmvdbTDfZXDcSkEIKVIfRmGHh2KQRQwt7?=
 =?us-ascii?Q?r2uXznfjhnEzWdF7gW9r0EeyF94MJ1Wrq2kPaMCy9JES9qnLqrLHbG6f40a/?=
 =?us-ascii?Q?zIv/lQX5rMkgU7R06k1iZgaAE9K8/a1d/VdriqhCjZReJnyqbAxXohtz2Tw4?=
 =?us-ascii?Q?W+Bof2Re2nXjA+HQzp6GwGaIkMqbNHzN7zYF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9626.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1TLngVaEuNSt/P2euv9ySSuL491my0AuI/1uYuNLDir1Q5c7wXSTvj211+dg?=
 =?us-ascii?Q?6twR9SQBtNqtOF+c+c28HsQnFWWcoSFhxLquzLUd5Hx6YK6HwoaEV8a79N7Y?=
 =?us-ascii?Q?BSKvN1pXGIBK+WBo9HuPTdfMBSx6v8wRi1m0GNH9tV65qESI7tW+COyM6MhL?=
 =?us-ascii?Q?aKuklm1EMROSLoBcZwokmHqsy96pM3mG36uGNe/07MNbhv2U9UUvRJv6A/ep?=
 =?us-ascii?Q?S79q7Ox1D9/812Sxbd5V1GEbYR/Dkq6W/rp7EL+3X1wY8aDnmo1PSHtIZ+6U?=
 =?us-ascii?Q?LhKs03/rgWXJWXCL9UoytXOk7vakJRpotgJwTvnbH5pxsoQUW81sGQ1CjKk3?=
 =?us-ascii?Q?i26g2oyAXX18Dc5Hz75YAuOgQyc559iUFaY6eFqAhyw9eF+hSGFnFnkL3IKe?=
 =?us-ascii?Q?265OLbCGimLBp2+U3ocaZD6p4xFVozYSP4MLJZ22tY1tjtb+65RykvmiCbJi?=
 =?us-ascii?Q?6/vSQoTXrqeCTFDZoz4gI5xKfLEx3xQs7hinUalLDBRlrcWDUD9D/c4OvdaI?=
 =?us-ascii?Q?8zWiNE8pYeNa+Dew65qf71MmZaok3zFMXtEFjWmZ+Rln4GH1818u/7/EUlvo?=
 =?us-ascii?Q?QxRO75yjCpKf1b59zq89h4sTvmlzD+8UWZtgWewTBYsM0ayHHuX/gHjpvZB6?=
 =?us-ascii?Q?HyAL9Vj3P12BxEL5uVBYt/ZM0UxdAStTbJpdOjl7G7hAxfg+0Wfv9s6lbRlj?=
 =?us-ascii?Q?+4UNltSbFAD++EBgtGhWn5x/Xc2ADAdtXEqfzEPlitvnbJNydxyJB9Tvrzip?=
 =?us-ascii?Q?gBrF8WVwgbBqd2+gxkJ5Xeo5uGQ/MEIN7y6YDsab3rf+/Mfp0RyD1YGH/jeE?=
 =?us-ascii?Q?PZTIc6YTyi6a3yGNsrb7W6Q4CIxnLdBWnr/6Msu7qKwlIqjqP1G0B2pqRcZx?=
 =?us-ascii?Q?rLPL0RICYx/EGEFFGwl3jg3Khv3Gu214HfW+6MV8WFCq6Eoe2ufV23YsSmsr?=
 =?us-ascii?Q?FYNh/0S/LIL2qGH78/WPrBRdaDjfgcKYJGGR2i4ohx7v+ZO4AXm0MA7+IdDB?=
 =?us-ascii?Q?gPxGoPMAe9x+PpZPXSGDbETA+hyR58FS1IwzUO2FA1triFerOZlT9p4swDqG?=
 =?us-ascii?Q?B0ZjQTLyi4zo1C1zWyvqs4niA1C55hxm5ifLSLCphGvGcEKswG2xbhZ4XgTz?=
 =?us-ascii?Q?j09NRE/Sx+6QAPkSFN0dPzuk0WkGDoRCT86xx0//i8KBUWEIEVP/ffo5KrW2?=
 =?us-ascii?Q?sYhgjwJhndTI9uV5Rkv85ulixWonmx4623uDlylkYfyJu+eNRmBpZU2BkbTt?=
 =?us-ascii?Q?KbjHXF9W9s1kA1LhqteUKLkZVgmoP8Zi0uvZhJ1uGNzLog7ixOYNN+5BT6nz?=
 =?us-ascii?Q?D1kanJqyY65prE16J3Rt22iNbBysGlkDKxTPIUzxslPvOUr5svGCWLyDATHC?=
 =?us-ascii?Q?b0NuPKB/h71wS6vxUwQ6tFu9gOJnedW3+WuAdIeRbrOR0R+3npclQe16Apj8?=
 =?us-ascii?Q?AUsf4HCpz+cZCbYXAQebfaYcnc+MoG07mNtNJ3fy9gIuaLzS3wXKLCyuSNA/?=
 =?us-ascii?Q?F90WkRk+SPjhMl5CMyGmvcGjFjEJUMd1fjQtYzxXEd5zZMsuEoyuYxNR8o7C?=
 =?us-ascii?Q?GYmaMgvsLTl/2B3t6yM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a7415d3-d0aa-4717-a4fc-08ddcf87c0bb
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 16:40:12.5730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: usHaxn0PLAtT77RNG9sOhwRnhyjOAi+DFYV5dfuzl9D7pzllGI/+d97ni1It3JC3hinqld8o067jTZSjR8sa1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10193
Cc: imx@lists.linux.dev, Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>,
 Paul Cercueil <paul@crapouillou.net>, Laxman Dewangan <ldewangan@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, linux-spi@vger.kernel.org,
 Janne Grunau <j@jannau.net>, linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Magnus Damm <magnus.damm@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-msm@vger.kernel.org,
 Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
 linux-mips@vger.kernel.org, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 asahi@lists.linux.dev, Viken Dadhaniya <quic_vdadhani@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Mark Brown <broonie@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-tegra@vger.kernel.org, Sven Peter <sven@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Saravana Kannan <saravanak@google.com>, Scott Branden <sbranden@broadcom.com>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
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
 Daniel Mack <daniel@zonque.org>, linux-i2c@vger.kernel.org
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

On Wed, Jul 30, 2025 at 11:33:29AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> The DMA subsystem attempts to make it theoretically possible to pair
> any DMA block with any user. While that's convenient from a
> codebase sanity perspective, some blocks are more intertwined.
>
> One such case is the Qualcomm GENI, where each wrapper contains a
> number of Serial Engine instances, each one of which can be programmed
> to support a different protocol (such as I2C, I3C, SPI, UART, etc.).
>
> The GPI DMA it's designed together with, needs to receive the ID of the
> protocol that's in use, to adjust its behavior accordingly. Currently,
> that's done through passing that ID through device tree, with each
> Serial Engine expressed NUM_PROTOCOL times, resulting in terrible
> dt-bindings that are full of useless copypasta.
>
> In a step to cut down on that, let the DMA user give the engine driver
> a hint at request time.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/dma/amba-pl08x.c                       |  3 ++-
>  drivers/dma/apple-admac.c                      |  3 ++-
>  drivers/dma/at_hdmac.c                         |  6 ++++--
>  drivers/dma/at_xdmac.c                         |  3 ++-
>  drivers/dma/bcm2835-dma.c                      |  3 ++-
>  drivers/dma/dma-jz4780.c                       |  3 ++-
>  drivers/dma/dmaengine.c                        | 20 +++++++++++++++++---
>  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c |  3 ++-
>  drivers/dma/dw/of.c                            |  3 ++-
>  drivers/dma/ep93xx_dma.c                       |  6 ++++--
>  drivers/dma/fsl-edma-main.c                    |  6 ++++--
>  drivers/dma/img-mdc-dma.c                      |  3 ++-
>  drivers/dma/imx-dma.c                          |  3 ++-
>  drivers/dma/imx-sdma.c                         |  3 ++-
>  drivers/dma/lgm/lgm-dma.c                      |  3 ++-
>  drivers/dma/milbeaut-hdmac.c                   |  4 +++-
>  drivers/dma/mmp_pdma.c                         |  3 ++-
>  drivers/dma/mmp_tdma.c                         |  3 ++-
>  drivers/dma/moxart-dma.c                       |  3 ++-
>  drivers/dma/mxs-dma.c                          |  3 ++-
>  drivers/dma/nbpfaxi.c                          |  3 ++-
>  drivers/dma/of-dma.c                           | 18 +++++++++++-------
>  drivers/dma/owl-dma.c                          |  3 ++-
>  drivers/dma/pl330.c                            |  3 ++-
>  drivers/dma/pxa_dma.c                          |  3 ++-
>  drivers/dma/qcom/bam_dma.c                     |  3 ++-
>  drivers/dma/qcom/gpi.c                         |  3 ++-
>  drivers/dma/qcom/qcom_adm.c                    |  3 ++-
>  drivers/dma/sh/rcar-dmac.c                     |  3 ++-
>  drivers/dma/sh/rz-dmac.c                       |  3 ++-
>  drivers/dma/sh/usb-dmac.c                      |  3 ++-
>  drivers/dma/st_fdma.c                          |  3 ++-
>  drivers/dma/ste_dma40.c                        |  3 ++-
>  drivers/dma/stm32/stm32-dma.c                  |  3 ++-
>  drivers/dma/stm32/stm32-dma3.c                 |  4 +++-
>  drivers/dma/stm32/stm32-mdma.c                 |  3 ++-
>  drivers/dma/sun4i-dma.c                        |  3 ++-
>  drivers/dma/sun6i-dma.c                        |  3 ++-
>  drivers/dma/tegra186-gpc-dma.c                 |  3 ++-
>  drivers/dma/tegra20-apb-dma.c                  |  3 ++-
>  drivers/dma/tegra210-adma.c                    |  3 ++-
>  drivers/dma/ti/cppi41.c                        |  3 ++-
>  drivers/dma/ti/edma.c                          |  3 ++-
>  drivers/dma/ti/k3-udma.c                       |  3 ++-
>  drivers/dma/uniphier-xdmac.c                   |  3 ++-
>  drivers/dma/xilinx/xilinx_dma.c                |  3 ++-
>  drivers/dma/xilinx/xilinx_dpdma.c              |  3 ++-
>  drivers/dma/xilinx/zynqmp_dma.c                |  3 ++-
>  include/linux/dmaengine.h                      |  7 +++++++
>  include/linux/of_dma.h                         | 16 +++++++++-------
>  sound/soc/apple/mca.c                          |  2 +-
>  sound/soc/renesas/rcar/dma.c                   |  2 +-
>  52 files changed, 146 insertions(+), 68 deletions(-)
>
> diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c

...

>  						const char *name)
>  {
> diff --git a/include/linux/of_dma.h b/include/linux/of_dma.h
> index fd706cdf255c61c82ce30ef9a2c44930bef34bc8..9f9bc4207b85d48d73c25aad4b362e7c84c01756 100644
> --- a/include/linux/of_dma.h
> +++ b/include/linux/of_dma.h
> @@ -19,7 +19,7 @@ struct of_dma {
>  	struct list_head	of_dma_controllers;
>  	struct device_node	*of_node;
>  	struct dma_chan		*(*of_dma_xlate)
> -				(struct of_phandle_args *, struct of_dma *);
> +				(struct of_phandle_args *, struct of_dma *, void *);

I suggest pass down more informaiton, like client's dev point. So we can
auto create device link between client's dev and dma chan's device.

DMA Engineer device
   DMA chan device
       consumer clients' device.

If consumer device runtime pm suspend can auto trigger DMA chan's device's
runtime pm function.

It will simplifly DMA engine's run time pm manage. Currently many DMA run
time pm implement as, runtime_pm_get() when alloc and runtime_pm_put() at
free channel.  But many devices request dma channel at probe, which make
dma engine work at always 'on' state.

But ideally, dma chan should be resume only when it is used to transfer.

Frank

>  	void			*(*of_dma_route_allocate)
>  				(struct of_phandle_args *, struct of_dma *);
>  	struct dma_router	*dma_router;
> @@ -34,7 +34,7 @@ struct of_dma_filter_info {
>  #ifdef CONFIG_DMA_OF
>  extern int of_dma_controller_register(struct device_node *np,
>  		struct dma_chan *(*of_dma_xlate)
> -		(struct of_phandle_args *, struct of_dma *),
> +		(struct of_phandle_args *, struct of_dma *, void *),
>  		void *data);
>  extern void of_dma_controller_free(struct device_node *np);
>
> @@ -45,16 +45,17 @@ extern int of_dma_router_register(struct device_node *np,
>  #define of_dma_router_free of_dma_controller_free
>
>  extern struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
> -						     const char *name);
> +						     const char *name,
> +						     void *data);
>  extern struct dma_chan *of_dma_simple_xlate(struct of_phandle_args *dma_spec,
> -		struct of_dma *ofdma);
> +		struct of_dma *ofdma, void *data);
>  extern struct dma_chan *of_dma_xlate_by_chan_id(struct of_phandle_args *dma_spec,
> -		struct of_dma *ofdma);
> +		struct of_dma *ofdma, void *data);
>
>  #else
>  static inline int of_dma_controller_register(struct device_node *np,
>  		struct dma_chan *(*of_dma_xlate)
> -		(struct of_phandle_args *, struct of_dma *),
> +		(struct of_phandle_args *, struct of_dma *, void *),
>  		void *data)
>  {
>  	return -ENODEV;
> @@ -75,7 +76,8 @@ static inline int of_dma_router_register(struct device_node *np,
>  #define of_dma_router_free of_dma_controller_free
>
>  static inline struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
> -						     const char *name)
> +							    const char *name,
> +							    void *data)
>  {
>  	return ERR_PTR(-ENODEV);
>  }
> diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
> index 5dd24ab90d0f052bb48f451cf009dc2e9128014d..43d48e4ac8161ee9955120fe64f7b911bfdfe1ca 100644
> --- a/sound/soc/apple/mca.c
> +++ b/sound/soc/apple/mca.c
> @@ -926,7 +926,7 @@ static struct dma_chan *mca_request_dma_channel(struct mca_cluster *cl, unsigned
>  	char *name = devm_kasprintf(cl->host->dev, GFP_KERNEL,
>  				    is_tx ? "tx%da" : "rx%db", cl->no);
>  #endif
> -	return of_dma_request_slave_channel(cl->host->dev->of_node, name);
> +	return of_dma_request_slave_channel(cl->host->dev->of_node, name, NULL);
>
>  }
>
> diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
> index 2035ce06fe4c4aeaa8620d817910a5319732fa58..dcbff2fc61a0472adea226371016a128563b3cd0 100644
> --- a/sound/soc/renesas/rcar/dma.c
> +++ b/sound/soc/renesas/rcar/dma.c
> @@ -204,7 +204,7 @@ struct dma_chan *rsnd_dma_request_channel(struct device_node *of_node, char *nam
>  		}
>
>  		if (i == rsnd_mod_id_raw(mod) && (!chan))
> -			chan = of_dma_request_slave_channel(np, x);
> +			chan = of_dma_request_slave_channel(np, x, NULL);
>  		i++;
>  	}
>
>
> --
> 2.50.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
