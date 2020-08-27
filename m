Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF76253EDA
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 09:21:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E2EFC3FAD9;
	Thu, 27 Aug 2020 07:21:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF789C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 07:21:30 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07R7Ho8j013608; Thu, 27 Aug 2020 09:21:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=9bTCitwnBAltRZQ7gOYLHIo8QHxlqk1VrxB1btIyl3k=;
 b=SZltyI84G5I3H89Zdo7KZ/TXsfPszKhCDxsNzPo5pVtE6yxVAOo1aNf45b7GHE6b/ZJQ
 3ko/Hyx+2Ghn4Iv4Yx7006IPxHHOFxdCLpbJwcWe4MP/vJHmancbJGKftoMk3w4p8T2L
 nQXlH9ugTxMfZGyIR5T/nEfa9Ps9WvEJFt820mjWeqfSEbH+xsTceHiQCc3T+ngioGhp
 h8vfNSV0jymM/30WYOgci71fFvx7R7I+oFhhorZ+BNy8z9uo47nzyLygac9F/YqcdeW2
 TMBj1kp41XelvDEREmqZus7i5zJaVwmWxaG5iGuy1QceWn6ZFDlVQkQ8712+9aU8saf6 aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 333b2mvfv6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 09:21:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 87C5610002A;
 Thu, 27 Aug 2020 09:21:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7A770212648;
 Thu, 27 Aug 2020 09:21:21 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 27 Aug 2020 09:21:20
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Rob Herring <robh@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>
Date: Thu, 27 Aug 2020 09:21:01 +0200
Message-ID: <20200827072101.26588-4-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827072101.26588-1-arnaud.pouliquen@st.com>
References: <20200827072101.26588-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-27_02:2020-08-27,
 2020-08-27 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabien Dessenne <fabien.dessenne@st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/3] ARM: dts: stm32: update stm32mp151 for
	remote proc synchronisation support
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

Two backup registers are used to store the Cortex-M4 state and the resource
table address.
Declare the tamp node and add associated properties in m4_rproc node
to allow Linux to attach to a firmware loaded by the first boot stages.

Associated driver implementation is available in commit 9276536f455b3
("remoteproc: stm32: Parse syscon that will manage M4 synchronisation").

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index bfe29023fbd5..842ecffae73a 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1541,6 +1541,11 @@
 			status = "disabled";
 		};
 
+		tamp: tamp@5c00a000 {
+			compatible = "st,stm32-tamp", "syscon";
+			reg = <0x5c00a000 0x400>;
+		};
+
 		/*
 		 * Break node order to solve dependency probe issue between
 		 * pinctrl and exti.
@@ -1717,6 +1722,8 @@
 			st,syscfg-holdboot = <&rcc 0x10C 0x1>;
 			st,syscfg-tz = <&rcc 0x000 0x1>;
 			st,syscfg-pdds = <&pwr_mcu 0x0 0x1>;
+			st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
+			st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
 			status = "disabled";
 		};
 	};
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
