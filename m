Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 298F4896F43
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Apr 2024 14:50:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE5BAC69067;
	Wed,  3 Apr 2024 12:50:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 428C6C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Apr 2024 12:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712148627; x=1743684627;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4umRmk03vF9fr1bGI0vLvaFyerPGebWSjguYoGPrI8c=;
 b=k/TRCKy9+0HUbFKo8IWVPkqyF1Nn1OMHDsCKW6jNL2JF4PQIu7jLsMJx
 JxLu6gzSRVqObFO1Dy5rjQwaWoDuIMOXv3Iw27jzxS0Urw/7ZLQIrrBpI
 YNfa2UJu8ZWRkXmTzdAEVf1wcDFBvZ9EHaRKM42MItyjB2wQ4zR6Trx1D
 3Z/cwGKNd0h+muq16kT+9WuyiEcl+jKVgdRcvdRRLSEswLm9Squ2tRoXv
 58x5k2QU7klBmmsZgfjUUQjVJDKSNN2KRJbtCsXWDYh/5CY9f+XF4tc5f
 VfjQGYUOiYSPDv3wdEHn8O+3lXQIxik+1xNos0+wRKCMFlTj05375wCzT w==;
X-CSE-ConnectionGUID: ZXD01rNbRdOoIn33KoqPXQ==
X-CSE-MsgGUID: n6pNwaBOQHmHX4hwDIYJ6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7539295"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7539295"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 05:50:24 -0700
X-CSE-ConnectionGUID: BYDsrZNkTaC/LT2slJN6iw==
X-CSE-MsgGUID: /OB8Lz1iQYq2CjAHV31VPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18343217"
Received: from makulkar-mobl1.amr.corp.intel.com (HELO [10.212.52.18])
 ([10.212.52.18])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 05:50:22 -0700
Message-ID: <600cef67-ad90-4b67-8da7-2006339d430b@linux.intel.com>
Date: Tue, 2 Apr 2024 09:02:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
 <87y19xudor.wl-kuninori.morimoto.gx@renesas.com>
 <b4b37541-b67f-4593-9fd5-fc6242a0673a@linux.intel.com>
 <87zfuc7gya.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87zfuc7gya.wl-kuninori.morimoto.gx@renesas.com>
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



On 4/1/24 19:21, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis
> 
> Thank you for your review
> 
>> The problem I have is with the following code (not shown with diff)
>>
>> 	if (dai_link->playback_only)
>> 		has_capture = 0;
>>
>> 	if (dai_link->capture_only)
>> 		has_playback = 0;
>>
>> So with this grand unification, all the loops above may make a decision
>> that could be overridden by these two branches.
>>
>> This was not the case before for DPCM, all the 'has_capture' and
>> 'has_playback' variables were used as a verification of the dai_link
>> settings with an error thrown e.g. if the dpcm_playback was set without
>> any DAIs supporting playback.
> 
> I could understand so far.
> 
>> Now the dailink settings are used unconditionally. There is one warning
>> added if there are no settings for a dailink, but we've lost the
>> detection of a mismatch between dailink and the set of cpu/codec dais
>> that are part of this dailink.
> 
> But sorry I could understand this.
> 
> 	"There is one warning added if there are no settings for a dailink"
> 
> By [01/16] patch ? I think no warning is added. Or do you mean by [15/16]
> patch ?

Yes I looked at the entire series, it's just too complicated to look
with diff.

> 
> 	"we've lost the detection of a mismatch between dailink and the
> 	 set of cpu/codec dais that are part of this dailink"
> 
> Sorry I couldn't understand about this.
> Which mismatch detection we lost ?? Concrete sample / code / image
> is very helpful for me to well understanding.

With the older code, if the dpcm_playback was set for the dailink but
there isn't any dai connected to support playback, an error was thrown.

With the new code, if playback_only is set but there isn't any dai
connected, there is no error thrown, is there?

The point is that these flags are sometimes set in the machine driver,
sometimes set in the framework, and the open is which one has the priority.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
