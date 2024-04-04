Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D4E8991EE
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Apr 2024 01:14:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBA1DC6B47E;
	Thu,  4 Apr 2024 23:14:04 +0000 (UTC)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2139.outbound.protection.outlook.com [40.107.114.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E18CC6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Apr 2024 23:14:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBl7hsmSeUGqdZ+4ZSkxmZc38WWruQymX1ZCspbmCUwydgdcy243nvkjGTYRz7Ewms+YHMXW4lX/DLzVNbrA2nKVrhaBktdKtBzfUkbKKDTNHZDsBmBxwWQ5P9W34eN6Oqj5la/jF6HJ8Bq8ir/+XEZOEVcfV22Vm6/PxNUmLGN9IWeUJ2DK+k5DD0QQQPqcEcxdyHkjlExSifHPJ2ywRKSlgW/rRWmLCPzuY0jLQI4ycUgh8l7Yu0a4t90g0cWW68jbleokQ+e99ZgkIf2pAQPKFbmHNlItuAovlEkeZ/Z9SbJwM3esfCok7EAO8xe30wArejYs3pu0wvQBIecsBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMlle8t5qu8Z5r/1AAVEMPyeW4R1CyP7sQ+ENP8GqGc=;
 b=UIP8/Mo9s3lojrfY5IKyrs30VxcIuJ09sS8aEN68RewFT8yXujLs9Mr4zc7wkDGXevFc3CFxALgURNcUaE8qQw+FizlSBnJX2KfMMQAliQ8FCruY5GXX+qPxloR9+TjQeS8e2cjYJrQh/MK9dkrYqOfPqA8Oz4C9+iyNK5/okpUvCjKYLgLp2PqqUfHLjFZ2dyAcJmMKumgldHeO2VFegJTHRtwT7mXfeH1e39wtGnmI/xWIXtl5+PeQjhTBHkhdOTND/vkoe1q0XVhjRkx4Mc614lfQWQaNpiSU/SHaDAOfUBImFPiwW0bzpX11QsdxzSr+GcOtc1qZdbv4NwZ6bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMlle8t5qu8Z5r/1AAVEMPyeW4R1CyP7sQ+ENP8GqGc=;
 b=DJm0snxBx4b4yPl4helZmikk0vdnpvaeoC4dr75eyZskqUsZiJ42mZmCM4dezAQPbIU88WC/gy5gD4MXj7eSCqEzZVp4iOdXrpxbZU2IBfsedJCN1xys28x0MrPcbs63C43p0/ltXwuNRAcqXUcGXaIc63QSmR+xk+YvPdGEdLg=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6913.jpnprd01.prod.outlook.com
 (2603:1096:400:b8::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 23:13:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Thu, 4 Apr 2024
 23:13:57 +0000
Message-ID: <877chcraaa.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <1jil0xplcu.fsf@starbuckisacylon.baylibre.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
 <1jil0xplcu.fsf@starbuckisacylon.baylibre.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Date: Thu, 4 Apr 2024 23:13:56 +0000
X-ClientProxiedBy: TYCP286CA0195.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6913:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6ZI7IKjqFFf5hB9MeFyklGbF4Cn4qbsRwTM/OCEUI5ZqhxOvkSAFdY4H+soqqvfTytq360TcXPQ9c1Iv1eApe+Vkp2tOL3zq1sVePHUMORSVpCYRcYSWaQc9wE7K5hTSz76gnTvX4i7VOQXZUDmubBMtr8l7u/v3ENFCNNu02XAwUOe3yYBWE7SYfICWVU2CneVjvJC0AAbkDuSqe/czs6kUUA0EwpvECI2wnGvhk3J2LUoWXZEIus5zKT3AwK1cNsgDw2HWIdrAwkYp1bAOav9r2NDr9s1pFkhMERXk7a/Z40Dfy8yYjybeAEwbuIHBwJfHDKw03Iny6SvxF4jtJeIDvl2PkgCQgD+4QAWW9r/ZMkKVDkVErWyYRv6uOs4iSn/0dt4vSrQlqexTimNgUvBH8c8BrIPxXwqRHoD4yta/Gro47n+sxlJcU2SK7kVW69JsR3QEO5XmA3y8pkY6tcUmsVdES4/KCqX68/xa5bPf7n+QeCfsD0CFKOh2xdBJ2SaEQQj7buAAeucWgyFXc1WPvihni8/iN7yVbfj7FjNhUKmI/B4pyACZ6aKPO7kYZdL7e0/vIOILrdL/7rvxNhCHXGqkJHtP4R1RxsMN5TxMR/QfNClBrHqC/6vryal7riHKtu5s0hE3ugIJsZ0gT+eaikfVoD98iQf7Y0bwCsDS/wchyBpeCkGCHOpo9BqiyJ8+jFTdA/s03vueYABL6JLa6CRBqBFUnD2TBmuize0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(7416005)(52116005)(376005)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TA/rZKrz5gD2JIZhQoS1iycYOl1KXIET7pLlBlL88cpIWjxXm/xbPbsVOe4C?=
 =?us-ascii?Q?YGgAtTum2/VE2aX9NL5sfn1SIkJ7OiWwdHhmd6WwrXIRKf2mCDStB/mPxlyb?=
 =?us-ascii?Q?K5WjRp01RkPsHTmQ1oYXx3r2BlLB5aeGVr8BX6xQZlzDFNAfeDvSGQd005tW?=
 =?us-ascii?Q?3ReQ28MjrFIDJxmLgmzfbC92a3965IWBoo8DUL+rgWiKA7RLnqcOks2rKh+L?=
 =?us-ascii?Q?KGnQxszWLc3yrssciw+X6xqUqTHSX8ZbuUoe5dCLEIl0eW3C5xYEFBVyu4hQ?=
 =?us-ascii?Q?xprVrBd0JQQOPNwusddIzhtHvtV8qnoy0QzcGo6mL7PdOWJ5lFSM6PlbOba/?=
 =?us-ascii?Q?ZC6OcTD2JZ6YoHRb+v1b/4TybgJsSQP44fboh4SRcY+oCKYs+k/SveizHvCs?=
 =?us-ascii?Q?UGM091GF8O1vsTS5icJWNLYpDGNxUiLzruailq/NSYNsaphKkiX7MDb/rVkW?=
 =?us-ascii?Q?dy0h2FVh4wFpjEvlhCEwjBSwFWC7kbZuL6ZFkddBNP1aSSuJdNsMAu90QS+2?=
 =?us-ascii?Q?a9Cx5tjXUIkNET5cZo9vBEK8CdUvBUP2volS1rwBI+iIrdrp18JayVCdCsIP?=
 =?us-ascii?Q?wU38nhYjczxgH0/g+0ncvrc47/Il9TfAka+rrUTQ6Xgs2rAan8HWaxxWYTXh?=
 =?us-ascii?Q?F+5oQLfDKPJ6MXhpYoOzPaJ1jCf3cWedC8yDOeImHNds9xOlBSQ5gHlImP+G?=
 =?us-ascii?Q?uu080Xxb2IW3h6dO4Ub/4Bgqx29mm2yvzqO7AGP1I0NZTwDAauBscfN1uhcS?=
 =?us-ascii?Q?JMS5tP/E0zBDIl8fXSysUWdtvtw1Ksg16nrhKFLUJ+83YYp2IF3r5OgqwwRA?=
 =?us-ascii?Q?rf9ZGSOe+63oX+SrHIVQrmOq0Fz31uzL8VlxtIHl3MVvvC+aRFnLHNDQna7t?=
 =?us-ascii?Q?tQZ7Uqt2LX3CLEJ0R+1ttw5m4bLshUARfeMXp45zy9AFzfVq4en4JqB4mL1t?=
 =?us-ascii?Q?ZnU1bVtcrPptwLme2I9JNwe/DUpP5UUSHqeW7aSTAswT2o8RnUqRd+aHAj+T?=
 =?us-ascii?Q?3vWHhMykMs+U3slYvOnWGFo85GYCRePfyerHvmQ+q4VXaBR/dmRHn8zme5yi?=
 =?us-ascii?Q?06QXIHaaSkpXFTbZIMqGUVWbI8Cx5L4+s6iJZx6LwUCJyH8MQjMvr8SeeBWC?=
 =?us-ascii?Q?qnbkMVc/VOPfa1zxh+8DZZimSRlojyndxPc5e4ll77rqRUlv37qr0dSJYamX?=
 =?us-ascii?Q?5h+RJYB6c6meDL2SovIPNwPqtgrgbN5eVmZUuaBArNpb4Rf491JQZ11U7DHx?=
 =?us-ascii?Q?e0UPnv7xs40+u5mPkJraCLtXR85DyykwuicuqCZ6hX9+6FZtR4RkuFJRQWZz?=
 =?us-ascii?Q?sAbQqbHEthvsCj8YYQQ3JYC2xkO/juEAQynfapuxNtLoBDdQO7TlsU1c9UIV?=
 =?us-ascii?Q?4I8hXxQL5fPVeDBA3og/pTWf6zxBtgJvjEBNG6Nhl+CR7NRo3Ovyezj4tFE0?=
 =?us-ascii?Q?sxArDuMZ9g8aqGYEBIdx84Tba++KnoH5s7XcM/f/u7XaqNTDlvsOj88/k7Pz?=
 =?us-ascii?Q?Iei9GQvt3Cq7EohIY7FUfTxGpfRHcGQNveJMO4Sdvpd5UsJ0gymgmOlTBn0/?=
 =?us-ascii?Q?MerdU83rR2qsB0d4TIzyZXVt6Zn+uRHuQ5H2F+yS4viAkE3HfYmmuC2b+qli?=
 =?us-ascii?Q?W8clNz7bxjyUd6YPIxofg5w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c14f534-3956-497e-f00f-08dc54fce75d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 23:13:57.3007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tyx8xh0JVJCbnTuf5Hwugn+UKKHKuo1oVkmdk3G6YhORcPHPNLIjtsuuLIzyNsQiiYWk39xymqHJhSEQYEmLiqsS1lnDUbMCDOBUgoeU+GHhcrUoAL0sOwv9YeJsTTwk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6913
Cc: Daniel Baluta <daniel.baluta@nxp.com>, imx@lists.linux.dev,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Kevin Hilman <khilman@baylibre.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Maso Huang <maso.huang@mediatek.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-sound@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?= <amadeuszx.slawinski@linux.intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 00/16] ASoC: Replace
	dpcm_playback/capture to playback/capture_only
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


Hi Jerome

Thank you for your feedback

> playback_only and capture_only have implication on each other. If one is
> set, the other can/must not be set. This leads to conditions which can
> be fairly hard to read and possibly bugs.
(snip)
> Wouldn't it be better to replace those 2 flags with a single bitfield ?
> 
> something like:
> 
> unsigned int directions;
> #define PLAYBACK_VALID	BIT(0)
> #define CAPTURE_VALID BIT(1)

I think Amadeusz indicated similar idea, and basically I can agree about
it. But in this patch-set, I want focus to removing dpcm_xxx flag as 1st
step. So I'm happy to create such patch-set, but I want to handle it as
another patch-set.

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
