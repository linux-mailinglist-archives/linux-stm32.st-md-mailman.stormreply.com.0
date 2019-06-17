Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F2357E92
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 10:49:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A51CC57B70
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 08:49:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63DC9C06136
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2019 08:50:47 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5H8faGH018088; Mon, 17 Jun 2019 10:50:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=mKq6aXRt6yPdvv0WN1RsD2U79XJ8Gb1nUEC8uornMGc=;
 b=lXEL++QNAZxVCrBJMcQ3hfh4I5HKtmd5STDTD4YVF6nQjaTCtoEimMpUIUr9lyJhj9v0
 fEMxnPguKtPsD9ZLF6qf3K6Ct6/OkTIaYttCe3EgOljrxllyJoBeoN8517uSjrWWh7ty
 Ior/IDc/F4EM7Ni0o6/bw0kmUP9iE5nz+x0UWtQWIx4bgkkkRjE4YcTAbEY6tC317Xx+
 UWypLPYJZLEL7tVt5VEZVn/V/A0plkgXhZbRJgdUJ08bg/fL25kNA1AdVMMBfkg0yBN1
 D5SL7os/TCvcKZLzdy3zhXGVoGbaroguwZUa9Sr4gMGaPPD7PCdENpgCDZj9FOKOmxkW mQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t4p519f5m-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 17 Jun 2019 10:50:33 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 737F538;
 Mon, 17 Jun 2019 08:50:32 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4133D246F;
 Mon, 17 Jun 2019 08:50:32 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 17 Jun
 2019 10:50:31 +0200
Received: from localhost (10.201.22.222) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 17 Jun 2019 10:50:31
 +0200
From: Christophe Roullier <christophe.roullier@st.com>
To: <robh@kernel.org>, <davem@davemloft.net>, <joabreu@synopsys.com>,
 <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <peppe.cavallaro@st.com>
Date: Mon, 17 Jun 2019 10:50:18 +0200
Message-ID: <20190617085018.20352-2-christophe.roullier@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190617085018.20352-1-christophe.roullier@st.com>
References: <20190617085018.20352-1-christophe.roullier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.222]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-17_05:, , signatures=0
X-Mailman-Approved-At: Thu, 27 Jun 2019 08:49:47 +0000
Cc: devicetree@vger.kernel.org, andrew@lunn.ch, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/1] ARM: dts: stm32: replace rgmii mode with
	rgmii-id on stm32mp15 boards
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

On disco and eval board, Tx and Rx delay are applied (pull-up of 4.7k
put on VDD) so which correspond to RGMII-ID mode with internal RX and TX
delays provided by the PHY, the MAC should not add the RX or TX delays
in this case

Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
---
 arch/arm/boot/dts/stm32mp157a-dk1.dts | 2 +-
 arch/arm/boot/dts/stm32mp157c-ev1.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157a-dk1.dts b/arch/arm/boot/dts/stm32mp157a-dk1.dts
index 098dbfb06b61..2c105740dfad 100644
--- a/arch/arm/boot/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/boot/dts/stm32mp157a-dk1.dts
@@ -51,7 +51,7 @@
 	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
 	pinctrl-1 = <&ethernet0_rgmii_pins_sleep_a>;
 	pinctrl-names = "default", "sleep";
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	max-speed = <1000>;
 	phy-handle = <&phy0>;
 
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index b6aca40b9b90..ab1393caf799 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -79,7 +79,7 @@
 	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
 	pinctrl-1 = <&ethernet0_rgmii_pins_sleep_a>;
 	pinctrl-names = "default", "sleep";
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	max-speed = <1000>;
 	phy-handle = <&phy0>;
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
