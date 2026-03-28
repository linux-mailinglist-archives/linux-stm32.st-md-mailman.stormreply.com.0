Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RkBDIGUPymmS4wUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2026 07:51:33 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFE6355BA8
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2026 07:51:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FBF3C8F27D;
	Mon, 30 Mar 2026 05:51:32 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D09DFC8F288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Mar 2026 16:07:14 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-358e3cc5e7eso1560873a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Mar 2026 09:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774714033; x=1775318833;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6/qgP9gqmMpp2U/rdBQhHtYOkT3qsy2wmqdnlrMFSgg=;
 b=S+R42gSUeqpDkfPSmBlXVChX2mDevf0hBkEnSRmw7W4t5oJPmXNMUGUNr21fFQNl7f
 HZGmNRZT2Vkp3IdqHbCr+MnSTXFpfbh8aWwY/pg0lZ0EenNfB7kbGLRkHctADfsSvA7Z
 bwHl8ATkNyjUxk04SBBl8NqUAKp1pg6AmjbgaVYqjLtb8L3T8AByCnjeEkT4GtWmsV1g
 F4Kr5bzT5MctzTT2ajrXsYSKuzGxedDO4jJJ5Kz2s4nkRfStB+CipyLAZVzoT2dbrpmU
 QM04UTJ842IsGk8sSN/VlaNb80B6yTQpVuZVU3qH8l3l5dN5giFAODVP4/gUAjRJEEmy
 VpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774714033; x=1775318833;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6/qgP9gqmMpp2U/rdBQhHtYOkT3qsy2wmqdnlrMFSgg=;
 b=KN53++xkoJOHbNDffs46ugWNmhtEDZvpmscGwMUKimEsCQpbLerFWUqfJhfpoCi3JI
 yZsn4ENASzm6E7DMLullXNHL9WcXA3BsAuR2uJ5RWh9wfcdPlpEntvvwR0ZlWK8UYnSt
 yd0gXylsLUZm6XJxjg+43n7ikqQmkxXTc775v4MlcDxABYfiYPnfJ+NpSI4LzTfOjZqW
 RW+MxfORutKpz80faeco6cILsTCdCD+W+74/j4EoDzyNwgJ9Xnl6IScykA2Icq8wF9wn
 phB/9MfJAylRkvEF++9IYrTvKfex5ICcniJgzuMavqByUrfMVj7Z5JdA/GQ9KIrwqt7K
 +ahg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl2c20xxLOlsS+lzsrowq8Ke3qgQIb2f63bUANsAagpZTvjXsuPDsohCIQFIY8dMv0RsRYTQ1m9cMLXg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx/oLm9tKcUQZOqS+ntfQ0PpYepY7cF6T0sflaM59kVFPJFx0yP
 sY6FjNd9JhcASXR7CflgSbToFrSUIzOBvNlaHwLTH//TYw8k37+zL6Oi
X-Gm-Gg: ATEYQzwzwWi2aERLlrHi3ZDo3W+zLhOuii19jQZZmVr+qZ1yethtgk8AMuiLPhGVyOH
 bovfjqKSFD8VKkeTNW4Hyps2nYjmMcZwqwrdBho7eMGP+9d2qfx6WHyYP6sTo+e70XVlJs1ekuq
 2eQNcppQfD33OQJmz3O56CTPHloV2ogUoRG3UwiQyGvr4GGUymsAREW2iqVOtPEx9ZyXOhI/XrS
 5vRa7ghyh41i1T1ZZ5KSQhiRt6Z3Iet+IeHv1GyLiLW5aq94qNWkE8rJJvj4qVrl1fubv1w0Jfy
 rxpdf5r+0Y0hJYM8SuZM32U798pzNy3BVxYnTnrRpPiT9Bd9YVQw2GZRBB1TI5gF1hO88qdi/K4
 sjJrv9tWnpCyH5lEKtsxv0U+Cj3DzGTr6bVJOgBs5WMBpraYXdEmoGf1nKhF+v1oLHrS2ylF4qE
 6P+2VrspfAXwA4c4Q/QbGFRCrzpCkeVIQxDOJr
X-Received: by 2002:a17:90b:1e4f:b0:35a:1b43:dff1 with SMTP id
 98e67ed59e1d1-35c300060damr6402909a91.12.1774714033225; 
 Sat, 28 Mar 2026 09:07:13 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35c2ec27da0sm1988140a91.8.2026.03.28.09.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2026 09:07:13 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 29 Mar 2026 00:07:06 +0800
MIME-Version: 1.0
Message-Id: <20260329-stm32-ospi-v1-1-142122466412@gmail.com>
References: <20260329-stm32-ospi-v1-0-142122466412@gmail.com>
In-Reply-To: <20260329-stm32-ospi-v1-0-142122466412@gmail.com>
To: Mark Brown <broonie@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774714028; l=1079;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=B2M6TmSMVm9Sf6C3C9nuArJeOUQJv3qKC5BIO5ffMLE=;
 b=K3icUELnLZRMgZ/cPYJO9EzPAK2OMYHOCr7hyQOJnzEc4OMrk33Ar+ZZkU3slL5LvqPmk2sLA
 mJOwZbw8vXjAsa1nv9Kt2X0dyD1JJSNopgTjyIp2Ct8Tin+OylPlzR4
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Mailman-Approved-At: Mon, 30 Mar 2026 05:51:31 +0000
Cc: linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/2] spi: stm32-ospi: Fix reset control leak
	on probe error
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:p.zabel@pengutronix.de,m:patrice.chotard@foss.st.com,m:linux-kernel@vger.kernel.org,m:ustc.gu@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-spi@vger.kernel.org,m:mcoquelinstm32@gmail.com,m:ustcgu@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[ustcgu@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
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
	NEURAL_SPAM(0.00)[0.981];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 0EFE6355BA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When spi_register_controller() fails after reset_control_acquire()
succeeds, the reset control is never released. This causes a resource
leak in the error path.

Add the missing reset_control_release() call in the error path.

Fixes: cf2c3eceb757 ("spi: stm32-ospi: Make usage of reset_control_acquire/release() API")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-stm32-ospi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index acf2d182e8b1..52997c3f7174 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -960,13 +960,15 @@ static int stm32_ospi_probe(struct platform_device *pdev)
 	if (ret) {
 		/* Disable ospi */
 		writel_relaxed(0, ospi->regs_base + OSPI_CR);
-		goto err_pm_resume;
+		goto err_reset_control;
 	}
 
 	pm_runtime_put_autosuspend(ospi->dev);
 
 	return 0;
 
+err_reset_control:
+	reset_control_release(ospi->rstc);
 err_pm_resume:
 	pm_runtime_put_sync_suspend(ospi->dev);
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
