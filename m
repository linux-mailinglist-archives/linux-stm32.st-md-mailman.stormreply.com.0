Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 646D835E52B
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Apr 2021 19:40:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04BDEC58D65;
	Tue, 13 Apr 2021 17:40:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF4CCC57B7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 17:40:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DHVRM1008843; Tue, 13 Apr 2021 19:40:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=kWKeujSJDhbX3k9cwpPH58goeXuXklCREiTzjebN1Ak=;
 b=eWkv/UYtPc1/vrtNjhpJNMxuaXHgi7v9SWAhEM2ltVtv23tbi4lHv5yiUiz56kzwlOVl
 FFjjxlOBGbKqYvecTUofapwu7Uk7Lr18SQH0p4HapLR5Pd3FNFGEQiUHtm8QmEU8iPm8
 XqReyGkV/CjMz4D43VJ8ni59vzVdJCEtnNPjCgLNkOsrB8lMk6jWPSf3vz95Y7laSSUa
 287Bzl+xavxfChdhdd+z/LfyMcY6hNkYndwsxNEyBAYNdhJEjrxwyskbUtaW29WMBAg/
 agqnflEi4f4/qhbtmbprvn83a1xh4Q+00CWB/ldZAT+OILS9QCY/BdX9NDRUW8YgxJY8 LQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37vu4e66ab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 19:40:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3BDB1100034;
 Tue, 13 Apr 2021 19:40:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2B0842159E9;
 Tue, 13 Apr 2021 19:40:21 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Apr 2021 19:40:20
 +0200
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 13 Apr 2021 19:40:12 +0200
Message-ID: <20210413174015.23011-2-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210413174015.23011-1-erwan.leray@foss.st.com>
References: <20210413174015.23011-1-erwan.leray@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_12:2021-04-13,
 2021-04-13 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/4] dt-bindings: serial: add RX and TX
	FIFO properties
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

Add two optional DT properties to configure RX and TX FIFO thresholds:
- rx-threshold
- tx-threshold

Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>

diff --git a/Documentation/devicetree/bindings/serial/serial.yaml b/Documentation/devicetree/bindings/serial/serial.yaml
index 65e75d040521..f368d58e8086 100644
--- a/Documentation/devicetree/bindings/serial/serial.yaml
+++ b/Documentation/devicetree/bindings/serial/serial.yaml
@@ -75,6 +75,16 @@ properties:
     type: boolean
     description: CTS and RTS pins are swapped.
 
+  rx-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      RX FIFO threshold configuration (in bytes).
+
+  tx-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      TX FIFO threshold configuration (in bytes).
+
 if:
   required:
     - uart-has-rtscts
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
