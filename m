Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C19388D3B4
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Mar 2024 02:27:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7858C6B46B;
	Wed, 27 Mar 2024 01:26:59 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11021011.outbound.protection.outlook.com [52.101.229.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6D51C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Mar 2024 01:26:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/Bl2j5L1E16ig/dr+F8M6M2sRTJJ5VSJBYXR6J7wftEHcCPU+GzM7R1wW0DF1EoG/y+QyNd2AqVZvlQkixL4Wmx7rINYw2BqkZztdP09GOXyOa4MqtpAXsPcbEoEizldvMTkH5VnP5PVWC+CJUlftEfIrBIkSYkbl//ys46SGRQL+tgWwSKWkt5rodu8g53ivLuW7JZfzVMIJ42KR3K9YYvciZSNflkt+0cJ10sooDqYoVmbFTnMn9g4CZqMUyyyf/j7sN7rrcBadcHpAJOKZrt31v/4qe4U9dMI3npwtCmUYowUe+ytBSVHDcNbFSfOGsarwdcal+9okPa/VJ0Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIsIi5LtaeiY35UDz6/OSrxYckNw+hX4XQ4dAtAahUY=;
 b=OG78e+EhkGJK28M246oaRY2qxbQbt1canNZD89vZDXSn3W9C6LZrwCVpxMLkPBQs5xMS7+ET5I1+xWuum+7VN2hiQXbKC/i4hFXiYltSR7rAkS3R15D7mXN2Xp9ENvToEjzCciu196M98HKhtFDT1yn9KQiR/888pG20Erb/KHY+RZem/p6UQKwTXuEsKp6A68WQzCxAgvc6gGULXA1vYiZSC0C3Q4HxbbQ3/36tMYGH8F3Xu7CRaSPCOnHtpgor9taMV+VkntN9JATmnm9JYWuF7M+o+i0mVn+YtKDvxmvHqUIQ8yDP1euXqYMqn7IEGXi1cYfpR/3mm6ZnoK9pCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIsIi5LtaeiY35UDz6/OSrxYckNw+hX4XQ4dAtAahUY=;
 b=BA/wZQjCOBrALS3l/d+qY/fyp4wCVMsyfMAwGE5IQ39Z4UYQiqg+j+0CCQQg4q6C0X7mGCRaUvcNegkpBIIQAT2qOcp1YVLj6gxusADdc8bGLXpiBPAXsCLl7SN+OtTE/+4px8dULBOY/7MwcCcmHT9r2pw0wLYz5njR4GcS82s=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB7904.jpnprd01.prod.outlook.com
 (2603:1096:400:fc::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 01:26:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Wed, 27 Mar 2024
 01:26:54 +0000
Message-ID: <87r0fwcvmq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <83d63442-ae4c-4e5e-a610-c0c0be54d50e@linux.intel.com>
References: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
 <83d63442-ae4c-4e5e-a610-c0c0be54d50e@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Date: Wed, 27 Mar 2024 01:26:53 +0000
X-ClientProxiedBy: TY2PR06CA0027.apcprd06.prod.outlook.com
 (2603:1096:404:2e::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB7904:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z+9gvBcBAPAfObfljZu9zbD6sOYh8EjtB5B4dPWTVnN67q0uVMFWPaLUyBfBAn9saSqOTug91ar0XCflaSBAYhusRlXC+fEQDxUo7HDwMaZU3EOMV3iJIqVPl5+TEOxaX1fHG6EqH6u05fVsQoUhcx5bkyZms+1T/3gj34aXOtSZmG/l5yfkekklOcPZc5bI1s6fYZ3xRvYItONuypwO1HEbvbTxyMgH2i87v/PA7iBokK7remb8e7eT5Q33bvMWRyNjh1mZm7I0jFMEGk1DhQf9FKMiFZONeVQuX/qU+xMYSyBncKIrLFYg5x2i6VWUr2ndxCSSKxt83jpBYl8u2m9FXxqcB5HN6M6fz7USO6EpF7QpWf+5QyaQWiokr4x1DD2OcACk/hWOP7R8ZAr7yzadIhWmTjr85O6eEX4hRficxTkXl3IlVo3vgfPrsYhl5+lwtqnwyPNhtCTztCpVkU/NXzEIoszQFPEnphhVFUdYctKB10swm59Ta260rk/uCPJ/3CYB9o51Zgizt9+yOGVxrrnxWyi5nIAJOyxAk1T0pvXRmxTRmF2j8LY2IXj1NQUOxQv7UHm4Nt226/bXs3GgO7GjFUId8/3uE/SmK4mlGZsWpFkp8HHj1OHdNLCvyhIv3nGru9dsNEe1k2CahecPWrdlQXigAFQ1PIsAfhlyIOgcBfOgiCbKIn1XBk88Cd+DE4Rat2KLffCHUytJCob6uMz68HpLP+XbQkdmvU4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(52116005)(7416005)(376005)(366007)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hm/SGjcWhcuqX0AkY4szKfuPelGYIqGEox2gLvf4FPFJsEpfXkp8YZIwQqR0?=
 =?us-ascii?Q?fqLGZE2J4rruktc3qYQtIzcrlYNtX3Ouujj9jx/D5i3xHKBeAqD5ldIP+uEZ?=
 =?us-ascii?Q?bfBSwvLpW+Z5mUGVlywnIk4eNI5KAHi3In6AC8dkQ8pHsaLwqvdiYGDSS+Cb?=
 =?us-ascii?Q?cAAmmE1pHu6CWkBikphbhqiQM7hicDczS97n1tO4SN1SUjmaq4pAzfXtiuMA?=
 =?us-ascii?Q?Cg20NAZszJgbWF0VQfpaIs91jiMQnWL4dr8ahrEk5ZxlPaWxJypBOKfZfDE1?=
 =?us-ascii?Q?9f4zh0uKk3lAVKSe/u4pDV7w67YUGP35NF2nj9QGMZysX8KvD8wY/J924nd7?=
 =?us-ascii?Q?lZanbtb6k/5Qo86IGJUV0mD9dFz2yMAPa+ErquJS0DY1iKa4g/YO7jEh/pZG?=
 =?us-ascii?Q?fRq1yYKkqyTNm+yRTq/UGmNeEtrda4/kWtJGuAJJ5Z8mag1CC28rzqepDch6?=
 =?us-ascii?Q?uHHDAXw9ZLZI0F0OeZP7McgGfpoGGs+AGcv7cTc11fWacXbxODWN4/SmHyw7?=
 =?us-ascii?Q?8wGg2ppZYhiBYP6H9Co1AU7zTcv48o7JbmXC+5G46CSswu6y26bIEc+O3gX9?=
 =?us-ascii?Q?VH0tpLqlrRJ0MDtPIcxVxYrOdblyaO1+hkiFWXLUoXP7s2GKKne0sUGXZCGB?=
 =?us-ascii?Q?VQP/gPASmdZ7U1cTdsGfEQHla7uSImlv4XGd2JCkjzb5VUpdNkEVPoageexM?=
 =?us-ascii?Q?1fmY5hiMR64R2NrUTngCARVdg6p5quhY5OKrX9gOhztVUy2kqs2HdAV/RWp1?=
 =?us-ascii?Q?2aHDN9S+L3WGyxayiuY/LU/YaylL8BaNdElz+7pIHo070jXbU8M0nzGVjEWb?=
 =?us-ascii?Q?TzAMY6tPSINkJS2oay/Lq5w73fd9dJ1bc+f7pJn2bWDS5ip8JJsZIfSOSv+J?=
 =?us-ascii?Q?gcZmbR1N4ajpXmsIu2PKuvEa31daHOpvkCulCaUPo7mzc7SEtPZxyzqhOHfO?=
 =?us-ascii?Q?ozvpjWm5KQ1vkEMePOOG4eg53RsZhooe7zRwONk65IOqAmdhGBkN2VzQ4I2g?=
 =?us-ascii?Q?z+lgzrLFXjWwILKA8iee2o+N4Xmhnc92fVoJG3yOSpl4s5flA2Q8EQYlLYTp?=
 =?us-ascii?Q?6S7FL9xPQaZC6YOuiPcdgA3PkKLMgHw1g23MVEZQm98dyhglybDO6iNROnce?=
 =?us-ascii?Q?G9SMFB6yAdWp8bRCLpBmXiMdRfP88162N1+xKTkTOfHrpcKD8n2Tbk//FTuw?=
 =?us-ascii?Q?f9T4Y4mDdmuE/VFhuOm401Jt3Ggq0BnDFHAWcyxNIT4WZ/FfE6ET4UqPN3lC?=
 =?us-ascii?Q?1A1KXkxIH+qu5OQ2K+61ju5qOh0AIRTi0uaQqCIYFCIuWazquPiGKra1QVRX?=
 =?us-ascii?Q?xNi3/1NGqo5QBVfnvCZ0bVIPaFib5AIT3ZmanEhmImi5xpTC1D5y02jR72Gx?=
 =?us-ascii?Q?8QlpVS4Bq5SQ+ZEM6nwwGd793o8d/IzevqWpMz5ECm/QbHSprvHBj0aMjaF9?=
 =?us-ascii?Q?+gmqDmjMn+f1+U0Qo8ZEDUHyBMSA78mi2NzOlXm1IAtsdubJWRegvKAOh5W6?=
 =?us-ascii?Q?qHBX2/gp6PESS3q+NgYEfj0EUavmcQqYXU6hHxTsNMCSk9o/PDS+Oz0d93Lm?=
 =?us-ascii?Q?4TUO/hx2YzF+tPhlkceb/U0h7NyGJlSMls8pk9alRtDez/xLHWYZhGIvAtne?=
 =?us-ascii?Q?c2YwlDwrHe5ofdn9m0ZZkbk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b869a9-3757-4d8c-fe79-08dc4dfcfc84
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 01:26:54.4619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fITv2S96yilnn+aJkII8y0Z2bVpiBfzhqdyASinop4eJxZbSoA5RL1jHXD5FlVFGfWwG+1mKazeE3wCWuhGJ3bbC+22NK1OqlmHI+bAy35buU6p/o9GawGBEXGHyTDPG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7904
Cc: imx@lists.linux.dev, Cezary Rojewski <cezary.rojewski@intel.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Maso Huang <maso.huang@mediatek.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-sound@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Brent Lu <brent.lu@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Kevin Hilman <khilman@baylibre.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 00/15] ASoC: replace dpcm_playback/capture
	to playback/capture_only
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


Hi Amadeusz

> One general note, I wonder if playback/capture_only should be renamed to 
> something more descriptive, current names are a bit weird from use case 
> point of view. I mean no flags, means both capture and playback are 
> enabled. Then you do something like playback_only = 1, which effectively 
> affects capture stream. Notice that flag is named playback, but affects 
> capture. Perhaps, something like capture_disabled, playback_disabled 
> would make more sense? This would also make more sense to me for 
> something like playback_only = 1; capture_only = 1; which while weird 
> doesn't instantly seem that wrong, while disable on both directions 
> instantly seems broken.

This patch-set is just using existing style, no special intention.

Basically, I have no special objection about _only vs _disabled,
but I think it will be 50:50 no matter which style we choose.

But switching "_only" into "_disabled" should be another patch-set,
I think. But I'm happy to do it if everyone want it.

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
