Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2782988C209
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 13:25:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8BF9C6B45B;
	Tue, 26 Mar 2024 12:25:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E921BCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 12:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711455951; x=1742991951;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=4/FUC3PgeGbPj/ACm7P2erlBnN7nF3Qy/MNNSPLifnI=;
 b=Tch6iqwIlORvI13v6yUHK8czZVRE077Jtrx/dNQuBc9+ixM1Q5ie3IJa
 HkKxnA5dheYb4+tdfYJAHOzPN694ypIN0e79Wg6fydszr2Cw4vZf0VoLz
 eC/gIy5xWIofOobyAgKwRxf7PB4O5+21o2+mfR16Nn6/5RrAf0dp3h7PQ
 JCUwt4VxGVU50liSkBnh9c28hoOgrmRQ1gQb3K3u53hPzoK3Isb8kELMO
 x4rZTS6WvcPIfz5+WCO/I2HD0X3Kc4eI9NgnNxy4xdQ5kNhItCYrWTOr7
 lVW6sQXNvRH+wthuSAi6bhPKmE+mWA7w8QvLRSanHoxac9OBnFVN7pR0+ w==;
X-CSE-ConnectionGUID: OudhN+CIS7e3WGoyb9xLGQ==
X-CSE-MsgGUID: uoG2qJdvSrOrodZj0Ao8uA==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="10299230"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="10299230"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 05:25:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="47099724"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 05:25:41 -0700
Message-ID: <83d63442-ae4c-4e5e-a610-c0c0be54d50e@linux.intel.com>
Date: Tue, 26 Mar 2024 13:25:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
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
References: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [Linux-stm32] [PATCH 00/15] ASoC: replace dpcm_playback/capture
 to playback/capture_only
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

On 3/25/2024 5:35 AM, Kuninori Morimoto wrote:
> 
> Hi Mark
> 
> When we use DPCM, we need to set dpcm_playback/capture flag.
> If these flag are set, soc_get_playback_capture() will check its
> availability, but non DPCM case is checked without special flags.
> 
> OTOH, it cares playback/capture_only flag. It is needed.
> 
> This patch remove DPCM special flag, and replace it playback/capture_only
> flag if needed.
> 

One general note, I wonder if playback/capture_only should be renamed to 
something more descriptive, current names are a bit weird from use case 
point of view. I mean no flags, means both capture and playback are 
enabled. Then you do something like playback_only = 1, which effectively 
affects capture stream. Notice that flag is named playback, but affects 
capture. Perhaps, something like capture_disabled, playback_disabled 
would make more sense? This would also make more sense to me for 
something like playback_only = 1; capture_only = 1; which while weird 
doesn't instantly seem that wrong, while disable on both directions 
instantly seems broken.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
