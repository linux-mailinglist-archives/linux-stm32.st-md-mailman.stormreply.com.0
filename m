Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F6480E98D
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Dec 2023 11:59:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DCEBC6B45D;
	Tue, 12 Dec 2023 10:59:30 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9722C6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 10:59:28 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-50bdec453c8so6528073e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 02:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702378768; x=1702983568;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UBACCwW/u1iAUGLoPTfmihwXKrVJVbnjXJdVbLxBVuc=;
 b=GITwvZvDhNMzolLLbW8DBzbci4pC+Nos7iJjwHrJZhlpZ+xg+hJDp27tPbXvVaSaxl
 8bJ+7nXuVkV1OO/15aUXzQq2uAfYJj+m/gzBLK3MVHYF1W8yKgNuCI1LnrfJmllhJeNt
 wfycCUu8kwuhqNE5HbaJL9lzvNFRsCzlUY4vaWAqobdBFuiiEIrMfsbxieopK6SlLj+b
 lbsK0I147qVEaDCGqemfuHa+WvpIC/VYhvAL/gWIlXzyOSLq3l+BGNWwVJCV78p+P/j6
 g9Tfv9QSYdI05AN+5LT0JFYrIkqnN73id97qLR2NTOkBMzYoKmAMyRuVFVixYgoFbCT3
 qY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702378768; x=1702983568;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UBACCwW/u1iAUGLoPTfmihwXKrVJVbnjXJdVbLxBVuc=;
 b=p+gr1r0bsWhyr06zLB6MZh6ivhA4JH8zRJnUkZM3sAZrqmXb3PYaz8rHPFvmVsEx6S
 kjGT/jM9oZpnmqZKcttSKRk9XNnkNAuNm/KIkQohCXTtdfCf74gPZXRC/wAjdLJ6WwVg
 itDW4rv59GBHDBaXh/ea6cYvNlp41UYHJoNtyPOtEdfg6WeKOyJy+AEas1RU+0yXiWIN
 yQuwXEJnWFQHPkengkIIQQ5LWdW8p71TQwm4rHBB/sYibCGGVB5GdTWApszLhV2W8XO0
 vDQO746LJ5HYs4URDWVP1IJLp6MYB322j3d+poIJOFIwn5uJcHeNbaNcvD7RZ8zA/Cf0
 +SXg==
X-Gm-Message-State: AOJu0Yzbvd6Yh2iSHkgfk58BWZZ7fwJ+PeM49BMDKYEIfJvm95BXv74Q
 DUVF3ORjeCZeQl4rvXqQfiE=
X-Google-Smtp-Source: AGHT+IFENj5x54Op3KLBMNmk1vpxHnMd7tYQWResL1rD1eJl9lh0gvrTRZQsB8pjxfiVQfYkjXFdgw==
X-Received: by 2002:a05:6512:6cb:b0:50d:12ea:cba0 with SMTP id
 u11-20020a05651206cb00b0050d12eacba0mr3566985lff.95.1702378767797; 
 Tue, 12 Dec 2023 02:59:27 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 dx7-20020a0565122c0700b0050d12fa98fesm1289491lfb.300.2023.12.12.02.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 02:59:27 -0800 (PST)
Date: Tue, 12 Dec 2023 13:59:25 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <ggbqvhdhgl6wmuewqtwtgud7ubx2ypmnb3p6p6w7cy37mnnyxn@2eqd63s2t5ii>
References: <20231211-b4-stmmac-handle-mdio-enodev-v1-1-73c20c44f8d6@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231211-b4-stmmac-handle-mdio-enodev-v1-1-73c20c44f8d6@redhat.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Handle disabled MDIO
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

On Mon, Dec 11, 2023 at 03:31:17PM -0600, Andrew Halaney wrote:
> Many hardware configurations have the MDIO bus disabled, and are instead
> using some other MDIO bus to talk to the MAC's phy.
> 
> of_mdiobus_register() returns -ENODEV in this case. Let's handle it
> gracefully instead of failing to probe the MAC.
> 
> Fixes: 47dd7a540b8a (net: add support for STMicroelectronics Ethernet controllers.")
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> index fa9e7e7040b9..a39be15d41a8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> @@ -591,7 +591,13 @@ int stmmac_mdio_register(struct net_device *ndev)
>  	new_bus->parent = priv->device;
>  
>  	err = of_mdiobus_register(new_bus, mdio_node);
> -	if (err != 0) {
> +	if (err) {
> +		if (err == -ENODEV) {
> +			/* The bus is disabled in the devicetree, that's ok */
> +			mdiobus_free(new_bus);
> +			return 0;
> +		}
> +
>  		dev_err_probe(dev, err, "Cannot register the MDIO bus\n");
>  		goto bus_register_fail;
>  	}

This can be implemented a bit simpler, more maintainable and saving
one indentations level:

	err = of_mdiobus_register(new_bus, mdio_node);
	if (err == -ENODEV) {
		err = 0;
		dev_warn(dev, "MDIO bus is disabled\n");
		goto bus_register_fail;
	} else if (err) {
  		dev_err_probe(dev, err, "Cannot register the MDIO bus\n");
  		goto bus_register_fail;
	}

-Serge(y)

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
