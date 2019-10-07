Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C555CE3F9
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2019 15:44:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB39DC36B0F;
	Mon,  7 Oct 2019 13:44:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2499EC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2019 13:44:28 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x97DaVte022434; Mon, 7 Oct 2019 15:44:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=az9dy2ktIqgkk5jYrhMqsSlUq7PYeTVraawDvBq1iLs=;
 b=CnGVHQae22DWj2D5/tu8rSKxqi4JNXRIxWp0XLbbq5xjzm2RXXSbZ4iIvwplKPNrv230
 fKI78F6XCb+wQyH1F6e4hg+6k2ZdIkscyK8AeZAW9gMDXMKEpKFAeBFihXQN8VI5lJvk
 oh2nw0YlWlj3EPpOanF76JOjN5I3a8EZY7BMl/Jzvh8ZzRTI/y5OQrs5U9qEcsLcWqmn
 zQjhNcws1CySwI2zYgpWe9jpmppa41dsYguiBmAXosTwXqV0B+VxzsOuFsYEHM4SLbmz
 boVgsDQATUufm+/VX4p7ojXZcahoEOYjf6IAluuhirtEfpP+qf6FtguBxt4xWaSc78e2 yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vegn0jns0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Oct 2019 15:44:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C652D100038;
 Mon,  7 Oct 2019 15:44:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BA4502B8A5E;
 Mon,  7 Oct 2019 15:44:12 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 7 Oct 2019 15:44:12
 +0200
From: Alexandre Torgue <alexandre.torgue@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij
 <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 7 Oct 2019 15:44:08 +0200
Message-ID: <20191007134410.10337-2-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007134410.10337-1-alexandre.torgue@st.com>
References: <20191007134410.10337-1-alexandre.torgue@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-07_02:2019-10-07,2019-10-07 signatures=0
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/3] dt-bindings: arm: stm32: Add missing
	STM32 boards
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

This commit documents missing STM32 boards:

-STM32MCU: F429 disco/eval, F469-disco, F746 disco/eval, F769 disco,
H743 disco/eval.

-STM32MPU: MP157 dk1/dk2/ed1/ev1.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 4d194f1eb03a..1fcf306bd2d1 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -13,19 +13,38 @@ properties:
   compatible:
     oneOf:
       - items:
+          - enum:
+              - st,stm32f429i-disco
+              - st,stm32429i-eval
           - const: st,stm32f429
-
       - items:
+          - enum:
+              - st,stm32f469i-disco
           - const: st,stm32f469
-
       - items:
+          - enum:
+              - st,stm32f746-disco
+              - st,stm32746g-eval
           - const: st,stm32f746
-
       - items:
+          - enum:
+              - st,stm32f769-disco
+          - const: st,stm32f769
+      - items:
+          - enum:
+              - st,stm32h743i-disco
+              - st,stm32h743i-eval
           - const: st,stm32h743
-
       - items:
           - enum:
               - arrow,stm32mp157a-avenger96 # Avenger96
+              - st,stm32mp157c-ed1
+              - st,stm32mp157a-dk1
+              - st,stm32mp157c-dk2
+
+          - const: st,stm32mp157
+      - items:
+          - const: st,stm32mp157c-ev1
+          - const: st,stm32mp157c-ed1
           - const: st,stm32mp157
 ...
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
