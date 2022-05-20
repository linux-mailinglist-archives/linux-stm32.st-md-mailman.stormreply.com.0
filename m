Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7837C530B32
	for <lists+linux-stm32@lfdr.de>; Mon, 23 May 2022 11:02:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27CAAC628A0;
	Mon, 23 May 2022 09:02:26 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B60BC5662F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 13:39:06 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id h11so9691069eda.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 06:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/vZ5EIynCj28UhpMo2WaUDTGXgrMDD6ssuzpbKQFTrE=;
 b=dbdCdy787bi5RG1nfo93JEf7fRSGqgvdGgWbhi5+jiM2gZq411FflPdY9L2o3Sz097
 XA9SzdoyvFOw4oNvCmxQtifumEL2ucGkRJdht2gKQbj9YVfuffNrO+QPvuuZxjrqoS0F
 NfU67GWBYzEpstGDy844RVUmfAl7HNRGvf/LwT4rnlN6DngXc2ZKIaPbBdhEQ53EpZ4s
 ITsYoJPxw+STd6rZ1MhtfXgofir7SDd7Ohuuh33FWGAKbBMX+xkiGJYwBkluf7rb/Tbk
 3LkMR2KGcBuBeRhqmlx3nsng24xG35IMWoTed7v6OpPZiYpWbvZKUFT3MZVg1KYI/Bnh
 bK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/vZ5EIynCj28UhpMo2WaUDTGXgrMDD6ssuzpbKQFTrE=;
 b=slYOLn3Cmolonu4DzpTS+DpD/B3djrKc4jFvfxuRvun/3abRObHxuOZ788BG9Jz1Jd
 GgqRRMxwPw2RTDiFkxHySTkayhz0e4EiQ89aXs/FXkuh6U/zA9b+zKh4+1210R5jbIlr
 Mt8TiJdhuElhh2ObZAx82+Rn2v3gw9VJOi3SUn2DyRQaIdjubNo37y0Xp6Xgp3eGRsLQ
 Ee+8THm/MICKFq7v1aiaceIT9apPfNfIQuHpMZ/bR9d5j62Bdn7pBLk8hnmBp4jGF2gO
 QK6mJwmwh7H+GUTJpHaryNmLWWmkugPbxEtRQNq/NRSMsV5hscEE15i0YpTi+s7t+YpT
 tkYQ==
X-Gm-Message-State: AOAM530cGMbGGzB5gZc1Da+1o301MCMHdLQ3UXZM8GqQzSbewfJ3HICT
 q8hWjTbk4D4mpBm8iS/nuOE=
X-Google-Smtp-Source: ABdhPJzB4dDO6rQGcvP8GfFmFaDFqb3hZ0xhEwmOtYMgE32gUNPAUosh+C78GjzIs6waR9fAZFTMtw==
X-Received: by 2002:a05:6402:3488:b0:427:b4ec:991b with SMTP id
 v8-20020a056402348800b00427b4ec991bmr10869813edc.319.1653053945963; 
 Fri, 20 May 2022 06:39:05 -0700 (PDT)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84]) by smtp.gmail.com with ESMTPSA id
 b2-20020aa7df82000000b0042abfe32ac8sm4225152edy.30.2022.05.20.06.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 06:39:05 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: broonie@kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Fri, 20 May 2022 15:39:03 +0200
Message-ID: <4375965.enAZpblka2@archbook>
In-Reply-To: <20220519154318.2153729-19-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <20220519154318.2153729-19-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 May 2022 09:02:23 +0000
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, daniel@zonque.org,
 kernel@pengutronix.de, shawnguo@kernel.org, jarkko.nikula@bitmer.com
Subject: Re: [Linux-stm32] [PATCH 18/56] ASoC: rockchip: Update to use
	set_fmt_new callback
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

On Donnerstag, 19. Mai 2022 17:42:40 CEST Charles Keepax wrote:
> As part of updating the core to directly tell drivers if they are clock
> provider or consumer update these CPU side drivers to use the new direct
> callback.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  sound/soc/rockchip/rockchip_i2s.c     | 8 ++++----
>  sound/soc/rockchip/rockchip_i2s_tdm.c | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
> index 4ce5d25793875..0a66c7df323dc 100644
> --- a/sound/soc/rockchip/rockchip_i2s.c
> +++ b/sound/soc/rockchip/rockchip_i2s.c
> @@ -199,13 +199,13 @@ static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
>  
>  	pm_runtime_get_sync(cpu_dai->dev);
>  	mask = I2S_CKR_MSS_MASK;
> -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -	case SND_SOC_DAIFMT_CBS_CFS:
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_BP_FP:
>  		/* Set source clock in Master mode */
>  		val = I2S_CKR_MSS_MASTER;
>  		i2s->is_master_mode = true;
>  		break;
> -	case SND_SOC_DAIFMT_CBM_CFM:
> +	case SND_SOC_DAIFMT_BC_FC:
>  		val = I2S_CKR_MSS_SLAVE;
>  		i2s->is_master_mode = false;
>  		break;
> @@ -486,7 +486,7 @@ static const struct snd_soc_dai_ops rockchip_i2s_dai_ops = {
>  	.hw_params = rockchip_i2s_hw_params,
>  	.set_bclk_ratio	= rockchip_i2s_set_bclk_ratio,
>  	.set_sysclk = rockchip_i2s_set_sysclk,
> -	.set_fmt = rockchip_i2s_set_fmt,
> +	.set_fmt_new = rockchip_i2s_set_fmt,
>  	.trigger = rockchip_i2s_trigger,
>  };
>  
> diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
> index 98700e75b82a1..c90afccdae362 100644
> --- a/sound/soc/rockchip/rockchip_i2s_tdm.c
> +++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
> @@ -411,12 +411,12 @@ static int rockchip_i2s_tdm_set_fmt(struct snd_soc_dai *cpu_dai,
>  	}
>  
>  	mask = I2S_CKR_MSS_MASK;
> -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -	case SND_SOC_DAIFMT_CBC_CFC:
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_BP_FP:
>  		val = I2S_CKR_MSS_MASTER;
>  		i2s_tdm->is_master_mode = true;
>  		break;
> -	case SND_SOC_DAIFMT_CBP_CFP:
> +	case SND_SOC_DAIFMT_BC_FC:
>  		val = I2S_CKR_MSS_SLAVE;
>  		i2s_tdm->is_master_mode = false;
>  		break;
> @@ -1113,7 +1113,7 @@ static const struct snd_soc_dai_ops rockchip_i2s_tdm_dai_ops = {
>  	.hw_params = rockchip_i2s_tdm_hw_params,
>  	.set_bclk_ratio	= rockchip_i2s_tdm_set_bclk_ratio,
>  	.set_sysclk = rockchip_i2s_tdm_set_sysclk,
> -	.set_fmt = rockchip_i2s_tdm_set_fmt,
> +	.set_fmt_new = rockchip_i2s_tdm_set_fmt,
>  	.set_tdm_slot = rockchip_dai_tdm_slot,
>  	.trigger = rockchip_i2s_tdm_trigger,
>  };
> 

Please run ./scripts/get_maintainer.pl against the individual patches so
that I'm included in the recipients of the e-mail as well.

Anyway, for the i2s-tdm parts:

Tested-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>

Tested on a RK3566 connected to an RK817 codec.

Regards,
Nicolas Frattaroli


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
