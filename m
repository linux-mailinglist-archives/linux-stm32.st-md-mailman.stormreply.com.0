Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B3A39D5D5
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Jun 2021 09:19:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59C0EC59795;
	Mon,  7 Jun 2021 07:19:32 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2364C58D5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Jun 2021 10:30:45 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 b145-20020a1c80970000b029019c8c824054so10630372wmd.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 06 Jun 2021 03:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ikXJBehZXFSB5UrJ89OaYAcJZ+kIUikwdL83ZPiK/5Y=;
 b=FexVLV1F67sJ8VtLdcDCHjf+oX3RM8/jbrZGl69yu70d1Po34D5B/Jrfh1Wc0B2bFk
 M/bjGeAgCvUCDukHX0G0Ip8Z+gWnW+VBd2brgbMSDZ+wyNLrbujmvHYprvmVbquWavfS
 K0HvIgpQay8mLct9xagtW/7c63fHjfbBmjsJYR9s3p+lPqPlC/bN7ZgEhqWjF+Bj+8F/
 TDom7Z+CS+qYtBchGiyn7gv/1Y3IHovBEmbSESqVqxiVehsOPrPamoIR9/ulqjfGIwL1
 Irl8Rh97DtGYaT7wwXLkONEx4EVAo7Jz+WacxiH5ptE2GOUMt/BmZFtMu/ayRnViDXa2
 7cZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ikXJBehZXFSB5UrJ89OaYAcJZ+kIUikwdL83ZPiK/5Y=;
 b=dIpp1dfXKVjL1t4N6ZSIbwI5RSY80EZh8hSM9VoQLN8rmS89nBwm95smFO4PDPqJ/d
 isTf3i0AJ/Y8eLjAOhvWa006zZvRVv5uipqYB0F/9IqFmkcMcbkpft44HppDbt6xrXCH
 /qPZeRLLENyFJZZKe6rAqbZQCeqQ8VUq7uacnWP7YsSJzQcJBnnMrrV2H0lio5c0ZfLr
 813uA3eJpovbcrB44RC8W43YKlgqWBfMvP8wnM5mZPE34f3k0JQQG60qUZ56bDg+UHOf
 33uLiLG6P50S3ORo0v3oIcsf9Ra9rrAjY35bc9fbOnLFH2TuJVu+56kFEi8d0PpGF/af
 n2TQ==
X-Gm-Message-State: AOAM530vICmCKtLSGZzW5PbHAEosnculgxhOWI+IgTmBIrpHrr9We8be
 AaLEplJYulddR/WcfTTB0Tc=
X-Google-Smtp-Source: ABdhPJwWAiiWqtqihbUCZBiBb+hiCCGLYOEmHqUxvoIWanfLpsTPgU+VvFX0yTMsszDmE/6ByuoYAA==
X-Received: by 2002:a1c:ed03:: with SMTP id l3mr12198750wmh.130.1622975444995; 
 Sun, 06 Jun 2021 03:30:44 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
 by smtp.gmail.com with ESMTPSA id s62sm13926536wms.13.2021.06.06.03.30.44
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Sun, 06 Jun 2021 03:30:44 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
Date: Sun,  6 Jun 2021 11:30:13 +0100
Message-Id: <20210606103019.2807397-1-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <3436f8f0-77dc-d4ff-4489-e9294c434a08@gmail.com>
References: <3436f8f0-77dc-d4ff-4489-e9294c434a08@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Jun 2021 07:19:27 +0000
Cc: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Matthew Hagan <mnhagan88@gmail.com>, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Voon Weifeng <weifeng.voon@intel.com>,
 "Wong, Vee Khee" <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 Tan Tee Min <tee.min.tan@intel.com>, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, bjorn.andersson@linaro.org,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] net: stmmac: explicitly deassert
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

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 4 ++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 7 +++++++
 include/linux/stmmac.h                                | 1 +
 3 files changed, 12 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6d41dd6f9f7a..0d4cb423cbbd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6840,6 +6840,10 @@ int stmmac_dvr_probe(struct device *device,
 			reset_control_reset(priv->plat->stmmac_rst);
 	}
 
+	ret = reset_control_deassert(priv->plat->stmmac_ahb_rst);
+	if (ret == -ENOTSUPP)
+		dev_err(priv->device, "unable to bring out of ahb reset\n");
+
 	/* Init MAC and get the capabilities */
 	ret = stmmac_hw_init(priv);
 	if (ret)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 97a1fedcc9ac..a178181f6a24 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -600,6 +600,13 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		goto error_hw_init;
 	}
 
+	plat->stmmac_ahb_rst = devm_reset_control_get_optional_shared(
+							&pdev->dev, "ahb");
+	if (IS_ERR(plat->stmmac_ahb_rst)) {
+		ret = PTR_ERR(plat->stmmac_ahb_rst);
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
