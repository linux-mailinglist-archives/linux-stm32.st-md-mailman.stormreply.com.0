Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 687B55F559D
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Oct 2022 15:37:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32C10C65043;
	Wed,  5 Oct 2022 13:37:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2DBFC65040
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Oct 2022 13:37:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 295Cu6cr022266;
 Wed, 5 Oct 2022 15:37:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=sfe+c3z4CBqQvUGfg0kmIxD0Kl5h3efDT5pi0QvUkhA=;
 b=ENeq2z932m2fhlp6vkxBs336ZVnorO1WEiE0RkNA02RxZ1viMqldHMBHqp0AUWz4wpyZ
 W0EWAW44IIJRM+ob4iM7vO64eNUKhTlzs54OdyBnXTosKpfrSWwJw9GCk4BbRliV/NCu
 9wPujkoJlDGEhiSJJZVhqGgUzFPlnPp5TvUCIJcvf5bZHF121baVrmopwmvL8sRDYyCA
 CtHNk/+eo7Q+k+sRxDdPsCCue6CJMSSBIE3Do9tQb8caWAtg03upz/CYaxugnVYDxSiS
 OBQ1TjSeXqaavmFEybG9sM3IVnd+NvYWs0gzrVjAUE+leJBnhkLsBXcX9g0kzNvfIIIu bA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jxapc7s4j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Oct 2022 15:37:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9415410003D;
 Wed,  5 Oct 2022 15:37:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8FB3022A6C3;
 Wed,  5 Oct 2022 15:37:08 +0200 (CEST)
Received: from localhost (10.75.127.119) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Wed, 5 Oct
 2022 15:37:08 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, <nuno.sa@analog.com>, Olivier
 Moysan <olivier.moysan@foss.st.com>, Paul Cercueil <paul@crapouillou.net>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Wan Jiabing
 <wanjiabing@vivo.com>, Yannick Brosseau <yannick.brosseau@gmail.com>
Date: Wed, 5 Oct 2022 15:31:19 +0200
Message-ID: <20221005133120.50483-8-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221005133120.50483-1-olivier.moysan@foss.st.com>
References: <20221005133120.50483-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.119]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-05_03,2022-10-05_01,2022-06-22_01
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 7/8] ARM: dts: stm32: add dummy vdd_adc
	regulator on stm32mp135f-dk
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

Add a dummy fixed regulator vdd-adc for STM32 ADC,
on STM32MP135F-DK board, while SCMI regulators are not available.
This patch will have to be removed when SCMI regulator support
is added to STM32MP13.

This patch intends to allow ADC enabling on STM32MP13.
With this patch the ADC can probe but it cannot return
valid conversion data, as it's regulator is not actually enabled.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 arch/arm/boot/dts/stm32mp135f-dk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp135f-dk.dts b/arch/arm/boot/dts/stm32mp135f-dk.dts
index e6b8ffd332c7..95068231ed57 100644
--- a/arch/arm/boot/dts/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/stm32mp135f-dk.dts
@@ -66,6 +66,14 @@ vdd_sd: vdd-sd {
 		regulator-max-microvolt = <2900000>;
 		regulator-always-on;
 	};
+
+	vdd_adc: vdd-adc {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_adc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 &iwdg2 {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
