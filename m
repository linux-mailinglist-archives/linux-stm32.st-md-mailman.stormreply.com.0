Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA989AB2FF
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Oct 2024 17:59:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1FBBC78033;
	Tue, 22 Oct 2024 15:59:49 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7FE8C78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 15:59:48 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MBM6Jv009686;
 Tue, 22 Oct 2024 17:59:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 xw43kSf/Atci8VTq3fVDWxJmmDKvtYdZ97Nk2mum6BQ=; b=a6le9vrjRCD2zyek
 qTuQ41p6n7VWStJ5isNJexyQ646s1iBuXXwRB22AgLxvSSv76Q9wxzqtdGaIIFRy
 bhCI0cA3tRtMsgDKdhtktgdPRH2GqxwJvBGkqUh2sVomvQAcqFAIgsWZD2FvWVr1
 k36KwRBVJun6+lEDIHxdE+EPVu/HJuIvjTqGS3t5LQARk2P62poERn59JXjjCEtY
 tJwA5UDsiVjlDLvxj6e/mjet/IpJ3MDcN/c+TxPZ6eeiiqFjt3yQVRU3B0AZGKKz
 hBmonK8KVOWG6wTPsksaadCf2xjSsOahjzIWAFx4K4OZI5ouKe43tMdLrNP7n9/P
 gT9zEQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42cqqhuvag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Oct 2024 17:59:31 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4C23C4004D;
 Tue, 22 Oct 2024 17:58:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 49AAB26E842;
 Tue, 22 Oct 2024 17:57:29 +0200 (CEST)
Received: from localhost (10.48.87.33) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 22 Oct
 2024 17:57:29 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Date: Tue, 22 Oct 2024 17:56:47 +0200
Message-ID: <20241022155658.1647350-4-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.33]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Cheick Traore <cheick.traore@foss.st.com>, linux-kernel@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 03/14] pinctrl: stm32: Handle RSVD pin
	configuration
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

From: Fabien Dessenne <fabien.dessenne@foss.st.com>

When a pin is assigned to a coprocessor not running Linux, the pin
should be flagged in the DT as reserved and not usable by Linux.

Add pin configuration RSVD (Reserved) and instrument the driver to
not update the mux setting.

Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 9 +++++++++
 drivers/pinctrl/stm32/pinctrl-stm32.h | 3 ++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 30fa39688a8c0..cb7929feb6a0a 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -76,6 +76,7 @@ static const char * const stm32_gpio_functions[] = {
 	"af8", "af9", "af10",
 	"af11", "af12", "af13",
 	"af14", "af15", "analog",
+	"reserved",
 };
 
 struct stm32_pinctrl_group {
@@ -540,6 +541,9 @@ static bool stm32_pctrl_is_function_valid(struct stm32_pinctrl *pctl,
 		if (pin->pin.number != pin_num)
 			continue;
 
+		if (fnum == STM32_PIN_RSVD)
+			return true;
+
 		for (k = 0; k < STM32_CONFIG_NUM; k++) {
 			if (func->num == fnum)
 				return true;
@@ -839,6 +843,11 @@ static int stm32_pmx_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 	}
 
+	if (function == STM32_PIN_RSVD) {
+		dev_dbg(pctl->dev, "Reserved pins, skipping HW update.\n");
+		return 0;
+	}
+
 	bank = gpiochip_get_data(range->gc);
 	pin = stm32_gpio_pin(g->pin);
 
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
index 8790fef2d58a2..a5f62fb271442 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.h
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
@@ -17,7 +17,8 @@
 #define STM32_PIN_GPIO		0
 #define STM32_PIN_AF(x)		((x) + 1)
 #define STM32_PIN_ANALOG	(STM32_PIN_AF(15) + 1)
-#define STM32_CONFIG_NUM	(STM32_PIN_ANALOG + 1)
+#define STM32_PIN_RSVD		(STM32_PIN_ANALOG + 1)
+#define STM32_CONFIG_NUM	(STM32_PIN_RSVD + 1)
 
 /*  package information */
 #define STM32MP_PKG_AA		BIT(0)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
