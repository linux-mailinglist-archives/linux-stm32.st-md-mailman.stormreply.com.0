Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEqcFFSJw2m8rQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 08:05:56 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0253E320678
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 08:05:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62F4CC8F273;
	Wed, 25 Mar 2026 07:05:55 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59488C87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 18:27:33 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-35bb7afdc38so849218a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 11:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774376852; x=1774981652;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9Gsg2Xtdfdl+8IY6r0o/RyYDfTlBlRsSZJpA/oULFGs=;
 b=pzau/lQaSHAOTCiMg+d+dmUgT4oIlcV3PSqZ1eUkZtSsrR8bAj/8O58cswP2trpLkP
 xTonBVvEVisLZk01rqyQnez7Y0k7emmgCEGl+z2Hod9Me/9T+73UmECerdKiNU1l0IBS
 ddDu6RFyYLdLN2HTj1lcjRaUPonhZjmaEvpCUTgrdEGHbfLSH25fqKGE96+pQtwkwjnh
 TiSH5hg2eB2IvueLTEhsr86/HivB9UDlrPApYMQnV9OulMKGw/ytNxUv/7JGb9xn5ZJJ
 QTjQ5bz1lHukmnd2STu/De1NRV6lsaNYEynxpAxIBg1/WZAd7bZUapotnyT6Hf3NTAxP
 7fWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774376852; x=1774981652;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9Gsg2Xtdfdl+8IY6r0o/RyYDfTlBlRsSZJpA/oULFGs=;
 b=b/pVJruR1Ja7x4KLkWbId6J4BbaR5SMhDQD6WPkc6ot+BytcM0V1KVgqqIwTixt7UO
 wN3xcxIEMXcgJa3UbVygouoOxayMNr+HkVLJK2KCaOYMx9dDouNDnxEFkLGd3MmFWq6S
 aUDEqsIH6S/0qgxEYMuH7ebELPay4yUdSgOoz+mDQEc1HPv0nkKWFquH+0Vw2+kjBrPn
 +Y7RCW1WMI60cYWSFsAcUusxc/dbIOcf2/v2d+pQV8NwBTyeL+6igxnN7yt+YFb/Wtwa
 80NblUVI+h2M8xlzwSCuTy3Y5TtCIDvXnP7cy+jWGgTx73FpknMmS1QmsDcwZ1jSYhVx
 0c0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlXshrMxPPC63m56KxWSo+UqDP5mGto+cvyEn2tlRAcY7rGzFJPNiabufRo+j3/aT/6+rV7/YJtt4vZA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywk6Pawig2K37VdwAYHa8/qTxZ1UjsmFJjqoCXIn3bevrnrdEKw
 P0skPSWBfHLv0DlVHhuI6jMo9EX9b/1zzFTkDdT7m2unbjE7xzH8FxXZ
X-Gm-Gg: ATEYQzzwwYqvAc8LRZyPklmlZAywcVWsuqCkvewFvllJAg2NFDEcyoSB7YggNivQ0E7
 jQImAg1IO3aQ24u44F0W0F6FM+QE37C4GmGPZD1GneAwkH0+8o+pm6a/Y/o4Z38cpD6anpASS6t
 kSR5CmhwohKMRXvhppECRV7UAPF+2XuQ8Tw2qIqslRLCKc74X3fm30rpc/uSHwbkn7z0y22XWLy
 6PGfzHXwzE2a1S90kGkBWY57ICM5Yg4FK30Ng+ADu76+H+uBJU+n85FzQoxOpULoWTe/nURSSyJ
 5GQQhDakoS+vTdNu5ot/B62VtNnyqbjbRxpVOdBkk0+meY3X0by2Wswy1N7+Y68Kc+j9jbhwejr
 pG3zoMG1SNXR8H461QVhlwgwqgeKKPDoE47HHNr0WsKm2I4xlq3dYcOMGKVihb33maNKZNMvlf+
 BO0wLlTAtdq1ujaATudn8WsnPnWY3dvi1CQLIb
X-Received: by 2002:a17:90b:17c8:b0:35b:e591:99d1 with SMTP id
 98e67ed59e1d1-35c0ddc4118mr351953a91.29.1774376851910; 
 Tue, 24 Mar 2026 11:27:31 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 11:27:31 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:50 +0530
MIME-Version: 1.0
Message-Id: <20260324-deverr-v1-2-7e591cce33a3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=1910;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=T//TFybKN0iS3J929ONSQMLq+NVtMUv+4U4PajSEtpE=;
 b=fr2E/ILXide+l6/sGLPzjFEjto2BGT6qqnz9x0FPbuW7SDMBkCcBooGAF0nF3tgg5wQpoDzh0
 nAnDJBBoQYcAomrkw15oBfCFd8unXKN1lYuv+oiXhwJuhidayGEmEVJ
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=
X-Mailman-Approved-At: Wed, 25 Mar 2026 07:05:52 +0000
Cc: linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 Atharv Dubey <atharvd440@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Enrico Zanda <e.zanda1@gmail.com>
Subject: [Linux-stm32] [PATCH 02/10] i2c: tegra: Replace dev_err() with
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
	NEURAL_SPAM(0.00)[0.952];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 0253E320678
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index bec619b9af4e..51d15fca82fc 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -575,8 +575,8 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	dma_buf = dma_alloc_coherent(i2c_dev->dma_dev, i2c_dev->dma_buf_size,
 				     &dma_phys, GFP_KERNEL | __GFP_NOWARN);
 	if (!dma_buf) {
-		dev_err(i2c_dev->dev, "failed to allocate DMA buffer\n");
-		err = -ENOMEM;
+		err = dev_err_probe(i2c_dev->dev, -ENOMEM,
+				    "failed to allocate DMA buffer\n");
 		goto err_out;
 	}
 
@@ -588,8 +588,8 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 err_out:
 	tegra_i2c_release_dma(i2c_dev);
 	if (err != -EPROBE_DEFER) {
-		dev_err(i2c_dev->dev, "cannot use DMA: %d\n", err);
-		dev_err(i2c_dev->dev, "falling back to PIO\n");
+		dev_err_probe(i2c_dev->dev, err,
+			      "cannot use DMA, falling back to PIO\n");
 		return 0;
 	}
 
@@ -1953,7 +1953,7 @@ static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
 
 	err = clk_enable(i2c_dev->div_clk);
 	if (err) {
-		dev_err(i2c_dev->dev, "failed to enable div-clk: %d\n", err);
+		dev_err_probe(i2c_dev->dev, err, "failed to enable div-clk\n");
 		goto unprepare_clocks;
 	}
 
@@ -1979,7 +1979,7 @@ static int tegra_i2c_init_hardware(struct tegra_i2c_dev *i2c_dev)
 
 	ret = pm_runtime_get_sync(i2c_dev->dev);
 	if (ret < 0)
-		dev_err(i2c_dev->dev, "runtime resume failed: %d\n", ret);
+		dev_err_probe(i2c_dev->dev, ret, "runtime resume failed\n");
 	else
 		ret = tegra_i2c_init(i2c_dev);
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
