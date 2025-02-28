Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B4EA48F1F
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Feb 2025 04:28:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36BBCCFAC47;
	Fri, 28 Feb 2025 03:28:54 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FC39CFAC45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Feb 2025 03:28:52 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-22114b800f7so33438585ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 19:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740713331; x=1741318131;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EY43HLtzrUzkXYHTHJfVcm+528T6DiMSEe7dNOvpyIw=;
 b=KUxbb9BB+GgDu/ODVZroPEH/Yr5jsxZ2GrlHi51NW6PxAPiM0bW5XAJMCk+4UhCRgH
 n/ztoO1p8DTyw/eSeNnRbznmpQLZZ+ghWJnlElMjlCy94nj5j89opETSAtkSAtEXIsn1
 C3tm7CjJAeiJJxHUmnQnjPC4JQokPFKcbGWsLKeC2SPwsP+kF7R/hW4POB6u8Z15ABL1
 bM63I9KxZsxARNruFY46rCM9sAzy7fLQWNRcsTEQV4LWm8HFf5jbn5IvG2TMmPrJ4zTe
 jYzfQ4TzMeslxbnys0ezzuusqoMjVBgpDaaH26VibBbSzjUrtIXlfAnzDqE5vA80SmpZ
 QiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740713331; x=1741318131;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EY43HLtzrUzkXYHTHJfVcm+528T6DiMSEe7dNOvpyIw=;
 b=AXvKTp8ELcpEUneuAKGi6B+PoRoKcPtEZN3Mudhfvz1tt7W2khk0ntf8dgqfTnQt7Q
 h18o/Uq3mU5sualbYbmGvqHUmgC8afVrtTRmA5YNEF16h/1zeDJPSJiwsq6NyvALSfhK
 bZwMr9Xqwf0ypx3iBzUUaEhBvjXbqrGmZT7Tpg7hJ8U4GV9RadYviKZxMfs62uElmHQZ
 xq0lnbH+Ld+kiHKjYXBIMn814gZejDmXrywBYpQ6Psp3hpHTg4eDyNpfYKFwH6V8qYYn
 205fSLNJhXVPs1LWGZ/PdmmpZk+7/t++vPRr3/QpUDH60HspOaO95pZ6AENPDq477l8B
 P+Gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeQdSh43jOJpwFgglaRTWSqDKamNdBe1tQK2mkhV0mGjxfQJb8WF2VTZANFt8RnT8l7liDt4+peZg/qg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxLMV2BTwdisvbBI9jWkaV4S8p6lcSSixNJP74dOGK6BsAiLAjz
 taFySe88aMogYzu+svZZipqfQ7C/oL9BHBoeH2QOZNbLHDJAUOMd
X-Gm-Gg: ASbGnctklzKg7FKn5//bBxWKVeJgHi8Yf/yv4d2Vktr7Xb/Y19FnziJeUqM6mxfUnYG
 Z/1Vo4U/MaAdZoMVkPLL5Zl2F2yS2gFY9cAFuSKyjUDnasISSPze0Q67cBBgyQtJV5u/NMATZ8o
 oCHLXBmgPdb3zhrYf0/kzxy9jneVjCm5WVeIENzFb/gy4vJONE1jmTyTzxtKnCgtX3mVAi4C6Sd
 RFch1lMyL2dNbtCZfAJpNIwZmKgdCyk0WbQF3pAjEgnDrUUpmnhfXrAxjPTcn9HHiVAmhwgSQcZ
 CTf0odZk9wlO07TDj3uNwjk=
X-Google-Smtp-Source: AGHT+IFhTzQtlbRb4GUfkQUHLHJc2YBAelAdku34kRQilo8jgysSfJHVUW03LTM8vyRl+NUxhY5UeQ==
X-Received: by 2002:a17:902:d48f:b0:211:e812:3948 with SMTP id
 d9443c01a7336-22368bc365fmr29598825ad.0.1740713330830; 
 Thu, 27 Feb 2025 19:28:50 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223504c5bf3sm23485515ad.110.2025.02.27.19.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 19:28:50 -0800 (PST)
Date: Fri, 28 Feb 2025 11:28:40 +0800
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250228112840.00003e24@gmail.com>
In-Reply-To: <E1tnfRj-0057SF-9t@rmk-PC.armlinux.org.uk>
References: <Z8B-DPGhuibIjiA7@shell.armlinux.org.uk>
 <E1tnfRj-0057SF-9t@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Thierry Reding <treding@nvidia.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jon Hunter <jonathanh@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 2/5] net: stmmac: remove
 redundant racy tear-down in stmmac_dvr_remove()
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

On Thu, 27 Feb 2025 15:05:07 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> While the network device is registered, it is published to userspace,
> and thus userspace can change its state. This means calling
> functions such as stmmac_stop_all_dma() and stmmac_mac_set() are
> racy.
> 
> Moreover, unregister_netdev() will unpublish the network device, and
> then if appropriate call the .ndo_stop() method, which is
> stmmac_release(). This will first call phylink_stop() which will
> synchronously take the link down, resulting in stmmac_mac_link_down()
> and stmmac_mac_set(, false) being called.
> 
> stmmac_release() will also call stmmac_stop_all_dma().
> 
> Consequently, neither of these two functions need to called prior
> to unregister_netdev() as that will safely call paths that will
> result in this work being done if necessary.
> 
> Remove these redundant racy calls.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 84d8b1c9f6d4..9462d05c40c8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7757,8 +7757,6 @@ void stmmac_dvr_remove(struct device *dev)
>  
>  	pm_runtime_get_sync(dev);
>  
> -	stmmac_stop_all_dma(priv);
> -	stmmac_mac_set(priv, priv->ioaddr, false);
>  	unregister_netdev(ndev);
>  
>  #ifdef CONFIG_DEBUG_FS

We always build stmmac driver as built-in.
Tried to build stmmac driver as a module, but some complicated dependencies were
reported in our down-stream kernel :(
I can not test this patch, so:

Reviewed-by: Furong Xu <0x1207@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
