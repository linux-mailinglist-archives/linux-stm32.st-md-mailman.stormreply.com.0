Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC95333439
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2019 17:55:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87EA0CBA4D4
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2019 15:55:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59AF9CBA4D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2019 15:55:40 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x53Ffkrc011068; Mon, 3 Jun 2019 17:55:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=etA1bRR7f0xtxrGNfl8KQhV4H88uuHhQNEMpJ2vi+mQ=;
 b=PBhVDBGPiiI25H1VtUkAXq517b5hzXRR7DVsSHIQ3qDYyDTKGe5Qzv5XlM9QqL0GYy3e
 RtjV7TYs3fQBw3JtkkLpMqJ3JstDiDlx6dWZGBVsK+/PTqmK7tzxzmMAiseWcZ3LSPCk
 u3VequspPPUQ1bRk/bwPixinvLrBodI3SVYVhSo+JnlPM0Q82uJeVrxYIkOmzoopqw1m
 pUAXkzBl4YlOPyuTLpI5T6w/N26YDU4W+uIUB4PT8kX3cQ8nTfFxEKLMxXt875ffScrJ
 9z2l4pgMINN+h137bje50eE5xFuCKWyBFT5LIKJ/qBPp+h1z2u0RKI0b6dWuf9fScj1z BQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sunmc2xs3-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 03 Jun 2019 17:55:30 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9292D31;
 Mon,  3 Jun 2019 15:55:29 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6BDD74E66;
 Mon,  3 Jun 2019 15:55:29 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 3 Jun 2019
 17:55:29 +0200
Received: from lmecxl0923.lme.st.com (10.48.0.237) by webmail-ga.st.com
 (10.75.90.48) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 3 Jun 2019
 17:55:28 +0200
From: Ludovic Barre <ludovic.Barre@st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Date: Mon, 3 Jun 2019 17:55:23 +0200
Message-ID: <1559577325-19266-2-git-send-email-ludovic.Barre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559577325-19266-1-git-send-email-ludovic.Barre@st.com>
References: <1559577325-19266-1-git-send-email-ludovic.Barre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.237]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-03_12:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH V3 1/3] mmc: mmci: fix read status for busy
	detect
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

From: Ludovic Barre <ludovic.barre@st.com>

"busy_detect_flag" is used to read & clear busy value of mmci status.
"busy_detect_mask" is used to manage busy irq of mmci mask.
So to read mmci status the busy_detect_flag must be take account.
if the variant does not support busy detect feature the flag is null
and there is no impact.

Not need to re-read the status register in mmci_cmd_irq, the
status parameter can be used.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 drivers/mmc/host/mmci.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 356833a..5b5cc45 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -1240,7 +1240,7 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
 		 */
 		if (!host->busy_status &&
 		    !(status & (MCI_CMDCRCFAIL|MCI_CMDTIMEOUT)) &&
-		    (readl(base + MMCISTATUS) & host->variant->busy_detect_flag)) {
+		    (status & host->variant->busy_detect_flag)) {
 
 			/* Clear the busy start IRQ */
 			writel(host->variant->busy_detect_mask,
@@ -1517,7 +1517,8 @@ static irqreturn_t mmci_irq(int irq, void *dev_id)
 		 * to make sure that both start and end interrupts are always
 		 * cleared one after the other.
 		 */
-		status &= readl(host->base + MMCIMASK0);
+		status &= readl(host->base + MMCIMASK0) |
+			host->variant->busy_detect_flag;
 		if (host->variant->busy_detect)
 			writel(status & ~host->variant->busy_detect_mask,
 			       host->base + MMCICLEAR);
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
