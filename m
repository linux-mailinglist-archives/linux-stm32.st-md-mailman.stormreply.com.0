Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 733B4199A57
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 17:53:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69F08C36B0B;
	Tue, 31 Mar 2020 15:53:02 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B089C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 15:53:01 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48sDPS50MLz1qs1B;
 Tue, 31 Mar 2020 17:52:59 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48sDPR4fzWz1qqkQ;
 Tue, 31 Mar 2020 17:52:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id R0XGfFyZONyW; Tue, 31 Mar 2020 17:52:58 +0200 (CEST)
X-Auth-Info: MOVOPDEgmMSBSqTGDHmXgUsvPU41SOIxHlLxvRnAAEM=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 31 Mar 2020 17:52:58 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-mmc@vger.kernel.org
Date: Tue, 31 Mar 2020 17:52:54 +0200
Message-Id: <20200331155254.100952-1-marex@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] mmc: mmci: Only call .post_sig_volt_switch if
	voltage switch happened
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

Call the post voltage switch handler only if the voltage switch actually
happened. It is well possible that the regulator is already set correctly
and no voltage switch happened, so there is no need to take any further
action.

This fixes a real issue on STM32MP1 where, if the eMMC is supplied with
VccQ=1.8 V, the post voltage switch code will spin indefinitelly waiting
for the voltage switch to complete, even though no voltage switch really
happened.

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
 drivers/mmc/host/mmci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 647567def612..11c2f417cbe8 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -1861,10 +1861,12 @@ static int mmci_get_cd(struct mmc_host *mmc)
 static int mmci_sig_volt_switch(struct mmc_host *mmc, struct mmc_ios *ios)
 {
 	struct mmci_host *host = mmc_priv(mmc);
-	int ret = 0;
+	int old_voltage, new_voltage, ret = 0;
 
 	if (!IS_ERR(mmc->supply.vqmmc)) {
 
+		old_voltage = regulator_get_voltage(mmc->supply.vqmmc);
+
 		switch (ios->signal_voltage) {
 		case MMC_SIGNAL_VOLTAGE_330:
 			ret = regulator_set_voltage(mmc->supply.vqmmc,
@@ -1880,7 +1882,10 @@ static int mmci_sig_volt_switch(struct mmc_host *mmc, struct mmc_ios *ios)
 			break;
 		}
 
-		if (!ret && host->ops && host->ops->post_sig_volt_switch)
+		new_voltage = regulator_get_voltage(mmc->supply.vqmmc);
+
+		if (!ret && old_voltage != new_voltage &&
+		    host->ops && host->ops->post_sig_volt_switch)
 			ret = host->ops->post_sig_volt_switch(host, ios);
 
 		if (ret)
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
