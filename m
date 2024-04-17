Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AD98A8BE1
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Apr 2024 21:13:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69FE5C6C859;
	Wed, 17 Apr 2024 19:13:41 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7396C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 19:13:40 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-516d3a470d5so1413e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 12:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713381220; x=1713986020;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JTcCtqawFKRHlvcDtRKkDTTkbfy/GJAXrQ0aSEOy+RI=;
 b=nU7lv6tWmClsCOBvlYb3OS3wEJAb+eult9ggOL+iRgw5W+GfIRxoh/Aa7eIokl4n9n
 lL+9/NDEQekwZVx426/wALFRcU3a3/5SUD0vP43U/Yaa+0eX5NaOY4FW2R19bn7Z/zfK
 XRpoVUzc/AifCsIg8FEQg5sg+FF2uojHHR6/9Glg1pZOgK8fPuncIgbBSQPIOY6ueXWO
 YJfvEuMNcbwj4VKbs0p3sLFrC6Ahd8IL3KyOmGq7jRwV3C4/CXjvMXmcGlHGuxCB5SLw
 lXTCflkTrgqYpxt9vDaT7L1ktOe9JVIO952Dd1IqtzBgPt8Smd19zu1Zm/e+ZSgTr1d9
 wdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713381220; x=1713986020;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JTcCtqawFKRHlvcDtRKkDTTkbfy/GJAXrQ0aSEOy+RI=;
 b=azAI8u6ki0561PlnO6CUSTU39/O4KDnTwSAP8UJX4WnKizMiSuA3nDZ44U5ZIVLp5l
 7Lbw7acDoqyUrrvaoQrr6LcExcF5sDPXInhDsNOmlLaPXXuKJS+oNGnU41JMXa2zfihx
 /b1xP0TLbHCBPwYqFol1e6S7mpyg7LzCe25J9L9VERtdB1bQgSTou5uTYuTXTPLW2wDR
 +w506Zx96psU8yyIatNR59Y28fHdArBh7gzbT1nMBY1FVkxnt8lViZbWu67BEZZ/X3zP
 1+f7hJ7sOUt5NKjrkY93mYzpwVHtOvJQ8GSbOCkbYgTTlwYE5gqauYEMg8hEL/a3RTs8
 faew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcx3HT5OpPNnlB/MXsXSEvuf/1wlmRpGNbJB9P6nWrYFP99FchekJRFwBaxBB4ii9U+OXW1au2LDW13A8hi2+Y4z5yq3WLm9QZo/EeNG6AT8uPTDbluAc9
X-Gm-Message-State: AOJu0Yyro2mYYtOqzmxvfVC95aUxXp2FxluVwaHrdV03w2lcx9WcVGHS
 4TiF8MFCaRMD5qC3BVABzfcd4QWEEfSOgqhzF+n7EVgHnmRYAU05
X-Google-Smtp-Source: AGHT+IEA0/ml2vS2S5lnkSe66SZb269sVi/52jJbQD/EKj42WqO5Y8kEwvaZGCTBSCq0H+wObYP3lg==
X-Received: by 2002:ac2:5fcf:0:b0:515:99f6:2ca4 with SMTP id
 q15-20020ac25fcf000000b0051599f62ca4mr104968lfg.36.1713381219670; 
 Wed, 17 Apr 2024 12:13:39 -0700 (PDT)
Received: from mobilestation.baikal.int (srv1.baikalchip.ru. [87.245.175.227])
 by smtp.gmail.com with ESMTPSA id
 q3-20020ac25143000000b00518c86b3eb7sm1251742lfd.80.2024.04.17.12.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 12:13:39 -0700 (PDT)
Date: Wed, 17 Apr 2024 22:13:37 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <3ib7rkbwxtdd26waw2dseuwwlijhxxjmjp6jbxe6g6i5hk6ua2@3zt2avhdh2lu>
References: <20240417164316.1755299-1-o.rempel@pengutronix.de>
 <20240417164316.1755299-5-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240417164316.1755299-5-o.rempel@pengutronix.de>
Cc: Woojung Huh <woojung.huh@microchip.com>, Andrew Lunn <andrew@lunn.ch>,
 Arun Ramadoss <arun.ramadoss@microchip.com>, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 UNGLinuxDriver@microchip.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v1 4/4] net: stmmac: use delays
 reported by the PHY driver to correct MAC propagation delay
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

On Wed, Apr 17, 2024 at 06:43:16PM +0200, Oleksij Rempel wrote:
> Now after PHY drivers are able to report data path delays, we can use
> them in the MAC drivers for the delay correction.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h    |  2 ++
>  .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c   |  4 ++++
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c   | 17 ++++++++++++++++-
>  3 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index dddcaa9220cc3..6db54ce33ea72 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -288,6 +288,8 @@ struct stmmac_priv {
>  	u32 sub_second_inc;
>  	u32 systime_flags;
>  	u32 adv_ts;

> +	u64 phy_tx_delay_ns;
> +	u64 phy_rx_delay_ns;

What's the point in adding these fields to the private data if you
retrieve the delays and use them in a single place? Just extend the
stmmac_hwtstamp_correct_latency() arguments list and pass the delays
as the function parameters.

-Serge(y)

>  	int use_riwt;
>  	int irq_wake;
>  	rwlock_t ptp_lock;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
> index f05bd757dfe52..bbf284cb7cc2a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
> @@ -71,6 +71,8 @@ static void hwtstamp_correct_latency(struct stmmac_priv *priv)
>  	/* MAC-internal ingress latency */
>  	scaled_ns = readl(ioaddr + PTP_TS_INGR_LAT);
>  
> +	scaled_ns += priv->phy_rx_delay_ns << 16;
> +
>  	/* See section 11.7.2.5.3.1 "Ingress Correction" on page 4001 of
>  	 * i.MX8MP Applications Processor Reference Manual Rev. 1, 06/2021
>  	 */
> @@ -95,6 +97,8 @@ static void hwtstamp_correct_latency(struct stmmac_priv *priv)
>  	/* MAC-internal egress latency */
>  	scaled_ns = readl(ioaddr + PTP_TS_EGR_LAT);
>  
> +	scaled_ns += priv->phy_tx_delay_ns << 16;
> +
>  	reg_tsec = scaled_ns >> 16;
>  	reg_tsecsns = scaled_ns & 0xff00;
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index fe3498e86de9d..30c7c278b7062 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1097,8 +1097,23 @@ static void stmmac_mac_link_up(struct phylink_config *config,
>  	if (priv->dma_cap.fpesel)
>  		stmmac_fpe_link_state_handle(priv, true);
>  
> -	if (priv->plat->flags & STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY)
> +	if (priv->plat->flags & STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY) {
> +		int ret = 0;
> +
> +		if (phy)
> +			ret = phy_get_timesync_data_path_delays(phy,
> +								&priv->phy_tx_delay_ns,
> +								&priv->phy_rx_delay_ns);
> +		if (!phy || ret) {
> +			if (ret != -EOPNOTSUPP)
> +				netdev_err(priv->dev, "Failed to get PHY delay: %pe\n",
> +					   ERR_PTR(ret));
> +			priv->phy_tx_delay_ns = 0;
> +			priv->phy_rx_delay_ns = 0;
> +		}
> +
>  		stmmac_hwtstamp_correct_latency(priv, priv);
> +	}
>  }
>  
>  static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
> -- 
> 2.39.2
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
