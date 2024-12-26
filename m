Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4829FC724
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Dec 2024 02:11:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBD12C78F6B;
	Thu, 26 Dec 2024 01:11:16 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE9A7C78F67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Dec 2024 01:11:09 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BPMxaS4025403;
 Thu, 26 Dec 2024 01:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rFKVai2c/KD7c1CSOY+DUDgjmimQTC/yEZrYib+HbDk=; b=bhJq0Jjr5emWclpN
 OK6fBocNe3sArH2kRKdtCVFuOQOrTR6wOkmyzhxwWfjWJTQM3MiUrIRoD0S2MIeg
 j/DzqhlqDJU7cA2xJxxebYUeUB34vL3nS9g/RluZWscx3zo8kPatHRy4wrbc6+0J
 dZFIADqW5BAXbxG/dNUTeaSmTrMulBSoeirjGIW/TpkLeWe5Cmep/AMXQEqKc14r
 VfvfGDd1g5TqNVgC8+UxthtjkdRLo1PyCYJIRxccIcPZc+LbaoVOuz4Vl2IFHpt+
 +IKRgd1RnGGlHMThb92DsNlOvxpZFa5fD8zoIN9j4+UUjNipYMSVmOQAIDKnpVzB
 kDogog==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rdqmtcjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Dec 2024 01:10:51 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQ1Ao1R030419
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Dec 2024 01:10:51 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Dec 2024 17:10:45 -0800
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 26 Dec 2024 09:10:18 +0800
Message-ID: <20241226011022.1477160-2-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226011022.1477160-1-quic_jiegan@quicinc.com>
References: <20241226011022.1477160-1-quic_jiegan@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: cfMKwsdLKO9LjSdWm-ah393JjHbvVKcd
X-Proofpoint-ORIG-GUID: cfMKwsdLKO9LjSdWm-ah393JjHbvVKcd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=921 impostorscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260007
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Jinlong Mao <quic_jinlmao@quicinc.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, coresight@lists.linaro.org,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v8 1/5] Coresight: Add support for new APB
	clock name
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

Add support for new APB clock-name. If the function fails
to obtain the clock with the name "apb_pclk", it will
attempt to acquire the clock with the name "apb".

Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 include/linux/coresight.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 17276965ff1d..157c4bd009a1 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -459,8 +459,11 @@ static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
 	int ret;
 
 	pclk = clk_get(dev, "apb_pclk");
-	if (IS_ERR(pclk))
-		return NULL;
+	if (IS_ERR(pclk)) {
+		pclk = clk_get(dev, "apb");
+		if (IS_ERR(pclk))
+			return NULL;
+	}
 
 	ret = clk_prepare_enable(pclk);
 	if (ret) {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
