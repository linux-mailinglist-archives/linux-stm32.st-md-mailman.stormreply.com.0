Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB83379A99E
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Sep 2023 17:28:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F503C6B46E;
	Mon, 11 Sep 2023 15:28:42 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACA3FC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Sep 2023 15:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L3aWAk1k0F3xbo0PvehavMWBi8SSBtH1rAKg3ce9DIM=; b=ty7Ypls+BHIWlRgl2wrP6P562d
 bKwZytfMDIWEq0e/K6fz5pSdCicwgf+cJmbBsSj/WJ1875CYuX3zbVDxuJJEtgtQiie413huwdi4I
 ignBXctM0Gofrr8PcOcPw7hIintSS/3Btb3q/PL1GrLSDUqIZOLLcMS2yAoSw4N2vTkuIslrJhI5v
 sN1adAX3lnSC1UOtWY4vqRv0350qh7E9zzoPKH3gLaYwiWWuqiMKMqFpDXe2vo3U+AgPtYeyn9OGz
 9MwLNkCTS3CSaKj1GAS9Bgat9ACvjkeQJltC7ae7avK7b0fRnUBf3zb0OuX3riHKYLYu2NqX2w1Ip
 gEhfeuvQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53518)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qfipq-0008BR-2W;
 Mon, 11 Sep 2023 16:28:22 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qfipk-0001m7-Vh; Mon, 11 Sep 2023 16:28:16 +0100
Date: Mon, 11 Sep 2023 16:28:16 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Message-ID: <ZP8yEFWn0Ml3ALWq@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Daniel Borkmann <daniel@iogearbox.net>,
 netdev@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Samin Guo <samin.guo@starfivetech.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Fabio Estevam <festevam@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Jesper Dangaard Brouer <hawk@kernel.org>
Subject: [Linux-stm32] [PATCH net-next 0/6] net: stmmac: add and use library
 for setting clock
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

There is a common theme throughout several "bsps" in the stmmac driver
which all code up the same thing: for 10M, 100M and 1G, select the
appropriate 2.5MHz, 25MHz, or 125MHz clock.

Rather than having every BSP implement the same thing but slightly
differently, let's provide a single implementation which is passed
the struct clk and the speed, and have that do the speed to clock
rate decode.

Note: only build tested.

 drivers/net/ethernet/stmicro/stmmac/Makefile       |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    | 37 ++++---------
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    | 27 +++-------
 .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c | 35 ++++---------
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     | 61 ++++++----------------
 .../net/ethernet/stmicro/stmmac/dwmac-starfive.c   | 29 +++-------
 .../net/ethernet/stmicro/stmmac/stmmac_plat_lib.c  | 29 ++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_plat_lib.h  |  8 +++
 8 files changed, 91 insertions(+), 137 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_plat_lib.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_plat_lib.h

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
