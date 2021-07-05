Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A206E3BBAF6
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Jul 2021 12:16:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46D80C57B53;
	Mon,  5 Jul 2021 10:16:15 +0000 (UTC)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F0DEC32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jul 2021 10:16:12 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D05121A16CD;
 Mon,  5 Jul 2021 12:16:11 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 982711A045A;
 Mon,  5 Jul 2021 12:16:11 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id
 650E6183ACDC; Mon,  5 Jul 2021 18:16:09 +0800 (+08)
From: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
To: davem@davemloft.net, joabreu@synopsys.com, kuba@kernel.org,
 alexandre.torgue@st.com, peppe.cavallaro@st.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org
Date: Mon,  5 Jul 2021 18:26:52 +0800
Message-Id: <20210705102655.6280-1-xiaoliang.yang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: qiangqing.zhang@nxp.com, weifeng.voon@intel.com, vee.khee.wong@intel.com,
 xiaoliang.yang_1@nxp.com, linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
 mohammad.athari.ismail@intel.com, tee.min.tan@intel.com,
 boon.leong.ong@intel.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, rui.sousa@nxp.com
Subject: [Linux-stm32] [PATCH v2 net-next 0/3] net: stmmac: re-configure tas
	basetime after ptp time adjust
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

If the DWMAC Ethernet device has already set the Qbv EST configuration
before using ptp to synchronize the time adjustment, the Qbv base time
may change to be the past time of the new current time. This is not
allowed by hardware.

This patch calculates and re-configures the Qbv basetime after ptp time
adjustment.

v1->v2:
  Update est mutex lock to protect btr/ctr r/w to be atomic.
  Add btr_reserve to store basetime from qopt and used as origin base
time in Qbv re-configuration.

Xiaoliang Yang (3):
  net: stmmac: separate the tas basetime calculation function
  net: stmmac: add mutex lock to protect est parameters
  net: stmmac: ptp: update tas basetime after ptp adjust

 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  3 ++
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  | 41 ++++++++++++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 46 +++++++++++++------
 include/linux/stmmac.h                        |  1 +
 4 files changed, 77 insertions(+), 14 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
