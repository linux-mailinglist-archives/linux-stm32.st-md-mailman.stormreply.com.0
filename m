Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAB8808489
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Dec 2023 10:27:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28A91C6B475;
	Thu,  7 Dec 2023 09:27:01 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 118D5C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Dec 2023 09:26:58 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B79QIV5011931; Thu, 7 Dec 2023 09:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=+uh7qxnuBPPrGZ8PMa6CKhUYOybpe6G0XLx55F8ufkg=;
 b=hKG9yuGIi9QoKrqUN1sGUYwCrl8LG28Zx8ISFuVyyAbX/PshJFE6v3Y1l7aHfd3C5RAO
 1ITNPhYIcI1WnkLUsfEUBZeyf+dcyuHH6H+qH47fldgC3b8CL5w7pGw8AqHG3q9gFmmV
 AZgNytivyBvjIBMWtG/JKNG5V30o3orthARx+WQgSrkFDnwVV7oE4A1jX5zOSTm5TLhS
 rGC+BV+0l23Yh9XsdaTmuNIBdoeLloQx5H2du7sfdKEQ3rwcvfLaGJE0hqfj9c5EC2nb
 Dj+dxcht9uUsLq3c5N2CRZ0hgu66+8Jgm6LEeUfzSX10ZjjbClGLyT0uwGB1VKCQJ6k/ gw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uubdm0028-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Dec 2023 09:26:45 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B79Qins007139
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 7 Dec 2023 09:26:44 GMT
Received: from hu-jsuraj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 7 Dec 2023 01:21:49 -0800
From: Suraj Jaiswal <quic_jsuraj@quicinc.com>
To: <quic_jsuraj@quicinc.com>, Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma
 <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "Jose Abreu" <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 Prasad Sodagudi <psodagud@quicinc.com>,
 Andrew Halaney <ahalaney@redhat.com>
Date: Thu, 7 Dec 2023 14:51:24 +0530
Message-ID: <cover.1701939695.git.quic_jsuraj@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: p3K8wkCLzuE8jFCKH2nso6_PVryPaioy
X-Proofpoint-GUID: p3K8wkCLzuE8jFCKH2nso6_PVryPaioy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-07_07,2023-12-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=965
 adultscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312070076
Cc: kernel@quicinc.com
Subject: [Linux-stm32] [PATCH net-next v4 0/3] Ethernet DWMAC5 fault IRQ
	support
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

Add support to listen Ethernet HW safery IRQ. The safety IRQ will be
triggered for ECC, DPP, FSM error.

Changes since v4:
- Fix DT_CHECKER warning
- use name safety for the IRQ.

Suraj Jaiswal (3):
  dt-bindings: net: qcom,ethqos: add binding doc for safety IRQ for
    sa8775p
  arm64: dts: qcom: sa8775p: enable safety IRQ
  net: stmmac: Add driver support for DWMAC5 safety IRQ Support

 .../devicetree/bindings/net/qcom,ethqos.yaml   |  9 ++++++---
 .../devicetree/bindings/net/snps,dwmac.yaml    |  6 ++++--
 arch/arm64/boot/dts/qcom/sa8775p.dtsi          | 10 ++++++----
 drivers/net/ethernet/stmicro/stmmac/common.h   |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac.h   |  2 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c  |  9 +++++++++
 7 files changed, 46 insertions(+), 9 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
