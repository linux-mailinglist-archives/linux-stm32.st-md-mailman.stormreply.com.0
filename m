Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 671134FD245
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Apr 2022 09:09:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15A92C628AA;
	Tue, 12 Apr 2022 07:09:18 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCE64C60492
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Apr 2022 07:09:14 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id j21so18579211qta.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Apr 2022 00:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ou8zotsDb6wXIPljnzHu4XUowbgMosM63Cn663rp46M=;
 b=LVlh/tRvH71ktLfuib9NCViHKA8f0kEJc4AmJMpKEDE5aEjyO+V+Vbm2CUWH07lJad
 8/9Tj/cMllX/mRTxp3rXVBvjiov+7QAmYwTWqc3COJWNC8H4B/h1XOUidXW+zbkzaZwP
 oD5jdVXyteqNosnRQJ3vAAHRnHa+MMkuAJzZrtJelhDsHes4oqS8RcOcL9BOxZXRTcxw
 s1KSsomLF/OjH77XNPs2juRaOEuhRKQ87HrpU+/4SzEO0JJM1jzjbW43lpadSFzTLgXN
 /J/qdATZY47naHznlo84/HmjjjBnQ5bL38g62skwnmnINWkRKGqzDEAW2O9uViIBz45V
 DK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ou8zotsDb6wXIPljnzHu4XUowbgMosM63Cn663rp46M=;
 b=ORzfltNNXqt7cHbk9hMiqEw/NnC/fUy1rT0EmTu1qTp8M+B9F1nxLeMLIL36DpZwDv
 nIuaSg7mEcDCa0qCQgNRcaUttX3nT/VT5esuk+/ntyfzfH7M7lSJLlXNqS+UbH+3ctrm
 fs3QW5F/+acNgNc5D6ftsGF5LwsnufGkdxHARHHbWidSRMc4Xu4N0cp9cPubsOkrXhMa
 OsXQTaSRbnOJR9ZIs3MH44DVNM4BzkvlTaOnGoPKmq1aeHeCMTUiFZQH3BDmXDO0sMQl
 uP8dHe7OyD6sA/IakbeRcaNEp6MHofYk9ePpe5W8jxnGo5zwNO0bpViW1IupKgns75Ga
 KW9Q==
X-Gm-Message-State: AOAM530uWFMi0jS2gGS+lWUvsgmito9WmocGrZtn0XjA7Sqr2gbfYxc0
 Cu+51jrIa88vVGNrCz5Iwhg=
X-Google-Smtp-Source: ABdhPJx4DR/2lIWNbxf+QPOcGkQ+ZbHPL7PSoRYaKAeefy7mBD1ijw/kEHdShjr7h9+JBy+VPiAijA==
X-Received: by 2002:ac8:7c55:0:b0:2e1:d535:d881 with SMTP id
 o21-20020ac87c55000000b002e1d535d881mr2266217qtv.188.1649747353658; 
 Tue, 12 Apr 2022 00:09:13 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 x20-20020ac85f14000000b002e1ee1c56c3sm27634358qta.76.2022.04.12.00.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 00:09:12 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: broonie@kernel.org
Date: Tue, 12 Apr 2022 07:09:06 +0000
Message-Id: <20220412070906.2532091-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, mcoquelin.stm32@gmail.com,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] spi: spi-stm32-qspi: using
	pm_runtime_resume_and_get instead of pm_runtime_get_sync
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Using pm_runtime_resume_and_get is more appropriate
for simplifing code

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/spi/spi-stm32-qspi.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index ffdc55f87e82..b3586521d08e 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -463,11 +463,9 @@ static int stm32_qspi_poll_status(struct spi_mem *mem, const struct spi_mem_op *
 	if (!spi_mem_supports_op(mem, op))
 		return -EOPNOTSUPP;
 
-	ret = pm_runtime_get_sync(qspi->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(qspi->dev);
+	ret = pm_runtime_resume_and_get(qspi->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	mutex_lock(&qspi->lock);
 
@@ -490,11 +488,9 @@ static int stm32_qspi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 	struct stm32_qspi *qspi = spi_controller_get_devdata(mem->spi->master);
 	int ret;
 
-	ret = pm_runtime_get_sync(qspi->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(qspi->dev);
+	ret = pm_runtime_resume_and_get(qspi->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	mutex_lock(&qspi->lock);
 	if (op->data.dir == SPI_MEM_DATA_IN && op->data.nbytes)
@@ -536,11 +532,9 @@ static ssize_t stm32_qspi_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	u32 addr_max;
 	int ret;
 
-	ret = pm_runtime_get_sync(qspi->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(qspi->dev);
+	ret = pm_runtime_resume_and_get(qspi->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	mutex_lock(&qspi->lock);
 	/* make a local copy of desc op_tmpl and complete dirmap rdesc
@@ -583,11 +577,9 @@ static int stm32_qspi_setup(struct spi_device *spi)
 	if (!spi->max_speed_hz)
 		return -EINVAL;
 
-	ret = pm_runtime_get_sync(qspi->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(qspi->dev);
+	ret = pm_runtime_resume_and_get(qspi->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	presc = DIV_ROUND_UP(qspi->clk_rate, spi->max_speed_hz) - 1;
 
@@ -851,11 +843,9 @@ static int __maybe_unused stm32_qspi_resume(struct device *dev)
 
 	pinctrl_pm_select_default_state(dev);
 
-	ret = pm_runtime_get_sync(dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	writel_relaxed(qspi->cr_reg, qspi->io_base + QSPI_CR);
 	writel_relaxed(qspi->dcr_reg, qspi->io_base + QSPI_DCR);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
