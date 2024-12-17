Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FF59F5468
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2024 18:41:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26D70C7801C;
	Tue, 17 Dec 2024 17:41:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92BC4C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 17:41:42 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHDQcJN030946;
 Tue, 17 Dec 2024 18:41:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Nc9RXMeFr31ytwA1Y5dlc81Sj4KC1vb4yt2kMR6a00c=; b=IfKJFxJeEiMthcDX
 vmT4BjLEf+DefvDF4W07qOJQeorlRQEjJ6IpUKGdxbftAf8xwpVkbBUkiQFKZuw0
 rfBk72TBQ5uRdgU6bhO25tr+kgvme5PInju7yGXVyA5L/LdERjfSF0L03p4pJ2yL
 x2OhxIFQSqHiEArW0dswRsFg2h2GG1mHEQwgsXVCnZ1t1RkWgR0Ck2cJhswOa76n
 SKZcYM8GDo08WRruMkrWNSy4caS4QNpmD7jJNwFc0jjGbQbgmZEUEeEItuHiHBu8
 pGFkJLiJipTP9KUIyzJt8acTUyAES4iABxJ/gVbe4vzkalAA5QuTtqKTS+39jtYZ
 6088vA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43k5c4u3bb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 18:41:25 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1AB0A40044;
 Tue, 17 Dec 2024 18:40:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 49E6828E45A;
 Tue, 17 Dec 2024 18:39:26 +0100 (CET)
Received: from localhost (10.252.23.235) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 17 Dec
 2024 18:39:25 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 17 Dec 2024 18:39:19 +0100
MIME-Version: 1.0
Message-ID: <20241217-csi_dcmipp_mp25_enhancements-v1-2-2b432805d17d@foss.st.com>
References: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
In-Reply-To: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.1
X-Originating-IP: [10.252.23.235]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/9] dt-bindings: media: clarify stm32 csi &
 simplify example
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

Clarify the description of the stm32 csi by mentioning CSI-2 and
D-PHY.
Remove the bus-type property from the example.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
index 33bedfe41924..e9fa3cfea5d2 100644
--- a/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
@@ -7,8 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: STMicroelectronics STM32 CSI controller
 
 description:
-  The STM32 CSI controller allows connecting a CSI based
-  camera to the DCMIPP camera pipeline.
+  The STM32 CSI controller, coupled with a D-PHY allows connecting a CSI-2
+  based camera to the DCMIPP camera pipeline.
 
 maintainers:
   - Alain Volmat <alain.volmat@foss.st.com>
@@ -109,7 +109,6 @@ examples:
                 endpoint {
                     remote-endpoint = <&imx335_ep>;
                     data-lanes = <1 2>;
-                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
                 };
             };
 

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
