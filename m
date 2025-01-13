Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 221F8A0B1F3
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 10:00:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDCFBC78024;
	Mon, 13 Jan 2025 09:00:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C4ECC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 09:00:27 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D5kAnl011631;
 Mon, 13 Jan 2025 10:00:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 taEiKmKlVys5nB8Z9Qfz6vGyP3PJH7r7vDrV7QO4ysE=; b=KZorB1urNUsJOvou
 N7z+IrR3CDeOB3gbRtO/p9ziDq7GH7KCnm3Yu+CdiHM08gWak04OW1p3uz6nNcRT
 kEf3vGBA/MCBOPtRjPmjF9DBoWxSAxrw4f7iAU8ydmtIBCmh3q8s/K4rV6UYebul
 ZnDYvSd8PBBO8KjxlVwH1/FEmp2tgxcAEuD7eH65iltPE227JQ++vXp0Afa3aZBA
 Irikafgxys/q9BSeB+CMLC5NiY+yISEET/hFbwjKfOMEF4WSNDTmscZwxnmCF3kB
 qw2unEpkKFI2E3fdZTB1GREHdSvXjUXUEFcop/WfwYj1FvGaVyYlXvMD0MyfCQsp
 aYsT0A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 444vyr0p8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2025 10:00:10 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4801A40052;
 Mon, 13 Jan 2025 09:59:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 86F19234C22;
 Mon, 13 Jan 2025 09:58:13 +0100 (CET)
Received: from localhost (10.129.178.39) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 13 Jan
 2025 09:58:13 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 13 Jan 2025 09:57:52 +0100
MIME-Version: 1.0
Message-ID: <20250113-csi_dcmipp_mp25_enhancements-v3-2-33b96744df46@foss.st.com>
References: <20250113-csi_dcmipp_mp25_enhancements-v3-0-33b96744df46@foss.st.com>
In-Reply-To: <20250113-csi_dcmipp_mp25_enhancements-v3-0-33b96744df46@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.1
X-Originating-IP: [10.129.178.39]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 2/9] dt-bindings: media: clarify stm32 csi
 & simplify example
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

Clarify the description of the stm32 CSI by mentioning CSI-2 and D-PHY.
Remove the bus-type property from the example since this CSI has a D-PHY,
which is the only bus-type option, making this property redundant.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
v2: clarify commit message related to bus-type property removal within
    the example
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
