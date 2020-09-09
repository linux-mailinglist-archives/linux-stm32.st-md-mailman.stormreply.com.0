Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F525262E72
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Sep 2020 14:23:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8A52C424BB;
	Wed,  9 Sep 2020 12:23:16 +0000 (UTC)
Received: from m17618.mail.qiye.163.com (m17618.mail.qiye.163.com
 [59.111.176.18])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCB43C424B9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 12:20:01 +0000 (UTC)
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.228])
 by m17618.mail.qiye.163.com (Hmail) with ESMTPA id DFF464E0EF5;
 Wed,  9 Sep 2020 20:19:29 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed,  9 Sep 2020 20:19:21 +0800
Message-Id: <1599653964-29741-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZTx9NGUgdSR8aGB0eVkpOQkJNTkhCTEtPS0xVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OVE6Ogw6Sz8vGh08F0M3DEoy
 KwsKCTRVSlVKTkJCTU5IQkxLQ0lCVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlJQ1lXWQgBWUFJSkJJNwY+
X-HM-Tid: 0a7472ce816f9376kuwsdff464e0ef5
X-Mailman-Approved-At: Wed, 09 Sep 2020 12:23:15 +0000
Cc: Wang Qing <wangqing@vivo.com>
Subject: [Linux-stm32] [PATCH] drivers/net/ethernet: fix a typo for
	stmmac_pltfr_suspend
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

Change the comment typo: "direcly" -> "directly".

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index f32317f..b666bb9
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -711,7 +711,7 @@ EXPORT_SYMBOL_GPL(stmmac_pltfr_remove);
 /**
  * stmmac_pltfr_suspend
  * @dev: device pointer
- * Description: this function is invoked when suspend the driver and it direcly
+ * Description: this function is invoked when suspend the driver and it directly
  * call the main suspend function and then, if required, on some platform, it
  * can call an exit helper.
  */
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
