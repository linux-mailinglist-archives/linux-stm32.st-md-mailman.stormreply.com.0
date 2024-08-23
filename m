Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6768D95C8E5
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 11:11:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14BC7C71287;
	Fri, 23 Aug 2024 09:11:35 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29A6CC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 09:11:28 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2f3f07ac2dcso18987251fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 02:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724404287; x=1725009087;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4PO5E+Yc2jdmqT5l2dYdMtbWuQDD2570ef53Pzw7Dho=;
 b=cLq8QekoUSWLt2JsDU/vlELuP1wkxweor/PQRDVsmG9ytjugmE45q144nPg4w99Oeq
 H1R7n54vkOxo4Nj/4otwDIma4BB2oJ4ZlbaWqZcIEoJRgzmquyBklhmWrSflJ3N28eAI
 bUTuYVs7gSU1NUSiW2HFx7bhQu2bcT/7f+byB/jaXsLIFW8SrMcojMEfzc5NVZOzdH5p
 Z/TkTEZ/6My5M0oiPKnPXLgxXRHKR/rCWzwoIGZI9ko22PeKgH71M9Jao7AHkMarHIVA
 rq03zZmdD34PDaicfbdVE4rt93kqpjwTGNzJxiGv68LGMrJixxfLj5m/BoG+fR0dDxVt
 OqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724404287; x=1725009087;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4PO5E+Yc2jdmqT5l2dYdMtbWuQDD2570ef53Pzw7Dho=;
 b=MNWaK0zYe3h6/3RsSOxufSxZamSjmaApr1/pO9E1QWHC+HBxQvgEDXyK36+dqlH2qX
 wFlBauqLWFAvBN4FTFguZz/HEeQe2hOVIJ79VDOvF+JtsQRVmm0Zn0fvFJF6bvTU/lAl
 EeLONWwOJQReAkkpZBK8VAuUX1epCRYMT7AS7hwKiSaeRJ5ZJxVh4HGAzNGMrITXg/Ab
 cGfONXuA8f5TMnAutHmitXMhZ/y2XD1VhU2x96UaaiX+bh3L4YzqYYTJHkfIgKuc5a7U
 fb138TaI5sf9Ves4UJLKdHztPnt8fZdAJ3EMaiEy7g/bm2rucvBgJhtDAHfIM8dveUlL
 nnfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq5Ui1UiXFIJUBVIMaDh8NZdK38ALgYspwaQj4jGppVYgNhaRxMMeWiOrfD06NrCLegPx840E8IBr/bw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzMMqx90J/bIVsAWX+nG1IQ0Y2GGxb1nz5/YPS30zhRWSEEGiVw
 q+fMwLo3QarKDyhKcduH8WgIbclmFXl7cm9zp7yNmvpUP/Be/DVG
X-Google-Smtp-Source: AGHT+IG7i0v4Oxi1zDQ7x12f7nNWK8FCGltyKq7l0VpZBxkWpTbouDOSj6EcsEmrspHXN3Tlr5uzsg==
X-Received: by 2002:a2e:b8c3:0:b0:2f3:f5aa:b3d0 with SMTP id
 38308e7fff4ca-2f4f57978bamr7783171fa.35.1724404286482; 
 Fri, 23 Aug 2024 02:11:26 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f40487f797sm4324791fa.119.2024.08.23.02.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 02:11:26 -0700 (PDT)
Date: Fri, 23 Aug 2024 12:11:23 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <qx4k2xehasda7zj6vt3bygdh3scehiiwniqvljj4b4rjde25a5@ys4oqsithhwi>
References: <20240823072122.2053401-1-frank.li@vivo.com>
 <20240823072122.2053401-3-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240823072122.2053401-3-frank.li@vivo.com>
