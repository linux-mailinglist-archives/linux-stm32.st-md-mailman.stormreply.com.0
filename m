Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5629D096D
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Nov 2024 07:18:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31BB8C78F66;
	Mon, 18 Nov 2024 06:18:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1AF5AC78F67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Nov 2024 06:18:37 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5S5q4001763;
 Mon, 18 Nov 2024 06:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rWVngf7vTOYVex5gEAY9FvR1sif9ZzVGKSEoRQHAYvo=; b=mCho3Vt/5yQc0fP1
 ak0MiCSan+i8qRrw75W0J9TVqz2LWegXxTjhCphRGZvfxN5Lwhk52WRkUpa1N8vT
 lB9+TZu9/wK9gTGCnso0PZeLDHyLCV3WedNqjsA1eGNK2uqmL5SgJ389T1cXJS4X
 wFPWxR33F+64iBPOBFIDMyv9NStTyju71nHmXnsKRfDelDXHtIOqW37zNNKzvbn7
 M8j5QyMTrTeXYRmsvxI0JeXzy2zUnfgqjAZBJqWkKSuqAszTn2ouamNgGIGE5jTs
 x+kDxWk515YO32KY5lnQxI91vxnhu8hpDxOlg++nSvzNwP7kIGj0JqhBfP860Iqe
 58DOVg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ycuf9jdw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Nov 2024 06:18:20 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI6IJHW015106
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Nov 2024 06:18:19 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 17 Nov 2024 22:18:12 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Mon, 18 Nov 2024 14:16:50 +0800
MIME-Version: 1.0
Message-ID: <20241118-schema-v1-1-11b7c1583c0c@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731910683; l=1391;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=/VMItlwpHEXpGvrvqSDfxrRyzHap72Aup3wx/u9EWlo=;
 b=fYrVMSRn/6skEZ/FB1RnOmQEbOtVDkIqzjZGXfvVLjW6/d1Q4TtWXFBkijgf14TdePMhcnhoh
 0o4FIU0DEg9BLmRrkEtmcGbco8TKXZ6EJ1GfoKNz8vwKdu8OvN8zdHw
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ZypiISRDyohw9aiUCyv4iWE9CHFV2h1N
X-Proofpoint-GUID: ZypiISRDyohw9aiUCyv4iWE9CHFV2h1N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 mlxlogscore=958 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180051
Cc: quic_jsuraj@quicinc.com, devicetree@vger.kernel.org,
 quic_tengfan@quicinc.com, netdev@vger.kernel.org, quic_tingweiz@quicinc.com,
 quic_jiegan@quicinc.com, linux-kernel@vger.kernel.org, quic_aiquny@quicinc.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, quic_jingyw@quicinc.com,
 linux-arm-msm@vger.kernel.org, quic_yijiyang@quicinc.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/3] dt-bindings: net: qcom,
 ethqos: revise description for qcs615
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

The core version of EMAC on qcs615 has minor differences compared to that
on sm8150. During the bring-up routine, the loopback bit needs to be set,
and the Power-On Reset (POR) status of the registers isn't entirely
consistent with sm8150 either.
Therefore, it should be treated as a separate entity rather than a
fallback option.

Fixes: 32535b9410b8 ("dt-bindings: net: qcom,ethqos: add description for qcs615")
Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 0bcd593a7bd093d4475908d82585c36dd6b3a284..576a52742ff45d4984388bbc0fcc91fa91bab677 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -23,12 +23,9 @@ properties:
           - enum:
               - qcom,qcs8300-ethqos
           - const: qcom,sa8775p-ethqos
-      - items:
-          - enum:
-              - qcom,qcs615-ethqos
-          - const: qcom,sm8150-ethqos
       - enum:
           - qcom,qcs404-ethqos
+          - qcom,qcs615-ethqos
           - qcom,sa8775p-ethqos
           - qcom,sc8280xp-ethqos
           - qcom,sm8150-ethqos

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
