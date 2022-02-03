Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1624AC4E8
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Feb 2022 17:09:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56DCEC60465;
	Mon,  7 Feb 2022 16:09:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E55AC60460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 16:09:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 213FKZHg012451;
 Thu, 3 Feb 2022 18:16:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=AglS7CjM5YP8DK4AQeHdlXrIgQZulAnAMUNDfA9asfI=;
 b=4xqXISGNWGY2Emt4pZgDgvrVc6aW8PdwBS7cEazVIKK7mVQ5BDnE3x7ddDEQ5zLvlzsL
 sqY4mc2ZpxrkXFwBmTH1E+Hwi73ZO++7xKgqZVK+RZ114598SZTeI2Aw40kRF2d/pdj0
 sQctKqVRERDt+ZDaiu+RoqB5MJBQVGgoOqQVeZ0UXft6uHCB4CSA3m29ICRsCrHF8xE7
 FsxhJMclYTqaCizuhzuhM9UlLpDrfOu+JsLHdqv+sEZUXCpljLB9fMkLBR0Oletzcv9q
 NI59qUmEXDuufa9qJSYrqf0Sh7p/HOAzIJ7juLoWAIANerbjNM2JnbMGoO+TSpNxTFAq uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e0c4fje1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 18:16:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 59AD5100034;
 Thu,  3 Feb 2022 18:16:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5150422F7AF;
 Thu,  3 Feb 2022 18:16:48 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 3 Feb 2022 18:16:47
 +0100
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 3 Feb 2022 18:16:43 +0100
Message-ID: <20220203171644.12231-2-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220203171644.12231-1-erwan.leray@foss.st.com>
References: <20220203171644.12231-1-erwan.leray@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_06,2022-02-03_01,2021-12-02_01
Cc: linux-serial@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Gerald Baeza <gerald.baeza@st.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] serial: mctrl_gpio: add a new API to
	enable / disable wake_irq
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

Add a new API to enable / disable wake_irq in order to enable gpio irqs as
wakeup irqs for the uart port.

Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>

diff --git a/drivers/tty/serial/serial_mctrl_gpio.c b/drivers/tty/serial/serial_mctrl_gpio.c
index c41d8911ce95..1663b3afc3a0 100644
--- a/drivers/tty/serial/serial_mctrl_gpio.c
+++ b/drivers/tty/serial/serial_mctrl_gpio.c
@@ -299,4 +299,42 @@ void mctrl_gpio_disable_ms(struct mctrl_gpios *gpios)
 }
 EXPORT_SYMBOL_GPL(mctrl_gpio_disable_ms);
 
+void mctrl_gpio_enable_irq_wake(struct mctrl_gpios *gpios)
+{
+	enum mctrl_gpio_idx i;
+
+	if (!gpios)
+		return;
+
+	if (!gpios->mctrl_on)
+		return;
+
+	for (i = 0; i < UART_GPIO_MAX; ++i) {
+		if (!gpios->irq[i])
+			continue;
+
+		enable_irq_wake(gpios->irq[i]);
+	}
+}
+EXPORT_SYMBOL_GPL(mctrl_gpio_enable_irq_wake);
+
+void mctrl_gpio_disable_irq_wake(struct mctrl_gpios *gpios)
+{
+	enum mctrl_gpio_idx i;
+
+	if (!gpios)
+		return;
+
+	if (!gpios->mctrl_on)
+		return;
+
+	for (i = 0; i < UART_GPIO_MAX; ++i) {
+		if (!gpios->irq[i])
+			continue;
+
+		disable_irq_wake(gpios->irq[i]);
+	}
+}
+EXPORT_SYMBOL_GPL(mctrl_gpio_disable_irq_wake);
+
 MODULE_LICENSE("GPL");
diff --git a/drivers/tty/serial/serial_mctrl_gpio.h b/drivers/tty/serial/serial_mctrl_gpio.h
index b134a0ffc894..fc76910fb105 100644
--- a/drivers/tty/serial/serial_mctrl_gpio.h
+++ b/drivers/tty/serial/serial_mctrl_gpio.h
@@ -91,6 +91,16 @@ void mctrl_gpio_enable_ms(struct mctrl_gpios *gpios);
  */
 void mctrl_gpio_disable_ms(struct mctrl_gpios *gpios);
 
+/*
+ * Enable gpio wakeup interrupts to enable wake up source.
+ */
+void mctrl_gpio_enable_irq_wake(struct mctrl_gpios *gpios);
+
+/*
+ * Disable gpio wakeup interrupts to enable wake up source.
+ */
+void mctrl_gpio_disable_irq_wake(struct mctrl_gpios *gpios);
+
 #else /* GPIOLIB */
 
 static inline
@@ -142,6 +152,14 @@ static inline void mctrl_gpio_disable_ms(struct mctrl_gpios *gpios)
 {
 }
 
+static inline void mctrl_gpio_enable_irq_wake(struct mctrl_gpios *gpios)
+{
+}
+
+static inline void mctrl_gpio_disable_irq_wake(struct mctrl_gpios *gpios)
+{
+}
+
 #endif /* GPIOLIB */
 
 #endif
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
