Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C97869C2310
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Nov 2024 18:33:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81ED8C6DD94;
	Fri,  8 Nov 2024 17:33:49 +0000 (UTC)
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E2BAC640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Nov 2024 17:33:42 +0000 (UTC)
Received: from ldvnode.intra.ispras.ru (unknown [10.10.2.153])
 by mail.ispras.ru (Postfix) with ESMTPSA id E969740B2274;
 Fri,  8 Nov 2024 17:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru E969740B2274
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1731087221;
 bh=3QYrsrBPYW43jQDvfadZZ/SbvlgS981KQOnirhhBRvU=;
 h=From:To:Cc:Subject:Date:From;
 b=F5kOF/OaGdZSfFauj5TVSIstfJVU3lTPNTDHweGefjpPXpJ0XtnIpVTv1ULCVKRov
 PD1zkrsBF3jPlQfslBxcFO3SizMaSk+ggashI9VbDmg/EmGK1EJbDK9lz0pdeW5tyC
 jdFv4KDgaz8GCIsg5WJfS3SLQjxa0Lw0gdMSRuwE=
From: Vitalii Mordan <mordan@ispras.ru>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri,  8 Nov 2024 20:33:34 +0300
Message-Id: <20241108173334.2973603-1-mordan@ispras.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: lvc-project@linuxtesting.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fedor Pchelkin <pchelkin@ispras.ru>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Vadim Mutilin <mutilin@ispras.ru>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vitalii Mordan <mordan@ispras.ru>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v2]: stmmac: dwmac-intel-plat: fix call
	balance of tx_clk handling routines
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

If the clock dwmac->tx_clk was not enabled in intel_eth_plat_probe,
it should not be disabled in any path.

Conversely, if it was enabled in intel_eth_plat_probe, it must be disabled
in all error paths to ensure proper cleanup.

Found by Linux Verification Center (linuxtesting.org) with Klever.

Fixes: 9efc9b2b04c7 ("net: stmmac: Add dwmac-intel-plat for GBE driver")
Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
---
v2: Unwind using a goto label, as per Simon Horman's request.

 .../stmicro/stmmac/dwmac-intel-plat.c         | 25 +++++++++++++------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
index d68f0c4e7835..9739bc9867c5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
@@ -108,7 +108,12 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 			if (IS_ERR(dwmac->tx_clk))
 				return PTR_ERR(dwmac->tx_clk);
 
-			clk_prepare_enable(dwmac->tx_clk);
+			ret = clk_prepare_enable(dwmac->tx_clk);
+			if (ret) {
+				dev_err(&pdev->dev,
+					"Failed to enable tx_clk\n");
+				return ret;
+			}
 
 			/* Check and configure TX clock rate */
 			rate = clk_get_rate(dwmac->tx_clk);
@@ -119,7 +124,7 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 				if (ret) {
 					dev_err(&pdev->dev,
 						"Failed to set tx_clk\n");
-					return ret;
+					goto err_tx_clk_disable;
 				}
 			}
 		}
@@ -133,7 +138,7 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 			if (ret) {
 				dev_err(&pdev->dev,
 					"Failed to set clk_ptp_ref\n");
-				return ret;
+				goto err_tx_clk_disable;
 			}
 		}
 	}
@@ -149,12 +154,15 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 	}
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
-	if (ret) {
-		clk_disable_unprepare(dwmac->tx_clk);
-		return ret;
-	}
+	if (ret)
+		goto err_tx_clk_disable;
 
 	return 0;
+
+err_tx_clk_disable:
+	if (dwmac->data->tx_clk_en)
+		clk_disable_unprepare(dwmac->tx_clk);
+	return ret;
 }
 
 static void intel_eth_plat_remove(struct platform_device *pdev)
@@ -162,7 +170,8 @@ static void intel_eth_plat_remove(struct platform_device *pdev)
 	struct intel_dwmac *dwmac = get_stmmac_bsp_priv(&pdev->dev);
 
 	stmmac_pltfr_remove(pdev);
-	clk_disable_unprepare(dwmac->tx_clk);
+	if (dwmac->data->tx_clk_en)
+		clk_disable_unprepare(dwmac->tx_clk);
 }
 
 static struct platform_driver intel_eth_plat_driver = {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
