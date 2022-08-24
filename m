Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C335A02D6
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Aug 2022 22:34:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA20AC6410E;
	Wed, 24 Aug 2022 20:34:58 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05124C640FA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Aug 2022 20:34:57 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id b5so17869858wrr.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Aug 2022 13:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:subject:content-language:cc:to:from
 :user-agent:mime-version:date:message-id:from:to:cc;
 bh=POi4hFc+gT1EkX4nPsQgNWfQX18l5gCV7T3rOCIonGM=;
 b=FZ+Xf1MRzXvpmhNHqPc2EePKUbklI/0FZjUYDen+1mw5aNhAu/hpI2e8k2vh0TG8IY
 99/skphyC+XLZ0YaeZt7yfVhMMiu8+VkrUd8rEeRwtMloH6C7Zik2h6R1ZCQjnKLLxiU
 mkY98XkjXamZiLpQ8S5z4opJT1BtcSJfwXZEWR6Hu8FszhwlKH9ES1lIXKn8WEyhIKC5
 PF9+F13olVYZy3zFTe8KI1232uAfkovKKKxpGGszEsqJy1VCvWYiY59I9ECTQCgNwJIE
 fLmoapu/GeqmOBqJrv3oaDz6S16DPH7JqSIx9AxKvD+Z6Sg0C4Js2nIcv81lJIBeKqJ6
 mFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:content-language:cc:to:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc; bh=POi4hFc+gT1EkX4nPsQgNWfQX18l5gCV7T3rOCIonGM=;
 b=JOw8qBLDLLo7OJdhhYGcnK2E7ao0Bbwf5uwlGzAmxUIlUfk61zL+2M9jyqsNuOyNm+
 Iz1p5GraM9FoTiIs3Syej5mc6V8deAVl0Zd4DVTNyiPfVYhgzQqsaW6CkDk25FLpHDbp
 A0N6vUKPWLzm7b/cv5SL0iY3UdE3B33YR4XnkEcuRl1RiJHDdTRqKr74HMEmRs5jZq7P
 WhYjPsg9HPBVZv0pdd8MXfpBlXEE0GHr2i5J8W3kAk6ELL2NiUZtwm83apaL/piJZZT5
 a6WRxKyjJkoFXSbHGgW+5Uxxtz+s2gqLfaavsmzVZ+cqKf6YPxaYftUf/rebXapnVfeg
 YLtQ==
X-Gm-Message-State: ACgBeo2Kkz/sluErXRLhHckWdoqOcnGk3U1Ns/nY55HOFySMRu19gsix
 lnOaJP7Uk84Bv3R9iJpWNTY=
X-Google-Smtp-Source: AA6agR7/fqfPu8mLXwbFrXsWyggUliREN5FH5jjzxB3kXibRHkWwoPpvxXHT0f+TYoAHRZIdcBdOQw==
X-Received: by 2002:adf:f74b:0:b0:225:1fdb:a787 with SMTP id
 z11-20020adff74b000000b002251fdba787mr464018wrp.33.1661373297511; 
 Wed, 24 Aug 2022 13:34:57 -0700 (PDT)
Received: from ?IPV6:2a01:c22:7aa2:100:8857:e17a:56:c2b2?
 (dynamic-2a01-0c22-7aa2-0100-8857-e17a-0056-c2b2.c22.pool.telefonica.de.
 [2a01:c22:7aa2:100:8857:e17a:56:c2b2])
 by smtp.googlemail.com with ESMTPSA id
 k6-20020a5d6d46000000b00225221fd286sm17844759wri.114.2022.08.24.13.34.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 13:34:56 -0700 (PDT)
Message-ID: <e99857ce-bd90-5093-ca8c-8cd480b5a0a2@gmail.com>
Date: Wed, 24 Aug 2022 22:34:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Language: en-US
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Qi Duan <qi.duan@amlogic.com>, rayagond@vayavyalabs.com,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Da Xue <da@lessconfused.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [Linux-stm32] [PATCH v2 net] net: stmmac: work around sporadic tx
	issue on link-up
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

This is a follow-up to the discussion in [0]. It seems to me that
at least the IP version used on Amlogic SoC's sometimes has a problem
if register MAC_CTRL_REG is written whilst the chip is still processing
a previous write. But that's just a guess.
Adding a delay between two writes to this register helps, but we can
also simply omit the offending second write. This patch uses the second
approach and is based on a suggestion from Qi Duan.
Benefit of this approach is that we can save few register writes, also
on not affected chip versions.

[0] https://www.spinics.net/lists/netdev/msg831526.html

v2:
- change Fixes tag to the commmit that added stmmac_set_mac() 11yrs ago

Fixes: bfab27a146ed ("stmmac: add the experimental PCI support")
Suggested-by: Qi Duan <qi.duan@amlogic.com>
Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c   | 8 ++++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 +++++----
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
index caa4bfc4c..9b6138b11 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
@@ -258,14 +258,18 @@ EXPORT_SYMBOL_GPL(stmmac_set_mac_addr);
 /* Enable disable MAC RX/TX */
 void stmmac_set_mac(void __iomem *ioaddr, bool enable)
 {
-	u32 value = readl(ioaddr + MAC_CTRL_REG);
+	u32 old_val, value;
+
+	old_val = readl(ioaddr + MAC_CTRL_REG);
+	value = old_val;
 
 	if (enable)
 		value |= MAC_ENABLE_RX | MAC_ENABLE_TX;
 	else
 		value &= ~(MAC_ENABLE_TX | MAC_ENABLE_RX);
 
-	writel(value, ioaddr + MAC_CTRL_REG);
+	if (value != old_val)
+		writel(value, ioaddr + MAC_CTRL_REG);
 }
 
 void stmmac_get_mac_addr(void __iomem *ioaddr, unsigned char *addr,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 070b5ef16..592d29abc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -986,10 +986,10 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 			       bool tx_pause, bool rx_pause)
 {
 	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
-	u32 ctrl;
+	u32 old_ctrl, ctrl;
 
-	ctrl = readl(priv->ioaddr + MAC_CTRL_REG);
-	ctrl &= ~priv->hw->link.speed_mask;
+	old_ctrl = readl(priv->ioaddr + MAC_CTRL_REG);
+	ctrl = old_ctrl & ~priv->hw->link.speed_mask;
 
 	if (interface == PHY_INTERFACE_MODE_USXGMII) {
 		switch (speed) {
@@ -1064,7 +1064,8 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 	if (tx_pause && rx_pause)
 		stmmac_mac_flow_ctrl(priv, duplex);
 
-	writel(ctrl, priv->ioaddr + MAC_CTRL_REG);
+	if (ctrl != old_ctrl)
+		writel(ctrl, priv->ioaddr + MAC_CTRL_REG);
 
 	stmmac_mac_set(priv, priv->ioaddr, true);
 	if (phy && priv->dma_cap.eee) {
-- 
2.37.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
