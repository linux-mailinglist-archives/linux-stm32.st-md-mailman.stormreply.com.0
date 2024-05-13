Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6988C4A01
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2024 01:22:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 153A3C6B476;
	Mon, 13 May 2024 23:22:09 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E6D1C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 23:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FjwP5rNIPk7wislr0WzdyfpykGMwHjroQxITaXdC+UA=; b=NyaprXNzRSUuVsKQHvEPtW1l3X
 pt7i21YkM0E2XUC2EbXrGOrr5aip+1VIOzK6DihejQNUocOqg4kpl7fcpSaJkvjF/s1JZ67AQ1yZu
 yhgMYfv70QUA2ddS2tt/3Er356HDMimN5895M/gL/gZmwPShcEc/dZK35eX+0uFoHW4o2JIXVPO0X
 LJhDypc8pDcgAT+8um0Yy5nrgNd586K2vETUAyffOn3FB01W1PhrQ38EDTLXuLtjCKCF6xPbkKK0g
 3K7u172/QK27E/dfLlH1BtPLU8nBor/vLo+MX6TrRjH5EDyqvXmtcg3lWJyh5/Jk6BtKA9ZUFs+t4
 mHYcaoOg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:32964)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1s6ezH-0002OH-2r;
 Tue, 14 May 2024 00:21:43 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1s6ezG-0006Vz-8j; Tue, 14 May 2024 00:21:42 +0100
Date: Tue, 14 May 2024 00:21:42 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <ZkKghpox1r6ZqtyB@shell.armlinux.org.uk>
References: <ZkDuJAx7atDXjf5m@shell.armlinux.org.uk>
 <y2iz5uhcj5xh3dtpg3rnxap4qgvmgavzkf6qd7c2vqysmll3yx@drhs7upgpojz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <y2iz5uhcj5xh3dtpg3rnxap4qgvmgavzkf6qd7c2vqysmll3yx@drhs7upgpojz>
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

On Tue, May 14, 2024 at 02:04:00AM +0300, Serge Semin wrote:
> Hi Russell
> 
> I'll give your series a try later on this week on my DW GMAC with the
> RGMII interface (alas I don't have an SGMII capable device, so can't
> help with the AN-part testing).

Thanks!

> Today I've made a brief glance on it
> and already noted a few places which may require a fix to make the
> change working for RGMII (at least the RGSMIIIS IRQ must be got back
> enabled). After making the patch set working for my device in what
> form would you prefer me to submit the fixes? As incremental patches
> in-reply to this thread?

I think it depends on where the issues are.

If they are addressing issues that are also present in the existing
code, then it would make sense to get those patched as the driver
stands today, because backporting them to stable would be easier.

If they are for "new" issues, given that this patch series is more
or less experimental, I would prefer to roll them into these
patches. As mentioned, when it comes to submitting these patches,
the way I've split them wouldn't make much sense, but it does
make sense for where I am with it. Hence, I'll want to resplit
the series into something better for submission than it currently
is. If you want to reply to this thread, that is fine.

There's still a few netif_carrier_off()/netif_carrier_on()s left
in the driver even after this patch series, but I think they're in
more obscure paths, but I will also want to address those as well.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
