Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3B389407B
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Apr 2024 18:30:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF61CC69067;
	Mon,  1 Apr 2024 16:30:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C32CDC69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Apr 2024 16:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711989043; x=1743525043;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=nYxRI4YPjJaafHMZxnvW480v5rMNRirBAjGbT0asLOU=;
 b=UbV579UA3ZXDnY4TIn21dP3GTKLQ6hKncH5prd3ZHRoLFcwYvOecptbR
 ywn8Z31Rn9/fmiO+y3Qa5oHwGZ568VObcUss4mGPQGta1ml2HZcuzxKc3
 gYKS21DISapPsU+qIbPg5UiXAcEwNRDprY5vFy0NdHiz4qmjyGMBaftIp
 bp+saTO/XXWDb2GoPVDfbmbqJIJQQp7qYQQ4Q2qtPj6l1AllygTGEtx4l
 /ODgrigIjyA40qBOt55sLRT0PACh0nmeYBy+zhpVnADIUDUYQiQkxjMEm
 gC+8KsQjXUS2YTUvCGv1WGwpOOSqPwIvMuPvk/LGmepfJzX4N73z5bzKZ Q==;
X-CSE-ConnectionGUID: bdpF4G51Q56ifd55Arl7Zg==
X-CSE-MsgGUID: WXKrU2OjTm6YOghXt4s1mg==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="10083699"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="10083699"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 09:30:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="18224572"
Received: from anahar-mobl.amr.corp.intel.com (HELO [10.212.2.239])
 ([10.212.2.239])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 09:30:38 -0700
Message-ID: <b4b37541-b67f-4593-9fd5-fc6242a0673a@linux.intel.com>
Date: Mon, 1 Apr 2024 11:10:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>,
 Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, alsa-devel@alsa-project.org,
 imx@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
 <87y19xudor.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87y19xudor.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [Linux-stm32] [PATCH v2 01/16] ASoC: soc-pcm.c: cleanup
 soc_get_playback_capture()
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



