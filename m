Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD0E13445B
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jan 2020 14:57:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEAD9C36B0B;
	Wed,  8 Jan 2020 13:57:20 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B117C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2020 13:57:17 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q10so1678242pfs.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Jan 2020 05:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=qW90h0u7OkzvuxRNBAEqi37oJNoUhGwMxLdMwSq1ERo=;
 b=ZuGH2Wj7E14zCp5yindCZWoGHDv7ZOtdQkjnWFD/TfhMWtzS5Xjx+Ks05Fl2umCQxf
 EwAYwY4mV93SL+T2LKRB2AKRlzgneyqlPV9+PBcc+kYeq0wtMtXTqZzh+iMfAGZykg5t
 bsXvfP9i0+/OUWaiq8Yb/DbC56N6DhngQyjiL/KvhG0SBBWjGObMFVfuZpH/KoawWCEC
 kZ++1T2HP0Zo17uKVoZgu5w2akM4e0txuiFbtd0x2Mp5QarS++fKapcAfnehZ0Y6DmGT
 +jkspmJJdJmz24vJoFEOMTHp7MjLgC84FQk7mylrMVEbCBsKb73X2F0mFKvAE2/+TKAX
 9OWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=qW90h0u7OkzvuxRNBAEqi37oJNoUhGwMxLdMwSq1ERo=;
 b=EpPsAGpvvTok87ckQVbRk432QapkHkbHAgiTztJQ16oP5UJYnyMiCv+rc+XxYKfapb
 iHuv733SfsvqgHxndvnI/G7aahgqa6j0GeFtvIpxiYc0a7d4cK+pBsxVoHieAOZgCdb1
 CKZguPhYaikw4+ji+TWPDAfI0l5Aq+IXsmPF/W/nUY7LZer2Rnpfc5W4dJoZDaS8TL5n
 bOQPOf8bNwixjq6RBIWsEwjXrrweozY1++sv+3ZzZ70hIaDoWSMeWwQcV+tfj5sipx+Z
 LllCzlPaTuVA52UUZmW1/Lk0BIqErGb9b1LPygjHG157EDxv6XQ/GMzIKWUy8aoqD3lA
 RFrw==
X-Gm-Message-State: APjAAAWkQXRMAyHN59gmpCrS477+reWPowinNNsXziZj+cxqzF8Dzy3x
 nYvyEeqB7DBFLCn5k+1KV+4=
X-Google-Smtp-Source: APXvYqzMlnEoYbJ22LLGcHWee0yQGtrOCZXdglioPZIVFM1/YGxuYCvFUALBewJvzxtmga1BAo495w==
X-Received: by 2002:a65:56c9:: with SMTP id w9mr5145925pgs.296.1578491835938; 
 Wed, 08 Jan 2020 05:57:15 -0800 (PST)
Received: from localhost (199.168.140.36.16clouds.com. [199.168.140.36])
 by smtp.gmail.com with ESMTPSA id s185sm3984867pfc.35.2020.01.08.05.57.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 Jan 2020 05:57:15 -0800 (PST)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com,
 davem@davemloft.net, mcoquelin.stm32@gmail.com
Date: Wed,  8 Jan 2020 21:56:49 +0800
Message-Id: <20200108135649.6091-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: netdev@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3] net: stmmac: pci: remove the duplicate
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

Changes since v2:
    Abandoned the other commits, now only this one commit is
    in the patch set.

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