Cc: andrew@lunn.ch, marcin.s.wojtas@gmail.com, kees@kernel.org,
 linus.walleij@linaro.org, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, f.fainelli@gmail.com,
 sd@queasysnail.net, linux@armlinux.org.uk, joabreu@synopsys.com,
 u.kleine-koenig@pengutronix.de, kuba@kernel.org, pabeni@redhat.com,
 clement.leger@bootlin.com, mcoquelin.stm32@gmail.com,
 ulli.kroll@googlemail.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, horms@kernel.org, justinstitt@google.com,
 olteanv@gmail.com, davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [net-next v2 2/9] net: stmmac: platform: Convert
 to devm_clk_get_enabled() and devm_clk_get_optional_enabled()
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

Hi Yangtao

On Fri, Aug 23, 2024 at 01:21:14AM -0600, Yangtao Li wrote:
> Use devm_clk_get_enabled() and devm_clk_get_optional_enabled()
> to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> v2:
> -remove unused 'ret'
> -fix incompatible-pointer-types
> 
>  .../ethernet/stmicro/stmmac/stmmac_platform.c | 35 +++++--------------
>  1 file changed, 8 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index ad868e8d195d..1a66baaa4081 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -415,8 +415,6 @@ static int stmmac_of_get_mac_mode(struct device_node *np)
>  static void stmmac_remove_config_dt(struct platform_device *pdev,
>  				    struct plat_stmmacenet_data *plat)
>  {
> -	clk_disable_unprepare(plat->stmmac_clk);
> -	clk_disable_unprepare(plat->pclk);
>  	of_node_put(plat->phy_node);
>  	of_node_put(plat->mdio_node);
>  }
> @@ -436,7 +434,6 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  	struct plat_stmmacenet_data *plat;
>  	struct stmmac_dma_cfg *dma_cfg;
>  	int phy_mode;
> -	void *ret;
>  	int rc;
>  
>  	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
> @@ -615,21 +612,16 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  
>  	/* clock setup */
>  	if (!of_device_is_compatible(np, "snps,dwc-qos-ethernet-4.10")) {
> -		plat->stmmac_clk = devm_clk_get(&pdev->dev,
> -						STMMAC_RESOURCE_NAME);
> +		plat->stmmac_clk = devm_clk_get_enabled(&pdev->dev, STMMAC_RESOURCE_NAME);
>  		if (IS_ERR(plat->stmmac_clk)) {
>  			dev_warn(&pdev->dev, "Cannot get CSR clock\n");
>  			plat->stmmac_clk = NULL;
>  		}
> -		clk_prepare_enable(plat->stmmac_clk);
>  	}
>  
> -	plat->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
> -	if (IS_ERR(plat->pclk)) {
> -		ret = plat->pclk;
> -		goto error_pclk_get;
> -	}
> -	clk_prepare_enable(plat->pclk);
> +	plat->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
> +	if (IS_ERR(plat->pclk))

> +		return (void *)plat->pclk;

Use the ERR_CAST() macro instead of the open coded void type cast.

>  
>  	/* Fall-back to main clock in case of no PTP ref is passed */
>  	plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp_ref");
> @@ -644,26 +636,15 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  
>  	plat->stmmac_rst = devm_reset_control_get_optional(&pdev->dev,
>  							   STMMAC_RESOURCE_NAME);
> -	if (IS_ERR(plat->stmmac_rst)) {
> -		ret = plat->stmmac_rst;
> -		goto error_hw_init;
> -	}
> +	if (IS_ERR(plat->stmmac_rst))

> +		return (void *)plat->stmmac_rst;

ditto

>  
>  	plat->stmmac_ahb_rst = devm_reset_control_get_optional_shared(
>  							&pdev->dev, "ahb");
> -	if (IS_ERR(plat->stmmac_ahb_rst)) {
> -		ret = plat->stmmac_ahb_rst;
> -		goto error_hw_init;
> -	}
> +	if (IS_ERR(plat->stmmac_ahb_rst))

> +		return (void *)plat->stmmac_ahb_rst;

ditto

-Serge(y)

>  
>  	return plat;
> -
> -error_hw_init:
> -	clk_disable_unprepare(plat->pclk);
> -error_pclk_get:
> -	clk_disable_unprepare(plat->stmmac_clk);
> -
> -	return ret;
>  }
>  
>  static void devm_stmmac_remove_config_dt(void *data)
> -- 
> 2.39.0
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
