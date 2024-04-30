Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B31D58B820F
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2024 23:43:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65183C7128B;
	Tue, 30 Apr 2024 21:43:20 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AC6CC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2024 21:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lggD9pYkib5zG81CMuS1CQFd5BKo9d5BLNerDS5nZpQ=; b=1LZsSCsGl88A0iFRIhQFVH50Vs
 exc4TQqh5edpZ7j7aAe7dn1OHmPAxLtwK+0ilAWXWrcYYHYkK266WfeSZL/hA7hMPf5uMd/LTE5Nu
 V0gb2tk0IIMLIYGx0J6jCeQM43fjWVKS9JFicDU5g/Q/jM6FSYLSZftvlGh4hU/1hxHDKFt9kuP8X
 Fpvad71H7Kss9GjnLKqcgdd+We1QQc5kZXqKUMWbHCW0c9aEHPn7XBSeHMf1Vu2I/sjvynuQYLbrz
 N+jNmDnNJrdQSQ7zVjcpHZiQhXhWEgEvSGXKGmc/wdmdxWC1pKFsd0wpJ5apN3ILheEP84daTo//L
 uoVso/IQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40672)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1s1vFd-0005XP-0g;
 Tue, 30 Apr 2024 22:43:01 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1s1vFa-00026i-S0; Tue, 30 Apr 2024 22:42:58 +0100
Date: Tue, 30 Apr 2024 22:42:58 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <ZjFl4rql0UgsHp97@shell.armlinux.org.uk>
References: <uz66kbjbxieof6vkliuwgpzhlrbcmeb2f5aeuourw2vqcoc4hv@2adpvba3zszx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <uz66kbjbxieof6vkliuwgpzhlrbcmeb2f5aeuourw2vqcoc4hv@2adpvba3zszx>
Cc: andrew@lunn.ch, davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] racing ndo_open()/phylink*connect() with
	phy_probe()
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

On Tue, Apr 30, 2024 at 04:02:19PM -0500, Andrew Halaney wrote:
> Basically, NetworkManager is setting both interfaces to up, and end1's
> phy doesn't seem to be ready when ndo_open() runs, returning
> -ENODEV in phylink_fwnode_phy_connect() and bubbling that back up. This doesn't

Let's get something clear - you're attributing phylink to this, but this
is not the case. phylink doesn't deal directly with PHYs, it makes use
of phylib for that, and merely passes back to its caller whatever status
it gets from phylib. It's also not fair to attribute this to phylib as
we will see later...

There are a few reasons for phylink_fwnode_phy_connect() would return
-ENODEV:

1) fwnode_get_phy_node() (a phylib function) returning an error,
basically meaning the phy node isn't found. This would be a persistent
error, so unlikely to be your issue.

2) fwnode_phy_find_device() (another phylib function) not finding the
PHY device corresponding to the fwnode returned by the above on the
MDIO bus. This is possible if the PHY has not been detected on the
MDIO bus, but I suspect this is not the cause of your issue.

3) phy_attach_direct() (another phylib function) returning an error.
This function calls phy_init_hw() which will attempt to talk to the
hardware, and if that returns an error, it will be propagated up.

(3) is the most likely scenario given your quoted DT description. I
suspect that the stmmac/qcom-ethqos driver is what's at fault here.

Your DT description shows that the PHYs are on one MDIO bus owned by
one of the network interfaces. I suspect if that network interface
is down, then the MDIO bus is not accessible.

Therefore, when you attempt to open the _other_ network interface,
accesses to its PHY fail with -ENODEV and that gets propagated all
the way back up.

What's more is if you did manage to get that network interface up
(because the one with the MDIO bus on was up) then if you take
that interface down, you'll end up with a phy_error() splat from
phylib because the PHY it was using has become inaccessible.

Basically, the network driver is buggy for this PHY setup. If a
MDIO bus contains devices that are not owned by the network device
owning that MDIO bus, then the MDIO bus _must_ be prepared to handle
MDIO bus accesses _at_ _any_ _time_. This clearly is not the case
here.

It could also be the case that if the driver is using runtime PM,
that when the network interface is runtime-PM suspended, it causes
MDIO bus accesses to fail... that would be very chaotic though.

In any case, I'm going to say... I don't think this is a phylink nor
phylib issue, but a buggy network driver thinking that it has the
right to shutdown MDIO bus access depending on its network interface
state.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
