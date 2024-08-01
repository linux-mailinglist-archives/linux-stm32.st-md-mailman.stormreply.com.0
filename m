Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A639452BA
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Aug 2024 20:32:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 897A3C7129D;
	Thu,  1 Aug 2024 18:32:44 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77DD1C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Aug 2024 18:32:37 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52efc60a6e6so11361404e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 Aug 2024 11:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722537157; x=1723141957;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YjpiM/JH7S8LWRVE7YLqvdV+nTZJioe44+jRr0wOwbc=;
 b=V15YCXVnlXls+gsTfYSynl8Df2T3cLTg7yds12vD9FTKcsgjWv70TlPvGiXv1+zea9
 TAeT6dDIBquKUcmnl3iN7IlyAm6YRt/MuoAookzUr5eCuDGCiGX+2mu08j9s2cY7jhKy
 EpQbkJcdrkmY4/tNUzwvM7guzLI7NBo8G8Tbz0I4PRiX9vVo88mkngvJDKKA537F28uh
 uXmhVXQeUm3mdHmqsQRFEe0Lc0rh4C/QGBWKrcu38iIH5Op1ONXrdieApPwKY0wwhP74
 ixTEGF9vr1Do8KViKMmA6nO4aSo9FNlZLVFcSTS2bcmmRtqiSqsUTuzCLWSA+zmCihpB
 lboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722537157; x=1723141957;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YjpiM/JH7S8LWRVE7YLqvdV+nTZJioe44+jRr0wOwbc=;
 b=sgGNtB65ORyk3kqL51kiIVeBxj1lccgm7C70qq4PGgYuRiBRZi4lzW9m3RRe537POT
 uZXs3fB1/XCpJS0e6AKCtKBJfFD3JfM49pETcLk0uvHNivrQoW7MQ2x8BmvJHIJ2mrsu
 t1vumH1ZOPvkR/64HsIf5/kVqomCYKOOYl49Q8yBbuPsvjxn3ToG6BZl7OMwX2LRmCWS
 yrLgHsfI7xAZzVlG4LZUSIkkb9HZ/XbmafsXGpChrScCIwsGAVfZzq25DYONIYomRNTy
 sl7RTibaBPOrTOObh08yAhb4BQ15EnfKAVpaLfW9sjIMyA7a6LzX5tFTCb4dx8BA69CQ
 d14A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr5riMjWbLpbedZDlRHlLy4gaRGz3JUn4SeuxpMpdR/bSvH2BBxCAuMzk5ZAIF04JErHFR20XBdGxjW28NSzXrwkAtHCa0bJVBdHMrRY2kAzrqd6x3pI8o
X-Gm-Message-State: AOJu0YzchgSheFbPRGVag4UsTakTef0z5izeskCsHronjMl4Wg/hH/xC
 XwwkevHLCS5SAdU1O/6FcINVF68VE7KrnAkPnOzKanxky8YrsxON
X-Google-Smtp-Source: AGHT+IHyjAIc9z6mb3z8s2OoSVvIC24e2n+qUC5/avSJWdohMby92u7QqWKA4Trni8XGQlr6sXK4uA==
X-Received: by 2002:a05:6512:3088:b0:52e:9fd3:f0ca with SMTP id
 2adb3069b0e04-530bb38530amr535233e87.33.1722537156286; 
 Thu, 01 Aug 2024 11:32:36 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530bba1102bsm26619e87.97.2024.08.01.11.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 11:32:35 -0700 (PDT)
Date: Thu, 1 Aug 2024 21:32:32 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Message-ID: <zsdjc53fxh44bpra5cfishtvmyok2rprbtnbthimnu6quxkxyj@kvtijkxylwb3>
References: <20240708-icc_bw_voting_from_ethqos-v4-0-c6bc3db86071@quicinc.com>
 <20240708-icc_bw_voting_from_ethqos-v4-2-c6bc3db86071@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240708-icc_bw_voting_from_ethqos-v4-2-c6bc3db86071@quicinc.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 kernel@quicinc.com, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v4 2/2] net: stmmac: Add interconnect
	support
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

Hi Sagar

