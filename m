Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC44310897
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Feb 2021 10:59:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 617AFC57B59;
	Fri,  5 Feb 2021 09:59:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6347C57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 08:52:21 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1158ofSl025992; Fri, 5 Feb 2021 09:52:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=hZZHp1JpStDPwHbkG6Dc3WR7sLwf+/8Ce3BPuIJA6Mw=;
 b=hMF/sP5IBXJlIt2YgWNYk938KAJvAQt7WqLOz/8Z25zeOAPJaEcb4tKVECLkjrbvlQK1
 MT09T+rhgNmJZe3x6yRA2LsvQY5sseJcKA1I+jsjfHclXXVUMTX8giQDCjExCpsaF0Jd
 BYCN2S45OB0tl7HmuXiHJHZSfWpp78AWffwUkuDS1eeCq80nN6HLYVVLvyUS1RKQqDxl
 wRLTEn4490EQzOooUM2ABiNeIMXbzPlI/5arFwW4eGxgVhgkewvKZtuLsAfe+8vRbNKX
 zWQ5umUrQ7arX/88xN/0Ue6gC1ETjDwYP+Z5CSd+GP4lOq0tPZTh+3xcz8FM2SSHu2nt rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36ey7hev2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 09:52:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A9C8B10002A;
 Fri,  5 Feb 2021 09:52:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9C8DA221793;
 Fri,  5 Feb 2021 09:52:07 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb 2021 09:52:07
 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: <wsa@kernel.org>, <robh+dt@kernel.org>
Date: Fri, 5 Feb 2021 09:51:43 +0100
Message-ID: <1612515104-838-5-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_06:2021-02-05,
 2021-02-05 signatures=0
X-Mailman-Approved-At: Fri, 05 Feb 2021 09:59:37 +0000
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 pierre-yves.mordret@foss.st.com, linux-i2c@vger.kernel.org,
 mcoquelin.stm32@gmail.com, alain.volmat@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/5] ARM: dts: stm32: enable the analog filter
	for all I2C nodes in stm32mp151
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

Enable the analog filter for all I2C nodes of the stm32mp151.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 3c75abacb374..558fc8fb38b6 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -493,6 +493,7 @@
 			#size-cells = <0>;
 			st,syscfg-fmp = <&syscfg 0x4 0x1>;
 			wakeup-source;
+			i2c-analog-filter;
 			status = "disabled";
 		};
 
@@ -508,6 +509,7 @@
 			#size-cells = <0>;
 			st,syscfg-fmp = <&syscfg 0x4 0x2>;
 			wakeup-source;
+			i2c-analog-filter;
 			status = "disabled";
 		};
 
@@ -523,6 +525,7 @@
 			#size-cells = <0>;
 			st,syscfg-fmp = <&syscfg 0x4 0x4>;
 			wakeup-source;
+			i2c-analog-filter;
 			status = "disabled";
 		};
 
@@ -538,6 +541,7 @@
 			#size-cells = <0>;
 			st,syscfg-fmp = <&syscfg 0x4 0x10>;
 			wakeup-source;
+			i2c-analog-filter;
 			status = "disabled";
 		};
 
@@ -1533,6 +1537,7 @@
 			#size-cells = <0>;
 			st,syscfg-fmp = <&syscfg 0x4 0x8>;
 			wakeup-source;
+			i2c-analog-filter;
 			status = "disabled";
 		};
 
@@ -1570,6 +1575,7 @@
 			#size-cells = <0>;
 			st,syscfg-fmp = <&syscfg 0x4 0x20>;
 			wakeup-source;
+			i2c-analog-filter;
 			status = "disabled";
 		};
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
