Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E17487DF1EE
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Nov 2023 13:03:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7979CC6B452;
	Thu,  2 Nov 2023 12:03:30 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EE33C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Nov 2023 12:03:27 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2c50fbc218bso10555151fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Nov 2023 05:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698926606; x=1699531406;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SZgopjRBSehJcywZRSRRjwXmQo1kSprJEg6i4E+ED6Q=;
 b=Z6Imyl/fIV5RzTzKCIY/rhGGyQeWO/0kU63C3wZ+W9qOeTF/Qdl6PSqfMGWXV4O/pu
 OfV8F4kkqEKmE+fjn2J6NG4iH/lDxHDimP7NF6rKLFmErCJsQ+QCWun+cGvXk9/nPWex
 IuvHBQHke8q51supi8kTdONU33iUfF+kW5MFQLLLvNtkwvtph/ssL4aiLuRkQQqNrPNz
 xP74Xl8lv+SXa9wG+oyxjNvuxxw2XjfBTr7KT+bmQ0j5/SLHiqU4kv4FAQI9vveBQn21
 V4OTA3ocwFMEt3/wd0aft2j4t0+kDrabhSxKTsca3vklpYb5xPLu4GwvhdkH27vJr+Ik
 w0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698926606; x=1699531406;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SZgopjRBSehJcywZRSRRjwXmQo1kSprJEg6i4E+ED6Q=;
 b=LdYXuhXq7fAn02k7sq7myt6ezGyadgXBywAWKYydYrbkp9OSxC5VHvenE3KAUYjbtO
 aGQhZ482oKyWPfTKT258KT4Kx8qZXhqeTphIagmjfbrDwtGdB+kh6YY0fQGRL94c1joB
 cmrONzQIlUnnCPw8wUuDMtsvikxOY/wDa+nmzkyqPSC1smbxSvRFvCLc7ofrhhlkznbq
 XXkOKyh9fKo2Onv2m79Wb+aEzYr216xTmCTTSsa2zBhkcUWilAXRioxZL+6DjDXhRX96
 srD1rXpeXV7Y7IqyBb8ksFxfHUMBiHy3TUeYRD8edvJIK/vCLAu0K+EXP6isSOh1JJm6
 D+/g==
X-Gm-Message-State: AOJu0YwexEQZNMDhKrCpqhWzhs2L5K7b3v9NgL8DriVcu93x1xsvIZB7
 bD2O+iTfuUmRrgv9LpKl/mU=
X-Google-Smtp-Source: AGHT+IFMKQuxZDDL7Ub8z/ytNkVS7YNsxF9774I/AhaWO33gRuWb1DDnfHgznfOcdXVqK50Pb+6MQw==
X-Received: by 2002:a05:651c:c97:b0:2bc:e330:660b with SMTP id
 bz23-20020a05651c0c9700b002bce330660bmr20292141ljb.9.1698926605812; 
 Thu, 02 Nov 2023 05:03:25 -0700 (PDT)
Received: from mobilestation.baikal.int (srv1.baikalchip.ru. [87.245.175.227])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a05651c038d00b002b9e0d19644sm455838ljp.106.2023.11.02.05.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 05:03:25 -0700 (PDT)
Date: Thu, 2 Nov 2023 15:03:23 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Bernd Edlinger <bernd.edlinger@hotmail.de>
Message-ID: <b4mpa62b2juln47374x6xxnbozb7fcfgztrc5ounk4tvscs3wg@mixnvsoqno7j>
References: <AS8P193MB1285DECD77863E02EF45828BE4A1A@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <j37ktiug7vwbb7h7s44zmng5a2bjzbd663p7pfowbehapjv3by@vrxfmapscaln>
 <AS8P193MB1285473EE92FEDB65C08C131E4A0A@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AS8P193MB1285473EE92FEDB65C08C131E4A0A@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Wait a bit for the reset to
	take effect
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

On Tue, Oct 31, 2023 at 05:10:24PM +0100, Bernd Edlinger wrote:
> 
> 
> On 10/31/23 11:32, Serge Semin wrote:
> > On Mon, Oct 30, 2023 at 07:01:11AM +0100, Bernd Edlinger wrote:
> >> otherwise the synopsys_id value may be read out wrong,
> >> because the GMAC_VERSION register might still be in reset
> >> state, for at least 1 us after the reset is de-asserted.
> > 
> > From what have you got that delay value?
> > 
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

Well, the delay value is highly hardware-dependent depending on the
IP-core version, generation (MAC1000, GMAC, QoS Eth, XGMAC, XLGMAC,
etc), IP-core synthesize parameters and finally the platform-specific
ref clocks implementation and their rates. So no matter how many you
try to figure out a safest value I guess you won't be able to find out
the common value for all the devices. Though seeing nobody has
reported so far any problem with that then it seems rare among the DW
*MAC* devices. So since you get to a add a very small delay in just a
perf non-critical path it won't hurt for the rest of the platforms.
But please very thoroughly define the problem in the commit message:
what hardware you have (SoC, platform, etc), in what conditions you
see the problem (what you already described in your reply to me), how
you've got to the 10us value, etc. It will be useful in case if
somebody would want for instance make the delay platform-dependent or
whatever.

-Serge(y)

> 
> 
> Bernd.
> 
> > -Serge(y)
> > 
> >>
> >> Add a wait for 10 us before continuing to be on the safe side.
> >>
> >> Signed-off-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
> >> ---
> >>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> >> index 5801f4d50f95..e485f4db3605 100644
> >> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> >> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> >> @@ -7398,6 +7398,9 @@ int stmmac_dvr_probe(struct device *device,
> >>  		dev_err(priv->device, "unable to bring out of ahb reset: %pe\n",
> >>  			ERR_PTR(ret));
> >>  
> >> +	/* Wait a bit for the reset to take effect */
> >> +	udelay(10);
> >> +
> >>  	/* Init MAC and get the capabilities */
> >>  	ret = stmmac_hw_init(priv);
> >>  	if (ret)
> >> -- 
> >> 2.39.2
> >>
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
