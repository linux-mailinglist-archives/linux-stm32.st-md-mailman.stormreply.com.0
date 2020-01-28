Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6320114B14F
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jan 2020 10:06:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F7F4C36B0E;
	Tue, 28 Jan 2020 09:06:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65948C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2020 09:06:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00S93bVd014413; Tue, 28 Jan 2020 10:06:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=uwVKjFIFlaDhQtYabxIoz0B6CJflTfSuEcRda3jxomk=;
 b=POcqSICWxXBkWXwU3yLBQ4gMYEIjmvGMVpDFsQm0QJ1SuIRpDWyS8fTq2D41GMXsJXXh
 ByPep/f8kaPqPvMxhXFxveXNTwOVN0yxXNR7W4EFCbDOW0cTnzZBkjmHLGiX6qDrhMQl
 EfXz+2E3Z/StkbpnGnyZhWaqcAocPmgW6we8pQ7tyFIQof8DBOlj70ctqesWfP6mrQe1
 efQQU5+mwgaYQ+jA7ahIOdGW1rc0ai+76/CsMNZoXeEoKMuOik63c+G1kXvRtNUPX2rI
 x3CmD5fcoKghtVufNh4Yl4OZBtjTl/NzferOfwyuAOAqhN1oqEZC/exmP6itvHYvXAZ+ 1g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrbpaw4sv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2020 10:06:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 88D6B100044;
 Tue, 28 Jan 2020 10:06:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7A0A4212A35;
 Tue, 28 Jan 2020 10:06:42 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Jan 2020 10:06:42 +0100
From: Ludovic Barre <ludovic.barre@st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 28 Jan 2020 10:06:30 +0100
Message-ID: <20200128090636.13689-4-ludovic.barre@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200128090636.13689-1-ludovic.barre@st.com>
References: <20200128090636.13689-1-ludovic.barre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-28_02:2020-01-24,
 2020-01-28 signatures=0
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH V2 3/9] mmc: mmci: add a reference at
	mmc_host_ops in mmci struct
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

The variant init function may need to add a mmc_host_ops,
for example to add the execute_tuning support if this feature
is available.
This patch adds mmc_host_ops pointer in mmci struct.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 drivers/mmc/host/mmci.c | 4 ++--
 drivers/mmc/host/mmci.h | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index e9ffce8d41ea..d0a041c9e6cd 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -1933,6 +1933,8 @@ static int mmci_probe(struct amba_device *dev,
 
 	host = mmc_priv(mmc);
 	host->mmc = mmc;
+	host->mmc_ops = &mmci_ops;
+	mmc->ops = &mmci_ops;
 
 	/*
 	 * Some variant (STM32) doesn't have opendrain bit, nevertheless
@@ -2072,8 +2074,6 @@ static int mmci_probe(struct amba_device *dev,
 	host->stop_abort.arg = 0;
 	host->stop_abort.flags = MMC_RSP_R1B | MMC_CMD_AC;
 
-	mmc->ops = &mmci_ops;
-
 	/* We support these PM capabilities. */
 	mmc->pm_caps |= MMC_PM_KEEP_POWER;
 
diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
index ea6a0b5779d4..55acc0971a44 100644
--- a/drivers/mmc/host/mmci.h
+++ b/drivers/mmc/host/mmci.h
@@ -407,6 +407,7 @@ struct mmci_host {
 	u32			mask1_reg;
 	u8			vqmmc_enabled:1;
 	struct mmci_platform_data *plat;
+	struct mmc_host_ops	*mmc_ops;
 	struct mmci_host_ops	*ops;
 	struct variant_data	*variant;
 	struct pinctrl		*pinctrl;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
