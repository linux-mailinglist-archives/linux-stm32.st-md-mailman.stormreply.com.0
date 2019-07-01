Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2E75B7DD
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jul 2019 11:18:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7690ED26B5E
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jul 2019 09:18:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4DDED26B5C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jul 2019 09:18:51 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x619BYrY020146; Mon, 1 Jul 2019 11:18:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=KIy5BakllxdZ3xXg+Q83R/MpzH9X3aj4n2maKUHUR+w=;
 b=tX1mNaJkfexbL9sT+Gk8U/rMpCocwcqwlpNbazhIYaMZcoM7+yUdfDOKZKsubVrj/4ht
 3NSgReFCRAF50ozCrjv8J5yBFSlAk3u4UgAgGemGCYd4Bdeo6eESFzD6h+PWI/DTp1dO
 E4Gsud7dhy8Vt3N/kOWftwAZIZaC1dpLf/WCfzkdJDUP8NtVdn82jGyREDh578Q7lBx/
 1FTHz5bKWCQlZghhHBYzbFPDgwaXMlXQ5jp/tTV5HQsefnQ10yllsLs3CtVmIbs/Dlvl
 sGb4FNaQoMNkUrhCtiT91vGgFZUqQjNhUAHvTharYk/v1UppsnPGh0lrouDkVdpgB2ZW gA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tdxvhktqf-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 01 Jul 2019 11:18:38 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5405F34;
 Mon,  1 Jul 2019 09:18:37 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2B88E24EC;
 Mon,  1 Jul 2019 09:18:37 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 1 Jul 2019
 11:18:37 +0200
Received: from localhost (10.201.23.31) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 1 Jul 2019 11:18:36
 +0200
From: Erwan Le Ray <erwan.leray@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
Date: Mon, 1 Jul 2019 11:18:06 +0200
Message-ID: <1561972686-23281-1-git-send-email-erwan.leray@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.201.23.31]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-01_07:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 erwan.leray@st.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: fix -Wall W=1 compilation
	warnings for can1_sleep pinctrl
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

Fix compilations warnings detected by -Wall W=1 compilation option:
- node has a unit name, but no reg property

Signed-off-by: Erwan Le Ray <erwan.leray@st.com>

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index 140a983..ce98fd8 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -427,7 +427,7 @@
 				};
 			};
 
-			m_can1_sleep_pins_a: m_can1-sleep@0 {
+			m_can1_sleep_pins_a: m_can1-sleep-0 {
 				pins {
 					pinmux = <STM32_PINMUX('H', 13, ANALOG)>, /* CAN1_TX */
 						 <STM32_PINMUX('I', 9, ANALOG)>; /* CAN1_RX */
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
