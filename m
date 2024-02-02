Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F616846B3C
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Feb 2024 09:51:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03F6EC6DD9F;
	Fri,  2 Feb 2024 08:51:12 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B97BBC6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Feb 2024 08:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zgcj+wX/L6IDdldqgziNCDsIyAb6c+kW8GcYNwM7sts=; b=GcEW7nToPq2txWV+ViSERXcFwc
 rIIQ4n6+rou3/R+i4yGctXiLFzZv29zF/60F+jjXeE+KHkkI+HTQgFIorTtxr6i5Za45zbgiGpucj
 p8gdiQ/Qz6wt/2SM4aIkw4zlWDE+fNPHZ2ovt3wAkQpvzQJanqF0SAHiMGwRu0K61OLmBUFMvdnzG
 4NT4zFRK50O0q8jV7zYb1G+Dvhf+oOw/OamJj2xAG9XEZD52Lj7vD6df8J9yUZUZ/ULdzDWo6Nirg
 26NrmJqI7PQdR8VJ1T9wQDKxln+BeKE210XOxjyZftyAu6H1aS4itKKLrMYDKPb1xVrgslxsJGmE1
 J7sImYnQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49854)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1rVpFx-0005e9-2k;
 Fri, 02 Feb 2024 08:50:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1rVpFq-0008Bx-Er; Fri, 02 Feb 2024 08:50:34 +0000
Date: Fri, 2 Feb 2024 08:50:34 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <Zbys2orOUikYxeOm@shell.armlinux.org.uk>
References: <20240129130253.1400707-1-yong.liang.choong@linux.intel.com>
 <20240129130253.1400707-7-yong.liang.choong@linux.intel.com>
 <ZbjNn+C/VHegH2t7@shell.armlinux.org.uk>
 <9e23671e-788c-4191-bdb4-94915ff7da5a@linux.intel.com>
 <ZbtYaXkNf2ZF1prE@shell.armlinux.org.uk>
 <2ad1f55c-f361-4439-9174-6af1bb429d55@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ad1f55c-f361-4439-9174-6af1bb429d55@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Voon Wei Feng <weifeng.voon@intel.com>,
 Simon Horman <simon.horman@corigine.com>, platform-driver-x86@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>, Eric Dumazet <edumazet@google.com>,
 David E Box <david.e.box@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Cochran <richardcochran@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Abdul Rahim Faizal <faizal.abdul.rahim@intel.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v4 06/11] net: stmmac: resetup
 XPCS according to the new interface mode
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

On Fri, Feb 02, 2024 at 11:00:58AM +0800, Choong Yong Liang wrote:
> 
> 
> On 1/2/2024 4:38 pm, Russell King (Oracle) wrote:
> > Note the "This must not modify any state." statement. By reinitialising
> > the PCS in this method, you are violating that statement.
> > 
> > This requirement is because this method will be called by
> > phylink_validate_mac_and_pcs() at various times, potentially for each
> > and every interface that stmmac supports, which will lead to you
> > reinitialising the PCS, killing the link, each time we ask the MAC for
> > a PCS, whether we are going to make use of it in that mode or not.
> > 
> > You can not do this. Sorry. Hard NAK for this approach.
> > 
> Thank you for taking the time to review, got your concerns, and I'll address
> the following concerns before submitting a new patch series:
> 
> 1. Remove allow_switch_interface and have the PHY driver fill in
> phydev->possible_interfaces.

Yes please.

> 2. Rework on the PCS to have similar implementation with the following patch
> "net: macb: use .mac_select_pcs() interface"
> (https://lore.kernel.org/netdev/E1n568J-002SZX-Gr@rmk-PC.armlinux.org.uk/T/).

mac_select_pcs() is about returning to phylink the PCS that the MAC
needs to use for the specified interface mode, or NULL if no PCS is
required, nothing more, nothing less.

Plase do not copy that mac_select_pcs() implementation - changing the
"ops" underneath phylink is no longer permitted.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
