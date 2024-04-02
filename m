Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31363896F47
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Apr 2024 14:50:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF540C6B47E;
	Wed,  3 Apr 2024 12:50:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FBC3C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Apr 2024 12:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712148632; x=1743684632;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Yd/6Gbpag1vTI2OOLqRqO6ZI0sVmA5/QE1SmwNXPKsI=;
 b=eQMTcRvpNBjMqt2CVpGc5su+zcGvx99RUA7PwZljqY/uekjQHw0WeTV7
 4/Lg6Qi0Hj3sBNyCSt1MIrpuZjDZoNpuRQbPTHjUorjynzNO8zyVIlU6V
 dRNnV1HZTUepDpIohxrHWmQ/ihQP1V0rEeryuRLnMXzcZf1rRcPIpfKym
 jsmt1EbqU1L3JOwU2iT3DNXEfgaFJTiqVNIFSqzoEJpSgV+Mihl+aT169
 umIS1eYWqWztfF+o7jvALD//bEGXygkWHkauXZfhuZip3zybO3d0GwUYh
 jBCll42h5r3X+OeG08uEQsqWqHxnxD77wUNhJOEohisoJKw9foxG4Tw4i A==;
X-CSE-ConnectionGUID: 3JRdcSboR1C1FQjh0cBs/Q==
X-CSE-MsgGUID: LzYckqh3QaKE398BGOh+Cw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7539356"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7539356"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 05:50:31 -0700
X-CSE-ConnectionGUID: A39AzG6RQqGoBfvyRqzbOA==
X-CSE-MsgGUID: tuUeZuvUTk29WVSEVJrlRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18343252"
Received: from makulkar-mobl1.amr.corp.intel.com (HELO [10.212.52.18])
 ([10.212.52.18])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 05:50:28 -0700
Message-ID: <4c40b4bc-f2bd-45b7-8b14-456ddf1be94b@linux.intel.com>
Date: Tue, 2 Apr 2024 09:13:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
 <87h6gludmj.wl-kuninori.morimoto.gx@renesas.com>
 <54ace545-8cdc-49aa-8214-5f07bee0e2f6@linux.intel.com>
 <87y19w7gjq.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87y19w7gjq.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 13/16] ASoC: remove
	snd_soc_dai_link_set_capabilities()
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



On 4/1/24 19:29, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis
> 
>>> snd_soc_dai_link_set_capabilities() checks all CPU/Codec DAI (Y)(Z)
>>> for Playback/Capture (X) and checks its validation (A), and setup
>>> dpcm_playback/capture flags (a).
>>>
>>> 	void snd_soc_dai_link_set_capabilities(...)
>>> 	{
>>> 		...
>>> (X)		for_each_pcm_streams(direction) {
>>> 			...
>>> (Y)			for_each_link_cpus(dai_link, i, cpu) {
>>> 				...
>>> (A)				if (... snd_soc_dai_stream_valid(...)) {
>>> 					...
>>> 				}
>>> 			}
>>> (Z)			for_each_link_codecs(dai_link, i, codec) {
>>> 				...
>>> (A)				if (... snd_soc_dai_stream_valid(...)) {
>>> 					...
>>> 				}
>>> 			}
>>> 			...
>>> 		}
>>>
>>> (a)		dai_link->dpcm_playback = supported[...];
>>> (a)		dai_link->dpcm_capture  = supported[...];
>>> 	}
>>>
>>> This validation check will be automatically done on new
>>> soc_get_playback_capture(). snd_soc_dai_link_set_capabilities() is no
>>> longer needed. Let's remove it.
>>
>> Humm, this is really hard to review.
>>
>> soc_get_playback_capture() used to do a verification of the match
>> between dailink and dais, and now it doesn't have it any longer and this
>> patch removes the checks?
> 
> Hmm..., Maybe I'm misunderstanding ?
> I think this patch is very clear to remove, because it is 100% duplicate
> code. Maybe this mutual misunderstanding is based [01/15] review ?
> I think we need to dig it first.

I agree this looks like duplicate code, but why can't we remove it first
*before* any code modification?

It's very hard to review because it comes as the 13th patch of a series
and you've already removed similar code earlier which precisely checked
the consistency between dailink and dais.

In this function, it's a similar case btw where the settings provided by
the machine drivers are overridden by the framework, so that's another
case of collision between machine driver and framework. Which of the two
should be trusted?

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
