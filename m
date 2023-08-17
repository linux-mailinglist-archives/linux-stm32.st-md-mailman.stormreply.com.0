Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3678177FC90
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Aug 2023 19:09:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC931C6B475;
	Thu, 17 Aug 2023 17:09:38 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18597C6B461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 17:09:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A97F16758F;
 Thu, 17 Aug 2023 17:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D18C433C8;
 Thu, 17 Aug 2023 17:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692292174;
 bh=/IF04sHkLLuYwZg5UDGG+9COl2K4c5dV5hCvL3rgYGo=;
 h=From:To:Cc:Subject:Date:From;
 b=jGCwjPthnd6uH4tJfKVWBnQmxaCK2g/kXtyb2msrBxtoW25nEs7w1Ajj/BW+fpY6p
 ItcloqGHp1tbzAHwf4QfunNDFPfY7UB2kiKfKvAkHdYjt+pHMEWCAnaS9nmhH+m+UE
 AvW4HFjtvK0lKfL35Mniy6hFbixtI9oMmTXRTqaUQsroGbbvE5Vhk2KHNcvv9WZ3Jt
 Zat6t4/CaGZykYor1fD6Jm7h7kGHsLKEVbAKRIQ7xc53TTEnl0O1eJmmcwZG3T2Jkn
 zbIErRgMecOnIu7Y45iR/vX7Ke8LrJy7n9fHjsa9uoqKp6DBsRnKQG69QAWu9GDFOl
 nPipyytJQzJJQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Fri, 18 Aug 2023 00:57:40 +0800
Message-Id: <20230817165749.672-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v5 0/9] net: stmmac: add new features
	to xgmac
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

This series add below new features to xgmac:

correct RX COE parsing
add more feature parsing from hw cap
enlarge C22 ADDR and rx/tx channels
support parse safety ce/ue irq from DT
support per channel irq

Since v4:
 - move "additionalItems" and "maxItems" a bit earlier to patch5 to
   fix "interrupt-names... is too long"

Since v3:
 - collect Acked-by tag
 - remove patch which enlarges the max XGMAC C22 ADDR to 31 since it's
   merged
 - s/stmmac_request_irq_multi/stmmac_request_irq_multi_channel
 - update the dt-binding to refelct the optional per-channel irq:
     - use enum
     - add additionalItems and maxItems to fix the "interrupt-names ..
       is too long"

Since v2:
 - check per channel irq by (res->rx_irq[0] > 0 && res->tx_irq[0] > 0)
   rather than (res->rx_irq[0] && res->tx_irq[0])
 - bypass if (irq <= 0) when request rx/tx irq

Since v1:
 - remove "_irq" suffix from safety irqs dt binding
 - remove "snps,per-channel-interrupt" dt binding, check the channel irq
   instead.
 - more renaming about "msi" to reflect per channel irq isn't MSI
   specific


Jisheng Zhang (9):
  net: stmmac: correct RX COE parsing for xgmac
  net: stmmac: xgmac: add more feature parsing from hw cap
  net: stmmac: enlarge max rx/tx queues and channels to 16
  net: stmmac: reflect multi irqs for tx/rx channels and mac and safety
  net: stmmac: xgmac: support per-channel irq
  dt-bindings: net: snps,dwmac: add safety irq support
  net: stmmac: platform: support parsing safety irqs from DT
  dt-bindings: net: snps,dwmac: add per channel irq support
  net: stmmac: platform: support parsing per channel irq from DT

 .../devicetree/bindings/net/snps,dwmac.yaml   | 77 ++++++++++++++++++-
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  4 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |  2 +-
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  2 +
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  5 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    | 34 ++++----
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 56 +++++++-------
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 35 +++++++++
 include/linux/stmmac.h                        | 10 +--
 9 files changed, 172 insertions(+), 53 deletions(-)

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
