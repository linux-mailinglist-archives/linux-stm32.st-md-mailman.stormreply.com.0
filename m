Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C21B37E666A
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Nov 2023 10:15:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89B5CC6B47A;
	Thu,  9 Nov 2023 09:15:57 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 516E8C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Nov 2023 09:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QrvJkzyPb5eXMLbw/U/qM6wbTs8u3y089/0QYgihCZc=; b=e1cnhHhbRfJJONN+GNW4kdjpqt
 MEOj/OKISubVwkr4/XNFHD0LiTKr/DCcuIUu6DAjQmFIrjsy8VM0M1myuxsuU4OLbczvHSlTN1bZf
 vUldxONBLp1fpzsyeMeziawnQL6EZQnpRZ/49W2NhQkE0OWZUvTvSIr6OfOngPu6IUazc9J4Wt2eZ
 U/0B6VqdrF7nxM7gwc/rL6SB/+Rx8CjDgUnlEfpC+Dk4q0OOu0eMEtSOKll8rRtr9HPYaQSWvIcx7
 owQgd0W1doctv4yyEu/yIG7anYV8vFVj/qkYFkWf+oC5BTHHcc86was5sLFu+4vmT+bkFAmabYeJt
 GXESwD8Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45130)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1r118V-0002B9-2p;
 Thu, 09 Nov 2023 09:15:39 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1r118S-0000Qi-UQ; Thu, 09 Nov 2023 09:15:36 +0000
Date: Thu, 9 Nov 2023 09:15:36 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gan Yi Fang <yi.fang.gan@intel.com>
Message-ID: <ZUyjOEQHHnnbzwrV@shell.armlinux.org.uk>
References: <20231109050027.2545000-1-yi.fang.gan@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231109050027.2545000-1-yi.fang.gan@intel.com>
Cc: linux-kernel@vger.kernel.org, Song Yoong Siang <yoong.siang.song@intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Looi Hong Aun <hong.aun.looi@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: fix MAC and phylink
 mismatch issue after resume with STMMAC_FLAG_USE_PHY_WOL enabled
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

On Thu, Nov 09, 2023 at 01:00:27PM +0800, Gan Yi Fang wrote:
> From: "Gan, Yi Fang" <yi.fang.gan@intel.com>
> 
> The issue happened when flag STMMAC_FLAG_USE_PHY_WOL is enabled.
> It can be reproduced with steps below:
> 1. Advertise only one speed on the host
> 2. Enable the WoL on the host
> 3. Suspend the host
> 4. Wake up the host
> 
> When the WoL is disabled, both the PHY and MAC will suspend and wake up
> with everything configured well. When WoL is enabled, the PHY needs to be
> stay awake to receive the signal from remote client but MAC will enter
> suspend mode.
> 
> When the MAC resumes from suspend, phylink_resume() will call
> phylink_start() to start the phylink instance which will trigger the
> phylink machine to invoke the mac_link_up callback function. The
> stmmac_mac_link_up() will configure the MAC_CTRL_REG based on the current
> link state. Then the stmmac_hw_setup() will be called to configure the MAC.
> 
> This sequence might cause mismatch of the link state between MAC and
> phylink. This patch moves the phylink_resume() after stmamc_hw_setup() to
> ensure the MAC is initialized before phylink is being configured.

Isn't this going to cause problems?

stmamc_hw_setup() calls stmmac_init_dma_engine(), which then calls
stmmac_reset() - and stmmac_reset() can fail if the PHY clock isn't
running, which is why phylink_resume() gets called before this.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
