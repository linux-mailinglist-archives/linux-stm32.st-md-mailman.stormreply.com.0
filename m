Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0ED901E18
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2024 11:24:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 764D8C7800D;
	Mon, 10 Jun 2024 09:24:37 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC5F3C6C838
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 09:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ia89vxLEHsjxSOnYnkE5CVk6E9NLeLG5CVMk/7Pv5aQ=; b=gWKnx8ln8WyqO2KHfLJhbYL82+
 M1+6mgxQ8fboi7A9pGxTgeeTQE5lY26ZRGsha8DuNeHWbhjR/xV2mM9BIj8RqoEj8MDUYNuRrRHCB
 8UVjxeA18PE6dPf90Z5QKtbNQG3OMB46Dc9YkkIvgH8Gbv/+2wrQBVXNpaCW/mv5Z8NX0VYmtZBGR
 sHYzQNTrB3yJEG3eQtO4fdJiVUw2mGm2gl+L2+VGMcKhB0tpV5W2kIXOka9bDU9uvVK/RcofZhYkN
 TiVzr2f05L1iipPvCMMByOa2+3MaiKC8FgX1Xt9f3mCb/5B7oCyro/mQR2M7gZH0c6S5MQXbYT6nY
 bAue5opA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47070)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sGbGE-0001EV-1D;
 Mon, 10 Jun 2024 10:24:18 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sGbGF-0006lX-TT; Mon, 10 Jun 2024 10:24:19 +0100
Date: Mon, 10 Jun 2024 10:24:19 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <ZmbGQ8bnxBIudT1S@shell.armlinux.org.uk>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
 <E1sD0Ov-00EzBu-BC@rmk-PC.armlinux.org.uk>
 <6n4xvu6b43aptstdevdkzx2uqblwabaqndle2omqx5tcxk4lnz@wm3zqdrcr6m5>
 <6qpcartwgkgdmtxwj4puxn2exbpiv6t6fxv2b3kecu6ezzdogs@yii3j3xtougr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6qpcartwgkgdmtxwj4puxn2exbpiv6t6fxv2b3kecu6ezzdogs@yii3j3xtougr>
Cc: netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next v2 3/8] net: stmmac:
 dwmac1000: convert sgmii/rgmii "pcs" to phylink
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

On Wed, Jun 05, 2024 at 04:59:14PM -0500, Andrew Halaney wrote:
> On Wed, Jun 05, 2024 at 03:05:43PM GMT, Andrew Halaney wrote:
> > This seems to me that you're doing the TODO here? Maybe I'm
> > misunderstanding... maybe not :)
> > 
> > > +		phylink_pcs_change(&hw->mac_pcs, false);
> 
> Continuing to read through this all, sorry for the double reply and
> possibly dumb question. Should we be passing in false unconditionally
> here?

It depends whether there is a way to get the current status of the link
without side effects (e.g. where a read clears a latched-low link
status.) If that's not possible, then passing "false" is safe provided
there aren't any spurious interrupts, since we'll always assume that
the link has dropped. If there are spurious interrupts, then the link
will go down/up each time there's a spurious interrupt. Even so, that's
better than missing a change in the link status which may result in
loss of link without manual intervention.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
