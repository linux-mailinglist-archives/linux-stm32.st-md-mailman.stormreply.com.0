Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B588896F46
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Apr 2024 14:50:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6907C6B47A;
	Wed,  3 Apr 2024 12:50:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAF6FC6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Apr 2024 12:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712148630; x=1743684630;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=D/FfpbAsiof89LgUZ4/UlHEJN8aXS0QySDUDCd5cFgU=;
 b=Du+NRsOH5ql8p7ayHhZ6wyorMYsnwPhif00iTy9ogDuKOd8rp84dg5jx
 9Rkvv542N/hQ4DBxlxwMA2WXKMZeW8o4megi0JpyjP06i5GBjfS2nePkv
 XtIhPAsTbeakAr9T4uSqDhdCl/elzPtBY1C2MXOAdR4vvH4kDqog/IfQb
 w3Tq+Tda8KvLRDRRiLx8JR/xr+5liw8Nsy8sk7aZaKXbrXwGO7mZ9DhV5
 cmM8LbKNsz90zFX6S6z+PB81qM1jzFqhwzqmemhC0yN/JMLGD0l2Zat+2
 fXlN5KlJEYVHhEySvbH/keYfB00yY5Usk97N9gFhMJxNmRhYCqA2XkoYk Q==;
X-CSE-ConnectionGUID: mJppNFSaQ/KAkX5DatZvWg==
X-CSE-MsgGUID: w8JRCVdfQCeN6g1JwlbO2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7539344"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7539344"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 05:50:28 -0700
X-CSE-ConnectionGUID: /D+wW3RkS/a6+yA0ZGswww==
X-CSE-MsgGUID: J/jGeT/nQbCMDRSoTLK5iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18343238"
Received: from makulkar-mobl1.amr.corp.intel.com (HELO [10.212.52.18])
 ([10.212.52.18])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 05:50:26 -0700
Message-ID: <2cb2f96f-836c-4816-86f8-2262c2dd1ce3@linux.intel.com>
Date: Tue, 2 Apr 2024 09:09:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
 <87msqdudn7.wl-kuninori.morimoto.gx@renesas.com>
 <1a42ebbb-1e1f-4ecf-a1ec-7af292f7ff96@linux.intel.com>
 <871q7o8y0d.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <871q7o8y0d.wl-kuninori.morimoto.gx@renesas.com>
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
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
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
Subject: Re: [Linux-stm32] [PATCH v2 09/16] ASoC: soc-core: Replace
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



On 4/1/24 18:27, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis
> 
> Thank you for the feedback
> 
>>>  			/* convert non BE into BE */
>>> -			if (!dai_link->no_pcm) {
>>> -				dai_link->no_pcm = 1;
>>> -
>>> -				if (dai_link->dpcm_playback)
>>> -					dev_warn(card->dev,
>>> -						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_playback=1\n",
>>> -						 dai_link->name);
>>> -				if (dai_link->dpcm_capture)
>>> -					dev_warn(card->dev,
>>> -						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_capture=1\n",
>>> -						 dai_link->name);
>>> -
>>> -				/* convert normal link into DPCM one */
>>> -				if (!(dai_link->dpcm_playback ||
>>> -				      dai_link->dpcm_capture)) {
>>> -					dai_link->dpcm_playback = !dai_link->capture_only;
>>> -					dai_link->dpcm_capture = !dai_link->playback_only;
>>> -				}
>>> -			}
>>> +			dai_link->no_pcm = 1;
> (snip)
>> It's not clear to me how this is related to the
>> dpcm_playback/dpcm_capture removal.
> 
> In my understanding, if "dai_link->no_pcm" was 0, it sets no_pcm and
> convert setting to BE. If no_pcm was 1, it is BE anyway. So no_pcm will
> be 1 anyway after this code.
> And then, dpcm_playback/capture is no longer needed.
> So it just set no_pcm = 1 here. But am I wrong ??

The problem is that the patchset is supposed to be only about removal of
flags to align on one set, but then we also have "simplifications" or
removal of checks without explanations.

It would be far less invasive if we only replaced flags and had
iso-functionality. Then we can discuss the merits of simplifications.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
