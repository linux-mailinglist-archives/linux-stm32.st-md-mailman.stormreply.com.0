Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8C577E54D
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Aug 2023 17:41:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18A87C6B45F;
	Wed, 16 Aug 2023 15:41:15 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C5FAC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 15:41:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E7FB61737;
 Wed, 16 Aug 2023 15:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F1EC433C8;
 Wed, 16 Aug 2023 15:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692200471;
 bh=E/IKYTzpQNaTIjxwmCo0tbwLoswgeWU73USgeaiUoRc=;
 h=From:To:Cc:Subject:Date:From;
 b=TljYul4JFTwRzGTmjIOHRlZZQr9Fi9g0zZjcfNrIgEaDromvz+slL8+dX/zmWBAbI
 liD/G1qoAvyIkn53it76Hw0PmJkqFRrtMOtrQc/ycA1ASxULJ8sh4bZsR1hD7FvFt5
 4AA6M5BtKrOiW9LYqwxtBoRmxy2zDt4GqgHJvVnGZkc+RlvNpqcrs4iEGQe1z3sgHA
 FCVW1bRlTvptubJLDdptiyTeqWfUE4mNhM7gOrInUMgOQVvj/quI70mQFRWMUkR9La
 2gd/NF65Ytfv2d0O94APf5/LTJpMT/4EUHePJ9UbGDsVM7K753pvLh/KaA0s2LZTwl
 KEcd+ZEsSIPMw==
From: Jisheng Zhang <jszhang@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Wed, 16 Aug 2023 23:29:17 +0800
Message-Id: <20230816152926.4093-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v4 0/9] net: stmmac: add new features
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

Since v3:
 - collect Acked-by tag
 - remove patch which enlarges the max XGMAC C22 ADDR to 31 since it's
   merged
 - s/stmmac_request_irq_multi/stmmac_request_irq_multi_channel
 - update the dt-binding to refelct the optional per-channel irq:
     - use enum
     - add additionalItems and maxItems to fix the "interupt-names ..
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
