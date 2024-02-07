Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE97884D5EB
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 23:40:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99E97C6B476;
	Wed,  7 Feb 2024 22:40:20 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E74C2C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Feb 2024 22:40:19 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 417MaNCb031282; Wed, 7 Feb 2024 22:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=qcppdkim1; bh=e8IsPVmgS02K5pCUVYuT
 MXKVbfZtogBhFG4sXIhGNwI=; b=R9C+9KFfow99zushQ5JA9lx4DAkKwj/on5rG
 hkes4Kig9Z1f+IFQft1b9VVaIu6CfGJL2QUp074Io8N1jonggDWaGsMcjx78fo/Q
 EyGfNNRzl/BztRqyYvIX2KcQSonF880z70DA9woelnDCplMxeQoD8+Uy0MO94Tlv
 2cD8z673DaX22AMMudIZriNTcqFE3J+vmjIE5lOi2VzzmZqslD5rAEFzPfERLeTj
 5jpwRetaJJZK1QTySEV4zQF4hl/s5pvzrTDIO4qzA/ysSvowGLVZpOOQgfIWr33o
 eb6TlE7PnFNG0ezAOfvuFks+jG+GrF3nVEx2ZyYbNMRrY/Xe7Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w4hhk85hh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Feb 2024 22:40:03 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 417Me284024292; 
 Wed, 7 Feb 2024 22:40:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3w47rjkww5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Feb 2024 22:40:02 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 417Me2Si024265;
 Wed, 7 Feb 2024 22:40:02 GMT
Received: from hu-devc-lv-u20-a-new.qualcomm.com (hu-abchauha-lv.qualcomm.com
 [10.81.25.35])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 417Me1Sg024240
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Feb 2024 22:40:02 +0000
Received: by hu-devc-lv-u20-a-new.qualcomm.com (Postfix, from userid 214165)
 id BA973220E1; Wed,  7 Feb 2024 14:40:01 -0800 (PST)
From: Abhishek Chauhan <quic_abchauha@quicinc.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andrew Halaney <ahalaney@redhat.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Wed,  7 Feb 2024 14:40:01 -0800
Message-Id: <20240207224001.2109224-1-quic_abchauha@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: CUSyoBKPajMxG-bRe_wXkb7umQSdrnsz
X-Proofpoint-GUID: CUSyoBKPajMxG-bRe_wXkb7umQSdrnsz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-07_09,2024-02-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=819 spamscore=0 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402070167
Cc: kernel@quicinc.com
Subject: [Linux-stm32] [PATCH net-next v3] net: stmmac: dwmac-qcom-ethqos:
	Enable TBS on all queues but 0
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

TSO and TBS cannot co-exist. TBS requires special descriptor to be
allocated at bootup. Initialising Tx queues at probe to support
TSO and TBS can help in allocating those resources at bootup.

TX queues with TBS can support etf qdisc hw offload.

This is similar to the patch raised by NXP
commit 3b12ec8f618e ("net: stmmac: dwmac-imx: set TSO/TBS TX queues default 
settings")

Changes since v2:
- Fixed the styling of comment in the dwmac-qcom-ethqos.c
- Followed the upstream format to give other glue
  driver references to solve the same problem
- Appended  the subject with net-next
- Discussion of why this patch is required is discussed in
https://lore.kernel.org/netdev/c2497eef-1041-4cd0-8220-42622c8902f4@quicinc.com/

Changes since v1:
- Subject is changed as per upstream guidelines
- Added a reference of a similar change done by NXP in
  body of the commit message

Signed-off-by: Abhishek Chauhan <quic_abchauha@quicinc.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 31631e3f89d0..2691a250a5a7 100644
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
 
+	/* Enable TSO on queue0 and enable TBS on rest of the queues */
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
