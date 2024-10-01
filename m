Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C386198C7F3
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Oct 2024 00:01:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DBE6C78019;
	Tue,  1 Oct 2024 22:01:38 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34FB3C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Oct 2024 22:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FKpbw9Uxxm1/Gc6q+N6cP4psHIAMvgo0/79kAYtDZEo=; b=zGfzcXIeFaQbqg1H88SF9RtM5B
 JHDgjGCz1hTEnC3lHayUYI8/Gs2ymaiucTdosDvKGhAONKSyykv1Jqvuc9ngJ0C0eHJp+GouRsVvw
 fZtc7tURnQ7AWy2OVFteGBUwHCQymjY1/9v3eXn13KXxXdPEOD7X5QxpGlTRIXW9ORCURawGBUNJl
 pZX5VgTJiNxmSHHXzR5jKHuPSzS9Wle3CaGghill9/rIiDs+qPQt4SFQLl7cpKbKo2aA5a5lo7j03
 hA9jWXSQM7d5Tk/Ml7DgG7CI4+M7r9hZdobzBpZKVHrr4440liC5TuGNeAmP5KVQfScfCcmv43QiT
 Y8HW2JVg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56570)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1svkvj-0006Ub-2L;
 Tue, 01 Oct 2024 23:01:15 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1svkvd-0005HK-0b;
 Tue, 01 Oct 2024 23:01:09 +0100
Date: Tue, 1 Oct 2024 23:01:09 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <ZvxxJWCTD4PgoMwb@shell.armlinux.org.uk>
References: <ZvwdKIp3oYSenGdH@shell.armlinux.org.uk>
 <E1svfMA-005ZI3-Va@rmk-PC.armlinux.org.uk>
 <fp2h6mc2346egjtcshek4jvykzklu55cbzly3sj3zxhy6sfblj@waakp6lr6u5t>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fp2h6mc2346egjtcshek4jvykzklu55cbzly3sj3zxhy6sfblj@waakp6lr6u5t>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 01/10] net: pcs: xpcs: move PCS
 reset to .pcs_pre_config()
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

On Tue, Oct 01, 2024 at 11:34:42PM +0300, Serge Semin wrote:
> Hi Russell
> 
> On Tue, Oct 01, 2024 at 05:04:10PM GMT, Russell King (Oracle) wrote:
> > Move the PCS reset to .pcs_pre_config() rather than at creation time,
> > which means we call the reset function with the interface that we're
> > actually going to be using to talk to the downstream device.
> > 
> > Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> > Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com> # sja1105
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Continuing the RFC discussion. As I mentioned here:
> https://lore.kernel.org/netdev/mykeabksgikgk6otbub2i3ksfettbozuhqy3gt5vyezmemvttg@cpjn5bcfiwei/
> The PCS-reset procedure actually can be converted to being independent
> from the PHY-interface. Thus you won't need to move the PCS resetting
> to the pre_config() method, and get rid from the pointer to
> dw_xpcs_compat utilization each time the reset is required.
> 
> So why not to merge in my patch to your series as a pre-requisite
> change and then this patch can be converted to just dropping the
> xpcs_find_compat() method call from the xpcs_init_iface() function?
> Alternatively the dropping can be just incorporated into my patch.

I'm wondering why we seem to be having a communication issue here.

I'm not sure which part of "keeping the functional changes to a
minimum for a cleanup series" you're not understanding. This is
one of the basics for kernel development... and given that you're
effectively maintaining stmmac, it's something you _should_ know.

So no, I'm going to outright refuse to merge your patch in to this
series, because as I see it, it would be wrong to do so. This is
a _cleanup_ series, not a functional change series, and what you're
proposing _changes_ the _way_ reset happens in this driver beyond
the minimum that is required for this cleanup. It's introducing a
completely _new_ way of writing to the devices registers to do
the reset that's different.

The more differences there are, the more chances there are of
regressions.

So, again, no..

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
