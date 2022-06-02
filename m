Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8559853B579
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Jun 2022 10:56:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45CFCC5E2C6;
	Thu,  2 Jun 2022 08:56:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35804C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jun 2022 08:56:26 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25280vnV004990;
 Thu, 2 Jun 2022 10:56:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=zVNq45GLp6mScw2QvUD+lacjuXqSDpWYId6ZoABsrf0=;
 b=AfKK0orzpC6iZ7rDgUAFgCLr+fRTIGc7UPb2dOUz9BTSZyICAfuH41Udy2UidOMM6G12
 Y8UAoxFH0GNdSkkvkZoZYhZkto/20VIiWRg7VRhxdYDiueIhbuferelMF3VcDp2txzTM
 bthtvWz9eBdBF4dcHUhGz8rao3azYE95PTYJo0SHkGOUlwFRL0NSAqpibqAw+MOWKiZF
 hv866uUK3UlLb0yrWSVsTzWHFQPQzL/m1X0ByD9OuxzZIQqXFafpQi8CroHiMHSOeZ+0
 PzxW+i4iojoxOaT2/WyexHcL1jPlV9C8D6oXHng8+jL4u6N1kTvko573+KR7KnkCdWgi 6Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gbc50xdew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 10:56:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7A91D100038;
 Thu,  2 Jun 2022 10:56:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7372A216EF2;
 Thu,  2 Jun 2022 10:56:05 +0200 (CEST)
Received: from localhost (10.75.127.49) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 2 Jun
 2022 10:56:05 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Thu, 2 Jun 2022 10:55:55 +0200
Message-ID: <20220602085556.348139-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220602085556.348139-1-patrice.chotard@foss.st.com>
References: <20220602085556.348139-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-02_01,2022-06-01_01,2022-02-23_01
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [1/2] spi: stm32-qspi: Remove stm32_qspi_get_mode()
	unused parameter
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

struct stm32_qspi *qsp is no more used remove it.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/spi/spi-stm32-qspi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index c0239e405c39..2ad43c2f0526 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -349,7 +349,7 @@ static int stm32_qspi_wait_poll_status(struct stm32_qspi *qspi,
 	return 0;
 }
 
-static int stm32_qspi_get_mode(struct stm32_qspi *qspi, u8 buswidth)
+static int stm32_qspi_get_mode(u8 buswidth)
 {
 	if (buswidth == 4)
 		return CCR_BUSWIDTH_4;
@@ -382,11 +382,11 @@ static int stm32_qspi_send(struct spi_mem *mem, const struct spi_mem_op *op)
 	ccr = qspi->fmode;
 	ccr |= FIELD_PREP(CCR_INST_MASK, op->cmd.opcode);
 	ccr |= FIELD_PREP(CCR_IMODE_MASK,
-			  stm32_qspi_get_mode(qspi, op->cmd.buswidth));
+			  stm32_qspi_get_mode(op->cmd.buswidth));
 
 	if (op->addr.nbytes) {
 		ccr |= FIELD_PREP(CCR_ADMODE_MASK,
-				  stm32_qspi_get_mode(qspi, op->addr.buswidth));
+				  stm32_qspi_get_mode(op->addr.buswidth));
 		ccr |= FIELD_PREP(CCR_ADSIZE_MASK, op->addr.nbytes - 1);
 	}
 
@@ -396,7 +396,7 @@ static int stm32_qspi_send(struct spi_mem *mem, const struct spi_mem_op *op)
 
 	if (op->data.nbytes) {
 		ccr |= FIELD_PREP(CCR_DMODE_MASK,
-				  stm32_qspi_get_mode(qspi, op->data.buswidth));
+				  stm32_qspi_get_mode(op->data.buswidth));
 	}
 
 	writel_relaxed(ccr, qspi->io_base + QSPI_CCR);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
