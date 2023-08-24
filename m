Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E9878705C
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Aug 2023 15:38:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72A9EC6B44E;
	Thu, 24 Aug 2023 13:38:02 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6086C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 13:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+pDUnGS3fPXl62HbQXfqAtSfEmek0JbeaXPVZog/Gb8=; b=sMj3xB601rd6BEWs+KrB6LyeWd
 M++A88qprjsX9zbICIJ1BvFigr4KzcruflgZd2eN8DZcHueTrbTHAHE4icnpcZ00S6OhAR5B7KfRs
 LXJg7qcs/8By4D1sw4S6Yq7jl0yWVeoPXzcFSDegtr4UJ9baywEXhHxrhvEq2xiBRpaai1c7HpP4r
 sjdwycNBpUcfgkXgJHZ5hXnLMceh6pMUQX3Ej8zn4X16NkzlKiq3NDhHEMXQ2Vc5hE+S4NFNAQpRB
 MruKtwEUuLcQHhabrQDZRFMEKCJHm9uvJcvlAaf0xE76FveQxaH8FElvRAxfCfA7+wob9/Ene1wdZ
 G+SNxs9A==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54008 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1qZAX3-0004Bz-0q;
 Thu, 24 Aug 2023 14:37:53 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1qZAX3-005pTi-K1; Thu, 24 Aug 2023 14:37:53 +0100
In-Reply-To: <ZOddFH22PWmOmbT5@shell.armlinux.org.uk>
References: <ZOddFH22PWmOmbT5@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qZAX3-005pTi-K1@rmk-PC.armlinux.org.uk>
Date: Thu, 24 Aug 2023 14:37:53 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Feiyang Chen <chenfeiyang@loongson.cn>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH net-next 01/10] net: phylink: add
	phylink_limit_mac_speed()
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

Add a function which can be used to limit the phylink MAC capabilities
to an upper speed limit.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 18 ++++++++++++++++++
 include/linux/phylink.h   |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 160bce608c34..0d7354955d62 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -426,6 +426,24 @@ static struct {
 	{ MAC_10HD,     SPEED_10,     DUPLEX_HALF },
 };
 
+/**
+ * phylink_limit_mac_speed - limit the phylink_config to a maximum speed
+ * @config: pointer to a &struct phylink_config
+ * @max_speed: maximum speed
+ *
+ * Mask off MAC capabilities for speeds higher than the @max_speed parameter.
+ * Any further motifications of config.mac_capabilities will override this.
+ */
+void phylink_limit_mac_speed(struct phylink_config *config, u32 max_speed)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(phylink_caps_params) &&
+		    phylink_caps_params[i].speed > max_speed; i++)
+		config->mac_capabilities &= ~phylink_caps_params[i].mask;
+}
+EXPORT_SYMBOL_GPL(phylink_limit_mac_speed);
+
 /**
  * phylink_cap_from_speed_duplex - Get mac capability from speed/duplex
  * @speed: the speed to search for
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 789c516c6b4a..7d07f8736431 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -223,6 +223,8 @@ struct phylink_config {
 	unsigned long mac_capabilities;
 };
 
+void phylink_limit_mac_speed(struct phylink_config *config, u32 max_speed);
+
 /**
  * struct phylink_mac_ops - MAC operations structure.
  * @validate: Validate and update the link configuration.
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
