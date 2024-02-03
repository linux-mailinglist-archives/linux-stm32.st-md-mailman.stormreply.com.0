Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC8F849633
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Feb 2024 10:17:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C004AC6C859;
	Mon,  5 Feb 2024 09:17:54 +0000 (UTC)
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A30EDC6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  3 Feb 2024 15:04:05 +0000 (UTC)
Received: from localhost.localdomain (unknown [85.89.126.105])
 by mail.ispras.ru (Postfix) with ESMTPSA id 1D2E440F1DC6;
 Sat,  3 Feb 2024 15:04:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 1D2E440F1DC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1706972644;
 bh=LWaLolZLVHoMja/NNNmsmRp6PTzwtZ8CVFd3EvB8tPA=;
 h=From:To:Cc:Subject:Date:From;
 b=C3eu6XJyaDUjR+G0C86mQ6ZfmK67QE9aFBH75t4eJo3MG0wzROpenuGRldhsUG4ya
 bJDGjp7dsn6YzyhElq58earXsrx1xa1OQfmp3tZa4EUTtBonJaKLW5gkzcCyWyzWIl
 +ryFZYP87zIgqKq665ykwGQdkm19rjtYVL7cCh9w=
From: Pavel Sakharov <p.sakharov@ispras.ru>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Sat,  3 Feb 2024 18:03:21 +0300
Message-ID: <20240203150323.1041736-1-p.sakharov@ispras.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 05 Feb 2024 09:17:53 +0000
Cc: Pavel Sakharov <p.sakharov@ispras.ru>, lvc-project@linuxtesting.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] stmmac: Fix incorrect dereference in
	stmmac_*_interrupt()
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

If 'dev' is NULL, the 'priv' variable has an incorrect address when
dereferencing calling netdev_err().

Pass 'dev' instead of 'priv->dev" to the function.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Pavel Sakharov <p.sakharov@ispras.ru>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4727f7be4f86..5ab5148013cd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5848,7 +5848,7 @@ static irqreturn_t stmmac_mac_interrupt(int irq, void *dev_id)
 	struct stmmac_priv *priv = netdev_priv(dev);

 	if (unlikely(!dev)) {
-		netdev_err(priv->dev, "%s: invalid dev pointer\n", __func__);
+		netdev_err(dev, "%s: invalid dev pointer\n", __func__);
 		return IRQ_NONE;
 	}

@@ -5868,7 +5868,7 @@ static irqreturn_t stmmac_safety_interrupt(int irq, void *dev_id)
 	struct stmmac_priv *priv = netdev_priv(dev);

 	if (unlikely(!dev)) {
-		netdev_err(priv->dev, "%s: invalid dev pointer\n", __func__);
+		netdev_err(dev, "%s: invalid dev pointer\n", __func__);
 		return IRQ_NONE;
 	}

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
