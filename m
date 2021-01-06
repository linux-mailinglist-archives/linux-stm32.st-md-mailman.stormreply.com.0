Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA872EC10D
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Jan 2021 17:23:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EABABC5718D;
	Wed,  6 Jan 2021 16:23:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB787C5718B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Jan 2021 16:23:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 106GHiXP020605; Wed, 6 Jan 2021 17:23:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=vp88p8KyitfwADSy57b/zoCsXgauvQnAD8bJDD3BjRw=;
 b=QSZHZGDhFogPoMRhUV7MALXD2qBx32r2prC/dnX7Flh2nG93t6Cc5bUyvtZEgL+0Kz4x
 XvGxjc242OaP8Gd6WHWuPNekA0AhYAr4ESctajBImbhfG++tLF96Hj02UvNOm9PtcObA
 XZ14GmfEbQKU5UGwYvuDT2KxkkYnKDrOIoRJEOz91wfY3sh7wN4Im4EzxzhrdDry9Mdb
 9wqXJJ5jjKf9VvJQC/Bd9rknxyhlneESYGttUNFxkk4403eRwHGU4j8tJYUUMr45G1tH
 u9VrY7HXJX2UkB/sh+kyY+PsdeAnQ46BA2T0WLroYx6+lHVuNLVSqenSQuduFEM5h/bv RA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35tgkn09f8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Jan 2021 17:23:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1FA17100034;
 Wed,  6 Jan 2021 17:23:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 14A2F2AD2C6;
 Wed,  6 Jan 2021 17:23:07 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 6 Jan 2021 17:23:06
 +0100
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 6 Jan 2021 17:22:00 +0100
Message-ID: <20210106162203.28854-6-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210106162203.28854-1-erwan.leray@foss.st.com>
References: <20210106162203.28854-1-erwan.leray@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-06_09:2021-01-06,
 2021-01-06 signatures=0
Cc: devicetree@vger.kernel.org, Valentin Caron <valentin.caron@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 5/8] dt-bindings: serial: stm32: update
	rts-gpios and cts-gpios
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

Update rts-gpios and cts-gpios:
- remove max-items as already defined in serial.yaml
- add a note describing rts-gpios and cts-gpios usage with stm32

Document the use of cts-gpios and rts-gpios for flow control in STM32 UART
controller. These properties can be used instead of 'uart-has-rtscts' or
'st,hw-flow-ctrl' (deprecated) for making use of any gpio pins for flow
control instead of dedicated pins.
It should be noted that both cts-gpios/rts-gpios and 'uart-has-rtscts' or
'st,hw-flow-ctrl' (deprecated) properties cannot co-exist in a design.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>

diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
index 06d5f251ec88..8631678283f9 100644
--- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
@@ -50,11 +50,14 @@ properties:
     minItems: 1
     maxItems: 2
 
-  cts-gpios:
-    maxItems: 1
-
-  rts-gpios:
-    maxItems: 1
+# cts-gpios and rts-gpios properties can be used instead of 'uart-has-rtscts'
+# or 'st,hw-flow-ctrl' (deprecated) for making use of any gpio pins for flow
+# control instead of dedicated pins.
+#
+# It should be noted that both cts-gpios/rts-gpios and 'uart-has-rtscts' or
+# 'st,hw-flow-ctrl' (deprecated) properties cannot co-exist in a design.
+  cts-gpios: true
+  rts-gpios: true
 
   wakeup-source: true
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
