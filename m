Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 922F2E8D1A
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Oct 2019 17:46:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58CD6C36B0B;
	Tue, 29 Oct 2019 16:46:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63790C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2019 16:46:04 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9TGgwJm026459; Tue, 29 Oct 2019 17:45:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=UqBLShJCTgixGdbgFzma65RAxEtmlze/XM6cp3uTtSQ=;
 b=cepqO2/65Lz5Bhz53U3SzJUY4oirqjrlIoH/Xf+rSA2N//WoxU5JLEhRHpUN3ewF7gGZ
 CBifsmb2jZkxvxCRk8n3NH/w6WvggYteTIFuPgl+Ud0KoO634ZIP6zVBpoyMXtaif00o
 peULpGUwSho/30zIo6YEpkwg/Ixy9v/wUzSaTEW3a9RCxLVSCgx0/2WU1NwetLjsL0mY
 r2jaah/jM/2cfkZuQzhOp7kmTAni0V+sD3FE/kgc2QjBzT/eF/rAGYDX+FpPDvBWyUck
 46adMW/HVVtT+QfANEaVFtVds4QZt0/vSNpOTknykhlkI6+u8espWryGMyR47znJEL+k Bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vvbm0gwdg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2019 17:45:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6704810002A;
 Tue, 29 Oct 2019 17:45:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 56EFE2A748A;
 Tue, 29 Oct 2019 17:45:46 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Tue, 29 Oct 2019 17:45:45 +0100
From: Pascal Paillet <p.paillet@st.com>
To: <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <rui.zhang@intel.com>,
 <edubezval@gmail.com>, <daniel.lezcano@linaro.org>,
 <amit.kucheria@verdurent.com>, <david.hernandezsanchez@st.com>,
 <wsa+renesas@sang-engineering.com>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>
Date: Tue, 29 Oct 2019 17:45:37 +0100
Message-ID: <20191029164537.1561-5-p.paillet@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029164537.1561-1-p.paillet@st.com>
References: <20191029164537.1561-1-p.paillet@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-29_05:2019-10-28,2019-10-29 signatures=0
Cc: p.paillet@st.com
Subject: [Linux-stm32] [PATCH 4/4] ARM: dts: stm32: remove thermal passive
	trip point on stm32mp157c
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

Remove thermal passive trip point.

Signed-off-by: Pascal Paillet <p.paillet@st.com>
Change-Id: I494313cf467eea491236e73bd2fbe1803345586f
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index 9b11654a0a39..799b2aedd2c9 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -91,12 +91,6 @@
 			thermal-sensors = <&dts>;
 
 			trips {
-				cpu_alert1: cpu-alert1 {
-					temperature = <85000>;
-					hysteresis = <0>;
-					type = "passive";
-				};
-
 				cpu-crit {
 					temperature = <120000>;
 					hysteresis = <0>;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
