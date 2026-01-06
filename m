Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6CFCFAEBD
	for <lists+linux-stm32@lfdr.de>; Tue, 06 Jan 2026 21:30:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A74AC8F279;
	Tue,  6 Jan 2026 20:30:59 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51D0EC8F277
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jan 2026 20:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jX07xLVIsxMza3KOKrZCFuZjgUNblJhk9Q9rDmR+FhQ=; b=piE/fzmPOizXfmLqVhICBmhMhx
 iQHZyHzddzsU+E8JFpwnL8Vbr5T+mgFqhbDRZ45vTp7NTJKNaZHVo2HzepTU9+hsiMKGXz4E6QII7
 Gguq5vaU3C28UtlPskObROeQH2rqA+dczwThEBGxmq+2oFMVAf2NP+Gcx+MoCbi1WSM6KdAsOvnGe
 Z9ooi2kyZa3BbFXwD1j3BRoXKaUtQNjuc2y7s6PgNfV3fiwFRN9PnRr8ZhKFRm16qviN9tsYUknnu
 vonU0X16Womu5x/4GX+4I34fej624gtErmtouljJBBVec9eDmBJQFGG7P9KzHZmXmaicU6LFz2qQ1
 Oo047Xqw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52582)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vdDha-0000000010C-2wW1;
 Tue, 06 Jan 2026 20:30:50 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vdDhX-000000000jR-2EzS; Tue, 06 Jan 2026 20:30:47 +0000
Date: Tue, 6 Jan 2026 20:30:47 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aV1w9yxPwL990yZJ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/9] net: stmmac: cleanups and low priority
	fixes
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

Further cleanups and a few low priority fixes:

- Remove duplicated register definitions from header files
- Fix harmless wrong definition used for PTP message type in
  descriptors
- Fix norm_set_tx_desc_len_on_ring() off-by-one error (and make
  enh_set_tx_desc_len_on_ring() follow a similar pattern.)
  Document the buffer size limits. I believe we never call
  norm_set_tx_desc_len_on_ring() with 2KiB lengths.
- use u32 rather than unsigned int for 32-bit quantities in
  descriptors
- modernise: convert to use FIELD_PREP() rather than separate mask
  and shift definitions.
- Reorganise register and register field definitions: registers
  defined in address offset order followed by their register field
  definitions.
- Remove lots of unused register definitions.

 drivers/net/ethernet/stmicro/stmmac/descs.h        |   7 -
 drivers/net/ethernet/stmicro/stmmac/descs_com.h    |  48 +++---
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |   5 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac100.h     |  36 +----
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h    |  70 +--------
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |  21 ++-
 .../net/ethernet/stmicro/stmmac/dwmac1000_dma.c    |  16 +-
 .../net/ethernet/stmicro/stmmac/dwmac100_core.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac100_dma.c |   3 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  79 ++--------
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |  28 ++--
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c |  70 ++++-----
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h |   8 -
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c   |  40 ++---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h   | 164 +++++++-------------
 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c   |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h    | 172 +++++++++------------
 drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c    |  10 +-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  40 +----
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  21 +--
 .../net/ethernet/stmicro/stmmac/dwxgmac2_descs.c   |  39 ++---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c |  75 ++++-----
 drivers/net/ethernet/stmicro/stmmac/enh_desc.c     |  27 ++--
 drivers/net/ethernet/stmicro/stmmac/norm_desc.c    |  25 ++-
 24 files changed, 346 insertions(+), 662 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
