Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F55177FC93
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Aug 2023 19:09:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7847C6B476;
	Thu, 17 Aug 2023 17:09:42 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BA03C6B475
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 17:09:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EF475675B3;
 Thu, 17 Aug 2023 17:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918D7C433CC;
 Thu, 17 Aug 2023 17:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692292180;
 bh=nrZBBHIvwoY7+NGVTUVo+wQxGv/rQfcOhG+8CHuUfbw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fqfCowDBfSqLcVFjlD11GFJSUH0EMWxlBxuC4kwhPdNDkLiKR0O6jOv0xZTf62WnD
 ZVIrCBskydJV8vy56PW6FFBvq0cgiCXysSwL2NsKI6T3LCl3EqiARFrhRlFDel3q/H
 cX8DEnsTqwPxIg2MvmM+0FMqZIa4gb34YemcxM1qXptwCQP4g0ZKeOH1qGfLwL7qxc
 IAOMRahGFT1GeOIUHyE5RaHiXUzIEeQnlX5kGc+fqE+e+NNj1HlX1qV2SF1ILg11Iv
 D5SmzcZnnRMJ4K7l0sHH8qy2k1i6BK/JRJZvk1uO3QzCZHe9brEn9vs9EffWhy0yV4
 5O2iuhBRfHMqw==
From: Jisheng Zhang <jszhang@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Fri, 18 Aug 2023 00:57:42 +0800
Message-Id: <20230817165749.672-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230817165749.672-1-jszhang@kernel.org>
References: <20230817165749.672-1-jszhang@kernel.org>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v5 2/9] net: stmmac: xgmac: add more
	feature parsing from hw cap
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

The XGMAC_HWFEAT_GMIISEL bit also indicates whether support 10/100Mbps
or not.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Alexandre TORGUE <alexandre.torgue@foss.st.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 3aacf791efeb..1ef8fc132c2d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -410,6 +410,7 @@ static int dwxgmac2_get_hw_feature(void __iomem *ioaddr,
 	dma_cap->vlhash = (hw_cap & XGMAC_HWFEAT_VLHASH) >> 4;
 	dma_cap->half_duplex = (hw_cap & XGMAC_HWFEAT_HDSEL) >> 3;
 	dma_cap->mbps_1000 = (hw_cap & XGMAC_HWFEAT_GMIISEL) >> 1;
+	dma_cap->mbps_10_100 = (hw_cap & XGMAC_HWFEAT_GMIISEL) >> 1;
 
 	/* MAC HW feature 1 */
 	hw_cap = readl(ioaddr + XGMAC_HW_FEATURE1);
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
