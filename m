Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FB053B58E
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Jun 2022 10:59:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F323C5F1ED;
	Thu,  2 Jun 2022 08:59:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44D9EC5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jun 2022 08:59:34 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2527sSxw005071;
 Thu, 2 Jun 2022 10:59:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=zVNq45GLp6mScw2QvUD+lacjuXqSDpWYId6ZoABsrf0=;
 b=Zog+WSaJQSYz8+/Scw+ncNQ+eGxZ2APLkUetoO+XS0wxhWwpDa4bcDWHl4iScoHN6GIf
 bzYWQzQ5Ul22eAxkg63eSQyFzl13HXRgK5z/O5e2KKgGd9EVSEmrtR6PIjQx3gy43JlQ
 dMOMcmRvX4VYHFcmAf4AVzSd45UpT3rYJo/gKS/OwY6khklj2fUBXYIFPD3Y+3Ln44+9
 YvOsWz2iNRlKv8HvsZM7ZmanNt66NukOEdvkZIXKQ5aMUjwSq/FY16AxSn+jUboWvVSm
 DrwQT0fKIfPf83R1ycxAT6SsYNLaGIFs/j9xhf6Ns4XE8jztbs86fl1JWhzuMPMieY03 TA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gbc50xe6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 10:59:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1E5DA10002A;
 Thu,  2 Jun 2022 10:59:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 174A4216EF5;
 Thu,  2 Jun 2022 10:59:27 +0200 (CEST)
Received: from localhost (10.75.127.49) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 2 Jun
 2022 10:59:26 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Thu, 2 Jun 2022 10:59:17 +0200
Message-ID: <20220602085918.350613-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220602085918.350613-1-patrice.chotard@foss.st.com>
References: <20220602085918.350613-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-02_01,2022-06-01_01,2022-02-23_01
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] spi: stm32-qspi: Remove
	stm32_qspi_get_mode() unused parameter
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
