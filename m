Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 469CE926B51
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2024 00:16:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB916C71282;
	Wed,  3 Jul 2024 22:16:09 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BC3EC71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2024 22:16:01 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 463H94ZV032097;
 Wed, 3 Jul 2024 22:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=bH5mLRWToa45CvSBqBIx2T
 QFf1I020B8oPm5J9wOF68=; b=FTlEPOpoUA/Dp8TT4/tTtcIxb33/OT+Xvi/kEg
 j6IpgYTyO76gcRTc0S8LBGTIk8VaQYLpPQqWMJm065Gbuu66as77YJKiB/N+xMvO
 uSehqpF9LAOifqyqClqv2lmmxjGz02/qe8fFf76Gg7eJs67DhcUNdaFZ59DiSrSl
 yh66RDsWqmoyIlCLXbOnpPdJNPXZXI1YJc3bDbXFQZz/N6X3pKVBeJZL/04ksek1
 zoD49D2gowJL8RFLTSR2VWQBxAOBP3to07GStjIX3ZvfwSFtOLWUIs1rxkkHgd+S
 SA5CdrFAHkK3ps/kEH6fz5bhZCBn62toe7Ml9nMYlR/tV4dQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402abtsxpx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jul 2024 22:15:40 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 463MFd1J014098
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 Jul 2024 22:15:39 GMT
Received: from hu-scheluve-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 3 Jul 2024 15:15:36 -0700
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Date: Wed, 3 Jul 2024 15:15:20 -0700
Message-ID: <20240703-icc_bw_voting_from_ethqos-v3-0-8f9148ac60a3@quicinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHnNhWYC/33NQQ6CMBCF4auYrq1pR6jgynsYQ2CYwiyk2mLVE
 O5uMTHRjcv/JfPNJAJ5piD2q0l4ihzYDSm265XAvh46ktymFqAgU0YryYhVc6+iG3noKuvduaK
 xv7ogNdgcDbWZQRDp/uLJ8uNtH0+pew6j88/3q6iX9aOWf9SopZJGayizoikgp8P1xsgDbtCdx
 eJG+LIg/2dBsqiud2hLZZRVv9Y8zy/CDtcaEAEAAA==
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
X-Proofpoint-GUID: LWej0WdK370tmzv6wv8-c6a4GfXp993W
X-Proofpoint-ORIG-GUID: LWej0WdK370tmzv6wv8-c6a4GfXp993W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_16,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407030165
Cc: Andrew Lunn <andrew@lunn.ch>, kernel@quicinc.com,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH v3 0/2] Add interconnect support for stmmac
	driver.
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

Interconnect is a software framework to access NOC bus topology
of the system, this framework is designed to provide a standard
kernel interface to control the settings of the interconnects on
an SoC.
The interconnect support is now being added to the stmmac driver
so that any vendors who wants to use this feature can just
define corresponging dtsi properties according to their
NOC bus topologies. 

Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
---
Changes in v3:
- Drop the patch:
	[PATCH v2 3/3] net: stmmac: Bring down the clocks to lower frequencies when mac link goes down.
- Modify the dt-bindings property names from "axi" and "ahb" to "mac-mem" and
  "cpu-mac" respectively.
- Link to v2: https://lore.kernel.org/r/20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com

Changes in v2:
- Edit the cover letter to give a big picture of this change.
- Move the interconnect changes from ethqos driver to stmmac driver.
- Reorder the the patches to place bindings patch on the top.
- Remove "_icc_path" redundant string from the "interconnect-names" property.
- Link to v1: https://lore.kernel.org/r/20240619-icc_bw_voting_from_ethqos-v1-0-6112948b825e@quicinc.com

---
Sagar Cheluvegowda (2):
      dt-bindings: net: qcom: ethernet: Add interconnect properties
      net: stmmac: Add interconnect support

 Documentation/devicetree/bindings/net/qcom,ethqos.yaml |  8 ++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac.h           |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c      |  8 ++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c  | 12 ++++++++++++
 include/linux/stmmac.h                                 |  2 ++
 5 files changed, 31 insertions(+)
---
base-commit: 8a92980606e3585d72d510a03b59906e96755b8a
change-id: 20240610-icc_bw_voting_from_ethqos-12f5c6ed46c2

Best regards,
-- 
Sagar Cheluvegowda <quic_scheluve@quicinc.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
