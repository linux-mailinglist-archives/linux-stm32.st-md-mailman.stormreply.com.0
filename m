Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFC1897DAC
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Apr 2024 04:22:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46E24C6B45B;
	Thu,  4 Apr 2024 02:22:30 +0000 (UTC)
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2118.outbound.protection.outlook.com [40.107.113.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70C58C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Apr 2024 02:22:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWRDNq5qdWmEPer/1PCi2BOurFLTg36fwJDUEL1c+0jQBZN5yER5F/YqEquZMM8EwlxUTsm5l5Oh5ZO++eO6PYhiaNxo2K33hVlUY2WKiagRqzU9tFp3CyvbzaZe4B3YCypgmXh+z14Fh4xv8p5AWgoRfdM/oVclOBc9Puj2aN6JknxBy/fZ1Hs7KdQIoze5GPfEn2F01YzWuZ90t2WxAwNq+bFVQUWGbC3t33voODB+s1L3d/Fpbl19UvoQVKUsMHvkCa/chA2KdTqpSSC1jhRgiK1oBuBXmnB6ByRPhnRfMqAjbKUm/kTaKg3L/mQyN2TBG8VvHl8wwfxECt7N7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XH/zQQNEZzMfhpkCJiz5JeJw+q89TH6O5ykQrdLETbk=;
 b=ioX0xwDBMFNzV0P2jgUu+WBRUEg4wYqGhiVp0bf4FMCFVCXCMrM+T5VDJTd2JOWliGeJquehb3ZK0dmp/wEsc3SmHYaUbywX/cDUwk3QQAsJEhf0eN7jpFutVQknMR/PDuGahjArAIlMqtLL0V9GP9PDmVZ+kOTxoYC7mAv2M7qZ2mc2iS6BZIsttiDi6RjQyhHWPn/mUH/W8CxFN4cB8o1Yk2xHzZv5YaCE2bZrQNSx6ENm14ZVhnQ7L0vtHg7kj0v1pI2zeMGKO0rXxaia6D8X9Nnh4AfSX05KysMjgPDfN8dzKnY8NM2ENlNNuJKP3E23xQORz8+zKqj3e7J/YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XH/zQQNEZzMfhpkCJiz5JeJw+q89TH6O5ykQrdLETbk=;
 b=mMqmd1lFAlGj2H+V089HWT7O+QaFd5Zbyvvp+g4/wH32oM7dBbvlog9KlA09fzJMYWG3SAncqMXYIE4FjLYWwMLvzsyw8DGOXBUuGIPa4a3OFPKDiohEtCaA/83JwB2m7beyEwWk69iK3MshRQ0V20Gbzx4sf4QvKIDHcDYd/zE=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6277.jpnprd01.prod.outlook.com
 (2603:1096:604:e8::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 02:22:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Thu, 4 Apr 2024
 02:22:24 +0000
Message-ID: <871q7l989r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <4c40b4bc-f2bd-45b7-8b14-456ddf1be94b@linux.intel.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
 <87h6gludmj.wl-kuninori.morimoto.gx@renesas.com>
 <54ace545-8cdc-49aa-8214-5f07bee0e2f6@linux.intel.com>
 <87y19w7gjq.wl-kuninori.morimoto.gx@renesas.com>
 <4c40b4bc-f2bd-45b7-8b14-456ddf1be94b@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Date: Thu, 4 Apr 2024 02:22:24 +0000
X-ClientProxiedBy: TYCP286CA0110.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6277:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K/wiB3On3Tta/jllxj74PSD2c0EdtFt1aA5wjwrv6SLu9TWwQyftsaFwN1mDUKLg2j9/U0ST9l8ypN+d0DnD31aSG+7y1O9C1yGWx9sqqHg/hxbM2QiThqzx0cYvu9ns4+GAi0KGAz8F+RWaxvyAKMh7Nh/b3d7iyFpkzhNKvwDGiVd1wujxnFuffnh4C8dr2JzpKQJuW5KBz32i0LAz1Lrimhh9nQmNZNSWsc1VvObZbjErWvoBSY9jk6QUz/Ng7WBOAOOj2K7sLFSKA5rEQo5qxW50fZi1gm+Lx/LDV2RGDE0OkP/6symB1OpB5ACka0LxeZ2/9czloRZbemDg/oJ4xD+GD/SMuRlWjN5m8jREkC/G/VICX2pf8E8na8u22OHtBwmXMPloRfb96qtr1uSBYrSGNW5qidN4P2meyQ7b4Y0I1iHLE8uvdpWC9fel/FvX0OYJ0WG5oPbF2heRYR5vZ22tWMW18TZOZ3rjRWFEFna/aEACKhEAvsjqn8f101TXuXdE4K8/y8xJfSY2YGDmD9GgXUgmA/zW6wOhFAVj1Q2LLU6swzZHRsfmiDmHlnPqBi5Kk3oTbhfrdE77Mojb4/b6LG8aZ5HnFfFGdoUWmcVEXWZx7tVqHXfnRAimYtvI3A+GZz1Iwpp0Vps1wReL5tO6Q8l5DKMxCre2f0VOfg4u8hjxAoJLfcL8LrVvaCoEr4dAoO9Zh6c5uwbeGP+cFesT222t/AjwDg2ZfRA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(52116005)(7416005)(376005)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cAQhYpAgu+SqiUm6lGzi4h4VtmER4PQx5uc9OU1Fxs5YqtqH91eoABpmCo15?=
 =?us-ascii?Q?5YeO1Z1tbSWEVnZrjn1u5qsRx3ZRcHgfHy0reG+I+txlBDXjr2PHxzS31/cw?=
 =?us-ascii?Q?JaMWvaNX1s0dovplOdPQnabDMQJYMn/VBqRo9OUwMEuytTlnY0RXezERTi+w?=
 =?us-ascii?Q?taDL0idvef5YvYj5ZIKsPoX2pa/EN9/E5qxzH70AnucPexO1yNXbUPFxscnf?=
 =?us-ascii?Q?vM7/E2mYCPoMvpfJdjcbpcIz6Px5OqXEw+MjwBFoYXlpn4+CCB4eQFFbPol1?=
 =?us-ascii?Q?HN4lmJtT8QRc97k8D8igcWmmqCWX4AmzwKkRkW/X2NVV7KrV3Ds7aJw9Wf6/?=
 =?us-ascii?Q?t0+DnefkPSJyvRkeNjCCVipHXmOlWdNdnZ8N32vdLCA7lSpk5D+cMTisjC/S?=
 =?us-ascii?Q?hXwkL77xkUY5oOcQwuho6xS09sAN298E17Q4n3x3tR1XhSISs/Eh7+UGh9Qm?=
 =?us-ascii?Q?k5lvMFp5cl1mn2OAwPmf/+97ccRz1gquGCXunpIkoAsgPbF2nnClgLF13GR5?=
 =?us-ascii?Q?9CvkAxRTJbU46ALdAcpsJ8ncytpwffai3NtN5WyTvZQ94qJtzFoKnMDCvLpr?=
 =?us-ascii?Q?KwAttmPk7v0y1gjfCyyFJMRLm1SWvIGrP3AHVQGk0b+E1GuC3hZ5X745NrG4?=
 =?us-ascii?Q?ze1m9EW9QT10aUBWTXzSTTAK4CHm+AQeSCDu/R1rhIDFobvLBbcI2Yo1zac7?=
 =?us-ascii?Q?heF3aarPJLvg/wQCZddBgPEWfFuikk1wqVNLk8Zhz1zSFjRlfHRSVNSi1ilY?=
 =?us-ascii?Q?ppvEPJk/6KbJHZVFRuUdqEiEK5pr9QbMQSi0RlSorPSD95eel0vNTET2j2mX?=
 =?us-ascii?Q?QhzWj3ckwK7IpKrY1u3VhTDaz5bg0xqrvabjhlcvmu1ePn9yeghRhMMNATUh?=
 =?us-ascii?Q?bdUImtFfNBLPF3pBn8cEkS/DMtGSrp+Ks3WvcgTJpY5xb05ae/uGrr7BBOGh?=
 =?us-ascii?Q?o077U4Jl/xxpFO4Ne1VJ1kSgP2L4CuOad1D0KkzM2zF3Y+xqRNREKWaLfMCC?=
 =?us-ascii?Q?Q/d7/HV/sUZHji0fnodt/7/Uv7veRpnQvAp2jf4JLXj3Dh4A9bk235MwNUub?=
 =?us-ascii?Q?swFv2/BufIXKhb2HBxK8kZVBBj/C/NhMMtZtkDzGiLE6ZSNOEGal1cIgI4Yh?=
 =?us-ascii?Q?SryzcOVURsy3PjWA47ktUvZeFQNezY8CwhlBjczGbzZxLBXMzUxZhaYrY9SR?=
 =?us-ascii?Q?BStirjheptsYXJbsKOD51vg1iRVJr2++3EzFW2hTMWLTfpSqXidz80cll8GK?=
 =?us-ascii?Q?i5H39NDVR1YTyV4urTLZLXYUCUjZYk/jYa7RqM+eIv69CJdvcEUMykdj6Mfl?=
 =?us-ascii?Q?k/XcIiecgj8pTUo0NPqDuZ3gQGInbdWdC3FRFF8FPp2/11jquqTEQcNIEHXm?=
 =?us-ascii?Q?rfOhd0UVvaUpLKvkrnXWkKAUSAJFuu66L9DxRfvOoOlqpc69SAsMTv2HHyau?=
 =?us-ascii?Q?D0U8kKYuP8PJ121PDE0jUZTX7B1I8BU8P+fYYZ4xRepQfQboF+M+MdpauGbA?=
 =?us-ascii?Q?qYdsp7ZFlcTPTNmWZWtxBJZg40kNds3yyLr93hzd2HScd1OFT7RQOsaTNoW8?=
 =?us-ascii?Q?P9QI+By5B9bmkbluaPb6g6m0+wlM39Fp9Sx/Y1gvn31aSM62w7ABdRgoTQXG?=
 =?us-ascii?Q?ll7WpwnHXLJxS1BtmWXDEhQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44aa97f9-2faf-44b9-875c-08dc544e10c0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 02:22:24.6409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LhtESW9P8mUE+HLcgZA6AXFwB+a86LEeW8RwjBfGPluILUxiiX8JMJSqhVFHTUfqohpE39C9rRdhV/sbFfwgPpYoB+cd8O0/2Y4IKzsWdhjShTgR8rA9+EjnQ1ZKp5KG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6277
Cc: imx@lists.linux.dev, Cezary Rojewski <cezary.rojewski@intel.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Maso Huang <maso.huang@mediatek.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?= <amadeuszx.slawinski@linux.intel.com>,
 linux-sound@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
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
Subject: Re: [Linux-stm32] [PATCH v2 13/16] ASoC: remove
	snd_soc_dai_link_set_capabilities()
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


Hi Pierre-Louis

Thank you for your feedback.

> >>> 	void snd_soc_dai_link_set_capabilities(...)
> >>> 	{
> >>> 		...
> >>> (X)		for_each_pcm_streams(direction) {
> >>> 			...
> >>> (Y)			for_each_link_cpus(dai_link, i, cpu) {
> >>> 				...
> >>> (A)				if (... snd_soc_dai_stream_valid(...)) {
> >>> 					...
> >>> 				}
> >>> 			}
> >>> (Z)			for_each_link_codecs(dai_link, i, codec) {
> >>> 				...
> >>> (A)				if (... snd_soc_dai_stream_valid(...)) {
> >>> 					...
> >>> 				}
> >>> 			}
> >>> 			...
> >>> 		}
> >>>
> >>> (a)		dai_link->dpcm_playback = supported[...];
> >>> (a)		dai_link->dpcm_capture  = supported[...];
> >>> 	}
(snip)
> It's very hard to review because it comes as the 13th patch of a series
> and you've already removed similar code earlier which precisely checked
> the consistency between dailink and dais.

Ah, OK, I see.
Indeed this patch can be merged into [01/16] patch, or can be [02/16].

> In this function, it's a similar case btw where the settings provided by
> the machine drivers are overridden by the framework, so that's another
> case of collision between machine driver and framework. Which of the two
> should be trusted?

I couldn't understand this comment, either.

	In this function, it's a similar case btw where the settings
	provided by the machine drivers are overridden by the framework,

Do you mean dai_link->dpcm_xxx which was set by machine drivers
is overridden/overwritten by this function
(= snd_soc_dai_link_set_capabilities()) ??

I think CPU/Codec driver can't set dai_link. And this function is
basically called from Card driver, not from framework.
And dpcm_xxx is no longer needed anyway, no collision happen any more by
this patch. But am I misunderstanding ?

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