On Mon, Jul 08, 2024 at 02:30:01PM -0700, Sagar Cheluvegowda wrote:
> Add interconnect support to vote for bus bandwidth based
> on the current speed of the driver.
> Adds support for two different paths - one from ethernet to
> DDR and the other from CPU to ethernet, Vote from each
> interconnect client is aggregated and the on-chip interconnect
> hardware is configured to the most appropriate bandwidth profile.
> 
> Suggested-by: Andrew Halaney <ahalaney@redhat.com>
> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h          |  1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     |  8 ++++++++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 12 ++++++++++++
>  include/linux/stmmac.h                                |  2 ++
>  4 files changed, 23 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index b23b920eedb1..56a282d2b8cd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -21,6 +21,7 @@
>  #include <linux/ptp_clock_kernel.h>
>  #include <linux/net_tstamp.h>
>  #include <linux/reset.h>
> +#include <linux/interconnect.h>
>  #include <net/page_pool/types.h>
>  #include <net/xdp.h>
>  #include <uapi/linux/bpf.h>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index b3afc7cb7d72..ec7c61ee44d4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -985,6 +985,12 @@ static void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
>  	}
>  }
>  
> +static void stmmac_set_icc_bw(struct stmmac_priv *priv, unsigned int speed)
> +{

> +	icc_set_bw(priv->plat->axi_icc_path, Mbps_to_icc(speed), Mbps_to_icc(speed));
> +	icc_set_bw(priv->plat->ahb_icc_path, Mbps_to_icc(speed), Mbps_to_icc(speed));

I've got two questions in this regard:

1. Don't we need to call icc_enable()/icc_disable() in someplace in
the driver? For instance the CPU-MEM path must be enabled before even
the stmmac_dvr_probe() is called, otherwise the CSR won't be
accessible. Right? For the same reason the CPU-MEM bandwidth should be
set in sync with that.

2. Why is the CPU-MAC speed is specified to match the Ethernet link
speed? It doesn't seem reasonable. It's the CSR's access speed and
should be done as fast as possible. Shouldn't it?

> +}
> +
>  static void stmmac_mac_link_down(struct phylink_config *config,
>  				 unsigned int mode, phy_interface_t interface)
>  {
> @@ -1080,6 +1086,8 @@ static void stmmac_mac_link_up(struct phylink_config *config,
>  	if (priv->plat->fix_mac_speed)
>  		priv->plat->fix_mac_speed(priv->plat->bsp_priv, speed, mode);
>  
> +	stmmac_set_icc_bw(priv, speed);
> +
>  	if (!duplex)
>  		ctrl &= ~priv->hw->link.duplex;
>  	else
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 54797edc9b38..201f9dea6da9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -642,6 +642,18 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  		dev_dbg(&pdev->dev, "PTP rate %d\n", plat->clk_ptp_rate);
>  	}
>  
> +	plat->axi_icc_path = devm_of_icc_get(&pdev->dev, "mac-mem");
> +	if (IS_ERR(plat->axi_icc_path)) {
> +		ret = ERR_CAST(plat->axi_icc_path);
> +		goto error_hw_init;
> +	}
> +
> +	plat->ahb_icc_path = devm_of_icc_get(&pdev->dev, "cpu-mac");
> +	if (IS_ERR(plat->ahb_icc_path)) {
> +		ret = ERR_CAST(plat->ahb_icc_path);
> +		goto error_hw_init;
> +	}
> +
>  	plat->stmmac_rst = devm_reset_control_get_optional(&pdev->dev,
>  							   STMMAC_RESOURCE_NAME);
>  	if (IS_ERR(plat->stmmac_rst)) {
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index f92c195c76ed..385f352a0c23 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -283,6 +283,8 @@ struct plat_stmmacenet_data {
>  	struct reset_control *stmmac_rst;
>  	struct reset_control *stmmac_ahb_rst;
>  	struct stmmac_axi *axi;

> +	struct icc_path *axi_icc_path;

The MAC<->MEM interface isn't always AXI (it can be AHB or custom) and

> +	struct icc_path *ahb_icc_path;

the CPU<->MAC isn't always AHB (it can also be APB, AXI, custom). So
the more generic naming would be:

axi_icc_path -> dma_icc_path
and
ahb_icc_path -> csr_icc_path

-Serge(y)

>  	int has_gmac4;
>  	int rss_en;
>  	int mac_port_sel_speed;
> 
> -- 
> 2.34.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
