Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E30654FF3AD
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Apr 2022 11:38:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A29CCC60496;
	Wed, 13 Apr 2022 09:38:08 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 949D5C5F1EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Apr 2022 09:38:06 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 mm4-20020a17090b358400b001cb93d8b137so5732616pjb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Apr 2022 02:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RVQstQX3o9VgMBuzdgxmyLLQEnEBUvnceuVNthO6dlM=;
 b=dXLSABKuycKbEvu8Cbf8cU+Tt4k28/o42ccrQugag1yAg+CIi0mlfhumYK1WAkQsdW
 Lm/nUh8dryN2K12146+KOQfe/w+ILGY60DSWzOtwAmvjP+9gCOi2GUUU07ZD6oVggNkc
 +2o/DHLEqup1nW2vxOpDpHxyXtnt+0kYPFOCeXOGXfdfiV6yc3nqnufTSalsOUBR7LuB
 w0Nq3SDCLim5YUTrM4I/3dUbrouLSrmDJ5iPJi5QCgmCdC2jWuxnoBB4QXg2WOPg+qSA
 iyOYsOpmn3Kud8cWDGEwn2F+63w7GWxcfWqejklf4OTWk93XXs2xCSphUZN7PMS1YC9i
 yDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RVQstQX3o9VgMBuzdgxmyLLQEnEBUvnceuVNthO6dlM=;
 b=O6WFw7zr/ANu3PJ1pRZSSyWVj1iRp8fh7NxZvTCYJd3arN6O+tNQ8APPwjmDhaq4pn
 fKiJ91wvcwDCDr8ytojrnJnGLKDfDOYSOhG2GlaupQYwb0paIxRdsjEFji67wG3BN4Mz
 i0aeCT3SRjeN2LKTEK2h8tCSgKMXx8u32SY7Co4JmayPO8Wth53eogkgMhvnCeuoM87m
 b4Pj4wSIht7vUTMiuqTMBkgVpil4eQUZrTi4Y0Z7opPtDixZlahrUvtW/qa1kWqUR41k
 4Fs+gcoRWqQs9RZe+O3WNuyVTpsJTcqaQEKhH1LoDQN4MU4BR9eaXllCHbMoINAb2mS9
 laag==
X-Gm-Message-State: AOAM5301Vcp03hjXOAmrVuI+1PkU9wmqNpreNhFM18ULdyT75lfmy3gl
 ezWpPv9qfk8v2TYm4t+mwe4=
X-Google-Smtp-Source: ABdhPJxo7+Ux92bmPql/HXgXEaJR1hwpnpy9HTM8FY+EmsOKoo0D/O11yKvaxb0+Ymw4wQjWoObwKw==
X-Received: by 2002:a17:902:b48d:b0:156:7f54:8ffc with SMTP id
 y13-20020a170902b48d00b001567f548ffcmr42194833plr.95.1649842685304; 
 Wed, 13 Apr 2022 02:38:05 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 f187-20020a6251c4000000b005058e59604csm17229058pfb.217.2022.04.13.02.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 02:38:04 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: peppe.cavallaro@st.com
Date: Wed, 13 Apr 2022 09:38:01 +0000
Message-Id: <20220413093801.2538628-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>, Minghao Chi <chi.minghao@zte.com.cn>,
 davem@davemloft.net, joabreu@synopsys.com, kuba@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: stmmac_main: using
	pm_runtime_resume_and_get instead of pm_runtime_get_sync
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Using pm_runtime_resume_and_get is more appropriate
for simplifing code

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4a4b3651ab3e..580cc5d3c4fa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3643,11 +3643,9 @@ static int stmmac_open(struct net_device *dev)
 	u32 chan;
 	int ret;
 
-	ret = pm_runtime_get_sync(priv->device);
-	if (ret < 0) {
-		pm_runtime_put_noidle(priv->device);
+	ret = pm_runtime_resume_and_get(priv->device);
+	if (ret < 0)
 		return ret;
-	}
 
 	if (priv->hw->pcs != STMMAC_PCS_TBI &&
 	    priv->hw->pcs != STMMAC_PCS_RTBI &&
@@ -5886,11 +5884,9 @@ static int stmmac_set_mac_address(struct net_device *ndev, void *addr)
 	struct stmmac_priv *priv = netdev_priv(ndev);
 	int ret = 0;
 
-	ret = pm_runtime_get_sync(priv->device);
-	if (ret < 0) {
-		pm_runtime_put_noidle(priv->device);
+	ret = pm_runtime_resume_and_get(priv->device);
+	if (ret < 0)
 		return ret;
-	}
 
 	ret = eth_mac_addr(ndev, addr);
 	if (ret)
@@ -6220,11 +6216,9 @@ static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vi
 	bool is_double = false;
 	int ret;
 
-	ret = pm_runtime_get_sync(priv->device);
-	if (ret < 0) {
-		pm_runtime_put_noidle(priv->device);
+	ret = pm_runtime_resume_and_get(priv->device);
+	if (ret < 0)
 		return ret;
-	}
 
 	if (be16_to_cpu(proto) == ETH_P_8021AD)
 		is_double = true;
-- 
2.25.1


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
