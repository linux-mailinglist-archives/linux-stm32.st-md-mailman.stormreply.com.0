Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B416A898362
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Apr 2024 10:46:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75941C6B45B;
	Thu,  4 Apr 2024 08:46:55 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A733C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Apr 2024 08:46:54 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-516bfcc76efso765327e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Apr 2024 01:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712220413; x=1712825213;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
 bh=vssJvDsEm5h5nxOLNKKmfZj8jedONQ1OyiP3MNwrwU4=;
 b=eGpMONjhHXUQxHRdpyRhCYO4YU38uQGFsXATYgrwS83OnBmZLqoxCSGOvcud1asbcY
 nHUmwdgHT8cuEE44T5rhkfz4+qyVGSOSdpPEbrSsKcWmrCcUTIaUcUcbthVS/oP+2k9J
 5SE8bfY8PyDACfJhfcJ+GENVcch7zg/oiKKoAYnFyfTPHba5AgFQXlzTKb72BCFMBAJt
 gSW6B8CgonbiW5yR6yOKAaC9XRykgR4VI71+8tQGh1r6F5MGxqu7EkW42ACt0f7WKpKX
 RjEwntZTiD4MQkErE9X1zF3JJSYQaE58gabuJkEfYlJA+OaOR1QKT/cXK6vTZPm3PSHR
 /mcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712220413; x=1712825213;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vssJvDsEm5h5nxOLNKKmfZj8jedONQ1OyiP3MNwrwU4=;
 b=UvXmA/VUWQoMMGSGP4ykBBuv4BNXHqRNZQZ5lQ7e8NSZWlEcU7JudshwbBLe7kgaG4
 YbIj2AZ0g0WGVzWe7gPY20cxPbG8Peq7prh2dc7ylK7fFEDJ+/YA0RptNrlfUQfzCkWG
 QMsrMnzbnIG+gG5W6p41VYb8+gmtUcs9RciBZZ5JfkmR+wWmjYxeXBu1kAhqT9IF7J+o
 0KId4M56pjuItPq5Zd+zrBs+175Ao/zmbRdN9Cmi9TMmMkESml4DwSriudklJOHmz0iC
 i2131UFTriR/gU6MY1p94KFlDuRxARUeNTbEzRxLNh/HcpZfZ6fT8qMAgb9YYt2rPGfZ
 xEHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCViQU23/kkrceNiOWfo8QbXopC8kF8gU3YlBu8FzUgF+mlvOweJOQWs0A03nMpWniI/P7V2Mf9/oaLmYUP0ATWxltrGvW0f/xs9qBa3Pdbvagt3uH9vzPup
X-Gm-Message-State: AOJu0YwMXDWuUpEG7g3I+4U6WxZCczG6hJPDA59TnKq7IyWqjMIU37Gw
 Xu3AdiV8Ar7RQ/a/8F24gT1OfGi5RZoI7gM8i7w0LrRwhVNbCplPO4XMcEBT6nc=
X-Google-Smtp-Source: AGHT+IGfmakMeTh3jAGVQJKJ+VTm2R438vkeBhF7L+wEWqOROEyvzepKwPfwlLVcE3mN6ey9Em+MkA==
X-Received: by 2002:ac2:4c8f:0:b0:513:d01e:b68 with SMTP id
 d15-20020ac24c8f000000b00513d01e0b68mr1237043lfl.3.1712220413384; 
 Thu, 04 Apr 2024 01:46:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b7ad:8118:73f1:92e5])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c468f00b0041550e03bc6sm1869265wmo.44.2024.04.04.01.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 01:46:53 -0700 (PDT)
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
 <87sf05udnx.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 04 Apr 2024 10:46:13 +0200
In-reply-to: <87sf05udnx.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1jedblplab.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, Cezary Rojewski <cezary.rojewski@intel.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Maso Huang <maso.huang@mediatek.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?utf-8?Q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
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
Subject: Re: [Linux-stm32] [PATCH v2 05/16] ASoC: meson: Replace
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


On Mon 01 Apr 2024 at 00:31, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> soc_get_playback_capture() is now handling DPCM and normal comprehensively
> for playback/capture stream. We can use playback/capture_only flag
> instead of using dpcm_playback/capture. This patch replace these.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Looks OK

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  sound/soc/meson/axg-card.c         | 8 ++++----
>  sound/soc/meson/meson-card-utils.c | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
> index 3180aa4d3a15..21bf1453af43 100644
> --- a/sound/soc/meson/axg-card.c
> +++ b/sound/soc/meson/axg-card.c
> @@ -132,7 +132,7 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
>  	lb->stream_name = lb->name;
>  	lb->cpus->of_node = pad->cpus->of_node;
>  	lb->cpus->dai_name = "TDM Loopback";
> -	lb->dpcm_capture = 1;
> +	lb->capture_only = 1;
>  	lb->no_pcm = 1;
>  	lb->ops = &axg_card_tdm_be_ops;
>  	lb->init = axg_card_tdm_dai_lb_init;
> @@ -176,7 +176,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
>  
>  	/* Disable playback is the interface has no tx slots */
>  	if (!tx)
> -		link->dpcm_playback = 0;
> +		link->capture_only = 1;
>  
>  	for (i = 0, rx = 0; i < AXG_TDM_NUM_LANES; i++) {
>  		snprintf(propname, 32, "dai-tdm-slot-rx-mask-%d", i);
> @@ -186,7 +186,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
>  
>  	/* Disable capture is the interface has no rx slots */
>  	if (!rx)
> -		link->dpcm_capture = 0;
> +		link->playback_only = 1;
>  
>  	/* ... but the interface should at least have one of them */
>  	if (!tx && !rx) {
> @@ -275,7 +275,7 @@ static int axg_card_parse_tdm(struct snd_soc_card *card,
>  		return ret;
>  
>  	/* Add loopback if the pad dai has playback */
> -	if (link->dpcm_playback) {
> +	if (!link->capture_only) {
>  		ret = axg_card_add_tdm_loopback(card, index);
>  		if (ret)
>  			return ret;
> diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
> index ed6c7e2f609c..1a4ef124e4e2 100644
> --- a/sound/soc/meson/meson-card-utils.c
> +++ b/sound/soc/meson/meson-card-utils.c
> @@ -186,9 +186,9 @@ int meson_card_set_fe_link(struct snd_soc_card *card,
>  	link->dpcm_merged_rate = 1;
>  
>  	if (is_playback)
> -		link->dpcm_playback = 1;
> +		link->playback_only = 1;
>  	else
> -		link->dpcm_capture = 1;
> +		link->capture_only = 1;
>  
>  	return meson_card_set_link_name(card, link, node, "fe");
>  }


-- 
Jerome
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
