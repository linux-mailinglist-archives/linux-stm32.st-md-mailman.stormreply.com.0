Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6199AFD2F9
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Jul 2025 18:52:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30189C3089F;
	Tue,  8 Jul 2025 16:52:15 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DAC3C35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Jul 2025 16:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id; bh=qWsk8ZwHDgxqYRw
 HFFMeZK+uhE/KHO9DpLNrBBEM2ik=; b=Yl9rFPHB+UQOpXdume2OML+tQvwGWaA
 WxqYuy2HVfemmvq97tBl0ud9qt7mfqnwyWoxUALB2pP8142yvWtnwG/gHwRWhQaa
 WdX84sR4eO8l5KUOyXc2hmYwCiOpgKeXNXC2zdKuGgH+JHG/eJKkIPPf3+VAvS5i
 rmok7Iri9uMM=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wC3YqRnTG1oypwxDg--.1262S2; 
 Wed, 09 Jul 2025 00:51:01 +0800 (CST)
From: Lizhe <sensor1010@163.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 vladimir.oltean@nxp.com, maxime.chevallier@bootlin.com, sensor1010@163.com
Date: Tue,  8 Jul 2025 09:50:44 -0700
Message-Id: <20250708165044.3923-1-sensor1010@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wC3YqRnTG1oypwxDg--.1262S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF15Aw17Zr48JF1kKr1kuFg_yoW8Ar48p3
 yrua4UZr97Jr13tw4kXw48Zr95Ka93tr40k3Wfu3yS9rWDWFZIqr1a9rW3XFy3KrZ5uFya
 vw1UCF13Zan0yaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piL0ePUUUUU=
X-Originating-IP: [112.23.164.54]
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/1tbiKBKEq2htS5kM0AAAse
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] net: stmmac: Support gpio high-level reset
	for devices requiring it
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

some devices only reset when the GPIO is at a high level, but the
current function lacks support for such devices. add high-level
reset functionality to the function to support devices that require
high-level triggering for reset

Signed-off-by: Lizhe <sensor1010@163.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 836f2848dfeb..cb989e6d7eac 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -458,6 +458,7 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 
 #ifdef CONFIG_OF
 	if (priv->device->of_node) {
+		int active_low = 0;
 		struct gpio_desc *reset_gpio;
 		u32 delays[3] = { 0, 0, 0 };
 
@@ -467,6 +468,9 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 		if (IS_ERR(reset_gpio))
 			return PTR_ERR(reset_gpio);
 
+		if (reset_gpio)
+			active_low = gpiod_is_active_low(reset_gpio);
+
 		device_property_read_u32_array(priv->device,
 					       "snps,reset-delays-us",
 					       delays, ARRAY_SIZE(delays));
@@ -474,11 +478,11 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 		if (delays[0])
 			msleep(DIV_ROUND_UP(delays[0], 1000));
 
-		gpiod_set_value_cansleep(reset_gpio, 1);
+		gpiod_set_value_cansleep(reset_gpio, active_low ? 1 : 0);
 		if (delays[1])
 			msleep(DIV_ROUND_UP(delays[1], 1000));
 
-		gpiod_set_value_cansleep(reset_gpio, 0);
+		gpiod_set_value_cansleep(reset_gpio, active_low ? 0 : 1);
 		if (delays[2])
 			msleep(DIV_ROUND_UP(delays[2], 1000));
 	}
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
