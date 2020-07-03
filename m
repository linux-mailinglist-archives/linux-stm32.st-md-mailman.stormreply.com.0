Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4934A213833
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Jul 2020 11:55:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8B7EC36B26;
	Fri,  3 Jul 2020 09:55:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FCF2C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jul 2020 09:55:34 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0639a9s6022705; Fri, 3 Jul 2020 11:55:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=PVOnG26nR/CRWabuDYAL1Uq7FjpVqBMfgAQ38turMBg=;
 b=xZIM+taBziWls9RDtsRA566QiuKlbGAzL1h8dt5RS2IV3CgPzFUc2g5nQAiC7df9+g6B
 6gnKiLUNI0zRLn0zBEUrmqQhYzcEkxFqkiHYi+4obzIRa36jYj6xyq6rn8HNmubGkCSh
 oeT6LpTbSoxY6kY0pDYYT6zM0VZOPAcDmdQwCYZvlSfccT4PPXLbiLKbaRh1CZPwbSc8
 9OPGR6wgp2cLW9jYHm8N0626RFJf1XyzT/8ul5qaX6VCesN54sCH2HxN8plJG39n922f
 gBDLGzIpccqal9RSoYf4Oyc8H5SKVVhsKr+dbg1iw0gQWRmcZlT/ygy1sYjC3LYRzjDB wA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuk1wsw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 11:55:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 40CC6100038;
 Fri,  3 Jul 2020 11:55:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 362852BAC64;
 Fri,  3 Jul 2020 11:55:25 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 3 Jul 2020 11:55:24
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <robh+dt@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <lee.jones@linaro.org>,
 <benjamin.gaignard@st.com>
Date: Fri, 3 Jul 2020 11:55:17 +0200
Message-ID: <20200703095520.30264-3-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200703095520.30264-1-benjamin.gaignard@st.com>
References: <20200703095520.30264-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-03_03:2020-07-02,
 2020-07-03 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/5] ARM: dts: stm32: Add compatibles for
	syscon for stm32f426
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

Syscon nodes needs at least 2 compatibles to be compliant why yaml documentation.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 arch/arm/boot/dts/stm32f429.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index 393f43c85a3c..f3a8d43993c9 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -586,8 +586,8 @@
 			status = "disabled";
 		};
 
-		syscfg: system-config@40013800 {
-			compatible = "syscon";
+		syscfg: syscon@40013800 {
+			compatible = "st,stm32-syscfg", "syscon";
 			reg = <0x40013800 0x400>;
 		};
 
@@ -674,7 +674,7 @@
 		};
 
 		pwrcfg: power-config@40007000 {
-			compatible = "syscon";
+			compatible = "st,stm32-power-config", "syscon";
 			reg = <0x40007000 0x400>;
 		};
 
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
