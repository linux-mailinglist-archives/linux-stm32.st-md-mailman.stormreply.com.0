Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AFE192B36
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2020 15:34:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EFCFC36B0E;
	Wed, 25 Mar 2020 14:34:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56DFFC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Mar 2020 14:34:33 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02PEXpoT028153; Wed, 25 Mar 2020 15:34:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=VEAFtOcNCvy1cdPVdvmkbIGYrS+dcDQPVJdYDZN9sAE=;
 b=Qnz3PVl1O1O6t5UoRQDG0sZ7dh0akxGExXfSZJW0wxquZTC5KBhR1INkYQzgO6c73ZTc
 LE0VH97DiiSaPMdTcHiBuZUVlLUs5sHLRYIK54CnKELEG59c5Es9y+qjbpL8iB3V7TPr
 qFTkl3WzPB6CG+xpedT+Fc6IfWaby3EIdsflItj8fJWyFnGyzY73G5OlNR91UBS3vpvd
 o1nScjliW7MO75YgsAak0tHGLrReXqNZ0apZrBTSSZE5BS5vdglqqqm+wOZLjHO2Xy9S
 D7O+lKfD9gV4TuYMKHRlqmFsCqLNm3hnqH/6ams+yaYHZmwnC1a/Luyi2bhgdVngUMzP +w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw995p99d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Mar 2020 15:34:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EE701100038;
 Wed, 25 Mar 2020 15:34:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E0C562B2527;
 Wed, 25 Mar 2020 15:34:21 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 25 Mar 2020 15:34:21 +0100
From: Ludovic Barre <ludovic.barre@st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Date: Wed, 25 Mar 2020 15:34:09 +0100
Message-ID: <20200325143409.13005-3-ludovic.barre@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325143409.13005-1-ludovic.barre@st.com>
References: <20200325143409.13005-1-ludovic.barre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-25_07:2020-03-24,
 2020-03-25 signatures=0
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH V2 2/2] mmc: mmci: initialize
	pwr|clk|datactrl_reg with their hardware values
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

In mmci_write_pwr|clk|datactrlreg functions, if the desired value
is equal to corresponding variable (pwr_reg|clk_reg|datactrl_reg),
the value is not written in the register.

At probe pwr|clk|datactrl_reg of mmci_host structure are initialized
to 0 (kzalloc of mmc_alloc_host). But they does not necessarily reflect
hardware value of these registers, if they are used while boot level.
This is problematic, if we want to write 0 in these registers.

This patch initializes pwr|clk|datactrl_reg variables with their
hardware values while probing.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 drivers/mmc/host/mmci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 647567def612..f378ae18d5dc 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -2085,6 +2085,10 @@ static int mmci_probe(struct amba_device *dev,
 	else if (plat->ocr_mask)
 		dev_warn(mmc_dev(mmc), "Platform OCR mask is ignored\n");
 
+	host->pwr_reg = readl_relaxed(host->base + MMCIPOWER);
+	host->clk_reg = readl_relaxed(host->base + MMCICLOCK);
+	host->datactrl_reg = readl_relaxed(host->base + MMCIDATACTRL);
+
 	/* We support these capabilities. */
 	mmc->caps |= MMC_CAP_CMD23;
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
