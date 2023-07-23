Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCD975E393
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Jul 2023 18:22:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11162C6B442;
	Sun, 23 Jul 2023 16:22:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DBECC6A5E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jul 2023 16:22:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 19D5B60DFB;
 Sun, 23 Jul 2023 16:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81AE9C433C8;
 Sun, 23 Jul 2023 16:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690129336;
 bh=+ysItbKZr2r8wDthNuZTqSVce0mf6PlXK4jyZ+ackfA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K8bpSYVX9RUYYhbQaQqgpUmPVLnuD1/g19mdl573T6CZcPKyqBBBBeKKBpn2vH8RV
 c/nXfG+3ag9VK1FeXznOirepvtWS0r5vtzDQ3QwmhuhGL3mwXa/TIMb9gB/VZz4/7k
 WYOeFc7KTyiY8+aivYsF37WuKlQnsS2W1JTd2Xn9+pvAhsIVT0hsUTK9ILG+geuQ2t
 h4u1Dpod4CWczqZhCrjMKl6udaF6Ewa3L81UjWRdfHd3y4sw9mB4DweGRDgSL8w0up
 dBvG+uBWel61arpomk8HKW5bLnFozmEGG3W6nDlDwNP2u8CtUn2GihZcGC0lUjjeUK
 l82PKeVU22yhg==
From: Jisheng Zhang <jszhang@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Mon, 24 Jul 2023 00:10:22 +0800
Message-Id: <20230723161029.1345-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230723161029.1345-1-jszhang@kernel.org>
References: <20230723161029.1345-1-jszhang@kernel.org>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 03/10] net: stmmac: mdio: enlarge the
	max XGMAC C22 ADDR to 31
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

The IP can support up to 31 xgmac c22 addresses now.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 3db1cb0fd160..e6d8e34fafef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -40,7 +40,7 @@
 #define MII_XGMAC_WRITE			(1 << MII_XGMAC_CMD_SHIFT)
 #define MII_XGMAC_READ			(3 << MII_XGMAC_CMD_SHIFT)
 #define MII_XGMAC_BUSY			BIT(22)
-#define MII_XGMAC_MAX_C22ADDR		3
+#define MII_XGMAC_MAX_C22ADDR		31
 #define MII_XGMAC_C22P_MASK		GENMASK(MII_XGMAC_MAX_C22ADDR, 0)
 #define MII_XGMAC_PA_SHIFT		16
 #define MII_XGMAC_DA_SHIFT		21
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
