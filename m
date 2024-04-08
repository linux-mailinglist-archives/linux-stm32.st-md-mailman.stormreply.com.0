Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFB989CAAB
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Apr 2024 19:23:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 368CCC7128A;
	Mon,  8 Apr 2024 17:23:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02474C71288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Apr 2024 17:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712596981; x=1744132981;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9YZUFujOhMTTG62YTRxcfo0Pxm72VS2PmasBoZHfmRw=;
 b=aZRUFVI3yCaLiTmj1QS4mbrtE2p8o52v9YGJWPP5CC3sBg6V4mUEZeDF
 /5cmCrSC5SRRLw6OzKIMlrEZk4ForaI36ENCvgGkVdr6eGHKlSGmiXA6v
 O1Zdzvr7S/nblecN1Cruj4WiYVIhukW9rSjWRJcfdgcclJD7s2rux6UHn
 sZ9LU4nGer12/ffeERTZqS6W+9UvspDqWDfjWRaxvG4OW91xBs7Gezxl7
 vhm1vxM3L9yhRRWRtq4o8dEJNboDtKMPpZLibvC6gREeSvQ8aKAH+FW33
 VXm4ZGCA8Q5i/StJ6uqwUATozLNCyOvi2Tj5Nbc2mpmxqGIUkH0K1PQI6 A==;
X-CSE-ConnectionGUID: 6eSTwKZ/Sg2RJhLR3N5miQ==
X-CSE-MsgGUID: Ps9J2NC+Tju+rlgnLlGkqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7757447"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7757447"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:22:59 -0700
X-CSE-ConnectionGUID: fG6IZotJT4u76Vx3qwpS7A==
X-CSE-MsgGUID: izqID2hnQtuQZJDnjXRadA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24697450"
Received: from shahsmit-mobl1.amr.corp.intel.com (HELO [10.212.101.141])
 ([10.212.101.141])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:22:56 -0700
Message-ID: <acf98b6b-7c18-4f1e-ab8f-039c88679ab9@linux.intel.com>
Date: Mon, 8 Apr 2024 10:34:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
 <87y19xudor.wl-kuninori.morimoto.gx@renesas.com>
 <b4b37541-b67f-4593-9fd5-fc6242a0673a@linux.intel.com>
 <87zfuc7gya.wl-kuninori.morimoto.gx@renesas.com>
 <600cef67-ad90-4b67-8da7-2006339d430b@linux.intel.com>
 <874jch99m5.wl-kuninori.morimoto.gx@renesas.com>
 <40e23972-6745-48e2-81ae-4b93f2ee2dcc@linux.intel.com>
 <875xwwr60a.wl-kuninori.morimoto.gx@renesas.com>
 <87sezwecf1.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87sezwecf1.wl-kuninori.morimoto.gx@renesas.com>
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



On 4/7/24 22:55, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis, again
> 
>> dpcm_xxx is used to declare that the DAI/dailink is possible to use
>> playback/capture. For example dpcm_playback means the DAI / dailink
>> should playback-able, if not it is error.
>>
>> xxx_only is used to limit the playback/capture.
>> For example the DAI / dailink can use both playback and capture,
>> but want to use playback only for some reasons, we can use playback_only.
> 
> My pervious patch-set was "try to merge dpcm_xxx and xxx_only flag",
> but next patch will be "expand assertion flag to all connection".
> This "assertion flag" was originaly dpcm_xxx.
> 
> In next patch-set, it will assume for example current "dpcm_playback"
> as "playback_assertion". It can be used not only for DPCM, but
> all connection, but is not mandatory option.
> 
> Its pseudo code is like below, but what do you think ?
> 
> 	soc_get_playback_capture(...)
> 	{
> 		...
> 		/*
> 		 * get HW / DAI availability
> 		 */
> 		for_each_rtd_ch_maps(...) {
> 			...
> 			has_playback = xxx;
> 			has_capture  = xxx;
> 		}
> 
> 		/*
> 		 * "xxx_assersion" was "dpcm_xxx" before, but expand to
> 		 * all connection. It is not mandatory option.
> 		 * It will be error if dai_link has xxx_assersion flag,
> 		 * but DAI was not valid
> 		 */
> 		if (dai_link->playback_assertion && !has_playback) {
> 			dev_err(rtd->dev, ...);
> 			return -EINVAL;
>  		}
> 		if (dai_link->capture_assertion  && !has_capture) {
> 			dev_err(rtd->dev, ...);
> 			return -EINVAL;
> 		}
> 
> 		/*
> 		 * xxx_only flag limits availability. It will indicate warning
> 		 * if DAI was not valid.
> 		 */
> 		if (dai_link->playback_only) {
> 			if (!has_capture)
> 				dev_warn(rtd->dev, ...);
> 			has_capture = 0;
> 		}
> 
> 		if (dai_link->capture_only) {
> 			if (!has_playback)
> 				dev_warn(rtd->dev, ...);
> 			has_playback = 0;
> 		}
> 
> 		/*
> 		 * No Playback, No Capture is error
> 		 */
> 		if (!has_playback && !has_capture) {
> 			dev_err(rtd->dev, ...);
> 			return -EINVAL;
> 		}
> 		...
> 	}

The code looks fine, but what are we trying to achieve?
I thought the idea was to have a single field at the dailink, and with
the example above we would still have two - just like today.
This looks like a lot of code churn in many drivers for limited
benefits. Or I am missing something?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
