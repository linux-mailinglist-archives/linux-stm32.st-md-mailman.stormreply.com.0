Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DBE39D5D0
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Jun 2021 09:19:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AA86C58D7B;
	Mon,  7 Jun 2021 07:19:28 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3776DC32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Jun 2021 17:41:41 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 p13-20020a05600c358db029019f44afc845so7367666wmq.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 05 Jun 2021 10:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=58S1Og3Gq6yFDBmvvvA786Kv3ZHM/KHp6+Nqv3S6XUY=;
 b=b5eJWGhJcXo5IFD5VMPLXDFJk6XICjvJsKi6fJPjDU0yt3+d23qtGnZtUb3UMREcHq
 zeLRKuHA2/4mX/1VJO+TIEfVadGQ2fEsXaEilGumOx/UGUyosGYn9evcumxaBDoJo4Su
 kcJCrW65I1EePaKe5uNGbDnKLCF9qyG2c3JJVUkfdGDwpZYwl1zUI0zI2YyhZFEJS8Py
 mP6GbeLyApeKPNr4W4DkjTshBVfP4fPMCWV4dzbMh1ib5NDd8Ol4yE8vmVgpO+aIs6m+
 mBOaaSP2QV0vsolS0IBJb3TSyEu6EPYgf18kMUU7y8XK622+Y/r9gwF300uyuz4ihbAv
 pYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=58S1Og3Gq6yFDBmvvvA786Kv3ZHM/KHp6+Nqv3S6XUY=;
 b=BgqWRHWQU9KJwOfUJt26AI7h3QXaKHYAdhKyClJyfKmqh4QZ29K6uxA942NnzDgq34
 /sf/2f5+aoHJ4n5O33DXMGSbdNHP9T+cBy4AbOENfrBrUUtEdr+2uyzpNAnDBtAotGq3
 9/o+L9fGO40VJCJUAFHsHAu6afHFfwbyaYeor7K8Kq3n15BBvuqvJoxfuND4xG8wuTC9
 /cNCKcu5dfjs+qMwrhqOGCtpy5kv7yTaQqpJetHeKMD0O2zulAG9FPVFd0/0SWRuN/hD
 iP5IA46FqmmcQuG12INgmed5oMh7ibn0nJHYJD9Q7w3W7Ym/r+WZ267/XnPTz2itKpNN
 WxEA==
X-Gm-Message-State: AOAM5311FzUMp3AVPiwghy4g1KRc6hzrsl/E+SVDlSmABDoiw6eUjFIH
 vUpNLDSn0o0ND4/+kTrn+B4=
X-Google-Smtp-Source: ABdhPJyiFCxRpIhc+P1d+WdBeVTCiCFPFUkUwjDbqSiPHq+lzi4KTMpPe8xwEp7BhyJd6VmUYckIpQ==
X-Received: by 2002:a05:600c:4ba1:: with SMTP id
 e33mr3183717wmp.39.1622914900861; 
 Sat, 05 Jun 2021 10:41:40 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
 by smtp.gmail.com with ESMTPSA id c206sm12182512wmf.12.2021.06.05.10.41.40
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Sat, 05 Jun 2021 10:41:40 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
Date: Sat,  5 Jun 2021 18:35:37 +0100
Message-Id: <20210605173546.4102455-1-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Jun 2021 07:19:27 +0000
Cc: Voon Weifeng <weifeng.voon@intel.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Wong Vee Khee <vee.khee.wong@linux.intel.com>, "Wong,
 Vee Khee" <vee.khee.wong@intel.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Tan Tee Min <tee.min.tan@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Matthew Hagan <mnhagan88@gmail.com>,
 Fugang Duan <fugang.duan@nxp.com>, netdev@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH 1/3] net: stmmac: explicitly deassert
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

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 7 +++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 7 +++++++
 include/linux/stmmac.h                                | 1 +
 3 files changed, 15 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6d41dd6f9f7a..1e28058b65a8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6840,6 +6840,13 @@ int stmmac_dvr_probe(struct device *device,
 			reset_control_reset(priv->plat->stmmac_rst);
 	}
 
+	if (priv->plat->stmmac_ahb_rst) {
+		ret = reset_control_deassert(priv->plat->stmmac_ahb_rst);
+		if (ret == -ENOTSUPP)
+			dev_err(priv->device,
+				"unable to bring out of ahb reset\n");
+	}
+
 	/* Init MAC and get the capabilities */
 	ret = stmmac_hw_init(priv);
 	if (ret)
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
