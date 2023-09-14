Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0757F7A0A4D
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Sep 2023 18:06:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9EC3C6A5EF;
	Thu, 14 Sep 2023 16:06:35 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 402B2C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 16:06:34 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5009d4a4897so2052254e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 09:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694707593; x=1695312393;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=N2RmVCxa+sY1O1smqmxSFhSqD8dLKrMsO0o7RVWwTR8=;
 b=r0GvHS7sBh/uL2W8Y485it9Uqb3jHYF1wHeWAUb9xYPJYo/9Fo8Dm94++uEGTCDM39
 +t474LNQKN/Exl9nnc879FpGkMj2QKy/m4r7s4ZL0UkoDG3lXFQ59nhYfcQ8y++TP5wh
 GgZjGs7AL/OxSUwt+TwEwABA6TQMddw3A0R1bKSG03WtzpSgWyWgzFrD4n9VZfn2LLQv
 ckWnFbFTq6/Z8hMsaCFzbtHsVcg3HQMdjMzpSkD8Hd5lrElTJKwDfo9PSU2JG51LErWt
 xBJklfHdL/mFWSvuuS41YFr4ZTHN7VVdcreeMKCIQQxwPJ/C4q+SD2amlM75eWxDmXRY
 9g9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694707593; x=1695312393;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N2RmVCxa+sY1O1smqmxSFhSqD8dLKrMsO0o7RVWwTR8=;
 b=bADtHa8rEotGcT+usdvrXXDpgVU6i4u9e0rDP2fnH/0DwYL9KpuEKWc6SxCHJCba7c
 kX/lhI9wlDDAvE8mSlRD0LMlb1d9RtAiZ9oTSRcWKgQ1jYW2207NTTOm770D11UopdMt
 Tt55MVg70bPy9lo2vcCJKZIwwJHbxCjluQen1t8qPPeJkVBEcu3zoH29aBftAfuxgsZQ
 Z4N0I1l7SuXUC9bhzCf6Lzem01rgTA1wzdI7oFWQNdmJvxzHr0dDTOizoaeHluZfUKiw
 9dnuO02QoRPakf2W3650ZY5xRW3bMD3OYmlsPhtk/4ApHBxQvnP2QR5oTWt4uAtu9jrT
 vpgA==
X-Gm-Message-State: AOJu0Yzw6Eg6v38aoWu+QRav7g8xhd5g8wEkMt6hgS+6q0Po2eIgpBei
 LiJdOr86KNLKuDomPoiA/rM=
X-Google-Smtp-Source: AGHT+IHY85sbLIHKHvdLPwdF844Gzsdokk3pkOJ3DB92vd+npIoH6cwuF3DF7ecUJOhFUcipLEBr6g==
X-Received: by 2002:a19:ca1a:0:b0:4fd:f84f:83c1 with SMTP id
 a26-20020a19ca1a000000b004fdf84f83c1mr4054712lfg.64.1694707593142; 
 Thu, 14 Sep 2023 09:06:33 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a195517000000b0050096712dc8sm318873lfe.277.2023.09.14.09.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 09:06:32 -0700 (PDT)
Date: Thu, 14 Sep 2023 19:06:29 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <pyizjtvvzc4hwklj3nrjb2f6uqvwzskpdinb3agdhelclxouoa@s7bjgexnspnv>
References: <ZQMPnyutz6T23E8T@shell.armlinux.org.uk>
 <E1qgmka-007Z4Z-1E@rmk-PC.armlinux.org.uk>
 <j64xmkplk2kkb4esteaic3hsofex3eishxxr3z6hppnm6heoz5@5fyj4x5qouc3>
 <ZQMizWbkAEyTh4M7@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZQMizWbkAEyTh4M7@shell.armlinux.org.uk>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Samin Guo <samin.guo@starfivetech.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Alexei Starovoitov <ast@kernel.org>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, bpf@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 1/6] net: stmmac: add
	stmmac_set_tx_clk_gmii()
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

