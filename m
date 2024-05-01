Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A63468B8B37
	for <lists+linux-stm32@lfdr.de>; Wed,  1 May 2024 15:31:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57705C71291;
	Wed,  1 May 2024 13:31:34 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C21C6C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 May 2024 13:31:27 +0000 (UTC)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 67EFE3FE0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 May 2024 13:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1714570281;
 bh=c8oK9gFYZNPK8JjkQaEUib/TlJXrHwdRQFsXpehmfQo=;
 h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=EuuSnk4jX38BiXlAuLya5VbDtfALUnomriCQ9gw0S85Yn7mFk0iEVTsz0aBe3Y3FS
 StCLrSm3C9uExWyFfLM4uUI1idzjyDz9v7L3i8y9WarlEqZR22fgcx8dQdVk5GFLO3
 sGoAHNJ4XYLW2G/uG3EvbcgerI7+2OON6wsMNabTNC0803XOKJGWigiaBO/Z2f0yJD
 VqBGfxLf3BF9vs0UJe6cV6Kvi06E833jDO1nURTkPJyyf02JkyKcOSkDkqIKH24t6r
 Zcl01DxGDrnM1vH76vBIXu3V7zXuR/RX8h/F/x3QOpD1JIcG0bDfgMCLp1gjRURUJF
 gzuPi6TKHt9Vw==
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a5907df2d8dso68787666b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 May 2024 06:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714570278; x=1715175078;
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c8oK9gFYZNPK8JjkQaEUib/TlJXrHwdRQFsXpehmfQo=;
 b=epZghwYehZBWasE/mgzXTrzYngtFJjr/9BbEXDkuJpiJxlRYfqlrDd0eL8xjl1v1HY
 ZJFJJ682J9G7QvtGQ4H4t2dfU8JfUanMZHTWySolUU2aCxES+0Z+WmICC4CMLd/FHN7b
 vJoYT4LORbw3j6TUUMhjjEpqNgw/v1mgWW8u/fe/p6vgD0TlXmeltgovgacO70J7jl2w
 Vs+q8qpHSJtScDsTpQQr9x4YzO1bL22jQ2Zo6JDhqcmV3Z/97KrR58jLcp+p5gILR3T8
 Iyx+bHlRAf8CRH7w/AekbF+YRyrCXZ5Oq51+u7L9Trfm/ZnvA54Xw38SN3cqeRm3iAbZ
 2hTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB92v6uRKhQLwKmCMEmuVo0FjVP2zTAUFaRDnFVIQPeVuqKL4OVo5bcPKdVF3NGzfSNTvmWFAZ9IpUgHhLOA7CtD8y+i63koHR9UMAOKGEjWKQMeDAm8YV
X-Gm-Message-State: AOJu0YwreniPF2rQNs69CLAcZ67/S9s+/lVVuc1DJEJN9ymmc35pRvlL
 gSePa0dJb4cng6q6p+0YWkJPH2DbiQtyVXn/+tXAVArd1a60VDR3t2WPfdWK0xeP3v4w2uFr9/5
 RTIZlvXOsG6e9bF/mLsf4xNUlFvYdiDLgeP7+CZFRsJqsse2i4VpoFJMkDGJbyUnWoBbFP1xYUJ
 TWYt+fdIU+izpKVGm61IGyzQIkYkr70LBm5Kv370ypisv1qVAaeFfuUIe/ntKSeSN8GCG3
X-Received: by 2002:a2e:a7ce:0:b0:2df:8ce6:96cb with SMTP id
 x14-20020a2ea7ce000000b002df8ce696cbmr955420ljp.8.1714570258098; 
 Wed, 01 May 2024 06:30:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYT+qTSOE1Kr9KmhXevsjrdrGfobx9Pel64hRtY96pMsR8tg00NtEJfiVi5E4mSMS1jyTIKo1grrZjSHhuefw=
X-Received: by 2002:a2e:a7ce:0:b0:2df:8ce6:96cb with SMTP id
 x14-20020a2ea7ce000000b002df8ce696cbmr955417ljp.8.1714570257684; Wed, 01 May
 2024 06:30:57 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 May 2024 08:30:56 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240501-pinctrl-cleanup-v1-5-797ceca46e5c@nxp.com>
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
 <20240501-pinctrl-cleanup-v1-5-797ceca46e5c@nxp.com>
