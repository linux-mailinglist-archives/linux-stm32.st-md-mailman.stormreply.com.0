Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D6475C7FB
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jul 2023 15:39:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19666C6B442;
	Fri, 21 Jul 2023 13:39:22 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD49CC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jul 2023 13:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1689946761;
 x=1721482761;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=Iw+bltGRYz/2l9De5LyQdFIZrY7VU+/N+bnY6dDOT/s=;
 b=bvgpvFD7FfrecKps/wbMCOhJz9I9V7+54eN8alczSUPIAoMk9YA/SAYu
 RyJc4laDTp8V2TM+/ONRzqFPBqcJIANvh3krHnoW1gR/GfJp4mtk664j9
 d397Zk2hpBBlSGe9PHZU2ajjy7yhgs8gMELry9twxrV/8log0bVyeQ3LQ
 4lMQWodUQXXuMpkz7TJkvFoYIUJNuhX3oOZ7YlycWkFovizdLckTsyzBK
 3JtAE9AvqW9DW+mY6IO+ANBUZA83fh1qOWv6Rz4SMdbaAfmmVbOiV5MaA
 c5GxxRbACpglGHBVSWkPsJqCvncMppnzOfUGxIu2ORE3/oL+kymdcEc8C A==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
Date: Fri, 21 Jul 2023 15:39:20 +0200
MIME-Version: 1.0
Message-ID: <20230721-stmmac-tx-workaround-v1-1-9411cbd5ee07@axis.com>
X-B4-Tracking: v=1; b=H4sIAIeKumQC/x3MQQqDMBBA0avIrB0wUQz0KuIixrEOxUQmaRVC7
 m7o8i3+zxBJmCK8mgxCP44cfIVqG3C79W9CXqtBd7rvjFYY03FYh+nGK8jHSvj6FbdFGTMo1+u
 RoKan0Mb3fzuBpwRzKQ+mHijHawAAAA==
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
X-Mailer: b4 0.12.3
Cc: netdev@vger.kernel.org, Vincent Whitchurch <vincent.whitchurch@axis.com>,
 linux-kernel@vger.kernel.org, kernel@axis.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net] net: stmmac: Apply redundant write work
 around on 4.xx too
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

commit a3a57bf07de23fe1ff779e0fdf710aa581c3ff73 ("net: stmmac: work
around sporadic tx issue on link-up") worked around a problem with TX
sometimes not working after a link-up by avoiding a redundant write to
MAC_CTRL_REG (aka GMAC_CONFIG), since the IP appeared to have problems
with handling multiple writes to that register in some cases.

That commit however only added the work around to dwmac_lib.c (apart
from the common code in stmmac_main.c), but my systems with version
4.21a of the IP exhibit the same problem, so add the work around to
dwmac4_lib.c too.

Fixes: a3a57bf07de2 ("net: stmmac: work around sporadic tx issue on link-up")
Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
index df41eac54058..03ceb6a94073 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
@@ -240,13 +240,15 @@ void stmmac_dwmac4_set_mac_addr(void __iomem *ioaddr, const u8 addr[6],
 void stmmac_dwmac4_set_mac(void __iomem *ioaddr, bool enable)
 {
 	u32 value = readl(ioaddr + GMAC_CONFIG);
+	u32 old_val = value;
 
 	if (enable)
 		value |= GMAC_CONFIG_RE | GMAC_CONFIG_TE;
 	else
 		value &= ~(GMAC_CONFIG_TE | GMAC_CONFIG_RE);
 
-	writel(value, ioaddr + GMAC_CONFIG);
+	if (value != old_val)
+		writel(value, ioaddr + GMAC_CONFIG);
 }
 
 void stmmac_dwmac4_get_mac_addr(void __iomem *ioaddr, unsigned char *addr,

---
base-commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
change-id: 20230721-stmmac-tx-workaround-fb17741c326e

Best regards,
-- 
Vincent Whitchurch <vincent.whitchurch@axis.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
