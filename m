Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 312457A0667
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Sep 2023 15:50:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7E4AC6A5EF;
	Thu, 14 Sep 2023 13:50:47 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5102C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 13:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RPqNFZg2BovBFcxN8fL9WiXVlKTruIYUJDcYs8EBwH8=; b=pyQ/acaFg1vj/25frlNPsNNWxH
 MH7Gq1UHz16ehdwMtql7TzZ0BhwXVUdntVztYotbpqn9+tOhvBu9Xp+uZBaNUmIhnNuvsVbG594C9
 MKBAtEvPiDPXlrQle/x30NCif0jor4iW2BrxBQInHmby8aNx/tXWShdJVeuKordTPfPcbLsEJuIVP
 dpBzTJr9TbKr+s+EAc2Dc/l9OqRvyIfrjQVaVuAqhOEEzsXl+a9t7TdhMErwVQp2RFxtpVgnEHQ4R
 AHqRu5oh5lBJBuJtOnU/EZwdxHeNCD2Uv/XwJFsqhCwH4pcUhKpRpWl5+yF1kDGfI2bulfjhb3Xap
 UqIIrm9A==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56204)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qgmjk-0004F7-2B;
 Thu, 14 Sep 2023 14:50:28 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qgmjf-0004oZ-BT; Thu, 14 Sep 2023 14:50:23 +0100
Date: Thu, 14 Sep 2023 14:50:23 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Message-ID: <ZQMPnyutz6T23E8T@shell.armlinux.org.uk>
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
Subject: [Linux-stm32] [PATCH net-next v2 0/6] net: stmmac: add and use
 library for setting clock
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

v2:
- move dwmac_set_tx_clk_gmii() to stmmac_platform, and rename to have
   stmmac_ prefix.
- add comment body to conversion patches
- use %u for printing speed

 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    | 36 ++++---------
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    | 26 +++-------
 .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c | 34 +++---------
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     | 60 ++++++----------------
 .../net/ethernet/stmicro/stmmac/dwmac-starfive.c   | 28 +++-------
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 25 +++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_platform.h  |  1 +
 7 files changed, 74 insertions(+), 136 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
