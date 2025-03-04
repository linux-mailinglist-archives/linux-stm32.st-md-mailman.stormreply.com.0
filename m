Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92968A4E969
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Mar 2025 18:40:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5729BC78F6D;
	Tue,  4 Mar 2025 17:40:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AF45C78F6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Mar 2025 17:40:43 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524HXaf1010806;
 Tue, 4 Mar 2025 18:40:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 2wY6Dic8hzBm+S2wld/DgwBFhKKy9RZVyTbW8u8LUKQ=; b=l0N6wU/mIwkLnrve
 lkY+E5+N4aIn5MVtiEYfr1OFPmz+jauaVKYeBoXloM67YVbVm4R/Eltr+d3IWGQL
 KsE2Dc1XxlneQv3k0bRxF3TEugh4zmQBvplKL9H32cI/8F28bwTl9q38N6W4bRl0
 BPtMhBqHchXsuwWh0RB4n++5yix9xYXTEbzHaqeTUJTeaOsm9Rvo2l1A5x2661MY
 N/jK8QE90w2FIBWAlAu6tm04b3up4QVDX6kNE4EYbx7gPIRanfyg157iNUDDq1k9
 VxzOLzaHbWZGjnWzkwngh2qZqlqgNSQm4Og0YnV3u/uWIqmeQz620xzGoDeOwj/M
 vTrwsg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 455wbhmdyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Mar 2025 18:40:20 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 929BB4006A;
 Tue,  4 Mar 2025 18:39:15 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C3136594C2B;
 Tue,  4 Mar 2025 18:32:52 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Mar
 2025 18:32:52 +0100
Received: from localhost (10.252.16.143) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Mar
 2025 18:32:52 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <jic23@kernel.org>, <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
Date: Tue, 4 Mar 2025 18:32:29 +0100
Message-ID: <20250304173229.3215445-9-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304173229.3215445-1-fabrice.gasnier@foss.st.com>
References: <20250304173229.3215445-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.16.143]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_07,2025-03-03_04,2024-11-22_01
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 wbg@kernel.org
Subject: [Linux-stm32] [PATCH v2 8/8] arm64: dts: st: use lptimer3 as tick
	broadcast source on stm32mp257f-ev1
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

During the low power modes the generic ARM timer is deactivated, so the
the tick broadcast is used, based on LPTIMER3 which is clocked by LSE on
STMicroelectronics boards.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 1b88485a62a1..242115863ab4 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -190,6 +190,14 @@ &i2c8 {
 	status = "disabled";
 };
 
+/* use LPTIMER with tick broadcast for suspend mode */
+&lptimer3 {
+	status = "okay";
+	timer {
+		status = "okay";
+	};
+};
+
 &rtc {
 	status = "okay";
 };
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
