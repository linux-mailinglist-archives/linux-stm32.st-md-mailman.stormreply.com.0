Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFFC133C3F
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jan 2020 08:26:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECD8BC36B0B;
	Wed,  8 Jan 2020 07:26:40 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3106C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2020 07:26:39 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id az3so749165plb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jan 2020 23:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YgvywnLyYzODjdUN5pjBnIAoT8QXrKrof9jZ9KWS50M=;
 b=uJidx6V2kVrDoRpmQOqy4JLM9x5893Q3qDlXO6/DMPh9J1EyCqLWtKvbpB3Z6msKqg
 5DL89PlYEk6z3WSMFSLvW5H3UEoFOSYT94WkBEBxqGu1uuP+/Ty+LUD+3cMHtg0TockK
 CFznXxPOuKWpd4a+0bT3DaI68Apws19E/q7N8NT5fnXok79vlaZk/ABWhqY1sn5X/g+t
 vePRaCC9Nm0H89xhY1jlQujIMlrjsq1CMC/YnAYV10m4KlIuyZORz7ltiPih5NUngisk
 E4JU2H0JUuCoutaTj1grPfT2ebbLC0e6pltRWdoKwOPOBtiUWlai7vt63S6Ut5QJYS1v
 BHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YgvywnLyYzODjdUN5pjBnIAoT8QXrKrof9jZ9KWS50M=;
 b=CvbT4r/YiI+SgRLx4G3Hzf/qaqjp4EQwfDLW6krBB8If2FYaDdo6+b1b7S/cF+HION
 RpdjESXR7w04phblU5wuGIguIfSaBfkkU1BmaQh5FckJNBf2v/8BdlyAWdgS2UDXLIkK
 mKEDbKMTRKpfXqNyw6hSNJ2SliQdq55FU6xyLgB1rTRjTcpUjpAoRd/9PlpfAmPqD/D7
 fOUFPKSj/UsY7wQYUehv5OODxbES2KvX+FMVUhQi0PcagG4LA/5N42tjS1Sq+7b6mJ4F
 YWFTJTXMWNHNdzRi+40SB/2AVeZ3fG8feHP22zuJjVLO80Kn2ptcEbw8okp5/D+/uZeb
 fWMA==
X-Gm-Message-State: APjAAAU6Wf+qPOnU4LyCuGPu2sVgjRGhKK/7kZaKSjcbqxbdefE/iA0S
 FWZsAO9trYm4Q6F3C0JXJzo=
X-Google-Smtp-Source: APXvYqwH9CfosT7s9ifO/AANNX8jvBDu0cCJazDa/8NyLgjjws4FKAWfUxN4dlltGJliD+L0TTNA6Q==
X-Received: by 2002:a17:902:8c90:: with SMTP id
 t16mr3926013plo.186.1578468397944; 
 Tue, 07 Jan 2020 23:26:37 -0800 (PST)
Received: from localhost (199.168.140.36.16clouds.com. [199.168.140.36])
 by smtp.gmail.com with ESMTPSA id o98sm1865266pjb.15.2020.01.07.23.26.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 Jan 2020 23:26:37 -0800 (PST)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com,
 davem@davemloft.net, mcoquelin.stm32@gmail.com,
 martin.blumenstingl@googlemail.com, treding@nvidia.com, andrew@lunn.ch,
 weifeng.voon@intel.com, tglx@linutronix.de
Date: Wed,  8 Jan 2020 15:25:49 +0800
Message-Id: <20200108072550.28613-2-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108072550.28613-1-zhengdejin5@gmail.com>
References: <20200108072550.28613-1-zhengdejin5@gmail.com>
Cc: netdev@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 1/2] net: stmmac: pci: remove the duplicate
	code of set phy_mask
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

All members of mdio_bus_data are cleared to 0 when it was obtained
by devm_kzalloc(). so It doesn't need to set phy_mask as 0 again.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---

Changes since v1:
    adjust some commit comments.

 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index 8237dbc3e991..40f171d310d7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -65,7 +65,6 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 	plat->force_sf_dma_mode = 1;
 
 	plat->mdio_bus_data->needs_reset = true;
-	plat->mdio_bus_data->phy_mask = 0;
 
 	/* Set default value for multicast hash bins */
 	plat->multicast_filter_bins = HASH_TABLE_SIZE;
@@ -154,8 +153,6 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	plat->tx_queues_cfg[6].weight = 0x0F;
 	plat->tx_queues_cfg[7].weight = 0x10;
 
-	plat->mdio_bus_data->phy_mask = 0;
-
 	plat->dma_cfg->pbl = 32;
 	plat->dma_cfg->pblx8 = true;
 	plat->dma_cfg->fixed_burst = 0;
@@ -386,8 +383,6 @@ static int snps_gmac5_default_data(struct pci_dev *pdev,
 	plat->tso_en = 1;
 	plat->pmt = 1;
 
-	plat->mdio_bus_data->phy_mask = 0;
-
 	/* Set default value for multicast hash bins */
 	plat->multicast_filter_bins = HASH_TABLE_SIZE;
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
