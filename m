Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPm1E1SJw2m6rQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 08:05:56 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02700320679
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 08:05:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 747ACC8F279;
	Wed, 25 Mar 2026 07:05:55 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56224C87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 18:27:42 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-35a1d4a095bso112737a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 11:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774376861; x=1774981661;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=alJwQhTp7nkw0Ib79edmwantLXplbDvUqq4BVXNADKE=;
 b=XbQXFAlq5DYC0xwzZWMk9l2GmGqxJHGRqCpSR2bm6kP7qFjOZ/BKES3VfcnQvqpzSp
 bAIceoEXBTvzezyB3rpfwaL81gGGvdxBbNAs9LYavS3xSujVJ/bR/K2UPDRxUjKG4Hgb
 nBNLqdbjAeNXRLcyKWY52pf81QPR0XoCdV0VeEmuqeKv4kr4kh8hW2pUV7q62GRMGpYr
 i0j+CilQFr7Nj3WagTwLXiQl/O2T74o7QatNEGas/7Ibef993WTq3OWiw+MACKgBwjAC
 tJHIzZ8eimk7I3OadiPyGmH5I2OtDDgF1nIOa5L129dY1U3V7mty9KCVYtRPLw43kSdh
 ePNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774376861; x=1774981661;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=alJwQhTp7nkw0Ib79edmwantLXplbDvUqq4BVXNADKE=;
 b=D/x1GxNyjrGlV4XZccrLguWucs2eZSWNrgKeZPFRmyfN/6L1zIGoWoD3bthQredtRA
 wRvFhW87LsMGvKmG440BzlgTN/81FiIYpUw1/zQl+nd023qhvQOmQBD27WEP7HWTJg14
 tHp5wCVCTD/mQMwILj5CeBXE3FDxYLjVdaFx7xBLXZyY/GE2GMr10a70+VUZ04e9nm7B
 DU+avcx8uHlbrcX2c5PRrPGhYPna6Lk6ry1rHMrvh6yBGMY4iHr2BV/euRj/roK312Zq
 GmJBZ69A61IkMYNsIzoaQwz8qk1loa3tnvkDMTYu+aem4PlyPy4N4eKXELmF1zmsN2oy
 lN3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9iqJk0E6Jthbm4SIxZtHGKcbnOLD0TxVNmVlSKAbnstqJ4KIIUsEZBDMboCVxgB8yW8kqcEbBnBQDRQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwwMNkspcxqdt678BWKSnmUAEbSeJzVnN3d9AbfQ/0ti4bz6xld
 v4kfKCB2NCg2HuXYXzr+XuYKLsSQlOSimdn/YVUjz9wkKOaXLyd/2+gP
X-Gm-Gg: ATEYQzy3z7LJJR8IKRQ3mYXgwiLTHm0gvSsNRE1xK6PEE1mJYAW7W9TpmsJndmeVLLM
 CZN7zdN7qGo6BUXZt4NJNg1EIRObiM1+TGWLqnK9cqv6wG0p7X19moAKiJeUMKhZwGUxJxdzz69
 eYU9SKiwhN3dMd6I8sds8o2bJzHFjoL9OWjYUOBVJ8lz1qI+hWxDsCRK1VAYVldPpYtrDNc819W
 osb0aBsLBFXJc5NxN070UZM9Dxz4qWj08eX/8ZfQ57kN7kZOltgWf+w0PpIFkoQL96P4V0QKY96
 6HnTBGie8rwDYAZLZyhmK4oZUtwomwNyuYBcO263Buu1tDnQU0yX5oabanevg437mkvLMHxHBlt
 46Lj59nHdVpUSab0rR0SSg24vnDnH8eI5ElvfeOsWDhJCb7QbG5Qrw1jtdbZ4LNk6vugly+4pRW
 X/txiTHYeZUS/Fs3HzLvPJ7NY9Lw==
X-Received: by 2002:a17:90b:57c4:b0:35b:9703:7664 with SMTP id
 98e67ed59e1d1-35c008d38f1mr4197956a91.10.1774376860812; 
 Tue, 24 Mar 2026 11:27:40 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 11:27:40 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:51 +0530
