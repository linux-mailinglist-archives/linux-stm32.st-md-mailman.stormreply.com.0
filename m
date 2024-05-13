Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3869F8C49DB
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2024 01:04:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2586C6B476;
	Mon, 13 May 2024 23:04:11 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5043CC640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 23:04:04 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-51f57713684so6163611e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 16:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715641443; x=1716246243;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4xY5PD/80plu8Oum5s12UE+ZfuGa9vAHIWvugychSCA=;
 b=B6dPmopnDMbBzSaTzEANPFJhLv+T+7iZvWSVqet6zkc9jODROK8WBBWqU4A5AVrgBh
 NOtf9i9YcestTRNLBbJPl1FGSE2AqAT6B52hScVRKWkSXCJ92XB+lXI8TXV4piy2yKrm
 P3imYlKAS4BKuRU5Hm86xq+k0FxkEKnInpaFBTx7ZM9s4cFO03ZU9Ui80ihQ9uUHiIri
 OsjpamBOnX0dZFlLaTb/PeFfWEqqdxJZhxmLrreEt8qECF6Ywe5orx7p1tGsfWyuF292
 1cPZcVyypF1jjaOOXFR36zSvr+Js44mdBABW88MnRztWKY86VH8e/rQqcHx8M7we8fXG
 kx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715641443; x=1716246243;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4xY5PD/80plu8Oum5s12UE+ZfuGa9vAHIWvugychSCA=;
 b=sMS+GIyHyz2FWKvYDQYXOUo87wZm/wP7EJne/mMg03o+DZJYdZsMXRsNB8+k+hyUsQ
 1T1VJ2nM4w9vIZGaQHK3TJlpzYsaqw3Qt+Qioasc2vQsYgeK0pad2MHQLz7wQh4asD6/
 P3msLKS52DYli0IVnwPrR46KrceUm4EvDAQ7p04sZfVWYs8A2sa47KW7ZwCGK4saDPIo
 dazsuirA+8ljgzQLhzlpXfZV8hWzeIJ+5zXog8NpaSL9WPYJEJdIG06cTsN/W8MwwJ7m
 JxjPXM4wUi7kOS/XHCjzE5SZA7cl5fkTmjrxLz7S0CyUSgwA4v91Rr4TPCICIMxNu0wT
 ZL8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRNx9kaTt5n1haqSkVV29WqQDgjtPOzY2qU/A8O1maLMEmFItf42QzzEvkVMZTYNZpim1X+2xis6jbPjcnlB4uNAA4/HxaugkZn6nJZ20GAAkfL0wJwbEe
X-Gm-Message-State: AOJu0YyhHMF6B1Zg+2HeCetkR1Kp9xGstXF06R9E7ltOFlPJVt7mppX0
 rAD6lMBaqZe4rUO2ysXve+BT9K+sXE4C/xJTcXwEiS8ar9cDbUGf
X-Google-Smtp-Source: AGHT+IFFKhWpRJn2p817fOt+Wl9TNhJclHuyqCuJ0Sy/EIzuYsr2zGns6p+IViThDP2lTqh2clB10g==
X-Received: by 2002:a05:6512:6ce:b0:523:6e01:a701 with SMTP id
 2adb3069b0e04-5236e01ab0amr39636e87.64.1715641443201; 
 Mon, 13 May 2024 16:04:03 -0700 (PDT)
Received: from mobilestation ([95.79.182.53]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f39d2c43sm1907996e87.248.2024.05.13.16.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 16:04:02 -0700 (PDT)
Date: Tue, 14 May 2024 02:04:00 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <y2iz5uhcj5xh3dtpg3rnxap4qgvmgavzkf6qd7c2vqysmll3yx@drhs7upgpojz>
References: <ZkDuJAx7atDXjf5m@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZkDuJAx7atDXjf5m@shell.armlinux.org.uk>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC 0/6] net: stmmac: convert stmmac "pcs"
	to phylink
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

Hi Russell

On Sun, May 12, 2024 at 05:28:20PM +0100, Russell King (Oracle) wrote:
> Hi,
> 

