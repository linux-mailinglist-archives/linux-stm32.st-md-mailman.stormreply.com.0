Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B5F89F1F3
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Apr 2024 14:24:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A8C8C6C820;
	Wed, 10 Apr 2024 12:24:45 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17689C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Apr 2024 12:24:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68EDD1C0002;
 Wed, 10 Apr 2024 12:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712751883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l3ws31mOJD6WJ5PiqoLqg0x1rdfJP9Z5AmhmFZmsojA=;
 b=kz/0yk2P0u15uvLO3V2bIiiBeyKMosuhBgHxZkWris1gH74OkoU5jCPXSknQz1fwnbqCjo
 WU93j8pFtyf1I68J1uRLHRNfAg5gHZOVcMlMzHVsVuI0NHrTx8HflyI9e+u4/KSZym1ID/
 dLY1ynmBrfb0tNGPH9M0ukL+GBN7W+zJIfMTRlKVe+QSU7q152nT7Stn4Lg2mBWWFD4IAz
 is0Ld37Wwxu3wR4M4tX6oiZtMUnmBiv5xa+BA5V0S6lyrm4TKrsHU9+Xh30ivTw3v9rkKM
 KjmEQ3u/Z+jx+Z9jJ5DewvT9iMBn+e0lu7mg7yh+wHeLPrLuMrtg83iOywZIEQ==
Date: Wed, 10 Apr 2024 14:25:18 +0200 (CEST)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
In-Reply-To: <CAMuHMdX-F8LXWx=Ras4f+Dt_r485HKjRDLydDXZsnZBW8HJzxw@mail.gmail.com>
Message-ID: <9bd8eee4-952d-d5b2-c462-45c1466c54d6@bootlin.com>
References: <20240409-rzn1-gmac1-v2-0-79ca45f2fc79@bootlin.com>
 <20240409-rzn1-gmac1-v2-4-79ca45f2fc79@bootlin.com>
 <CAMuHMdX-F8LXWx=Ras4f+Dt_r485HKjRDLydDXZsnZBW8HJzxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="1582177605-1727822458-1712751921=:538696"
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v2 4/5] net: stmmac: add support
 for RZ/N1 GMAC
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
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1582177605-1727822458-1712751921=:538696
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Hi Geert,

On Tue, 9 Apr 2024, Geert Uytterhoeven wrote:

> > +config DWMAC_RZN1
> > +       tristate "Renesas RZ/N1 dwmac support"
> > +       default ARCH_RZN1
> 
> Why default to enabled?
> 
> > +       depends on OF && (ARCH_RZN1 || COMPILE_TEST)

The kernel doc states this as one of the possible cases where setting default 
y/m makes sense:

```
Sub-driver behavior or similar options for a driver that is “default n”. This 
allows you to provide sane defaults.
```

In the case of DWMAC_RZN1, it is a suboption of stmmac which is "default n", and 
I think it makes sense to enable the RZN1 ethernet controller driver if both the 
stmmac driver and the RZN1 architecture were explicitely selected.

Best Regards,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--1582177605-1727822458-1712751921=:538696
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--1582177605-1727822458-1712751921=:538696--
