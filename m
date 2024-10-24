Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 358D89ADE70
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2024 10:06:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDD63C78F63;
	Thu, 24 Oct 2024 08:06:24 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE88CC78F62
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 08:06:17 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4315f24a6bbso6071485e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 01:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729757177; x=1730361977;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=zMW6I0sTEYqubA9v2uS/l/YanQ/0kwQs3KpAh7vOnLI=;
 b=E4jrYXA5xGTr1ZdWkN+6dq4lOirHkgCi3fNKaS13KiR3EL2e9B62tMk6qS+mzrLyeB
 p1cOFsrQOQNbq6xjJ1bXPeGYEJrMMsNVxPxkDNqSS8LkmcTBLrsXwE9ICUdGQPwtFNdT
 5nc3FF+GexWDVrUlBBZ4K+NdoE5LrzTxWdyjITpyEE+lyFdTrnf0vaEtI0VIGUv9H1fr
 v8lhVzMzwwDNG25C+ChCvi6MpOA1oe2G8OoZZa4H8TCm8t018GNzNnm6vGMKkCW/chdB
 pvhyx89Md1oeOiKjZ7f4FI/y4wHFRjzwgEGNbN3IKy/Z5Z08X9F9H4zG1NYpLZzOhQNJ
 /etA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729757177; x=1730361977;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zMW6I0sTEYqubA9v2uS/l/YanQ/0kwQs3KpAh7vOnLI=;
 b=gChMNRatq1w+81wrXqnhP5Ad4ElJatJEm+UrSQfZdearDhY7rZDGaElZGWlSREg07J
 ccd46/tvRpbPoIDxmLTBuF7Qcgz6RKOJsvvK+Not5exkdmnEVCV7JmK1qIlwcQ1DgoMB
 8aR300XO1Nu38u2m6gbNLBloz3kNDYKd7iGYpIlD1EEHThyAXK8YuOUB2tu4mOB66kJz
 BvQe/KdL6ivTM7PPfD4sfks65SsT/N3RkOY+chSuNp8+PqO3smyKlk8xy72B6EWjAvlq
 vTOYBoyMpRD88dvyvI2X5IAn1kwHyPszz4fqyem51tti5T4YT+QHOfAG3QJB6m8AG3LO
 QwMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvtr2gBWaENmaV3vW1X4mYGEz0FoFJowdb0cf5RmVqTar2UhJacjprxYfRt6B5TH+fxZhd3HCEKZKYhQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzvQ7pvrMkfaXLV3OtBR8HQ+/BfU3i1a02WTj3uPXjGZ9RXNt6n
 xXCQ412gU6yM6iSTtZn5I1LQIQhJIaqm574dYZ/qFhv3jFfr4ko3+QbkD4/tbPU=
X-Google-Smtp-Source: AGHT+IEoZMVKgD69poA0dFC1qIUTHJdJvAa3Cg9Ax/TeZWkK7ol7nwHmrhD5d8D+xQZ2BLd9/bn72g==
X-Received: by 2002:adf:e903:0:b0:37c:d001:856f with SMTP id
 ffacd0b85a97d-380458ee3fbmr839512f8f.56.1729757177038; 
 Thu, 24 Oct 2024 01:06:17 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c04c:f30a:b45c:dbb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0a64daasm10701229f8f.64.2024.10.24.01.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 01:06:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wmhyb85l.wl-kuninori.morimoto.gx@renesas.com> (Kuninori
 Morimoto's message of "Thu, 24 Oct 2024 01:29:27 +0000")
References: <871q06cmsl.wl-kuninori.morimoto.gx@renesas.com>
 <87wmhyb85l.wl-kuninori.morimoto.gx@renesas.com>
Date: Thu, 24 Oct 2024 10:06:15 +0200
Message-ID: <1ja5eudix4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, alsa-devel@alsa-project.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, imx@lists.linux.dev,
 Kevin Hilman <khilman@baylibre.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-sound@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, patches@opensource.cirrus.com,
 Jaroslav Kysela <perex@perex.cz>, Shawn Guo <shawnguo@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 3/8] ASoC: meson: switch to use rtd->id
	from rtd->num
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

On Thu 24 Oct 2024 at 01:29, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Now rtd->num is renamed to rtd->id. Let's switch.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

Just one comment: I understand why you have split this into multiple
patches, I suppose it will help with the review but I wonder if it
wouldn't be better to squash it all into a single change before
applying ? To avoid exposing the intermediate state. It might be
confusing too. The change would not be that big actually.

Just a suggestion ;)

> ---
>  sound/soc/meson/axg-card.c | 6 +++---
>  sound/soc/meson/gx-card.c  | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
> index 5ebf287fe7004..a2dfccb7990f3 100644
> --- a/sound/soc/meson/axg-card.c
> +++ b/sound/soc/meson/axg-card.c
> @@ -43,7 +43,7 @@ static int axg_card_tdm_be_hw_params(struct snd_pcm_substream *substream,
>  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>  	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
>  	struct axg_dai_link_tdm_data *be =
> -		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->num];
> +		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->id];
>  
>  	return meson_card_i2s_set_sysclk(substream, params, be->mclk_fs);
>  }
> @@ -56,7 +56,7 @@ static int axg_card_tdm_dai_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
>  	struct axg_dai_link_tdm_data *be =
> -		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->num];
> +		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->id];
>  	struct snd_soc_dai *codec_dai;
>  	int ret, i;
>  
> @@ -86,7 +86,7 @@ static int axg_card_tdm_dai_lb_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
>  	struct axg_dai_link_tdm_data *be =
> -		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->num];
> +		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->id];
>  	int ret;
>  
>  	/* The loopback rx_mask is the pad tx_mask */
> diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
> index 455f6bfc9f8fa..b408cc2bbc919 100644
> --- a/sound/soc/meson/gx-card.c
> +++ b/sound/soc/meson/gx-card.c
> @@ -32,7 +32,7 @@ static int gx_card_i2s_be_hw_params(struct snd_pcm_substream *substream,
>  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>  	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
>  	struct gx_dai_link_i2s_data *be =
> -		(struct gx_dai_link_i2s_data *)priv->link_data[rtd->num];
> +		(struct gx_dai_link_i2s_data *)priv->link_data[rtd->id];
>  
>  	return meson_card_i2s_set_sysclk(substream, params, be->mclk_fs);
>  }

-- 
Jerome
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
