Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6D39AB308
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Oct 2024 18:00:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02D43C78027;
	Tue, 22 Oct 2024 16:00:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F9EEC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 15:59:59 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MBNiUP018501;
 Tue, 22 Oct 2024 17:59:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 s+4tJKgU5xujLkFlGGZK8pWZQRZyTK+On7t7iOcSAk8=; b=MUEZ6dY20n5N+Pj4
 lVQGdHK217qmqCoEW+dlYYsQd4uMy529UtjSOiUYbKNNWzN8baHq2mKTrByV2RDe
 wM5KcZlXaJOn9HRMFDN8UxF4F5eM8kWxVHvbMx8fmRWsXGMBYCGAx++x7hWriSId
 D8dqUIzwpaX/4YGH7ryRpDvEv1U2SO6fHmwAeXwW1bD3YskN7wWT+Obdb0s97YCh
 i5hL6NmgOa+jrM5CPVC4OoGxCSsnNsAGiXhhEtQ9ZXIyODL1BohFwnK8kTefN9WI
 qh4doBjLCpfXINvjcI0kurRbVJcMS27+Y4hSwirtnHTqIX2Tq6yFlvz9+Lfr4/+b
 VGQLig==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42cpb0v8k8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Oct 2024 17:59:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 037A140051;
 Tue, 22 Oct 2024 17:58:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D2DB326E844;
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
Date: Tue, 22 Oct 2024 17:56:48 +0200
Message-ID: <20241022155658.1647350-5-antonio.borneo@foss.st.com>
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
Subject: [Linux-stm32] [PATCH 04/14] dt-bindings: pinctrl: stm32: add RSVD
	mux function
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

Document the RSVD (Reserved) mux function, used to reserve pins
for a coprocessor not running Linux.

Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml     | 8 ++++++++
 include/dt-bindings/pinctrl/stm32-pinfunc.h               | 1 +
 2 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index a28d77748095a..5d17d6487ae9c 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -160,9 +160,13 @@ patternProperties:
               * ...
               * 16 : Alternate Function 15
               * 17 : Analog
+              * 18 : Reserved
               To simplify the usage, macro is available to generate "pinmux" field.
               This macro is available here:
                 - include/dt-bindings/pinctrl/stm32-pinfunc.h
+              Setting the pinmux's function to the Reserved (RSVD) value is used to inform
+              the driver that it shall not apply the mux setting. This can be used to
+              reserve some pins, for example to a co-processor not running Linux.
               Some examples of using macro:
                /* GPIO A9 set as alternate function 2 */
                ... {
@@ -176,6 +180,10 @@ patternProperties:
                ... {
                           pinmux = <STM32_PINMUX('A', 9, ANALOG)>;
                };
+               /* GPIO A9 reserved for co-processor */
+               ... {
+                          pinmux = <STM32_PINMUX('A', 9, RSVD)>;
+               };
 
           bias-disable:
             type: boolean
diff --git a/include/dt-bindings/pinctrl/stm32-pinfunc.h b/include/dt-bindings/pinctrl/stm32-pinfunc.h
index 28ad0235086a6..af3fd388329a0 100644
--- a/include/dt-bindings/pinctrl/stm32-pinfunc.h
+++ b/include/dt-bindings/pinctrl/stm32-pinfunc.h
@@ -26,6 +26,7 @@
 #define AF14	0xf
 #define AF15	0x10
 #define ANALOG	0x11
+#define RSVD	0x12
 
 /* define Pins number*/
 #define PIN_NO(port, line)	(((port) - 'A') * 0x10 + (line))
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
