Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1625103D6F
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2019 15:41:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B27FAC36B0E;
	Wed, 20 Nov 2019 14:41:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D330DC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 14:41:23 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAKEbou8032246; Wed, 20 Nov 2019 15:41:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=dAq7R3H7IKdrtGpxINjpm51TQLi/qDTgGLAWiKNgOtg=;
 b=xCM6uEVbvBgfdGXouqffNH5nqGgCb+8t2r4IM8rFvnw/1YvIQ1mzX6WoT36OAGi2376t
 +DeO/uC1GVepTbke5K4s3/b4cirT/+CRY5K2rokxyowC6JCYX2seXoNy/qjlZiprs1wf
 /hk4S517xhZvb6QKiFtnUcbPtLKySWX850lU7n2ScRGjVzGHAqMul3omDac3ZZUNc4WD
 6enNSyQV0IQLAIEpnvEpxLbOJqLeg45cI2UGOFKV9YuYM/uVGjvTOQpMj/aWfm4/lltG
 fAWoBp/XaKA4YfMHTW0xK3Hl5KRnXUbJwjxQnnY4KO1CHyLS/n8GN0dNQraCYtY7hmjx 5w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wa9uvegqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 15:41:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EEA0710002A;
 Wed, 20 Nov 2019 15:41:12 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E153E2BE22E;
 Wed, 20 Nov 2019 15:41:12 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 20 Nov 2019 15:41:12
 +0100
From: Alexandre Torgue <alexandre.torgue@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, <arnd@arndb.de>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>
Date: Wed, 20 Nov 2019 15:41:05 +0100
Message-ID: <20191120144109.25321-3-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191120144109.25321-1-alexandre.torgue@st.com>
References: <20191120144109.25321-1-alexandre.torgue@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_04:2019-11-15,2019-11-20 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/6] ARM: dts: stm32: Update stm32mp157
	pinctrl files
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

In order to cover the STM32MP15 SOCs family this commit updates pinctrl
file names (group definition and packages files).
This family includes: STM32MP151, STM32MP153 and STM32MP157.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
similarity index 100%
rename from arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
rename to arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
index 628c74a45a25..2f6dd51e8506 100644
--- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
+++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
@@ -7,7 +7,8 @@
 /dts-v1/;
 
 #include "stm32mp157c.dtsi"
-#include "stm32mp157xac-pinctrl.dtsi"
+#include "stm32mp15-pinctrl.dtsi"
+#include "stm32mp15xxac-pinctrl.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/mfd/st,stpmic1.h>
 
diff --git a/arch/arm/boot/dts/stm32mp157a-dk1.dts b/arch/arm/boot/dts/stm32mp157a-dk1.dts
index 2f9f8cf94b02..7ee7b4d13d39 100644
--- a/arch/arm/boot/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/boot/dts/stm32mp157a-dk1.dts
@@ -7,7 +7,8 @@
 /dts-v1/;
 
 #include "stm32mp157c.dtsi"
-#include "stm32mp157xac-pinctrl.dtsi"
+#include "stm32mp15-pinctrl.dtsi"
+#include "stm32mp15xxac-pinctrl.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/mfd/st,stpmic1.h>
 
diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
index 341fb6064447..e5d8da01aaef 100644
--- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
@@ -6,7 +6,8 @@
 /dts-v1/;
 
 #include "stm32mp157c.dtsi"
-#include "stm32mp157xaa-pinctrl.dtsi"
+#include "stm32mp15-pinctrl.dtsi"
+#include "stm32mp15xxaa-pinctrl.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/mfd/st,stpmic1.h>
 
