Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09631363EC4
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Apr 2021 11:39:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB1E3C58D66;
	Mon, 19 Apr 2021 09:39:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CF3FC58D6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Apr 2021 09:39:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13J9RIPj027858; Mon, 19 Apr 2021 11:39:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=HcKt8Vhz/HkUFi+h7CXhtAU23HKbdmLcnuJLlezyb0M=;
 b=M6O8dgdSEwOE+GF1FUlclSuo5sRv4NTHJesDPh89Qtry4i72xqr/2xTsge32tvrmjbDF
 cTnviZ+GGW5NdBnoLBKZa0pC4exjskjWhR7aHdJWSCPrDbmmYofHzgnW1fgdroHcJ9oR
 Chs8NgSlPwggfw+UrSN8PI4E76y34SkGZirqoYhRJATOgQXGBNvEP9S74ULvybymPG9H
 AttMEx00H3bJW0vpbOLdG2cPvZaNYvzEc6ODpXL4ddGfD0++5CVwNcS/LZzD2Evc0fYQ
 JVb6E7neX0nOwiklE5SD9wkIflDl65l1nA7yA63aoL+n+M4+RTQR3Gz/NGQi4pKxWinL Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 380s8c3bh0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 11:39:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 250EE10002A;
 Mon, 19 Apr 2021 11:39:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1418220A07F;
 Mon, 19 Apr 2021 11:39:13 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Apr 2021 11:39:12
 +0200
From: <gabriel.fernandez@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Etienne Carriere
 <etienne.carriere@st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, <marex@denx.de>
Date: Mon, 19 Apr 2021 11:38:50 +0200
Message-ID: <20210419093852.14978-10-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210419093852.14978-1-gabriel.fernandez@foss.st.com>
References: <20210419093852.14978-1-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-19_05:2021-04-16,
 2021-04-19 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 09/11] dt-bindings: reset: add MCU HOLD
	BOOT ID for SCMI reset domains on stm32mp15
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

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

Add ID to SCMI0 to exposes reset controller for the MCU HOLD BOOT resource.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/reset/stm32mp1-resets.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/reset/stm32mp1-resets.h b/include/dt-bindings/reset/stm32mp1-resets.h
index bc71924faa54..f3a0ed317835 100644
--- a/include/dt-bindings/reset/stm32mp1-resets.h
+++ b/include/dt-bindings/reset/stm32mp1-resets.h
@@ -7,6 +7,7 @@
 #ifndef _DT_BINDINGS_STM32MP1_RESET_H_
 #define _DT_BINDINGS_STM32MP1_RESET_H_
 
+#define MCU_HOLD_BOOT_R	2144
 #define LTDC_R		3072
 #define DSI_R		3076
 #define DDRPERFM_R	3080
@@ -117,5 +118,6 @@
 #define RST_SCMI0_RNG1		8
 #define RST_SCMI0_MDMA		9
 #define RST_SCMI0_MCU		10
+#define RST_SCMI0_MCU_HOLD_BOOT	11
 
 #endif /* _DT_BINDINGS_STM32MP1_RESET_H_ */
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
