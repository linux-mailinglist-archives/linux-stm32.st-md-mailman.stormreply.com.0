Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6838B893689
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Apr 2024 02:31:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31DC2C71288;
	Mon,  1 Apr 2024 00:31:13 +0000 (UTC)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2137.outbound.protection.outlook.com [40.107.114.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BB9EC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Apr 2024 00:31:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvSYmjFBrcDZZlFdcizDdINYH9EaqtT5PwG2ll6YN2j/fCjSJESZIH4qy/rjmBUFVo1cuVlnw8GXWKEt6upmUtlb1yAjV6/ulOH0KL5aaPxx7DIGGvGMLe/ZKXKlaDg32WW/N0PZQi+SAKV3hAHfl1ZUYj0AvS4gGbMvR4YbSsAprBRHMc/M/PPe5p7DP/EPKhIhBO1S7l6LIoJF/THAK2N1dI8gEC9rTBWgjp7TZi71HkoT1kdDSbYSk9imWDUDi1UES0gXlTUn6xfIO1Au5pCFYBagbzp0kweVcLQRgtj82EWoegtMuV9PXxH1ljAZ5BTkHCqgf4NIT7ph12WeQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EWyQeR690weBVNGhlFiX0+X8nFlopGtJM8dti0LeNM=;
 b=NCoSSqOFM9rOA86O8V1pnR5fZnljWJ3BvXyZ7hOPCqpYcpev2YsuqIcidtqu2/my+3uVZ4LzduXtBgQgYQSXezS0CLxm/qz9Hg98EvPy8xI0t8+x7OUm4F95Zu62WyrTVOFnyJlG/Jm0N2GuOl+vlMSul2e6Lt94FBrubnJKa6B+YaXgE82zaPAK2NySLquobKmScJuY0lR1AWWUQLo+xOHdxo0rtmW9jikDC0x3uhUJF6mfWQyLFQswvLCmj8zd7ljYFKoczofeBDB4cGs2EGeDq7wt7QObtaL0dp5N7238LkLusW7SNvLF5X11MCTqE8zciwChSp8Mnm+zcDGTmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EWyQeR690weBVNGhlFiX0+X8nFlopGtJM8dti0LeNM=;
 b=I3tnTkx7yhAqePXSGAxJtrPE0+gpAkD0cNwissz0xPXUWUyKG9bMPDnZcUq1GL2FVYo2lQYBUf97I1c3914TtekIq+WQSSR+0Ca+pxusjHCKO4cIMpJilXDnOrssriOk9ydzIAD8hMwpmU6cGtVEnE4pLanyNSBHzIRnjcOfy3A=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8258.jpnprd01.prod.outlook.com
 (2603:1096:604:175::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:31:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:31:08 +0000
Message-ID: <87ttkludo3.wl-kuninori.morimoto.gx@renesas.com>
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
Date: Mon, 1 Apr 2024 00:31:08 +0000
X-ClientProxiedBy: TYCP301CA0078.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8258:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zMxdabLHD792T0SBEKGIf1WjWOVasATxDWFmCGGbueIY+s+nrEV+SJoBHUkLM0WxMTztCiyvZqyFm7y1/1tLGeyLBjvq7iNJhFCqJTi5UaDHfbZzoZorg3hhYtreevThiPl58oSG1aYoTKKNLLxpQmXR0nmNAqVtntdJj0S9H0phDnBVWrWbwMdNHqXKwnuEQ9Y8lcQQyZz3meKBBxx/g8brbNXIyvanMjyia/XmDhu/4Z9GplXc6Nc4pAAvdLy3hIO+vp+YO1tBqxmiMqaH903UXgQ5fTMO+UjAUPScmEMIkonJXo5xRjE90xqFOPseoABQ653ViVgH+2rCEL7eDzTfnvRBkW0FBLLsc81jPZIgFEWh47LCoLM3RCfSKgddViqnSHa3DNr1SO6eHR2nspOH1OStEM7EQVhXHOosqu2g8RYYvCPS+vJN8UKjJ4vH5Ss5CnvQ+1uAW/OBrLgJS4CwixcFgMx9b3QWe8pKU7gyZbwleXyIHnX/dpN9xDaqZ6bGyM/IYJHqitdKS8YxinHnn0F/MeK960zXqNSkuVykd2xKEeyjOBf1QHEDOvTvflnsS24fbzqUKXDcwTQCHM6pV7kjAKtecjmVThsJThok8hm2g4YNw3IJBr3Aw3a5bKnToepDFNCWZbpcUcES0IMOKOuUWx7R7VVgahMqf7O0rdKRuiFG2pb67IHkh2zl+aXYCDzaBILfcMmAYK4a7nEba6NqVs9/Wk4ZdYjAZSM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(52116005)(1800799015)(366007)(921011)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9KrBdXX3BO56oBVWwcEGOER9neRXJGBYOhMHYp7B+cGZ9CMrG0O2JXE/nyat?=
 =?us-ascii?Q?29wkAyAet6tlL9H2ejYx/sBfhWpwTkUQQONDJ0eVscrqxgzw5eu4I0YTDoRw?=
 =?us-ascii?Q?eBqxdQbUsoUxRvwhmbta5CCi0uEYr7t56OxOQH7++oXrfb/41mRIY8sOLuG4?=
 =?us-ascii?Q?x6rdQ5d2ORi9IDLKIx5is56ZA09wqnUS/86THKBhmsZhnRtOI5OMU3NAYqI0?=
 =?us-ascii?Q?sIdYTohBBq/98hfg2V1RWpSVTPoSFAmJfl7y8YQiNgyIUEIi40ELqgTn0AiQ?=
 =?us-ascii?Q?N8UQxtMpD6R3bfOHc1xeO/5p5Y7DsvlIm9J+7eCgtI8nixBjv2G9k/1N+OE2?=
 =?us-ascii?Q?g3fiQi6HNNS+PYEBfhZ9NkuBjz19q/RYaJmGkBGQG1pDzLrOKdHhOhra4jAY?=
 =?us-ascii?Q?ddDljNAgPn46f8hljSW06Sf7e/zHA0YvU8XOWzmGOh2FlA14uib7OEqIVeC1?=
 =?us-ascii?Q?6+h7dRTJu/w66B7I+n2STbUafowxtmcDPFciizl7q8U4uWuD3C5uz9oHZR0F?=
 =?us-ascii?Q?tuPW3y7XDfjeSiEG8aSbRcwdkXuhYp0DmBznDwdg8L4C7Enwbp2RAckyew0s?=
 =?us-ascii?Q?s1ROiLVBAdUJdt2IOixMlMBurr+hLccPqNLqTD64HY85McwvaSIQDKLYWyER?=
 =?us-ascii?Q?VejgZezTLtcvRKOo14jrWkXCcS2gzyy45kq96AM2n+ZlWeSq6uLBsiRHhVdZ?=
 =?us-ascii?Q?cHOVrSJzMzuoXDDlbh3qAWAeLE8JzwVRgdg19I+8ql/JQXdLPXe5JkPzLvOP?=
 =?us-ascii?Q?ZVcvrSL6nBk6jpQoV6UWJVTgJJNXTb4EXBOOeKBcWTxGUxSJqzoVlfhOP6fN?=
 =?us-ascii?Q?b6BKwYP0TYhOa2LdQHL8Z1KQDl/Qiwc8Ohq65ig7ay7hphXaHi5b8QLHenYX?=
 =?us-ascii?Q?zcX8BBRkfjWvvdlJJUfK74nSVX2qZrWrPhodbzcpq51SIAWAE3TEDoSa2DRX?=
 =?us-ascii?Q?OESmWRo257LTaFnYvoBUUcViAaioPkT+ER4B1NGIM2RJ4GVQzzOEs9EZG0SJ?=
 =?us-ascii?Q?sQqGljjZ0/cd/OJO537YF+Cg4mt+SxhL3hr3HIwnADDPkzpq92QvKpDh/pvJ?=
 =?us-ascii?Q?1et2RFN47PbMEC1ou2+6t2LR4G0ezK0M+82CqN+XHAvsAd7PW9wgT2xQYPpt?=
 =?us-ascii?Q?R/CabweEgR1bOPnDoLW8BxKKVSHMEasH3cMZtEVju6LADte9Jreyrn597bg6?=
 =?us-ascii?Q?4mNVoV9PVzlK16M6VyngCsPA/VYDA7PeaMFq4OhS4eDMNd4GhYdaPNK0ovuJ?=
 =?us-ascii?Q?+xDQS8Ahw+skaGa1Sj+1ZUops3guIgynvO2xMpRSQtLtb7kZ4r99/aaGQZ2Z?=
 =?us-ascii?Q?xqiMhExTEMGB1xwm2QNr29eFZdKAlOEJB7WaHyCwMcSMutaEeJ/jR4vcVBZF?=
 =?us-ascii?Q?/TvkbvgqXiG/z0Dn7bBGMjbjoj2AK2LQ0puZT9xCG28YuylH1uTJFKs88omA?=
 =?us-ascii?Q?fTT8CHI5yIGw1kbxkAZchNJx3/Xc4UFhmqoqz9IE4mwZCh0bI88EfJulMdY6?=
 =?us-ascii?Q?U82KePFX7MpCf8wgEnmPSBJMFlEyWEn1HOZNU1LEegg4naO+lexoWjklwukX?=
 =?us-ascii?Q?Dg4HO5pssbncK+ya9NlrFPf0tanlpYyqvfdgG8rh7RSf30nG/nJHc3F7K6nW?=
 =?us-ascii?Q?/fjA6euNIMfFot1ffWjweCY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed5cb8e-ec13-4c9f-20a9-08dc51e3065c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:31:08.7982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AC2skkfWwS7DBE39b5nSpSC/OgLzRmP9X1rVKl0SvFhIgasCIZhYUZCtCHo3XKhQQjpH4XmySLLSx3J0+aNkd6Y6Vd2aUfy7h5+mhT5FLvvLEtCSqjWs4QYDH+Idq0gk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8258
Subject: [Linux-stm32] [PATCH v2 04/16] ASoC: sof: Replace
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

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/nocodec.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index 34aa8a7cfc7d..a0105c31723c 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -55,10 +55,6 @@ static int sof_nocodec_bes_setup(struct device *dev,
 		links[i].no_pcm = 1;
 		links[i].cpus->dai_name = drv[i].name;
 		links[i].platforms->name = dev_name(dev->parent);
-		if (drv[i].playback.channels_min)
-			links[i].dpcm_playback = 1;
-		if (drv[i].capture.channels_min)
-			links[i].dpcm_capture = 1;
 
 		links[i].be_hw_params_fixup = sof_pcm_dai_link_fixup;
 	}
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
