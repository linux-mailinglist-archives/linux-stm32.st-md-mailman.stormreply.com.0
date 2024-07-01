Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6968091D821
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jul 2024 08:37:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 122A0C6DD9A;
	Mon,  1 Jul 2024 06:37:58 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBA17C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jul 2024 01:48:15 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45UNeK7L008799;
 Mon, 1 Jul 2024 01:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=WFZ3rpLyvbaEqpM/4Iq05h
 1u6dg1spWjaj74z8leeGQ=; b=g3RurggF4njQzSpBy00U0kleC4Txb1zGsvbgpJ
 8Z3yZzkoFQhkdwH3wB/TPbiXeSiaEj0lN190RgNRRCVka9qa+AX0YZ0hId4MutJz
 EN3gytJyqNQQGe++sxVTmmJiEArr/HCS7Ij3PGveRIakwYIOvP9VYVFc3Xi47DsY
 aVbnIWaJMxTSWamTUjBhaJSVikyrkzZMgZpWAN5PmGMkhi4jq7ek6eU+NRwwOUF1
 LiLfsYEKh5K0dnNRnhthJEdF1TxBbwT8QeHoltJ2IRj8NDe42xadLkmR3/IKzEzR
 vD0vUvnWkEldXkQzGU7GYosUT/IybJu/eED20V18Wgrtk/IA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4027mnk1a8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jul 2024 01:47:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 4611lcHI019116
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 1 Jul 2024 01:47:38 GMT
Received: from yijiyang-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 30 Jun 2024 18:47:29 -0700
From: YijieYang <quic_yijiyang@quicinc.com>
To: <vkoul@kernel.org>, <alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>,
 <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <mcoquelin.stm32@gmail.com>,
 <bartosz.golaszewski@linaro.org>, <netdev@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Mon, 1 Jul 2024 09:47:20 +0800
Message-ID: <20240701014720.2547856-1-quic_yijiyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 2gfIGHlo93uEszPcsCr5YxwpAZcB6C0B
X-Proofpoint-GUID: 2gfIGHlo93uEszPcsCr5YxwpAZcB6C0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_01,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 mlxscore=0 suspectscore=0 clxscore=1011
 mlxlogscore=979 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407010010
X-Mailman-Approved-At: Mon, 01 Jul 2024 06:37:57 +0000
Cc: kernel@quicinc.com, quic_tengfan@quicinc.com, quic_aiquny@quicinc.com,
 stable@vger.kernel.org, quic_jiegan@quicinc.com, quic_yijiyang@quicinc.com
Subject: [Linux-stm32] [PATCH] net: stmmac: dwmac-qcom-ethqos: fix error
	array size
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

From: Yijie Yang <quic_yijiyang@quicinc.com>

Correct member @num_por with size of right array @emac_v4_0_0_por for
struct ethqos_emac_driver_data @emac_v4_0_0_data.

Cc: stable@vger.kernel.org
Fixes: 8c4d92e82d50 ("net: stmmac: dwmac-qcom-ethqos: add support for emac4 on sa8775p platforms")
Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 80eb72bc6311..e8a1701cdb7c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -272,7 +272,7 @@ static const struct ethqos_emac_por emac_v4_0_0_por[] = {
 
 static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.por = emac_v4_0_0_por,
-	.num_por = ARRAY_SIZE(emac_v3_0_0_por),
+	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
 	.link_clk_name = "phyaux",

base-commit: 0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
