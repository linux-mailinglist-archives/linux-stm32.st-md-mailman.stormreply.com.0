Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5E5595B5
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2019 10:08:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7C4EC1634E;
	Fri, 28 Jun 2019 08:08:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27147C16349
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 08:08:54 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5S86alf020374; Fri, 28 Jun 2019 10:08:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=gFZXnm/IaqS/lZZLWx/8MO4ceDiguvcxpYNkcDkG8Ug=;
 b=qp4Sgh3yYx+734uYa/tXMJkd2VHu5EwyXbUwYK6jE0bxGk8yC2Jg8RPGpvyzbz6yY9Nm
 cFnc8mY/tREV9GegKQs/NCTnpN8/UTBbMGjRCCBfwzvJqs0/nkvLJNFbSwPX3vnQ3o2b
 /4idjguob/2pM3tqrPR9GlRCRgUjx7kSWeG0FCratSR5bQedwC+5fo29+vdssxCW/u/i
 Mhxxsk8MTzKXshN9dCReKg6PlExiZaEMulEi6GpWNs03I9bjsBrvrFIrHiwcS9K6is+g
 WW4oWmdSZXfSexmlfg0SLvgys1D6J94vCqpw7Ifu+DhEXT34n1dBT8lXW0ibmbbUZmq6 PA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t9d2gvcwt-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 28 Jun 2019 10:08:15 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3211834;
 Fri, 28 Jun 2019 08:08:15 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 057B416AF;
 Fri, 28 Jun 2019 08:08:15 +0000 (GMT)
Received: from localhost (10.75.127.47) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 28 Jun 2019 10:08:14 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <alexandre.torgue@st.com>
Date: Fri, 28 Jun 2019 10:08:06 +0200
Message-ID: <1561709289-11174-2-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561709289-11174-1-git-send-email-fabrice.gasnier@st.com>
References: <1561709289-11174-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-28_03:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/4] dt-bindings: regulator: add support for
	the stm32-booster
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

Document the 3.3V booster regulator embedded in stm32h7 and stm32mp1
devices, that can be used to supply ADC analog input switches.
It's controlled by using system configuration registers (SYSCFG).
Introduce two compatibles as the booster regulator is controlled by:
- a unique register/bit in STM32H7
- a set/clear register pair in STM32MP1

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 .../devicetree/bindings/regulator/st,stm32-booster.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/st,stm32-booster.txt

diff --git a/Documentation/devicetree/bindings/regulator/st,stm32-booster.txt b/Documentation/devicetree/bindings/regulator/st,stm32-booster.txt
new file mode 100644
index 0000000..479ad4c
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/st,stm32-booster.txt
@@ -0,0 +1,18 @@
+STM32 BOOSTER - Booster for ADC analog input switches
+
+Some STM32 devices embed a 3.3V booster supplied by Vdda, that can be used
+to supply ADC analog input switches.
+
+Required properties:
+- compatible: Should be one of:
+  "st,stm32h7-booster"
+  "st,stm32mp1-booster"
+- st,syscfg: Phandle to system configuration controller.
+- vdda-supply: Phandle to the vdda input analog voltage.
+
+Example:
+	booster: regulator-booster {
+		compatible = "st,stm32mp1-booster";
+		st,syscfg = <&syscfg>;
+		vdda-supply = <&vdda>;
+	};
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