diff --git a/arch/arm/boot/dts/stm32mp157xaa-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157xaa-pinctrl.dtsi
deleted file mode 100644
index 875adf5e1e30..000000000000
--- a/arch/arm/boot/dts/stm32mp157xaa-pinctrl.dtsi
+++ /dev/null
@@ -1,90 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@st.com>
- */
-
-#include "stm32mp157-pinctrl.dtsi"
-/ {
-	soc {
-		pinctrl: pin-controller@50002000 {
-			st,package = <STM32MP_PKG_AA>;
-
-			gpioa: gpio@50002000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 0 16>;
-			};
-
-			gpiob: gpio@50003000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 16 16>;
-			};
-
-			gpioc: gpio@50004000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 32 16>;
-			};
-
-			gpiod: gpio@50005000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 48 16>;
-			};
-
-			gpioe: gpio@50006000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 64 16>;
-			};
-
-			gpiof: gpio@50007000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 80 16>;
-			};
-
-			gpiog: gpio@50008000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 96 16>;
-			};
-
-			gpioh: gpio@50009000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 112 16>;
-			};
-
-			gpioi: gpio@5000a000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 128 16>;
-			};
-
-			gpioj: gpio@5000b000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 144 16>;
-			};
-
-			gpiok: gpio@5000c000 {
-				status = "okay";
-				ngpios = <8>;
-				gpio-ranges = <&pinctrl 0 160 8>;
-			};
-		};
-
-		pinctrl_z: pin-controller-z@54004000 {
-			st,package = <STM32MP_PKG_AA>;
-
-			gpioz: gpio@54004000 {
-				status = "okay";
-				ngpios = <8>;
-				gpio-ranges = <&pinctrl_z 0 400 8>;
-			};
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/stm32mp157xab-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157xab-pinctrl.dtsi
deleted file mode 100644
index 961fa12a59c3..000000000000
--- a/arch/arm/boot/dts/stm32mp157xab-pinctrl.dtsi
+++ /dev/null
@@ -1,62 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@st.com>
- */
-
-#include "stm32mp157-pinctrl.dtsi"
-/ {
-	soc {
-		pinctrl: pin-controller@50002000 {
-			st,package = <STM32MP_PKG_AB>;
-
-			gpioa: gpio@50002000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 0 16>;
-			};
-
-			gpiob: gpio@50003000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 16 16>;
-			};
-
-			gpioc: gpio@50004000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 32 16>;
-			};
-
-			gpiod: gpio@50005000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 48 16>;
-			};
-
-			gpioe: gpio@50006000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 64 16>;
-			};
-
-			gpiof: gpio@50007000 {
-				status = "okay";
-				ngpios = <6>;
-				gpio-ranges = <&pinctrl 6 86 6>;
-			};
-
-			gpiog: gpio@50008000 {
-				status = "okay";
-				ngpios = <10>;
-				gpio-ranges = <&pinctrl 6 102 10>;
-			};
-
-			gpioh: gpio@50009000 {
-				status = "okay";
-				ngpios = <2>;
-				gpio-ranges = <&pinctrl 0 112 2>;
-			};
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/stm32mp157xac-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157xac-pinctrl.dtsi
deleted file mode 100644
index 26600f188d25..000000000000
--- a/arch/arm/boot/dts/stm32mp157xac-pinctrl.dtsi
+++ /dev/null
@@ -1,78 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@st.com>
- */
-
-#include "stm32mp157-pinctrl.dtsi"
-/ {
-	soc {
-		pinctrl: pin-controller@50002000 {
-			st,package = <STM32MP_PKG_AC>;
-
-			gpioa: gpio@50002000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 0 16>;
-			};
-
-			gpiob: gpio@50003000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 16 16>;
-			};
-
-			gpioc: gpio@50004000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 32 16>;
-			};
-
-			gpiod: gpio@50005000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 48 16>;
-			};
-
-			gpioe: gpio@50006000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 64 16>;
-			};
-
-			gpiof: gpio@50007000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 80 16>;
-			};
-
-			gpiog: gpio@50008000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 96 16>;
-			};
-
-			gpioh: gpio@50009000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 112 16>;
-			};
-
-			gpioi: gpio@5000a000 {
-				status = "okay";
-				ngpios = <12>;
-				gpio-ranges = <&pinctrl 0 128 12>;
-			};
-		};
-
-		pinctrl_z: pin-controller-z@54004000 {
-			st,package = <STM32MP_PKG_AC>;
-
-			gpioz: gpio@54004000 {
-				status = "okay";
-				ngpios = <8>;
-				gpio-ranges = <&pinctrl_z 0 400 8>;
-			};
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/stm32mp157xad-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157xad-pinctrl.dtsi
deleted file mode 100644
index 910113f3e69a..000000000000
--- a/arch/arm/boot/dts/stm32mp157xad-pinctrl.dtsi
+++ /dev/null
@@ -1,62 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@st.com>
- */
-
-#include "stm32mp157-pinctrl.dtsi"
-/ {
-	soc {
-		pinctrl: pin-controller@50002000 {
-			st,package = <STM32MP_PKG_AD>;
-
-			gpioa: gpio@50002000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 0 16>;
-			};
-
-			gpiob: gpio@50003000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 16 16>;
-			};
-
-			gpioc: gpio@50004000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 32 16>;
-			};
-
-			gpiod: gpio@50005000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 48 16>;
-			};
-
-			gpioe: gpio@50006000 {
-				status = "okay";
-				ngpios = <16>;
-				gpio-ranges = <&pinctrl 0 64 16>;
-			};
-
-			gpiof: gpio@50007000 {
-				status = "okay";
-				ngpios = <6>;
-				gpio-ranges = <&pinctrl 6 86 6>;
-			};
-
-			gpiog: gpio@50008000 {
-				status = "okay";
-				ngpios = <10>;
-				gpio-ranges = <&pinctrl 6 102 10>;
-			};
-
-			gpioh: gpio@50009000 {
-				status = "okay";
-				ngpios = <2>;
-				gpio-ranges = <&pinctrl 0 112 2>;
-			};
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/stm32mp15xxaa-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15xxaa-pinctrl.dtsi
new file mode 100644
index 000000000000..04f7a43ad66f
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp15xxaa-pinctrl.dtsi
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@st.com> for STMicroelectronics.
+ */
+
+&pinctrl {
+	st,package = <STM32MP_PKG_AA>;
+
+	gpioa: gpio@50002000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 0 16>;
+	};
+
+	gpiob: gpio@50003000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 16 16>;
+	};
+
+	gpioc: gpio@50004000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 32 16>;
+	};
+
+	gpiod: gpio@50005000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 48 16>;
+	};
+
+	gpioe: gpio@50006000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 64 16>;
+	};
+
+	gpiof: gpio@50007000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 80 16>;
+	};
+
+	gpiog: gpio@50008000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 96 16>;
+	};
+
+	gpioh: gpio@50009000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 112 16>;
+	};
+
+	gpioi: gpio@5000a000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 128 16>;
+	};
+
+	gpioj: gpio@5000b000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 144 16>;
+	};
+
+	gpiok: gpio@5000c000 {
+		status = "okay";
+		ngpios = <8>;
+		gpio-ranges = <&pinctrl 0 160 8>;
+	};
+};
+
+&pinctrl_z {
+	st,package = <STM32MP_PKG_AA>;
+
+	gpioz: gpio@54004000 {
+		status = "okay";
+		ngpios = <8>;
+		gpio-ranges = <&pinctrl_z 0 400 8>;
+	};
+};
diff --git a/arch/arm/boot/dts/stm32mp15xxab-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15xxab-pinctrl.dtsi
new file mode 100644
index 000000000000..328dad140e9b
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp15xxab-pinctrl.dtsi
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@st.com> for STMicroelectronics.
+ */
+
+&pinctrl {
+	st,package = <STM32MP_PKG_AB>;
+
+	gpioa: gpio@50002000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 0 16>;
+	};
+
+	gpiob: gpio@50003000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 16 16>;
+	};
+
+	gpioc: gpio@50004000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 32 16>;
+	};
+
+	gpiod: gpio@50005000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 48 16>;
+	};
+
+	gpioe: gpio@50006000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 64 16>;
+	};
+
+	gpiof: gpio@50007000 {
+		status = "okay";
+		ngpios = <6>;
+		gpio-ranges = <&pinctrl 6 86 6>;
+	};
+
+	gpiog: gpio@50008000 {
+		status = "okay";
+		ngpios = <10>;
+		gpio-ranges = <&pinctrl 6 102 10>;
+	};
+
+	gpioh: gpio@50009000 {
+		status = "okay";
+		ngpios = <2>;
+		gpio-ranges = <&pinctrl 0 112 2>;
+	};
+};
diff --git a/arch/arm/boot/dts/stm32mp15xxac-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15xxac-pinctrl.dtsi
new file mode 100644
index 000000000000..7eaa245f44db
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp15xxac-pinctrl.dtsi
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@st.com> for STMicroelectronics.
+ */
+
+&pinctrl {
+	st,package = <STM32MP_PKG_AC>;
+
+	gpioa: gpio@50002000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 0 16>;
+	};
+
+	gpiob: gpio@50003000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 16 16>;
+	};
+
+	gpioc: gpio@50004000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 32 16>;
+	};
+
+	gpiod: gpio@50005000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 48 16>;
+	};
+
+	gpioe: gpio@50006000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 64 16>;
+	};
+
+	gpiof: gpio@50007000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 80 16>;
+	};
+
+	gpiog: gpio@50008000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 96 16>;
+	};
+
+	gpioh: gpio@50009000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 112 16>;
+	};
+
+	gpioi: gpio@5000a000 {
+		status = "okay";
+		ngpios = <12>;
+		gpio-ranges = <&pinctrl 0 128 12>;
+	};
+};
+
+&pinctrl_z {
+	st,package = <STM32MP_PKG_AC>;
+
+	gpioz: gpio@54004000 {
+		status = "okay";
+		ngpios = <8>;
+		gpio-ranges = <&pinctrl_z 0 400 8>;
+	};
+};
diff --git a/arch/arm/boot/dts/stm32mp15xxad-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15xxad-pinctrl.dtsi
new file mode 100644
index 000000000000..b63e207de216
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp15xxad-pinctrl.dtsi
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@st.com> for STMicroelectronics.
+ */
+
+&pinctrl {
+	st,package = <STM32MP_PKG_AD>;
+
+	gpioa: gpio@50002000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 0 16>;
+	};
+
+	gpiob: gpio@50003000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 16 16>;
+	};
+
+	gpioc: gpio@50004000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 32 16>;
+	};
+
+	gpiod: gpio@50005000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 48 16>;
+	};
+
+	gpioe: gpio@50006000 {
+		status = "okay";
+		ngpios = <16>;
+		gpio-ranges = <&pinctrl 0 64 16>;
+	};
+
+	gpiof: gpio@50007000 {
+		status = "okay";
+		ngpios = <6>;
+		gpio-ranges = <&pinctrl 6 86 6>;
+	};
+
+	gpiog: gpio@50008000 {
+		status = "okay";
+		ngpios = <10>;
+		gpio-ranges = <&pinctrl 6 102 10>;
+	};
+
+	gpioh: gpio@50009000 {
+		status = "okay";
+		ngpios = <2>;
+		gpio-ranges = <&pinctrl 0 112 2>;
+	};
+};
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
