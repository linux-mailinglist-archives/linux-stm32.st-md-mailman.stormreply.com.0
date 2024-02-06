Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2F984B350
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Feb 2024 12:20:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 170B3C6907A;
	Tue,  6 Feb 2024 11:20:30 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B9ABC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 11:20:28 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2d07ffa0a9cso47764941fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Feb 2024 03:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707218427; x=1707823227;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sZUkF6qQkW68JTbbtNstjqI5lBDrxSml80X/oZkP6Jk=;
 b=RYm7aYHwuOGS8lFufvFiOF4vuB4PTzuwJNqUU2wTXbK40oMXWcjgGIfsZ4K7LqtOxq
 DlAlWT08sr02K+2q43gKuS/UZ356bW6RoGFOU7cTkIdmSn9z2nTMY8piOJ9udDmcaNlX
 xaxAM/CYKgQqCtCvMqw1Ijs5DvhvQK4U0QQ0hGhD9SNASCQTQTQ76j8V7ADU3IypNfHr
 st9UjDSPfFRKhiVARsSB0Pgbf/wYNZUryiwCBhiN0YhXijMkzAOysVRFlU6T3mAbXcQl
 2CFJ5rQElIW0/gGUC2glaTJnQMBvoIz6uO8OuoKNdQKCNcLpiKZ699I4HdGpki4W65jg
 bZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707218427; x=1707823227;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sZUkF6qQkW68JTbbtNstjqI5lBDrxSml80X/oZkP6Jk=;
 b=Tgiyt1M9CFN6vOOztX+7/w57bdJ7o4UjZC50igtIINvefIbYa4Q28HIccjVvOlK3e1
 VQ2n/6MbhqX7yJDR25BY2KQXNSo/8JT8HE/SPLYMy7CHPWsaAKwy6DGTgNvqnkui4e/s
 FIrj04HEOZvZzj5RYSbmuNgHY6xTzl+XVtYQJDdNUbRcCwJdbEETnVd6gTTHuHTPqOTT
 64NcONcGuyL8lVWWycAA3qCLI4lr2+o7a0Ay64yDS8lIhzEGC5+1xfkMEQZjMd9rWb6T
 3/X1AoIWCuYLoqgMKgyQenMNPQ6gUacWpJ+oA03IiVPOWXEsUtb/ZEHENMkf0z0N2bTA
 HHaA==
X-Gm-Message-State: AOJu0YxLZuoviyH+NgvupCEtv9LBImcLln+T59cH5CJflM8aot0HeO/T
 q+w22pcRQNoDDb4UKkBuS1uIvoXUtjLTuRAkM4TG6ecc/VyNxdyG
X-Google-Smtp-Source: AGHT+IHW2LkipLfX++vRM5dnDW6bduLO6JoK+Xv12mfq908JaY4bohgwFQKI2raGy/UuCHKa9YF1yA==
X-Received: by 2002:a05:651c:d5:b0:2d0:9a6e:106 with SMTP id
 21-20020a05651c00d500b002d09a6e0106mr1807106ljr.43.1707218427282; 
 Tue, 06 Feb 2024 03:20:27 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCU8bYPaI3YnkZ9qObyT85rw9Qb8bPNkodfCON7S9bFI2g3Gp2FvLh44VCCd1nIXzAo0B9ZFUZHtoKmw+OQMBaV5wFUEi7okjcvOXXM2erXPOjb2kpL6G22QFBuiiDxoK62+79Axr25HLQzomCTTxoabKgEC2Q5nVG8/eAPeYqmzjybtC7L5U0VDv6jimT00eScRUEXmoFWrHQoy3wtd4iCl/tkWxKedPbgMIkuq47/ABLm/5r/7cJoiXPdk3E90Hc5G4oq0BOHzzsY5lEZiw0pj/ZVTylnhpxd+cczPUjdXgfGHAk79FgB1d4SYFWw1jADQfLv476Yi5kPH5rDzo4WAEiwm3ylHTfG+XHn2Fl6lOAbfhRwwUpDPEezP1PpSaoAcqI+VzkDkTvSJFE9b+NAljPTwmWk4DRrfUT0XLJHBiewTLqEcedFIVxU7avLKHC8Jv3sXOM6R47W+czO/we8MjegmMxPPxHvL1/B6S69QKyryLLaQ0z5D6n1yxpePuHLyPLfs/SPeAiByM6CY2ON4RYmCGC38j62t9GNjhe/HPkTT1bVj15MwCZ9hF2VResSHXmFFl2sBxcrn43PwVPRFnRzwiVcmxFVBn6IDAjWjss6UE8nGcT2wFH1M7A0qGkPic7nTD3FIe474uaTpFMN8kXtxKQh016Lr3LRc1OtlM/Qa6YHANwJb08xUVXOqcN7vTIAf9axrZ6QvTYzz7XIjyEv9
