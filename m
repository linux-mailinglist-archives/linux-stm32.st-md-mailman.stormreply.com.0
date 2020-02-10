Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12070157C93
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Feb 2020 14:43:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B94F3C36B0B;
	Mon, 10 Feb 2020 13:43:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35D35C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2020 13:43:42 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01ADeiD5018105; Mon, 10 Feb 2020 14:43:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=mNx6+zp69Q3t2n4c06wtHJyz+4qv+M+Nal4MBFxGjZE=;
 b=hbQKLK43y3MW6b97apngBQIc33OT+HX4maLomrfxzdK1W3IXBzW8NtcI5qNey2yf3+9Y
 TzjBOWalMVRpaGdDnIl+xfav59byvvxZ0MSovev1scci5j0B1pvt5vU+Sk+KF/8sMdVQ
 2+/fI/vJT+XfI6zhePESg1Db/m++NGevwXXl9GiHq4uxEsYhi+ENBPAYIMt9tvbCPrcC
 Y+BQ/14mFFkn7LnAv5+sNRV/ADPJZPb+0Tf/PD1By2wJ7cWQOt9xjffLLdUC6BJpRKm6
 XNm5Av/XLYo/QFTrOpH2m/qKqv7PALtXEUzaleWjysJI1bZSwgEnejrgl2YrPcVemDuJ xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1urgt43d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2020 14:43:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 650C1100038;
 Mon, 10 Feb 2020 14:43:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 594BE2AD24B;
 Mon, 10 Feb 2020 14:43:33 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 10 Feb 2020 14:43:32
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>
Date: Mon, 10 Feb 2020 14:43:31 +0100
Message-ID: <20200210134331.14039-2-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200210134331.14039-1-benjamin.gaignard@st.com>
References: <20200210134331.14039-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-10_04:2020-02-10,
 2020-02-10 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Correct stmfx node name on
	stm32mp157c-ev1 board
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

Change stmfx node name to fit with yaml requirements.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 arch/arm/boot/dts/stm32mp157c-ev1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index 228e35e16884..ffd4e0caeedc 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -210,7 +210,7 @@
 		interrupt-parent = <&gpioi>;
 		vdd-supply = <&v3v3>;
 
-		stmfx_pinctrl: stmfx-pin-controller {
+		stmfx_pinctrl: pinctrl {
 			compatible = "st,stmfx-0300-pinctrl";
 			gpio-controller;
 			#gpio-cells = <2>;
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
