Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A334A54F64
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Mar 2025 16:44:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5DE9C7801E;
	Thu,  6 Mar 2025 15:44:43 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE886CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 15:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iqLTGgFW/Idb/RWJchf5+oj54Xp1Xr/3EggXQFnKjbg=; b=zg5fWzzg0ciofiTPI5rB/vbzNy
 WfPtrhrK/GWO2fk4YllvIpM+OR9zwj+nAcHdFxGejKYSLJxFb14lamIUz029dUennkO+S/8xVwuKc
 pWpGlU0OakPqbwkewGvaK7xfdpzRob+q6JwaxaXhNoWbqP9Op+aRtpsOdJre4ZOSQX1nrxyDbY+36
 dwWYXr59SJGNLnf9PF1mlryhiM4aHClD6+aAm22Y4/shvpvQn0l2CNkrHW7lUv7g6/QFOfOTssfz+
 4myjdw/1c6uQYOEnEyXLxfIhfWMGyWFfhFtY6V5aE6sU8xkDUpYR9cz8mguYi05IG5uCLynbEIjiF
 Xtu/bAfA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36454)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tqDOj-00067c-2X;
 Thu, 06 Mar 2025 15:44:33 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tqDOh-0006uz-01;
 Thu, 06 Mar 2025 15:44:31 +0000
Date: Thu, 6 Mar 2025 15:44:30 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <Z8nC3vvZWAl5_8WZ@shell.armlinux.org.uk>
References: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
 <f783cf9c-9f79-4680-a6e9-d078abbd96ec@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f783cf9c-9f79-4680-a6e9-d078abbd96ec@nvidia.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Thierry Reding <treding@nvidia.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC 0/5] net: stmmac: fix resume failures
	due to RX clock
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

On Thu, Mar 06, 2025 at 11:30:53AM +0000, Jon Hunter wrote:
> Hi Russell,
> 
> On 27/02/2025 14:37, Russell King (Oracle) wrote:
> > Hi,
> > 
> > This series is likely dependent on the "net: stmmac: cleanup transmit
> > clock setting" series which was submitted earlier today.
> 
> I tested this series without the above on top of mainline and I still saw
> some issues with suspend. However, when testing this on top of -next (which
> has the referenced series) it works like a charm. So yes it does appear to
> be dependent indeed.
> 
> I have tested this on Tegra186, Tegra194 and Tegra234 with -next and all are
> working fine. So with that feel free to add my ...
> 
> Tested-by: Jon Hunter <jonathanh@nvidia.com>

Hi Jon,

I came up with an alternative approach which should make this safer -
for example, if the PHY remains linked with the partner over an
ifdown or module remove/re-insert.

Please see v2 of "net: stmmac: approach 2 to solve EEE LPI reset
issues" which replaces this series.

https://lore.kernel.org/r/Z8m-CRucPxDW5zZK@shell.armlinux.org.uk

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
