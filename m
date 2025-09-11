Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF26B52F40
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Sep 2025 13:07:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45365C349C1;
	Thu, 11 Sep 2025 11:07:21 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAEDFC36B14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 11:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8qB3/M4iROaSgOmiFUSzNNAEGfamTBErIeBwN20mtPg=; b=ZL+OgqGsNYNibAv1PnDfVADpz8
 7a0mUOE4b1h3RD9rRCeP0XaDn+DO/qqf2TSiTszg9nLZTxw8qgFYrteLG+ceH5ELboIMDf/J38T9Z
 x25A7t/th3w4JgBSJecFu43nYq5Ksk7wCmai8F8FT5OaUiE6D9O3J77pPa6RKB1kw5n9ZySbcJv5r
 UM6aa/eeoAlTc2uWWqnznpXobIrByO6U8JvLBVpctberK0RKent3Bj4cimHV+34g8Lk49slxcD8J4
 7u7SIh8FpGg/NPaUawSrhjY87fIeGLnzZ3Pmh2nKvrdSdNXL1yb+8gSCSBsK7MZMdLMuvGKFoOuQo
 xQrX9o8w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40946)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1uwf8t-000000002rL-2Lgr;
 Thu, 11 Sep 2025 12:07:07 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1uwf8p-000000002IN-3cf6; Thu, 11 Sep 2025 12:07:03 +0100
Date: Thu, 11 Sep 2025 12:07:03 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aMKtV6O0WqlmJFN4@shell.armlinux.org.uk>
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
Subject: [Linux-stm32] [PATCH net-next v2 00/11] net: stmmac:
	timestamping/ptp cleanups
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

v1 was tested by Gatien CHEVALLIER - thanks.

v2: update patch descriptions on a couple of patches identified in v1.

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
