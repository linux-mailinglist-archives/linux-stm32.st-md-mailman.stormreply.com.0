Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C30798D1B2C
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2024 14:26:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7ADF6CFAC7F;
	Tue, 28 May 2024 12:26:19 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 140E2C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 12:26:13 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2e974857588so7340181fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 05:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716899172; x=1717503972;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AGw+oqvGA7DgwvDoc/gqjp79A8MF1QwuRHvTe8A8wW8=;
 b=Xn4PdTR15LofeZypo4Dwr/bWKbwkumuI4N8YAYnDqp9ALYkB0dwTJM+j94n3cuZz3U
 /xRrOFFutWH1rpeg6KZ+gOghU7vVS9vui+K4hxAdeN1hsbuaALryA8uBvaIFy+COMbKl
 st9LR9Z36Ww+RArjZvU8GkNTeh8tJEBL31WjKf3L5j+nnkoXNEypHkHRj6sDzeKZIHOs
 GDC2bOXTMO3C6X0IspMWk+715UUNCvc9PUTdt1XblO+3BF8R7gO7H/AjYaepemZ1XQ8c
 lMticmCwlxMr3qaxrS/StadTs/o39BFbEwUiQrpgHSLZqeFGvEcNqj838pcCGMbIGUyA
 Y1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716899172; x=1717503972;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AGw+oqvGA7DgwvDoc/gqjp79A8MF1QwuRHvTe8A8wW8=;
 b=divU6KYBe/SZEZYcLNIrFZcMh7+x8I0bWo3qOzp/pwVRAHuE0/tGl6sJfuvX39aHsp
 RivyZbLczP97L4yFRdM+R5d8LcsfHG1hnJU1msHSjyhcRZyWl+NlI+UB52lkUpFbva92
 BOTF/Wl8wpMqRIBgARpGBQ5Hk/5PlvRv7dAzEgFI0HAcU3tNgvbCGNgqMzOzUA4cdmNF
 ysf+zxpy//gOQxtFi4fpCVs1Bix0bwsPQtT9i2oGqLZXzoqpxrSW2HZNb9mrHB9Xt4WH
 nJaS2nK8DNu4NW6B7K0sDkYinQJeTnLXkOzQYdcnV3XvwfvIsSXrlTpRIOvwP8mzhB8O
 kczA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXda9sbqHI2fOePL8TcUUdqGxjKGV/u+MVLQ1QnOgW2oeCKbB6BckF/ddC0CaGIRaMVVkTdgBhZrA/MXrcTLjxCH57t/WLQ5/hujkqhdtmVfliBpAmBmG4m
X-Gm-Message-State: AOJu0Yz2zEs35IBrYOqkiitbObwidFEZl9tNjx0lZBwExxtny9Lu2+r2
 pwpyT3vmZRvdPRVJC3YhvHUTbJ3DUrKN6LT1K1P7IUIRzJX/3TzW
X-Google-Smtp-Source: AGHT+IFHhKRh0WWtc4lf70RdyhZhbDdcVpCQy0mzBvQhx9NxjCQlG/xaC53N0d7jdVVcK3FF5NERRQ==
X-Received: by 2002:a05:651c:234:b0:2e9:84ee:ae7a with SMTP id
 38308e7fff4ca-2e984eeb084mr14546011fa.48.1716899172224; 
 Tue, 28 May 2024 05:26:12 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95bcfe722sm22466211fa.70.2024.05.28.05.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 05:26:11 -0700 (PDT)
Date: Tue, 28 May 2024 15:26:10 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Message-ID: <66lbyxnuhqhng2j2bmnw4ke6bqeknpeb476b2wjhr3xdstr5jw@vlgbxf3ni7nt>
References: <ZlXEgl7tgdWMNvoB@shell.armlinux.org.uk>
 <E1sBvJl-00EHyQ-QG@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1sBvJl-00EHyQ-QG@rmk-PC.armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/5] net: stmmac: Drop TBI/RTBI
	PCS flags
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

On Tue, May 28, 2024 at 12:48:37PM +0100, Russell King wrote:
> From: Serge Semin <fancer.lancer@gmail.com>
> 
> First of all the flags are never set by any of the driver parts. If nobody
> have them set then the respective statements will always have the same
> result. Thus the statements can be simplified or even dropped with no risk
> to break things.
> 
> Secondly shall any of the TBI or RTBI flag is set the MDIO-bus
> registration will be bypassed. Why? It really seems weird. It's perfectly
> fine to have a TBI/RTBI-capable PHY configured over the MDIO bus
> interface.
> 
> Based on the notes above the TBI/RTBI PCS flags can be freely dropped thus
> simplifying the driver code.

Likely by mistake the vast majority of the original patch content has
been missing here:
https://lore.kernel.org/netdev/20240524210304.9164-3-fancer.lancer@gmail.com/

-Serge(y)

> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index b3afc7cb7d72..e01340034d50 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7833,10 +7833,7 @@ void stmmac_dvr_remove(struct device *dev)
>  	reset_control_assert(priv->plat->stmmac_ahb_rst);
>  
>  	stmmac_pcs_clean(ndev);
> -
> -	if (priv->hw->pcs != STMMAC_PCS_TBI &&
> -	    priv->hw->pcs != STMMAC_PCS_RTBI)
> -		stmmac_mdio_unregister(ndev);
> +	stmmac_mdio_unregister(ndev);
>  	destroy_workqueue(priv->wq);
>  	mutex_destroy(&priv->lock);
>  	bitmap_free(priv->af_xdp_zc_qps);
> -- 
> 2.30.2
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
