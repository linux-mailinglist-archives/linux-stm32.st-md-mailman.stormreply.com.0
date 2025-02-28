Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA50A49236
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Feb 2025 08:31:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08D62C7128A;
	Fri, 28 Feb 2025 07:31:41 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 310F3C01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Feb 2025 07:31:39 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2234daaf269so47832105ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 23:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740727897; x=1741332697;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OEo5Ilj/CnKUxlNE5iH4oY22/g/iUpKFoP4fBLWqvpA=;
 b=AB1LCPZbZwtnRZMVbnmW4w3Ez6NQG6ncBT8tLDame0yJLbXaBrz5HCWCCZFIEEJe+r
 2yRME/z2olp8PI3nmLYyDSpOHYt52tUBGzaj+x1XECkN4FO/msLux19VD4ZFs8zqx42j
 wmMtAqaUzZYvChmI9lT13SEG5d0UoQEwbgJC02+3Jomwf0hBMG7vLJlorZOUdMFcPyYu
 +ZHtyuXfspKHi4QYuN5xsIW7Gax+t9nXrT9U+uMg99WXeJK5g7sf4i0Ry8dfS1+AtLAb
 RQWm4YkkfcbIqd7LAEu4gNShZwfOBr+j3YIrZoIuswCRazHRrh+3klzHvWsHxF6bYrjy
 PzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740727897; x=1741332697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OEo5Ilj/CnKUxlNE5iH4oY22/g/iUpKFoP4fBLWqvpA=;
 b=nap3Trhae7kHtdZ6NaRlaZr4h1KrhOKgVlHYPWpOIGlqnjqV6HD6VvkCmeBhqWY+5E
 NmLFklrCrLF1PZfKeb3SH2GocRewfDEBFura09dUOtAz4yfme6iwq+wCke7N3WRgbwK1
 f2FTQhvgh+wjMVz9FeH4uN4wPg0Wy9sFTKlzhhxOkFVYh9cigu9HSu5CkdDRoLzZNlZI
 BQVlniTN+JupDjYyYdukKK3y9yUNh/5hcMc8Ns+MoIq8KLnxS7Cup26k0M2nPiTQ2Rq/
 aUEUvC3uXwTBkIyysd3ao8izvCUECfiqE7+gke6HJ5hmLoM6rZgzD04KMNu4mvtwKKoN
 5XdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2ov5EJq3FCid3sOcPaHxvaDL9iH288BrVxvpyIxRdQAhjLxN5gLAQsuw8/SBWJOBq+c3IQSSMgcMsxQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyuz6uBtpVsNzvNy9sYZ3bYRx2/YOBoI3Qw24YMkZtzqLQh0DIi
 8A7IkX8vVHqNqnfcoGBwt/B61ovqVrXtCWVIFfOURdaIr3CqkpZq
X-Gm-Gg: ASbGncuhWf7y+bjIwrNokofzPQ4ggun6jm0CiKrFKvk0mQvqsHxCHbgcCZB5Jf+KxGq
 QhHTe9nVQ5h/+Tv4AtHbkmTuU+x6+ktNzaqmo+YAYJM0IlD4Rll3aZ8z3VrdHsKIV0LtoiHqTxT
 SJ7h08/2q/UCBzCcRTZTvj7tl2703V6LVNVzuHCTMWo1JPtgQ+geuA5b825lzuKIqTZ4ChuPt2K
 AdihsYltKXKw06+iGWS6HGpXYi3DSj5JixkFHxfCDpXQH5JbZf5GgRYTVxxWnmPixbJybIy3nO4
 gz3bLTVaK7aTRUvpEyKO5Bk=
X-Google-Smtp-Source: AGHT+IFrEMfFeWVgVjwA/8gquLeiMkDUEwznolmMGr2Xy7GVL3JkNx1UIJph/S+ONtF7kGxuiKo4sQ==
X-Received: by 2002:a17:903:292:b0:21f:7e12:5642 with SMTP id
 d9443c01a7336-22368fbee43mr34263825ad.18.1740727897464; 
 Thu, 27 Feb 2025 23:31:37 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fe999a5a1dsm3795470a91.33.2025.02.27.23.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 23:31:37 -0800 (PST)
Date: Fri, 28 Feb 2025 15:31:22 +0800
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250228153122.00007c75@gmail.com>
In-Reply-To: <E1tnfRe-0057S9-6W@rmk-PC.armlinux.org.uk>
References: <Z8B-DPGhuibIjiA7@shell.armlinux.org.uk>
 <E1tnfRe-0057S9-6W@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Thierry Reding <treding@nvidia.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jon Hunter <jonathanh@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 1/5] net: stmmac: call
 phylink_start() and phylink_stop() in XDP functions
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

On Thu, 27 Feb 2025 15:05:02 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Phylink does not permit drivers to mess with the netif carrier, as
> this will de-synchronise phylink with the MAC driver. Moreover,
> setting and clearing the TE and RE bits via stmmac_mac_set() in this
> path is also wrong as the link may not be up.
> 
> Replace the netif_carrier_on(), netif_carrier_off() and
> stmmac_mac_set() calls with the appropriate phylink_start() and
> phylink_stop() calls, thereby allowing phylink to manage the netif
> carrier and TE/RE bits through the .mac_link_up() and .mac_link_down()
> methods.
> 
> Note that RE should only be set after the DMA is ready to avoid the
> receive FIFO between the MAC and DMA blocks overflowing, so
> phylink_start() needs to be placed after DMA has been started.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 13796b1c8d7c..84d8b1c9f6d4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6887,6 +6887,8 @@ void stmmac_xdp_release(struct net_device *dev)
>  	/* Ensure tx function is not running */
>  	netif_tx_disable(dev);
>  
> +	phylink_stop(priv->phylink);
> +
>  	/* Disable NAPI process */
>  	stmmac_disable_all_queues(priv);
>  
> @@ -6902,14 +6904,10 @@ void stmmac_xdp_release(struct net_device *dev)
>  	/* Release and free the Rx/Tx resources */
>  	free_dma_desc_resources(priv, &priv->dma_conf);
>  
> -	/* Disable the MAC Rx/Tx */
> -	stmmac_mac_set(priv, priv->ioaddr, false);
> -
>  	/* set trans_start so we don't get spurious
>  	 * watchdogs during reset
>  	 */
>  	netif_trans_update(dev);
> -	netif_carrier_off(dev);
>  }
>  
>  int stmmac_xdp_open(struct net_device *dev)
> @@ -6992,25 +6990,25 @@ int stmmac_xdp_open(struct net_device *dev)
>  		tx_q->txtimer.function = stmmac_tx_timer;
>  	}
>  
> -	/* Enable the MAC Rx/Tx */
> -	stmmac_mac_set(priv, priv->ioaddr, true);
> -
>  	/* Start Rx & Tx DMA Channels */
>  	stmmac_start_all_dma(priv);
>  
> +	phylink_start(priv->phylink);
> +
>  	ret = stmmac_request_irq(dev);
>  	if (ret)
>  		goto irq_error;
>  
>  	/* Enable NAPI process*/
>  	stmmac_enable_all_queues(priv);
> -	netif_carrier_on(dev);
>  	netif_tx_start_all_queues(dev);
>  	stmmac_enable_all_dma_irq(priv);
>  
>  	return 0;
>  
>  irq_error:
> +	phylink_stop(priv->phylink);
> +
>  	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
>  		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
>  

XDP programs work like a charm both before and after this patch.

Tested-by: Furong Xu <0x1207@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
