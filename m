Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C8871604B
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 14:46:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBD71C6A614;
	Tue, 30 May 2023 12:46:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A77F2C65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 12:46:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34UBtjVe011762; Tue, 30 May 2023 14:46:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=QMw9Tnd7+RpGGBDn1zw1zumG/Sad+L8PSAew5gasot0=;
 b=Ur581kKBiE9BPEeSOTlra949ItEG4FT5mqX4bp0hIe+Q1FogmsaTx7r4lyIsgZew4kZs
 5OGLkKuAxuPsiRB17wggoEQ1q0G232QiyzGkSUQaGMTmjrJcVWkYpcuzNsqeZniUVfjP
 3nu2mnlcvfZ5rT9YTv6wyTGjVF2FoPRNdvoh7D6DEq/u4GGan6I1nbxKOK74/pLG6+oL
 PNGmyL8rUVScCWDEIpW0ar2R6x/yNVHgbC28uSoj2O+uBvmF2tyMwsJTfcfnur5Lz1is
 g2WigDVfgO/aTHALMCgTs0rPia3NosEBk5TJEgvfjPxxoB1jKKfonVICS3bpjYhIn0gG dQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qvsnnqk6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 May 2023 14:46:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9BB43100038;
 Tue, 30 May 2023 14:46:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 962102248D8;
 Tue, 30 May 2023 14:46:14 +0200 (CEST)
Received: from localhost (10.201.20.178) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 30 May
 2023 14:46:14 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Tue, 30 May 2023 14:45:30 +0200
Message-ID: <20230530124538.621760-3-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230530124538.621760-1-olivier.moysan@foss.st.com>
References: <20230530124538.621760-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.178]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_08,2023-05-30_01,2023-05-22_02
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 2/9] ARM: dts: stm32: add vrefint
	calibration on stm32mp15
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

Describe vrefint calibration cell to be retrieved through bsec.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 7b360ee1ba2b..3d0c39d847b5 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1630,6 +1630,9 @@ bsec: efuse@5c005000 {
 			part_number_otp: part-number-otp@4 {
 				reg = <0x4 0x1>;
 			};
+			vrefint: vrefin-cal@52 {
+				reg = <0x52 0x2>;
+			};
 			ts_cal1: calib@5c {
 				reg = <0x5c 0x2>;
 			};
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
