Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A08888D0C
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Mar 2024 05:38:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E4CDC71291;
	Mon, 25 Mar 2024 04:38:01 +0000 (UTC)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2088.outbound.protection.outlook.com [40.107.114.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9A9BC71281
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Mar 2024 04:37:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZnz4YR1kchdED/3yGozaZWf8obaJ+J51qAlOrpDglQVWVYzn6kMnOERB9RvU8AWIifuYwxbJug6a4+q786cGgpazdbDB/JnT9u9PBpD6Z94CGB3QOAq4JH7I49AVns1na9Oidy8fnYVI5YJ8nfynRUnITRl7NUbd0EwJyH364iZLz+eqvgKt59UpMGBvYHhAo3sxVDMZo9gWWw2RhvvS5Pa7MqOWypGiuA1bcTVO1nXMuY3IiAchikBzbLVz4JVrIItrxGRW/6DITkUzrokpPQ+Wg7S8QfFYylhGZAC6nkW33A1K1nHCEenlfDSy2gUoXu11HYEAiubS3/CgsqQmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HlOFxPxKO2wA/dWtXNXj8uOoXnuofD1DcjZ3LMBNpbg=;
 b=GEvPjA9obtsOHJAj5jgIXBt7HvTVneoh8UDy4NLC/jr4nw49WJX61uDDKTTOXbcEtaWKsuFGWlpuqf8GMhd58jHKOdaIQdmeTIA2+NiejO4LSsuJzSeyEfZNxvEfFV36sUYKuqfJ30aDP4ALtca5jrVqdBcngLyGpC2U6DWDEOKmo7DmpDb42xNyKXxsiJUToefaQJ6hbtOceuVTFy+uV1IWeJxEhDbJvxcAGJ12vLRpJgKFNCDvP/PNMtyICkIF5ZYLzxOGPF9lq6nv1nhIL1ygSk2gCtY11N44MClrxF2h4C43VXLxUXQuQLYlJstFKZkervWyrMugJiGRDap6MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HlOFxPxKO2wA/dWtXNXj8uOoXnuofD1DcjZ3LMBNpbg=;
 b=ee0NXD/sn2/JB6UxjE/vLDcgE6JT3zSRp3cDj6WDWZizCoEc/75R5tBTehaSJd62J27m1NBJgi3S0W+VZR6qVeYVygn+tnpO16UgdP8A9LV+oRRa9J0VZomQp+0iWdxxLG/ZLVPSHywja92vBAztlupKLS7JTk6Tj06rXYM4Pck=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6829.jpnprd01.prod.outlook.com
 (2603:1096:604:137::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.30; Mon, 25 Mar
 2024 04:37:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 04:37:56 +0000
Message-ID: <8734sf53kv.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 25 Mar 2024 04:37:53 +0000
X-ClientProxiedBy: TYAPR01CA0173.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6829:EE_
X-MS-Office365-Filtering-Correlation-Id: cf172fed-937e-41cc-b4e9-08dc4c855779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KOKoE0WF3ED6uf3lwHPBrrF8YJxnOfSPkbPs1n+2Vzz1UoFVJqElbB+4oAgMTU+YHy4pz8lidSpacGpTTcI2HZLc6ap4/WAEPSGfdIT1NSvTra5NMvHHauQWS8oSUurPK+CfQXr8Cv375f4e4Bnd2K8TWoZfbdqjLx1GCa2FlgWSkw0WlbdW6gQ88Wuw+Az2fXSibpQL7RtE1Xmi3sMrbgfucM2ZmHi3uqBKw2V+/PAIGpN2tc+/fPy/HbP5uwu5dUDRXFi4mp8I8G2JZyoQUCD3U2NyOXP3H1Qoik2EMuxHCJ06PbyDNOF/gq122BRDNmvtGIE8Eu1lY8Kp5XToncWBlruKzlJvsl99L6lGHBTAnprKUrex22FN2vGq8/1rhdP/q+RMAicQxC2xV8AZQ/qs3al64r6GLUvAxbW0hpZFX+G8YY2Pf7jFXhih2iJ0mGxxtAQMfaKiEB2DrK5suKXpQYH85t0mMPeEbSYkvt4hfHDaG4HPfvZnHh/rJgz0bD7g1/IRoNeg5S2IhLS3ytfq0S/k25JigGYjV/jExDZyL801EEG/PdPjlZhFVgmLVRniF21ravV/m3s0WySaIELFThQyyAqPgVt7RF+DbxJVr7TubyazNY+JPylpl3YuyEvP5efB199hQJxZhVgfLihK5zLCK3gdb+WjV+/UXMac1eE8lzlyO/oFEfN2f+AP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(52116005)(1800799015)(366007)(921011)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-2?Q?EqgNcbkiKc2pNFW8dBfMinx8OOPCi8S7708gjIOQa0WFpGrj6UIReLKyuf?=
 =?iso-8859-2?Q?DIoM2U8nQ8hBK8o5EFBlQXwttXoWFXJn170jJOZPhU6i38Cj5YltcpyUMH?=
 =?iso-8859-2?Q?9YKZWi2tluTL292XyX+bpQsUTh8RNUpKw10mSdq7+G0Fe/QeJ84E1pDuXH?=
 =?iso-8859-2?Q?Oq7GSB9IPIILU/sOX+M4K/SEFxbvbhbl0+Ru/6px81ut/25vZ0LqtsEVX3?=
 =?iso-8859-2?Q?8K/VPAe7lU2HEhlbSX7k7qdyAAq5CPmdTQc/XfWQlM7AeUcHvgs+iY3mGV?=
 =?iso-8859-2?Q?l8r1z7YHtOOGhTntBL5Lm8H4PrnOWBBjaA3Kx1xHIBpimTUhs12kpdjmi7?=
 =?iso-8859-2?Q?8kKBTk5ExESXyeDXSZsgYKjfXiCMxAaYRj9cgMQxPLTNnCL9bJXfoQUrHy?=
 =?iso-8859-2?Q?vpacdNc8UGnBegkSKbCcmQ8V+WcGv6f9qUMJe4Q+3IgII9Rp9j74E8usrq?=
 =?iso-8859-2?Q?xmaEUVSVEPoC7t1P57cBSKf0jIa0FZm91ZzkIQZjTH/+Su0iRkCbY2nQZS?=
 =?iso-8859-2?Q?eXMYOLEMw5AN8uXbGlW6KlwGxjROopUX6VfLAs6UpeZ87sKMCSN8coALtQ?=
 =?iso-8859-2?Q?NqqTp3ZSk3Z4wrfcnY1hBy+u6d8kiqGosm+CUQ0lH+70cPVxgsmgq/hWnv?=
 =?iso-8859-2?Q?lQLaHpOfjjbYjG6AKuCcvg1iCW2qfWck/xZGP60jewe9L6syZ0q+N8Bnw8?=
 =?iso-8859-2?Q?momUETaBkVRU+4pZvWfUO7dBktKCL0nMb5W4gk5WcKWHdlh7I+WOTHzDLm?=
 =?iso-8859-2?Q?MibGmXi2gkjk+tTdKZEcx+5ztR5e1PwsM1O5CsHwC+ncMydw+7DoBxvpf5?=
 =?iso-8859-2?Q?MZFUNQudUAGIDaGmGPaPF9q3w4TiGPlhoeadbwN1sUAAbAtDEnlhm11Cgg?=
 =?iso-8859-2?Q?47HX8LKDUL3BbISbHUQ3xbBbal0VChxsbMKihxSEXtajF4Wa5xNGrKNgCJ?=
 =?iso-8859-2?Q?aFFZGdrf/yde/FtEIh0s+vGfliM5O4cN13ntazxM7056QmMdwn7r1VFPU5?=
 =?iso-8859-2?Q?spjUn6qOMBpMazWG8Kd6ToAMriLK5JXM+BPbCjce3nuGqeYr+5mfmLSBNY?=
 =?iso-8859-2?Q?yeGJVuHCvYfkf660iVznB/0D+wUq+xOfnkKOcOtomp7RrEAq0LYFBe/dkT?=
 =?iso-8859-2?Q?P8Qem8cyf6Y5vF8bHH0WGFDGn9BMjh8YCs6y8YhJVhJGuQLEKZKPmUakVN?=
 =?iso-8859-2?Q?tDxVnBykHHnENh/8rvJ347u/lDiGxu4CHnZLKSvrab4GdW6vloZzkG+rGF?=
 =?iso-8859-2?Q?+OCG5BbClu8h9X1AIVElRx52NTAn/XowyoNgUozPvAp9scMm/hdveo0cdw?=
 =?iso-8859-2?Q?QS1eBBqyq85tSEC4DMyxd53wr4zHWqpQJtrGmOmZo8tztlz2PccSdIg13/?=
 =?iso-8859-2?Q?4RGui4ffJMHg87JOzjJevdfrHC3RithSoO4MZbjQlnCnsioYCo9Mjw6Shc?=
 =?iso-8859-2?Q?el2F8THyNimE7ixBBXJ1gErZZpoV8h90GWm2Q0B4oxi6qXEMH2oObfxED1?=
 =?iso-8859-2?Q?ErCpkTdAKKdUUkAkYmazO4nOdNBZz5RHozzsEYrRU59i6fKdobPCdMOb7P?=
 =?iso-8859-2?Q?W/gN7D8vSXknTsQre4RzYpGx1JrmdOgejocLb25KUXOPt81ZW2mG3GWL9D?=
 =?iso-8859-2?Q?cxKq1Jok7o9iUYt06ktI8sqFlPOpfd/Hzudh04HqSNlWfOFUUkfRL7jB+D?=
 =?iso-8859-2?Q?8Rht3DMvRH2IH4LHw4U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf172fed-937e-41cc-b4e9-08dc4c855779
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 04:37:56.2773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRs4fc1R/h6GOrMNssfn/f86ImRPfYjxzxQ4QlliA9spy4vX/O4jx07e6BfQG0McLs/rgYVvjH0hPaqUDl4CM+7SEgzxrePTLKTEa6QqMahKPuhSc44qs2FZq+nAYfti
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6829
Subject: [Linux-stm32] [PATCH 15/15] ASoC: soc-pcm: indicate warning if DPCM
	BE Codec has no settings
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Historically, ASoC doesn't have validation check for DPCM BE Codec,
but it should have. Current ASoC is ignoring it same as before,
but let's indicate the warning about that.

This warning and code should be removed and cleanuped if DPCM BE Codec
has necessary settings.
One of the big user which doesn't have it is Intel.

	--- sound/soc/codecs/hda.c ---

	static struct snd_soc_dai_driver card_binder_dai =3D {
		.id =3D -1,
		.name =3D "codec-probing-DAI",
+		.capture.channels_min =3D 1,
+		.playback.channels_min =3D 1,
	};

	--- sound/pci/hda/patch_hdmi.c ---

	static int generic_hdmi_build_pcms(...)
	{
		...
		for (...) {
			...
+			pstr->channels_min =3D 1;
		}

		return 0;
	}

Link: https://lore.kernel.org/r/ab3f0c0a-62fd-a468-b3cf-0e4b59bac6ae@linux.=
intel.com
Cc: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index ac42c089815b..9a54d5d49b65 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2796,7 +2796,6 @@ static int soc_get_playback_capture(struct snd_soc_pc=
m_runtime *rtd,
 	struct snd_soc_dai_link_ch_map *ch_maps;
 	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
-	struct snd_soc_dai *dummy_dai =3D snd_soc_find_dai(&snd_soc_dummy_dlc);
 	int cpu_playback;
 	int cpu_capture;
 	int has_playback =3D 0;
@@ -2817,24 +2816,37 @@ static int soc_get_playback_capture(struct snd_soc_=
pcm_runtime *rtd,
 	 *	soc.h :: [dai_link->ch_maps Image sample]
 	 */
 	for_each_rtd_ch_maps(rtd, i, ch_maps) {
-		cpu_dai	  =3D snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
-		codec_dai =3D snd_soc_rtd_to_codec(rtd, ch_maps->codec);
+		int cpu_play_t, cpu_capture_t;
+		int codec_play_t, codec_capture_t;
+
+		cpu_dai		=3D snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
+		codec_dai	=3D snd_soc_rtd_to_codec(rtd, ch_maps->codec);
+
+		cpu_play_t	=3D snd_soc_dai_stream_valid(cpu_dai,   cpu_playback);
+		codec_play_t	=3D snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PL=
AYBACK);
+
+		cpu_capture_t	=3D snd_soc_dai_stream_valid(cpu_dai,   cpu_capture);
+		codec_capture_t	=3D snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM=
_CAPTURE);
 =

 		/*
-		 * FIXME
+		 * FIXME / CLEAN-UP-ME
 		 *
 		 * DPCM BE Codec has been no checked before.
 		 * It should be checked, but it breaks compatibility.
 		 * It ignores BE Codec here, so far.
 		 */
-		if (dai_link->no_pcm)
-			codec_dai =3D dummy_dai;
+		if ((dai_link->no_pcm) &&
+		    ((cpu_play_t	&& !codec_play_t) ||
+		     (cpu_capture_t	&& !codec_capture_t))) {
+			dev_warn_once(rtd->dev, "DCPM BE Codec has no stream settings (%s)\n",
+				      codec_dai->name);
+			codec_play_t	=3D 1;
+			codec_capture_t	=3D 1;
+		}
 =

-		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_playback) &&
-		    snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK))
+		if (cpu_play_t && codec_play_t)
 			has_playback =3D 1;
-		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_capture) &&
-		    snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE))
+		if (cpu_capture_t && codec_capture_t)
 			has_capture =3D 1;
 	}
 =

-- =

2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
