Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE5B396EF6
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Jun 2021 10:29:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E235AC58D5D;
	Tue,  1 Jun 2021 08:29:56 +0000 (UTC)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE419C57B69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Jun 2021 08:28:55 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6D3DA20186F;
 Tue,  1 Jun 2021 10:28:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 inva021.eu-rdc02.nxp.com 6D3DA20186F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com;
 s=nselector4; t=1622536135;
 bh=Vp/YVFqiOklhN/F6UxgOeg6zBvCd93y8gqG1jloJHJo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g0X0ybUEt7kfjH+qJ500hs8MyqwY2G9SwgJKnUN0NubZBFRlWX2O8TPSktbV5Nqs2
 mAPgqamFNO+or8y5a3Na7IvodgtnnlSQ6djNUpI8STQg6tHSZmlJ+Jb2uuWG0N92+z
 Gs4TKtI2HGr1ywV+ZKBWXlTWQ7MrcPUc81D5WIFHhU/f0gBlPOqiX5wJU0zoH9qGDv
 e5y5er+TtjlJP5fYACKsI6oLJMiXETrlQ5xqWplByehAaoQpw/6UeR43zuaR3VACMz
 +Gji5ibfKOKp0zBirmjxuceGyywrJXFaJheM4/rQWRIPsEVmtjskrDUKLkgnc37tui
 0RH14zWoCmvwA==
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 364C4200D1F;
 Tue,  1 Jun 2021 10:28:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 inva021.eu-rdc02.nxp.com 364C4200D1F
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 48222402F1;
 Tue,  1 Jun 2021 16:28:36 +0800 (+08)
From: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
To: davem@davemloft.net, joabreu@synopsys.com, kuba@kernel.org,
 alexandre.torgue@st.com, peppe.cavallaro@st.com, mcoquelin.stm32@gmail.com
Date: Tue,  1 Jun 2021 16:38:13 +0800
Message-Id: <20210601083813.1078-4-xiaoliang.yang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210601083813.1078-1-xiaoliang.yang_1@nxp.com>
References: <20210601083813.1078-1-xiaoliang.yang_1@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 01 Jun 2021 08:29:53 +0000
Cc: qiangqing.zhang@nxp.com, weifeng.voon@intel.com, vee.khee.wong@intel.com,
 netdev@vger.kernel.org, xiaoliang.yang_1@nxp.com, yangbo.lu@nxp.com,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com, vladimir.oltean@nxp.com,
 mohammad.athari.ismail@intel.com, mingkai.hu@nxp.com, tee.min.tan@intel.com,
 boon.leong.ong@intel.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, rui.sousa@nxp.com
Subject: [Linux-stm32] [PATCH v1 net-next 3/3] net: stmmac: ptp: update tas
	basetime after ptp adjust
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

After adjusting the ptp time, the Qbv base time may be the past time
of the new current time. dwmac5 hardware limited the base time cannot
be set as past time. This patch calculate the base time and reset the
Qbv configuration after ptp time adjust.

Signed-off-by: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  | 41 ++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 4e86cdf2bc9f..c573bc8b2595 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -62,7 +62,8 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
 	u32 sec, nsec;
 	u32 quotient, reminder;
 	int neg_adj = 0;
-	bool xmac;
+	bool xmac, est_rst = false;
+	int ret;
 
 	xmac = priv->plat->has_gmac4 || priv->plat->has_xgmac;
 
@@ -75,10 +76,48 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
 	sec = quotient;
 	nsec = reminder;
 
+	/* If EST is enabled, disabled it before adjust ptp time. */
+	if (priv->plat->est && priv->plat->est->enable) {
+		est_rst = true;
+		mutex_lock(&priv->plat->est->lock);
+		priv->plat->est->enable = false;
+		stmmac_est_configure(priv, priv->ioaddr, priv->plat->est,
+				     priv->plat->clk_ptp_rate);
+		mutex_unlock(&priv->plat->est->lock);
+	}
+
 	spin_lock_irqsave(&priv->ptp_lock, flags);
 	stmmac_adjust_systime(priv, priv->ptpaddr, sec, nsec, neg_adj, xmac);
 	spin_unlock_irqrestore(&priv->ptp_lock, flags);
 
+	/* Caculate new basetime and re-configured EST after PTP time adjust. */
+	if (est_rst) {
+		struct timespec64 current_time, time;
+		ktime_t current_time_ns, basetime;
+		u64 cycle_time;
+
+		priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &current_time);
+		current_time_ns = timespec64_to_ktime(current_time);
+		time.tv_nsec = priv->plat->est->btr[0];
+		time.tv_sec = priv->plat->est->btr[1];
+		basetime = timespec64_to_ktime(time);
+		cycle_time = priv->plat->est->ctr[1] * NSEC_PER_SEC +
+			     priv->plat->est->ctr[0];
+		time = stmmac_calc_tas_basetime(basetime,
+						current_time_ns,
+						cycle_time);
+
+		mutex_lock(&priv->plat->est->lock);
+		priv->plat->est->btr[0] = (u32)time.tv_nsec;
+		priv->plat->est->btr[1] = (u32)time.tv_sec;
+		priv->plat->est->enable = true;
+		ret = stmmac_est_configure(priv, priv->ioaddr, priv->plat->est,
+					   priv->plat->clk_ptp_rate);
+		mutex_unlock(&priv->plat->est->lock);
+		if (ret)
+			netdev_err(priv->dev, "failed to configure EST\n");
+	}
+
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
