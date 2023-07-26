Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9517630BD
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 11:03:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F4127C6B45A;
	Wed, 26 Jul 2023 09:03:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EFF6C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 09:03:21 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36Q7mqrq023360; Wed, 26 Jul 2023 11:02:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=Z9RHAsA52emjB/XR0eL1RL+AuLIHvu4a8YPaJiSvHi4=;
 b=JvcQRWTwPrcsfutKaRVfntP9bilxb/QIy94VElM0ZEO9it84T4x+cv78X3fFVzMJZ4pa
 esXheE54EV0UCTXjdGY5tlFl3bSOdZlimS2VaAkQC65Dzgk57OFFC4wMLTt3xY/6/uvv
 5b4LbNRaUWBnf7siuw/UKmUi697F2cmVXd3a3ETb3ilDZOLzvpK39isiIhDZQ8ayzl0z
 oG25FFsXcKRWS4FVIWIJtZkST0zVkcHucytAqeP661nnWB5dSAlGi0NUTzMlszyRtd4w
 l7LGcz/CA1pZP7r/SmrlcsIP2TvqjbmYoRVK/1yUJvGognDiXe/nFg7UPQgRPVH8WV96 OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3s2ye8gnep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jul 2023 11:02:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 09A4E10002A;
 Wed, 26 Jul 2023 11:02:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F1E542115F5;
 Wed, 26 Jul 2023 11:02:55 +0200 (CEST)
Received: from localhost (10.201.21.121) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 26 Jul
 2023 11:02:55 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
 <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
 <vkoul@kernel.org>, <jic23@kernel.org>, <olivier.moysan@foss.st.com>,
 <arnaud.pouliquen@foss.st.com>, <mchehab@kernel.org>,
 <fabrice.gasnier@foss.st.com>, <andi.shyti@kernel.org>,
 <ulf.hansson@linaro.org>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <hugues.fruchet@foss.st.com>, <lee@kernel.org>,
 <will@kernel.org>, <catalin.marinas@arm.com>, <arnd@kernel.org>,
 <richardcochran@gmail.com>, Frank Rowand <frowand.list@gmail.com>
Date: Wed, 26 Jul 2023 11:01:26 +0200
Message-ID: <20230726090129.233316-5-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230726090129.233316-1-gatien.chevallier@foss.st.com>
References: <20230726083810.232100-1-gatien.chevallier@foss.st.com>
 <20230726090129.233316-1-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.121]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_03,2023-07-25_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Gatien Chevallier <gatien.chevallier@foss.st.com>, linux-iio@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-serial@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 08/11] arm64: dts: st: add RIFSC as a
	domain controller for STM32MP25x boards
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

RIFSC is a firewall controller. Change its compatible so that is matches
the documentation and reference RIFSC as a feature-domain-controller.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---

Changes in V2:
	- Fix rifsc node name
	- Move the "ranges" property under the
	  "feature-domains" one

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 5268a4321841..cb084381e4cd 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -105,11 +105,13 @@ soc@0 {
 		interrupt-parent = <&intc>;
 		ranges = <0x0 0x0 0x0 0x80000000>;
 
-		rifsc: rifsc-bus@42080000 {
-			compatible = "simple-bus";
+		rifsc: bus@42080000 {
+			compatible = "st,stm32mp25-rifsc";
 			reg = <0x42080000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			feature-domain-controller;
+			#feature-domain-cells = <1>;
 			ranges;
 
 			usart2: serial@400e0000 {
@@ -117,6 +119,7 @@ usart2: serial@400e0000 {
 				reg = <0x400e0000 0x400>;
 				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&ck_flexgen_08>;
+				feature-domains = <&rifsc 32>;
 				status = "disabled";
 			};
 		};
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
