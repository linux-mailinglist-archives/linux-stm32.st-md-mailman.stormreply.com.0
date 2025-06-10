Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A09AD3B2C
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Jun 2025 16:33:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17545C3F945;
	Tue, 10 Jun 2025 14:33:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B1A2C32E93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 14:32:58 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLEH4010672;
 Tue, 10 Jun 2025 16:32:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 QY6qi/R3mC6I0PBGDy1HO7PBzARIBULA1F9iuDzkGGs=; b=FTtIne1WwKDShxW6
 qiQ75QMff5a8dSHQnou5WWxhav1a1CpZObjO/GlW35ywTJKm2JaNYiiTpoAurTJ3
 Ol8HWttCSXxp8rjcp6HzykV7MEmhQzh28cZ7E3WvMYfioDZcM0ESVmLXYTvHH/yL
 7jegI0dRQ77ToqyRlJCQHH2FbFvVzXgTjZq8wq/eSWI78aSq6LWEnr3lnG3QV4qo
 3IeWdoGkBlbqLXNNSmFTHYwAJBR0POkO91sO1IgLI1a2MYyGtHzvpgIo1Wohml3X
 brWHJXImgQtDINoMZWEoMCW5nPh5y+ZfyG45NMLQo+JeXWBfGdgtk0kWIAD3+NVg
 o1daxg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474y0531dr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jun 2025 16:32:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C99F54005C;
 Tue, 10 Jun 2025 16:31:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B855FB37BD5;
 Tue, 10 Jun 2025 16:30:46 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 16:30:46 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Date: Tue, 10 Jun 2025 16:30:38 +0200
Message-ID: <20250610143042.295376-2-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610143042.295376-1-antonio.borneo@foss.st.com>
References: <20250610143042.295376-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
Cc: linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 1/5] pinctrl: stm32: Declare
	stm32_pmx_get_mode() as static
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

The commit acaa037970f6 ("pinctrl: stm32: Implement .get_direction
gpio_chip callback") exported the function stm32_pmx_get_mode()
and the struct stm32_gpio_bank, but these were never used outside
the file that defines them.

Declare the function as static, drop it from the include file and
drop also the struct, not anymore visible outside the file.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 5 +++--
 drivers/pinctrl/stm32/pinctrl-stm32.h | 4 ----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index ba49d48c3a1d1..3abf47e31c019 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -122,6 +122,8 @@ struct stm32_pinctrl {
 	spinlock_t irqmux_lock;
 };
 
+static void stm32_pmx_get_mode(struct stm32_gpio_bank *bank, int pin, u32 *mode, u32 *alt);
+
 static inline int stm32_gpio_pin(int gpio)
 {
 	return gpio % STM32_GPIO_PINS_PER_BANK;
@@ -798,8 +800,7 @@ static int stm32_pmx_set_mode(struct stm32_gpio_bank *bank,
 	return err;
 }
 
-void stm32_pmx_get_mode(struct stm32_gpio_bank *bank, int pin, u32 *mode,
-			u32 *alt)
+static void stm32_pmx_get_mode(struct stm32_gpio_bank *bank, int pin, u32 *mode, u32 *alt)
 {
 	u32 val;
 	int alt_shift = (pin % 8) * 4;
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
index 5e5de92ddd58c..8790fef2d58a2 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.h
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
@@ -65,11 +65,7 @@ struct stm32_pinctrl_match_data {
 	bool secure_control;
 };
 
-struct stm32_gpio_bank;
-
 int stm32_pctl_probe(struct platform_device *pdev);
-void stm32_pmx_get_mode(struct stm32_gpio_bank *bank,
-			int pin, u32 *mode, u32 *alt);
 int stm32_pinctrl_suspend(struct device *dev);
 int stm32_pinctrl_resume(struct device *dev);
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
