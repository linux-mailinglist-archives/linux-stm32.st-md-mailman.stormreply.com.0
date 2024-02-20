Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B8585B4EC
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Feb 2024 09:22:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DC0FC6A61D;
	Tue, 20 Feb 2024 08:22:50 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0286DC69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 08:22:48 +0000 (UTC)
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1708417368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o7FhDKCpVRzBZVqcVUK+TCqEXZxgC5mnVj+4kjWa4Gw=;
 b=qrAlfbQI84Pv+3qnK1/qX/0zfxmbMmNvjoPYwyuYCI0nlRjPvy9bC8/XFD8ITbXVCKXM4a
 S7ZMLJBXLNMdaQ1+GLe6WjSxDCOOJplgjhBmzVIv41DTFwHPOWgPFCQgA7GNCAOb7EMUGD
 zdF9i/9n3GTNb/qsnYEFn+QAcgzYkWyhIvpDzuoI8SM1IJkxgGv8zXYjOl66kha+mtU9Yn
 NMyYIAI9bbUM5zhCMjPVY/mFZcrVKgWWOuB4zptuFqcU1SQAG//hOJOIUiu7lV8yWcOpzK
 sL00Rhk76aChGibk9f4Luk+ijz8kCM/G7urHY6y2/StezjZQmzZJi1GHgNJxfQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1708417368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o7FhDKCpVRzBZVqcVUK+TCqEXZxgC5mnVj+4kjWa4Gw=;
 b=Ow0xOJexYEoL0IjzIbFbM2bawK4aWJLbJG2ZEnJk9ugeBswYY2wK8om2pucK0X49uccSwk
 caIeir4NJkhMfADQ==
Date: Tue, 20 Feb 2024 09:22:46 +0100
MIME-Version: 1.0
Message-Id: <20240220-stmmac_est-v1-1-c41f9ae2e7b7@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAFVh1GUC/x2NwQrCMBAFf6Xs2UCMRaq/IiKb9NXuIVF2QxFK/
 920x2EYZiWDCozu3UqKRUw+pcH51FGaubzhZGxMwYfeh+Cd1Zw5vWDVga/D0E+3yJdELYhscFG
 5pHlPMluF7uKrmOR3XB5UUOm5bX96smAZegAAAA==
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rohan G Thomas <rohan.g.thomas@intel.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1436; i=kurt@linutronix.de;
 h=from:subject:message-id; bh=VtSbRYpW3xF4C41G3ex623iXQjdzDj88U4DQFDFPBXA=;
 b=owEBbQKS/ZANAwAKAcGT0fKqRnOCAcsmYgBl1GFX6qPgFG7he/qqzxgpfnWgTU2YcF03X2yM/
 NoH2jMuOjCJAjMEAAEKAB0WIQS8ub+yyMN909/bWZLBk9HyqkZzggUCZdRhVwAKCRDBk9HyqkZz
 gur9EACitYR7rS+jg6FDa7PC9TDwFeID84CDFl3pTZmtMXggcm64U8mhgFVOoH+cMjqirqiro44
 fvFJUvS5ajdy1NjTYarTnRXXFfCmsBMavgycpFMJ38YwjiMp/gvbzGihQUW7jJQgVZdEeAEV2EL
 IQqUeZmga9rAOxk5wxPzIJTLZe8xaa5iY2giuMM9I3WuoUmb7v2wUXh7rgK8NaPedgj9KotBDuT
 0Ekg5+YPEWfwyLTnhOJv5+Vj6MCkKIhEwEcC8n2evR5Fral+E2CfqZjLXS3JJl3OrAAMqt3r830
 JqLYkFIL0o5ZePCh88iPusVFpMZHgPk357PU7VZDjmOBJxawieSWOh9CbGUbXDSZI+oXvlN0+FK
 MjNemptzgvcRuGTV1ClwXFm9fyUfr3DInBlJm8Tuq3IN5i0VF0aMELFIzXFYStQy3QIfMkKujvi
 Us7T2/q8aXgx9Fy6rJx+GEriK8Wa4hwfYVvf8HxuyKryXVXP223TdhN6IyeJbbrKBGWkr1IKuiM
 ADBqVC2QXXNNKEhj9yggHFsTG0b6MGIgVX48G3Djz01v+bI6tCsItugg1bzroA3Ny78tORY4YWi
 QBZUFOAo5yCx2dp+YqKrW7sMddKDVmLSOHJQyyLGGKhzBaQ6SkntpnlW+ZOL3+y1s7Hc4rJ+MKl
 CMmFMPSlTzYfmNQ==
X-Developer-Key: i=kurt@linutronix.de; a=openpgp;
 fpr=BCB9BFB2C8C37DD3DFDB5992C193D1F2AA467382
Cc: netdev@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Kurt Kanzenbach <kurt@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net] net: stmmac: Fix EST offset for dwmac 5.10
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

Fix EST offset for dwmac 5.10.

Currently configuring Qbv doesn't work as expected. The schedule is
configured, but never confirmed:

|[  128.250219] imx-dwmac 428a0000.ethernet eth1: configured EST

The reason seems to be the refactoring of the EST code which set the wrong
EST offset for the dwmac 5.10. After fixing this it works as before:

|[  106.359577] imx-dwmac 428a0000.ethernet eth1: configured EST
|[  128.430715] imx-dwmac 428a0000.ethernet eth1: EST: SWOL has been switched

Tested on imx93.

Fixes: c3f3b97238f6 ("net: stmmac: Refactor EST implementation")
Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 1bd34b2a47e8..29367105df54 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -224,7 +224,7 @@ static const struct stmmac_hwif_entry {
 		.regs = {
 			.ptp_off = PTP_GMAC4_OFFSET,
 			.mmc_off = MMC_GMAC4_OFFSET,
-			.est_off = EST_XGMAC_OFFSET,
+			.est_off = EST_GMAC4_OFFSET,
 		},
 		.desc = &dwmac4_desc_ops,
 		.dma = &dwmac410_dma_ops,

---
base-commit: 40b9385dd8e6a0515e1c9cd06a277483556b7286
change-id: 20240220-stmmac_est-ea6884f9ba3c

Best regards,
-- 
Kurt Kanzenbach <kurt@linutronix.de>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