Mime-Version: 1.0
Date: Wed, 1 May 2024 08:30:56 -0500
Message-ID: <CAJM55Z9RuobAMR4EaevhTPRsJe3vuruV7-_DTQYpH_w8_azkcA@mail.gmail.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner <heiko@sntech.de>,
 Damien Le Moal <dlemoal@kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chester Lin <chester62515@gmail.com>, 
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
 linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-rockchip@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 05/21] pinctrl: starfive: Use scope based
	of_node_put() cleanups
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

Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Use scope based of_node_put() cleanup to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 27 +++++++++-------------
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 18 +++++++--------
>  2 files changed, 19 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> index 6df7a310c7ed..27f99183d994 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> @@ -480,7 +480,6 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  {
>  	struct starfive_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
>  	struct device *dev = sfp->gc.parent;
> -	struct device_node *child;
>  	struct pinctrl_map *map;
>  	const char **pgnames;
>  	const char *grpname;
> @@ -492,20 +491,18 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>
>  	nmaps = 0;
>  	ngroups = 0;
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>  		int npinmux = of_property_count_u32_elems(child, "pinmux");
>  		int npins   = of_property_count_u32_elems(child, "pins");
>
>  		if (npinmux > 0 && npins > 0) {
>  			dev_err(dev, "invalid pinctrl group %pOFn.%pOFn: both pinmux and pins set\n",
>  				np, child);
> -			of_node_put(child);
>  			return -EINVAL;
>  		}
>  		if (npinmux == 0 && npins == 0) {
>  			dev_err(dev, "invalid pinctrl group %pOFn.%pOFn: neither pinmux nor pins set\n",
>  				np, child);
> -			of_node_put(child);
>  			return -EINVAL;
>  		}
>
> @@ -527,14 +524,14 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	nmaps = 0;
>  	ngroups = 0;
>  	mutex_lock(&sfp->mutex);
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>  		int npins;
>  		int i;
>
>  		grpname = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", np, child);
>  		if (!grpname) {
>  			ret = -ENOMEM;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		pgnames[ngroups++] = grpname;
> @@ -543,18 +540,18 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  			pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
>  			if (!pins) {
>  				ret = -ENOMEM;
> -				goto put_child;
> +				goto free_map;
>  			}
>
>  			pinmux = devm_kcalloc(dev, npins, sizeof(*pinmux), GFP_KERNEL);
>  			if (!pinmux) {
>  				ret = -ENOMEM;
> -				goto put_child;
> +				goto free_map;
>  			}
>
>  			ret = of_property_read_u32_array(child, "pinmux", pinmux, npins);
>  			if (ret)
> -				goto put_child;
> +				goto free_map;
>
>  			for (i = 0; i < npins; i++) {
>  				unsigned int gpio = starfive_pinmux_to_gpio(pinmux[i]);
> @@ -570,7 +567,7 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  			pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
>  			if (!pins) {
>  				ret = -ENOMEM;
> -				goto put_child;
> +				goto free_map;
>  			}
>
>  			pinmux = NULL;
> @@ -580,18 +577,18 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>
>  				ret = of_property_read_u32_index(child, "pins", i, &v);
>  				if (ret)
> -					goto put_child;
> +					goto free_map;
>  				pins[i] = v;
>  			}
>  		} else {
>  			ret = -EINVAL;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		ret = pinctrl_generic_add_group(pctldev, grpname, pins, npins, pinmux);
>  		if (ret < 0) {
>  			dev_err(dev, "error adding group %s: %d\n", grpname, ret);
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		ret = pinconf_generic_parse_dt_config(child, pctldev,
> @@ -600,7 +597,7 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  		if (ret) {
>  			dev_err(dev, "error parsing pin config of group %s: %d\n",
>  				grpname, ret);
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		/* don't create a map if there are no pinconf settings */
> @@ -623,8 +620,6 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	mutex_unlock(&sfp->mutex);
>  	return 0;
>
> -put_child:
> -	of_node_put(child);
>  free_map:
>  	pinctrl_utils_free_map(pctldev, map, nmaps);
>  	mutex_unlock(&sfp->mutex);
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> index 9609eb1ecc3d..4ce080caa233 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> @@ -150,7 +150,7 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	nmaps = 0;
>  	ngroups = 0;
>  	mutex_lock(&sfp->mutex);
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>  		int npins = of_property_count_u32_elems(child, "pinmux");
>  		int *pins;
>  		u32 *pinmux;
> @@ -161,13 +161,13 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  				"invalid pinctrl group %pOFn.%pOFn: pinmux not set\n",
>  				np, child);
>  			ret = -EINVAL;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		grpname = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", np, child);
>  		if (!grpname) {
>  			ret = -ENOMEM;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		pgnames[ngroups++] = grpname;
> @@ -175,18 +175,18 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  		pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
>  		if (!pins) {
>  			ret = -ENOMEM;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		pinmux = devm_kcalloc(dev, npins, sizeof(*pinmux), GFP_KERNEL);
>  		if (!pinmux) {
>  			ret = -ENOMEM;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		ret = of_property_read_u32_array(child, "pinmux", pinmux, npins);
>  		if (ret)
> -			goto put_child;
> +			goto free_map;
>
>  		for (i = 0; i < npins; i++)
>  			pins[i] = jh7110_pinmux_pin(pinmux[i]);
> @@ -200,7 +200,7 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  						pins, npins, pinmux);
>  		if (ret < 0) {
>  			dev_err(dev, "error adding group %s: %d\n", grpname, ret);
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		ret = pinconf_generic_parse_dt_config(child, pctldev,
> @@ -209,7 +209,7 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  		if (ret) {
>  			dev_err(dev, "error parsing pin config of group %s: %d\n",
>  				grpname, ret);
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		/* don't create a map if there are no pinconf settings */
> @@ -233,8 +233,6 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	*num_maps = nmaps;
>  	return 0;
>
> -put_child:
> -	of_node_put(child);
>  free_map:
>  	pinctrl_utils_free_map(pctldev, map, nmaps);
>  	mutex_unlock(&sfp->mutex);
>
> --
> 2.37.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
