Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2493EB6CFD
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Sep 2019 21:55:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE549C35E01;
	Wed, 18 Sep 2019 19:55:10 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AB46C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 19:55:09 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1N7iT4-1i5hwp41fW-014hEP; Wed, 18 Sep 2019 21:54:58 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Wed, 18 Sep 2019 21:54:34 +0200
Message-Id: <20190918195454.2056139-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:N+l+qvP4iTKMClOZ10+3hqtOBzBcBQK6eoFXevu/u6P8UCjKnvn
 c+9RDnKQFkt60Yhr/1wdrGXs/h/qCzzQXDCSJhjlsU6+bEk+wiqjs8z/5yU3GcgyEGtC2mO
 3SD5GPJx4Fpy/j1i29G7oBOMQ2+OoTir7lMG6/ltVEOii1JDkWm0JQtO4aQGYz1M2Yb6zNv
 WFkT8hq38bCA3FJMEVH3A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1HosKkSRfoU=:b7Y0A535j0pAWaby1IDo4m
 kOy6Bd+X63LxUX6r1gVlDqzAoHO1wmOf7fMp67ntknUvwuoKWDI08ticRc1et/NxH2Pz3Ztc1
 azFGSYUV9W2A0RmNsI8CrjOIFuCQjsYs5oxyMB3GiEA6r+KyrxozwvqF+aHKVIGXX28XpPOEL
 TWF1EiXNAYCuJbPSOqPT7ccBt8fmRIHoMYurJLI/gf1nooBvgdwHWRNZZaOcAsgG1e2gFBK9a
 EfXBj0faIys9EuiWJJkgXT1INDk4x0hQfhnZJnLkmCcKePpkNyXlN7044PeIv8PTX/9NNlsNa
 4cTMTe/nUdhNLrlxc8c8GQsSvmMOtwff2oU5ZrKdWndUcRZ5GykriAHfu9BehqQZTYg6B1OQt
 b9MHoOJQlZ/s7DnSsf92cdC2+CYPCzDtUMBLxWNrU/qC0JF12ujfFYwLvl5kO7PxkytkPWY6f
 M3ljbyQUADlh0k1885oDO/KTU6iq4qyxcUnKqf4QEX9ZvjYDhTwdcDZf7SP7Ia2JYJ0XWZosp
 x4TCOrGE0GEThjwnhpICjDW0g4tjH/sxSTe7Vo0R0gqT+UhSR9sWJjQJoFFwqY4SEqe8Jw6HR
 LTZknHBNdHlgSPQSUUzmswGM+6zPm1aVVKLjnblgSzyhikNVkbnaLoHHS32Uo2QbYYCeTDeEt
 QEhv2bWATOmmB0Y3EMN11m9Ttmx+pnRMfXgfRJxTGcOZKjSoB6VpR2VOZqfTFXyQaedt026l3
 ZAqFvnENGhDBaE7vmydfRrLyrFWoeJXfXasA2E//AqyRdXcSZx+VnW6pHNIy/+JELjpYo/hmz
 fqwMdRRp7V2LR3gthNtA8F66fblYzFc5smxmXTTNykbmXE0H+DPsiyKpcAxKb0Ml99kYiQSyQ
 iPKy6AN1lEFHH2mS8u2A==
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] stmmac: selftest: avoid large stack usage
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

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c   | 15 +++++++++++----
 .../ethernet/stmicro/stmmac/stmmac_selftests.c    | 14 ++++----------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index d5173dd02a71..c2f648062049 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -523,25 +523,32 @@ static int dwxgmac2_rss_configure(struct mac_device_info *hw,
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
+		if (cfg)
+			ret = dwxgmac2_rss_write_reg(ioaddr, true, i, cfg->key[i]);
+		else
+			ret = dwxgmac2_rss_write_reg(ioaddr, true, i, 0);
+
 		if (ret)
 			return ret;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(cfg->table); i++) {
-		ret = dwxgmac2_rss_write_reg(ioaddr, false, i, cfg->table[i]);
+		if (cfg)
+			ret = dwxgmac2_rss_write_reg(ioaddr, false, i, cfg->table[i]);
+		else
+			ret = dwxgmac2_rss_write_reg(ioaddr, false, i, 0);
+
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
