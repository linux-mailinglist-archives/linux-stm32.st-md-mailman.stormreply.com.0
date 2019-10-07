Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09578CE3F8
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2019 15:44:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 861E6C36B0C;
	Mon,  7 Oct 2019 13:44:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E08DC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2019 13:44:28 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x97DaVoh022431; Mon, 7 Oct 2019 15:44:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ommXzVZDdDLmTcqjfffVTpYKbCoE51X3qzTVTHyEIOE=;
 b=fVAZRd1JuL2hng/tkR3VuQi7SZve5FiHkxnog+GRlTDojjznfGzUUhaDdzpyVO9F+Ts8
 cfdsuvOgth1lhpryfxq9bHf9TRL71Tu2YIFlIvtnoOINjM3h8u/Vhv/Qkl3ZEYp/N3sS
 v+ZMcOQmZ5NV4ztb4AnOHDGTmswawn/7TVXtCeyioq3IeBqZWuBtHmg+xawY05Uq+Q+z
 xlHsb0UbqFgL9CheHQC1L5QjXJtc5e3iee4ZxWyrUiUGa3JJUmDCGS1MsU02SBF0/Qdo
 rmgwAsG9MFtfn04dO7mm/iOf6+ydmQUNgI1tzCS/Kg64gCw84PqKxqOEZeNtFjwJ6xHt IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vegn0jns4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Oct 2019 15:44:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6E920100034;
 Mon,  7 Oct 2019 15:44:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 628942B8A5E;
 Mon,  7 Oct 2019 15:44:13 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 7 Oct 2019 15:44:13
 +0200
From: Alexandre Torgue <alexandre.torgue@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij
 <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 7 Oct 2019 15:44:09 +0200
Message-ID: <20191007134410.10337-3-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007134410.10337-1-alexandre.torgue@st.com>
References: <20191007134410.10337-1-alexandre.torgue@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-07_02:2019-10-07,2019-10-07 signatures=0
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/3] dt-bindings: pinctrl: stm32: Fix 'st,
	syscfg' description field
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

As there is only one item "st,syscfg" this commit moves phandle description
fields under "description" tag. It'll fix a validation issue seen  during
stm32 DT check.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 400df2da018a..754ea7ab040a 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -40,10 +40,9 @@ properties:
     allOf:
       - $ref: "/schemas/types.yaml#/definitions/phandle-array"
     description: Should be phandle/offset/mask
-    items:
-      - description: Phandle to the syscon node which includes IRQ mux selection.
-      - description: The offset of the IRQ mux selection register.
-      - description: The field mask of IRQ mux, needed if different of 0xf.
+      - Phandle to the syscon node which includes IRQ mux selection.
+      - The offset of the IRQ mux selection register.
+      - The field mask of IRQ mux, needed if different of 0xf.
 
   st,package:
     allOf:
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
