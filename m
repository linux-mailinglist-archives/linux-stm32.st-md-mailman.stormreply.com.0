Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FE5AD768D
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 17:41:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56B8FC32E8E;
	Thu, 12 Jun 2025 15:41:06 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52C82C36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 15:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ovLz1bXOwuyb8LOC7DzxQcjGmyjM0gF1HJUD1277E/E=; b=0pgm9N7kHgk7OBk8ajf/hV/MYm
 81fRtd8g0erMhPmAyoRZ47m9U30VPZRp8hqFxlGArohluP0+CO1LPc9Z4q96EYTrl0mLDe3MDfd0s
 DFXFCzS3G7AQforiMBlF+hf0Xlz/tSvVz5FhvcmMGUQHhN98GoCNp80biRzuMOSYUwWaR1Lpi4vBt
 hPUdhaP880Rz+Ny0Z2MT7+1cOtU0Jabkf6xS9up3vYdtADVHdHxa2eXdGrJ/FA+wWAjX7MEjfyJAq
 1M9c4np7ZJwpZZcArG7uUWDRxAtX0jgLanBpa5s80EW2Sdq88Hz6kV6qwTMNQp0Jx0okFUTCBpAAw
 O9pr/ypg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58594)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1uPk31-000837-1j;
 Thu, 12 Jun 2025 16:40:59 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1uPk2w-0000uM-0f;
 Thu, 12 Jun 2025 16:40:54 +0100
Date: Thu, 12 Jun 2025 16:40:54 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/9] net: stmmac: rk: much needed
	cleanups
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

Hi,

This series starts attacking the reams of fairly identical duplicated
code in dwmac-rk. Every new SoC that comes along seems to need more
code added to this file because e.g. the way the clock is controlled
is different in every SoC.

The first thing to realise is that the driver only supports RMII and
RGMII interface modes. So, the first patch adds a .get_interfaces()
implementation which reports this for phylink's usage, thus ensuring
that we error out during initialisation should something that isn't
supported be specified. Note that there is one case where there are
a pair of interfaces, one supports only RMII the other supports RMII
and RGMII, but we report both anyway - something that the existing
driver allows. A future patch may attempt to fix this.

Rather than writing code, let's realise that there are two major
implementations here:

1. a struct clk that needs to be set.
2. writing a register with settings for RGMII and RMII speeds.

Provide implementations for these, Also realise that as a result
of doing this, we can kill off the .set_rgmii_speed() and
.set_rmii_speed() methods by combining them together - indeed,
this is what later SoCs already do by pointing both these methods
at the same function.

Overall, this patch series shrinks the file LOC by almost 8.7%
by removing 175 lines from over 2000 lines.

Apart from the error reporting changing and restricting interface
modes to those that the driver supports, no functional change is
anticipated with this patch. However, I have no hardware to test
this.

 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 689 +++++++++----------------
 1 file changed, 257 insertions(+), 432 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
