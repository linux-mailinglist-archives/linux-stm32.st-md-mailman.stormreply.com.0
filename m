Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6585C2474
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Sep 2019 17:39:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A26DC36B0E;
	Mon, 30 Sep 2019 15:39:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7564AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2019 15:39:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8UFVeN2013300; Mon, 30 Sep 2019 17:39:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=rnzvoLapup62xEU3qg28JHDE/fN/lvzvSo1oUmE5lRo=;
 b=BT9GNjVTWL9NwDXsc+iHtjteGOu6IJ6hzEpVXmgpB7VGeWFF2ABx48aftHjMvr50l33X
 jYdUQ+ZixRsAnWCYyaeqZc44Db4zxblWKejI7DvCZv4BmcIkpuWyFf4H2OtVlcKy7wB+
 ba7YjuFq5VFsOMkYzoYzIreCiZF2W6tnIP/tmlOdwbG8sUilYfIrDxuKAgOhDNv/YpNt
 qaoqtzFnZY4KWDxtkoNrJdmqmviPg85c1gZOxFxDkUDhOgZiXlEMGG8wV7Gg3/FKf+Dt
 sFboJc/Pi24f5nhrQR4Jtl1bAOGjoStp+IC0krglyvs5aWbQuAH8xlSkTD13nfBHTQEw sw== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2v9vna47sj-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 30 Sep 2019 17:39:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3EFF44B;
 Mon, 30 Sep 2019 15:39:41 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 999282A45FB;
 Mon, 30 Sep 2019 17:39:40 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.92) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 30 Sep
 2019 17:39:40 +0200
Received: from localhost (10.48.0.192) by Webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0;
 Mon, 30 Sep 2019 17:39:39 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <thierry.reding@gmail.com>, <robh+dt@kernel.org>
Date: Mon, 30 Sep 2019 17:39:10 +0200
Message-ID: <1569857951-20007-2-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569857951-20007-1-git-send-email-fabrice.gasnier@st.com>
References: <1569857951-20007-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.192]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-30_09:2019-09-30,2019-09-30 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] dt-bindings: pwm-stm32: document pinctrl
	sleep state
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

Add documentation for pinctrl sleep state that can be used by
STM32 timers PWM.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 Documentation/devicetree/bindings/pwm/pwm-stm32.txt | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-stm32.txt b/Documentation/devicetree/bindings/pwm/pwm-stm32.txt
index a8690bf..f1620c1 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-stm32.txt
+++ b/Documentation/devicetree/bindings/pwm/pwm-stm32.txt
@@ -5,8 +5,9 @@ See ../mfd/stm32-timers.txt for details about the parent node.
 
 Required parameters:
 - compatible:		Must be "st,stm32-pwm".
-- pinctrl-names: 	Set to "default".
-- pinctrl-0: 		List of phandles pointing to pin configuration nodes for PWM module.
+- pinctrl-names: 	Set to "default". An additional "sleep" state can be
+			defined to set pins in sleep state when in low power.
+- pinctrl-n: 		List of phandles pointing to pin configuration nodes for PWM module.
 			For Pinctrl properties see ../pinctrl/pinctrl-bindings.txt
 - #pwm-cells:		Should be set to 3. This PWM chip uses the default 3 cells
 			bindings defined in pwm.txt.
@@ -32,7 +33,8 @@ Example:
 			compatible = "st,stm32-pwm";
 			#pwm-cells = <3>;
 			pinctrl-0	= <&pwm1_pins>;
-			pinctrl-names	= "default";
+			pinctrl-1	= <&pwm1_sleep_pins>;
+			pinctrl-names	= "default", "sleep";
 			st,breakinput = <0 1 5>;
 		};
 	};
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
