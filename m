Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A90884C63D
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 09:26:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBA10C7800B;
	Wed,  7 Feb 2024 08:26:39 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71731C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 21:28:14 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 416J147h023727; Tue, 6 Feb 2024 21:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=qcppdkim1; bh=hEoSiQdSIeE/Z9h6sh8I
 iBbAA21LDJu25KZcrFHfcvo=; b=TBgXOWI/p8bpIG6bIIoqSlFsYmKfnbG6dlyY
 m1TdeD6wz4IWtl3vEA9zT04+StO+A+FDvgYegTSIhTVXxnjjdB+B3eI4Qf5Y0uDZ
 DtT7p1e5LOClGCfCtfywukuBL6OMJlAIPxWI0aroeXCRjK1/x15XlmMpBkjG9cJU
 wkwqqjkiUXoLXYvA3QsuVXjNzw/jh03Upr4Fk42Vzzhd3LVOwINTnzeFb0EegZuK
 tiWRQpep002lUHi9q1eRj3YvdbTdAIpZMmZZq2d37sIR72qsxEwLccNkOULG2HfH
 SEQJ21Hp5cCQcbJ8spUXI3gfsTmi2q5DX4A9hX+ebCaH/mepvw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w3hsesjav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Feb 2024 21:28:03 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 416LN76W006027; 
 Tue, 6 Feb 2024 21:27:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3w1ejm0rw8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Feb 2024 21:27:35 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 416LRYTD010370;
 Tue, 6 Feb 2024 21:27:34 GMT
Received: from hu-devc-lv-u20-a-new.qualcomm.com (hu-abchauha-lv.qualcomm.com
 [10.81.25.35])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 416LRY0u010367
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Feb 2024 21:27:34 +0000
Received: by hu-devc-lv-u20-a-new.qualcomm.com (Postfix, from userid 214165)
 id 266132207A; Tue,  6 Feb 2024 13:27:34 -0800 (PST)
From: Abhishek Chauhan <quic_abchauha@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Prasad Sodagudi <psodagud@quicinc.com>,
 Andrew Halaney <ahalaney@redhat.com>, Rob Herring <robh@kernel.org>
Date: Tue,  6 Feb 2024 13:27:34 -0800
Message-Id: <20240206212734.1209920-1-quic_abchauha@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: lfZlG20eE5DXVv3KFTogqAoLNjZneWf9
X-Proofpoint-GUID: lfZlG20eE5DXVv3KFTogqAoLNjZneWf9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_14,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 mlxlogscore=646 mlxscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1011 spamscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402060150
X-Mailman-Approved-At: Wed, 07 Feb 2024 08:26:35 +0000
Cc: kernel@quicinc.com
Subject: [Linux-stm32] [PATCH v1] TSO and TBS cannot co-exist. TBS requires
	special descriptor to be allocated at bootup. Initialising Tx
	queues at probe to support TSO and TBS can help in allocating
	those resources at bootup.
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

TX queues with TBS can support etf qdisc hw offload.

Signed-off-by: Abhishek Chauhan <quic_abchauha@quicinc.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 31631e3f89d0..d2f9b8f6c027 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -728,7 +728,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	struct qcom_ethqos *ethqos;
-	int ret;
+	int ret, i;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
 	if (ret)
@@ -822,6 +822,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}
 
+	/*Enable TSO on queue0 and enable TBS on rest of the queues*/
+	for (i = 1; i < plat_dat->tx_queues_to_use; i++)
+		plat_dat->tx_queues_cfg[i].tbs_en = 1;
+
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
