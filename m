Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 475E1A84307
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Apr 2025 14:25:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF15AC78F74;
	Thu, 10 Apr 2025 12:25:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C061C7803C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Apr 2025 12:25:12 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A9Vdxr019225;
 Thu, 10 Apr 2025 14:25:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=37TpAl9wbgOsV5Z6M//ml7
 JiFhzHgyko7+RFEp3uV6k=; b=PS9dKJRukFSJlYQ4JNFU7B++TZvDxUXzBPEIr6
 sJIaEnUVLrlokz5m7NLHV8G860gOG7lFjiMZpVG5mjYvlUMStbk8EISlEHslN+wF
 pP7dz7JM6mQga4DgvVDDFd1KmY97wYcR++f4ZQWqGLWNdZjpAz7OxR7sIIeY5aKw
 mr8a2VoY2BvGGDbR2hyH00iaf/2gY+fuywcHyDemjnLutaYr/2Cug56dyk3qIpZl
 zldbQZYnyd1ly4Ky1KmRwmiJbF3oJth5ztD47WsC/FIuaAKNoSqgbXSGs7oIBkNI
 fGlOa2oIOsXeY/r/B6wbWgPyKWvq7Oa1r1Izcl8S/YpcAwNA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw6eqmaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Apr 2025 14:25:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 98C4F40045;
 Thu, 10 Apr 2025 14:23:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A54BC9DA5B3;
 Thu, 10 Apr 2025 14:23:45 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 14:23:45 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 10 Apr 2025 14:23:43 +0200
Message-ID: <20250410-b4-upstream_ospi_reset_update-v1-0-74126a8ceb9c@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAE+492cC/x3MQQqDMBAF0KvIrBtIohbaq5QSUvPTzqIaZqIUx
 Lsbunybt5NCGEr3bifBxsrL3OAuHU2fOL9hODWTt360g7PmNZi1aBXEb1i0cBAoalhLihUmZ/h
 rcv1460HtKILMv///eB7HCS2Mgl1vAAAA
X-Change-ID: 20250410-b4-upstream_ospi_reset_update-ffe26d13593e
To: Philipp Zabel <p.zabel@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_03,2025-04-08_04,2024-11-22_01
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/2] reset: Add
 devm_reset_control_array_get_exclusive_released()
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

Add the released variant of devm_reset_control_array_get_exclusive().
Needed by spi-smt32-ospi driver as same reset line is also used also
by stm32-omm driver.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Patrice Chotard (2):
      reset: Add devm_reset_control_array_get_exclusive_released()
      spi: stm32-ospi: Make usage of reset_control_acquire/release() API

 drivers/spi/spi-stm32-ospi.c | 4 +++-
 include/linux/reset.h        | 6 ++++++
 2 files changed, 9 insertions(+), 1 deletion(-)
---
base-commit: 4a65326311aba694faafcef9e3c0ef7ae1b722e6
change-id: 20250410-b4-upstream_ospi_reset_update-ffe26d13593e

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
