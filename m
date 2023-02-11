Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F66B6977E2
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Feb 2023 09:18:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02FEFC6A605;
	Wed, 15 Feb 2023 08:18:43 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4A5CC0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Feb 2023 03:18:33 +0000 (UTC)
Received: from localhost (unknown [86.120.32.152])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E20ED6602112;
 Sat, 11 Feb 2023 03:18:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676085513;
 bh=LNDJxjgOHZY/eKro/BYac5WDP/pGehw2tg2CONtqn2Q=;
 h=From:To:Cc:Subject:Date:From;
 b=HQoyAHzUSYcBTbkOlPiVQHjFJZH8Q1anOFaBK7aWcCdwa+BPuqeNEz8nRgYuf5eLk
 UIXUYdhWbw2EaE2ndJCMAi7y6MYmhmtBhlq/Qhd9AUZP2SgDVG0wEg82H6PnoiIZ/g
 P4/fn/t4P+5HGfszaushNeBZj9U4zxx5Vdt2llPbvTZn9uW5sP9JBlqowgqksLP+jG
 M8vfRqUFzpvwlxEzfVMjp0Fdx4qRzavPAKFKvnlsI9kP8LebVASZD/H3Lv/Fh7Kv9C
 93aOUEQTb1tt0At6R3yXB3CWh7/+5ThDcz9bA/nMujXCyNnz8+Akd2CYdRUgjUGXLS
 Aue/+FZSRQboQ==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>
Date: Sat, 11 Feb 2023 05:18:09 +0200
Message-Id: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 Feb 2023 08:18:40 +0000
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 00/12] Enable networking support for StarFive
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

This patch series adds ethernet support for the StarFive JH7100 SoC and 
makes it available for the StarFive VisionFive V1 and BeagleV Starlight 
boards, although I could only validate on the former SBC.

The work is heavily based on the reference implementation [1] and requires 
the non-coherent DMA support provided by Emil via the Sifive Composable 
Cache controller.

Also note there is an overlap in "[PATCH 08/12] net: stmmac: Add glue layer 
for StarFive JH7100 SoC" with the Yanhong Wang's upstreaming attempt [2]:
"[PATCH v4 5/7] net: stmmac: Add glue layer for StarFive JH7110 SoCs". 

Since I cannot test the JH7110 SoC, I dropped the support for it from Emil's
variant of the stmmac glue layer. Hence, we might need a bit of coordination
in order to get this properly merged.

[1] https://github.com/starfive-tech/linux/commits/visionfive
[2] https://lore.kernel.org/linux-riscv/20230118061701.30047-6-yanhong.wang@starfivetech.com/

Cristian Ciocaltea (7):
  dt-bindings: riscv: sifive-ccache: Add compatible for StarFive JH7100
    SoC
  dt-bindings: riscv: sifive-ccache: Add 'uncached-offset' property
  dt-bindings: net: Add StarFive JH7100 SoC
  riscv: dts: starfive: Add dma-noncoherent for JH7100 SoC
  riscv: dts: starfive: jh7100: Add ccache DT node
  riscv: dts: starfive: jh7100: Add sysmain and gmac DT nodes
  riscv: dts: starfive: jh7100-common: Setup pinmux and enable gmac

Emil Renner Berthing (5):
  soc: sifive: ccache: Add StarFive JH7100 support
  soc: sifive: ccache: Add non-coherent DMA handling
  riscv: Implement non-coherent DMA support via SiFive cache flushing
  dt-bindings: mfd: syscon: Add StarFive JH7100 sysmain compatible
  net: stmmac: Add glue layer for StarFive JH7100 SoC

 .../devicetree/bindings/mfd/syscon.yaml       |   1 +
 .../devicetree/bindings/net/snps,dwmac.yaml   |  15 +-
 .../bindings/net/starfive,jh7100-dwmac.yaml   | 106 ++++++++++++
 .../bindings/riscv/sifive,ccache0.yaml        |  33 +++-
 MAINTAINERS                                   |   6 +
 arch/riscv/Kconfig                            |   6 +-
 .../boot/dts/starfive/jh7100-common.dtsi      |  78 +++++++++
 arch/riscv/boot/dts/starfive/jh7100.dtsi      |  55 +++++++
 arch/riscv/mm/dma-noncoherent.c               |  37 ++++-
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 155 ++++++++++++++++++
 drivers/soc/sifive/Kconfig                    |   1 +
 drivers/soc/sifive/sifive_ccache.c            |  71 +++++++-
 include/soc/sifive/sifive_ccache.h            |  21 +++
 15 files changed, 587 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/starfive,jh7100-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c

-- 
2.39.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
