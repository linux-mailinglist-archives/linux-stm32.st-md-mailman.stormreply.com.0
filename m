Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C948292AB36
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jul 2024 23:30:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E89FC7129D;
	Mon,  8 Jul 2024 21:30:44 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FE93C6DD96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jul 2024 21:30:40 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 468BpIvR004638;
 Mon, 8 Jul 2024 21:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5gx2z++go3lmdlJ7suDIvslktQNjYu4UWvXHRKPW/EM=; b=mPpK/d9bbUqJ4Wnb
 LS524FynlUzpSmTnOyUXv0SaT3qZ0kq1UkBri4PoWyl/7/8i2LEiMM21jOMzfrAw
 b9aRiaYzVVzyyRmKqzNyggZd0n3vuogV9sZVKKXOK9zxdQOxKQ2hgUEi8QBQYGdc
 aATcMYhwgZVzkTHSMAYKIFPUVex0JHhJ1br/XNg7bO6ydy6Th38n6MWVVmi3VZYY
 Pu5oyg85EonGzoOlgAlzuAbkio0+o6X1wBW7+o8Uags7KNtcTo3nQBz1bukTd0wu
 tYT7WBtIoNvxO84Qjn/CsSKG2vfzyRV67Iba9hZNK6WSHpyFg1eOQt1vemr8WdyN
 BFRABg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406y77mp6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jul 2024 21:30:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 468LUIdS019356
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 8 Jul 2024 21:30:18 GMT
Received: from hu-scheluve-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 8 Jul 2024 14:30:15 -0700
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Date: Mon, 8 Jul 2024 14:30:00 -0700
MIME-Version: 1.0
Message-ID: <20240708-icc_bw_voting_from_ethqos-v4-1-c6bc3db86071@quicinc.com>
References: <20240708-icc_bw_voting_from_ethqos-v4-0-c6bc3db86071@quicinc.com>
In-Reply-To: <20240708-icc_bw_voting_from_ethqos-v4-0-c6bc3db86071@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "Rob Herring" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: KEABypneJIyz-_vTJGUDyleVX9Uww1En
X-Proofpoint-ORIG-GUID: KEABypneJIyz-_vTJGUDyleVX9Uww1En
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_11,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407080159
Cc: Andrew Lunn <andrew@lunn.ch>, kernel@quicinc.com,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH v4 1/2] dt-bindings: net: qcom: ethernet: Add
 interconnect properties
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

Add documentation for the interconnect and interconnect-names
properties required when voting for AHB and AXI buses.

Suggested-by: Andrew Halaney <ahalaney@redhat.com>
Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
---
 Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 6672327358bc..f0e8eaf51137 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -63,6 +63,14 @@ properties:
 
   dma-coherent: true
 
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-mac
+      - const: mac-mem
+
   phys: true
 
   phy-names:

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
