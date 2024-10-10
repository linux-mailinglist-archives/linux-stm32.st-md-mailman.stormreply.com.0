Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C404B9987C6
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Oct 2024 15:35:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68C16C71290;
	Thu, 10 Oct 2024 13:35:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1EBDC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2024 13:35:38 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A8i8eS000480;
 Thu, 10 Oct 2024 15:35:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=esXsrZ2YS/C1yT+ZzCtwwQ
 +71ddeQi/llzx1JUf1z3k=; b=Gik41LHLW8cAdrTWQZPOWhGCFI6nzYcgmi1DaG
 9kPZUEmwdN6NCEyWT7ASCbYOCaLN2yGp4OeouROtgJjGqPtFrV3M2YzwKZQ57VXB
 z2Awu2xTKSSTku7lQK0Q1MO7nKTxqiy1XYlOtckf0eoCPdOzxAixvTMC+q5J4KpT
 ak7lVGIGpXpjOIQiDg/2SU987UOpXugM+S2QLQWWnOnSYBgHYcJYC7bKXB0XUTKo
 5vvgv9w1rpvTgKWPfRPKx3hzUOlOLb1s/O8X4P75va4y3W2REWGVCF4vju5AuU4k
 4qsu8/gpy6lUKqC+oQeSwlMrx0DkY/j9Uaz3RCXPS/OZQabg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 423f1175hd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Oct 2024 15:35:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1AA014005D;
 Thu, 10 Oct 2024 15:34:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D6E7E273516;
 Thu, 10 Oct 2024 15:33:15 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 10 Oct
 2024 15:33:15 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 10 Oct 2024 15:33:03 +0200
MIME-Version: 1.0
Message-ID: <20241010-spi-mp25-device-fix-v2-1-d13920de473d@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAI/XB2cC/32NTQ6CMBBGr0Jm7ZBpAamsvIdhgWWQWUBJhxAN4
 e5WDuDyvXw/OyhHYYUm2yHyJiphTmAvGfixm1+M0icGS7Y0RDfURXBabIV9SnvGQd7IVJR0tY4
 8WUjNJXLS5+qjTTyKriF+zpPN/Oz/vc2gQceV7+r+WbvC3Yegmuua+zBBexzHF3thBSm4AAAA
X-Change-ID: 20241009-spi-mp25-device-fix-e03406280c02
To: Mark Brown <broonie@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Valentin Caron <valentin.caron@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] spi: stm32: fix missing device mode
 capability in stm32mp25
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

The STM32MP25 SOC has capability to behave in device mode however
missing .has_device_mode within its stm32mp25_spi_cfg structure leads
to not being able to enable the device mode.

Fixes: f6cd66231aa5 ("spi: stm32: add st,stm32mp25-spi compatible supporting STM32MP25 soc")
Cc: stable@vger.kernel.org
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
Changes in v2:
- correct Fixes commit sha1
- Link to v1: https://lore.kernel.org/r/20241009-spi-mp25-device-fix-v1-1-8e5ca7db7838@foss.st.com
---
 drivers/spi/spi-stm32.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index f2dd8ab12df831d54758d21ec1a68ffc40e2f0a6..da3517d7102dce5f830cdf0dbdee3e19184f69c5 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -2044,6 +2044,7 @@ static const struct stm32_spi_cfg stm32mp25_spi_cfg = {
 	.baud_rate_div_max = STM32H7_SPI_MBR_DIV_MAX,
 	.has_fifo = true,
 	.prevent_dma_burst = true,
+	.has_device_mode = true,
 };
 
 static const struct of_device_id stm32_spi_of_match[] = {

---
base-commit: c2a59c892f20379a3e48124a83491a12374cd7e0
change-id: 20241009-spi-mp25-device-fix-e03406280c02

Best regards,
-- 
Alain Volmat <alain.volmat@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
