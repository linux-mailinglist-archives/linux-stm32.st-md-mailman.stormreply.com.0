Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 127069A1637
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2024 01:43:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2056C78032;
	Wed, 16 Oct 2024 23:43:48 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C35D4C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 23:43:40 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GFZ5ck031190;
 Wed, 16 Oct 2024 23:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=PoptnNQjpy7KzQnAGBh397vPhEkphNEtT9N
 WA0DvFrs=; b=Tv4XxIqEAIyf89NliXJVIA9ZvMTOBoNZfvV/0WuU6U4ZGdg8Tx8
 8drqM+fSDqgnTRZVFWnEj6MZh2UGuaEHpsnW+beBEotpZdQGC+lylOLuvGEm4+Zu
 iD2UHPQG3+QKmQd7Eo2M9VczSs5KVHhcDPohhZstQL55GPXW5uv7aUIreoPxmXPG
 OB6j7g7r3JgBpPW4rkB8nHceZ5UToTwx/Una8VTtBUxgsm3VgOscgLOSxol5q6mX
 qkWDJCtbTUAnDDnhWeifHxBaYSnyStocvpQQuCGKfz6oAa6/KEr4MXeVl5RYjPDC
 5Gz6NJJMxQQ2Xi5nGZ43OK0ngh3aF8Fsk+A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a8nq2rjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2024 23:43:15 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 49GNhEgN017699; 
 Wed, 16 Oct 2024 23:43:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 42aj29akn2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2024 23:43:14 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49GNhEri017690;
 Wed, 16 Oct 2024 23:43:14 GMT
Received: from hu-devc-lv-u20-c-new.qualcomm.com (hu-abchauha-lv.qualcomm.com
 [10.47.232.24])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 49GNhDpU017686
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2024 23:43:14 +0000
Received: by hu-devc-lv-u20-c-new.qualcomm.com (Postfix, from userid 214165)
 id CDD332205B; Wed, 16 Oct 2024 16:43:13 -0700 (PDT)
From: Abhishek Chauhan <quic_abchauha@quicinc.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>, Simon Horman <horms@kernel.org>,
 Ong@qualcomm.com, Boon Leong <boon.leong.ong@intel.com>,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 Tan Tee Min <tee.min.tan@linux.intel.com>,
 Jon Hunter <jonathanh@nvidia.com>
Date: Wed, 16 Oct 2024 16:43:13 -0700
Message-Id: <20241016234313.3992214-1-quic_abchauha@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 7D7Tx1968-QcmGJh_vHHQ3TmmTBR18t-
X-Proofpoint-GUID: 7D7Tx1968-QcmGJh_vHHQ3TmmTBR18t-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 clxscore=1011
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160151
Cc: kernel@quicinc.com
Subject: [Linux-stm32] [PATCH net-next v2] net: stmmac: Programming sequence
	for VLAN packets with split header
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

Currently reset state configuration of split header works fine for
non-tagged packets and we see no corruption in payload of any size

We need additional programming sequence with reset configuration to
handle VLAN tagged packets to avoid corruption in payload for packets
of size greater than 256 bytes.

Without this change ping application complains about corruption
in payload when the size of the VLAN packet exceeds 256 bytes.

With this change tagged and non-tagged packets of any size works fine
and there is no corruption seen.

Current configuration which has the issue for VLAN packet
----------------------------------------------------------

Split happens at the position at Layer 3 header
|MAC-DA|MAC-SA|Vlan Tag|Ether type|IP header|IP data|Rest of the payload|
                         2 bytes            ^
                                            |

With the fix we are making sure that the split happens now at
Layer 2 which is end of ethernet header and start of IP payload

Ip traffic split
-----------------

Bits which take care of this are SPLM and SPLOFST
SPLM = Split mode is set to Layer 2
SPLOFST = These bits indicate the value of offset from the beginning
of Length/Type field at which header split should take place when the
appropriate SPLM is selected. Reset value is 2bytes.

Un-tagged data (without VLAN)
|MAC-DA|MAC-SA|Ether type|IP header|IP data|Rest of the payload|
                  2bytes ^
			 |

Tagged data (with VLAN)
|MAC-DA|MAC-SA|VLAN Tag|Ether type|IP header|IP data|Rest of the payload|
                          2bytes  ^
				  |

Non-IP traffic split such AV packet
------------------------------------

Bits which take care of this are
SAVE = Split AV Enable
SAVO = Split AV Offset, similar to SPLOFST but this is for AVTP
packets.

|Preamble|MAC-DA|MAC-SA|VLAN tag|Ether type|IEEE 1722 payload|CRC|
				    2bytes ^
					   |

Signed-off-by: Abhishek Chauhan <quic_abchauha@quicinc.com>
---
Changes since v1
- took care of comments from Simon on FIELD_PREP
- explained the details of l2 and l3 split as requested by Andrew
- Added folks from intel and Nvidia who disabled split header
  need to check if they faced similar issues and if this fix  
  can help them too. 

Changes since v0
- The reason for posting it on net-next is to enable this new feature.



 drivers/net/ethernet/stmicro/stmmac/dwmac4.h     | 5 +++++
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index 93a78fd0737b..28fff6cab812 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -44,6 +44,7 @@
 #define GMAC_MDIO_DATA			0x00000204
 #define GMAC_GPIO_STATUS		0x0000020C
 #define GMAC_ARP_ADDR			0x00000210
+#define GMAC_EXT_CFG1			0x00000238
 #define GMAC_ADDR_HIGH(reg)		(0x300 + reg * 8)
 #define GMAC_ADDR_LOW(reg)		(0x304 + reg * 8)
 #define GMAC_L3L4_CTRL(reg)		(0x900 + (reg) * 0x30)
@@ -284,6 +285,10 @@ enum power_event {
 #define GMAC_HW_FEAT_DVLAN		BIT(5)
 #define GMAC_HW_FEAT_NRVF		GENMASK(2, 0)
 
+/* MAC extended config 1 */
+#define GMAC_CONFIG1_SAVE_EN		BIT(24)
+#define GMAC_CONFIG1_SPLM(v)		FIELD_PREP(GENMASK(9, 8), v)
+
 /* GMAC GPIO Status reg */
 #define GMAC_GPO0			BIT(16)
 #define GMAC_GPO1			BIT(17)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
index e0165358c4ac..7c895e0ae71f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
@@ -526,6 +526,11 @@ static void dwmac4_enable_sph(struct stmmac_priv *priv, void __iomem *ioaddr,
 	value |= GMAC_CONFIG_HDSMS_256; /* Segment max 256 bytes */
 	writel(value, ioaddr + GMAC_EXT_CONFIG);
 
+	value = readl(ioaddr + GMAC_EXT_CFG1);
+	value |= GMAC_CONFIG1_SPLM(1); /* Split mode set to L2OFST */
+	value |= GMAC_CONFIG1_SAVE_EN; /* Enable Split AV mode */
+	writel(value, ioaddr + GMAC_EXT_CFG1);
+
 	value = readl(ioaddr + DMA_CHAN_CONTROL(dwmac4_addrs, chan));
 	if (en)
 		value |= DMA_CONTROL_SPH;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
