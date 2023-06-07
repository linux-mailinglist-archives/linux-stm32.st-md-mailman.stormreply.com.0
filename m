Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03037725DF9
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 14:08:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E289C6A5E7;
	Wed,  7 Jun 2023 12:08:17 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B26DC65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 12:08:16 +0000 (UTC)
X-GND-Sasl: maxime.chevallier@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686139695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zDOmdelsTF8Z6hYisJ6LU6CbovJMoLnJ7YdYJmDf1ok=;
 b=DBOeENL1aunjzqB9GnjIuX+NQpbFPAUgX9U+zqJRBmOJxQGc3aLUl/x4yyNnyA690SBdsT
 fam6eB4E74ikXWnKneFeZPBdZrRCANi7s9PH7c0FWqcZH0cHTe8CJz1RF01/C0CE2/R9VA
 1DNMpqioOz63xeQNMQ7bvPttk78uEDN4jFs27talQoWIv2XSz1mwGISQwhHHokvoI7V23v
 TzE+M1fHhUwA8RcIdjhwKAk/D0q4YnDxGjsWd70t4sYyrQsrQJPgqcp5X76RO/9E52rNUN
 b1PGPonop4DMBh2o4mt27FHFm7zQGDDg9b018BjLUdHqKPNf4HyVKITkegFcEQ==
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
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2CF07E0009;
 Wed,  7 Jun 2023 12:08:11 +0000 (UTC)
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net
Date: Wed,  7 Jun 2023 15:59:36 +0200
Message-Id: <20230607135941.407054-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Eric Dumazet <edumazet@google.com>, thomas.petazzoni@bootlin.com,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <simon.horman@corigine.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, alexis.lothore@bootlin.com,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Feiyang Chen <chenfeiyang@loongson.cn>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH net-next v4 0/5] Followup fixes for the dwmac
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

Hello everyone,

Here's yet another version of the cleanup series for the TSE PCS replacement
by PCS Lynx. It includes Kconfig fixups, some missing initialisations
and a slight rework suggested by Russell for the dwmac cleanup sequence,
along with more explicit zeroing of local structures as per MAciej's
review.

V3->V4 :
 - Zero mdio_regmap_config objects
 - Make regmap config more local in dwmac_socfpga
V2->V3 :
 - Fix uninitialized .autoscan field for mdio regmap configuration in
   both altera_tse and dwmac_socfpga
V1->V2 : 
 - Fix a Kconfig inconsistency
 - rework the dwmac_socfpga cleanup sequence

Maxime Chevallier (5):
  net: altera-tse: Initialize local structs before using it
  net: altera_tse: Use the correct Kconfig option for the PCS_LYNX
    dependency
  net: stmmac: make the pcs_lynx cleanup sequence specific to
    dwmac_socfpga
  net: altera_tse: explicitly disable autoscan on the regmap-mdio bus
  net: dwmac_socfpga: initialize local data for mdio regmap
    configuration

 drivers/net/ethernet/altera/Kconfig           |  2 +-
 drivers/net/ethernet/altera/altera_tse_main.c |  3 ++
 drivers/net/ethernet/stmicro/stmmac/common.h  |  1 -
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 29 ++++++++++++++-----
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c |  3 --
 5 files changed, 26 insertions(+), 12 deletions(-)

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
