Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F819184F3
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2024 16:55:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E059FC71282;
	Wed, 26 Jun 2024 14:55:00 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FE4CC6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 14:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719413693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=//2/DtIq0ARa2uL83ir1t16NVZrzvNrg5uroU1ouOJc=;
 b=arXtvvLWs+ar8iRaggjwEAU7s232EA3QciFGWjuTf0RdQebeMyEXaQrXah24q9x7yyHoHM
 o+uf8ozgNIe72YAJOk/aJOZMFHTGvzjWT440Im8GPwjdiRTGi3Wg0KetT1TR91XNxPoM/H
 FGs0oZd5O2mni9Gv74f3uR5pWCh0iXo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-lxzIDBMmNLefCdoFciIlTQ-1; Wed, 26 Jun 2024 10:54:51 -0400
X-MC-Unique: lxzIDBMmNLefCdoFciIlTQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6b51725a7ebso101797396d6.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 07:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719413691; x=1720018491;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=//2/DtIq0ARa2uL83ir1t16NVZrzvNrg5uroU1ouOJc=;
 b=wTIi2ArymgueIW2OtXbwnA47ZcI+koCIf5MEnf6g+Dh6+e4CSsLh99HduDhO2tWli0
 wNF75gtM/W7Tdyc3XvmwQ0mWwV+a1AH5460CNuioE14YVYJBgLUAKtmo5FK7IDSXqln3
 1CJ5d46MkTwTBqxhiW9cs3R41NqS1Dgq+SIYNdHMT0RuNC6dm8UnxcQf03ZMIwn7+w1m
 RDn7bxLLhoeplVxXR7d7hvWmi/+1BwxBkNhbHAC5VNvYwbd2d4B3XjCFVkWHcFudB6re
 t5URbkLFV9dXjNWjXO7ZZiDrgDC1JMFp/SxzOkhSXERH4fFZ1BE/Gut2+sBKhUiP6kWS
 Wm6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR4I9/9FvLltK7hmOG6Qlve849i0gYv0mhjZb7IQLCNF2Fl95MAoQHZxX8iLTCLpUjgMQqRtbBNwoa60XvRne3QxsR4kGWbDGT5ogHc204LCAG0o6/dLpM
X-Gm-Message-State: AOJu0YwenCoMOu04koSCS2QhqA7usKcJKUIfpOJbYhCXBe29l7UjRNdv
 OAVC3HLRXZ1pXLqNf6aTi1AVMoPFy5K8sIH5wzteICFxXfV3cdXCQUIR9i7uW/0T1CK1O7FCuQ4
 9pSwxn5vxDrbQC46FJeqkbedu4Uu4ybTiOjMM1/WaTwgo5b8qO29ClyFDbynf9MIrzwFN5g0vgZ
 IOHw==
X-Received: by 2002:a0c:8d8e:0:b0:6b5:4bf8:57f0 with SMTP id
 6a1803df08f44-6b54bf859b1mr86412346d6.48.1719413691347; 
 Wed, 26 Jun 2024 07:54:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2KWuzVgP6gdLOaQfx8FcyTgNfdnV8FG80Y5HA1R10pLIJSc4H3+AKQ0TSGSjJssFCY/jspw==
X-Received: by 2002:a0c:8d8e:0:b0:6b5:4bf8:57f0 with SMTP id
 6a1803df08f44-6b54bf859b1mr86412086d6.48.1719413690987; 
 Wed, 26 Jun 2024 07:54:50 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::f])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b51ef54b40sm54996006d6.114.2024.06.26.07.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 07:54:50 -0700 (PDT)
Date: Wed, 26 Jun 2024 09:54:48 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Message-ID: <owkerbnbenzwtnu2kbbas5brhnak2e37azxtzezmw3hb6mficq@ffpqrqglmp4c>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-2-eaa7cf9060f0@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20240625-icc_bw_voting_from_ethqos-v2-2-eaa7cf9060f0@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/3] net: stmmac: Add interconnect
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

On Tue, Jun 25, 2024 at 04:49:29PM GMT, Sagar Cheluvegowda wrote:
> Add interconnect support to vote for bus bandwidth based
> on the current speed of the driver.This change adds support
> for two different paths - one from ethernet to DDR and the
> other from Apps to ethernet.

"APPS" is a qualcomm term, since you're trying to go the generic route
here maybe just say CPU to ethernet?

> Vote from each interconnect client is aggregated and the on-chip
> interconnect hardware is configured to the most appropriate
> bandwidth profile.
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
> index 54797edc9b38..e46c94b643a3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -642,6 +642,18 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  		dev_dbg(&pdev->dev, "PTP rate %d\n", plat->clk_ptp_rate);
>  	}
>  
> +	plat->axi_icc_path = devm_of_icc_get(&pdev->dev, "axi");
> +	if (IS_ERR(plat->axi_icc_path)) {
> +		ret = (void *)plat->axi_icc_path;
> +		goto error_hw_init;
> +	}
> +
> +	plat->ahb_icc_path = devm_of_icc_get(&pdev->dev, "ahb");
> +	if (IS_ERR(plat->ahb_icc_path)) {
> +		ret = (void *)plat->ahb_icc_path;
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
> +	struct icc_path *ahb_icc_path;
>  	int has_gmac4;
>  	int rss_en;
>  	int mac_port_sel_speed;
> 
> -- 
> 2.34.1
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
