Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7358B6D8489
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 19:09:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D04EC6A606;
	Wed,  5 Apr 2023 17:09:01 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CA4FC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 17:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fXg8Mb4yOCOXyW4T6AIOqAjFd/E1fGh7oVSStyatFrU=; b=sI1gxebUBcKKqxgNaWbHB180aE
 WyuecNnx7sFIX6oa6Rc3UFJSttpR5yCk8wA+GX4Gs2/S4d8Kj5HyLJu+LG5f6hg4I1QSF85muu9Ig
 UoZu9oCE3QTJJttpc31MIXwfVIFa0L4sxkml8rvWaNQm56wBQk7xrXQ8q4J/STD94u0WJ3Tl5ISX3
 UFLT6GIYgrg9ZSPOEBjxHynE1Lg7X5hC3jV9KQI4G8VhVZFfTE+GvpVV/CEB23IGuGcfFjbldaV3D
 t3HG9OuI3mZyeb0xBaN0TLlIZKYeeivLyrY4TOwFB7ey0AtPfxnfVyedE236HNPCObgbbXvKax51L
 jx6G4gzw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50532)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1pk6cg-0005ua-Jz; Wed, 05 Apr 2023 18:08:38 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1pk6cY-0006Vl-Ur; Wed, 05 Apr 2023 18:08:30 +0100
Date: Wed, 5 Apr 2023 18:08:30 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Guenter Roeck <linux@roeck-us.net>
Message-ID: <ZC2rDr0lE6p9VsdQ@shell.armlinux.org.uk>
References: <20230324081656.2969663-1-michael.wei.hong.sit@intel.com>
 <20230324081656.2969663-3-michael.wei.hong.sit@intel.com>
 <5bb39f85-7ef0-4cbb-a06b-0d6431ab09b7@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5bb39f85-7ef0-4cbb-a06b-0d6431ab09b7@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, Voon Weifeng <weifeng.voon@intel.com>,
 netdev@vger.kernel.org, Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v3 2/3] net: stmmac: check if MAC
 needs to attach to a PHY
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

On Wed, Apr 05, 2023 at 10:02:16AM -0700, Guenter Roeck wrote:
> Hi,
> 
> On Fri, Mar 24, 2023 at 04:16:55PM +0800, Michael Sit Wei Hong wrote:
> > After the introduction of the fixed-link support, the MAC driver
> > no longer attempt to scan for a PHY to attach to. This causes the
> > non fixed-link setups to stop working.
> > 
> > Using the phylink_expects_phy() to check and determine if the MAC
> > should expect and attach a PHY.
> > 
> > Fixes: ab21cf920928 ("net: stmmac: make mdio register skips PHY scanning for fixed-link")
> > Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> > Signed-off-by: Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>
> 
> With this patch in linux-next, the orangepi-pc qemu emulation fails to
> bring up the Ethernet interface. The following error is seen.
> 
> [   12.482401] dwmac-sun8i 1c30000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
> [   12.487789] dwmac-sun8i 1c30000.ethernet eth0: PHY [mdio_mux-0.1:01] driver [Generic PHY] (irq=POLL)
> [   12.488177] dwmac-sun8i 1c30000.ethernet eth0: no phy found
> [   12.488295] dwmac-sun8i 1c30000.ethernet eth0: __stmmac_open: Cannot attach to PHY (error: -19)
> 
> Reverting this patch fixes the problem.

Please see 20230405093945.3549491-1-michael.wei.hong.sit@intel.com
for the fix.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
