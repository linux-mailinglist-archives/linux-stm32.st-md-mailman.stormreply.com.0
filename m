Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC1589368B
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Apr 2024 02:31:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6109BC7128D;
	Mon,  1 Apr 2024 00:31:34 +0000 (UTC)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2100.outbound.protection.outlook.com [40.107.114.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B85FEC7128D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Apr 2024 00:31:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXVmg5wrNyhQiPcyMi+pVlyYxaTLA7ChAEiGG2IfUHSY9c9IDfFcldr3B3EPTZYu4p6bwufHH2MHDcDakP/TXM4NF2/gfG+adG4+GYVhigUN89YVfrvaSv9IAsdARoldOfFLtj2JlCiZ2Qh5UwuqfTR2FF3zsEyaoTPy+q6jPPN3+L/lpTj5jsyj5Hj/8N5tD2k43sBS0yTmpOeWo3YnUsywqtVpbCqvhRi1+wqETn6uj5GufwDzWf6x0Artcl3gy1Xwc+CCRyvhgJzgb9WqErVUFCz+/CLbYRNRQHNiD3h7VdL0r6dOepf+6ug4JBO55FIYG2BBahLBpnjhbOzmlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7P5eVuTinS4Z/q4ZEULSNv9I1XS5DDdnlX1GbB3ufI=;
 b=HvxHFSc0Kuvx/mUSoRc3hkys/r1maCwfuv6PFbyLrDBsmBH1djRs7v9ZQSHv54S0HnPHPazW8aBVR3ZWjQle7WTvA1hu/hfSycEbjXDvAfrHgZGSfcHIRZ/jmjTH9W+N+Qd7KJDydoxgp/NbinbejATGTKNld6ZO6yf6lLQbe9a2qVu0VMTm+QuPRyJMhg+xoO4XBgqhbvCIyqBGsENpNvfsIkAt20TBInSkjEbR3GR4zLLh284ninUmrOLPV7AmWp24XAV2B3XWMc22/l0HzRDthoWMKavnKGZQVm4/jijGgVHfCzfs6npvYhNwghNiOu+RmB/SZwVopqn6U3Q+GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7P5eVuTinS4Z/q4ZEULSNv9I1XS5DDdnlX1GbB3ufI=;
 b=bOoOS40TInNgy+YjKQ+D45Q70gZ7EiGjQl4J0oT58PEYQBc70MaATXWOrQQF4vKaxRcl8wvBlfuYAV6ggQfSs610Pt5oiFFz8aSo0RDlu4sB0iuc7kXfVBew9YDd4fTHN+L6w/fB13exv+38JzIHmTxydYu6VS1/qLpwJBuawyM=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8258.jpnprd01.prod.outlook.com
 (2603:1096:604:175::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:31:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:31:29 +0000
Message-ID: <87plv9udnj.wl-kuninori.morimoto.gx@renesas.com>
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
Date: Mon, 1 Apr 2024 00:31:28 +0000
X-ClientProxiedBy: TYCP286CA0017.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8258:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: di+UzPuC984kGyuoQYI9UBe/RddwiauXfeg9qhXej0RKcc3noE64t2JFcq/OIKmsEV8ROux5qW9Qtke2sT/a6N9grJkwsgNp1pqNy+TkiUAZEpXMlfG+or6hLZy2bg23tW4j6IBtJZQaUYWt59E/gpNIde9688Xha1ptsS4gxRpv8eaZCdzl4jiQjdCEMcpLXGiTP8U+H35tk9pncv7PltmtanqaBTiTwktZXaegPTaqvWUJKJr1VYzvzCNsawUKhK0dAstt3GIrOevYLgjZfVQQs5bltcN/37evWMZcKuWf3fCqhsitId8kYtHtnZnqo6Oi2kcKmX8WFo/YFolGQE46qTndHyBov3hMEBvRaP3XlnLj8GivEGvMyCnSUgTUmbFVYLm2drpkZDSyVFPl4heiMEoImeV08/SriByRRAHyOqDSAcURpX2rFe6/GgiOipbADtrwKd1cH6ALSeNbhM2/9pcktMLKGVMRSBoBqSzhj5wMq0jGdDFJDA8/k4HPFp0RFyjDCeGDnqX/ZZb4G+lQVJWYy0FwWdrNnulK9R2taqER5yhSr/XD/4jvo2EuPaIyfxwENQETl3RxdtBO98T4ATyFrypnXPRx5uVEerzP3wLX/AeyjPPGlQJ4A6fD83nsZSI6BFWwUNjPmxSZOs32rK+4FmrC5WqAYNwyEes4EdN7s/C8d3K29SZmCIJBx/x6dqIkYR5pTdcdL8jAfhXcf66k25RTc6+rYGo7Jns=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(52116005)(1800799015)(366007)(921011)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b4+kK7gninYdaj5rAV1pNfw8GjVRN0GNkkRo8vNqgFoWctFKmyCBmlyL4owH?=
 =?us-ascii?Q?ptO+OgrWlzdxo/GwMdRGneR1qLpGCrOCp2cBelI+zFKeYrVssEUMuDXgR3Me?=
 =?us-ascii?Q?5+Jy50HYVPcGs87DUeHwA6U7fSGi8Yror379e8Kpp+hOqceX7z9ryi8kNPi8?=
 =?us-ascii?Q?7PdGTHJEjDnD+XyKjPciZjb7S2F6RmS4+gRrjwrWeFeUjsOP5VtEaepevzhS?=
 =?us-ascii?Q?vnp3RINTzsmrmVObRRjJc+4Qkw1MHAHfVak6caDT4FxYhB16+lhPe87oYB6C?=
 =?us-ascii?Q?/f9L4+RLi50bnmg/utu7ytpT2Apk434W1xShtUQQFBa+ogWCHVat2q7r4OZs?=
 =?us-ascii?Q?gfisXmV7Vp08XncBdAHQjHTUMl0r0fwqg85sqFv8/YOr8g1rvvN20hCsczct?=
 =?us-ascii?Q?2vqt45+fXqYQveDi7sjVWgWrg3yrRjEK0icGwwIOP2w5CzDHo5fMBLwDxRW6?=
 =?us-ascii?Q?YSVy2V3qHpzKIdZkL4/Vjva5hOzT4qTvo22vwheRT4++DDxz8891Fx8Q7abg?=
 =?us-ascii?Q?b5AK03ODxiKShMI/PxdJ00iNoiW4HSsGm+lWiFnFDVgjxmuz6PO79WD6p1y8?=
 =?us-ascii?Q?MG5WDl3z7hdFNJ2m3G5MjkSwyioV2vi8pwCwK/mbkI4Su21bZvNY3wBpplbL?=
 =?us-ascii?Q?OUIhDXx0JbSkgrzSuSuCKVODjd5npTcTQVGNhTlJoO63xD+dvpoP3GRsKLAN?=
 =?us-ascii?Q?+UfyOSYT6Nc1KDKsZ2wt2arPZTcBLllEL93pk9TGfUm/y+kn8gFHM8uKrDdF?=
 =?us-ascii?Q?oj0OA52PMRaxoZbykd/nCFUTMI0Q379ggENRczct+TIgVkvnPrB1panGH4al?=
 =?us-ascii?Q?3bnuJ+3Cge+ejUGcN1yVd2tMB/L5xfM6SxukVcLfqIQlqgB7adBU0J5PEeUf?=
 =?us-ascii?Q?JVUcYG25nG8T7eGEGCo+hYvho2dT8P6dsPnfs2MIM2qw63VsKI1vjlEwpJ83?=
 =?us-ascii?Q?Pc4sBpABu6WdrcnaZnUO/eIegaUEDrzcIhNnrNe6cJ2PbBkjIcMstBIDkkni?=
 =?us-ascii?Q?A1EqbVjPtbPrN0VoTHpxTatBi+YqghWK3qycZ4ecnRctFmc6z4rm6KkYYp4Q?=
 =?us-ascii?Q?efvJi5aA7KYwjnK9sLPFUfShD5BRLScI051vTcd126rBaSWcXROZxpB8p16K?=
 =?us-ascii?Q?JmzOXdvFuwMgq3CobVYP0B87ei/F8T3FGaAOrEqlDawqH7l6E+zgT2DgSlN4?=
 =?us-ascii?Q?4r2fbyhOOdAxxkBcqufMXFDPzhFpG7mLxuQV38EZBRx7vEmb6vxIy42efE+6?=
 =?us-ascii?Q?Tp3n8J7PkIR0pSO18v4F/7/N8Ahtb/+385S+WahvgzJc1vqJUXYY7kRLrIwi?=
 =?us-ascii?Q?HehkxTrdDCw+WXcOz6K098V0u5ip9TeVP2diNNjdaVJERV5W6MnESaC0YPi/?=
 =?us-ascii?Q?c/4WzKosI9WlIXO0klwPVnSaUUtmLPD/OmWPawghdNCl8aqtaL1P/jlwDWWM?=
 =?us-ascii?Q?tIyQnJhBbby6AFCsHjaD00cwhYuVu1semukgULwVBacyBdqqJ+pf3amy1dJW?=
 =?us-ascii?Q?gX7Zt5o1np8ZYfelc1ydpF58ktzIhgspchlUFhbNak4dovKd6CkiXdcE4srn?=
 =?us-ascii?Q?TAug13RKsvE6hVWP7oZylDrZVd+S7VVSCpnMH4zi0G/ovCB/DYJ4OnkDM5DX?=
 =?us-ascii?Q?H3IO1I2u5GR7AAQgBRTUU3o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a04948ff-f22e-4fc8-e138-08dc51e31297
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:31:29.2799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gv6CDsvmxN5IYY3wVduFX1VUinQ0bnEUrBIceReW5R9nF2N+7KaBt8gJbVBNDYVcq4vwezZeZjyLMDIxY3TXjvuIRudyfK/jfnlCNJZj3hk5sT2RjJd09jAQOhqEwugQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8258
Subject: [Linux-stm32] [PATCH v2 07/16] ASoC: samsung: Replace
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
 sound/soc/samsung/odroid.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index 110ae14dd7ea..6cea197d62e6 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -171,25 +171,24 @@ static struct snd_soc_dai_link odroid_card_dais[] = {
 		.name = "Primary",
 		.stream_name = "Primary",
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(primary),
 	}, {
 		/* BE <-> CODECs link */
 		.name = "I2S Mixer",
 		.ops = &odroid_card_be_ops,
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 				SND_SOC_DAIFMT_CBS_CFS,
 		SND_SOC_DAILINK_REG(mixer),
 	}, {
 		/* Secondary FE <-> BE link */
-		.playback_only = 1,
 		.ops = &odroid_card_fe_ops,
 		.name = "Secondary",
 		.stream_name = "Secondary",
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(secondary),
 	}
 };
@@ -278,8 +277,8 @@ static int odroid_audio_probe(struct platform_device *pdev)
 
 	/* Set capture capability only for boards with the MAX98090 CODEC */
 	if (codec_link->num_codecs > 1) {
-		card->dai_link[0].dpcm_capture = 1;
-		card->dai_link[1].dpcm_capture = 1;
+		card->dai_link[0].capture_only = 1;
+		card->dai_link[1].capture_only = 1;
 	}
 
 	priv->sclk_i2s = of_clk_get_by_name(cpu_dai, "i2s_opclk1");
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
