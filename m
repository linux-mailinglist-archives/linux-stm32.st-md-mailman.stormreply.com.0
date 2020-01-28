Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F081214B157
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jan 2020 10:07:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA351C36B0E;
	Tue, 28 Jan 2020 09:07:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66EE2C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2020 09:07:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00S92i9h021525; Tue, 28 Jan 2020 10:06:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=vtrn8oNy0V5D1ILXEJrxYxOG5XROr16TBAvgkYNGlRY=;
 b=x0WzuSX1XndC0p5+b/E9nBVt0GDgGIhqCQGfXcQhkI62U5g99DIsTWQU5GjbXfvpnhAt
 dvHO8vmO2I2FwWyGG7N2vpP6mTWOasDL3CnrNj4iNp3X+lx25Gw6TstD6JCR+72J132q
 hu0uszTgG4FNlRw8rYRrFSzLJa52/GohXtmSyC6/wLsBwH0eoYTm8WQEldOupLsCQiRB
 lcvEdVbePm0Dffha/2XFFvjjB3UPmp7IDwTv+kOW+nmINFVvyq5Z8LIIef5avVD/+CX7
 v6pX6i1oXu60WoQ4GyI59d8wZB6CJINrdDENJacBd42oaqJEa5ttqtZjt56rujVFMVfY 4g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrdekcuhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2020 10:06:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1063910003B;
 Tue, 28 Jan 2020 10:06:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 033EE212A38;
 Tue, 28 Jan 2020 10:06:47 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Jan 2020 10:06:46 +0100
From: Ludovic Barre <ludovic.barre@st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 28 Jan 2020 10:06:34 +0100
Message-ID: <20200128090636.13689-8-ludovic.barre@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200128090636.13689-1-ludovic.barre@st.com>
References: <20200128090636.13689-1-ludovic.barre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-28_02:2020-01-24,
 2020-01-28 signatures=0
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH V2 7/9] mmc: mmci: add volt_switch callbacks
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

A variant may need to define some actions before and after
a voltage switch.

This patch adds 2 voltage switch callbacks in mmci_host_ops:
-pre_sig_volt_switch allows to prepare voltage switch before to
 sent the SD_SWITCH_VOLTAGE command (cmd11).
-post_sig_volt_switch callback allows to define specific action after
 regulator set voltage.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 drivers/mmc/host/mmci.c | 8 ++++++++
 drivers/mmc/host/mmci.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index d0a041c9e6cd..24e630183ed4 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -22,6 +22,7 @@
 #include <linux/mmc/pm.h>
 #include <linux/mmc/host.h>
 #include <linux/mmc/card.h>
+#include <linux/mmc/sd.h>
 #include <linux/mmc/slot-gpio.h>
 #include <linux/amba/bus.h>
 #include <linux/clk.h>
@@ -1217,6 +1218,9 @@ mmci_start_command(struct mmci_host *host, struct mmc_command *cmd, u32 c)
 		writel_relaxed(clks, host->base + MMCIDATATIMER);
 	}
 
+	if (host->ops->pre_sig_volt_switch && cmd->opcode == SD_SWITCH_VOLTAGE)
+		host->ops->pre_sig_volt_switch(host);
+
 	if (/*interrupt*/0)
 		c |= MCI_CPSM_INTERRUPT;
 
@@ -1830,6 +1834,7 @@ static int mmci_get_cd(struct mmc_host *mmc)
 
 static int mmci_sig_volt_switch(struct mmc_host *mmc, struct mmc_ios *ios)
 {
+	struct mmci_host *host = mmc_priv(mmc);
 	int ret = 0;
 
 	if (!IS_ERR(mmc->supply.vqmmc)) {
@@ -1849,6 +1854,9 @@ static int mmci_sig_volt_switch(struct mmc_host *mmc, struct mmc_ios *ios)
 			break;
 		}
 
+		if (!ret && host->ops && host->ops->post_sig_volt_switch)
+			ret = host->ops->post_sig_volt_switch(host, ios);
+
 		if (ret)
 			dev_warn(mmc_dev(mmc), "Voltage switch failed\n");
 	}
diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
index ddcdfb827996..c3bc0a38d4cb 100644
--- a/drivers/mmc/host/mmci.h
+++ b/drivers/mmc/host/mmci.h
@@ -377,6 +377,8 @@ struct mmci_host_ops {
 	void (*set_clkreg)(struct mmci_host *host, unsigned int desired);
 	void (*set_pwrreg)(struct mmci_host *host, unsigned int pwr);
 	bool (*busy_complete)(struct mmci_host *host, u32 status, u32 err_msk);
+	void (*pre_sig_volt_switch)(struct mmci_host *host);
+	int (*post_sig_volt_switch)(struct mmci_host *host, struct mmc_ios *ios);
 };
 
 struct mmci_host {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
