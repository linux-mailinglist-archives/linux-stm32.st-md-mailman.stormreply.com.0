Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4E4C6DDE1
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Nov 2025 11:03:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E54EAC62D37;
	Wed, 19 Nov 2025 10:03:44 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77133C56611
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Nov 2025 10:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y+sgIiXuLSX8878BXnZdAURbfpZ/7Ejmg1bqP8JP5ck=; b=kpFo9qM7iuPsdM+zYOjqS02txO
 4M7kLehtYNmXBJfY73fpDpk3On1guAxfTdG3f4/+cB+hDWj4idMIug9TUrx8eqs7yy0IupTxLV2qG
 D6959asz+TtdSGQiUzwGyJ4MlKUAo0S3goHu9FNs4pswpYkWgv/PECttzzMI6yzoyzHSjhKtgy2zE
 u2QeQIJ7CmdDzj1QOIkaOS0RvSIGGF22MtkkLBSY9+bfqK+zczx8GFugnk1THmhmI88MPrFpWROJ9
 lhZ220fN1y6GKdujBRN0FEIb8nFjbSX2LL3amzluVFeyhPXQB6rGX5QLGe0v3wHRI9GytQ6/g7Ouc
 +KwYFJeg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52384)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vLf1k-000000004QW-32gK;
 Wed, 19 Nov 2025 10:03:04 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vLf1d-000000003Ji-0q5P; Wed, 19 Nov 2025 10:02:57 +0000
Date: Wed, 19 Nov 2025 10:02:56 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aR2V0Kib7j0L4FNN@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Drew Fustini <fustini@kernel.org>, s32@nxp.com,
 Heiko Stuebner <heiko@sntech.de>, Eric Dumazet <edumazet@google.com>,
 Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Keguang Zhang <keguang.zhang@gmail.com>,
 linux-sunxi@lists.linux.dev, Jan Petrous <jan.petrous@oss.nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: pass struct device
	to init/exit
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

Rather than passing the platform device to the ->init() and ->exit()
methods, make these methods useful for other devices by passing the
struct device instead. Update the implementations appropriately for
this change.

Move the calls for these methods into the core driver's probe and
remove methods from the stmmac_platform layer.

Convert dwmac-rk to use ->init() and ->exit().

 .../net/ethernet/stmicro/stmmac/dwmac-anarion.c    |  4 +-
 .../net/ethernet/stmicro/stmmac/dwmac-eic7700.c    |  4 +-
 .../net/ethernet/stmicro/stmmac/dwmac-loongson1.c  | 12 +++---
 .../ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c  |  4 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     | 47 +++++++++-------------
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c    | 14 +++----
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    |  4 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  | 10 ++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c  |  4 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 47 ++++++++++++++++------
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 35 +++++-----------
 include/linux/stmmac.h                             |  4 +-
 14 files changed, 94 insertions(+), 99 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
