Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F937893698
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Apr 2024 02:32:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05E04C7128A;
	Mon,  1 Apr 2024 00:32:27 +0000 (UTC)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2122.outbound.protection.outlook.com [40.107.114.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D78B6C71288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Apr 2024 00:32:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAYmhtYW6h8ysskAv/AhncKj8fuPNrc/+BbPFtXLa+iwRiI+xwy0NMYt23MLFqvE0/Ku16gE+afvjRFNENGRWxTt/L588L+EctUPAGrk3OZWhJey3whlcfO08rGFF4FlkVmqdIWAHSHoOtoaFh1iy8ve1kN4Rca3a9TKFKawW0T71cdggnfnWHs5vsvV9RIilj9a9cqxCYzzy1B64TEDRzA53ytsyKfbgO8R68YKGePpt8MTIkikzcSvENzH8cI+FYY+GkVKGZxclg7TuwQvbNmacY2nvihvbZurJz2OMxxyJSGsmkrgXkxDU/V4WSjk0ylSysoDtY/xJMcBEkOyHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Fi5YmLAN/ztC8pwduR+1TD1gF6rQnTeW9R9HKSHXOQ=;
 b=McSmHWtg3M7L87y8U/blvUfk0uWpTKpKpVbdta/Dtw6496M+FMRTis2YHc1VlcDW2XW64KlIju3buSKMJlzEP3nASCeGaTobupbOvQde4oEBRDAm1Vde4az5fiP42Tzf638S7Vr/A/iRyMIPf8Naw54SMP+JXOMElM9RtGt2Rm9WIGQgJWx8BieoyJTtErrl0np4iBbiheB42MlWs+Ytyj6EAYOuOOvFYv/NnyBShKP37zgMlNKv13lDU2CStX3EQFTlZhp6lkadRRuZ5fqmDsr1FOygG3xZiYVrxvOKA652wZ9681GuKfmyngC5OCkopdITW5uTxoOZd6TgPTEjHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Fi5YmLAN/ztC8pwduR+1TD1gF6rQnTeW9R9HKSHXOQ=;
 b=gN3HpRd9G5JaP6tFzfIxaUe89Dp19QJXvCYyAQkgAJYQOQRRNA4upJUa3ALNHqSjJtU3dLDIOlSMkHSytleQ5DF1EGPMTwLggSR4HQIJsundtCPqFqpTQFBdRojtkNRpHkECFbqfQshmRgYapU1YOF29NSAcV8d5WHlg8i+YLTs=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9964.jpnprd01.prod.outlook.com
 (2603:1096:400:1df::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:32:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:32:22 +0000
Message-ID: <87cyr9udm2.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent
 Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,	Daniel Baluta
 <daniel.baluta@nxp.com>,	Hans de Goede <hdegoede@redhat.com>,	Jaroslav
 Kysela <perex@perex.cz>,	Jerome Brunet <jbrunet@baylibre.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Kevin Hilman <khilman@baylibre.com>,	Liam
 Girdwood <lgirdwood@gmail.com>,	Linus Walleij <linus.walleij@linaro.org>,
 Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Trevor Wu
 <trevor.wu@mediatek.com>,	Vinod Koul <vkoul@kernel.org>,	Xiubo Li
 <Xiubo.Lee@gmail.com>,	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
 linux-sound@vger.kernel.org,	linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 1 Apr 2024 00:32:21 +0000
X-ClientProxiedBy: TYCP286CA0182.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9964:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LHhobh9QIIh6ggyi5IFUCIIKxivljQNLS17UYp6V8MuKOtf0pxKRsPmDidgS7oX6/Yb0f3ZBuzgClequSwaZhkI8vx1GfjiFYdtz1l6WCOPq0UlSz5Z2ur6hIsdN/wAWNa1WY1FYFh6k+5yE0JuowO9tJLwwaRLp0aK30kQ0NGC+DKXj8jx103sezb2NowQ06gA85YI3zc4PEKpIutG2pWOEpuDdprsYXEAT0LNAYqcxhMgDqSctKyF9OeQoIGD4BmcnrHYE+JqZFlTNxVFYMHNOswlH/TdeVYsrLvHT85jVMEKb1028FlRGVT89Dvf1GO/c3h4JsQ4s4ThOfZwNbNc/ey742c6mdhwVYgr+OC5sQasXJBfd13fp0BINyyEqNh85B/95BXOkFWSMUkRKgvHFUQTnN1rsMojosOhR2M8GhthAcHDIllPUlx1WERLEhPYBH0e3WUS23AyuCtrnggU8a2Y17E+8QhrpicDxO0mdLC1QQZ9giUu0rRm0b/SgAs+FwYw57FBtB9u60vTDYJjGRDc33wFA/WJwW4/bsiWFJcwBZ7aXF7WlOe1XiA3ZX5RV4lMLVxpwhUIARP5r5VhkaVYyM5qRimju9P1oSF7vacrEYPc84ubps3DNja/c1yUeJv1aKEyvKM/8datrz2lFD1OMBWchVVKpE1BJr8htVPG6p9B5lRFTgFNfWyW5znrmdmWylT1tRCiOuj0Wda6FxJybABBNZX61C26p1h4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(52116005)(7416005)(376005)(1800799015)(38350700005)(921011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VGj90DM5kx07tpO6n5yq3BAjyectX65ZcFqlIByDQJPvo2FmGVaNWbbl6F0i?=
 =?us-ascii?Q?KRuTsPmuwfpoG+sd7gg1/kbTMVPP1Y2obOtuoSIieqzN11ETj9TYktuccCX3?=
 =?us-ascii?Q?+fd//5sVWD8TJGnEOXLqRAnL7L6pT77zsJgO6/vo7quUYg0lR3h7T61jLhtp?=
 =?us-ascii?Q?A3eLtJ3RaH0Gvv2gbVQpkOVGSOif1YWzATspMxy3drqnUGRtQc0taxYSvTaj?=
 =?us-ascii?Q?BZ8We5X0tXSuj719KD8llC7pDaCxbdaQgf0dPaPmDv1eC0/gfOBNH90cw6Fy?=
 =?us-ascii?Q?bNiXUkKETiaV89nCT/5vFljYyl8fsbUG9uEsRWVr+S+YHz6gzdGaNmrRDAv6?=
 =?us-ascii?Q?s73wwq0l7wglAA4oNRHgO63q8o99y9rVdiYI/zJYWgyZ9UXQ4JmLGdBYf1Ws?=
 =?us-ascii?Q?YUCuelHGjOGHoBIcdHtYbWoZw+GaAJO862lFYtK0f9g7VJDx4OuB7KZdlW+g?=
 =?us-ascii?Q?HrkFvgPLn+mawSDNQg62ptQtv9/2Ex3Vpsjbt4oDHFeBU36Dxle6UIDJTdfB?=
 =?us-ascii?Q?+NZky8LtEZjYinsH9+5jTMzJsuQU5QyKCZn29CiLC4BtW9gP9YLW+p2bR2zf?=
 =?us-ascii?Q?CBCVQUL3Sr7rdTm/dE/EMsEiRFGlpaRZehIxHTYym5TTTcC1YrQQtFxF9Zc+?=
 =?us-ascii?Q?Yg/78CZMRcoEZatOOxOtwAi2rwUlXDu+DJEwJu1lgIPhn3i1bzQu9jk9YM0l?=
 =?us-ascii?Q?6PLjse+1Nafs/DOLgzSP2Oh8VB4KrPV8/reiyAeN9y2QlDyUn9Wyvjn7EQ4O?=
 =?us-ascii?Q?ar8dr5PPk214VRyUMo/sezdfzmGXZ6CYr9eX+biIEm6rB9VLP1n5X7U+OYT2?=
 =?us-ascii?Q?Klhl9Cdyzs2p8VI/HqYsfj/lFxwXVO6QA1WA4wAsRNvQDFmkK3eUo7BdEEuO?=
 =?us-ascii?Q?UaXfpm3M5kxlt4UeOcrmjdgmQ+08JHEzp9OEPPDTajwp9I6N3RKFcI74+Oeg?=
 =?us-ascii?Q?9/5kbUqhPDpqDodoS/p/xi8VPq6N0G3GPxohltcEzUWszXjcnAWOQzKhGYai?=
 =?us-ascii?Q?4hiB+YJR4ypiF1EjdCWGq/2f+EMxkCzUAxj2ckzRND8cDVFAtidjJIV096KS?=
 =?us-ascii?Q?NLGeMn4MLo/Op7mKgfmNSe/lvpDo+/G2YXZe6c0DWn/qq9QBPdAtaKYl7hVy?=
 =?us-ascii?Q?mKRO5ZrD6lxsX2/rmezrzzd5QsX/J8sprMOquZF2/iA4AZpqUiE/7Uh5tdit?=
 =?us-ascii?Q?G/vddZZ+mTbiL/tBuEWhtrvwTqCMy6+lc2u9X2ku8V4Sx0cKaNslHqvbtvi/?=
 =?us-ascii?Q?eiowuxy9Px29d0av197mwHlDPvmc71kqGIHCTTZrYNT3TFlCJsXFSSPkHKz2?=
 =?us-ascii?Q?teNpqr3efaZT2lHkbqFnZn9nayNhhzzmLb+jLdHinW8eFk0S+ZEmFhy71zC6?=
 =?us-ascii?Q?cEwaYiP8t6VFd+aJCL71jT0+SRyHTkccq9XU+Pfca7pmn1Ld1kp4z/dW6EeF?=
 =?us-ascii?Q?ADHfL3iVk6DvzB+g2cNWBmUo/XO9ukce8owL1dbveOsudVKmzkfxRJj/yDwq?=
 =?us-ascii?Q?T5KBqsKwx10UvgC0+jPcMYCOquybjDtEzYSgnd6FTHc7nf0j2AZswA5PULs/?=
 =?us-ascii?Q?kBBK4tIOJk3C6GZY/mT4EKBWnCDa8A63EY5oZVwQFONxZH0vDeq+YxOd8i32?=
 =?us-ascii?Q?3mPse2cVkEVM1gmYMcjOH04=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ab1d72-ef1a-4b07-1596-08dc51e331f7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:32:21.8826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LIaP62mve4UHd/vopiyLjyq5kK10f0XGhArIAtcf09B3S4Z9IbW49ClAlI0/w2vxlfO0IdUdELys8Db4kIZC6MPTJaZYaCGXPDYJoHcxVixrC2FmofAQYnYzq+htTgvG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9964
Subject: [Linux-stm32] [PATCH v2 16/16] ASoC: doc: remove
	.dpcm_playback/capture flags
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

.dpcm_playback/capture flags are no longer needed. remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/sound/soc/dpcm.rst | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/Documentation/sound/soc/dpcm.rst b/Documentation/sound/soc/dpcm.rst
index 2d7ad1d91504..259c39add421 100644
--- a/Documentation/sound/soc/dpcm.rst
+++ b/Documentation/sound/soc/dpcm.rst
@@ -157,16 +157,15 @@ FE DAI links are defined as follows :-
 		.codec_dai_name = "snd-soc-dummy-dai",
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only,
 	},
 	.....< other FE and BE DAI links here >
   };
 
 This FE DAI link is pretty similar to a regular DAI link except that we also
-set the DAI link to a DPCM FE with the ``dynamic = 1``. The supported FE stream
-directions should also be set with the ``dpcm_playback`` and ``dpcm_capture``
-flags. There is also an option to specify the ordering of the trigger call for
-each FE. This allows the ASoC core to trigger the DSP before or after the other
+set the DAI link to a DPCM FE with the ``dynamic = 1``. There is also an
+option to specify the ordering of the trigger call for each FE.
+This allows the ASoC core to trigger the DSP before or after the other
 components (as some DSPs have strong requirements for the ordering DAI/DSP
 start and stop sequences).
 
@@ -189,15 +188,12 @@ The BE DAIs are configured as follows :-
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = hswult_ssp0_fixup,
 		.ops = &haswell_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 	},
 	.....< other BE DAI links here >
   };
 
 This BE DAI link connects DAI0 to the codec (in this case RT5460 AIF1). It sets
-the ``no_pcm`` flag to mark it has a BE and sets flags for supported stream
-directions using ``dpcm_playback`` and ``dpcm_capture`` above.
+the ``no_pcm`` flag to mark it has a BE.
 
 The BE has also flags set for ignoring suspend and PM down time. This allows
 the BE to work in a hostless mode where the host CPU is not transferring data
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
