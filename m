Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 948E2712155
	for <lists+linux-stm32@lfdr.de>; Fri, 26 May 2023 09:42:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3EB68C6A61A;
	Fri, 26 May 2023 07:42:58 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA1BBC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 May 2023 07:42:57 +0000 (UTC)
X-GND-Sasl: maxime.chevallier@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1685086977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=CD5MYQG/P9DJMQ6F69EVjqv9sqK9CsGsG57bFzikUnQ=;
 b=FlJ92oUAtihkmjG7KIBvcWJ/aMq/FKssGkp03r4QeRvVj2JZy2JvTB742uVx0T6KVAOdZz
 fSU/oqC3RJ5KcsEYoYuJeGJtmW/XaYdVUdVx1MZ0bdO63slhxLW+v4kRnS/cEFs/Hq1rDG
 K6VTivOvJfamvdX8IrAYdhthvLJz6IUj744WbfpHvVMLV1oqqcbGFCtIb4AKrFoNqu3pd6
 HFxdN07p6cNx2+mtwTYw7nAbmO7wDjDziKYLPemMhC5xb8xnBo/ikNJXD/XHKucrxjnVfJ
 cLsGCQXxsCDs/w6n8CBmb3ZHEeL5x8XTWFWjd2ZUsASo34CekI0ILSK3nXCL0w==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02D191C000F;
 Fri, 26 May 2023 07:42:53 +0000 (UTC)
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Mark Brown <broonie@kernel.org>,
	davem@davemloft.net
Date: Fri, 26 May 2023 09:42:48 +0200
Message-Id: <20230526074252.480200-1-maxime.chevallier@bootlin.com>
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
Subject: [Linux-stm32] [PATCH net-next v3 0/4] net: add a regmap-based mdio
	driver and drop TSE PCS
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

This is the V3 of a series that follows-up on the work [1] aiming to drop the
altera TSE PCS driver, as it turns out to be a version of the Lynx PCS exposed
as a memory-mapped block, instead of living on an MDIO bus.

One step of this removal involved creating a regmap-based mdio driver
that translates MDIO accesses into the actual underlying bus that
exposes the register. The register layout must of course match the
standard MDIO layout, but we can now account for differences in stride
with recent work on the regmap subsystem [2].

Mark, Net maintainers, this series depends on the patch e12ff2876493 that was
recently merged into the regmap tree [3].

For this series to be usable in net-next, this patch must be applied
beforehand. Should Mark create a tag that would then be merged into
net-next ?

This series introduces a new MDIO driver, and uses it to convert Altera
TSE from the actual TSE PCS driver to Lynx PCS.

Since it turns out dwmac_socfpga also uses a TSE PCS block, port that
driver to Lynx as well.

Changes in V3 :
 - Use a dedicated struct for the mii bus's priv data, to avoid
   duplicating the whole struct mdio_regmap_config, from which 2 fields
   only are necessary after init, as suggested by Russell
 - Use ~0 instead of ~0UL for the no-scan bitmask, following Simon's
   review.

Changes in V2 :
 - Use phy_mask to avoid unnecessarily scanning the whole mdio bus
 - Go one step further and completely disable scanning if users
   set the .autoscan flag to false, in case the mdiodevice isn't an
   actual PHY (a PCS for example).

Thanks,

Maxime

[1] : https://lore.kernel.org/all/20230324093644.464704-1-maxime.chevallier@bootlin.com/
[2] : https://lore.kernel.org/all/20230407152604.105467-1-maxime.chevallier@bootlin.com/#t
[3] : https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git/commit/?id=e12ff28764937dd58c8613f16065da60da149048



Maxime Chevallier (4):
  net: mdio: Introduce a regmap-based mdio driver
  net: ethernet: altera-tse: Convert to mdio-regmap and use PCS Lynx
  net: pcs: Drop the TSE PCS driver
  net: stmmac: dwmac-sogfpga: use the lynx pcs driver

 MAINTAINERS                                   |  14 +-
 drivers/net/ethernet/altera/Kconfig           |   2 +
 drivers/net/ethernet/altera/altera_tse.h      |   1 +
 drivers/net/ethernet/altera/altera_tse_main.c |  57 +++-
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   1 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +-
 .../ethernet/stmicro/stmmac/altr_tse_pcs.c    | 257 ------------------
 .../ethernet/stmicro/stmmac/altr_tse_pcs.h    |  29 --
 drivers/net/ethernet/stmicro/stmmac/common.h  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |  90 ++++--
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  12 +-
 drivers/net/mdio/Kconfig                      |  10 +
 drivers/net/mdio/Makefile                     |   1 +
 drivers/net/mdio/mdio-regmap.c                |  93 +++++++
 drivers/net/pcs/Kconfig                       |   6 -
 drivers/net/pcs/Makefile                      |   1 -
 drivers/net/pcs/pcs-altera-tse.c              | 160 -----------
 include/linux/mdio/mdio-regmap.h              |  26 ++
 include/linux/pcs-altera-tse.h                |  17 --
 19 files changed, 267 insertions(+), 513 deletions(-)
 delete mode 100644 drivers/net/ethernet/stmicro/stmmac/altr_tse_pcs.c
 delete mode 100644 drivers/net/ethernet/stmicro/stmmac/altr_tse_pcs.h
 create mode 100644 drivers/net/mdio/mdio-regmap.c
 delete mode 100644 drivers/net/pcs/pcs-altera-tse.c
 create mode 100644 include/linux/mdio/mdio-regmap.h
 delete mode 100644 include/linux/pcs-altera-tse.h

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
