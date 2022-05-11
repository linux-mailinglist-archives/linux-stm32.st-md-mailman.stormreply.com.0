Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 926BA522D93
	for <lists+linux-stm32@lfdr.de>; Wed, 11 May 2022 09:47:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57AE6C0D2B8;
	Wed, 11 May 2022 07:47:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 892F7C5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 May 2022 07:47:19 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24B4hxge021004;
 Wed, 11 May 2022 09:47:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=1ai4dm2l20Sc9AImn6T6dcp7p4IL4yIAR2T4CFSl3Aw=;
 b=z9jheGbqV4h2/VUvjiY0HUqshCihxPXcmCgImnv3QLcsn8Tl00SUKi/gW62lk5vsz3zE
 LaBHpevyphqk9qn18IwBfDZyJlfuR4UUIA8fjBjlibMXujjscifCFpRPFfxyVK4evvRi
 Amls0cYvjASZXNuJZKiV/flgFRlgGMmOtWjznfwlApqdYn+6zbW3UM39h8hmxmglMhUw
 Q6MR07HbL8RcW8B/K2GiRN61BKDKDkzmoPx9hH4izHnFu2GofwjVmzxHTsvOMAK7FrI+
 YfjHoGKL9RiSSjykNUjQ9TJLfTTxeYoUJLcKiJLtTVaakvwPK11CzdDhP43OYOHFmtwG HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwe6kwhse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 09:47:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C3EFA100034;
 Wed, 11 May 2022 09:47:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE1DF2128DB;
 Wed, 11 May 2022 09:47:03 +0200 (CEST)
Received: from localhost (10.75.127.46) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 11 May
 2022 09:47:03 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Wed, 11 May 2022 09:46:44 +0200
Message-ID: <20220511074644.558874-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511074644.558874-1-patrice.chotard@foss.st.com>
References: <20220511074644.558874-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_02,2022-05-10_01,2022-02-23_01
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/3] spi: stm32-qspi: Remove SR_BUSY bit check
	before sending command
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

Waiting for SR_BUSY bit when receiving a new command is not needed.
SR_BUSY bit is already managed in the previous command treatment.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/spi/spi-stm32-qspi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index 1660ca5bd1c5..c0239e405c39 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -369,10 +369,6 @@ static int stm32_qspi_send(struct spi_mem *mem, const struct spi_mem_op *op)
 		op->dummy.buswidth, op->data.buswidth,
 		op->addr.val, op->data.nbytes);
 
-	err = stm32_qspi_wait_nobusy(qspi);
-	if (err)
-		goto abort;
-
 	cr = readl_relaxed(qspi->io_base + QSPI_CR);
 	cr &= ~CR_PRESC_MASK & ~CR_FSEL;
 	cr |= FIELD_PREP(CR_PRESC_MASK, flash->presc);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
