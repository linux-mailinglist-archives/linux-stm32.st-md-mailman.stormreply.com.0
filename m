Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D538A92542B
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2024 08:53:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98CFCC7A827;
	Wed,  3 Jul 2024 06:53:38 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD809C71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2024 04:04:04 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46309Dwt031958;
 Wed, 3 Jul 2024 04:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EOEpphO4LaNPos5mx0HCqe8gIRoKbVphLv1GNBTvkTE=; b=dfCZmhjO4h3xQL4h
 G6hasVrYnmqliNT3k3wDGpltTz/Zdq1QnrZyCPi9dhicdXpYxldjXD0ijgbvDPJR
 M67rWNMATT7cJADr7VDnqz+1ExVJCGw2xXb1ElVPfV7+QPvBqCTZupnVplMcO8EQ
 UNkBJ23G8nkwg8mUCxY2PyJiAG/wXtxxhFXH8Pz6TAZGhhwZK6Ot9hcpiphVBiKo
 oTS/LNG9SsO+h9rqepdhLzGrGjTjZJ/Wp/6SBHMCwcXzzBu/rKAgIk0IOBqwAEIz
 TNxwhdseYqb2YnDO/6cfOHjw6jBzgrYLpd5zrMCzi7VYPykjn9j01VNmNtJcNNzL
 j3VLtw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402bejsxy4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jul 2024 04:03:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46343Y3s023838
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 Jul 2024 04:03:34 GMT
Received: from tengfan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 2 Jul 2024 21:03:12 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <djakov@kernel.org>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>,
 <jassisinghbrar@gmail.com>, <herbert@gondor.apana.org.au>,
 <davem@davemloft.net>, <manivannan.sadhasivam@linaro.org>,
 <will@kernel.org>, <joro@8bytes.org>, <conor@kernel.org>,
 <tglx@linutronix.de>, <amitk@kernel.org>, <thara.gopinath@gmail.com>,
 <linus.walleij@linaro.org>, <wim@linux-watchdog.org>,
 <linux@roeck-us.net>, <rafael@kernel.org>, <viresh.kumar@linaro.org>,
 <vkoul@kernel.org>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <mcoquelin.stm32@gmail.com>
Date: Wed, 3 Jul 2024 11:57:03 +0800
Message-ID: <20240703035735.2182165-16-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240703035735.2182165-1-quic_tengfan@quicinc.com>
References: <20240703025850.2172008-1-quic_tengfan@quicinc.com>
 <20240703035735.2182165-1-quic_tengfan@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: LsEaNwI5f9wWe7S8T24tYRX68f-GyTqX
X-Proofpoint-ORIG-GUID: LsEaNwI5f9wWe7S8T24tYRX68f-GyTqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_18,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=496
 impostorscore=0 spamscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407030028
X-Mailman-Approved-At: Wed, 03 Jul 2024 06:53:34 +0000
Cc: joabreu@synopsys.com, ulf.hansson@linaro.org, quic_kaushalk@quicinc.com,
 quic_gurus@quicinc.com, kw@linux.com, linux-pci@vger.kernel.org,
 lpieralisi@kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 srinivas.kandagatla@linaro.org, alim.akhtar@samsung.com,
 quic_rjendra@quicinc.com, otto.pflueger@abscue.de,
 linux-riscv@lists.infradead.org, quic_tsoni@quicinc.com,
 linux-clk@vger.kernel.org, linux-watchdog@vger.kernel.org, kishon@kernel.org,
 quic_sibis@quicinc.com, kernel@quicinc.com, quic_bjorande@quicinc.com,
 bvanassche@acm.org, linux-scsi@vger.kernel.org, bartosz.golaszewski@linaro.org,
 quic_tingweiz@quicinc.com, daniel.lezcano@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, luca@z3ntu.xyz,
 iommu@lists.linux.dev, agross@kernel.org, danila@jiaxyga.com,
 u.kleine-koenig@pengutronix.de, rui.zhang@intel.com, ahalaney@redhat.com,
 quic_rgottimu@quicinc.com, bhupesh.sharma@linaro.org,
 quic_devipriy@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_nitirawa@quicinc.com, athierry@redhat.com,
 Tengfei Fan <quic_tengfan@quicinc.com>, avri.altman@wdc.com,
 robimarko@gmail.com, quic_rohiagar@quicinc.com, bhelgaas@google.com,
 peppe.cavallaro@st.com, quic_cang@quicinc.com, quic_shashim@quicinc.com,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 quic_kbajaj@quicinc.com, linux-gpio@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_msarkar@quicinc.com, quic_wcheng@quicinc.com,
 krzysztof.kozlowski@linaro.org, quic_tdas@quicinc.com, mantas@8devices.com,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 dmitry.baryshkov@linaro.org, abel.vesa@linaro.org, robin.murphy@arm.com,
 quic_aiquny@quicinc.com, lukasz.luba@arm.com
Subject: [Linux-stm32] [PATCH 15/47] dt-bindings: usb: dwc3: Add QCS9100
	compatible
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

Document the QCS9100 dwc3 compatible.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index efde47a5b145..07b0b6530b78 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,msm8998-dwc3
           - qcom,qcm2290-dwc3
           - qcom,qcs404-dwc3
+          - qcom,qcs9100-dwc3
           - qcom,qdu1000-dwc3
           - qcom,sa8775p-dwc3
           - qcom,sc7180-dwc3
@@ -199,6 +200,7 @@ allOf:
               - qcom,msm8953-dwc3
               - qcom,msm8996-dwc3
               - qcom,msm8998-dwc3
+              - qcom,qcs9100-dwc3
               - qcom,sa8775p-dwc3
               - qcom,sc7180-dwc3
               - qcom,sc7280-dwc3
@@ -448,6 +450,7 @@ allOf:
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,msm8994-dwc3
+              - qcom,qcs9100-dwc3
               - qcom,qdu1000-dwc3
               - qcom,sa8775p-dwc3
               - qcom,sc7180-dwc3
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
