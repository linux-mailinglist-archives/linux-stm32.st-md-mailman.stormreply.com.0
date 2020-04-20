Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A58E21B1152
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Apr 2020 18:19:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67735C36B0C;
	Mon, 20 Apr 2020 16:19:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD706C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2020 16:18:58 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03KGCBKL029130; Mon, 20 Apr 2020 18:18:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=GQbTc6KNDxMl8YSg798Cux50zZhwrXkX/dFcXXvNJ6Q=;
 b=TqeR1ZUjHaQNCqR1KQDULMvtxVFF85RXV2MogrDVDAHrZD/et2D7nz6qTKcwwppMIrw7
 abk6DWiG+BS0lKq7o0OPec7V2NOfU/VHcwNxTT8P3uv7qQeRMx07cNgFeJ0lKEPZF7kA
 UZpHJcK0MhKaooEDP3R2uOn2pfDsiA97RxUBKuFJU/Yd4V1uFn56MFqmlhUq7NEfBRAQ
 /Wdw9iDFC70tBL3wAny8mfmBI/JlXz7ohVCfWTMcyGhEkr3Cu0bNlRdxZ9evLWtkAG+I
 s77Y6vRMJRum/CJmcokfdHvet2o2P8Xvsaiu4k7D6fRMiGkwanqoziqxjMLXtUzZqLIT Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fregb2ee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Apr 2020 18:18:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 80A9F100034;
 Mon, 20 Apr 2020 18:18:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C9062AA2A3;
 Mon, 20 Apr 2020 18:18:45 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 20 Apr 2020 18:18:44 +0200
From: Ludovic Barre <ludovic.barre@st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Date: Mon, 20 Apr 2020 18:18:31 +0200
Message-ID: <20200420161831.5043-1-ludovic.barre@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-20_05:2020-04-20,
 2020-04-20 signatures=0
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] mmc: mmci_sdmmc: fix power on issue due to
	pwr_reg initialization
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

This patch fix a power-on issue, and avoid to retry the power sequence.

In power off sequence: sdmmc must set pwr_reg in "power-cycle" state
(value 0x2), to prevent the card from being supplied through the signal
lines (all the lines are driven low).

In power on sequence: when the power is stable, sdmmc must set pwr_reg
in "power-off" state (value 0x0) to drive all signal to high before to
set "power-on".

To avoid writing the same value to the power register several times, this
register is cached by the pwr_reg variable. At probe pwr_reg is initialized
to 0 by kzalloc of mmc_alloc_host.

Like pwr_reg value is 0 at probing, the power on sequence fail because
the "power-off" state is not writes (value 0x0) and the lines
remain drive to low.

This patch initializes "pwr_reg" variable with power register value.
This it done in sdmmc variant init to not disturb default mmci behavior.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---

This patch is the proposal from:
https://patchwork.kernel.org/patch/11457987/

---
 drivers/mmc/host/mmci_stm32_sdmmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
index d33e62bd6153..14f99d8aa3f0 100644
--- a/drivers/mmc/host/mmci_stm32_sdmmc.c
+++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
@@ -519,6 +519,7 @@ void sdmmc_variant_init(struct mmci_host *host)
 	struct sdmmc_dlyb *dlyb;
 
 	host->ops = &sdmmc_variant_ops;
+	host->pwr_reg = readl_relaxed(host->base + MMCIPOWER);
 
 	base_dlyb = devm_of_iomap(mmc_dev(host->mmc), np, 1, NULL);
 	if (IS_ERR(base_dlyb))
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
