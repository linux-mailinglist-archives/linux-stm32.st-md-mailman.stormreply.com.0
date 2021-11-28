Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6281246090B
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Nov 2021 19:46:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B6EFC57B6F;
	Sun, 28 Nov 2021 18:46:07 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57B77C5719E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Nov 2021 18:46:06 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id v11so31708477wrw.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Nov 2021 10:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=BvrdRu7CpTK02nLPvxqfVEBas+3apI+lNY84EOP2k/8=;
 b=YsHQCTihtW+tD9wORNOWw1uRuhXNfU/HxJbwRRZD2+hrDDytYCYLMniDvNLc+SmKKC
 CUSe/CmihbmBAhdxlqU8Ppg5tSOG/UHVRTbORXG2gcSWcvMlEZ01nXgeMIMQreGd/3XI
 tU/dAZjHSMyUR0NAzERbFuwMyVM+AKFf0nlq6gtK9xvupnJaj/r6hWyX7J7EgZLqe0zS
 zeyrJfywpz61SvoyebizEdXMUTN8cVeb9k0rjDQhB8qXvi+fwlsXZ/TVVlgtIo0UbUgE
 gcBY0Z6DKNUzCiYUrVaHO3IGeGJ2nceflDvh+T14hEeR3Pss4X4PbheitB2k8f+ecdIn
 BbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=BvrdRu7CpTK02nLPvxqfVEBas+3apI+lNY84EOP2k/8=;
 b=PJ731RiXpQfFcWCM6L0uZhILwRW236mt3zepLWvsWH4ik/prZoZHXX8Vk+rVdKm6vO
 egOgNFJe28/RRdfhCysfi38N6daORMeWXsX7BHsUVpggHQVFHb+EZSOYAoqnSB9gb4ME
 GZu2PtZWQS6sh3TyXp0KU3MjozHmqO8MfEFfG/5NLQwKRsS9PfZo7ab11J6Ar7RGzE2U
 UmMZEd0OANaIzlN4Rdvtmgg8qEcb9pBcELvCqWQALaAZzkB5mNoF6dmDp5OA3Ad/bkQM
 0D1eB5/+M83up18Q6tpdbWEuMUWmtZ5rlEnBh9qOIk74Nn8t5DMO6Iq5s2XGLyD3NGUe
 zSQQ==
X-Gm-Message-State: AOAM53209x/4jLfjvgwX1AcdqA6TMRz+PBd2Kj695ZUwPhVWi07hJ3kg
 it9uG0ajyXd9f1TGSLSGtao=
X-Google-Smtp-Source: ABdhPJzIR+CZYjXTyOvu+JrlbXO/GL5bJwCevWAIGYmgbwe+Mnw2nokQ2tOaZkjSpgLRJiyTEqDBjw==
X-Received: by 2002:a5d:5244:: with SMTP id k4mr27783562wrc.77.1638125165872; 
 Sun, 28 Nov 2021 10:46:05 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:f5fa:c180:5ee3:5045?
 (p200300ea8f1a0f00f5fac1805ee35045.dip0.t-ipconnect.de.
 [2003:ea:8f1a:f00:f5fa:c180:5ee3:5045])
 by smtp.googlemail.com with ESMTPSA id az15sm12005237wmb.0.2021.11.28.10.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Nov 2021 10:46:05 -0800 (PST)
Message-ID: <c1bab067-00ba-f6b5-f683-709f1d5b09a9@gmail.com>
Date: Sun, 28 Nov 2021 19:45:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH net-next] stmmac: remove ethtool driver
	version info
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

I think there's no benefit in reporting a date from almost 6 yrs ago.
Let ethtool report the default (kernel version) instead.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h         | 1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 689f3cdb2..4f5292cad 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -10,7 +10,6 @@
 #define __STMMAC_H__
 
 #define STMMAC_RESOURCE_NAME   "stmmaceth"
-#define DRV_MODULE_VERSION	"Jan_2016"
 
 #include <linux/clk.h>
 #include <linux/hrtimer.h>
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index eead45369..164dff5ec 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -290,7 +290,6 @@ static void stmmac_ethtool_getdrvinfo(struct net_device *dev,
 		strlcpy(info->bus_info, pci_name(priv->plat->pdev),
 			sizeof(info->bus_info));
 	}
-	strlcpy(info->version, DRV_MODULE_VERSION, sizeof(info->version));
 }
 
 static int stmmac_ethtool_get_link_ksettings(struct net_device *dev,
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
