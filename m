Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF7FA178D5
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jan 2025 08:56:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12424C78F75;
	Tue, 21 Jan 2025 07:56:13 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 136E2C78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2025 07:56:05 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L75eME023981;
 Tue, 21 Jan 2025 07:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=lKKjys+gGGnp0WGSBxeQlM
 1KYNgvFJQAf6tDb78EtIU=; b=M6g118mdxOZ/KCNsj5DVM6g35NauvH9VEb13P8
 YYE9ocjr83TuiNJhFfIFMHSdRDjzeABFTxuHXGz4E5B8nc1mYPKLm/5blB4823qI
 9sAkXvzoqngfptv6878bs3FKertg1vKrKHzZ7HTNCvamtaLPeg50YK9bIs7c+4AO
 /EEdlCZMZDtRVnCQRyTWczUFaSsPx97++9PQB2ZQ8i8eiaokZbbpKIb/0pjHQaW4
 FlzfpyWBkgaQl0wQQFxQjz3ZluZsptHP/rvgpkfnx4IpBpK1E5f8LDycIspe1xEH
 zJhkOL8Oo26Lpmb+7QnaAjI7qsPrT1wCs6W2VBFy9l18Oh9Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a6vxr3t9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jan 2025 07:55:49 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50L7tmw4009762
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jan 2025 07:55:48 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 20 Jan 2025 23:55:43 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Tue, 21 Jan 2025 15:54:52 +0800
Message-ID: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAM1Sj2cC/52PzWrDMBCEX8Xo3C3SRjGxKaXvEUrQz7rSwXIjK
 SIl+N0rKw3k3OOwM9/M3lii6CmxsbuxSMUnv4Qqdi8dM06FLwJvq2bIUQpECTan09mkXuxh6AX
 SRIqj0awGviNN/tpgx8+qtUoEOqpg3Iag7E41/eeMdL7Utny3371mmWefxy7QNUNt3HOBfPPPl
 JJqW8bu7XGAZBzN6rGmSBBgB1tXToeBevlRC4wP5rVi39k2yPmUl/jTni2i9ba/hDg8/1UQOFC
 PekCpdkbbZ1IDFfxveF3XX0PMeN50AQAA
X-Change-ID: 20241224-dts_qcs615-9612efea02cb
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Richard Cochran <richardcochran@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737446142; l=1935;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=yeDtVAfZf8pjluEx+AHPEsNHNG8C2eDvzSuz34ecoUM=;
 b=rLfghjpQK08dAeSEBVLY/pqJOqRDd/k1MH2W3j0PUR3wntCRMMjdiFdYk9UfvQ9zZDgiI+nsB
 jmXkMsPQxLGCXjsdZL0P8qUrE7HMUNzx1C94ew9dIdFXCf7aBRWP8Ba
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 86J6iJ-skcCMiSzZx0ItXHpghhFdjuXp
X-Proofpoint-ORIG-GUID: 86J6iJ-skcCMiSzZx0ItXHpghhFdjuXp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_04,2025-01-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 mlxlogscore=658 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 spamscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210064
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yijie Yang <quic_yijiyang@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/4] Enable ethernet on qcs615
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

Correct the definition and usage of phy-mode in both the DT binding and
driver code.
Add dts nodes and EMAC driver data to enable ethernet interface on
qcs615-ride platform.
The EMAC version currently in use on this platform is the same as that in
qcs404. The EPHY model is Micrel KSZ9031.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
Changes in v3:
- Correct the definition of 'rgmii' in ethernet-controller.yaml.
- Remove the redundant max-speed limit in the dts file.
- Update the definition of 'rgmii' to prevent any further misunderstandings.
- Update the phy-mode in the dts file from rgmii to rgmii-id.
- Mask the PHY mode passed to the driver to allow the MAC to add the delay.
- Update the low power mode exit interrupt from 662 to 661.
- Update the compatible string to fallback to qcs404 since they share the same hardware.
- Update base commit to next-20250120.
- Link to v2: https://lore.kernel.org/r/20241118-dts_qcs615-v2-0-e62b924a3cbd@quicinc.com

---
Yijie Yang (4):
      dt-bindings: net: ethernet-controller: Correct the definition of phy-mode
      net: stmmac: dwmac-qcom-ethqos: Mask PHY mode if configured with rgmii-id
      arm64: dts: qcom: qcs615: add ethernet node
      arm64: dts: qcom: qcs615-ride: Enable ethernet node

 .../bindings/net/ethernet-controller.yaml          |   2 +-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           | 104 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi               |  34 +++++++
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |  18 +++-
 4 files changed, 152 insertions(+), 6 deletions(-)
---
base-commit: 9424d9acada6461344c71ac02f2f3fbcdd775498
change-id: 20241224-dts_qcs615-9612efea02cb
prerequisite-message-id: <20250120-schema_qcs615-v4-1-d9d122f89e64@quicinc.com>
prerequisite-patch-id: b97f36116c87036abe66e061db82588eb1bbaa9a

Best regards,
-- 
Yijie Yang <quic_yijiyang@quicinc.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
