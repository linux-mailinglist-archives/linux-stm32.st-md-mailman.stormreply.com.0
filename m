Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 189597245AD
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Jun 2023 16:21:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF633C65E70;
	Tue,  6 Jun 2023 14:21:49 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DFD9C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jun 2023 14:21:48 +0000 (UTC)
X-GND-Sasl: maxime.chevallier@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686061307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0t7vCoDVyHCVRpFFeRRHKOJSt4buQfDPbfcgodci2/g=;
 b=Otets2FxZ6YC88+Kr8E458uM6KI2S7033D4zHHmnZL5Hxe9rKBOhhd+zAM13BXEE/EkA5x
 8r8+XAhryxr3Swo2NHKuvmO/XKHWtOn5Fj+T21kxDfrWi9JyVLDI044iMe1lMLxhPc/57x
 msBDKmYXFW3M1OmkhJdGSEHk/sjr1ajbHl5vZHBgJBkgcbdKmeki0EsDJ3ewjVUesGsGHW
 vP8cFmRUH21u0XqWbYQQQx22/21u5JdFhWh048WANhHtWS36j9RlncVqXyou9Px93Toxl0
 RA5J0VgUHinnIPEbX6e/Ey0KHUjyu9vdg+1Impu53Lo3axJCd4mIBMr0CHCmuQ==
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FD25C0013;
 Tue,  6 Jun 2023 14:21:45 +0000 (UTC)
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net
Date: Tue,  6 Jun 2023 16:21:41 +0200
Message-Id: <20230606142144.308675-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 alexis.lothore@bootlin.com, thomas.petazzoni@bootlin.com,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Simon Horman <simon.horman@corigine.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH net-next v2 0/3] Followup fixes for the dwmac
	and altera lynx conversion
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

Following the TSE PCS removal and port of altera_tse and dwmac_socfpga,
this series fixes some issues that slipped through the cracks.

Patch 1 fixes an unitialized struct in altera_tse

Patch 2 uses the correct Kconfig option for altera_tse

Patch 3 makes the Lynx PCS specific to dwmac_socfpga. This patch was
originally written by Russell, my modifications just moves the
#include<linux/pcs-lynx.h> around, to use it only in dwmac_socfpga.

Maxime Chevallier (3):
  net: altera-tse: Initialize the regmap_config struct before using it
  net: altera_tse: Use the correct Kconfig option for the PCS_LYNX
    depenency
  net: stmmac: make the pcs_lynx cleanup sequence specific to
    dwmac_socfpga

 drivers/net/ethernet/altera/Kconfig               |  2 +-
 drivers/net/ethernet/altera/altera_tse_main.c     |  1 +
 drivers/net/ethernet/stmicro/stmmac/common.h      |  1 -
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c   | 15 ++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c |  3 ---
 5 files changed, 16 insertions(+), 6 deletions(-)

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
