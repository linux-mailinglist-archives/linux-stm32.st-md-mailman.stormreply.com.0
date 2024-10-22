Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 199659AB305
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Oct 2024 17:59:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0718C78033;
	Tue, 22 Oct 2024 15:59:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FCACC78034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 15:59:54 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MFFZ1j000777;
 Tue, 22 Oct 2024 17:59:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 mH466ITeHHX+vgZl8o4SmPtSbhyJZCD2fmPHFvd4rX4=; b=CgBTAuIljFwTbzPP
 GMtieHZkLVehqlOo6L2ZwYxmiVE172eqVh/vpEB1Ct+383ZMQqYMgBBV1Ijqvv8s
 R0DSv9R67bPY42vqgkM0J21OirhmAn1nZtfZy0+VSi0mNtwfhtiO0Yq3/C+TF1Pm
 jvUE7Ul5/ageua/vay1pv04P/4VQWNSczCaLilVEfeUEOW3BABkAT30wAYnR9KVG
 W0ZeKBzPDJvxbL4Jh2AiIWEyW5dj5Y06HRfMeJE7RjpwHxkSRlTZAkZt0W+d+9EW
 jL5PI+65M5p9l7PJ3BNK/95Yhjad+N+pcQIPO0lrYQjhZuX8I8x7fpTWAdPLU3SM
 N5iRIQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42eehmr588-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Oct 2024 17:59:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1DEC540060;
 Tue, 22 Oct 2024 17:58:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 83E8326E85D;
 Tue, 22 Oct 2024 17:57:31 +0200 (CEST)
Received: from localhost (10.48.87.33) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 22 Oct
 2024 17:57:31 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Date: Tue, 22 Oct 2024 17:56:51 +0200
Message-ID: <20241022155658.1647350-8-antonio.borneo@foss.st.com>
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
Subject: [Linux-stm32] [PATCH 07/14] dt-bindings: pinctrl: stm32: support IO
	synchronization parameters
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

Support the following IO synchronization parameters:
- Delay (in ns)
- Delay path (input / output)
- Clock edge (single / double edge)
- Clock inversion
- Retiming

Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 .../bindings/pinctrl/st,stm32-pinctrl.yaml    | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 5d17d6487ae9c..9a7ecfea6eb5b 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -207,6 +207,54 @@ patternProperties:
               3: High speed
             $ref: /schemas/types.yaml#/definitions/uint32
             enum: [0, 1, 2, 3]
+          st,io-delay-path:
+            description: |
+              IO synchronization delay path location
+              0: Delay switched into the output path
+              1: Delay switched into the input path
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1]
+          st,io-clk-edge:
+            description: |
+              IO synchronization clock edge
+              0: Data single-edge (changing on rising or falling clock edge)
+              1: Data double-edge (changing on both clock edges)
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1]
+          st,io-clk-type:
+            description: |
+              IO synchronization clock inversion
+              0: IO clocks not inverted. Data retimed to rising clock edge
+              1: IO clocks inverted. Data retimed to falling clock edge
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1]
+          st,io-retime:
+            description: |
+              IO synchronization data retime
+              0: Data not synchronized or retimed on clock edges
+              1: Data retimed to either rising or falling clock edge
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1]
+          st,io-delay:
+            description: |
+              IO synchronization delay applied to the input or output path
+              0: No delay
+              1: Delay 0.30 ns
+              2: Delay 0.50 ns
+              3: Delay 0.75 ns
+              4: Delay 1.00 ns
+              5: Delay 1.25 ns
+              6: Delay 1.50 ns
+              7: Delay 1.75 ns
+              8: Delay 2.00 ns
+              9: Delay 2.25 ns
+              10: Delay 2.50 ns
+              11: Delay 2.75 ns
+              12: Delay 3.00 ns
+              13: Delay 3.25 ns
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 13
 
         required:
           - pinmux
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
