Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBA74B872
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 14:31:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65104C593F0
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 12:31:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00A56C55183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 12:31:23 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5JCQslr023576; Wed, 19 Jun 2019 14:30:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=itx+N4q2/+O0OHhYwt8mmdIF3dz/cOb8wiZwNAeO4ps=;
 b=VRltqKiVh2cBzw6RCCuSXewyxhUmFuTNrTURF9ZrXy9MB/OaED8Gu77K+QB2lmWEXVFi
 6FqnJn93NmaCfItUKEO5JgDHqO7kiRUjZ98dGsYKRtvhIQ++ZpAYH2Z+2fcM/gs4Kefo
 xviBg7D0tpKv0F32GFbRI/dCP8dRsGYdiFSeJa/qXzAnZNTNYrHPoe44ChqgiWVxN69p
 gVPgREkWTv8v4g2a6Ixow7UODTEU3kP/ovTNneN1KXkG8Sc7tNqAW/xGRa2Z+GUaeySl
 bAbalphLmwsroh76+d7nSvz4oyNxjVCD8hrldLhFGjNws9flk6V7wPgNi/X52KsATwYA dA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t7812uxwt-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 19 Jun 2019 14:30:54 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B1ADC3D;
 Wed, 19 Jun 2019 12:30:53 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 90E6327A6;
 Wed, 19 Jun 2019 12:30:53 +0000 (GMT)
Received: from localhost (10.75.127.45) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 19 Jun 2019 14:30:53 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <jic23@kernel.org>, <robh+dt@kernel.org>, <alexandre.torgue@st.com>
Date: Wed, 19 Jun 2019 14:29:56 +0200
Message-ID: <1560947398-11592-4-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560947398-11592-1-git-send-email-fabrice.gasnier@st.com>
References: <1560947398-11592-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_07:, , signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 mcoquelin.stm32@gmail.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/5] ARM: dts: stm32: remove fixed regulator
	unit address on stm32429i-eval
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

vref fixed regulator shouldn't have unit address and reg properties.
Rename the label and phandle to "vref" according to the schematics.
Also remove it from simple-bus.

Fixes: 7465d81191a1 ("ARM: dts: stm32: enable ADC on stm32f429i-eval
board")

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/boot/dts/stm32429i-eval.dts | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
index 73ea84d..d79f58f 100644
--- a/arch/arm/boot/dts/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/stm32429i-eval.dts
@@ -81,18 +81,12 @@
 		dma-ranges = <0xc0000000 0x0 0x10000000>;
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
-		reg_vref: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "vref";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-		};
+	vref: regulator-vref {
+		compatible = "regulator-fixed";
+		regulator-name = "vref";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
 	};
 
 	leds {
@@ -157,7 +151,7 @@
 &adc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&adc3_in8_pin>;
-	vref-supply = <&reg_vref>;
+	vref-supply = <&vref>;
 	status = "okay";
 	adc3: adc@200 {
 		st,adc-channels = <8>;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
