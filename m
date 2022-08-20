Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B83B059AED2
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Aug 2022 17:20:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B4CFC640FD;
	Sat, 20 Aug 2022 15:20:46 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDE2AC035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Aug 2022 15:20:44 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id qn6so13707540ejc.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Aug 2022 08:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc;
 bh=KuyThZ4UkZCoD1rqfy0175wV5oUpnVkfQljkGFt0qM4=;
 b=M/4oSsOKD1hzTM5+HlnLRoPjSK5Qy+hxCY5pZyE1SXm+pEgS2ashZFuf/ZKhEq/LF/
 Il7sT9qUvflqN6QNmgKTu0ZmwCXt7clBEt+SX+VaeGLjge56gj7cbmbgarylpDyMHQDK
 flZ4Q0IhC68SbFO1D1Rpwb4e6n2++LR/sR1akX/RyNYTVfQWYO80gVSu5isCVCRArS8v
 jzOcVbH4xItQmQLvwg1WNLcDobsa6Hswfvds/PoFfGuL9ZAZKj58kg6egKLIEe89858z
 Ox+Yu7CiSZn8oH5Za2I/eIwY9Tvu8DmVKwYcBVhv+t9Tubcj1BowGmp2H/45YAnZ9qG4
 vdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc; bh=KuyThZ4UkZCoD1rqfy0175wV5oUpnVkfQljkGFt0qM4=;
 b=Zibv9Bk9+pwLGo3YrVfZAf36xOJju5kjj0Hr1SIqksWPKHNr1y9rKYOM7WKzjMAY+6
 dY6/F7wI/Eism+BTpaLylSd/h+B1+OTwY2JqXeqD9ixLPHqZS7eFL5mWHpDujfPWq3nf
 LwMXKeU4+Qo76b+WWinIJRciGgcw9hKAqZ7ipq0w5vyNLrnMWq68WtXjkxBV9cN/oR1n
 rxwMABTSHDFUJjJ0fyluLcjCrHIyB+5Q5vS5FSlj1YLNNri5pEoEAiNvzrqCP+XeSZvV
 iZ316VJJKuynz45BXGHCjHIbSrbjLXih+g2iML45QzSwkZQYmLe83+GF4585XITyroFS
 p2DA==
X-Gm-Message-State: ACgBeo3WluK7upG2nBQNVXHsiNX6azxJVG596X302l2pBzBHt9tihNnD
 vee4/UFlBFURjawj0yWidjc=
X-Google-Smtp-Source: AA6agR5IIE32z+hn3t8/jwzLboDkj1bBwiJDNQ4LJJoHL7vMUuppEjEnhle415CudsQZ9zcs3hbGCQ==
X-Received: by 2002:a17:907:6d8a:b0:73b:d9e4:e628 with SMTP id
 sb10-20020a1709076d8a00b0073bd9e4e628mr7518175ejc.75.1661008844324; 
 Sat, 20 Aug 2022 08:20:44 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c0bb:f700:3cb6:47a0:41b9:1531?
 (dynamic-2a01-0c23-c0bb-f700-3cb6-47a0-41b9-1531.c23.pool.telefonica.de.
 [2a01:c23:c0bb:f700:3cb6:47a0:41b9:1531])
 by smtp.googlemail.com with ESMTPSA id
 s18-20020a1709062ed200b00722e50dab2csm3684220eji.109.2022.08.20.08.20.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Aug 2022 08:20:43 -0700 (PDT)
Message-ID: <72755b6b-f071-1c54-c2fd-5ea0376effe1@gmail.com>
Date: Sat, 20 Aug 2022 17:20:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Qi Duan <qi.duan@amlogic.com>, Da Xue <da@lessconfused.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [Linux-stm32] [PATCH net] net: stmmac: work around sporadic tx
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

This patch doesn't apply cleanly before the commit marked as fixed.
There's nothing wrong with this commit.

[0] https://www.spinics.net/lists/netdev/msg831526.html

Fixes: 11059740e616 ("net: pcs: xpcs: convert to phylink_pcs_ops")
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
