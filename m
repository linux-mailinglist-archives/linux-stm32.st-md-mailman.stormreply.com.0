Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9861E963CA4
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Aug 2024 09:22:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AD52C6DD6E;
	Thu, 29 Aug 2024 07:22:25 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B53EC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2024 07:22:18 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53438aa64a4so348705e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2024 00:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724916138; x=1725520938;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KtjwnfDZc+MeLAmGkbfb0sfheHV4T3Fk2/Eu23YsZfw=;
 b=hUnWwMgTU2KZzv/o0VMEpH0YMIttVOXWtndL4LPJnwhBZ0QtGfiZ9rPHm2mTxGy77Z
 D6FV5f5R31iL3VniiD7vMhtfMc7FhMVUcJ0iWEzl/P1pg4JYSVeUmIu6mBS55htwHYnr
 qwR95to2n8rKbEHlFN4HxpGszZA42jTPCUGszfZ+Ei+LmKK/fBB+LJnpanRQP90D+iOj
 8OWNMz2LWjK7bqpjDSRYi/a2/gWrIha8PmI1NHV1i8fUuaJAhHm0ii1tpuIX5Cy5DbCd
 cs5uccCxFHBNx7ALufeDy7VL5lfP1IhQc0v1trSQ81nVxWCYACX1Tt1xddtixd1QQzFX
 EbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724916138; x=1725520938;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KtjwnfDZc+MeLAmGkbfb0sfheHV4T3Fk2/Eu23YsZfw=;
 b=wql0m40d4v2F6OTkvFaJhnWIEQYmV3aPQcfL/7LBHhevibQSWJCQZCs67Eo3iw2jNG
 jaIwpTqChRXUo9/DCycZSBwrKy8Zq6DiWt9t5albfOj10w+ry4QzFlgdcCRIdj4GaVaE
 QaJIZh1QX7Hv2U+o5C0w+lz1I2C4vL3PBz2j3Alg++P8K9nn9yz4bEHvc+8M8rzEnrxv
 lAAuPacdmXO5vSpIGCdBa6RuQf713DKi+x8GJFAUIW8rXWjZvDR+TU4EtzPVBcREJ0sO
 hOw8cMOy8N5TEaJyX56VUasPXkR2Xnk0j44IyU/4YHsDlncLMP1rngKVjvApAeuUTMs4
 v/3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkNfJ1eeU4bF03mD/S6yykXkkeqKwwp3rsnCtssStfQm3T3ymSI8hxo39y5eGoXIIG2mDx0g16FIzZXA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxvbVOXi/RpYzAVuw4986pPR0Kp2V5pJt7adW9Jb/kYy0643qFU
 FoSdJ2tGm3L3UrFDPqE76kfkKvr5de+C1xWC6u0VjTC5V9UrViXe
X-Google-Smtp-Source: AGHT+IF5XaWAGl6H1gA8mxIJyEN74t75E/cL+sTGh9Pt6w5uw2tVVCzJ/HEvohvo/Yit39SyPitG7A==
X-Received: by 2002:a05:6512:6cf:b0:52e:f4b4:6ec1 with SMTP id
 2adb3069b0e04-5353e5b11aamr1133883e87.46.1724916137061; 
 Thu, 29 Aug 2024 00:22:17 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53540827a76sm77446e87.134.2024.08.29.00.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 00:22:16 -0700 (PDT)
Date: Thu, 29 Aug 2024 10:22:13 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <ohd2gt3hsy3toxz26jy3fmymjb6ph2cdsisb4lpobz74hr3lzl@vmd2gg6barmp>
References: <20240827095712.2672820-1-frank.li@vivo.com>
 <20240827095712.2672820-3-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240827095712.2672820-3-frank.li@vivo.com>
Cc: andrew@lunn.ch, marcin.s.wojtas@gmail.com, linus.walleij@linaro.org,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, sd@queasysnail.net, linux@armlinux.org.uk,
 joabreu@synopsys.com, u.kleine-koenig@pengutronix.de, jacob.e.keller@intel.com,
 kuba@kernel.org, pabeni@redhat.com, clement.leger@bootlin.com,
 mcoquelin.stm32@gmail.com, ulli.kroll@googlemail.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 horms@kernel.org, justinstitt@google.com, olteanv@gmail.com,
 davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [net-next v3 2/9] net: stmmac: platform: Convert
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

On Tue, Aug 27, 2024 at 03:57:05AM -0600, Yangtao Li wrote:
> Use devm_clk_get_enabled() and devm_clk_get_optional_enabled()
> to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Suggested-by: Serge Semin <fancer.lancer@gmail.com>

Can't remember that I suggested the entire change, but merely the
ERR_CAST() macro utilization. Anyway the patch now looks good:

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

Thanks.
-Serge(y)

> ---
> v2:
> -remove unused 'ret'
> -fix incompatible-pointer-types
> 
>  .../ethernet/stmicro/stmmac/stmmac_platform.c | 35 +++++--------------
>  1 file changed, 8 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index ad868e8d195d..4365afabf3c4 100644
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
> +		return ERR_CAST(plat->pclk);
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
> +		return ERR_CAST(plat->stmmac_rst);
>  
>  	plat->stmmac_ahb_rst = devm_reset_control_get_optional_shared(
>  							&pdev->dev, "ahb");
> -	if (IS_ERR(plat->stmmac_ahb_rst)) {
> -		ret = plat->stmmac_ahb_rst;
> -		goto error_hw_init;
> -	}
> +	if (IS_ERR(plat->stmmac_ahb_rst))
> +		return ERR_CAST(plat->stmmac_ahb_rst);
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
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