On 3/31/24 19:30, Kuninori Morimoto wrote:
> Current soc_get_playback_capture() (A) is checking playback/capture
> availability for DPCM (X) / Normal (Y) / Codec2Codec (Z) connections.
> 
> (A)	static int soc_get_playback_capture(...)
> 	{
> 		...
>  ^		if (dai_link->dynamic || dai_link->no_pcm) {
>  |			...
>  |(a)			if (dai_link->dpcm_playback) {
>  |				...
>  | ^				for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
>  |(*)					...
>  | v				}
>  |				...
> (X)			}
>  |(b)			if (dai_link->dpcm_capture) {
>  |				...
>  | ^				for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
>  |(*)					...
>  | v				}
>  |				...
>  v			}
> 		} else {
>  ^ ^			/* Adapt stream for codec2codec links */
>  |(Z)			int cpu_capture = ...
>  | v			int cpu_playback = ...
> (Y)
>  | ^			for_each_rtd_ch_maps(rtd, i, ch_maps) {
>  |(*)				...
>  v v			}
> 		}
> 		...
> 	}
> 
> (*) part is checking each DAI's availability.
> 
> At first, (X) part is for DPCM, and it checks playback/capture
> availability if dai_link has dpcm_playback/capture flag (a)(b).
> But we are already using playback/capture_only flag for Normal (Y) and
> Codec2Codec (Z). We can use this flags for DPCM too.
> 
> Before				After
> 	dpcm_playback = 1;	=>	/* no flags */
> 	dpcm_capture  = 1;
> 
> 	dpcm_playback = 1;	=>	playback_only = 1;
> 
> 	dpcm_capture  = 1;	=>	capture_only = 1;
> 
> 	dpcm_playback = 0;	=>	error
> 	dpcm_capture  = 0;
> 
> This patch convert dpcm_ flags to _only flag, and dpcm_ flag will be
> removed if all driver switched to _only flags.
> 
> Here, CPU <-> Codec relationship is like this
> 
> 	DPCM
> 		[CPU/dummy]-[dummy/Codec]
> 		^^^^         ^^^^^
> 	Normal
> 		[CPU/Codec]
> 		^^^^^^^^^^^
> 
> DPCM   part (X) is checking only CPU       DAI, and
> Normal part (Y) is checking both CPU/Codec DAI
> 
> Here, validation check on dummy DAI is always true,
> Therefor we want to expand validation check to all cases.
> 
> One note here is that unfortunately DPCM BE Codec had been no validation
> check before, but all cases validation check breaks compatibility on
> some vender's devices. Thus this patch ignore it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-pcm.c | 90 +++++++++++++++++++--------------------------
>  1 file changed, 38 insertions(+), 52 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 77ee103b7cd1..8761ae8fc05f 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2793,7 +2793,12 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
>  				    int *playback, int *capture)
>  {
>  	struct snd_soc_dai_link *dai_link = rtd->dai_link;
> +	struct snd_soc_dai_link_ch_map *ch_maps;
>  	struct snd_soc_dai *cpu_dai;
> +	struct snd_soc_dai *codec_dai;
> +	struct snd_soc_dai *dummy_dai = snd_soc_find_dai(&snd_soc_dummy_dlc);
> +	int cpu_playback;
> +	int cpu_capture;
>  	int has_playback = 0;
>  	int has_capture  = 0;
>  	int i;
> @@ -2803,65 +2808,46 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
>  		return -EINVAL;
>  	}
>  
> +	/* REMOVE ME */
>  	if (dai_link->dynamic || dai_link->no_pcm) {
> -		int stream;
> -
> -		if (dai_link->dpcm_playback) {
> -			stream = SNDRV_PCM_STREAM_PLAYBACK;
> -
> -			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> -				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
> -					has_playback = 1;
> -					break;
> -				}
> -			}
> -			if (!has_playback) {
> -				dev_err(rtd->card->dev,
> -					"No CPU DAIs support playback for stream %s\n",
> -					dai_link->stream_name);
> -				return -EINVAL;
> -			}
> +		if (dai_link->dpcm_playback && !dai_link->dpcm_capture)
> +			dai_link->playback_only = 1;
> +		if (!dai_link->dpcm_playback && dai_link->dpcm_capture)
> +			dai_link->capture_only = 1;
> +		if (!dai_link->dpcm_playback && !dai_link->dpcm_capture) {
> +			dev_err(rtd->dev, "no dpcm_playback/capture are selected\n");
> +			return -EINVAL;
>  		}
> -		if (dai_link->dpcm_capture) {
> -			stream = SNDRV_PCM_STREAM_CAPTURE;
> +	}
>  
> -			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> -				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
> -					has_capture = 1;
> -					break;
> -				}
> -			}
> +	/* Adapt stream for codec2codec links */
> +	cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
> +	cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
>  
> -			if (!has_capture) {
> -				dev_err(rtd->card->dev,
> -					"No CPU DAIs support capture for stream %s\n",
> -					dai_link->stream_name);
> -				return -EINVAL;
> -			}
> -		}
> -	} else {
> -		struct snd_soc_dai_link_ch_map *ch_maps;
> -		struct snd_soc_dai *codec_dai;
> -
> -		/* Adapt stream for codec2codec links */
> -		int cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
> -		int cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
> +	/*
> +	 * see
> +	 *	soc.h :: [dai_link->ch_maps Image sample]
> +	 */
> +	for_each_rtd_ch_maps(rtd, i, ch_maps) {
> +		cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
> +		codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
>  
>  		/*
> -		 * see
> -		 *	soc.h :: [dai_link->ch_maps Image sample]
> +		 * FIXME
> +		 *
> +		 * DPCM BE Codec has been no checked before.
> +		 * It should be checked, but it breaks compatibility.
> +		 * It ignores BE Codec here, so far.
>  		 */
> -		for_each_rtd_ch_maps(rtd, i, ch_maps) {
> -			cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
> -			codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
> -
> -			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
> -			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
> -				has_playback = 1;
> -			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
> -			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
> -				has_capture = 1;
> -		}
> +		if (dai_link->no_pcm)
> +			codec_dai = dummy_dai;
> +
> +		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_playback) &&
> +		    snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK))
> +			has_playback = 1;
> +		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_capture) &&
> +		    snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE))
> +			has_capture = 1;
>  	}

The problem I have is with the following code (not shown with diff)

	if (dai_link->playback_only)
		has_capture = 0;

	if (dai_link->capture_only)
		has_playback = 0;

So with this grand unification, all the loops above may make a decision
that could be overridden by these two branches.

This was not the case before for DPCM, all the 'has_capture' and
'has_playback' variables were used as a verification of the dai_link
settings with an error thrown e.g. if the dpcm_playback was set without
any DAIs supporting playback.

Now the dailink settings are used unconditionally. There is one warning
added if there are no settings for a dailink, but we've lost the
detection of a mismatch between dailink and the set of cpu/codec dais
that are part of this dailink.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
