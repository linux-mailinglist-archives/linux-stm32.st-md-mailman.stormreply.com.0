Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D1A2FCECE
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Jan 2021 12:09:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8811C3FADA;
	Wed, 20 Jan 2021 11:09:25 +0000 (UTC)
Received: from m12-18.163.com (m12-18.163.com [220.181.12.18])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF65BC36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Jan 2021 11:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=1gsABYDfG5RbJRuW+5
 LcmE2LNHNvGErZzNpRw38meiQ=; b=c/Zp9QqjSTB/yeLxkozcmiAbVhQhKDoTMp
 RLn0+jUWSuLBWVO/fGCGoUEwqLYj9VdcjS/BzZZ3BbHqhCJDEZwjV1xvn88Q1Nbw
 Uq+qDIVfYNK93qoSRz72zWvZVyGOMtFyeTVorxKJ0fpNhv0Eb2HCTwyDgPyJFWOz
 BPog6bz+M=
Received: from localhost.localdomain (unknown [119.3.119.20])
 by smtp14 (Coremail) with SMTP id EsCowAAnOBgSDwhgjCFyQA--.58652S4;
 Wed, 20 Jan 2021 19:08:06 +0800 (CST)
From: Pan Bian <bianpan2016@163.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Vineetha G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Rusaimi Amira Ruslan <rusaimi.amira.rusaimi@intel.com>
Date: Wed, 20 Jan 2021 03:07:44 -0800
Message-Id: <20210120110745.36412-1-bianpan2016@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: EsCowAAnOBgSDwhgjCFyQA--.58652S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrW7ZrW5GrWrAF4ktr43KFg_yoWDZFc_uF
 1fZF9YqFW5Crs0yrW2vw43Z34F9F1qqr1SgFWkKaySvr9rWwn0qr97ZrnrXr4ku3yFyF9r
 Gr1xt3yxA34fKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5CksPUUUUU==
X-Originating-IP: [119.3.119.20]
X-CM-SenderInfo: held01tdqsiiqw6rljoofrz/xtbBZBYgclQHMDV47AAAsi
Cc: netdev@vger.kernel.org, Pan Bian <bianpan2016@163.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] net: stmmac: dwmac-intel-plat: remove config
	data on error
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

Remove the config data when rate setting fails.

Fixes: 9efc9b2b04c7 ("net: stmmac: Add dwmac-intel-plat for GBE driver")
Signed-off-by: Pan Bian <bianpan2016@163.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
index 82b1c7a5a7a9..ba0e4d2b256a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
@@ -129,7 +129,7 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 				if (ret) {
 					dev_err(&pdev->dev,
 						"Failed to set tx_clk\n");
-					return ret;
+					goto err_remove_config_dt;
 				}
 			}
 		}
@@ -143,7 +143,7 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 			if (ret) {
 				dev_err(&pdev->dev,
 					"Failed to set clk_ptp_ref\n");
-				return ret;
+				goto err_remove_config_dt;
 			}
 		}
 	}
-- 
2.17.1


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
