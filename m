Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1D498810C
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Sep 2024 11:07:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B574C6DD72;
	Fri, 27 Sep 2024 09:07:12 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2665C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Sep 2024 09:07:04 +0000 (UTC)
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 69C5540279
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Sep 2024 09:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1727428013;
 bh=TdWwWyYx3NSL/g/B28NaT9+skLBhcn0OqBIgUz2KJ8c=;
 h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=D+HSuacOpUViEhGFqOTUZ5T5K2mBJPogFbSk6Bs3kpfOR8R2XmhQIv6TD1z3R5uzC
 h86fM1A86+bEn4doc5+jkjYAZCt/tNf6A+Df13Qxq4Mx8Id7lO9a9N8Idrr8udgRrD
 40auLPER3CBA1Nd3wKvRFO2FTkZZGxKyJs3tGoMR0A5wcKyjkmUEmGEKeLQ1n01kqS
 iCXCvxiX85O95ZmXvwC4zTo9Qv5lHZQCVccjyMvMOn7xyzd4sMybegZtbWxi1bTpDB
 5Fl2VksZiYD3d09Dv9dCbD/MRUJJpIfPLu7m6gtqUOKokSzW6TUVzuCQ1KIrWHVkvF
 CpUJLJaFOqyBw==
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-2871891ca9cso308248fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Sep 2024 02:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727427998; x=1728032798;
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TdWwWyYx3NSL/g/B28NaT9+skLBhcn0OqBIgUz2KJ8c=;
 b=LWZcL55HrujwZczzFNXw6Za8YuwslcAmrVTQ4wDxCM9wpt4zTPko6MA238tiwG7G8b
 0QQDihFoejUn0gKS4Ze6ZQwDtKgnI+fNJNw3QkoRms6PhPjSn8Z3GvQZlWjzUnV3Ss6e
 sUFyRbcYMThyaRZf3hJdkOP3y618YaeVjgqCKc8kBcuHFGQIJnoXH4lmTwxlzaeKCQsq
 Sa7tLjkuu27CqC7GKaCA+R92xFv3s/iK0ji2KUDvlABfcGWmHoej4Sd45lz8iL3EW8BP
 CpbawBF6P98Y3sLNNM+Ol4bTpFwPwvpFD7RCGz7HyK/PG3uCMjY4bHCOH6G8exFfCQTX
 dnHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuVLPJ6kHpJ10YSKnGMQ/5LpQNS1RkieLqkzVhh2mZB6n5Z4aCllivilGGK4yh3RSfG7aIndlyWZICNA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxHMsElrVihoABZSv1TLMKesJQCNj+/ZiY1j3XtqE7WCGCqToWc
 6WVwGZzn8BkMuxJXsqCHQG6F/yP8QHhm+Oi7E2F2Gcb6MEWz/Jfos0ZnHef6WSVJdDVxtjBlLCf
 b4NCxYvjPnJkUmUXOuomimpjT6uies91qkMuhZxlGcTaPW18IyXwE5+qyrW5MrbNj44uQIj7U3k
 QtPDWuPJq15FtTW0+zpzG46k8avLcL3FXDCMF5U4W7G2YIZAA2YQsA8wAqLeSKctrEeEmj
X-Received: by 2002:a05:6871:1c7:b0:277:fd73:8f82 with SMTP id
 586e51a60fabf-28710c28d08mr1801234fac.45.1727427998424; 
 Fri, 27 Sep 2024 02:06:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv+HoVG+UamQzP9HYGm4dvtX0uDQArn9ex/l2o6/iZbKaH7H7PMWWqDndToxE25AX6dEyIqQ8K4thbHVn/x+E=
X-Received: by 2002:a05:6871:1c7:b0:277:fd73:8f82 with SMTP id
 586e51a60fabf-28710c28d08mr1801204fac.45.1727427998028; Fri, 27 Sep 2024
 02:06:38 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Sep 2024 02:06:37 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <ZvYJfrPx75FA1IFC@x1>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
 <20240926-th1520-dwmac-v2-3-f34f28ad1dc9@tenstorrent.com>
 <3e26f580-bc5d-448e-b5bd-9b607c33702b@lunn.ch>
 <ZvWyQo+2mwsC1HS6@x1> <0b49b681-2289-412a-8969-d134ffcfb7fc@lunn.ch>
 <ZvYJfrPx75FA1IFC@x1>
Mime-Version: 1.0
Date: Fri, 27 Sep 2024 02:06:37 -0700
Message-ID: <CAJM55Z8DeGJs=ASgdErEVWagy_f8JMWVe_TEWJWAcrUbzoDjOQ@mail.gmail.com>
To: Drew Fustini <dfustini@tenstorrent.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Eric Dumazet <edumazet@google.com>, Guo Ren <guoren@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Drew Fustini <drew@pdp7.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v2 3/3] riscv: dts: thead: Add TH1520
	ethernet nodes
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

Drew Fustini wrote:
> On Thu, Sep 26, 2024 at 09:30:32PM +0200, Andrew Lunn wrote:
> > On Thu, Sep 26, 2024 at 12:13:06PM -0700, Drew Fustini wrote:
> > > On Thu, Sep 26, 2024 at 08:39:29PM +0200, Andrew Lunn wrote:
> > > > > +&mdio0 {
> > > > > +	phy0: ethernet-phy@1 {
> > > > > +		reg = <1>;
> > > > > +	};
> > > > > +
> > > > > +	phy1: ethernet-phy@2 {
> > > > > +		reg = <2>;
> > > > > +	};
> > > > > +};
> > > >
> > > > Two PHYs on one bus...
> > >
> > > Thanks for pointing this out. I will move phy1 to mdio1.
> >
> > ???
> >
> > Are you saying the two PHYs are not on the same bus?
>
> Sorry, this is my first time working on an Ethernet driver and I
> misunderstood.
>
> Sipeed only shares the schematic of the baseboard for the LPi4a [1].
> There are pages for GMAC Ethernet0 and GMAC Ethernet1. Each shows 4 MDIO
> differential pairs going into a SG4301G transformer.
>
> I believe that RTL8211F-CG phy chips are on the LM4A SoM board which
> contains the TH1520 SoC. Unfortunately, Sipeed does not provide a
> schematic of the SoM so its hard for me to inspect how the phy chips are
> wired up.
>
> Vendor kernel [2] that Sipeed uses has:
>
> 	mdio0 {
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 		compatible = "snps,dwmac-mdio";
>
> 		phy_88E1111_0: ethernet-phy@0 {
> 			reg = <0x1>;
> 		};
>
> 		phy_88E1111_1: ethernet-phy@1 {
> 			reg = <0x2>;
> 		};
> 	};
>
> so I think that does mean they are on the same MDIO bus.

It depends how you look at it. The SoC has two MACs and they can both
control their own MDIO bus. However MDIO of both MACs are pinmux'ed to
the same pins on the SoC. So the solution above just mux the pins to
GMAC0 and let that control both PHYs. Alternatively I guess one could
let each GMAC control their own phy on their own MDIO bus and then
switch pinmux settings everytime you need to need to talk to one or
the other.

/Emil
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
