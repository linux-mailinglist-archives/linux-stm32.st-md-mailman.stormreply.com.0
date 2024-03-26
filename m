Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 737B188CE50
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 21:24:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A49EC71289;
	Tue, 26 Mar 2024 20:24:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9933EC71281
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 20:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711484669; x=1743020669;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=3/laPbw4dZzLc5cIWlMGtQPK7sjd5djD9WWYkPnEIy8=;
 b=Sw6xkQCrv3jTusVaCVlRuai/AhncRBzSwvjzCDfaPLP54uBjDh0LOxp7
 sX2Sl5cyGAaYeKjGr+4TGFKH7MYZUcEQVSN4jKVGLW5p6izuOqbQZlRFS
 ZFQhwoSKwKfEaD/ChkR1ZA2q0WrClJBmMQfUeTG+yGl/T9qmpJm77sJxX
 vYKupryj1l+Ed3OlRRD6x5xs73Hyoe2puP7zD1pLsLQ/urXVzSmirHxsJ
 rtmijBPGzVsjPpzjl34zrGkzCfSM40+fGrC79ztICoDxVxQqYRXTdp3UQ
 eM0HyZagtrBQZ6zK+AEBD5F8bWGmhZ65nc5fYbXL03JDWQYIn0kSXQXyM g==;
X-CSE-ConnectionGUID: MOA3pOF/Rm+KSSkglWH1gw==
X-CSE-MsgGUID: foRzDDypQWeRcZPYOC4izg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17946354"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="17946354"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 13:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="20716653"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO [10.212.65.108])
 ([10.212.65.108])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 13:24:24 -0700
Message-ID: <1c437229-cbc7-4e0c-987c-9ca31800a572@linux.intel.com>
Date: Tue, 26 Mar 2024 15:24:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
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
References: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
 <87frwf53mq.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87frwf53mq.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [Linux-stm32] [PATCH 06/15] ASoC: Intel: replace
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

Hi Morimoto-san,

> soc_get_playback_capture() is now handling DPCM and normal comprehensively
> for playback/capture stream. We can use playback/capture_only flag
> instead of using dpcm_playback/capture. This patch replace these.

This patch no longer applies since Mark merged
"[PATCH 00/21] ASoC: Intel: boards: updates for 6.10 - part1"

https://lore.kernel.org/linux-sound/20240325221059.206042-1-pierre-louis.bossart@linux.intel.com/

The odds of additional conflicts are very high due to the number of
queued changes in machine drivers, I really don't know how we're going
to find the time to solve those conflicts and test experimental
versions, while we're also busy checking the 6.9-rc1 transition.

In addition, I have a bit of heartburn with the concept of flipping the
logic from a clear description of playback or capture supported, to an
implicit 'both supported unless stated otherwise'. We are going to miss
some cases and have regressions, it's pretty much a given.

And then there are cases such as the following examples

> @@ -496,8 +494,6 @@ static struct snd_soc_dai_link cml_rt1011_rt5682_dailink[] = {
>  		 */
>  		.name = "SSP1-Codec",
>  		.id = 6,
> -		.dpcm_playback = 1,
> -		.dpcm_capture = 1, /* Capture stream provides Feedback */
>  		.no_pcm = 1,
>  		.init = cml_rt1011_spk_init,
>  		.ops = &cml_rt1011_ops,

> @@ -293,8 +291,6 @@ int sof_intel_board_set_ssp_amp_link(struct device *dev,
>  
>  	link->id = be_id;
>  	link->no_pcm = 1;
> -	link->dpcm_capture = 1; /* feedback stream or firmware-generated echo reference */
> -	link->dpcm_playback = 1;
>  
>  	return 0;
>  }

> diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
> index 6eb5a6144e97..c7cca3e47ed9 100644
> --- a/sound/soc/intel/boards/sof_da7219.c
> +++ b/sound/soc/intel/boards/sof_da7219.c
> @@ -296,8 +296,6 @@ static struct snd_soc_dai_link jsl_dais[] = {
>  		.id = 0,
>  		.ignore_pmdown_time = 1,
>  		.no_pcm = 1,
> -		.dpcm_playback = 1,
> -		.dpcm_capture = 1, /* IV feedback */
>  		SND_SOC_DAILINK_REG(ssp1_pin, max_98373_components, platform),

where we lose comments on what the capture stream is. That's not so
good, we added those comments on purpose to explain that the capture
stream isn't a regular PCM format, I don't see a good reason to see them go?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
