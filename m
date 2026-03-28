Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KbaJ2UPymmL4gUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2026 07:51:33 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C0E355BAB
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2026 07:51:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BF17C8F287;
	Mon, 30 Mar 2026 05:51:32 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A799DC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Mar 2026 16:07:17 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-35d99031e4eso236978a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Mar 2026 09:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774714036; x=1775318836;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UqrrS9uvTvJ0weuIXquOC2uG3YCXwOkehaDJ4cbhf3E=;
 b=NF5xk9k2mi6DesV3z6JmzbeSwG49+YeBp+PmR8mkBmNw5vDWXnF+dInrC/jMwRPttq
 WPEitdkhDbZ0FtIjj+Y8T38nvcJs2ejNGdBrAaFgTANj0wE5qbxpWmhIob0q6uLvMp08
 QZol653pDowmDjrdKW6PYnQ67kBufjCxbvG2UlvQozsnTY6H8d+YJBoaTClg+e+/gGHs
 lXf8HF3clu2EizKtsbJK+6u1GAObb8bKAevVaLZTuaKJvhT6Tz+7U2bdCLJ8L18S5x9W
 mPBwis6qi6h4IAnmLEbYuWIYmtEJ8VOJHBvvrJ07bVgLtxb6VE0GuMKqpafLprwC9dLN
 QOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774714036; x=1775318836;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UqrrS9uvTvJ0weuIXquOC2uG3YCXwOkehaDJ4cbhf3E=;
 b=nytGSRjPAgF5jo8DaJ1gGUhwVnEQFHyjp8sKFWJANFO6wU6gp40/e0nWHGnNMLII+u
 4ynA6bhZG8lm1Z/U6ysA6pba4ndXiO8KQNAPASohs4mCq2EICr60pMfAAv3vQzSqBTF1
 plN/R6x2uEHzl3JGT+4T1sZMiBmnEGvXO398dhVVaWGoVuCldBs1GY6AmBwOA3rYYePB
 Q47AdHEDMr9L/saX0+r8LHMJ/MquLE7ShagerIHDYTvkCEM8Lg9Q2w74cPxtW2aGlTDh
 jFTeeDXy10AJYEMEtylBLJP2kt+2e4RdX/Q3JX6Yt3oJC1Skww11jHIzxU7dO+fxexfe
 bXSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkhf98O1beNNJpfA7Hy8wl5rgdXaVXEvGsosBXdNfiujEplQP/Ieg0JKT2EHX/IsT/dSshdp+XIGinDA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx0VPl+bWCj50I87d2vaZBk36qQ+Wyb8Uy9Xk6uhyeZBmLrGSmV
 BVguj0xPDByF+ZkdYfvXcvUvOwLgMq1RLzkED5eUZB8p6ktGWCbE7oGT
X-Gm-Gg: ATEYQzxmMRdmT61dFM3ErH88ozwu5Fy71vehvRclIZYBEQTJ/av3jPurRTOKMUCQU21
 6eI+eVaMtlo7p88jclP98OrDc32URLL8bLxMGtLGA5bg+bEvEjpUQo+fmG1EivCN4UeXUJGll5O
 Y9bO5/Ou4rLRRb5r/Lw2xsFGTCb5qI5v3DZmCD26R7Yakdr4a9wtJd+RVt1sFUUpdhnafB9l1L2
 cnz/uE62voAm0z6gxAaKuDtN3FtVbdoIkTJCzT4cpTDr63M3tv2eSHBF3H81S5xYsvncsH7q0O8
 eDrUt483Gt0FJfHh7Ym2wUqkun7Bu1F4TgJP5gWPJvOim/9Ify8tl9laybQKjLBAel1sQXK8Zde
 LVjRzfpA0nK04Dfl4U9S5N4fTPWzSsoBNYFJ12o+icb6cVFHU/iGz+/6c+SUEX9GC3PZYf7LPyY
 g3i08x2z99VXEphkbzYj9FGYkxgU+GVq0WN/i8
X-Received: by 2002:a17:90b:390b:b0:35c:812:6126 with SMTP id
 98e67ed59e1d1-35c300f9db0mr5029057a91.24.1774714036132; 
 Sat, 28 Mar 2026 09:07:16 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35c2ec27da0sm1988140a91.8.2026.03.28.09.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2026 09:07:15 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 29 Mar 2026 00:07:07 +0800
MIME-Version: 1.0
Message-Id: <20260329-stm32-ospi-v1-2-142122466412@gmail.com>
References: <20260329-stm32-ospi-v1-0-142122466412@gmail.com>
In-Reply-To: <20260329-stm32-ospi-v1-0-142122466412@gmail.com>
To: Mark Brown <broonie@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774714028; l=1104;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=g/NC5thUm9GobODU/U36/p17WTlVCj1qLtVx9sZkHSc=;
 b=aSWLNSCRp0D8866dSgcbY+JT4XedGUT6QeFZ4e3z25/G+O1t9HoLZs4yvCDebAVPEe6SBW0MI
 wJBP5VFN2niD5tp1lOmoFBkjn9PFB5InUP/CCkXoqJ2mkl3cCcQcxGB
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Mailman-Approved-At: Mon, 30 Mar 2026 05:51:31 +0000
Cc: linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/2] spi: stm32-ospi: Fix DMA channel leak on
 stm32_ospi_dma_setup() failure
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[37];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:p.zabel@pengutronix.de,m:patrice.chotard@foss.st.com,m:linux-kernel@vger.kernel.org,m:ustc.gu@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-spi@vger.kernel.org,m:mcoquelinstm32@gmail.com,m:ustcgu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ustcgu@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com,pengutronix.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_SPAM(0.00)[0.982];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 34C0E355BAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When stm32_ospi_dma_setup() fails, the DMA channels allocated by
stm32_ospi_get_resources() were never released. Add proper cleanup
in the error path.

Fixes: e35a7607e05d ("spi: stm32-ospi: Set DMA maxburst dynamically")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-stm32-ospi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index 52997c3f7174..34498939bcdf 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -923,7 +923,7 @@ static int stm32_ospi_probe(struct platform_device *pdev)
 	dma_cfg.dst_addr = ospi->regs_phys_base + OSPI_DR;
 	ret = stm32_ospi_dma_setup(ospi, &dma_cfg);
 	if (ret)
-		return ret;
+		goto err_dma_free;
 
 	mutex_init(&ospi->lock);
 
@@ -975,6 +975,7 @@ static int stm32_ospi_probe(struct platform_device *pdev)
 err_pm_enable:
 	pm_runtime_force_suspend(ospi->dev);
 	mutex_destroy(&ospi->lock);
+err_dma_free:
 	if (ospi->dma_chtx)
 		dma_release_channel(ospi->dma_chtx);
 	if (ospi->dma_chrx)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
