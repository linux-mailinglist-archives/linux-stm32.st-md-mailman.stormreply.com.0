Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1D93A0112
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Jun 2021 21:00:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54ACDC57B79;
	Tue,  8 Jun 2021 19:00:23 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6297BC32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Jun 2021 19:00:21 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id q5so22748445wrm.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Jun 2021 12:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uip1vDK/GvnRP2tuA2PdZT2AGkszBhFjdDLQc1lrazM=;
 b=mf8PYe9ZlWYQkGj9Esq0zaqBLrYGXrlL7OK0dZhv9N/FndZxs7wgU3igPT77cNrUr3
 1hHAuupqcQPOZ65bCjec8GNwcvCBAoH70+lZMEh18nILeAOcurnAWEv/lOiGuoFQsd+f
 FV9EZ+OXdtwO2d9yWpYuoRQ8a2/qpuhzECfHklaKQFq1/xOv9NrLoLLgIfzZCvOyKdGP
 hxoEO2izfy4IUo3j0uak2ZgwxhWlyRYBronc1MGF/AL8C4AiO2F5blQbYP9ys5taO3By
 KJjPTF4Sk7Uc8vajajyh6Zt++0rLF/Ol7nY2dZqrKHEGbIkE8NITB/TWbcGwyDmIcEBd
 y1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uip1vDK/GvnRP2tuA2PdZT2AGkszBhFjdDLQc1lrazM=;
 b=cWvRghA4xf/x8cttywLmmwqyqGlhymzXHzVFbU35V4W0ML6b5pnluwxqm15rDhxzTi
 DaR41LwmX/bwhtlddFWufjuZTS9MiPCFh+UWGfZN46dWmJlGC3rTdpwVSz4MUL4NBfp6
 15CsJVW8JK2HqSWnb85BbY2eiXM7Tqz5gUfJta1QQQQXGjAuCHZ3DUMRW1RU8Q1+IOJ6
 FuXNN7AYn1S7Ib02K9g83AVrYkEmCMeIV4zCnVjarlo1O+TgPNFSk6Q2pExx9uriZvn8
 kPdONEWQEJ/RzSNbC0Mi1nzQos6izG/cNQEMQdru0DWcrvM/huwgVmXpnZmbWdgreNBS
 QpiA==
X-Gm-Message-State: AOAM530VmSC44ZOHEPpVi4x1SBH/vFQ+408laocsTOYNpImMAesnMYMI
 PcNu3wqZ2l7bPnk8eOy+4eE=
X-Google-Smtp-Source: ABdhPJzgTgRj6uydfUPubkT+rZSonmvkQaAl/Ei9uKDeCamwzpyS7SlLHNhdsmHohhD0B9aWfnJ+qw==
X-Received: by 2002:adf:ff88:: with SMTP id j8mr24110899wrr.10.1623178821049; 
 Tue, 08 Jun 2021 12:00:21 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
 by smtp.gmail.com with ESMTPSA id w13sm22560462wrc.31.2021.06.08.12.00.20
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Tue, 08 Jun 2021 12:00:20 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
Date: Tue,  8 Jun 2021 19:59:06 +0100
Message-Id: <20210608185913.3909878-1-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210606103019.2807397-1-mnhagan88@gmail.com>
References: <20210606103019.2807397-1-mnhagan88@gmail.com>
MIME-Version: 1.0
Cc: Matthew Hagan <mnhagan88@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Voon Weifeng <weifeng.voon@intel.com>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, Tan Tee Min <tee.min.tan@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "Wong,
 Vee Khee" <vee.khee.wong@intel.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Subject: [Linux-stm32] [PATCH v3] net: stmmac: explicitly deassert
	GMAC_AHB_RESET
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

We are currently assuming that GMAC_AHB_RESET will already be deasserted
by the bootloader. However if this has not been done, probing of the GMAC
will fail. To remedy this we must ensure GMAC_AHB_RESET has been deasserted
prior to probing.

v2 changes:
 - remove NULL condition check for stmmac_ahb_rst in stmmac_main.c
 - unwrap dev_err() message in stmmac_main.c
 - add PTR_ERR() around plat->stmmac_ahb_rst in stmmac_platform.c

v3 changes:
 - add error pointer to dev_err() output
 - add reset_control_assert(stmmac_ahb_rst) in stmmac_dvr_remove
 - revert PTR_ERR() around plat->stmmac_ahb_rst since this is performed
   on the returned value of ret by the calling function

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 6 ++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 7 +++++++
 include/linux/stmmac.h                                | 1 +
 3 files changed, 14 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6d41dd6f9f7a..78dafde70671 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6840,6 +6840,11 @@ int stmmac_dvr_probe(struct device *device,
 			reset_control_reset(priv->plat->stmmac_rst);
 	}
 
+	ret = reset_control_deassert(priv->plat->stmmac_ahb_rst);
+	if (ret == -ENOTSUPP)
+		dev_err(priv->device, "unable to bring out of ahb reset: %pe\n",
+			ERR_PTR(ret));
+
 	/* Init MAC and get the capabilities */
 	ret = stmmac_hw_init(priv);
 	if (ret)
@@ -7072,6 +7077,7 @@ int stmmac_dvr_remove(struct device *dev)
 	phylink_destroy(priv->phylink);
 	if (priv->plat->stmmac_rst)
 		reset_control_assert(priv->plat->stmmac_rst);
+	reset_control_assert(priv->plat->stmmac_ahb_rst);
 	pm_runtime_put(dev);
 	pm_runtime_disable(dev);
 	if (priv->hw->pcs != STMMAC_PCS_TBI &&
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 97a1fedcc9ac..d8ae58bdbbe3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -600,6 +600,13 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		goto error_hw_init;
 	}
 
+	plat->stmmac_ahb_rst = devm_reset_control_get_optional_shared(
+							&pdev->dev, "ahb");
+	if (IS_ERR(plat->stmmac_ahb_rst)) {
+		ret = plat->stmmac_ahb_rst;
+		goto error_hw_init;
+	}
+
 	return plat;
 
 error_hw_init:
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index e55a4807e3ea..9b6a64f3e3dc 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -239,6 +239,7 @@ struct plat_stmmacenet_data {
 	unsigned int mult_fact_100ns;
 	s32 ptp_max_adj;
 	struct reset_control *stmmac_rst;
+	struct reset_control *stmmac_ahb_rst;
 	struct stmmac_axi *axi;
 	int has_gmac4;
 	bool has_sun8i;
-- 
2.26.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