MIME-Version: 1.0
Message-Id: <20260324-deverr-v1-3-7e591cce33a3@gmail.com>
References: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
In-Reply-To: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
To: Till Harbaum <till@harbaum.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jean Delvare <jdelvare@suse.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=3450;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=mGoeA4RoMr6oMafJS8Wz9uEiYGmdoZGvaadkVl07Ac4=;
 b=mqDXFTn7P7YKfYZq5yfTqBReywbYSNkXTrDiQ10Gxn0U4N3AcD22e4px2/bKmxQtkFRLFhMV5
 D6Rwa2VObbECiZHEiSRVGIVnkT5nDLR0wDkwvKuXdMmJb12BQQQ/qlI
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=
X-Mailman-Approved-At: Wed, 25 Mar 2026 07:05:52 +0000
Cc: linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 Atharv Dubey <atharvd440@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Enrico Zanda <e.zanda1@gmail.com>
Subject: [Linux-stm32] [PATCH 03/10] i2c: sun6i-p2wi: Replace dev_err() with
 dev_err_probe() in probe function
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:till@harbaum.org,m:andi.shyti@kernel.org,m:ldewangan@nvidia.com,m:digetx@gmail.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:pierre-yves.mordret@foss.st.com,m:alain.volmat@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:patrice.chotard@foss.st.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:jdelvare@suse.com,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-i2c@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:atharvd440@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:e.zanda1@gmail.com,m:thierryreding@gmail.com,m:jernejskrabec@gmail.com,m:mcoquelinstm32@gmail.com,m:zhanglyra@gmail.com,m:ezanda1@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[atharvd440@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[harbaum.org,kernel.org,nvidia.com,gmail.com,sholland.org,foss.st.com,linux.alibaba.com,suse.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atharvd440@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.951];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 02700320679
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 55 ++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 35 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index fb5280b8cf7f..dffbe776a195 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -194,22 +194,16 @@ static int p2wi_probe(struct platform_device *pdev)
 	int ret;
 
 	of_property_read_u32(np, "clock-frequency", &clk_freq);
-	if (clk_freq > P2WI_MAX_FREQ) {
-		dev_err(dev,
-			"required clock-frequency (%u Hz) is too high (max = 6MHz)",
-			clk_freq);
-		return -EINVAL;
-	}
+	if (clk_freq > P2WI_MAX_FREQ)
+		return dev_err_probe(dev, -EINVAL,
+				     "required clock-frequency (%u Hz) is too high (max = 6MHz)",
+				     clk_freq);
 
-	if (clk_freq == 0) {
-		dev_err(dev, "clock-frequency is set to 0 in DT\n");
-		return -EINVAL;
-	}
+	if (clk_freq == 0)
+		return dev_err_probe(dev, -EINVAL, "clock-frequency is set to 0 in DT\n");
 
-	if (of_get_child_count(np) > 1) {
-		dev_err(dev, "P2WI only supports one target device\n");
-		return -EINVAL;
-	}
+	if (of_get_child_count(np) > 1)
+		return dev_err_probe(dev, -EINVAL, "P2WI only supports one target device\n");
 
 	p2wi = devm_kzalloc(dev, sizeof(struct p2wi), GFP_KERNEL);
 	if (!p2wi)
@@ -226,11 +220,9 @@ static int p2wi_probe(struct platform_device *pdev)
 	childnp = of_get_next_available_child(np, NULL);
 	if (childnp) {
 		ret = of_property_read_u32(childnp, "reg", &target_addr);
-		if (ret) {
-			dev_err(dev, "invalid target address on node %pOF\n",
-				childnp);
-			return -EINVAL;
-		}
+		if (ret)
+			return dev_err_probe(dev, -EINVAL,
+					     "invalid target address on node %pOF\n", childnp);
 
 		p2wi->target_addr = target_addr;
 	}
@@ -245,26 +237,20 @@ static int p2wi_probe(struct platform_device *pdev)
 		return irq;
 
 	p2wi->clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(p2wi->clk)) {
-		ret = PTR_ERR(p2wi->clk);
-		dev_err(dev, "failed to enable clk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(p2wi->clk))
+		return dev_err_probe(dev, PTR_ERR(p2wi->clk),
+				     "failed to enable clk\n");
 
 	parent_clk_freq = clk_get_rate(p2wi->clk);
 
 	p2wi->rstc = devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR(p2wi->rstc)) {
-		dev_err(dev, "failed to retrieve reset controller: %pe\n",
-			p2wi->rstc);
-		return PTR_ERR(p2wi->rstc);
-	}
+	if (IS_ERR(p2wi->rstc))
+		return dev_err_probe(dev, PTR_ERR(p2wi->rstc),
+				     "failed to retrieve reset controller\n");
 
 	ret = reset_control_deassert(p2wi->rstc);
-	if (ret) {
-		dev_err(dev, "failed to deassert reset line: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to deassert reset line\n");
 
 	init_completion(&p2wi->complete);
 	p2wi->adapter.dev.parent = dev;
@@ -276,8 +262,7 @@ static int p2wi_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq, p2wi_interrupt, 0, pdev->name, p2wi);
 	if (ret) {
-		dev_err(dev, "can't register interrupt handler irq%d: %d\n",
-			irq, ret);
+		dev_err_probe(dev, ret, "can't register interrupt handler irq%d\n", irq);
 		goto err_reset_assert;
 	}
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
