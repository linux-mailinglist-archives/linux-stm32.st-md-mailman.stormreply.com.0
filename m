Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0905B1ED03F
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jun 2020 14:56:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F56AC36B21;
	Wed,  3 Jun 2020 12:56:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50CF9C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jun 2020 12:56:02 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 053CqGR4021598; Wed, 3 Jun 2020 14:55:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=1o0Izbp2L810/aRMfi0HxXPaokBREpCphH53oslSJGg=;
 b=N3b+BKHja3b5QtYtvgXnpPL43CA8ot3kDHg11cHoMpEUop9Gh2F8mwxk9kxcHGhgFwFE
 PwDKhFmidNG9ke2vRlFgPCRPcbLHt3R4wF4JlMbX4vZnRKysGuhEn5IFA5J+PYhbtHPY
 hQe0mE678ETEItjkWgMHa/wUvrmvzkHgJpOb7BUsiGcDdDrXEK/ygUd8XH6Jx+3blRW5
 0GaHgT5ZeNdiva6z8P/zqzdkzyLleLbZ0lBAnbSxqLRhCno84MVCr/8jjJpZF2vYdDSN
 1nCdRUQlMBhVMVl8XislQkTYt6gNMYicBZpDirwPNsXRmDIvEsCsY9H8XVR3nJ+5tWZX LA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31bcm94rpe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 14:55:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B3316100039;
 Wed,  3 Jun 2020 14:55:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 936A02CBE8D;
 Wed,  3 Jun 2020 14:55:38 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 3 Jun 2020 14:54:44
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <fabrice.gasnier@st.com>, <lee.jones@linaro.org>, <robh+dt@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
 <linux@armlinux.org.uk>, <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
Date: Wed, 3 Jun 2020 14:54:36 +0200
Message-ID: <20200603125439.23275-4-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200603125439.23275-1-benjamin.gaignard@st.com>
References: <20200603125439.23275-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-03_12:2020-06-02,
 2020-06-03 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [RESEND v7 3/6] mfd: stm32: Add defines to be used
	for clkevent purpose
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

Add defines to be able to enable/clear irq and configure one shot mode.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
Acked-by: Lee Jones <lee.jones@linaro.org>
---
 include/linux/mfd/stm32-lptimer.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/mfd/stm32-lptimer.h b/include/linux/mfd/stm32-lptimer.h
index 605f62264825..90b20550c1c8 100644
--- a/include/linux/mfd/stm32-lptimer.h
+++ b/include/linux/mfd/stm32-lptimer.h
@@ -27,10 +27,15 @@
 #define STM32_LPTIM_CMPOK		BIT(3)
 
 /* STM32_LPTIM_ICR - bit fields */
+#define STM32_LPTIM_ARRMCF		BIT(1)
 #define STM32_LPTIM_CMPOKCF_ARROKCF	GENMASK(4, 3)
 
+/* STM32_LPTIM_IER - bit flieds */
+#define STM32_LPTIM_ARRMIE	BIT(1)
+
 /* STM32_LPTIM_CR - bit fields */
 #define STM32_LPTIM_CNTSTRT	BIT(2)
+#define STM32_LPTIM_SNGSTRT	BIT(1)
 #define STM32_LPTIM_ENABLE	BIT(0)
 
 /* STM32_LPTIM_CFGR - bit fields */
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
