Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6882A83AAF2
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jan 2024 14:31:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10DC7C65E4F;
	Wed, 24 Jan 2024 13:31:37 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B82CBC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jan 2024 13:31:35 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2cf108f6a2dso21443881fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jan 2024 05:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706103095; x=1706707895;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yh0FSpthPEg0z6Y9MyFNxP4OPN7yLXd22973nZlpFgs=;
 b=EEau1jao0fxqbiTgtIKGJE6qWAc596haB7fNeirn3hVWtKNWVjfbFdUN74RIIx1C1z
 +oCeAhUFICio+0xT53VCXWX9G0rdP5sgNKJMlswj22d2K7vwE/H+iR586T+LaqlzKa5u
 dIl922jmup+dvrSqWj7uTrC8Y+yoGWWbE5I0jPrDQ8ankvaZCQKMPwBYC2W6SYsmbep3
 HS8PY4wro9WMj/7SOEGUCOeHSKMJkFqxNLeYT6dYXYyxz9VLdl1w8mAIbBzvBsMf0Ual
 9e9rf+Cc4FP4s6Nsl+rQFf97zagFu+AGBVd07pZdEigtJ72ICapTiWRP4+e3n90CyMnX
 t0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706103095; x=1706707895;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yh0FSpthPEg0z6Y9MyFNxP4OPN7yLXd22973nZlpFgs=;
 b=ZaRo/+CqKVlwH3qfyOBPVvjrrxXfqstQcdhQ7nzz99hrPr4CKYJVct7CwyDHkSzkSg
 GK9ZVoveQsPIPy8kQyRlAt51bH0SJGxl1sfAhpuxyT6Q+i7s9jN073tC21PYtW0WjMa1
 bAITy5gKwxyeqNjfyx7C6pPloFq9RXnK9O97QHdIo39lD1BkASxRsUKJt0qpXEzBfqKp
 GW+pi1WinS5+nLNIGVsTyxZBHy8VyI702RCixq7RN1V9qPFWJFameD5F4aHS0iCH/j8Z
 bdsdzdlvp895x39uwAU0gZn0/+acdSWXb1IfpdFOmrf5J1VFNB2midxO8oSzJDgPJVYN
 o0TA==
X-Gm-Message-State: AOJu0Yyz9d5pDHQWYBsT9VekBJ3HLBISRsFOrf5GtBCgGGxQwHSYXrf6
 1GTwZMkMUlYnYeoreCgZivcbDnY4tyPS9g8ykAB6MHsk/5D5iBuE
X-Google-Smtp-Source: AGHT+IEQ/+uLqbt+Yrb1ZZ6gaA4VtLtXFNiOrQMfZBodzHf8/XDgyTVyYYUU7vCAj5wx35icDs5adg==
X-Received: by 2002:a2e:8691:0:b0:2cc:7157:4e7f with SMTP id
 l17-20020a2e8691000000b002cc71574e7fmr726122lji.57.1706103094620; 
 Wed, 24 Jan 2024 05:31:34 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a2ea284000000b002cca7ee7375sm2555389lja.136.2024.01.24.05.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 05:31:33 -0800 (PST)
Date: Wed, 24 Jan 2024 16:31:31 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Bernd Edlinger <bernd.edlinger@hotmail.de>
Message-ID: <ddwtgxbtzy6vtc2bn5gvuskpco7mhmsmakt4gqk6ksppkmmtp2@w7eti3prlpke>
References: <AS8P193MB1285DECD77863E02EF45828BE4A1A@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <AS8P193MB1285EEAFE30C0DE7B201D33CE46C2@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <AS8P193MB1285A810BD78C111E7F6AA34E4752@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AS8P193MB1285A810BD78C111E7F6AA34E4752@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jiri Pirko <jiri@nvidia.com>,
 Jakub Kicinski <kuba@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v3] net: stmmac: Wait a bit for the
 reset to take effect
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

On Mon, Jan 22, 2024 at 07:19:09PM +0100, Bernd Edlinger wrote:
> otherwise the synopsys_id value may be read out wrong,
> because the GMAC_VERSION register might still be in reset
> state, for at least 1 us after the reset is de-asserted.
> 
> Add a wait for 10 us before continuing to be on the safe side.
> 
> > From what have you got that delay value?
> 
> Just try and error, with very old linux versions and old gcc versions
> the synopsys_id was read out correctly most of the time (but not always),
> with recent linux versions and recnet gcc versions it was read out
> wrongly most of the time, but again not always.
> I don't have access to the VHDL code in question, so I cannot
> tell why it takes so long to get the correct values, I also do not
> have more than a few hardware samples, so I cannot tell how long
> this timeout must be in worst case.
> Experimentally I can tell that the register is read several times
> as zero immediately after the reset is de-asserted, also adding several
> no-ops is not enough, adding a printk is enough, also udelay(1) seems to
> be enough but I tried that not very often, and I have not access to many
> hardware samples to be 100% sure about the necessary delay.
> And since the udelay here is only executed once per device instance,
> it seems acceptable to delay the boot for 10 us.
> 
> BTW: my hardware's synopsys id is 0x37.
> 
> Fixes: c5e4ddbdfa11 ("net: stmmac: Add support for optional reset control")
> Signed-off-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
> Reviewed-by: Jiri Pirko <jiri@nvidia.com>

Thanks for taking all the notes into account. No objections from my
side:

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> v2: rebased to v6.7, retested and updated the commit message
> as suggested Serge Semins review comment:
> https://lore.kernel.org/lkml/b4mpa62b2juln47374x6xxnbozb7fcfgztrc5ounk4tvscs3wg@mixnvsoqno7j/
> and retained Jiri Pirkos Reviwed-by from:
> https://lore.kernel.org/lkml/ZT+Zq4j9iQj1+Xai@nanopsycho/
> 
> v3: addressed review comments.
> 
> 
> Thanks
> Bernd.
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index a0e46369ae15..b334eb16da23 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7542,6 +7542,9 @@ int stmmac_dvr_probe(struct device *device,
>  		dev_err(priv->device, "unable to bring out of ahb reset: %pe\n",
>  			ERR_PTR(ret));
>  
> +	/* Wait a bit for the reset to take effect */
> +	udelay(10);
> +
>  	/* Init MAC and get the capabilities */
>  	ret = stmmac_hw_init(priv);
>  	if (ret)
> -- 
> 2.39.2
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
