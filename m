Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC5A396EF3
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Jun 2021 10:29:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43A30C57B6F;
	Tue,  1 Jun 2021 08:29:56 +0000 (UTC)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 149ACC57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Jun 2021 08:28:48 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B06841A3C1C;
 Tue,  1 Jun 2021 10:28:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 inva020.eu-rdc02.nxp.com B06841A3C1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com;
 s=nselector3; t=1622536127;
 bh=vWCv+MeGTvvz1WVA73qZXjvvuHB4aTe/cxgc3hg+kwE=;
 h=From:To:Cc:Subject:Date:From;
 b=VG9n6A0RyiNUtHUejUzAqLT6FnL31SuW+5En8RdNlio7+Y0PmJ3tVfjJalxhgLygs
 G/xxWi3y0zAfVgCJycJnYYtViDyjbbQVucutgzgGxk2xpy1kfOBC3wgO9q1POWYg7C
 ZHsgS0oGff0HFORc9UGDQ05MKhzocTfeBo7/x7JmTz2a8gajtJPOknYugnFjhWw7wE
 izxOkhL1zmzsHMnTHvB9KoYRgrpF9BXVrEtTN+86L7YWB0Cm5WQt6D41vmIPdNbTg5
 HQceHZ3s+/lic1fx1PkR2z9tH37P/sq9tdtxkuF8rcxrV4FhzqZ1ZOdkd8Y03YYuyj
 Q2Y95HtdTmlog==
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7C5FE1A3C23;
 Tue,  1 Jun 2021 10:28:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 inva020.eu-rdc02.nxp.com 7C5FE1A3C23
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 75AF2402E9;
 Tue,  1 Jun 2021 16:28:28 +0800 (+08)
From: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
To: davem@davemloft.net, joabreu@synopsys.com, kuba@kernel.org,
 alexandre.torgue@st.com, peppe.cavallaro@st.com, mcoquelin.stm32@gmail.com
Date: Tue,  1 Jun 2021 16:38:10 +0800
Message-Id: <20210601083813.1078-1-xiaoliang.yang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 01 Jun 2021 08:29:53 +0000
Cc: qiangqing.zhang@nxp.com, weifeng.voon@intel.com, vee.khee.wong@intel.com,
 netdev@vger.kernel.org, xiaoliang.yang_1@nxp.com, yangbo.lu@nxp.com,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com, vladimir.oltean@nxp.com,
 mohammad.athari.ismail@intel.com, mingkai.hu@nxp.com, tee.min.tan@intel.com,
 boon.leong.ong@intel.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, rui.sousa@nxp.com
Subject: [Linux-stm32] [PATCH v1 net-next 0/3] net: stmmac: re-configure tas
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
