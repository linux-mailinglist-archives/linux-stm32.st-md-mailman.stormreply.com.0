Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB2E789C9B
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Aug 2023 11:29:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B197DC6B44E;
	Sun, 27 Aug 2023 09:29:03 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52210C6B44D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Aug 2023 09:29:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 223A761546;
 Sun, 27 Aug 2023 09:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062BDC433C8;
 Sun, 27 Aug 2023 09:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693128540;
 bh=2eeq+7FRTyNfKeldAGasRv6sGX46OUHFmY+FSc4kENM=;
 h=From:To:Cc:Subject:Date:From;
 b=rX4IAGxD/LlIE/VrRxKItRZANI9+BMo5JoQ76E40dvbNge7TqlAp6AYk0OWg7w/z4
 6WDtsPb7+ThXUVk0Tv198kiRMI1UyfZOJyqMd+s0P6hHO+G01RgZowgDd9sfL3lZL2
 x4CkPFs+zdmHL7gVz/qlWxJTDgt8wcag23/aIHhqs1tQyb2a48oE4sydFd8OxyKFYS
 mQvkkTnsEkhHqpNX9G2gHRtWTzxv0im8M9yzzrYp5hhEYibeaKpOa6ooxMR8MfqIc9
 t9p6cLbYIIshVGUPAYWZm/5BNpfspq00ZU5Nl46pXWDGUyZ2OxQRBW6ScwQvlbZ1qE
 y/ke+YhkqSXxg==
From: Jisheng Zhang <jszhang@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime@stm-ict-prod-mailman-01.stormreply.prv,
	Coquelin@stm-ict-prod-mailman-01.stormreply.prv,
	Simon Horman <simon.horman@corigine.com>
Date: Sun, 27 Aug 2023 17:17:07 +0800
Message-Id: <20230827091710.1483-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 0/3] add the dwmac driver for
	T-HEAD TH1520 SoC
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

Add the dwmac driver support for T-HEAD TH1520 SoC.

Since the clk part isn't mainlined, so SoC dts(i) changes are not
included in this series. However, it can be tested by using fixed-clock.

Since v1:
  - rebase on the lastest net-next
  - collect Reviewed-by tag
  - address Krzysztof's comment of the dt binding
  - fix "div is not initialised" issue pointed out by Simon

Jisheng Zhang (3):
  dt-bindings: net: snps,dwmac: allow dwmac-3.70a to set pbl properties
  dt-bindings: net: add T-HEAD dwmac support
  net: stmmac: add glue layer for T-HEAD TH1520 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
 .../devicetree/bindings/net/thead,dwmac.yaml  |  77 +++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-thead.c | 302 ++++++++++++++++++
 5 files changed, 393 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/thead,dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
