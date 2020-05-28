Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A16671E58FC
	for <lists+linux-stm32@lfdr.de>; Thu, 28 May 2020 09:40:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CAB6C36B24;
	Thu, 28 May 2020 07:40:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB520C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 May 2020 07:40:45 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04S7cAEX017154; Thu, 28 May 2020 09:40:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Q6db3X4dxlS6qvbPYnAd4zoz3ZPexCGcUlqOVKKA23Y=;
 b=d+DaxTMYvTbZuT6fZyjSUcTz5PoZtDYJG48aWsK/MFwcMCeuMwnIyzdp/7qUND6kNEC5
 Vj3hhgBXtvUc3Xe2jM85cCD5dUF6SLAitDWnEj+tdkbsTL+7tZK7yypraJvX/wGp7f7r
 nuHe1pual3eJQMRfLwn/yMcOIybvNfvlUeN6WdH7rR8DHwWi5QG1FX5fiWwOfinnDmY1
 Ommiu4wH3XpvDh8hikpLCa0lpkNqW/wXRR26T9Qisn3FK5PAa6+0I12e84RgsZlJ2zLU
 UAqHG0ePhHvDz6PFQZle/fBhnE8oiVOFPV/FHkmvJTnbnOk/vHmvArUIQ4UUcE6Grdgk EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 316sa29wwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 May 2020 09:40:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C9CB2100034;
 Thu, 28 May 2020 09:40:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BDC7B2B188D;
 Thu, 28 May 2020 09:40:36 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 28 May 2020 09:40:36
 +0200
From: Erwan Le Ray <erwan.leray@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
Date: Thu, 28 May 2020 09:40:29 +0200
Message-ID: <20200528074029.24962-6-erwan.leray@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200528074029.24962-1-erwan.leray@st.com>
References: <20200528074029.24962-1-erwan.leray@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-28_02:2020-05-28,
 2020-05-27 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 5/5] ARM: dts: stm32: add usart2 node to
	stm32mp157c-dk2
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

Adds the usart2 node to stm32mp157c-dk2 board. usart2 pins are connected
to Bluetooth component. usart2 is disabled by default.

Signed-off-by: Erwan Le Ray <erwan.leray@st.com>

diff --git a/arch/arm/boot/dts/stm32mp157c-dk2.dts b/arch/arm/boot/dts/stm32mp157c-dk2.dts
index ffbae4a8753d..045636555ddd 100644
--- a/arch/arm/boot/dts/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/stm32mp157c-dk2.dts
@@ -21,6 +21,7 @@
 		serial0 = &uart4;
 		serial1 = &usart3;
 		serial2 = &uart7;
+		serial3 = &usart2;
 	};
 
 	chosen {
@@ -86,3 +87,11 @@
 		};
 	};
 };
+
+&usart2 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&usart2_pins_c>;
+	pinctrl-1 = <&usart2_sleep_pins_c>;
+	pinctrl-2 = <&usart2_idle_pins_c>;
+	status = "disabled";
+};
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
