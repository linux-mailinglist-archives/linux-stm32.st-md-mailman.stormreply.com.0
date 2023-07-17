Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE9B756567
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jul 2023 15:47:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15CABC6B457;
	Mon, 17 Jul 2023 13:47:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E460C6A611
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jul 2023 13:47:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36HCFANQ015564; Mon, 17 Jul 2023 15:46:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=vSMfDNFzu4+99zvWf7Ylziy8xE7+meIevjquHFgBM4U=;
 b=3PYVlfAji+tyt9KhK3ZPksh+tgQ1B3IctqyEEg9dtIjoaIqT/3+7c9MtGndOy7tSsYB3
 7un3lZe7K66CgZoFDH9klgZc7Sw2X7tr7066+myXg3quZIwXQyI59IIq8pze0DFeqQFE
 KHoJPzn3os6ZLwlhumOBYx0M72zi4sgepsfdxdpebGuNDVsuUAwOeZLquqUURYWRgbt9
 bbCuBq5s15DyDpg0TCoHjKnlByqgrGzzZABkEDCjSSi7uA4XmPgUni+NHydc6/fCSBR+
 x+N9HsyVRR+BWHAX1UNLwe2kJzHN9NHAKClWQPPapjhphgIj8pcr9b7W8DFlp52qYfD2 NA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rw3f0tdqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jul 2023 15:46:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E953610002A;
 Mon, 17 Jul 2023 15:46:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E20142248AD;
 Mon, 17 Jul 2023 15:46:31 +0200 (CEST)
Received: from localhost (10.201.22.238) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 17 Jul
 2023 15:46:31 +0200
From: <p.paillet@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Mon, 17 Jul 2023 15:46:27 +0200
Message-ID: <20230717134627.2064553-1-p.paillet@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.22.238]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_11,2023-07-13_01,2023-05-22_02
Cc: p.paillet@foss.st.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: fix dts check warnings on
	stm32mp15-scmi
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

From: Pascal Paillet <p.paillet@foss.st.com>

Fix dts check warnings on stm32mp15-scmi reported by
arm,scmi.yaml.

Signed-off-by: Pascal Paillet <p.paillet@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15-scmi.dtsi | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
index ad2584213d99..dc3b09f2f2af 100644
--- a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
@@ -34,22 +34,21 @@ scmi_reguls: regulators {
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					scmi_reg11: reg11@0 {
+					scmi_reg11: regulator@0 {
 						reg = <0>;
 						regulator-name = "reg11";
 						regulator-min-microvolt = <1100000>;
 						regulator-max-microvolt = <1100000>;
 					};
 
-					scmi_reg18: reg18@1 {
-						voltd-name = "reg18";
+					scmi_reg18: regulator@1 {
 						reg = <1>;
 						regulator-name = "reg18";
 						regulator-min-microvolt = <1800000>;
 						regulator-max-microvolt = <1800000>;
 					};
 
-					scmi_usb33: usb33@2 {
+					scmi_usb33: regulator@2 {
 						reg = <2>;
 						regulator-name = "usb33";
 						regulator-min-microvolt = <3300000>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
