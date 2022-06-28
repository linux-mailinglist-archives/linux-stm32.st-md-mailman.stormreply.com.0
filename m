Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 199D955BCFB
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jun 2022 03:34:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBF04C5EC6C;
	Tue, 28 Jun 2022 01:34:08 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19291C04004
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jun 2022 01:34:08 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id n8so1501489eda.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jun 2022 18:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iXMh8QpPv/1aXKHGIBmnrm9Vg4DXhE4ZP8Hc+hLQFGQ=;
 b=iSLPEcMimUmFNWA7S9EVs9feLPDJLUCwZ1xnX5Dcv0912ADR3eLqtn2mTAJQRCUhph
 +46PzVI+CD25zqDIk+OFmZ+PKs91pgaN0eh6W5ATIJARMUnCBhfXq7+l+SftyJG0hyj5
 iTVsnb7boNeWXirGktLqd/702oIVnobEs+rei18XCwz8nzWh8py8kKGavZOVIsUhiehV
 eKT3X/p0F6XWJypvR1kqw5DOMdk13/EBnLmwE68eB86+7yW5obwVeRFj0JIFvAf5ElJR
 z5+AKA4watCMXSjQRHNfj9w41uQhaFqdfvRq4+YMjsPtwcus3EmHM2W/KLVYyHf0zzuP
 zBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iXMh8QpPv/1aXKHGIBmnrm9Vg4DXhE4ZP8Hc+hLQFGQ=;
 b=t9h0uTitq+FSi4HdOuDR7uosKIK/vvszwpE479+osgzoja/kHgAa9dmA86oUFmHXxK
 wjnbSiqqzOomYRlBuYLZRLWBc7Tek05kbMdEBaGkvq/SYBWXQnDDCR5mhcrV1MbyKIEK
 aEt4dqAWDzfQ06KVbdmFLmDjV+C4jD9SBUUTf8sT0UYbVvUZC7vSZdQmkDHLyAQqC0tw
 Avboj/AhiE0bcEGd8ClyipsM46Af7CQzYdvKsbDBnkpwAiHSCxU4qGcEvEWmTnwQUc1W
 tdp4Z9cXt48G11lu8us/GMFS7cWZDJYJKl8fhTKfyQyv/WhRnPaxQw0VZcXdXdiJT/l1
 rOFQ==
X-Gm-Message-State: AJIora8oLTelZzemqawG0aXPKEcH+5Y9fCWX65fHgb1twIOnSp3ctyOp
 GddQ6UegADkSoF6J4rRVTk8=
X-Google-Smtp-Source: AGRyM1vrS+YccdrvNawuCtViR0sTpIxGP/KIv7SC+cYNjQupzDKy6zZAQKeNq1r36/eUZZ2HEe+pqw==
X-Received: by 2002:a05:6402:2047:b0:435:67e0:44fe with SMTP id
 bc7-20020a056402204700b0043567e044femr19876442edb.360.1656380047685; 
 Mon, 27 Jun 2022 18:34:07 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 x13-20020a170906b08d00b00724261b592esm5693492ejy.186.2022.06.27.18.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 18:34:07 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 28 Jun 2022 03:33:39 +0200
Message-Id: <20220628013342.13581-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628013342.13581-1-ansuelsmth@gmail.com>
References: <20220628013342.13581-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH RFC 2/5] net: ethernet: stmicro:
	stmmac: first disable all queues in release
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

Disable all queues before tx_disable in stmmac_release to prevent a
corner case where packet may be still queued at the same time tx_disable
is called resulting in kernel panic if some packet still has to be
processed.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f861246de2e5..f4ba27c1c7e0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3756,6 +3756,11 @@ static int stmmac_release(struct net_device *dev)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u32 chan;
 
+	stmmac_disable_all_queues(priv);
+
+	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
+		hrtimer_cancel(&priv->tx_queue[chan].txtimer);
+
 	netif_tx_disable(dev);
 
 	if (device_may_wakeup(priv->device))
@@ -3764,11 +3769,6 @@ static int stmmac_release(struct net_device *dev)
 	phylink_stop(priv->phylink);
 	phylink_disconnect_phy(priv->phylink);
 
-	stmmac_disable_all_queues(priv);
-
-	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
-		hrtimer_cancel(&priv->tx_queue[chan].txtimer);
-
 	/* Free the IRQ lines */
 	stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
 
-- 
2.36.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
