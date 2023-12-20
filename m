Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1649E819F15
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Dec 2023 13:34:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B64E5C6B477;
	Wed, 20 Dec 2023 12:34:28 +0000 (UTC)
Received: from out28-87.mail.aliyun.com (out28-87.mail.aliyun.com
 [115.124.28.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 221D2C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Dec 2023 09:08:28 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.5008219|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0923395-0.0384342-0.869226;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047204; MF=fuyao@sjterm.com; NM=1; PH=DS;
 RN=16; RT=16; SR=0; TI=SMTPD_---.VopdEQt_1703063305; 
Received: from localhost(mailfrom:fuyao@sjterm.com
 fp:SMTPD_---.VopdEQt_1703063305) by smtp.aliyun-inc.com;
 Wed, 20 Dec 2023 17:08:26 +0800
Date: Wed, 20 Dec 2023 17:08:25 +0800
From: fuyao <fuyao1697@cyg.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Message-ID: <ZYKvCQBD-SY9uVLF@debian.cyg>
Mail-Followup-To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org,
 =?utf-8?B?6bqm5YGl5bu6?= <maijianzhang@allwinnertech.com>
MIME-Version: 1.0
Content-Disposition: inline
Organization: work_work_work
X-Mailman-Approved-At: Wed, 20 Dec 2023 12:34:27 +0000
Cc: =?utf-8?B?6bqm5YGl5bu6?= <maijianzhang@allwinnertech.com>
Subject: [Linux-stm32] [PATCH] gmac: sun8i: r40: add gmac tx_delay support
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

r40 can support tx_delay, so we add it.

Signed-off-by: fuyao <fuyao1697@cyg.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 137741b94122..fd07573afc9b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -127,6 +127,7 @@ static const struct emac_variant emac_variant_r40 = {
 	.support_mii = true,
 	.support_rgmii = true,
 	.rx_delay_max = 7,
+	.tx_delay_max = 7,
 };
 
 static const struct emac_variant emac_variant_a64 = {
-- 
2.39.2


-- 
CYG Technology.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
