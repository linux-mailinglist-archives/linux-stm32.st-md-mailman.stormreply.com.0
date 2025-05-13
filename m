Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9BBAB58D1
	for <lists+linux-stm32@lfdr.de>; Tue, 13 May 2025 17:38:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2CC4C7A837;
	Tue, 13 May 2025 15:38:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AC40C7A834
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 May 2025 15:38:16 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DDx9qo003335;
 Tue, 13 May 2025 17:38:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=S0lXHtXZiBNe2UA5zB9pQM
 WlV9t4LIkccdodCgquO/A=; b=p9JGB16a4j66mxFLU3vLFy8QHAp3DtF+cNhAk0
 c4d3mHbEs6GyXdmRMHj08EkDk5LvYCYsONNUTmKdf6K34Hb7kS1RCXDERHkK8gCQ
 kCtd5/XcUnp9IJyAs+O7t5S1VpxZjV5Ngh/WKLicCvO7tE5htIBF71HSnb6F+pbj
 MRxtFmsWHSHV1urhK4yxFnaojJF+EWig7cJyKiLtFYbufdRP9MlBglWaBkOB3xUn
 Ugs66fKGuWDXzPZWHmrOpfYLWQOZmMu8e6azSrAHnGkDigH0xsxpBjGvayIT3+i5
 V/fMiDsSRAoe7TA4u4qU18U8aWd4z0jVxcAOZRZg+lPnXCwA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46huxacqp5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 May 2025 17:38:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E936C40045;
 Tue, 13 May 2025 17:36:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 66CE2A2A2E5;
 Tue, 13 May 2025 17:34:38 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 May
 2025 17:34:38 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 13 May 2025 17:34:31 +0200
MIME-Version: 1.0
Message-ID: <20250513-stm32_omm_fix_typo-v1-1-5b90ec8b52e7@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAIZmI2gC/x2MQQqAIBAAvyJ7TjDTQ30lQirX2oMaKlFEf086D
 sPMAxkTYYaBPZDwpEwxVGgbBus+hw052coghdRCtx3PxXfSRO+No8uU+4gcrVuUm1Vv0UINj4T
 V/dNxet8PcNgQXGQAAAA=
X-Change-ID: 20250513-stm32_omm_fix_typo-edfb4fa49ded
To: Krzysztof Kozlowski <krzk@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] memory: stm32_omm: Fix error handling in
 stm32_omm_disable_child()
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

Fix stm32_omm_toggle_child_clock() return value test, we should exit
only on non zero value.

Fixes: 8181d061dcff ("memory: Add STM32 Octo Memory Manager driver")
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/memory/stm32_omm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
index 8523d9601af20fc8fe74cceea84e63d253cafec1..79ceb1635698f6bc8bd4a39fdeaced1ec318e1f6 100644
--- a/drivers/memory/stm32_omm.c
+++ b/drivers/memory/stm32_omm.c
@@ -164,7 +164,7 @@ static int stm32_omm_disable_child(struct device *dev)
 	u8 i;
 
 	ret = stm32_omm_toggle_child_clock(dev, true);
-	if (!ret)
+	if (ret)
 		return ret;
 
 	for (i = 0; i < omm->nb_child; i++) {

---
base-commit: 0169a24036848cf18205301673259bb6879eef97
change-id: 20250513-stm32_omm_fix_typo-edfb4fa49ded

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
