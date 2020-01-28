Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C95014B3ED
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jan 2020 13:07:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C257C36B0F;
	Tue, 28 Jan 2020 12:07:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2E18C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2020 12:07:28 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00SBwxaT024152; Tue, 28 Jan 2020 13:07:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=C7AAO6zphyKSqrFyCcSekCfN2SHSXIKo+cvASO06cUk=;
 b=gr/Du5GlMrJDOKcssO7m4lNInhEvmeGRJw8SzvtMH2tMkTDwEQ+W1tBRy2UJomQl4Tqn
 SC9CbbjzpJzlNLA5FalZqJnXjWQgD0zYGma6aAU1SBBLkb9JmfvAb417M5776PmJ7v8A
 7w1BgzUGW7zteYr3bX4rV3rAVvQ9CqAYJSbPFtGdfSsAwIPJb/rUPvWIW9bCTnCgn7Ul
 WplwVuBw9KeBGSr4oq8h0ug5jgRRPcWdGGLp0qfsrRZuorjuZrfOCLsVm4k1VjKcZj0v
 3u1hsJyA8Y+uia7qTWrDKP2efeDcgyukBj/+gfikomxekwUrMuOp9KQeAwbziDJSng/T 1Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrcaxwp97-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2020 13:07:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4383210003A;
 Tue, 28 Jan 2020 13:07:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2D9252A4D96;
 Tue, 28 Jan 2020 13:07:07 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 28 Jan 2020 13:07:06
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <daniel.lezcano@linaro.org>, <tglx@linutronix.de>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <linux@armlinux.org.uk>, <p.paillet@st.com>,
 <linus.walleij@linaro.org>
Date: Tue, 28 Jan 2020 13:07:01 +0100
Message-ID: <20200128120702.26166-2-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200128120702.26166-1-benjamin.gaignard@st.com>
References: <20200128120702.26166-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-28_03:2020-01-24,
 2020-01-28 signatures=0
Cc: devicetree@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 1/2] dt-bindings: mfd: Document STM32 low
	power clkevent bindings
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

Add a subnode to STM low power timer bindings to support clkevent driver

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 .../devicetree/bindings/mfd/st,stm32-lptimer.yaml          | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
index 1a4cc5f3fb33..535e0b40cdf9 100644
--- a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
@@ -81,6 +81,16 @@ patternProperties:
     required:
       - compatible
 
+  clkevent:
+    type: object
+
+    properties:
+      compatible:
+        const: st,stm32-clkevent-lp
+
+    required:
+      - compatible
+
 required:
   - "#address-cells"
   - "#size-cells"
@@ -115,6 +125,10 @@ examples:
       counter {
         compatible = "st,stm32-lptimer-counter";
       };
+
+      clkevent {
+        compatible = "st,stm32-clkevent-lp";
+      };
     };
 
 ...
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
