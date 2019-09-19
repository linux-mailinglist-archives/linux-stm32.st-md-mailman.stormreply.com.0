Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 493D1B7989
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Sep 2019 14:34:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 002FDC35E01;
	Thu, 19 Sep 2019 12:34:32 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E748BC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Sep 2019 12:34:30 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1McGp2-1hfAig3hzo-00cgzT; Thu, 19 Sep 2019 14:34:22 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu, 19 Sep 2019 14:33:43 +0200
Message-Id: <20190919123416.3070938-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:hwVGHTiOG4UXHOWG1ZQ0Jq2hjerVfrIdTmZglraj5oGfDcMkjJd
 lZQ3pTkKTCk025VehtgWkB4c8x3VxX4C3lZBTJB3DvjHbaazbTBT72d909SmFSvMpH+S3Uz
 JIwg3QkDBE5yMxexLwXZ4olOrjyvwAtwS8In6/V8uUaJQPy++4Zgn2HU8ypmltpow2eOyDc
 w0Yh6icl7CivOhhfRlQMA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:c9UPIDxfZwk=:sdxFKpNOGzRYdbJ3z8DWo1
 bqGnGL9NihWCprhmk50Aj2QHDIPlmok/y9GFE9lTnsCna6EsVYNB6MMbe8PoSgO/ZDe8cB/rN
 0nzIgWJlyARVmonQv2a8H6udfl3gzHuONecPTQHwS8BiP9Ha+kdknckDp6o77oWO0dMQ+w8ud
 lwGuTRqIqZFKIOKs8Ok9QOzyKjgMOzwyf1unkuiNpLnmck02uoWD/smwtXnPt0GA4VSCoTIqc
 d0nxmgFjhVMlBuc3OA/+aqrUxjr/kCeXBO/a6gzMdu0d6BB5eHX6aFRLoEpgZxHDBACXiLxHv
 XMUQCd56WP/r3eSG59YCgnXYwBqATNckLhDD4UTssu4tC1KDMzfKzHXZJG7vtgvJtl960wAXk
 GnrwQLsFt9DLj/B9I5J/niKefml5uvJFgqbqqWIVN2ZC1VaaroYty7IH3FmZCRX9k2jrmanXu
 lTqCQHO3oxR50ZwqzzpdWsAYKvF1rWhtgD0wX7vnWNMV755VGJ1/o5TCs5XfZB0TcHtJTiC9u
 nXOsOCZorUiCj7Hoent0M6C2PyXGmaRSp1R+tuhr+qMJX2OiOvXFd0TpPROpVaqmpJmwhs80o
 L18eQ1SsiiLHaDo0JF147ksAoMVox/m6Nsmqv37ImV3Zwb/DMWKR4me095686hw07g41u1g/g
 C/w6+Oj9f4FHFqVo6mS8wBlQmZzz1KDYzBL51wSDDWgC+pKFxDY+hnpBmrr0P4iZKw29zQS9c
 zd+oPGOyAjCuVSc+LKQez9MLR0ENSBm/Pw2giP403UP24zgk/dKjySnNFfdTGLo1N0BC/SW+X
 SHEYUb0Z3o8ClxL2/kVgCjuR/FpIfWYYyDK2GE8FY+YzDtFKEJ0aoepc1P9WdUxgpckXfhMub
 y/Jc3/qeFX+KcCNMNKSQ==
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] [v2] net: stmmac: selftest: avoid large stack
	usage
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

Putting a struct stmmac_rss object on the stack is a bad idea,
as it exceeds the warning limit for a stack frame on 32-bit architectures:

drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1221:12: error: stack frame size of 1208 bytes in function '__stmmac_test_l3filt' [-Werror,-Wframe-larger-than=]
drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1338:12: error: stack frame size of 1208 bytes in function '__stmmac_test_l4filt' [-Werror,-Wframe-larger-than=]

As the object is the trivial empty case, change the called function
to accept a NULL pointer to mean the same thing and remove the
large variable in the two callers.

Fixes: 4647e021193d ("net: stmmac: selftests: Add selftest for L3/L4 Filters")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: simply configure function, based on feedback from Jose
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  5 ++---
 .../net/ethernet/stmicro/stmmac/stmmac_selftests.c | 14 ++++----------
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index d5173dd02a71..2b277b2c586b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -523,19 +523,18 @@ static int dwxgmac2_rss_configure(struct mac_device_info *hw,
 				  struct stmmac_rss *cfg, u32 num_rxq)
 {
 	void __iomem *ioaddr = hw->pcsr;
-	u32 *key = (u32 *)cfg->key;
 	int i, ret;
 	u32 value;
 
 	value = readl(ioaddr + XGMAC_RSS_CTRL);
-	if (!cfg->enable) {
+	if (!cfg || !cfg->enable) {
 		value &= ~XGMAC_RSSE;
 		writel(value, ioaddr + XGMAC_RSS_CTRL);
 		return 0;
 	}
 
 	for (i = 0; i < (sizeof(cfg->key) / sizeof(u32)); i++) {
-		ret = dwxgmac2_rss_write_reg(ioaddr, true, i, *key++);
+		ret = dwxgmac2_rss_write_reg(ioaddr, true, i, cfg->key[i]);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index c56e89e1ae56..9c8d210b2d6a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -1233,12 +1233,9 @@ static int __stmmac_test_l3filt(struct stmmac_priv *priv, u32 dst, u32 src,
 		return -EOPNOTSUPP;
 	if (!priv->dma_cap.l3l4fnum)
 		return -EOPNOTSUPP;
-	if (priv->rss.enable) {
-		struct stmmac_rss rss = { .enable = false, };
-
-		stmmac_rss_configure(priv, priv->hw, &rss,
+	if (priv->rss.enable)
+		stmmac_rss_configure(priv, priv->hw, NULL,
 				     priv->plat->rx_queues_to_use);
-	}
 
 	dissector = kzalloc(sizeof(*dissector), GFP_KERNEL);
 	if (!dissector) {
@@ -1357,12 +1354,9 @@ static int __stmmac_test_l4filt(struct stmmac_priv *priv, u32 dst, u32 src,
 		return -EOPNOTSUPP;
 	if (!priv->dma_cap.l3l4fnum)
 		return -EOPNOTSUPP;
-	if (priv->rss.enable) {
-		struct stmmac_rss rss = { .enable = false, };
-
-		stmmac_rss_configure(priv, priv->hw, &rss,
+	if (priv->rss.enable)
+		stmmac_rss_configure(priv, priv->hw, NULL,
 				     priv->plat->rx_queues_to_use);
-	}
 
 	dissector = kzalloc(sizeof(*dissector), GFP_KERNEL);
 	if (!dissector) {
-- 
2.20.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