> As I noted recently in a thread (and was ignored)

Sorry about that. I didn't mean to ignore. Your message reached me
right when I caught a cold, which made me AFK for the rest of the
week.(

> As I noted recently in a thread (and was ignored) stmmac sucks.

Can't argue with that. There are much more aspects in what it sucks
than just the netif's. One glimpse at the plat_stmmacenet_data
structure causes million questions aka why, how come, what the hell...
I'll start submitting my cleanup patch sets after my another
networking work (DW XPCS wise) is finally done, re-submitted, reviewed
and merged in.

> (I
> won't hide my distain for drivers that make my life as phylink
> maintainer more difficult!)
> 
> One of the contract conditions for using phylink is that the driver
> will _not_ mess with the netif carrier. stmmac developers/maintainers
> clearly didn't read that, because stmmac messes with the netif
> carrier, which destroys phylink's guarantee that it'll make certain
> calls in a particular order (e.g. it won't call mac_link_up() twice
> in a row without an intervening mac_link_down().) This is clearly
> stated in the phylink documentation.
> 
> Thus, this patch set attempts to fix this. Why does it mess with the
> netif carrier? It has its own independent PCS implementation that
> completely bypasses phylink _while_ phylink is still being used.
> This is not acceptable. Either the driver uses phylink, or it doesn't
> use phylink. There is no half-way house about this. Therefore, this
> driver needs to either be fixed, or needs to stop using phylink.

Thanks for submitting the series, especially for making the RGMII
in-band status well-implemented in the driver. When I was studying the
STMMAC internals I was surprised that it wasn't actually utilized for
something useful. Furthermore at some point afterwards even the
RGSMIIIS IRQ turned to be disabled. So the RGMII-part of the code has
been completely unused after that. But even before that the RGMII
in-band status change IRQ was utilized just to print the link state
into the system log. 

> 
> Since I was ignored when I brought this up, I've hacked together the
> following patch set - and it is hacky at the moment. It's also broken
> because of recentl changes involving dwmac-qcom-ethqos.c - but there
> isn't sufficient information in the driver for me to fix this. The
> driver appears to use SGMII at 2500Mbps, which simply does not exist.
> What interface mode (and neg_mode) does phylink pass to pcs_config()
> in each of the speeds that dwmac-qcom-ethqos.c is interested in.
> Without this information, I can't do that conversion. So for the
> purposes of this, I've just ignored dwmac-qcom-ethqos.c (which means
> it will fail to build.)
> 
> The patch splitup is not ideal, but that's not what I'm interested in
> here. What I want to hear is the results of testing - does this switch
> of the RGMII/SGMII "pcs" stuff to a phylink_pcs work for this driver?
> 
> Please don't review the patches, but you are welcome to send fixes to
> them. Once we know that the overall implementation works, then I'll
> look at how best to split the patches. In the mean time, the present
> form is more convenient for making changes and fixing things.

I'll give your series a try later on this week on my DW GMAC with the
RGMII interface (alas I don't have an SGMII capable device, so can't
help with the AN-part testing). Today I've made a brief glance on it
and already noted a few places which may require a fix to make the
change working for RGMII (at least the RGSMIIIS IRQ must be got back
enabled). After making the patch set working for my device in what
form would you prefer me to submit the fixes? As incremental patches
in-reply to this thread?

-Serge(y)

> 
> There is still more improvement that's needed here.
> 
> Thanks.
> 
>  drivers/net/ethernet/stmicro/stmmac/Makefile       |   2 +-
>  drivers/net/ethernet/stmicro/stmmac/common.h       |  12 ++-
>  .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   | 113 ++++++++++++---------
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  | 108 ++++++++++++--------
>  .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |   6 --
>  drivers/net/ethernet/stmicro/stmmac/hwif.h         |  27 ++---
>  .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   | 111 +-------------------
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  19 ++--
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   |  57 +++++++++++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   |  84 ++-------------
>  10 files changed, 227 insertions(+), 312 deletions(-)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
