Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2EC98E6C0
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Oct 2024 01:26:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1499FC78023;
	Wed,  2 Oct 2024 23:26:02 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F6E4C78020
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Oct 2024 23:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K4+fzEoUN3OhErOHpAnLCAX8h/ybmyblHSLZ2uyOM4g=; b=u+CHdYnmsfJUNPnJeKi1yY1De9
 jRCs19Gq86vw5T2G4HikKQT70Ct9G7c5nIx4gP+0Xen9A923rwHj/sSx78lEXy40j0VxAUFadAUqh
 DTo3Aoh1t9xBpKcuU0ntEl9n53arRzHPmzNmHX7vwTQ4UcMJ8E/i5jZ3Dcd9Z+fgfQQNcm8sh7zQ3
 thXATGFVxkKArbyNisoJBI2+EGuuahbP42x+uj14Gb2Czn9NPz1qkirPtYGK+vK+JH3C5XLg2gxAw
 pIZT62b62XgT5i/hnOc/A8+0rFsA4R6MG18Z0YyIiftCvrhE180QwQsaPTk/Fq50k3b1kDGYTbC3w
 H0DAY9BQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37686)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sw8it-0008CU-29;
 Thu, 03 Oct 2024 00:25:35 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1sw8ij-0006KH-1j;
 Thu, 03 Oct 2024 00:25:25 +0100
Date: Thu, 3 Oct 2024 00:25:25 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <Zv3WZYbX9TzitX5K@shell.armlinux.org.uk>
References: <ZvwdKIp3oYSenGdH@shell.armlinux.org.uk>
 <E1svfMA-005ZI3-Va@rmk-PC.armlinux.org.uk>
 <fp2h6mc2346egjtcshek4jvykzklu55cbzly3sj3zxhy6sfblj@waakp6lr6u5t>
 <ZvxxJWCTD4PgoMwb@shell.armlinux.org.uk>
 <68bc05c2-6904-4d33-866f-c828dde43dff@lunn.ch>
 <pm7v7x2ttdkjygakcjjbjae764ezagf4jujn26xnk7driykbu3@hfh4lwpfuowk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <pm7v7x2ttdkjygakcjjbjae764ezagf4jujn26xnk7driykbu3@hfh4lwpfuowk>
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

On Thu, Oct 03, 2024 at 01:56:27AM +0300, Serge Semin wrote:
> On Wed, Oct 02, 2024 at 12:09:22AM GMT, Andrew Lunn wrote:
> > > I'm wondering why we seem to be having a communication issue here.
> 
> No communication issue. I just didn't find the discussion over with
> all the aspects clarified. That's why I've got back to the topic here.
> 
> > > 
> > > I'm not sure which part of "keeping the functional changes to a
> > > minimum for a cleanup series" you're not understanding. This is
> > > one of the basics for kernel development... and given that you're
> > > effectively maintaining stmmac, it's something you _should_ know.
> > > 
> > > So no, I'm going to outright refuse to merge your patch in to this
> > > series, because as I see it, it would be wrong to do so. This is
> > > a _cleanup_ series, not a functional change series, and what you're
> > > proposing _changes_ the _way_ reset happens in this driver beyond
> > > the minimum that is required for this cleanup. It's introducing a
> > > completely _new_ way of writing to the devices registers to do
> > > the reset that's different.
> > 
> > I have to agree with Russell. Cleanups should be as simple as
> > possible, and hopefully obviously correct. They should be low risk.
> 
> In general as a thing in itself with no better option to improve the
> code logic I agree, it should be kept simple. But since the cleanups
> normally land to net-next, and seeing the patch set still implies some
> level of the functional change, I don't see much problem with adding a
> one more change to simplify the driver logic, decrease the level
> of cohesions (by eliminating the PHY-interface passing to the
> soft-reset method) and avoid some unneeded change in this patch set.
> Yes, my patch adds some amount of functional change, but is that that
> a big problem if both this series and my patch (set) are going to land
> in net-next anyway, and probably with a little time-lag?
> 
> Here what we'll see in the commits-tree if my patch is applied as a
> pre-requisite one of this series:
> 
> 1.0 Serge: net: pcs: xpcs: Drop compat arg from soft-reset method
> - 1.1 Russell: net: pcs: xpcs: move PCS reset to .pcs_pre_config()
> * This patch won't be needed since the PHY-interface will be no
>   longer used for the soft-reset to be performed.
> 1.2 Russell: net: pcs: xpcs: drop interface argument from internal functions
> - 1.3 net: pcs: xpcs: get rid of xpcs_init_iface()
> * This patch won't be applicable since the xpcs_init_iface() method
>   will be still utilized for the basic dw_xpcs initializations and the
>   controller soft-resetting.
> ...
> 1.1x Serge: my series rebased onto the Russell' patch set
> 
> Here is what we'll see in the git-tree if my patch left omitted in
> this patch set:
> 
> 2.1 Russell: net: pcs: xpcs: move PCS reset to .pcs_pre_config()
> 2.2 Russell: net: pcs: xpcs: drop interface argument from internal functions
> 2.3 Russell: net: pcs: xpcs: get rid of xpcs_init_iface()
> ...
> 2.1x Serge: net: pcs: xpcs: Drop compat arg from soft-reset method
> + 2.1y Serge: net: pcs: xpcs: Get back xpcs_init_iface()
> * Since the PHY-interface is no longer required for the XPCS soft-resetting
>   I'll move the basic dw_xpcs initializations to the xpcs_init_iface()
>   in order to simplify the driver logic by consolidating the initial
>   setups at the early XPCS-setup stage. This will basically mean to
>   revert the Russell' patches 2.1 and 2.3.
> 2.1z Serge: the rest of my series rebased onto the Russell' patch set
> 
> > 
> > Lets do all the simple cleanups first. Later we can consider more
> > invasive and risky changes.
> 
> Based on all the considerations above I still think that option 1.
> described above looks better since it decreases the changes volume
> in general and decreases the number of patches (by three actually),
> conserves the changes linearity.
> 
> But if my reasoning haven't been persuasive enough anyway, then fine by
> me. I'll just add a new patch (as described in 2.1y) to my series.
> But please be ready that it will look as a reversion of the Russell'
> patches 2.1 and 2.3.

Oh, sod it. Do whatever you bloody well want. I don't care. You're
constantly arguing against me, and I've had enough of this.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
