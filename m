Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EA6D0AC0
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Oct 2019 11:16:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1D40C36B0C;
	Wed,  9 Oct 2019 09:16:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4515C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2019 09:16:17 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x999DIwJ011666; Wed, 9 Oct 2019 11:16:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=rvKrWgmVfwCw+WB+p5j5ZFC8+JEiy93wT4hT1MInc0o=;
 b=x2bi0GyT9/9w9OFd92/x/A2VhkGf/Bo10ex3dyVZ4hq3ALlgGTzmfB+WFqzlkAJo71s8
 bzL26zTCo4csfOukWb+1mcVv/vQe8WW5FC0pKsY9Z0UPUNxxwWcNGlLG9gfVbB3yKMCY
 1bkmXWDyC4KE5OXJIBJRVKTbgzuklOI5HBfKXgDXOfxuvDWqUF5I/sVu62Ei6LebbRkS
 rkaRqA+Z4sB9sYjjdERrfjUdNgwHuYk8/HbyHshwfeJmdtHjLR3rUwSP1lQZGBbu+9+5
 IfPR3iraDAjnF38kFHG8A3MHhwfCMJuRJyxzc/2sSOxZ6STIvjTtHRl1Q4QvSQ9vw4sh 9w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vej2pda7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Oct 2019 11:16:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 92CFE10002A;
 Wed,  9 Oct 2019 11:16:07 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 842C32062BE;
 Wed,  9 Oct 2019 11:16:07 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 9 Oct 2019
 11:16:07 +0200
Received: from localhost (10.201.22.141) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 9 Oct 2019 11:16:07
 +0200
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Torgue
 <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Wed, 9 Oct 2019 11:16:06 +0200
Message-ID: <20191009091606.17283-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.22.141]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-09_05:2019-10-08,2019-10-09 signatures=0
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 1/1] pinctrl: stmfx: add
	irq_request/release_resources callbacks
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

When an STMFX IO is used as interrupt through the interrupt-controller
binding, the STMFX driver should configure this IO as input. Default
value of STMFX IO direction is input, but if the IO is used as output
before the interrupt use, it will not work without these callbacks.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
Changes in V2:
- use gpiochip_reqres_irq and gpiochip_relres_irq instead of calling
explicitely the lock/unlock.
---
 drivers/pinctrl/pinctrl-stmfx.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index 564660028fcc..e5d49742d4db 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -505,6 +505,25 @@ static void stmfx_pinctrl_irq_bus_sync_unlock(struct irq_data *data)
 	mutex_unlock(&pctl->lock);
 }
 
+static int stmfx_gpio_irq_request_resources(struct irq_data *data)
+{
+	struct gpio_chip *gpio_chip = irq_data_get_irq_chip_data(data);
+	int ret;
+
+	ret = stmfx_gpio_direction_input(gpio_chip, data->hwirq);
+	if (ret)
+		return ret;
+
+	return gpiochip_reqres_irq(gpio_chip, data->hwirq);
+}
+
+static void stmfx_gpio_irq_release_resources(struct irq_data *data)
+{
+	struct gpio_chip *gpio_chip = irq_data_get_irq_chip_data(data);
+
+	return gpiochip_relres_irq(gpio_chip, data->hwirq);
+}
+
 static void stmfx_pinctrl_irq_toggle_trigger(struct stmfx_pinctrl *pctl,
 					     unsigned int offset)
 {
@@ -678,6 +697,8 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 	pctl->irq_chip.irq_set_type = stmfx_pinctrl_irq_set_type;
 	pctl->irq_chip.irq_bus_lock = stmfx_pinctrl_irq_bus_lock;
 	pctl->irq_chip.irq_bus_sync_unlock = stmfx_pinctrl_irq_bus_sync_unlock;
+	pctl->irq_chip.irq_request_resources = stmfx_gpio_irq_request_resources;
+	pctl->irq_chip.irq_release_resources = stmfx_gpio_irq_release_resources;
 
 	ret = gpiochip_irqchip_add_nested(&pctl->gpio_chip, &pctl->irq_chip,
 					  0, handle_bad_irq, IRQ_TYPE_NONE);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