Received: from skbuf ([188.25.173.195]) by smtp.gmail.com with ESMTPSA id
 kt12-20020a170906aacc00b00a36c7eb251bsm1029561ejb.157.2024.02.06.03.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 03:20:27 -0800 (PST)
Date: Tue, 6 Feb 2024 13:20:24 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Doug Berger <opendmb@gmail.com>
Message-ID: <20240206112024.3jxtcru3dupeirnj@skbuf>
References: <Zb9/O81fVAZw4ANr@shell.armlinux.org.uk>
 <E1rWbNI-002cCz-4x@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1rWbNI-002cCz-4x@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Byungho An <bh74.an@samsung.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Justin Chen <justin.chen@broadcom.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Clark Wang <xiaoning.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, Shenwei Wang <shenwei.wang@nxp.com>,
 Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 6/6] net: dsa: b53: remove
 eee_enabled/eee_active in b53_get_mac_eee()
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

On Sun, Feb 04, 2024 at 12:13:28PM +0000, Russell King (Oracle) wrote:
> b53_get_mac_eee() sets both eee_enabled and eee_active, and then
> returns zero.
> 
> dsa_slave_get_eee(), which calls this function, will then continue to
> call phylink_ethtool_get_eee(), which will return -EOPNOTSUPP if there
> is no PHY present, otherwise calling phy_ethtool_get_eee() which in
> turn will call genphy_c45_ethtool_get_eee().

Nitpick: If you need to resend, the function name changed to
dsa_user_get_eee().

> 
> genphy_c45_ethtool_get_eee() will overwrite eee_enabled and eee_active
> with its own interpretation from the PHYs settings and negotiation
> result.
> 
> Thus, when there is no PHY, dsa_slave_get_eee() will fail with

Here too.

> -EOPNOTSUPP, meaning eee_enabled and eee_active will not be returned to
> userspace. When there is a PHY, eee_enabled and eee_active will be
> overwritten by phylib, making the setting of these members in
> b53_get_mac_eee() entirely unnecessary.
> 
> Remove this code, thus simplifying b53_get_mac_eee().
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/dsa/b53/b53_common.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
> index adc93abf4551..9e4c9bd6abcc 100644
> --- a/drivers/net/dsa/b53/b53_common.c
> +++ b/drivers/net/dsa/b53/b53_common.c
> @@ -2227,16 +2227,10 @@ EXPORT_SYMBOL(b53_eee_init);
>  int b53_get_mac_eee(struct dsa_switch *ds, int port, struct ethtool_keee *e)
>  {
>  	struct b53_device *dev = ds->priv;
> -	struct ethtool_keee *p = &dev->ports[port].eee;
> -	u16 reg;
>  
>  	if (is5325(dev) || is5365(dev))
>  		return -EOPNOTSUPP;
>  
> -	b53_read16(dev, B53_EEE_PAGE, B53_EEE_LPI_INDICATE, &reg);
> -	e->eee_enabled = p->eee_enabled;
> -	e->eee_active = !!(reg & BIT(port));
> -

I know next to nothing about EEE and especially the implementation on
Broadcom switches. But is the information brought by B53_EEE_LPI_INDICATE
completely redundant? Is it actually in the system's best interest to
ignore it?

>  	return 0;
>  }
>  EXPORT_SYMBOL(b53_get_mac_eee);
> -- 
> 2.30.2
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
