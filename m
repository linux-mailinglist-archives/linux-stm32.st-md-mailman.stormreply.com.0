Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B7CA88892
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Apr 2025 18:28:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAF61C78028;
	Mon, 14 Apr 2025 16:28:48 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B1A0C78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Apr 2025 16:28:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 85D686115E;
 Mon, 14 Apr 2025 16:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C61C4CEEB;
 Mon, 14 Apr 2025 16:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744648126;
 bh=P/fa8u8mypyH0+6vdYrtZjJEaFzYh19+DjXazRmCLPg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sK929LWNbvs845GbWY+rfc/M02ZlGNFxZwVDINnN5mSSEZOVzRx5BbM9eiPNLwD8W
 VChZqkmLlSEFvE002cJO/oAZil7ruyP3ou8ywNsmPTUr9U+KvFoTT7byucRGAgYYlJ
 3EzZvxi/TGFTic4AqyIL3GIrzC4L/P7jfKTEhAJyXKi2cTafz1/KXrppnOyyvRrfVF
 NeqVXmnJNA9Gf9rxd8wW/13nU5uM4BDkclidQoiC4i2sLxuxrq54NrpHxfodDdyb/I
 LCNHQaUuLSSDP4ke82MUU/9YDqui7lhAO1Bv2W3wzoUoHmTnpHKQmc4DAwuE2FIhPw
 9wZ39T/yFzK9A==
Date: Mon, 14 Apr 2025 09:28:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Message-ID: <20250414092844.77999958@kernel.org>
In-Reply-To: <CA+V-a8uqkG+u_ZXztPe7R0BNV6BA46KgGRHRW-G3axBt566pEQ@mail.gmail.com>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407104447.072449cd@kernel.org>
 <CA+V-a8uqkG+u_ZXztPe7R0BNV6BA46KgGRHRW-G3axBt566pEQ@mail.gmail.com>
MIME-Version: 1.0
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, "Russell
 King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v5 0/3] Add GBETH glue layer
 driver for Renesas RZ/V2H(P) SoC
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

On Mon, 14 Apr 2025 09:52:03 +0100 Lad, Prabhakar wrote:
> > On Mon,  7 Apr 2025 13:03:14 +0100 Prabhakar wrote:  
> > > This patch series adds support for the GBETH (Gigabit Ethernet) glue layer
> > > driver for the Renesas RZ/V2H(P) SoC. The GBETH IP is integrated with
> > > the Synopsys DesignWare MAC (version 5.20). The changes include updating
> > > the device tree bindings, documenting the GBETH bindings, and adding the
> > > DWMAC glue layer for the Renesas GBETH.  
> >
> > This was posted prior to the "net-next is OPEN" announcement:
> > https://lore.kernel.org/all/20250407055403.7a8f40df@kernel.org/
> >
> > In the interest of fairness towards those who correctly wait
> > for the tree to be open I will ask you to repost this again,
> > in a couple of days.
> >  
> Are you ok for me to now respin this series?

yessir
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
