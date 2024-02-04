Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 944E3849063
	for <lists+linux-stm32@lfdr.de>; Sun,  4 Feb 2024 21:33:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E78BBC6B476;
	Sun,  4 Feb 2024 20:33:17 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FD82C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  4 Feb 2024 20:33:16 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2d0512f6e32so45043991fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 Feb 2024 12:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707078795; x=1707683595;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kxjcuB49pne7j7JK9VPquwmBIBDNkYwt4O9i7GIttQY=;
 b=QdAD4cdzS3w5Up+BWnJVj9HTGgJU/q5upMOdbdqcSiyOyx29RQmydjG8+rIKqumRBs
 Kc4vJhsWMIc0E6xouJUIksWEw+OqZywFVZbJ3/xoP72d2sT9iQHbNe+PmbLpiTcw8rxY
 NO9AXukjpesP1aXaFK4bjqkl9sBmIXzLAvNxtlBlI+CU7a/Mkzxt88hSpjoB8Ev33CRB
 22fqGlSnnUfus0iSNLmYlqrR8DUBqTCxqfn3KtUcxOsluXQ+B6+uNd95x0BzQEM3C8p2
 DFko2ESgjouFnQTGK3r64FVvildfuLFoCRb4UO1qQV+EktEmIzmsmVb5+zKu5l5+V8kk
 NLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707078795; x=1707683595;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kxjcuB49pne7j7JK9VPquwmBIBDNkYwt4O9i7GIttQY=;
 b=lJQzBgTSegFi2DyLvjWzOPzC5Zxae9I5gOQgY6qUTdztoJ2BjkNUR3+Ef9NKNPwsPd
 uafDr0lIH0QepXwe22XIt6+XdwolKRh+4HpskN1iDrMkdT9nnS0zTLTBMjcyxqAJMtoF
 7bgh0w/sPTRoD2CHdvGQ+5ivE+6chgsIFIv9bgdJXX8GN02Dy+uq0Q/8UZvMqpn6tTOW
 gIE8Uw/HM+alz7sNi0WK60KwnOeCS+8fLI0eKUSAKE8e79ye2sZVCQHOi5c0p8TThi9H
 7oy74Rb9cre+2XBW+e0vusr0bo4ngwg6h/9caNDmHQCS+hPRAYO4ao93H6/oeEkRd6lJ
 Mfjg==
X-Gm-Message-State: AOJu0Yw21HHokPas/AM92cm2gGxn+99iyxFTUsJ1yYByruEL0yH2uC+C
 QNgVR5pkvVdAMCpzVsWJ7DKI2YLU5wIZtbXMmkEK7LbbQxkekuIJ
X-Google-Smtp-Source: AGHT+IF6pdsEQtOYy+KiRExWaimHNCtW16kXk8FPu127ttAR3t4Ax2TAeoB9MUJekYX0LNQM8LVm4w==
X-Received: by 2002:a05:651c:19aa:b0:2d0:8918:f36d with SMTP id
 bx42-20020a05651c19aa00b002d08918f36dmr5598189ljb.4.1707078795310; 
 Sun, 04 Feb 2024 12:33:15 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVRfzDw0r+IFKenroOV1CRTUepcfTygL//eODx88SnB6bXMtS8uano7zSkT0DFA25B5RUudXdZz4R1G+GX/ECmNFTYsIKy8+z6xL+f5enql6FRWcGh9qZjpch6t5m1x4u846GgVDmjAKCQV1vqk7ZJHbuSNGtJ7zylbWJsfmEP6xi20vLU3S2AHLaEpbRGz+h7udL+qm2ss644Z2fL5xaYsNgflOUIITx0EsieiS/+nZXgQk+iyu9x4h567RHmvhqSUoPSjvT2rxecYuaqtTUc8NqFAgnp6qerBx+SaZPYbCLIgMz1ioADsJMrQz59F+4yZxvkNgZJ6klPiJM1GSvLVcYwk+Jx68Zfpx0H5rQCIsC9MQco3mn40ssnpSTWEv4KJaltMymmwjoQXptFbc2J8F6p4Q9FxPxFgXF/m7064icmp7hiVPGoE+vpLJ1Ki7IeCC7PNIiPoT3QcGsX+LssIEy1rZ9+CGJVdTp2CmUn88/GbeZUL7uKYRsDfCft7+SfQ1AfOebu588q0GWfcAfwkkVVHfzNccnnKh7PwHx+jMGaI80MQRR56sT2CjhN7fmNrG+g9awXU57TsvZEPEOgjGlzHv5oGiVOUsNjs4mwNvv77AYOruaQ9ZQE7mrbTJEur8Jcx7YTg+au/aWs7AYghYg5Y0Os38iDtnB0yXtOcBS4X5eETu6tgD+SVwQhiafH/bOUOwRibh3YD76qMLekWI5hvmDAJWWZBLA38bm8semPLc+4qqg==
