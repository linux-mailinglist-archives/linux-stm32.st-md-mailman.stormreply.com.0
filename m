Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 466557A08FB
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Sep 2023 17:22:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2308C6A5EF;
	Thu, 14 Sep 2023 15:22:38 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C91F5C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 15:22:37 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-500c37d479aso1831241e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 08:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694704957; x=1695309757;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZolQK8oCNrfB9vVowtad2lF1eXOCwg06eiy5N3psADU=;
 b=D9P+UChLffStNbsbiCr8kEWDS8KMpbGfQlcRnfthLUkhJsXg9rkPO3r9YOY52H4Akg
 fktNIYX02uWM9/2meKbI64j6KOgqajfkb4J3/JFXkDo9/jkLvWf3iSN/uu/trawIIyUW
 zdaM2TVLUh9wNPjL1QTn+lRXnkoyLj8ccx9m42vSqC24x0iWE/ET3MF/fJgtSKwkAgGh
 wWeT3YjzeK0meLWNMTxyayBfmMg8PU4ARSvjsbJ3s/Lv9CkSO65Kj5Cw5UWYReVews2D
 Z1zyx6ei0xNiEq8Zna7a0x+h2NQrpT80JClKcAzeqo29oiyJQ1+bI8GUmfXdtFawQFsO
 ctig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694704957; x=1695309757;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZolQK8oCNrfB9vVowtad2lF1eXOCwg06eiy5N3psADU=;
 b=uUp+zJSPUoNi5XbATu6bfu42NCAl3UA/8blOQ/7kWkeMwuSUor0LBc5FixGUkfV470
 noO19qdSQWrQQr9mo11it6EeiCfh5yj5j/cK7BsGLFU4RGCh0Fbxd7nHmnC2gkNIpOcF
 gcLabzNkV6/vwvbX8Kpl9775+S+bFn6tVq2ElVt3gIowZbIzHGbKViQoBP5VjaLg1TgI
 H4DzPfCgoSbXYYLBIAsO+8qvDVIFlCqdJiXibiJQS1Z5mVe1y7BQ5DCH5J6Ly+8M3X70
 gRLVDc+1HJk238FAsK2GmY3seK0cWT+q0bNM9N8ZDg8HJWeEZgut3qKixN2vsRJn+7CA
 q1oQ==
X-Gm-Message-State: AOJu0YwpqH81DrOKMqukzf/ZYQNvZt5mmd6mpknX330HYPUDP8tFIa2Q
 GBaxwtc3jgGTLQyFDPjiZlY=
X-Google-Smtp-Source: AGHT+IH2T55CTAfzzSY4ltsyt2+mktK2jHAm6ps38mM5m1iDZpZbkRH7vJhwzgNOJjDUr8vyiyeJxg==
X-Received: by 2002:a19:6749:0:b0:500:b964:37e0 with SMTP id
 e9-20020a196749000000b00500b96437e0mr4487501lfj.6.1694704956668; 
 Thu, 14 Sep 2023 08:22:36 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 q13-20020ac2514d000000b00502e2e0fa4csm315377lfd.71.2023.09.14.08.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 08:22:36 -0700 (PDT)
Date: Thu, 14 Sep 2023 18:22:33 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <rene2x562lqsknmwpaxpu337mhl4bgynct6vcyryebvem2umso@2pjocnxluxgg>
References: <ZQMPnyutz6T23E8T@shell.armlinux.org.uk>
 <E1qgmkp-007Z4s-GL@rmk-PC.armlinux.org.uk>
 <7vhtvd25qswsju34lgqi4em5v3utsxlvi3lltyt5yqqecddpyh@c5yvk7t5k5zz>
 <ZQMgtXSTsNoZohnx@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZQMgtXSTsNoZohnx@shell.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH net-next 4/6] net: stmmac: rk: use
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

On Thu, Sep 14, 2023 at 04:03:17PM +0100, Russell King (Oracle) wrote:
> On Thu, Sep 14, 2023 at 05:37:13PM +0300, Serge Semin wrote:
> > On Thu, Sep 14, 2023 at 02:51:35PM +0100, Russell King (Oracle) wrote:
> > > Use stmmac_set_tx_clk_gmii().
> > > 
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > ---
> > >  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 60 +++++--------------
> > >  1 file changed, 16 insertions(+), 44 deletions(-)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > > index d920a50dd16c..5731a73466eb 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > > @@ -1081,28 +1081,14 @@ static void rk3568_set_gmac_speed(struct rk_priv_data *bsp_priv, int speed)
> > >  {
> > >  	struct clk *clk_mac_speed = bsp_priv->clks[RK_CLK_MAC_SPEED].clk;
> > >  	struct device *dev = &bsp_priv->pdev->dev;
> > > -	unsigned long rate;
> > > -	int ret;
> > > -
> > > -	switch (speed) {
> > > -	case 10:
> > > -		rate = 2500000;
> > > -		break;
> > > -	case 100:
> > > -		rate = 25000000;
> > > -		break;
> > > -	case 1000:
> > > -		rate = 125000000;
> > > -		break;
> > > -	default:
> > > -		dev_err(dev, "unknown speed value for GMAC speed=%d", speed);
> > > -		return;
> > > -	}
> > > -
> > > -	ret = clk_set_rate(clk_mac_speed, rate);
> > > -	if (ret)
> > > -		dev_err(dev, "%s: set clk_mac_speed rate %ld failed %d\n",
> > > -			__func__, rate, ret);
> > > +	int err;
> > > +
> > > +	err = stmmac_set_tx_clk_gmii(clk_mac_speed, speed);
> > > +	if (err == -ENOTSUPP)
> > 
> > > +		dev_err(dev, "invalid speed %uMbps\n", speed);
> > > +	else if (err)
> > > +		dev_err(dev, "failed to set tx rate for speed %uMbps: %pe\n",
> > 
> > These type specifiers should have been '%d' since the speed variable
> > is of the signed integer type here.
> 

> Okay, having re-reviewed the changes, I'm changing them _all_ back to
> be %d, because that is the _right_ thing. It is *not* unsigned, even
> if fix_mac_speed() thinks that it is. It isn't. It's signed, and it's
> stmmac bollocks implicitly casting it to unsigned - and that is
> _wrong_.

Yes, stmmac is wrong in casting it to the unsigned type, but even
seeing the original type is intended to be signed doesn't mean the
qualifier should be fixed separately from the variables type and
function prototypes. It will cause even more confusion. IMO the best
way would be to fix the plat_stmmacenet_data->fix_mac_speed()
prototype and the respective methods in the glue drivers. But it would
be too bulky and most likely out of your interest to be done. So I
would still have the variables type and the format qualifier type
matching here and in the rest of the drivers especially seeing the
original code in the imx, starfive, rk, QoS Eth LLDDs sticks to the
convention described by me.

-Serge(y)

> 
> So, on that point, my original submission was more correct than this
> one, and you led me astray.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
