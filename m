Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7446DA83AC3
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Apr 2025 09:19:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DD8BC7A845;
	Thu, 10 Apr 2025 07:19:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4EA6ECFAC42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Apr 2025 01:33:56 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HH68H024169
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 10 Apr 2025 01:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Q5C8avXIxcx
 6eZTU/R7g1j6DX3AayD2O7YvtYRznlQ4=; b=MujjNClyaI06HBsPxeKNYGbeSll
 rq9Bz9OOS8XGeaWhIDYUqMAtR9YPCPsqG2HSKlv1YFChTU6+xx/u5eL1TCit9Ecl
 4hyoo0qNfv78fXQVbqEI5sLurarUPTmWVqmFj8AqoKtXmjbMwGizIDCxLf+nGvf0
 xtk4+OqAtT55MGoggMnm3xSocUOIyhbv54XMQ8vdkR1wDppKNi4y54Y+zJ0KrI5e
 nLxv8KIvs5tqqnHim5U4lOehFREFqIe7POTEvxJmh5Q07TpY0dU6duG7JuIVXkOi
 PaTgDJI10crIWnMa2XhzpnN12ixwqwsPwuI5FDNhhxJkgP/igia3UxSzLMg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkn30p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Apr 2025 01:33:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-22651aca434so2289455ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Apr 2025 18:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744248834; x=1744853634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q5C8avXIxcx6eZTU/R7g1j6DX3AayD2O7YvtYRznlQ4=;
 b=q0aaYcZXsdxlOaPfVwAh3h+m1pIT26VZxlo57WY1QtCemQbCTZbbPvvwFVRcLmc3Ys
 kPRPQACnTWv4WYIUQfAEIyqJTbaPi/O7dVeSBPXI0rZ5uiesSeqjTKkeQdw2eQ2XqqQs
 3+X+DgsmYxg0iG2QeW2Vu0fHa3YrGMaNiiYjS8RMgwGSDKe5Wmj5I7M5jFYd7fVfXFFA
 f5v8/idSkGdshL4wX3uQvvNSaf59GY+OAKS2TVC0NIMGL6mx6q1YD4c3mKkFgbKsLmys
 c82LtzI5YMZnyLATmoOnzhMFx80t2KEfoa/0jSYoa7mgoJmA0g4TtFvm4abr+06BhCad
 05FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlCvxaBTqRM07Boyk56SLB37aaHKg3Ic256Cd5r2XVDFqLLUN/ZvgzaQeYVc7zZlWskknSYewLYxTwkg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YywPf0ag/h8fKuH19s+PlXCpKLLaeiugDyJOTzUfI7PTp8tcMy+
 WHEZh1X8C3jRI5mic0grgx+9c4jOZxHNy3T2oOB0icJytiHZ7ZQu3Lg21jeLi0Yjfpefy24aJqn
 QyWzNNiz07tmGQsRQZB89KmffZaT9RUnaaISDJuOoyrs3xdnrWj99edHFvSJT/TLGntAn8MdTiY
 nLaQU=
X-Gm-Gg: ASbGnctxGrJu3xYe9l1aUFK4qZ5LNZfTYH7cOMvT7IjdGfRqW0/KySpusDyACfl3I24
 pqXFslM7sO07hW7QVYIXI1N7yAzeAAS7LaH+lLYUs3QwsUBtvBfo11mxegAyQk//6yRnofKNT7a
 Lg+RwKih1KJufJIJ7Hz6wqo7sRmyJehW7FEux/9x9LFhxdrd01xKs7jSgY+5rmIMJdy0ic/WcZa
 QRkr4YC7tAEu56JwMObm2OpsDip7BQfU9Pw0/Z2BPI3gHsqsQYOHaxCHEwvJmf77UqFpCd8Zitk
 wXhPv+Ksvq7eZZwqiKlI59cgQ60qiEBSYT08u4InUBXyPcSVnwnI/gQmomqNe+zt9kyXnh0=
X-Received: by 2002:a17:902:f650:b0:224:10a2:cae1 with SMTP id
 d9443c01a7336-22be0388945mr5828875ad.37.1744248833677; 
 Wed, 09 Apr 2025 18:33:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuGLiA2GpR0NJuAdO+G8PI7iF8HwBXSjne50t51n8f56D/aAMKowziVlwmYW3huuRGfdtbHg==
X-Received: by 2002:a17:902:f650:b0:224:10a2:cae1 with SMTP id
 d9443c01a7336-22be0388945mr5828615ad.37.1744248833241; 
 Wed, 09 Apr 2025 18:33:53 -0700 (PDT)
Received: from jiegan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7ccb596sm18801815ad.220.2025.04.09.18.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 18:33:50 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 10 Apr 2025 09:33:27 +0800
Message-Id: <20250410013330.3609482-3-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
References: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: V5Bu-pygti05O8A7Nn46SAhqwkXq4slC
X-Proofpoint-ORIG-GUID: V5Bu-pygti05O8A7Nn46SAhqwkXq4slC
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f72003 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100010
X-Mailman-Approved-At: Thu, 10 Apr 2025 07:19:28 +0000
Cc: devicetree@vger.kernel.org, Jinlong Mao <quic_jinlmao@quicinc.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/5] dt-bindings: arm: Add an interrupt
	property for Coresight CTCU
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

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshlod of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../bindings/arm/qcom,coresight-ctcu.yaml       | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 843b52eaf872..ea05ad8f3dd3 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -39,6 +39,16 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Byte cntr interrupt for etr0
+      - description: Byte cntr interrupt for etr1
+
+  interrupt-names:
+    items:
+      - const: etr0
+      - const: etr1
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -56,6 +66,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -63,6 +75,11 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "etr0",
+                          "etr1";
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
