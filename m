Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A099D096E
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Nov 2024 07:18:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DC05C78F66;
	Mon, 18 Nov 2024 06:18:44 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F18BC78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Nov 2024 06:18:42 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5Rpqq028342;
 Mon, 18 Nov 2024 06:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XnDTHkNtPDeGfy9Saf30rNzJ7NN5oQ4IQjxVX59tzy4=; b=J9pj7UDHISLPvKZ5
 DQuGhKo1rRdm9WPmNjrCQnAbZNtZkI54z/nE32TQnkp+BdHG/fiX9Lk8ROCNMh8W
 AKMeWy4wZ6IwmYno5Ik4kpukhyl9/mDDt31qZAhTIp7izaiY0yPj8wu+OHO0M1Ar
 jde45oQ8wZyDUtC2WGBFgQBPz4Y4rUhFyzbaFBjUSBKPH9Eu18jF+l/Yw2e1i20W
 XudF/0xc6UNCHdjy1ip4Z5ljkFjUrSoYGWSilx189NrDAnfta0UWKx+bHFJvzV12
 J5n0zbkjZXnOdZCVr/QaDrXXZRijBokA0sKYzc6CHkH0tSbW6dtBH643+NGoqc8C
 AUkQyg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xkt9un2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Nov 2024 06:18:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI6IQs7030985
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Nov 2024 06:18:26 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 17 Nov 2024 22:18:19 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Mon, 18 Nov 2024 14:16:51 +0800
MIME-Version: 1.0
Message-ID: <20241118-schema-v1-2-11b7c1583c0c@quicinc.com>
References: <20241118-schema-v1-0-11b7c1583c0c@quicinc.com>
In-Reply-To: <20241118-schema-v1-0-11b7c1583c0c@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 "Jakub Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731910684; l=1149;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=u7rxgoC9B/7rS3oQxWd41tk1pmohU3HeHSdKpUR5MUE=;
 b=Z+XMngnNIwlUmy6XZYzFn88sw8RVMVoS1H21IwWHLoDxq73InjJ1pZ7UxmvhHGdNCq1jmYxLN
 1rIpPBEBOHiCAXanHD8ZlVTkq36hXNoH8ioEnk407LMlQZcILHgiGVx
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: vI8mdZU9bzj93zBCs62feoWAF8F7Dn4e
X-Proofpoint-ORIG-GUID: vI8mdZU9bzj93zBCs62feoWAF8F7Dn4e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 clxscore=1015 adultscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 mlxlogscore=683 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411180050
Cc: quic_jsuraj@quicinc.com, devicetree@vger.kernel.org,
 quic_tengfan@quicinc.com, netdev@vger.kernel.org, quic_tingweiz@quicinc.com,
 quic_jiegan@quicinc.com, linux-kernel@vger.kernel.org, quic_aiquny@quicinc.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, quic_jingyw@quicinc.com,
 linux-arm-msm@vger.kernel.org, quic_yijiyang@quicinc.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/3] dt-bindings: net: snps,
 dwmac: add description for qcs615
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

Add the necessary compatible entries for qcs615 to ensure its validation.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index eb1f3ae41ab9ab4536a110f6fb3e2facb0225549..658d4479aa4864d0e193f03d65eea8b54e1490df 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -68,6 +68,7 @@ properties:
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
         - qcom,qcs404-ethqos
+        - qcom,qcs615-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
         - qcom,sm8150-ethqos
@@ -622,6 +623,7 @@ allOf:
                 - ingenic,x1830-mac
                 - ingenic,x2000-mac
                 - qcom,qcs404-ethqos
+                - qcom,qcs615-ethqos
                 - qcom,sa8775p-ethqos
                 - qcom,sc8280xp-ethqos
                 - qcom,sm8150-ethqos

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
