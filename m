Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADECBB5030F
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Sep 2025 18:47:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BCA6C3F93A;
	Tue,  9 Sep 2025 16:47:27 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8F4DC3F939
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Sep 2025 16:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kJLGfIEfFGrJAC0JRjmZE5WKb6oew5KObKNjR8npN9g=; b=yrOY1zMkYw5fsZgw93IXW9cT+B
 WbH80A00t3FxrJDywWPIWfWuxuCuDa6MgOyYmO/vVIgTizqYC3UzLK4ExtCh9CMm1x2p6hTWEXn7P
 D1ZKUxl9uwdXTyejTCTp/r/Kr5JrZ2rO86w43xCyT5d10x5oDhNCiqHaS1f7Tlnu3ZWc+ifrJQvOP
 WIM3PqqGy3r6U0uIV9coR/O07xgJB0V3UqbP4MPZ0PQiFAM5vgPsC6D5nu9x7u5uRhInOh8OY4Ms0
 yzuNDhMK0GCaIlUF2KLZvcxsWnFDnPqJbq/PxbHI+7jaV+sMtJoyIG/T8mi+9lnPaeKy02NcIBpnI
 9A4RE2eA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37110)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1uw1Ut-000000008Uu-21Xe;
 Tue, 09 Sep 2025 17:47:11 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1uw1Uo-000000000aH-1unp; Tue, 09 Sep 2025 17:47:06 +0100
Date: Tue, 9 Sep 2025 17:47:06 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aMBaCga5UAXT03Bi@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Richard Cochran <richardcochran@gmail.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 00/11] net: stmmac: timestamping/ptp
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

This series cleans up the hardware timestamping / PTP initialisation
and cleanup code in the stmmac driver. Several key points in no
particular order:

1. Golden rule: unregister first, then release resources.
   stmmac_release_ptp didn't do this.

2. Avoid leaking resources - __stmmac_open() failure leaves the
   timestamping support initialised, but stops its clock. Also
   violates (1).

3. Avoid double-release of resources - stmmac_open() followed by
   stmmac_xdp_open() failing results in the PTP clock prepare and
   enable counts being released, and if the interface is then
   brought down, they are incorrectly released again. As XDP
   doesn't gain any additional prepare/enables on the PTP clock,
   remove this incorrect cleanup.

4. Changing the MTU of the interface is disruptive to PTP, and
   remains so as long as. This is not fixed by this series (too
   invasive at the moment.)

5. Avoid exporting functions that aren't used...

6. Avoid unnecessary runtime PM state manipulations (no point
   manipulating this when MTU changes).

7. Make the PTP/timestamping initialisation more readable - no
   point calling functions in the same file from one callsite
   that return error codes from one location in the called function,
   to only have the sole callee print messages depending on that
   return code. Also simplifying the mess in stmmac_hw_setup().
   Also placing support checks in a better location. Also getting
   rid of the "ptp_register" boolean through this restructuring.

Not tested beyond compile testing. (I don't have my Jetson Xavier NX
platform.) So anyone testing this and providing feedback would be
most welcome.

On that point... I hardly (never?) seem to get testing feedback from
anyone when touching stmmac. I suspect that's because of the structure
of the driver, where MAINTAINERS only lists people for their appropriate
dwmac-* files. Thus they don't get Cc'd for core stmmac changes. Not
sure what the solution is, but manually picking out all the entries
in MAINTAINERS every time doesn't scale.

Therefore, I suggest merging this into net-next so people get to test
it by way of it being in a tree they might be using.

 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 113 ++++++++++++----------
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  10 +-
 3 files changed, 67 insertions(+), 57 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
