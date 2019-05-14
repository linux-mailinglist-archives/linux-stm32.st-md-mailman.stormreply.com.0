Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D391C4C2
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2019 10:27:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41A01C35E05
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2019 08:27:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B97C0C35E0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2019 08:27:32 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4E8Q9dW029565; Tue, 14 May 2019 10:27:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Qcbov99m1lkaIUfnuX86RHd5PLWtt8rqoo5dDBx7OIc=;
 b=m1K4JyBF9G3LpGo1bTOXreixgG0vtt4K5/6kWYXSKY42v6Y90iaKW3mCRhoE9xG7Fi5A
 /JcNcgwzfcuXVAvxMM0ESAsykAOZIZAtF5qCQqpU4317PjECjoRcS4SV25xlzodEl3cm
 tExaCwvUX691f9qThMlcoiflqvr+0PJ76uv7F1Vw9lFuqd+3CVZ3aebI0ljbKoGIjjC2
 VqK0fUACd2beFiJJKA92KXACjn5p4E+VoagU5sVdHKANt1dG8kFYgI0ewMjYkPrjyosl
 DceUd9C/q9tilNMFMqXmOP0+zrdIle2fnnyIJGRfPjuMRKDOprtCopJO6nwKiE54pP8p Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sdkuyqnns-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 14 May 2019 10:27:17 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D5C8E34;
 Tue, 14 May 2019 08:27:16 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8F87A1551;
 Tue, 14 May 2019 08:27:16 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 14 May
 2019 10:27:16 +0200
Received: from localhost (10.201.23.25) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 14 May 2019 10:27:16
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-remoteproc@vger.kernel.org>
Date: Tue, 14 May 2019 10:27:03 +0200
Message-ID: <1557822423-22658-9-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557822423-22658-1-git-send-email-fabien.dessenne@st.com>
References: <1557822423-22658-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_05:, , signatures=0
Cc: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Linux-stm32] [PATCH v4 8/8] ARM: dts: stm32: enable m4 coprocessor
	support on STM32MP157a-dk1
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

Enable m4 coprocessor for STM32MP157a-dk1 board.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 arch/arm/boot/dts/stm32mp157a-dk1.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157a-dk1.dts b/arch/arm/boot/dts/stm32mp157a-dk1.dts
index 26ce8de..da64ee2 100644
--- a/arch/arm/boot/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/boot/dts/stm32mp157a-dk1.dts
@@ -116,6 +116,16 @@
 	status = "okay";
 };
 
+&m4_rproc {
+	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
+			<&vdev0vring1>, <&vdev0buffer>;
+	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
+	mbox-names = "vq0", "vq1", "shutdown";
+	interrupt-parent = <&exti>;
+	interrupts = <68 1>;
+	status = "okay";
+};
+
 &rng1 {
 	status = "okay";
 };
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
