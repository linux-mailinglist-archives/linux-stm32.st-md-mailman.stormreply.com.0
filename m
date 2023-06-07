Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7E6726273
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 16:12:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE5B8C6A5E7;
	Wed,  7 Jun 2023 14:12:28 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3943C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 14:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uVhqIsWCbd8+nVpNyrP6aNc++SDBcJaAni/4NynllGk=; b=1SWC25IVs5qo9VOmQ1jVb+C602
 76A2R/8zSYH4u5oyF4RF9lv+X5M2bsBGYDANb6ElGArEkxhKvlxM+tosByB71IqW6se1Ur7uuIcS1
 CcWRbft8cI/KfQ4jIoEd4LA+y8X9NadGyPTsfNxsdh7aJz0zR5oS+lBfPth32k9j9yiU+NMcvVLhM
 QhDd/AZzUAQGKf7QYj1IGga3RS/EbWB5kzYT5CUUI4lt/2qnBa6ExNJ84fIdFgLd3DuQw+/xHtfKR
 DQdM+/QCAlW2u8/QL+LQc0osP9aKyRS2oifIkV47H+Nmpv5RGCXaFds0Z0thDPWvDcnl5S/4O7zFF
 IyZVjQeg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48662)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1q6ttO-0007b8-SK; Wed, 07 Jun 2023 15:12:06 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1q6ttI-0008IG-UQ; Wed, 07 Jun 2023 15:12:00 +0100
Date: Wed, 7 Jun 2023 15:12:00 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <ZICQMHTowGQTzbxm@shell.armlinux.org.uk>
References: <20230607135638.1341101-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230607135638.1341101-1-arnd@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, Bhadram Varka <vbhadram@nvidia.com>,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Simon Horman <simon.horman@corigine.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Christian Marangi <ansuelsmth@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Samin Guo <samin.guo@starfivetech.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] stmmac: fix pcs_lynx link failure
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

On Wed, Jun 07, 2023 at 03:56:32PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The mdio code in stmmac now directly links into both the lynx_pcs and
> the xpcs device drivers, but the lynx_pcs dependency is only enforced
> for the altera variant of stmmac, which is the one that actually uses it.
> 
> Building stmmac for a non-altera platform therefore causes a link
> failure:
> 
> arm-linux-gnueabi-ld: drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.o: in function `stmmac_mdio_unregister':
> stmmac_mdio.c:(.text+0x1418): undefined reference to `lynx_pcs_destroy'
> 
> I've tried to come up with a patch that moves this dependency back into
> the dwmac-socfpga.c file, but there was no easy and obvious way to
> do this. It also seems that this would not be a proper solution, but
> instead there should be a real abstraction for pcs drivers that lets
> device drivers handle this transparently.

There is already a patch set on netdev fixing this properly.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
