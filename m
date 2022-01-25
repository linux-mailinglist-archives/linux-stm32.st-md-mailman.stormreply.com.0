Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4246649BB90
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jan 2022 19:53:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5D2CC5F1D5;
	Tue, 25 Jan 2022 18:53:07 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91C0FC5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jan 2022 18:53:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D53D1B819FC;
 Tue, 25 Jan 2022 18:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2374EC340E0;
 Tue, 25 Jan 2022 18:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643136785;
 bh=iIsDIofxdHO/kYl3PGfWu5p5sOUN6/kd7s463fCVl+s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JzCi1WQCGXT/72UAF30/6rXvvR3VRVSBpDcUQ/NOszaqH16mdFmAz9u6aisDxLrAc
 xqw/tUTB0eR0GDC93SzPgAOKvJgP8Gv+HCfJmePqWBzoHQF1SBr0xSjWZT7vFECiFy
 YsvBwqrwMGODYqovueMCIe55tkYa75dH0m0MVN/BZ30YoDURD+KZm9EMeAXOvzhz0h
 JZC+ja2BlCwEz74Xidhr2ozLd1mnUBzaekNYrnsPFRlcVqe8+Q4TRKJvACg67oNu2T
 MX5LqAHDGeuvt3UV088rREbFxM3Mww1zdV/ZJvYdpdi08qQc8OBM2bqAuumiquzwb2
 SVjSmp7s8p8lw==
Date: Tue, 25 Jan 2022 10:53:03 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20220125105303.2025dfae@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <E1nCOs4-005LSp-HF@rmk-PC.armlinux.org.uk>
References: <YfAnkuhiMoeFcVnb@shell.armlinux.org.uk>
 <E1nCOs4-005LSp-HF@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 4/7] net: stmmac/xpcs: convert to
 pcs_validate()
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

On Tue, 25 Jan 2022 16:40:40 +0000 Russell King (Oracle) wrote:
> stmmac explicitly calls the xpcs driver to validate the ethtool
> linkmodes. This is no longer necessary as phylink now supports
> validation through a PCS method. Convert both drivers to use this
> new mechanism.
> 
> Tested-by: Wong Vee Khee <vee.khee.wong@linux.intel.com> # Intel EHL            Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Sign-offs got scrambled.

Transient warning from here to patch 6:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:943:22: warning: unused variable 'priv' [-Wunused-variable]
        struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
                            ^
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
