Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39680B35A05
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Aug 2025 12:22:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E29BBC3F930;
	Tue, 26 Aug 2025 10:22:50 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDAFFC36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 10:22:48 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q8lsM2001264;
 Tue, 26 Aug 2025 10:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=corp-2025-04-25; bh=S+31LDF1Z2WhM1uyqtnd3y4W2aDT6
 M/Q5pg0v1GbW40=; b=lbgXN7I4bJecbfq5XRvTpGgxj2mn3KosAiOcZH2cecWNC
 r5rx4EJimO0JbMI6MYG/2wrW6m5NbtZEXNfaTcShKugT1udXEf386JtMHfkkwlhT
 HKrIt981KqUIs2L0kLuuksjluhwxYETMCFlg2f6EWpOtDoMKUigsgf8qpZJ1zjJh
 WDXFMX73+n2iwbLynE7L/XpJlzPUa45y9TNTjIq/yufzLTiyRB7hBlLtsCIicDZG
 TruwIbX6EzbuhMw1i5tUhD0+MQTj8JYbPALqPyFhbfqFK6QIaIcj8Mgf6U2qHoW/
 a+xZYykqn9ZOIrLeS3vnQb+a6zU1/Yo+kRl5NK2RQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q5pt46pr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Aug 2025 10:22:23 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 57QAIxI8004960; Tue, 26 Aug 2025 10:22:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 48q439hy0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Aug 2025 10:22:22 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57QAML6S028589;
 Tue, 26 Aug 2025 10:22:21 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 48q439hy0j-1; Tue, 26 Aug 2025 10:22:21 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: david.wu@rock-chips.com, jonas@kwiboo.se, rmk+kernel@armlinux.org.uk,
 mcoquelin.stm32@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Tue, 26 Aug 2025 03:22:15 -0700
Message-ID: <20250826102219.49656-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508260091
X-Proofpoint-ORIG-GUID: A1rNZuMOzBCLBqP3JjLXHJ8H1V0uDCAP
X-Proofpoint-GUID: A1rNZuMOzBCLBqP3JjLXHJ8H1V0uDCAP
X-Authority-Analysis: v=2.4 cv=EcXIQOmC c=1 sm=1 tr=0 ts=68ad8adf b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117
 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=2OwXVqhp2XgA:10 a=yPCof4ZbAAAA:8 a=drNr5Ij397O-Cq_uu80A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMCBTYWx0ZWRfX3TR+YKZXLVXZ
 xl2yVtGEp/AIv0M866KYyb+u8f5fb7ceY2nkPFimDfmLd2nqCucW8HjqC2dbr7rg1V5Wf9ShqOa
 04A2YOBt96ozsA5MXyWo7qDXPi61+qrgissBks4ME/knlm1W1S6fE0eggX3UjipTE9Vl+ecnXBa
 qnwHUtEqxhWiKrhahiGKHu5niwRjcdA7zrTL3+HtV8FU/y8wLVwvuoFh6PleEtG0ITNy5PAoCJ1
 CwKGoMj74OgW3g8wxykn52SNhGQFTTk+REiQCmMjgoc/3ZSbmwaJXiLgk4IgG+n14/Q0Vt+5MXF
 KTDIb0e9zts1Sl5HFr9m6vISoThoZPb6wNVspCBhrU9p9gKhM3Pe0sbmrP6govHmvUaKYGB/xvE
 gGcmYWt+
Cc: alok.a.tiwari@oracle.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: rk: remove incorrect
	_DLY_DISABLE bit definition
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

The RK3328 GMAC clock delay macros define enable/disable controls for
TX and RX clock delay. While the TX definitions are correct, the
RXCLK_DLY_DISABLE macro incorrectly clears bit 0.

The macros RK3328_GMAC_TXCLK_DLY_DISABLE and
RK3328_GMAC_RXCLK_DLY_DISABLE are not referenced anywhere
in the driver code. Remove them to clean up unused definitions.

No functional change.

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index f6687c2f30f6..9e9ae8525720 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -557,9 +557,7 @@ static const struct rk_gmac_ops rk3308_ops = {
 #define RK3328_GMAC_RMII_MODE		GRF_BIT(9)
 #define RK3328_GMAC_RMII_MODE_CLR	GRF_CLR_BIT(9)
 #define RK3328_GMAC_TXCLK_DLY_ENABLE	GRF_BIT(0)
-#define RK3328_GMAC_TXCLK_DLY_DISABLE	GRF_CLR_BIT(0)
 #define RK3328_GMAC_RXCLK_DLY_ENABLE	GRF_BIT(1)
-#define RK3328_GMAC_RXCLK_DLY_DISABLE	GRF_CLR_BIT(0)
 
 /* RK3328_GRF_MACPHY_CON1 */
 #define RK3328_MACPHY_RMII_MODE		GRF_BIT(9)
-- 
2.50.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
