Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A70691EBA02
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jun 2020 13:03:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E7F0C36B21;
	Tue,  2 Jun 2020 11:03:08 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B45BC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jun 2020 10:44:25 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id h95so1256939pje.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Jun 2020 03:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=H05OVuwlBgrwjdIL249fOEZc54JAKac/tUGyHC08gQs=;
 b=Qv3Td0OKHbhrSjgPbGqNpIAKA6svKHpglY3/U1gOS8lKHtAGsEwtP7zDxMfz/TZiUL
 M6OrU7sdrP4rDUevsQ3bL8Nkj716L5v2mEMoTDF5LFU68rMRxh/q3rSyVZdLd+REmzpW
 oKqIIZ053AkrJwYi/CU67ypkZ7/GMlS3AGKybC0chI/z2EXothcEPyAPIKmkc3VcS3GG
 pxNrJkD7Je35YPJVyJPNN890Ud8VuF36LpGAyecDCYY7p4vwiz1gc9/yAV+EXB6Uehia
 eD8fuA9xFMaGdu5M9kmb2nb2M0Vt7nUxxHXKnWX9NyWu+oiLqbfJDwhR87ezKXjT0WTR
 9fOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=H05OVuwlBgrwjdIL249fOEZc54JAKac/tUGyHC08gQs=;
 b=j9yMJtzwSWsUtWd0HqZ7o+jmJJzhdb3lPGh86S9O0vnAeKEUYy24knI8f6q0DG/+S2
 zJbeO6lot8Nd7nI2Zx3R2Jm7WWwJJRVQQ9+7l0HWx8qMaDlwLEsjfzaZWaXg01ttz4AZ
 g64YQ5Q+8zNL2TlOt7C5DabGIge1ejzzJZJ527wWw7pnNgK6H//CpsDXKlq8vVGjTSxs
 MeDMlcvo2mpl1Lx0XcHuscn2lSm3un/7IkDMFiEX/b1Hq/ROOK7QLqmhAuPjtOfe82Yy
 mv6hfa4Od5wcAv1AwIuKPI+wcKitEZHNYFe4oXdROP8BUKoD8FOakGDkKnvm/xmqLXZU
 IzJg==
X-Gm-Message-State: AOAM533C6moGQBFfKQ2FgnEoKOphqt8IXWDNtuOfMYpEOg03D5w8t6iy
 wfARFLGpOsHIGNxsU56KYgY=
X-Google-Smtp-Source: ABdhPJzXuYCZSWZu64djI+B3rB1TLa7slAy257nEGuURgXUsCEyR63VaznbGh9DGgkKX8FEtRDW1vA==
X-Received: by 2002:a17:902:8204:: with SMTP id
 x4mr11259413pln.153.1591094663735; 
 Tue, 02 Jun 2020 03:44:23 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:189:c86a:7149:74ab:b584:ecf8])
 by smtp.gmail.com with ESMTPSA id s98sm153046pjb.33.2020.06.02.03.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 03:44:23 -0700 (PDT)
From: Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue,  2 Jun 2020 16:14:04 +0530
Message-Id: <20200602104405.28851-1-aishwaryarj100@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 02 Jun 2020 11:03:06 +0000
Cc: aishwaryarj100@gmail.com
Subject: [Linux-stm32] [PATCH] net: stmmac: Drop condition with no effect
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

As the "else if" and "else" branch body are identical the
condition has no effect. So removing "else if" condition.

Signed-off-by: Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index bcda49dcf619..f59813a0405c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -229,8 +229,6 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 		plat->tx_sched_algorithm = MTL_TX_ALGORITHM_WFQ;
 	else if (of_property_read_bool(tx_node, "snps,tx-sched-dwrr"))
 		plat->tx_sched_algorithm = MTL_TX_ALGORITHM_DWRR;
-	else if (of_property_read_bool(tx_node, "snps,tx-sched-sp"))
-		plat->tx_sched_algorithm = MTL_TX_ALGORITHM_SP;
 	else
 		plat->tx_sched_algorithm = MTL_TX_ALGORITHM_SP;
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
