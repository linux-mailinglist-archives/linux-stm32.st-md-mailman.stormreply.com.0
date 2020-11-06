Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E87602A8FDD
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Nov 2020 08:04:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A370DC3FAE3;
	Fri,  6 Nov 2020 07:04:51 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48DAEC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 01:43:21 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CS37N2v5YzkYXv;
 Fri,  6 Nov 2020 09:43:12 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Fri, 6 Nov 2020
 09:43:12 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <broonie@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>
Date: Fri, 6 Nov 2020 09:53:57 +0800
Message-ID: <20201106015357.141235-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 06 Nov 2020 07:04:49 +0000
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: [Linux-stm32] [PATCH] spi: stm32-qspi: fix reference leak in stm32
	qspi operations
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

pm_runtime_get_sync will increment pm usage counter even it
failed. Forgetting to pm_runtime_put_noidle will result in
reference leak in two callers(stm32_qspi_exec_op and
stm32_qspi_setup), so we should fix it.

Fixes: 9d282c17b023a ("spi: stm32-qspi: Add pm_runtime support")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/spi/spi-stm32-qspi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index a900962b4336..947e6b9dc9f4 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -434,8 +434,10 @@ static int stm32_qspi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 	int ret;
 
 	ret = pm_runtime_get_sync(qspi->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(qspi->dev);
 		return ret;
+	}
 
 	mutex_lock(&qspi->lock);
 	ret = stm32_qspi_send(mem, op);
@@ -462,8 +464,10 @@ static int stm32_qspi_setup(struct spi_device *spi)
 		return -EINVAL;
 
 	ret = pm_runtime_get_sync(qspi->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(qspi->dev);
 		return ret;
+	}
 
 	presc = DIV_ROUND_UP(qspi->clk_rate, spi->max_speed_hz) - 1;
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
