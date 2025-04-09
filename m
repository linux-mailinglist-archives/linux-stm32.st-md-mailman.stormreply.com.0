Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5996DA81EB9
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Apr 2025 09:55:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 092D2C78F98;
	Wed,  9 Apr 2025 07:55:26 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CD9EC78F83
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Apr 2025 07:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SA9itoop5/iE+EV485U+CxtHTM5vwihGMgl1JfL4Y4I=; b=P1JDy7Rk3VtfoV87GrOfn1dMGQ
 5Fg6mfT2AiCpxry/D/z1aSrcZqje31h1/30kNqiH/9HbejMnltbmk5f1KWv6QWyhISLdEXh9SV6Qt
 htQh5eFnmpxJzDgdXC5LfYPuRfr+HgvOZhaa6i3znXLe6jVbPiKArVSwcA5N0n+3OZnmgcEs9a3Jf
 RIlUb/cWusokx3LzLJJQWa30lX/WXyVEoXACO9X8WNzkyHayh50DrLQrPDrQtdJFYEuKWn7QzplR0
 dKREbAlNar+u07ntgYK2yngeTcA9wSNuZEIqpMAzQhnnShHfBMLlMEI2fCmAD+kYWIDGcdrhHvEGp
 +t8cOvpQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48580)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1u2QHB-0000Bi-2z;
 Wed, 09 Apr 2025 08:55:14 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1u2QH7-0002OH-12;
 Wed, 09 Apr 2025 08:55:09 +0100
Date: Wed, 9 Apr 2025 08:55:09 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z_Yn3dJjzcOi32uU@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Thierry Reding <treding@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Prabhakar <prabhakar.csengg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 0/2] net: stmmac:
	stmmac_pltfr_find_clk()
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

The GBETH glue driver that is being proposed duplicates the clock
finding from the bulk clock data in the stmmac platform data structure.
iLet's provide a generic implementation that glue drivers can use, and
convert dwc-qos-eth to use it.

 drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 18 ++------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c   | 11 +++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h   |  3 +++
 3 files changed, 18 insertions(+), 14 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
