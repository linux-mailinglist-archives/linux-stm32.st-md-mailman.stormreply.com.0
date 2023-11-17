Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD227EF483
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Nov 2023 15:34:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E70FBC6C85D;
	Fri, 17 Nov 2023 14:34:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 988A4C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Nov 2023 14:34:08 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AH9Mg4v015626; Fri, 17 Nov 2023 15:33:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=2kptbLSUBCjfzpDr3d+grhLzBCudtePeEMBFobZJJgo=; b=nb
 5WDD3paSc2RkhJSUfJJ2/D0CYb3COTreycw9IHutG7jRF4w/xSbj73ZOwamcLVCB
 L1wNvKb8HBb0SVP9boqYv/bUevAfvPPDMUAN1jighVeMs+erhNXlqv6LxqysSLKB
 6qGlc5aQ4cw80s5/Zc3xA9aPacmaUETSvNFsXxpGrFAZhc7V3X6Y5EoUt+r/MF4H
 0cMMoT6AQ91PbTXj1qCu4GpxYzAB5dAyOuvC54Q4osREbR/mTHvfHTO7YgPfe35E
 8AqqzbM0MA0Lop9FDSqWK53Pxgba215kchdTyuQMf3HQtQNJrr13vONE5iA+clpQ
 73mhqBNsdQ+mIrTp67pw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3udn0m4t7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Nov 2023 15:33:53 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F26FD100039;
 Fri, 17 Nov 2023 15:33:48 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC6552309C5;
 Fri, 17 Nov 2023 15:33:48 +0100 (CET)
Received: from localhost (10.201.22.165) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 17 Nov
 2023 15:33:48 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Fri, 17 Nov 2023 15:33:35 +0100
Message-ID: <20231117153310.2.I76e50bf760c893b11edfb2ed77388e2939612288@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117143338.1173475-1-patrick.delaunay@foss.st.com>
References: <20231117143338.1173475-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_13,2023-11-17_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/4] nvmem: stm32: add support for STM32MP25
	BSEC to control OTP data
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

On STM32MP25, OTP area may be read/written by using BSEC (boot, security
and OTP control). The BSEC internal peripheral is only managed by the
secure world.

The 12 Kbits of OTP (effective) are organized into the following regions:
- lower OTP (OTP0 to OTP127) = 4096 lower OTP bits,
  bitwise (1-bit) programmable
- mid OTP (OTP128 to OTP255) = 4096 middle OTP bits,
  bulk (32-bit) programmable
- upper OTP (OTP256 to OTP383) = 4096 upper OTP bits,
  bulk (32-bit) programmable,
  only accessible when BSEC is in closed state.

As HWKEY and ECIES key are only accessible by ROM code;
only 368 OTP words are managed in this driver (OTP0 to OTP267).

This patch adds the STM32MP25 configuration for reading and writing
the OTP data using the OP-TEE BSEC TA services.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/nvmem/stm32-romem.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/nvmem/stm32-romem.c b/drivers/nvmem/stm32-romem.c
index 8a553b1799a8..82879b1c9eb9 100644
--- a/drivers/nvmem/stm32-romem.c
+++ b/drivers/nvmem/stm32-romem.c
@@ -269,6 +269,19 @@ static const struct stm32_romem_cfg stm32mp13_bsec_cfg = {
 	.ta = true,
 };
 
+/*
+ * STM32MP25 BSEC OTP: 3 regions of 32-bits data words
+ *   lower OTP (OTP0 to OTP127), bitwise (1-bit) programmable
+ *   mid OTP (OTP128 to OTP255), bulk (32-bit) programmable
+ *   upper OTP (OTP256 to OTP383), bulk (32-bit) programmable
+ *              but no access to HWKEY and ECIES key: limited at OTP367
+ */
+static const struct stm32_romem_cfg stm32mp25_bsec_cfg = {
+	.size = 368 * 4,
+	.lower = 127,
+	.ta = true,
+};
+
 static const struct of_device_id stm32_romem_of_match[] __maybe_unused = {
 	{ .compatible = "st,stm32f4-otp", }, {
 		.compatible = "st,stm32mp15-bsec",
@@ -276,6 +289,9 @@ static const struct of_device_id stm32_romem_of_match[] __maybe_unused = {
 	}, {
 		.compatible = "st,stm32mp13-bsec",
 		.data = (void *)&stm32mp13_bsec_cfg,
+	}, {
+		.compatible = "st,stm32mp25-bsec",
+		.data = (void *)&stm32mp25_bsec_cfg,
 	},
 	{ /* sentinel */ },
 };
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
