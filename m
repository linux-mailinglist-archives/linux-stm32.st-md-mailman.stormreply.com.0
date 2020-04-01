Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AF219B6A3
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Apr 2020 21:57:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CEDBC36B10;
	Wed,  1 Apr 2020 19:57:50 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F5AAC36B0F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 19:57:49 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48sxnT0GlGz1qrM4;
 Wed,  1 Apr 2020 21:57:49 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48sxnS72hDz1r0cc;
 Wed,  1 Apr 2020 21:57:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id vkW5HCdeRclL; Wed,  1 Apr 2020 21:57:47 +0200 (CEST)
X-Auth-Info: 7/hv+VCPFKvVjy94/A1BvDumeSgcAfnzFKsYwubnSIY=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  1 Apr 2020 21:57:47 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-mmc@vger.kernel.org
Date: Wed,  1 Apr 2020 21:57:22 +0200
Message-Id: <20200401195722.208157-3-marex@denx.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200401195722.208157-1-marex@denx.de>
References: <20200401195722.208157-1-marex@denx.de>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 3/3] mmc: mmci: Switch to
	mmc_set_signal_voltage()
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

Instead of reimplementing the logic in mmc_set_signal_voltage(),
use the mmc code function directly.

This fixes a real issue on STM32MP1 where, if the eMMC is supplied with
VccQ=1.8 V, the post voltage switch code will spin indefinitelly waiting
for the voltage switch to complete, even though no voltage switch really
happened. But since mmc_set_signal_voltage() would return 0, then the
condition for calling .post_sig_volt_switch() is not satisfied if the
switch did not happen.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Ludovic Barre <ludovic.barre@st.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-mmc@vger.kernel.org
---
 drivers/mmc/host/mmci.c | 28 ++++++----------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 647567def612..b8c8f0e623de 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -1861,31 +1861,15 @@ static int mmci_get_cd(struct mmc_host *mmc)
 static int mmci_sig_volt_switch(struct mmc_host *mmc, struct mmc_ios *ios)
 {
 	struct mmci_host *host = mmc_priv(mmc);
-	int ret = 0;
-
-	if (!IS_ERR(mmc->supply.vqmmc)) {
+	int ret;
 
-		switch (ios->signal_voltage) {
-		case MMC_SIGNAL_VOLTAGE_330:
-			ret = regulator_set_voltage(mmc->supply.vqmmc,
-						2700000, 3600000);
-			break;
-		case MMC_SIGNAL_VOLTAGE_180:
-			ret = regulator_set_voltage(mmc->supply.vqmmc,
-						1700000, 1950000);
-			break;
-		case MMC_SIGNAL_VOLTAGE_120:
-			ret = regulator_set_voltage(mmc->supply.vqmmc,
-						1100000, 1300000);
-			break;
-		}
+	ret = mmc_regulator_set_vqmmc(mmc, ios);
 
-		if (!ret && host->ops && host->ops->post_sig_volt_switch)
-			ret = host->ops->post_sig_volt_switch(host, ios);
+	if (!ret && host->ops && host->ops->post_sig_volt_switch)
+		ret = host->ops->post_sig_volt_switch(host, ios);
 
-		if (ret)
-			dev_warn(mmc_dev(mmc), "Voltage switch failed\n");
-	}
+	if (ret < 0)
+		dev_warn(mmc_dev(mmc), "Voltage switch failed\n");
 
 	return ret;
 }
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
