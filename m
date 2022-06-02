Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D4D53B5F7
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Jun 2022 11:26:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DEDDC5F1D3;
	Thu,  2 Jun 2022 09:26:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9FE3C03FDF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jun 2022 09:26:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2528Q8cS013089;
 Thu, 2 Jun 2022 11:25:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=FV3dCJZ/NKhceKMRpBdKAJhZNqHyoQ1VY0zjIGNi3ok=;
 b=qY8Z7r1DWR3OcyxYw0TALUykEtIZ69ZJoDGCtv0AteGF70myLBKJMreNXfE8VXS8LCBx
 HcN2tqjZMl0PSZqEP1KhdarbHcqi3xYLPQDCd8U2X9Zxmy5H+lGSlQKomOCN1HeMJaKj
 yPTLgXm/4WnYXMXZY8nulWrs+WWgkn56GmtGbR1YUdpbPKgtJ0C8eAto7Q1Zhs2y6ShR
 n/dzgrbYw44KfMlQuctcKmkgM4aniX4vzRtfCMekIzLouX9x7elgz9xJyifcjMKdkQ/d
 YAbTpANwECThT4/T+UJLmgj3XL6EBGAj6gf7apEH2O4rZ9yh5jDUvLKAEzfFNhG/NnXs qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gespq0dp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 11:25:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4C0F8100034;
 Thu,  2 Jun 2022 11:25:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 468DD217B6C;
 Thu,  2 Jun 2022 11:25:57 +0200 (CEST)
Received: from localhost (10.75.127.44) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 2 Jun
 2022 11:25:57 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Thu, 2 Jun 2022 11:25:40 +0200
Message-ID: <20220602092540.369604-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220602092540.369604-1-patrice.chotard@foss.st.com>
References: <20220602092540.369604-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-02_01,2022-06-01_01,2022-02-23_01
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/3] spi: stm32-qspi: Remove
	stm32_qspi_wait_poll_status() unused parameter
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

op parameter is not used, remove it.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/spi/spi-stm32-qspi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index e5068e694ca5..f3fe92300639 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -330,8 +330,7 @@ static int stm32_qspi_wait_cmd(struct stm32_qspi *qspi)
 	return err;
 }
 
-static int stm32_qspi_wait_poll_status(struct stm32_qspi *qspi,
-				       const struct spi_mem_op *op)
+static int stm32_qspi_wait_poll_status(struct stm32_qspi *qspi)
 {
 	u32 cr;
 
@@ -404,7 +403,7 @@ static int stm32_qspi_send(struct spi_mem *mem, const struct spi_mem_op *op)
 		writel_relaxed(op->addr.val, qspi->io_base + QSPI_AR);
 
 	if (qspi->fmode == CCR_FMODE_APM)
-		err_poll_status = stm32_qspi_wait_poll_status(qspi, op);
+		err_poll_status = stm32_qspi_wait_poll_status(qspi);
 
 	err = stm32_qspi_tx(qspi, op);
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
