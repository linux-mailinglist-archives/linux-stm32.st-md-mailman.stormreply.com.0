Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F237EEE123
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2019 14:30:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F08DC36B0B;
	Mon,  4 Nov 2019 13:30:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8746DC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Nov 2019 13:30:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA4DNFwM017939; Mon, 4 Nov 2019 14:30:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=dWUyjMPm0hw98cUZjpf/Lk4hXPmA04Wmo+g+mY9iROc=;
 b=GB/THL6vjsrigPm2k3hF4aQolDYn1XCBydGXqGpiIypoA3lfv34OEJJkVpqYs37pta0P
 DqkbXy7haJMkb4DdOKHKQNAI+S1wKfQzTrLO9CqS/yh4ycMUOjw+X1iYUB12TgEv9ASY
 8Cw5NzwAObFWPPrh9d3xipb4E7XavU7ZhW/Z6RCLN1hp/ud7F+DAS3X6kyWdTg5TOzx/
 v1/61WbkjtWwC5PyFQM7w9GaCdvBTk/HTgoORv9yI0zSJBw5R+Z/4sIy8oHKzOSgjFFI
 Vpn76/WAVcsMJxs0dzM68gf+7dFP1+Jbc+i3ldaBeEi3ZcjDj0CCo4ciumXSJ4zpnBGO Kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2w11jn1vxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Nov 2019 14:30:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 62BF3100034;
 Mon,  4 Nov 2019 14:30:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5279B2D379D;
 Mon,  4 Nov 2019 14:30:24 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Mon, 4 Nov 2019 14:30:23 +0100
From: Pascal Paillet <p.paillet@st.com>
To: <rui.zhang@intel.com>, <edubezval@gmail.com>, <daniel.lezcano@linaro.org>, 
 <amit.kucheria@verdurent.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <p.paillet@st.com>,
 <david.hernandezsanchez@st.com>, <horms+renesas@verge.net.au>,
 <wsa+renesas@sang-engineering.com>, <linux-pm@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Mon, 4 Nov 2019 14:30:17 +0100
Message-ID: <20191104133020.8820-3-p.paillet@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191104133020.8820-1-p.paillet@st.com>
References: <20191104133020.8820-1-p.paillet@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-11-04_08:2019-11-04,2019-11-04 signatures=0
Subject: [Linux-stm32] [PATCH v2 2/5] thermal: stm32: fix icifr register name
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

Fix a mistake with the ICIFR register name.

Signed-off-by: Pascal Paillet <p.paillet@st.com>
---
 drivers/thermal/st/stm_thermal.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/st/stm_thermal.c b/drivers/thermal/st/stm_thermal.c
index 31aa63fb3db1..7577242dadb4 100644
--- a/drivers/thermal/st/stm_thermal.c
+++ b/drivers/thermal/st/stm_thermal.c
@@ -30,7 +30,7 @@
 #define DTS_DR_OFFSET		0x1C
 #define DTS_SR_OFFSET		0x20
 #define DTS_ITENR_OFFSET	0x24
-#define DTS_CIFR_OFFSET		0x28
+#define DTS_ICIFR_OFFSET		0x28
 
 /* DTS_CFGR1 register mask definitions */
 #define HSREF_CLK_DIV_MASK	GENMASK(30, 24)
@@ -111,10 +111,10 @@ static irqreturn_t stm_thermal_alarm_irq_thread(int irq, void *sdata)
 	value = readl_relaxed(sensor->base + DTS_SR_OFFSET);
 
 	if ((value & LOW_THRESHOLD) == LOW_THRESHOLD)
-		writel_relaxed(LOW_THRESHOLD, sensor->base + DTS_CIFR_OFFSET);
+		writel_relaxed(LOW_THRESHOLD, sensor->base + DTS_ICIFR_OFFSET);
 
 	if ((value & HIGH_THRESHOLD) == HIGH_THRESHOLD)
-		writel_relaxed(HIGH_THRESHOLD, sensor->base + DTS_CIFR_OFFSET);
+		writel_relaxed(HIGH_THRESHOLD, sensor->base + DTS_ICIFR_OFFSET);
 
 	thermal_zone_device_update(sensor->th_dev, THERMAL_EVENT_UNSPECIFIED);
 
@@ -336,7 +336,7 @@ static int stm_enable_irq(struct stm_thermal_sensor *sensor)
 	 */
 
 	/* Make sure LOW_THRESHOLD IT is clear before enabling */
-	writel_relaxed(LOW_THRESHOLD, sensor->base + DTS_CIFR_OFFSET);
+	writel_relaxed(LOW_THRESHOLD, sensor->base + DTS_ICIFR_OFFSET);
 
 	/* Enable IT generation for low threshold */
 	value = readl_relaxed(sensor->base + DTS_ITENR_OFFSET);
@@ -345,7 +345,7 @@ static int stm_enable_irq(struct stm_thermal_sensor *sensor)
 	/* Enable the low temperature threshold if needed */
 	if (sensor->low_temp_enabled) {
 		/* Make sure HIGH_THRESHOLD IT is clear before enabling */
-		writel_relaxed(HIGH_THRESHOLD, sensor->base + DTS_CIFR_OFFSET);
+		writel_relaxed(HIGH_THRESHOLD, sensor->base + DTS_ICIFR_OFFSET);
 
 		/* Enable IT generation for high threshold */
 		value |= HIGH_THRESHOLD;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
