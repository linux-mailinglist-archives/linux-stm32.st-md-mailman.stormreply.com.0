Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F35815125
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Dec 2023 21:40:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54113C6DD6D;
	Fri, 15 Dec 2023 20:40:53 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD390C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 20:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1702672852;
 bh=tmuvO6WC72kx4VhOZms+kfLKHe+e/lcMWA8mVqhk/dM=;
 h=From:To:Cc:Subject:Date:From;
 b=FDvGagnQh11yay9sKqRAFXATJ0nqOyf5sUb6QIJk42+lST2ygYw2z5Z8aTomfVWjV
 +fuCzrOPgYHUP/yOr/saeRJ5NEf/OnSbSDncVHH/Clc/n7vjQZJoArOQE/jxy9Fbll
 4Z1qEcKcM27DVHOmgiJ9Jwra7aXkFtd/mpMQgV/g+3E9h4WJ04NjCkZAtOMi6DZkZC
 kQ2F7VCcP457h+ddvdghG4yRl3J0eyaY0vQcGOg7RQduzZsvIobsusxPUFF3VmlSaA
 DupuG+NJuQ8kj0MbThcmlX0WBk1WvauLDhjzYdiBRc/pohlS0j9aJ3jXee6Lk+1Nqt
 oLdWudVY43REA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id DF6EC3781FD5;
 Fri, 15 Dec 2023 20:40:51 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Fri, 15 Dec 2023 22:40:39 +0200
Message-ID: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/9] Enable networking support for StarFive
	JH7100 SoC
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

This patch series adds ethernet support for the StarFive JH7100 SoC and makes it
available for the StarFive VisionFive V1 and BeagleV Starlight boards, although
I could only validate on the former SBC.  Thank you Emil and Geert for helping
with tests on BeagleV!

The work is heavily based on the reference implementation [1] and depends the
SiFive Composable Cache controller and non-coherent DMA support provided by Emil
via [2] and [3].

*Update*: as of next-20231214, all dependencies have been merged.

[1] https://github.com/starfive-tech/linux/commits/visionfive
[2] https://lore.kernel.org/all/CAJM55Z_pdoGxRXbmBgJ5GbVWyeM1N6+LHihbNdT26Oo_qA5VYA@mail.gmail.com/
[3] https://lore.kernel.org/all/20231130151932.729708-1-emil.renner.berthing@canonical.com/

Changes in v3:
 - Rebased series onto next-20231214 and dropped the ccache & DMA coherency
   related patches (v2 06-08/12) handled by Emil via [3]
 - Squashed PATCH v2 01/12 into PATCH v3 2/9, per Krzysztof's review
 - Dropped incorrect PATCH v2 02/12
 - Incorporated Emil's feedback; also added his Co-developed-by on all dts
   patches
 - Documented the need of adjusting RX internal delay in PATCH v3 8/9, per
   Andrew's request
 - Added clock fixes from Emil (PATCH v3 8-9/9) required to support 10/100Mb
   link speeds
 - v2:
   https://lore.kernel.org/lkml/20231029042712.520010-1-cristian.ciocaltea@collabora.com/

Changes in v2:
 - Dropped ccache PATCH 01-05 reworked by Emil via [2]
 - Dropped already applied PATCH 06/12
 - Added PATCH v2 01 to prepare snps-dwmac binding for JH7100 support
 - Added PATCH v2 02-03 to provide some jh7110-dwmac binding optimizations
 - Handled JH7110 conflicting work in PATCH 07 via PATCH v2 04
 - Reworked PATCH 8 via PATCH v2 05, adding JH7100 quirk and dropped
   starfive,gtxclk-dlychain DT property; also fixed register naming
 - Added PATCH v2 08 providing DMA coherency related DT changes
 - Updated PATCH 9 commit msg:
   s/OF_DMA_DEFAULT_COHERENT/ARCH_DMA_DEFAULT_COHERENT/
 - Replaced 'uncached-offset' property with 'sifive,cache-ops' in PATCH 10/12
   and dropped 'sideband' reg
 - Add new patch providing coherent DMA memory pool (PATCH v2 10)
 - Updated PATCH 11/12 according to the stmmac glue layer changes in upstream
 - Split PATCH 12/12 into PATCH v2 10-12 to handle individual gmac setup of
   VisionFive v1 and BeagleV boards as they use different PHYs; also switched
   phy-mode from "rgmii-tx" to "rgmii-id" (requires a reduction of
   rx-internal-delay-ps by ~50%)
 - Rebased series onto next-20231024
 - v1:
   https://lore.kernel.org/lkml/20230211031821.976408-1-cristian.ciocaltea@collabora.com/

Cristian Ciocaltea (7):
  dt-bindings: net: starfive,jh7110-dwmac: Drop redundant reset
    description
  dt-bindings: net: starfive,jh7110-dwmac: Add JH7100 SoC compatible
  net: stmmac: dwmac-starfive: Add support for JH7100 SoC
  riscv: dts: starfive: jh7100: Add sysmain and gmac DT nodes
  riscv: dts: starfive: jh7100-common: Setup pinmux and enable gmac
  riscv: dts: starfive: visionfive-v1: Setup ethernet phy
  riscv: dts: starfive: beaglev-starlight: Setup phy reset gpio

Emil Renner Berthing (2):
  clk: starfive: Add flags argument to JH71X0__MUX macro
  clk: starfive: jh7100: Add CLK_SET_RATE_PARENT to gmac_tx

 .../devicetree/bindings/net/snps,dwmac.yaml   |  3 +-
 .../bindings/net/starfive,jh7110-dwmac.yaml   | 75 +++++++++++-----
 .../dts/starfive/jh7100-beaglev-starlight.dts |  7 ++
 .../boot/dts/starfive/jh7100-common.dtsi      | 85 +++++++++++++++++++
 .../jh7100-starfive-visionfive-v1.dts         |  7 ++
 arch/riscv/boot/dts/starfive/jh7100.dtsi      | 37 ++++++++
 .../clk/starfive/clk-starfive-jh7100-audio.c  |  2 +-
 drivers/clk/starfive/clk-starfive-jh7100.c    | 32 +++----
 .../clk/starfive/clk-starfive-jh7110-aon.c    |  6 +-
 .../clk/starfive/clk-starfive-jh7110-isp.c    |  2 +-
 .../clk/starfive/clk-starfive-jh7110-sys.c    | 26 +++---
 drivers/clk/starfive/clk-starfive-jh71x0.h    |  4 +-
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  6 +-
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 32 ++++++-
 14 files changed, 258 insertions(+), 66 deletions(-)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
