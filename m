Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE1081128B
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Dec 2023 14:09:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F4C0C6B45D;
	Wed, 13 Dec 2023 13:09:19 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C93C4C6B458
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Dec 2023 13:09:17 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2c9fdf53abcso66421901fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Dec 2023 05:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702472957; x=1703077757;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2HJoRFEHz30zB0ZJf+EKks3Tvo/kzW6L5hkkeuaBBCU=;
 b=hjWC8rycdG7nnLoRgAbN+Ho/H75ql7YR+i/L6panSwB6zQEU7zNDrYHd9j0+ElDliF
 4Hhln4pb1aPDoH9A94g6p3IOHcmvWmvQCADE8XPKS5NIdJkXeJtysWWrkL7bG4K51c0f
 eKq+RgdPLHd1hSDg2LqgGjG2/Feweqkk0ktCqW5pzBxd3KbQY8BqZ3fDHHwMhNPZhzqK
 FBiORbnJ+7g70nSo5Nh4HASQk6cU+smBWpgSL4VD+AIchbifSYnmOgBkDE/c6GhibSt+
 sT70ZxqTCK0axCz8R+h7lIYMZfX43oBjEM8q6sGF5SZLm5n3sb5bbOmWCkidqoSxn5HJ
 E1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702472957; x=1703077757;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2HJoRFEHz30zB0ZJf+EKks3Tvo/kzW6L5hkkeuaBBCU=;
 b=r5IPcq7C/L/TcLJkZ8TL5NDsFSbQ2trr1tZZ67Uj+owqP4aacyI19/q/ixF98by5nf
 50TxJHZjQV84UXkp1Nk9XNglpZ8n+0j08LyY/BJuOF0gdyf05xVQP7ALwulxu3XQZY9P
 os4diRANowr1+Pqnn33hlPP5ZK1pU215kTT1C2995Ts0EbsuLkOPmMxhk9XvbnB4IeU5
 Jw4aP4ixbdIgYrYgQ9l6LOjP8ZAld0D0+2Vz4An69thq1htimyLj/c/g+PsBPnRp6IH6
 hcuzEC/QSwY7zljR8+aCwai+CtriaoEd6TvNdLTsusuQnTMLUM9tFWZ11DHycPeUoqAp
 8P1g==
X-Gm-Message-State: AOJu0YxbR3bT1vYvMPpwSeaubnlOwQ+oLRONFOxu9XPPWPf+q+G2iHj/
 YkNHHyiMXA4XeoQpHmuC/V4=
X-Google-Smtp-Source: AGHT+IEx1G2Ak0WCyDZGOhaHfa9iY3nMhLay3pfRJFLfsPi8CVj+jZd2gK+mqCcnf4++8bfHmYBixg==
X-Received: by 2002:a2e:b742:0:b0:2c9:e940:6780 with SMTP id
 k2-20020a2eb742000000b002c9e9406780mr3993926ljo.22.1702472956648; 
 Wed, 13 Dec 2023 05:09:16 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a2e9118000000b002ca02e43f40sm1840200ljg.74.2023.12.13.05.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 05:09:16 -0800 (PST)
Date: Wed, 13 Dec 2023 16:09:12 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <f2pf2g23ln4qcoqxidy55plysn735qtfspj6nuu6f7isqxotp2@rj6ejru5eon7>
References: <20231212-b4-stmmac-handle-mdio-enodev-v2-1-600171acf79f@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231212-b4-stmmac-handle-mdio-enodev-v2-1-600171acf79f@redhat.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: Handle disabled MDIO
 busses from devicetree
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

On Tue, Dec 12, 2023 at 04:18:33PM -0600, Andrew Halaney wrote:
> Many hardware configurations have the MDIO bus disabled, and are instead
> using some other MDIO bus to talk to the MAC's phy.
> 
> of_mdiobus_register() returns -ENODEV in this case. Let's handle it
> gracefully instead of failing to probe the MAC.
> 
> Fixes: 47dd7a540b8a ("net: add support for STMicroelectronics Ethernet controllers.")
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
> Changes in v2:
> - Improve error handling code (Serge)
> - Fix malformed Fixes tag (Simon)
> - Link to v1: https://lore.kernel.org/r/20231211-b4-stmmac-handle-mdio-enodev-v1-1-73c20c44f8d6@redhat.com

Looking good. Thanks!
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> index fa9e7e7040b9..0542cfd1817e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> @@ -591,7 +591,11 @@ int stmmac_mdio_register(struct net_device *ndev)
>  	new_bus->parent = priv->device;
>  
>  	err = of_mdiobus_register(new_bus, mdio_node);
> -	if (err != 0) {
> +	if (err == -ENODEV) {
> +		err = 0;
> +		dev_info(dev, "MDIO bus is disabled\n");
> +		goto bus_register_fail;
> +	} else if (err) {
>  		dev_err_probe(dev, err, "Cannot register the MDIO bus\n");
>  		goto bus_register_fail;
>  	}
> 
> ---
> base-commit: bbd220ce4e29ed55ab079007cff0b550895258eb
> change-id: 20231211-b4-stmmac-handle-mdio-enodev-82168de68c6a
> 
> Best regards,
> -- 
> Andrew Halaney <ahalaney@redhat.com>
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
