Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0583D3CB42
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2019 14:26:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C013FD26CF0
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2019 12:26:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5CB6D26CEE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2019 12:26:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5BCPqlY030676; Tue, 11 Jun 2019 14:25:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=tCqCtJ+aEYgGguO+2MVvQssjCEBkv0n4pYDaflX/fgg=;
 b=TE+9P2l59jY9ZfSBV2rQhRhiZ/mzdu2kZVNo3DTOk2jX3omc1vDdsIrYPOb3KdWjEL1C
 YOoS8iy9OCBJk29hXTzJl9XRd39oQALAaeMy5IRGC3R1Q9suE1crmk65pOXAvBDb30ss
 Ll92zpZOFXyJdmdYT3EoJxVnLtON2llahF98DEFY3O4iX82CLQLxGuIMkDWbp4adeQv/
 z/u7uysu/qHLFBU2/O93VBqI8wrKZ1WA46up9g48/QAqy0nwzSiz98Sv7xFa/3CR90s4
 eBHlILIOH9vR+EYK9d483azTkO2aZnL5YqEZ/Ex8Sx5jzvsoNhHJyV6a2Ike+Vp9uYrw VA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t26rkhwee-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 11 Jun 2019 14:25:58 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C0D1D31;
 Tue, 11 Jun 2019 12:25:57 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A3E152A31;
 Tue, 11 Jun 2019 12:25:57 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 11 Jun
 2019 14:25:57 +0200
Received: from localhost (10.201.23.31) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 11 Jun 2019 14:25:57
 +0200
From: Erwan Le Ray <erwan.leray@st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>
Date: Tue, 11 Jun 2019 14:25:28 +0200
Message-ID: <1560255930-22554-9-git-send-email-erwan.leray@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560255930-22554-1-git-send-email-erwan.leray@st.com>
References: <1560255930-22554-1-git-send-email-erwan.leray@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.31]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-11_06:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Erwan Le Ray <erwan.leray@st.com>, linux-serial@vger.kernel.org,
 Bich Hemon <bich.hemon@st.com>, Fabrice
 Gasnier <fabrice.gasnier@st.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 08/10] ARM: dts: stm32: Update pin states
	for uart4 on stm32mp157c-ed1
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

From: Bich Hemon <bich.hemon@st.com>

Add idle and no_console_suspend states to uart4 pin configuration

Signed-off-by: Bich Hemon <bich.hemon@st.com>
Signed-off-by: Erwan Le Ray <erwan.leray@st.com>

diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
index 62a8c78..34cc847 100644
--- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
@@ -251,8 +251,11 @@
 };
 
 &uart4 {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "sleep", "idle", "no_console_suspend";
 	pinctrl-0 = <&uart4_pins_a>;
+	pinctrl-1 = <&uart4_sleep_pins_a>;
+	pinctrl-2 = <&uart4_idle_pins_a>;
+	pinctrl-3 = <&uart4_pins_a>;
 	status = "okay";
 };
 
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
