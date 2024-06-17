Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E5790A96A
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 11:21:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFBF4C6B45B;
	Mon, 17 Jun 2024 09:21:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CE63C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 09:21:01 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45H8TcUY028750;
 Mon, 17 Jun 2024 11:20:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=GL07PGu1vgaXnCMZg7OIqD
 UaXSbNoiZtITb4vC2Rq7M=; b=wnLHq0TF1n5sTXZxXx6qDAmZuNXEoLGnkgwo+s
 EoBEacW1y8NtNEKAMpKCrTi5wY0FeRRRIaTbifx+1/gxk4+hGlQroUilzu+ySPye
 7CxoZjeyaQpaRD8W+pimLwSJ58r/Bb/irIXpzkprInTNgb9BVnv8A2rF4nNkkRRJ
 rIEY6xegw/jM6la4iqoEYm39zQrvVXP9fQp5E4l+MMzq5QKNkT9gOBc0JVvoJ1GS
 W61iS3dMuk9/+7FVevETCuXVW3iWkVIvdXBMeRAL3xSXRKFM61AfmzxyrHFUONVN
 ZeYPOm+fWrIHbE+r3VnyFMBlliUOLglvReX8LaQUoaKP4r/g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ys1ucnhyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jun 2024 11:20:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 41D3F40045;
 Mon, 17 Jun 2024 11:20:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 14C1121194A;
 Mon, 17 Jun 2024 11:20:23 +0200 (CEST)
Received: from localhost (10.48.86.128) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 17 Jun
 2024 11:20:22 +0200
From: Etienne Carriere <etienne.carriere@foss.st.com>
To: <linux-kernel@vger.kernel.org>
Date: Mon, 17 Jun 2024 11:20:16 +0200
Message-ID: <20240617092016.2958046-1-etienne.carriere@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.128]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_08,2024-06-14_03,2024-05-17_01
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Lee
 Jones <lee@kernel.org>, Pascal Paillet <p.paillet@st.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2] dt-bindings: mfd: dual licensing for st,
	stpmic1 bindings
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

Change include/dt-bindings/mfd/st,stpmic1.h license model from GPLv2.0
only to dual GPLv2.0 or BSD-2-Clause. I have every legitimacy to request
this change on behalf of STMicroelectronics. This change clarifies that
this DT binding header file can be shared with software components as
bootloaders and OSes that are not published under GPLv2 terms.

In CC are all the contributors to this header file.

Cc: Pascal Paillet <p.paillet@st.com>
Cc: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
---
Changes since v1:
- Change request license from "GPL-2.0-only OR BSD-3-Clause" to
  "GPL-2.0-only OR BSD-2-Clause".
- Update Lee's e-mail address.
---
 include/dt-bindings/mfd/st,stpmic1.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/mfd/st,stpmic1.h b/include/dt-bindings/mfd/st,stpmic1.h
index 321cd08797d9..9dd15b9c743e 100644
--- a/include/dt-bindings/mfd/st,stpmic1.h
+++ b/include/dt-bindings/mfd/st,stpmic1.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
 /*
  * Copyright (C) STMicroelectronics 2018 - All Rights Reserved
  * Author: Philippe Peurichard <philippe.peurichard@st.com>,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