Received: from mobilestation ([95.79.203.166])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a2e3806000000b002cf55fddca7sm494137lja.49.2024.02.04.12.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Feb 2024 12:33:14 -0800 (PST)
Date: Sun, 4 Feb 2024 23:33:12 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <ximzpxurwkawprzuxkfdczrtvzyzjsfhk4taz4pxbzbj5kg6lv@4nqiycwcrgcr>
References: <Zb9/O81fVAZw4ANr@shell.armlinux.org.uk>
 <E1rWbMs-002cCV-EE@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1rWbMs-002cCV-EE@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Justin Chen <justin.chen@broadcom.com>,
 Eric Dumazet <edumazet@google.com>, bcm-kernel-feedback-list@broadcom.com,
 Shenwei Wang <shenwei.wang@nxp.com>, linux-stm32@st-md-mailman.stormreply.com,
 Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jose Abreu <joabreu@synopsys.com>, Clark Wang <xiaoning.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Byungho An <bh74.an@samsung.com>,
 Wei Fang <wei.fang@nxp.com>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/6] net: stmmac: remove
 eee_enabled/eee_active in stmmac_ethtool_op_get_eee()
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

On Sun, Feb 04, 2024 at 12:13:02PM +0000, Russell King (Oracle) wrote:
> stmmac_ethtool_op_get_eee() sets both eee_enabled and eee_active, and
> then goes on to call phylink_ethtool_get_eee().
> 
> phylink_ethtool_get_eee() will return -EOPNOTSUPP if there is no PHY
> present, otherwise calling phy_ethtool_get_eee() which in turn will call
> genphy_c45_ethtool_get_eee().
> 
> genphy_c45_ethtool_get_eee() will overwrite eee_enabled and eee_active
> with its own interpretation from the PHYs settings and negotiation
> result.
> 
> Thus, when there is no PHY, stmmac_ethtool_op_get_eee() will fail with
> -EOPNOTSUPP, meaning eee_enabled and eee_active will not be returned to
> userspace. When there is a PHY, eee_enabled and eee_active will be
> overwritten by phylib, making the setting of these members in
> stmmac_ethtool_op_get_eee() entirely unnecessary.
> 
> Remove this code, thus simplifying stmmac_ethtool_op_get_eee().

Right. and AFAICS stmmac_priv::{eee_active,eee_enabled} will be in
sync with the ethtool_eee::{eee_active,eee_enabled} values since they
are basically determined by means of the genphy_c45_eee_is_active()
method too. But damn it wasn't that easy to figure out... Anyway
thanks for the patch:

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> index bbecb3b89535..411c3ac8cb17 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> @@ -859,8 +859,6 @@ static int stmmac_ethtool_op_get_eee(struct net_device *dev,
>  	if (!priv->dma_cap.eee)
>  		return -EOPNOTSUPP;
>  
> -	edata->eee_enabled = priv->eee_enabled;
> -	edata->eee_active = priv->eee_active;
>  	edata->tx_lpi_timer = priv->tx_lpi_timer;
>  	edata->tx_lpi_enabled = priv->tx_lpi_enabled;
>  
> -- 
> 2.30.2
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
