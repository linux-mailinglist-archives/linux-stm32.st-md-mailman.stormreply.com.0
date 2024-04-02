Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 031DA89561E
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Apr 2024 16:04:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD22BC6B46B;
	Tue,  2 Apr 2024 14:04:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3A7CC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Apr 2024 14:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712066688; x=1743602688;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=B/oDAGN+zjg91RMbs4nINoQUVzqt8+57JpoK0VRIYFA=;
 b=OyOdD6XgfJaotgUwYIpk+0t6AfkCE/1yzLuoaOBVDCJ/fpWuFs+VcO4p
 WVsBCK4J3bAg+6UWwDBDFh84QXxNCN7vL47/Pct4MwbR8+Zm++EMs0zzF
 BUZkUDWHFX3L2NckgW/TyBCe/GAgRTugV3qHQnO3053PmOCUVv9R1O0iU
 SF28KQbqkFm1P/LEyl8g8pw+HWFSI/qGb1NB8I+pbQPvTQAsTw+akFglh
 zzYfJli0WtpsgFmEfvGLWXxN1rxkGEGg3lEN7YyFJMfmtp9oHE+YHffT7
 yQ2Vhymed8y4Eiqmz7ccj9gpvNP6MuEj9reAAsG+dAkIXG4KwTbxC3dJU w==;
X-CSE-ConnectionGUID: BDnsrl2pSj6l8uhBYw8+LQ==
X-CSE-MsgGUID: iceSDt8KQvaSSUBlsn4PUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7079714"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7079714"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 07:04:46 -0700
X-CSE-ConnectionGUID: j631GgZBSPWk9Tr6MaUbvg==
X-CSE-MsgGUID: RS3FGhSFQRC5DVEGrLhdJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="18052994"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 07:04:38 -0700
Message-ID: <25c75790-3866-4e48-bf66-b5406df6e707@linux.intel.com>
Date: Tue, 2 Apr 2024 16:04:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
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
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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
 <87r0fpudnq.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87r0fpudnq.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [Linux-stm32] [PATCH v2 06/16] ASoC: Intel: Replace
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 4/1/2024 2:31 AM, Kuninori Morimoto wrote:
> soc_get_playback_capture() is now handling DPCM and normal comprehensively
> for playback/capture stream. We can use playback/capture_only flag
> instead of using dpcm_playback/capture. This patch replace these.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

...

> diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
> index b94835448b1b..34a9b2e52451 100644
> --- a/sound/soc/intel/boards/sof_sdw.c
> +++ b/sound/soc/intel/boards/sof_sdw.c
> @@ -1151,8 +1151,8 @@ static void init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links
>   	dai_links->num_cpus = cpus_num;
>   	dai_links->codecs = codecs;
>   	dai_links->num_codecs = codecs_num;
> -	dai_links->dpcm_playback = playback;
> -	dai_links->dpcm_capture = capture;
> +	dai_links->playback_only = !playback;
> +	dai_links->capture_only = !capture;

Above seems weird? Should probably be:

	dai_links->playback_only = playback && !capture;
	dai_links->capture_only = capture && !playback;


and while at it, I still wonder if it is best way to go about this 
change, because it causes problems like one above due to need to do 
boolean logic to know which direction is enabled. I would just modify 
struct snd_soc_dai_link to have fields like:
int playback_enabled;
int capture_enabled;
which would be far more understandable. And if we don't want to have two 
variables then perhaps something like:
#define ASOC_ENDPOINT_DISABLED BIT(0)
#define ASOC_ENDPOINT_PLAYBACK BIT(1)
#define ASOC_ENDPOINT_CAPTURE BIT(2)
#define ASOC_ENDPOINT_BIDIRECTIONAL (ENDPOINT_PLAYBACK | ENDPOINT_CAPTURE)

struct snd_soc_dai_link {
	(...)
	
	int endpoint_type:2; // see ASOC_ENDPOINT

	(...)
};


I like the idea of removing the duplication of variables, but if we are 
trying to simplify things, let's try to not complicate them at the same 
time.

Thanks,
Amadeusz
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
