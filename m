Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F19366D1E
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Apr 2021 15:47:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C234C58D5C;
	Wed, 21 Apr 2021 13:47:58 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32D02CFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Apr 2021 13:47:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4766D60C3E;
 Wed, 21 Apr 2021 13:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619012874;
 bh=KTVLWVJq8vwl6vTzOgA9P5+hpcqgLU/xnyvuwWytlYE=;
 h=From:To:Cc:Subject:Date:From;
 b=nhD24SoAze3qpdTO9xcGGlp+5fd7qGoArYtTzCjyKkgaklPGTEYVGcbeK7XKfXLe2
 kn6F8MrroDr8Swusb2ybIXRpbRt/NHdRPbGan00G6hZMRWIQNPSFAriEJPKBqcH2Qw
 B0oCHNxakFJDXWRTyDUyWxAIsBNCdJDfgxZn8OI9jdfViZut1nlrVp8mEMsMfJVBJ1
 0/EA5WUqa+uY/w81+QR+1UU7NoPdCuO8usoXdsfuM3p06iarE+2yea+DSspBrd4yVe
 bcOFUMbnA08QNPYapoPBNBoZfgthhIhR4BXWQlEcbFnyZiSPqYr5fPWaaqcIV+59db
 /yIHpNdhKPECg==
From: Arnd Bergmann <arnd@kernel.org>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Date: Wed, 21 Apr 2021 15:47:29 +0200
Message-Id: <20210421134743.3260921-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Cc: "Song, Yoong Siang" <yoong.siang.song@intel.com>,
 Fugang Duan <fugang.duan@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 Voon Weifeng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 Joakim Zhang <qiangqing.zhang@nxp.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Thierry Reding <treding@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] [net-next] net: stmmac: fix gcc-10 -Wrestrict
	warning
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

From: Arnd Bergmann <arnd@arndb.de>

gcc-10 and later warn about a theoretical array overrun when
accessing priv->int_name_rx_irq[i] with an out of bounds value
of 'i':

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c: In function 'stmmac_request_irq_multi_msi':
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3528:17: error: 'snprintf' argument 4 may overlap destination object 'dev' [-Werror=restrict]
 3528 |                 snprintf(int_name, int_name_len, "%s:%s-%d", dev->name, "tx", i);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3404:60: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
 3404 | static int stmmac_request_irq_multi_msi(struct net_device *dev)
      |                                         ~~~~~~~~~~~~~~~~~~~^~~

The warning is a bit strange since it's not actually about the array
bounds but rather about possible string operations with overlapping
arguments, but it's not technically wrong.

Avoid the warning by adding an extra bounds check.

Fixes: 8532f613bc78 ("net: stmmac: introduce MSI Interrupt routines for mac, safety, RX & TX")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d1ca07c846e6..aadac783687b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3498,6 +3498,8 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 
 	/* Request Rx MSI irq */
 	for (i = 0; i < priv->plat->rx_queues_to_use; i++) {
+		if (i > MTL_MAX_RX_QUEUES)
+			break;
 		if (priv->rx_irq[i] == 0)
 			continue;
 
@@ -3521,6 +3523,8 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 
 	/* Request Tx MSI irq */
 	for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
+		if (i > MTL_MAX_TX_QUEUES)
+			break;
 		if (priv->tx_irq[i] == 0)
 			continue;
 
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
