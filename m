Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F466D207BC
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 18:16:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B507C8F274;
	Wed, 14 Jan 2026 17:16:12 +0000 (UTC)
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8443FC349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 08:18:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5221810DFEC; Wed, 14 Jan 2026 09:18:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
 s=dkim; t=1768378696; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Ajwkw9+NGX/WfC1IKpsfCbjnOybGHKbfekZPQpU9How=;
 b=RS5oaMfHKR7qffACVNzlScaYa5fCYSMQRLi8g9avCRUkSiD8P4vVzwIeg/1n3RVaoBkSRw
 yM53bftxByHwsxuGfEoT9WjDMYgUZqKUFjevFUGx/MpPkkVJ805UcJ8no/IHA7mmjYaRco
 //tEIasJFXW0QmVZrFmbmGL+zRQRiMODy4ZkcBIpoOjcVMfnaWI1CgiXpmHmwXEl2bHmXP
 XW3B09lTcnYg3CT62Tw71+Hz8b2R9x5uQVh/HJwpY6fzlJHNB/e+ZxK81xptzWUl3tAe5H
 gvpTwovD9QcMLxlD0y2fyjrfIXv7LmOGd0H3PZyYSS8wVaDey1smjxhdvW41kA==
From: Marek Vasut <marex@nabladev.com>
To: netdev@vger.kernel.org
Date: Wed, 14 Jan 2026 09:17:54 +0100
Message-ID: <20260114081809.12758-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Wed, 14 Jan 2026 17:16:09 +0000
Cc: Marek Vasut <marex@nabladev.com>, Simon Horman <horms@kernel.org>,
 Eric Dumazet <edumazet@google.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzk@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [net-next,
	PATCH] net: stmmac: stm32: Do not suspend downed interface
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

If an interface is down, the ETHnSTP clock are not running. Suspending
such an interface will attempt to stop already stopped ETHnSTP clock,
and produce a warning in the kernel log about this.

STM32MP25xx that is booted from NFS root via its first ethernet MAC
(also the consumer of ck_ker_eth1stp) and with its second ethernet
MAC downed produces the following warnings during suspend resume
cycle. This can be provoked even using pm_test:

"
$ echo devices > /sys/power/pm_test
$ echo mem > /sys/power/state
...
ck_ker_eth2stp already disabled
...
ck_ker_eth2stp already unprepared
...
"

Fix this by not manipulating with the clock during suspend resume
of interfaces which are downed.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: "David S. Miller" <davem@davemloft.net>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Christophe Roullier <christophe.roullier@st.com>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: netdev@vger.kernel.org
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index e1b260ed4790b..5b0d111afcac3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -618,11 +618,21 @@ static void stm32_dwmac_remove(struct platform_device *pdev)
 
 static int stm32mp1_suspend(struct stm32_dwmac *dwmac)
 {
+	struct net_device *ndev = dev_get_drvdata(dwmac->dev);
+
+	if (!ndev || !netif_running(ndev))
+		return 0;
+
 	return clk_prepare_enable(dwmac->clk_ethstp);
 }
 
 static void stm32mp1_resume(struct stm32_dwmac *dwmac)
 {
+	struct net_device *ndev = dev_get_drvdata(dwmac->dev);
+
+	if (!ndev || !netif_running(ndev))
+		return;
+
 	clk_disable_unprepare(dwmac->clk_ethstp);
 }
 
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
