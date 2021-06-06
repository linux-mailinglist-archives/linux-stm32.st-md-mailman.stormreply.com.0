Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0AC39CC72
	for <lists+linux-stm32@lfdr.de>; Sun,  6 Jun 2021 05:24:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1252C57B6B;
	Sun,  6 Jun 2021 03:24:53 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25383C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Jun 2021 03:24:49 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 v27-20020a056830091bb02903cd67d40070so10195887ott.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 05 Jun 2021 20:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ni3eGvt+i+5aePMZevK8GoIbwGrBNouUTOTilLJGCcQ=;
 b=LZf9hwtjLmlD/EeoSYDYbj1A9ZyuAdhJaEjcMiUf+pLmtpvxN1dqbojhVk3jwiAB+T
 C3s/rZ/3IRkbA8x2zD4urLBe7zBpASZAnNkF/guex8VaxoqWGd1ijxIhBxeLW4hoiiX9
 f3Neg36W0u6VZgVicl3P951NMdw/+0SnHmokQRFpGQyQwH7JbvB2jjoFLL/UqOHel2Wd
 8n85WNYLu6Ih1fLoV2FzJz9eTL2lw6/Tq7gqdlj8OnFGRpgH0I/xyBObS2ra9sXppGYK
 ffEZOTLB1Sg6wgBhHclUaxFBQF7lYlWD3trE0dyApVz52/uEWr3GiKCIZF3MXwoDM05K
 +RnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ni3eGvt+i+5aePMZevK8GoIbwGrBNouUTOTilLJGCcQ=;
 b=Vr7DHFmWi0mBop/M/upOe/w+8w4mUI+zPRv5LCHDdrNtZA1Es0ixS2qZHFKvjaWW5H
 BdCWYbaFNMHpc8kZjYJAqO+JfoVoWvQ6ARdpTN5dkv2pbrptQZ6TqXgHNg6tkTwUVap7
 HQA0AMeeJpwGoKq6kuxKTN4MMYlfJVYvuY7bzJYxR12y4ZCNqoZ5It0+ctD5cJ+vcwpB
 iHwpWpSthbE/xIsCO2OiEzWJHVhAnQw+rHSJKMufyx44/waMDdBpf/cGC7hf6iBT5YYP
 eYoqk+zUKTq8CfrxZb1j9dbSN/8KPjXQz0r3UN42GBUxFEgLyNsUiLyIWY8t5LV5xMZ4
 KE4A==
X-Gm-Message-State: AOAM533xtarzsuzkPhrBVZY1TQokU9mSLq3oHzkn2VOTcrMdNZcTxfEm
 VkmqccLC7pT+ezn7U4xZzxuH6Q==
X-Google-Smtp-Source: ABdhPJyRc/QyzvY3Swve80HRZpUbaVQo39xFAvWvcHetsyu19hof3cyxtGdvkdZZlNmzXkkX2BnMdg==
X-Received: by 2002:a9d:704b:: with SMTP id x11mr3397307otj.110.1622949887957; 
 Sat, 05 Jun 2021 20:24:47 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id r5sm1539711otp.45.2021.06.05.20.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jun 2021 20:24:47 -0700 (PDT)
Date: Sat, 5 Jun 2021 22:24:45 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Matthew Hagan <mnhagan88@gmail.com>
Message-ID: <YLw//XARgqNlRoTB@builder.lan>
References: <20210605173546.4102455-1-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210605173546.4102455-1-mnhagan88@gmail.com>
Cc: Jose Abreu <joabreu@synopsys.com>,
 Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 Fugang Duan <fugang.duan@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Voon Weifeng <weifeng.voon@intel.com>, devicetree@vger.kernel.org, "Wong,
 Vee Khee" <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Tan Tee Min <tee.min.tan@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] net: stmmac: explicitly deassert
	GMAC_AHB_RESET
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

On Sat 05 Jun 12:35 CDT 2021, Matthew Hagan wrote:

> We are currently assuming that GMAC_AHB_RESET will already be deasserted
> by the bootloader. However if this has not been done, probing of the GMAC
> will fail. To remedy this we must ensure GMAC_AHB_RESET has been deasserted
> prior to probing.
> 

Sounds good, just some small style comments below.

> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 7 +++++++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 7 +++++++
>  include/linux/stmmac.h                                | 1 +
>  3 files changed, 15 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 6d41dd6f9f7a..1e28058b65a8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6840,6 +6840,13 @@ int stmmac_dvr_probe(struct device *device,
>  			reset_control_reset(priv->plat->stmmac_rst);
>  	}
>  
> +	if (priv->plat->stmmac_ahb_rst) {

You don't need this conditional, stmmac_ahb_rst will be NULL if not
specified and you can reset_control_deassert(NULL) without any problems.

> +		ret = reset_control_deassert(priv->plat->stmmac_ahb_rst);
> +		if (ret == -ENOTSUPP)
> +			dev_err(priv->device,
> +				"unable to bring out of ahb reset\n");

No need to wrap this line.

> +	}
> +
>  	/* Init MAC and get the capabilities */
>  	ret = stmmac_hw_init(priv);
>  	if (ret)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 97a1fedcc9ac..d8ae58bdbbe3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -600,6 +600,13 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  		goto error_hw_init;
>  	}
>  
> +	plat->stmmac_ahb_rst = devm_reset_control_get_optional_shared(
> +							&pdev->dev, "ahb");
> +	if (IS_ERR(plat->stmmac_ahb_rst)) {
> +		ret = plat->stmmac_ahb_rst;

You need a PTR_ERR() around the plat->stmmac_ahb_rst.

Regards,
Bjorn

> +		goto error_hw_init;
> +	}
> +
>  	return plat;
>  
>  error_hw_init:
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index e55a4807e3ea..9b6a64f3e3dc 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -239,6 +239,7 @@ struct plat_stmmacenet_data {
>  	unsigned int mult_fact_100ns;
>  	s32 ptp_max_adj;
>  	struct reset_control *stmmac_rst;
> +	struct reset_control *stmmac_ahb_rst;
>  	struct stmmac_axi *axi;
>  	int has_gmac4;
>  	bool has_sun8i;
> -- 
> 2.26.3
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
