Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E01B1487F
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 08:48:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86C94C3F945;
	Tue, 29 Jul 2025 06:48:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96028C3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jul 2025 06:33:33 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H6VLuC026811;
 Thu, 17 Jul 2025 08:33:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 iwWYLVWIQhsieK1q3dXMnApygXnCasOaR3eXeKwwLbg=; b=ajzJHYbhy5oSXC2l
 TDEc2nIV35DWNo30+RAiFhQ2HuOncwuajXfN/if/Uj9G8UY8FcklyqMjbGycRVa4
 DWYgwIn1Oq49RcjUscrubIwQa2Wi2xLl+UgtoqFFLoWt/1aHz38pld/1n8BuWyhW
 zLQuykTcZ1aJG0MzFC7ZZXqVJRNZDzOQGycZiut4l79xsG1iUGjX8/K1XBRcC5X9
 J24AmVOjgHlBl0s/lzTyn4bAYkxrF99VE8R+qrXH7OH6IapCbd+No+YYeTrwnMcp
 2yGvAOdEHyjt1AlFp9SjBnSOey5b/6z1j0b1H/e3OKoXmyf7iGOYjT31OWAtEyx4
 u9qYKA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47ucu9pd3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jul 2025 08:33:15 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AE7C04005D;
 Thu, 17 Jul 2025 08:32:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DC71778C59D;
 Thu, 17 Jul 2025 08:31:19 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 08:31:19 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <lpieralisi@kernel.org>,
 <kwilczynski@kernel.org>, <mani@kernel.org>, <robh@kernel.org>,
 <bhelgaas@google.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <linus.walleij@linaro.org>
Date: Thu, 17 Jul 2025 08:30:41 +0200
Message-ID: <20250717063042.2236524-2-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250717063042.2236524-1-christian.bruel@foss.st.com>
References: <20250717063042.2236524-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:48:52 +0000
Cc: linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [RESEND PATCH 1/2] pinctrl: Add
	pinctrl_pm_select_init_state helper function
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

If a platform requires an initial state during probing, this helper function
provides the client with access to the same initial state used to balance
from a pinctrl_pm_select_sleep_state .
eg:

 xxx_suspend_noirq
    pinctrl_pm_select_sleep_state

 xxx resume_noirq
    pinctrl_pm_select_init_state
    ...
    pinctrl_pm_select_default_state

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 drivers/pinctrl/core.c           | 13 +++++++++++++
 include/linux/pinctrl/consumer.h | 10 ++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 9046292d1360..80cf9f20f626 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1655,6 +1655,19 @@ int pinctrl_pm_select_default_state(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(pinctrl_pm_select_default_state);
 
+/**
+ * pinctrl_pm_select_init_state() - select init pinctrl state for PM
+ * @dev: device to select init state for
+ */
+int pinctrl_pm_select_init_state(struct device *dev)
+{
+	if (!dev->pins)
+		return 0;
+
+	return pinctrl_select_bound_state(dev, dev->pins->init_state);
+}
+EXPORT_SYMBOL_GPL(pinctrl_pm_select_init_state);
+
 /**
  * pinctrl_pm_select_sleep_state() - select sleep pinctrl state for PM
  * @dev: device to select sleep state for
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 73de70362b98..63ce16191eb9 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -48,6 +48,7 @@ int pinctrl_select_default_state(struct device *dev);
 
 #ifdef CONFIG_PM
 int pinctrl_pm_select_default_state(struct device *dev);
+int pinctrl_pm_select_init_state(struct device *dev);
 int pinctrl_pm_select_sleep_state(struct device *dev);
 int pinctrl_pm_select_idle_state(struct device *dev);
 #else
@@ -55,6 +56,10 @@ static inline int pinctrl_pm_select_default_state(struct device *dev)
 {
 	return 0;
 }
+static inline int pinctrl_pm_select_init_state(struct device *dev)
+{
+	return 0;
+}
 static inline int pinctrl_pm_select_sleep_state(struct device *dev)
 {
 	return 0;
@@ -143,6 +148,11 @@ static inline int pinctrl_pm_select_default_state(struct device *dev)
 	return 0;
 }
 
+static inline int pinctrl_pm_select_init_state(struct device *dev)
+{
+	return 0;
+}
+
 static inline int pinctrl_pm_select_sleep_state(struct device *dev)
 {
 	return 0;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
