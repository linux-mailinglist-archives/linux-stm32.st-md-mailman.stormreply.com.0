Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D716893688
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Apr 2024 02:31:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27729C6C83D;
	Mon,  1 Apr 2024 00:31:10 +0000 (UTC)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2101.outbound.protection.outlook.com [40.107.114.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1177BC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Apr 2024 00:31:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7p2A5uZr99OPoYNyqh8RFdS8hshN07jHcr6GXn0dLXtP2IbGdMde5T9GkBPaRciYxOcyH5w5UeZteNu+SaCX2Gvkf3no1ED257DVumQlFmfQ/10rik8MJwErcRQnU6NxpJHM3D5uWVH01sN+qHX5ftSjH07urIBl2VLdDzy5eDbrgTpJfilHa74emKfbVRv9rK7bGFapNUPxiShJM2ZUAr2A+XaguCcWCe574tht0gZHE6MijaIGV3dJRm7hCiJ6adTIbbMIUv12YFCMN2fcBSPg+3bQSah1mBfx4dku6Tk9ErqHcSo2dGV/zpYb6RW9LihvcK/dxU4R2lx+Zy5uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKzwwxP/L3scvwNLFIwZ2rhzmgTq2q83UIQ+nVP0lTo=;
 b=IbZnn3L6Y/XgWJ2yP7CDKE7C+6T2Bz/VIc/moAhLJkT48NFW//PVHImDCWEXL3isw6XQgarNyPrYFaILQw6wh1+joFqVRNjeJ/CrXNWqfG81CcGx36rJI00XPi9V8O1UyByF5NfEzT0EOQFAOnR3UuPC0c4DtfYilWmks8llOT4Ictc+B4Mu23a5Ndr7pWJgcxdIAY3gmA/8c1H2hjxe2uyaOpEN2+PETL3SED8nCPGn0LAg2fFVZoR7VIDNrxGU+1ouijeqrYoZYdSZZCuXuByBkxohnhct95NpqTZTEs0CTSvnW+wloPpGCY7wzmi2Lw8DkXUN3b9iwacPprwLOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKzwwxP/L3scvwNLFIwZ2rhzmgTq2q83UIQ+nVP0lTo=;
 b=JhLutqfp4hYxTuCgnyuNt9EQwIjU2yOsLHWhmNR1BnLISUuAaYYu4aU9T1t0RF0f/XlpiH3c6VxZTV1iXr0SepUMWwCX2vOjNOPg+dSNUlIz64YXH8LmXWNY3rQmXlbg7D3piRUKX0tGWRsZ8ghy81L0w5cSKrrppc8fKZv0T18=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8258.jpnprd01.prod.outlook.com
 (2603:1096:604:175::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:31:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:31:02 +0000
Message-ID: <87v851udo9.wl-kuninori.morimoto.gx@renesas.com>
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
Date: Mon, 1 Apr 2024 00:31:02 +0000
X-ClientProxiedBy: TYCP286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8258:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U6UZVdKkSr3ofgZWDWecNKFNnkmfSkT50yuA/f9eh4UsdmDc3yu8XYPSJUVOPri4ELNNmRRQXSblzdgeYqLnU2xoDmaG91wi1XPtN+6kbRVpQ4JRIclrWkN5ii0S3LEBy0WLl2sCTJV1tIQqChYcl5thUyobEXNtkrocDttnIm0Fy999A8LZuJ01DsRGOM0JlstDXI97AwzoGCy+Stu3MuqwXKypsbD7bTTN8sjjPfsRMgwbmqxZg02L9uza/ckEPPFUxtnM8U5XqZSsCTjb25d6klBcndSsOHPYz6G0BC1s/ZTFCAVRcVMACMePPGu0P5NVo4e6BWGP89XrLMfBifhpRGTSeAp/FU4i6KkkCUdHQJA29RtZNb/Cpuso4OQUzgWMbabPWl+DQ/lSKhRsv451W5ZqtK/dNwOmMReKooeGdENVFZCa65TYHw2jT21dxtJZiclFsqgy4els6h4SiAQHhBkxgCQpCRGQt2SlSzEurbVzbMlSmlFr1OwAaG5PN7iIJXTHprtQdE0+q0A2eABO2zO70HyXtpgknTqcFJuXme39pu7g478tPucXqhXLn+ETjg1MxWL7sK3tgbItHTkDw/RSkRjQQaV7XitlxTb0mvY3UBKWMYzpp1R20Zf44IVt7DvV/9EWtShIbiCpY+0QTH5LMeflaImxSQsgmzKg0SgC+E7E/+cu3FhjLlHnQHzWeggRv304QYkTqdVFJSxHSbtxHVCpTOJKbg6AFQ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(52116005)(1800799015)(366007)(921011)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+4+8GDXgckIsfh97SKVRZFgDrzqWTg41HbboceX5fQ5FNNmC6UL/umjra92k?=
 =?us-ascii?Q?M+ypwuR1nzBDi40NDKj2U30uFl5uo5fqUw53QvV0TL13Xq+jJ/t6N/jCleI/?=
 =?us-ascii?Q?JHkg3nPvyhUWa7xBLKHhon/Qn+VVcxdsx6lJT2exLgQbSnkBeCNohn9T5LRd?=
 =?us-ascii?Q?7wyEh4S/+4IEu2K2qynb8pV5KDKMl9KHRIw4FtNu9bZWUu3QmAVD2s1UNwiI?=
 =?us-ascii?Q?JxyskmGfwUMBT9aF770Athq9tCUkPdLxO/GvxHGfA0xlqq7iczWfVlNXUQXi?=
 =?us-ascii?Q?0DLabzM1a2TwD0EtfCVTwn1S1ZZqk32pGRYSWY7HZCF6zGmnwJ7fIRGsSNkV?=
 =?us-ascii?Q?Nz/nY3wSlOITq/9b+Emfuylc0BisIsPDX0Gv+eyw22QOYAXG+UEyhOvYutUh?=
 =?us-ascii?Q?arVRjFVyDmsqvnwddT/vzWTg+TfUkqAwJDa5YZqRBPmtQoSXK0S5TdZBe2nV?=
 =?us-ascii?Q?ZX86eEUOm0O9eDDIzsuAOUSuBU3GDh8G6zskfuUk3qhFREzzXTpv/j5zKhyD?=
 =?us-ascii?Q?2+EOEB5qG4aKoN1xRCtF6qQlGZiTokqr8UOF/RUiyDIsF3NYXgRx7k5xS1Gh?=
 =?us-ascii?Q?Qu4Gvp4BUVvtgFCcJuTk/nDSmch0sbIp93e7Qs+JXRV2Y4+hWrMBiAYEzEeW?=
 =?us-ascii?Q?8ivet1AM/VZ2LzV5OYJm9aUq3NTKTMKLeiECL814bWo730QqvXLq65YkGDzJ?=
 =?us-ascii?Q?lZBjz1QK4MOe8Lg9z8fFosuIZu0w/yOC82MBOWOOdaJ/VR0fzew1WqjElk37?=
 =?us-ascii?Q?+kRHhgNzQvNbwpWrYVJHPLp0cn0vKIA+0j2P0V/q7Fj5C5lP7nRtha0+l4Zr?=
 =?us-ascii?Q?1p118mDJ2EE6Ka1RC/P4C4qF2R3Qgl6JsUPWjH9nnCkg5GSXMl16AtrxrWDw?=
 =?us-ascii?Q?xh/wM8p1oO9vyKWTx9Na7O/mWzi9I+e18ALkhMdf7AhWLlxOXZnchiccZfEm?=
 =?us-ascii?Q?+g9c+V6cRPC5g2d8LIRluw5ittYypcgJJ9tjLrT68mRpIfd7P4RGOnl5vVCR?=
 =?us-ascii?Q?zsyePfDmq6D88hGsYpHSupQZHIdlVTrGByB6XTNuV2yJUwsjvb2Et4Nz1ReS?=
 =?us-ascii?Q?Hp0MKyJz8bTmoJ9Y+CdSyOZz3i8Ity0KDj/6sbWtBThMOB4VfHvGDoFjaEiX?=
 =?us-ascii?Q?iTD2z+CBOrMRMLazioMNTqYTd6TyUFujkmU/Btirj8Tm/h+f2XTjOx9Khs4l?=
 =?us-ascii?Q?XKmRwaDrrUEpQIp06Uv5XWjiom4+6pbIB1oG4PBDVoJZk3rC84gXg73pXhEz?=
 =?us-ascii?Q?i5FLYQyUV/dy+1ochhVaMJL6lK/AP7DVb6Qp0aqn/Zm9xxjfq2c8TSTBAygx?=
 =?us-ascii?Q?XeiM1Pmn0lRcYpZBf8AhdJm0Hq10hEeqMvuY/JrrGTPvGBedmor83KiPAor1?=
 =?us-ascii?Q?ugudMhxlDGakpMiwXNY+91Mr3xjxiEpG0H1tIlKYjDS2gTMvttJlIXtdj3lW?=
 =?us-ascii?Q?zo5O4sbRb1aXzW/z9qeC4K05GPwN1NbuWh9DL70KnJAJXMUSjrbSqwBCj6LY?=
 =?us-ascii?Q?tJdD7GXaj7mOCxsjxqcHEZBLf2PLifrsK4hDOPcTjdCTJsFwG9hW5I0NGJ4b?=
 =?us-ascii?Q?egGnK3eXSkcrjjKlfLsPrKUkC4pz9r64M4b7wI08WvguEThDztE53umCOGjW?=
 =?us-ascii?Q?R8jO7A3RQkALQ5oHW5KgFj8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 683abc33-aa7f-4e03-f6cc-08dc51e302d7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:31:02.8347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1lQSyHLqj04XlF9Ofu7fLJQmIbL88LNjCiJUV6PCyUVFtRtMjfwO1tXvs4SrBDdUff5xKOaz4/jstFAmlph+QF9InjjJskBcFu5BTE9teNtqCzdkAIz1A3SgPqrCuIK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8258
Subject: [Linux-stm32] [PATCH v2 03/16] ASoC: fsl: Replace
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
 sound/soc/fsl/fsl-asoc-card.c | 16 ++++++----------
 sound/soc/fsl/imx-audmix.c    |  6 ++----
 sound/soc/fsl/imx-card.c      |  4 ++--
 3 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index bc07f26ba303..060514743ca0 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -319,8 +319,6 @@ static const struct snd_soc_dai_link fsl_asoc_card_dai[] = {
 	{
 		.name = "HiFi-ASRC-FE",
 		.stream_name = "HiFi-ASRC-FE",
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.dynamic = 1,
 		SND_SOC_DAILINK_REG(hifi_fe),
 	},
@@ -329,8 +327,6 @@ static const struct snd_soc_dai_link fsl_asoc_card_dai[] = {
 		.stream_name = "HiFi-ASRC-BE",
 		.be_hw_params_fixup = be_hw_params_fixup,
 		.ops = &fsl_asoc_card_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(hifi_be),
 	},
@@ -648,8 +644,8 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-tlv320aic31xx")) {
 		codec_dai_name = "tlv320dac31xx-hifi";
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->cpu_priv.sysclk_dir[TX] = SND_SOC_CLOCK_OUT;
 		priv->cpu_priv.sysclk_dir[RX] = SND_SOC_CLOCK_OUT;
 		priv->card.dapm_routes = audio_map_tx;
@@ -675,15 +671,15 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->dai_fmt = SND_SOC_DAIFMT_LEFT_J |
 				SND_SOC_DAIFMT_CBC_CFC |
 				SND_SOC_DAIFMT_NB_NF;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8524")) {
 		codec_dai_name = "wm8524-hifi";
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBC_CFC;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->cpu_priv.slot_width = 32;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 2aeb18397bcb..8fbd6fc8af76 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -258,10 +258,10 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		priv->dai[i].cpus->of_node = args.np;
 		priv->dai[i].cpus->dai_name = dev_name(&cpu_pdev->dev);
 		priv->dai[i].dynamic = 1;
-		priv->dai[i].dpcm_playback = 1;
-		priv->dai[i].dpcm_capture = (i == 0 ? 1 : 0);
 		priv->dai[i].ignore_pmdown_time = 1;
 		priv->dai[i].ops = &imx_audmix_fe_ops;
+		if (i)
+			priv->dai[i].playback_only = 1;
 
 		/* Add AUDMIX Backend */
 		be_name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
@@ -283,8 +283,6 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		priv->dai[num_dai + i].cpus->of_node = audmix_np;
 		priv->dai[num_dai + i].cpus->dai_name = be_name;
 		priv->dai[num_dai + i].no_pcm = 1;
-		priv->dai[num_dai + i].dpcm_playback = 1;
-		priv->dai[num_dai + i].dpcm_capture  = 1;
 		priv->dai[num_dai + i].ignore_pmdown_time = 1;
 		priv->dai[num_dai + i].ops = &imx_audmix_be_ops;
 
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index cb8723965f2f..5b7bdc5d6784 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -817,8 +817,8 @@ static int imx_card_probe(struct platform_device *pdev)
 		}
 		for_each_card_prelinks(&data->card, i, link) {
 			if (link->dynamic == 1 && link_be) {
-				link->dpcm_playback = link_be->dpcm_playback;
-				link->dpcm_capture = link_be->dpcm_capture;
+				link->playback_only = link_be->playback_only;
+				link->capture_only  = link_be->capture_only;
 			}
 		}
 	}
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
