Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIAuFVSJw2lRrQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 08:05:56 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C93D320684
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 08:05:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6946C8F283;
	Wed, 25 Mar 2026 07:05:55 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7790C87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 18:28:13 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-c741bd1ad11so728223a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 11:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774376892; x=1774981692;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LOh7L59SGXDe0n/0/CxydhLmu3Ccl2K/OUt14k5rUoM=;
 b=GDanjK4IogahJLUp590ht3CKm4PPPfN/NNwzrquIw1hA26Mr9aQ+k4pIUIWE+uBvjf
 V9pc/Qo0NbLqRbxHUM++PMfABlflZhMhxDZE5MyTBI3S90dJ9632tQV3VIB7zv8h+93m
 OSvWpc/oFDBO5GXG5T0XqzYqnnaWt7Ea6Jx54yolvqJWc7gxPkQCLJhI0Qrg/lQhDu6c
 uwjku5IdjQlua9nAv4PPX+XqSK+UJtbt1gKuWjZU4isb5Fpfuc0P+nOLP5k03DOMod4D
 280/p3Bi1Aj4xTy0mc22yZlOgdNkfpa3BngdD+XXvi3+5U4sXTjAZfGFYWob51+IKXiA
 ba0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774376892; x=1774981692;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LOh7L59SGXDe0n/0/CxydhLmu3Ccl2K/OUt14k5rUoM=;
 b=SpKpEk/TAbHHnfod/k10iGtQd5a0UN25NVhz9D7x2OtqPMIgtadpYvsgBmUN2+FF9u
 Dd636ZnfeYiWjHpqxs06U0Gvub6VaaubqeDRbLF0TR97L3rYpuQQ1r4lf1Iq6Jk6ALhH
 fIoPG98PH105bMsM62dyUsjl6Dy5o3YkC216nr1yvEVnSPpfCAMm18T5QEsGIcBZc4Rv
 yXd0tlNHXR0SQrExgVRnH8LXnyeTyT0QTwNOA3bTwIhncPulotgRp3I7FfMf0CQdV4fF
 KS2vBoCj1gbbvipZ3LxfKyRWuhCoY+JlDDgz1jok8XUe5v11Dv5TKkotN41IhwE1wsTj
 FsTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwfcr+7y/Gm5Q0jDc46VWK8ixHNLFNf6VRWvxXxUuXm0mTpACa/6Men15ny2mrBYQWg046l+7yVmovng==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywu5ndWyuQ0JOI97RbepfYNTQpZAQmkJtM+wCcALxYFXlKOuTkL
 m82lQGhCi6bNxE7Bc59cdDbBqkJiXkPvM0Lu0LZBBEKrLpWtGC6gT58+
X-Gm-Gg: ATEYQzyyk4s+EtLwh74KTjiiddDkJjkdyB4u/IKd1l54GAvIjRliUwV4q/fkO/WWTRx
 4n+B7TOv5EucR2451jea2gLskndL7t6V9tT5f7StnZW7aAdXswDL6BGtxh3fPlrTUiibWa5V5pK
 IKHb2BU1aFxImqA7c/PosGCUAkPeOkhOtqNn188GZIanUYu1tZLD2nAPIopv5/VUeIrElx4jedH
 5PxtVgIPwSx6MRjFC/YnjOWK/Y5+hKMe7z+31fQlzyb7cIUAGrFuN5PSVcrTzhA9AgI77Qk5Rl8
 1WjGEZhQWJTrYUOTxSiRSlPY6W3FG/AX8bOrIGQuUFSIu0UD9TkExHzv9BQjtT3CmiEow1ZRill
 vnlVpK/aoevG7hp/yAvlhz3SKhd66V8PO1dI/AUkmi3ZLKrVZpWY+RMwjJ5s92u15ITNtQXk+Yz
 ILBMtfmFsQ1fEOCqotxuWiO+jyDA==
X-Received: by 2002:a17:90b:4a4f:b0:359:f22:8879 with SMTP id
 98e67ed59e1d1-35c0ddb253amr350462a91.22.1774376892133; 
 Tue, 24 Mar 2026 11:28:12 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 11:28:11 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:54 +0530
MIME-Version: 1.0
Message-Id: <20260324-deverr-v1-6-7e591cce33a3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=1144;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=fGh6XbxSkvU5zsFALrHQqBdXVjE2X7LO7LjtYihQc1Q=;
 b=bSr5WSYN2sBbQ56eV/RU7Nsc30A+f8iif2b8KvF+i2QPU4oV/n2gxZwRlmFwYUL0Sn4WgwU3t
 BHbt5Op51GJBjc0aJ76ljbLTb0hDHykJdiMU+4SpjB/VkJQQUf6r5CT
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=
X-Mailman-Approved-At: Wed, 25 Mar 2026 07:05:52 +0000
Cc: linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 Atharv Dubey <atharvd440@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Enrico Zanda <e.zanda1@gmail.com>
Subject: [Linux-stm32] [PATCH 06/10] i2c: stm32: Replace dev_err() with
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
X-Rspamd-Queue-Id: 2C93D320684
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-stm32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32.c b/drivers/i2c/busses/i2c-stm32.c
index becf8977979f..064e47d6c96f 100644
--- a/drivers/i2c/busses/i2c-stm32.c
+++ b/drivers/i2c/busses/i2c-stm32.c
@@ -39,7 +39,7 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	dma_sconfig.direction = DMA_MEM_TO_DEV;
 	ret = dmaengine_slave_config(dma->chan_tx, &dma_sconfig);
 	if (ret < 0) {
-		dev_err(dev, "can't configure tx channel\n");
+		dev_err_probe(dev, ret, "can't configure tx channel\n");
 		goto fail_tx;
 	}
 
@@ -60,7 +60,7 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	dma_sconfig.direction = DMA_DEV_TO_MEM;
 	ret = dmaengine_slave_config(dma->chan_rx, &dma_sconfig);
 	if (ret < 0) {
-		dev_err(dev, "can't configure rx channel\n");
+		dev_err_probe(dev, ret, "can't configure rx channel\n");
 		goto fail_rx;
 	}
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
