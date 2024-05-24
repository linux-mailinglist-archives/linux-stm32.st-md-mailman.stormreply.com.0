Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DC28CE5BC
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2024 15:07:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9864C6DD94;
	Fri, 24 May 2024 13:07:50 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 423B4C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2024 13:07:44 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44O9ujiA004129;
 Fri, 24 May 2024 13:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:date:from:message-id:subject:to; s=qcppdkim1; bh=1SjAWjxwhCpY
 IAunb2rlZu0shKtos6jUMCY+koqFFxM=; b=KZtz3wQNB6pRdqzXl8DfIj0xYnTY
 GJOk4ngnvRFY9oAPFrVq/gcseiUsH3v4Dod23V4exXiSe/atY+CwZdIxak2zwVNJ
 3U9nW5RVRyeSWLADCzRD0zG0bdLYIa9HkqGFsICGmL9zCrckqzlCQ/xR5g+DrjZH
 Ij/eJUoIYZtBd2r92ufQIB7VHt8vcnAYGI1NJEYl2GaYpxO8KVu3oOxif3LoC1cL
 ljp+2NiFxodZmego+zbYJSq4kvz5qxxvpDTb/Wg3392JntQA2lZC84+aY+KwBziX
 Chn4WR2Ie53gb70zLOwAA47pkKYCLxBHt7gzGyBEZo7eJ3TYz+pbXdUGoA==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa8j2gtj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 May 2024 13:07:11 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 44OD779I013837; 
 Fri, 24 May 2024 13:07:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3y9qgsns5p-1;
 Fri, 24 May 2024 13:07:07 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44OD77nC013832;
 Fri, 24 May 2024 13:07:07 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-snehshah-hyd.qualcomm.com
 [10.147.246.35])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 44OD77X5013831;
 Fri, 24 May 2024 13:07:07 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2319345)
 id 1D4595006A4; Fri, 24 May 2024 18:37:06 +0530 (+0530)
From: Sneh Shah <quic_snehshah@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andrew Halaney <ahalaney@redhat.com>, Russell King <linux@armlinux.org.uk>
Date: Fri, 24 May 2024 18:36:51 +0530
Message-Id: <20240524130653.30666-1-quic_snehshah@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: NQZ76c2JKnYk2lTbokweHnzvtyTnhbRf
X-Proofpoint-ORIG-GUID: NQZ76c2JKnYk2lTbokweHnzvtyTnhbRf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_04,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 clxscore=1011 phishscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2405240090
Cc: Sneh Shah <quic_snehshah@quicinc.com>, kernel@quicinc.com
Subject: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: Add 2500BASEX
	support for integrated PCS
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Qcom mac supports both SGMII and 2500BASEX with integrated PCS.
Add changes to enable 2500BASEX along woth SGMII.

Sneh Shah (2):
  net: stmmac: Add support for multiple phy interface for integrated PCS
  net: stmmac: dwmac-qcom-ethqos: Enable support for 2500BASEX

 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 11 +++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     |  3 +++
 include/linux/stmmac.h                                |  1 +
 3 files changed, 15 insertions(+)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
