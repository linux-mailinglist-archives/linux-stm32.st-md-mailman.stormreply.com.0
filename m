Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5FAA87B6E
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Apr 2025 11:06:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05E2EC78028;
	Mon, 14 Apr 2025 09:06:09 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21A16C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Apr 2025 09:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gnja6srub3n8tJYS03csOlPaZZrQF5QqUXIS5NZAuvw=; b=Kgb3xxE+36KP1bFTLvCdZqc0HL
 e/Fh3IlAjOp4ZAvzc4UcuLthtIZD34391hP9VimUS8hvGE+b3sKLTkM2RJhz2ICgBX2q/L3W2N8PU
 tK23bjbOibkojsSFIa9MszfDB3ZqiVdtK5IetR771Sb9pCDCnCzMZ/cLZV7Yi7A5i5iefVyOMj6y0
 xLUXAV3hdJFU+iXPVjzBmlESzekW1wK6ZlrGTDjPBvL7IjmK2yfljrSDtaRHX2j43UO6l13L1SM+4
 i+Z6Aby5Njc4n79Je8xr+hSKWDIAiJDOUBWqyWFah6Syxj5YpL7SjxZ+Wgt92r7IPxQ2USKmRZg23
 LAP1tBMA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58320)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1u4FlQ-0006CB-22;
 Mon, 14 Apr 2025 10:06:00 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1u4FlM-0007cR-16;
 Mon, 14 Apr 2025 10:05:56 +0100
Date: Mon, 14 Apr 2025 10:05:56 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z_zP9BvZlqeq3Ssl@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 net-next 0/4] net: stmmac: anarion: cleanups
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

A series of cleanups to the anarion glue driver.

Clean up anarion_config_dt() error handling, printing a human readable
error rather than the numeric errno, and use ERR_CAST().

Using a switch statement with incorrect "fallthrough;" for RGMII vs
non-RGMII is unnecessary when we have phy_interface_mode_is_rgmii().
Convert to use the helper.

Use stmmac_pltfr_probe() rahter than open-coding the call to the
init function (which stmmac_pltfr_probe() will do for us.)

Finally, convert to use devm_stmmac_pltfr_probe() which allows the
removal of the .remove initialiser in the driver structure.

Not tested on hardware.

v2: fix build error, add Andrew's r-bs.

 .../net/ethernet/stmicro/stmmac/dwmac-anarion.c    | 25 +++++++---------------
 1 file changed, 8 insertions(+), 17 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