On Thu, Sep 14, 2023 at 04:12:13PM +0100, Russell King (Oracle) wrote:
> On Thu, Sep 14, 2023 at 05:54:09PM +0300, Serge Semin wrote:
> > On Thu, Sep 14, 2023 at 02:51:20PM +0100, Russell King (Oracle) wrote:
> > > Add a helper function for setting the transmit clock for GMII
> > > interfaces. This handles 1G, 100M and 10M using the standard clock
> > > rates of 125MHz, 25MHz and 2.5MHz.
> > > 
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > ---
> > >  .../ethernet/stmicro/stmmac/stmmac_platform.c | 25 +++++++++++++++++++
> > >  .../ethernet/stmicro/stmmac/stmmac_platform.h |  1 +
> > >  2 files changed, 26 insertions(+)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > index 0f28795e581c..f7635ed2b255 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > @@ -700,6 +700,31 @@ EXPORT_SYMBOL_GPL(stmmac_probe_config_dt);
> > >  EXPORT_SYMBOL_GPL(devm_stmmac_probe_config_dt);
> > >  EXPORT_SYMBOL_GPL(stmmac_remove_config_dt);
> > >  
> > 
> > > +int stmmac_set_tx_clk_gmii(struct clk *tx_clk, unsigned int speed)
> > > +{
> > > +	unsigned long rate;
> > > +
> > > +	switch (speed) {
> > > +	case SPEED_1000:
> > > +		rate = 125000000;
> > > +		break;
> > > +
> > > +	case SPEED_100:
> > > +		rate = 25000000;
> > > +		break;
> > > +
> > > +	case SPEED_10:
> > > +		rate = 2500000;
> > > +		break;
> > > +
> > > +	default:
> > > +		return -ENOTSUPP;
> > > +	}
> > > +
> > > +	return clk_set_rate(tx_clk, rate);
> > > +}
> > > +EXPORT_SYMBOL_GPL(stmmac_set_tx_clk_gmii);
> > 
> > As I already noted in v1 normally the switch-case operations are
> > defined with no additional line separating the cases. I would have
> > dropped them here too especially seeing the stmmac core driver mainly
> > follow that implicit convention.
> 
> It's rather haphazard whether there are blank lines or not between
> case statements.

Is it haphazard in the STMMAC core driver too? The only exception is
the HWtstamp switch-case statements which just a bit bulky. So having
additional empty lines there rather weakly but is still justified by
that.

In anyway my comment is just a nitpick inferred from the implicit
local convention. It's totally IMO and isn't implied to be considered
as a strong request to be implemented. I repeated my comment just
because you didn't respond to it in v1. It looked as if you just
missed it.

> 
> > Additionally I suggest to move the method to being defined at the head
> > of the file. Thus a more natural order normally utilized in the kernel
> > drivers would be preserved: all functional implementations go first,
> > the platform-specific things are placed below like probe()/remove()
> > and their sub-functions, suspend()/resume() and PM descriptors,
> > (device IDs table, driver descriptor, etc). stmmac_set_tx_clk_gmii()
> > looks as a functional helper which is normally utilized on the network
> > device open() stage in the framework of the fix_mac_speed() callback.
> > Moreover my suggestion gets to be even more justified seeing you
> > placed the method prototype at the head of the prototypes list in the
> > stmmac_platform.h file.
> 

> How is one supposed to know about this? I did my best trying to work
> out where they should've gone...

Well, from my experience submitting the patches to various kernel
subsystems and drivers there are many implicit conventions which
aren't described anywhere, but could be inferred from the code itself.
This one is one of such implicit conventions which isn't mandatory but
a nice-to-have feature for better readability and maintainability (for
instance in order to determine where to put new methods and features
to the already available drivers). In anyway this comment is also a
nitpick, which from my point of view would improve the code
readability. It's normally up to the driver/subsystem maintainers to
define such conventions required.

Regarding the implicit conventions. Some of the subsystem and driver
maintainers imply that such conventions would be preserved (just
recently met that in the PCIe subsystem). When it happens it's so
irritating especially if it concerns a big series.

> 
> If it's that important, maybe add some /* Comments */ to state that
> there are separate sections to the file?

Would be nice to have them indeed. Though I normally just stick to
that convention by default if there is no another one could be
inferred from the code itself.

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
