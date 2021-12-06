Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B24E546A582
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Dec 2021 20:19:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67A53C5F1E5;
	Mon,  6 Dec 2021 19:19:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 350EDC58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Dec 2021 19:19:21 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B6DBMxU016569;
 Mon, 6 Dec 2021 20:19:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=LswolZltv4wHUvra42xDx0HudOGvUKO0BcGRhPhum3k=;
 b=jsIY4KfZfmh3+mpWNx2m+OwWDXN0ykRDJUZPs71GYxpEcudm+weah5mOopNfn65mAFLH
 ag5yXOVs+413FsE8zX8DyhaelRR4cIy6v0N2oHEfQ59QOPSsFNU+MmRzKChDbAnePAq8
 oJl4oEWdUz+ee1fhl+O10H+KYXQuwbDROI+omsV6kCNc4X5ny5eb/HbYtw2qVEi8d4GS
 TzF/HTG7p3gUhdvDUpdQsuhk+wzpTomAeCwbh9rC3D61G/+K0zeHq1/0cXWvpqsOLbvP
 qPngjKAiA5exMvPf0b2MUqWrG3fvsaTvnlVgGu8XVd6ZCXQZGIW9GRLIpA0huh45LSi1 4w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cseqrk9re-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 20:19:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E594810002A;
 Mon,  6 Dec 2021 20:19:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DD2C22138CC;
 Mon,  6 Dec 2021 20:19:16 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 6 Dec 2021 20:19:16
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Date: Mon, 6 Dec 2021 20:18:58 +0100
Message-ID: <20211206191858.10741-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-06_07,2021-12-06_02,2021-12-02_01
Cc: Matthias Brugger <matthias.bgg@gmail.com>, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] remoteproc: Fix remaining wrong return
	formatting in documentation
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

kernel documentation specification:
"The return value, if any, should be described in a dedicated section
named Return."

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/mtk_scp_ipi.c   | 4 ++--
 drivers/remoteproc/st_slim_rproc.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index 6dc955ecab80..00f041ebcde6 100644
--- a/drivers/remoteproc/mtk_scp_ipi.c
+++ b/drivers/remoteproc/mtk_scp_ipi.c
@@ -23,7 +23,7 @@
  *
  * Register an ipi function to receive ipi interrupt from SCP.
  *
- * Returns 0 if ipi registers successfully, -error on error.
+ * Return: 0 if ipi registers successfully, -error on error.
  */
 int scp_ipi_register(struct mtk_scp *scp,
 		     u32 id,
@@ -150,7 +150,7 @@ EXPORT_SYMBOL_GPL(scp_ipi_unlock);
  * When the processing completes, IPI handler registered
  * by scp_ipi_register will be called in interrupt context.
  *
- * Returns 0 if sending data successfully, -error on error.
+ * Return: 0 if sending data successfully, -error on error.
  **/
 int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
 		 unsigned int wait)
diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
index 22096adc1ad3..4ed9467897e5 100644
--- a/drivers/remoteproc/st_slim_rproc.c
+++ b/drivers/remoteproc/st_slim_rproc.c
@@ -216,7 +216,7 @@ static const struct rproc_ops slim_rproc_ops = {
  * obtains and enables any clocks required by the SLIM core and also
  * ioremaps the various IO.
  *
- * Returns st_slim_rproc pointer or PTR_ERR() on error.
+ * Return: st_slim_rproc pointer or PTR_ERR() on error.
  */
 
 struct st_slim_rproc *st_slim_rproc_alloc(struct platform_device *pdev,
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
