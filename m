Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A0172627D
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 16:14:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F063CC6A5E7;
	Wed,  7 Jun 2023 14:13:59 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37DEFC65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 14:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KleB+ugHaYugKJ9gSA4qsXI2OvMw4kTkMupOcPrFgkc=; b=KgsJPTlcL74jg3sbLH88TCp8zP
 H5aobn2X5sq+oDbRQfNmgF+1obpLKR9WADsbLjRtZU+oZu+gZq/cE6/TkVpn4XKSn5WQScCRzGFl4
 BrHYrT+OAs9SodL2QDNP8bQmoOePwjkfxc6qyXUG6y+1uRLG/9W2TbKmmV4wuXE2M8bZRpsevnh3+
 QoZu2hlL+7wXlgNZ+Z6SYtbl5PflXJnKWisugDC3KQEuGeDupn2nThBo9fwD0W3jXL1+T1rIZhSJe
 92nED/hawtNl3qbrp2qdGknIUZjyYjM8y39rtcY92CS3wv3b6RKQj+E5CZx/60D0wQmtUbL4Zc3Ff
 Nf+YS5TA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49616)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1q6tv6-0007cF-Fo; Wed, 07 Jun 2023 15:13:52 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1q6tv4-0008IV-4b; Wed, 07 Jun 2023 15:13:50 +0100
Date: Wed, 7 Jun 2023 15:13:50 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <ZICQngRXett8g+gj@shell.armlinux.org.uk>
References: <20230607135941.407054-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230607135941.407054-1-maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Eric Dumazet <edumazet@google.com>, thomas.petazzoni@bootlin.com,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <simon.horman@corigine.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, alexis.lothore@bootlin.com,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Feiyang Chen <chenfeiyang@loongson.cn>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, davem@davemloft.net,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v4 0/5] Followup fixes for the
 dwmac and altera lynx conversion
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

On Wed, Jun 07, 2023 at 03:59:36PM +0200, Maxime Chevallier wrote:
> Hello everyone,
> 
> Here's yet another version of the cleanup series for the TSE PCS replacement
> by PCS Lynx. It includes Kconfig fixups, some missing initialisations
> and a slight rework suggested by Russell for the dwmac cleanup sequence,
> along with more explicit zeroing of local structures as per MAciej's
> review.

For the series, which brings an immediate fix to the problems people
are noticing:

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
