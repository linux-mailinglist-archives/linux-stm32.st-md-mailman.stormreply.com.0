Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKXoHWUPymmL4gUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2026 07:51:33 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D9F355BA6
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2026 07:51:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C29BC8F27B;
	Mon, 30 Mar 2026 05:51:32 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3411CC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Mar 2026 16:07:12 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-358d80f60ccso2039773a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Mar 2026 09:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774714030; x=1775318830;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mh8F9k4/dinkDW3+fSJ68XGmJrivibpzhc6HbsO47Hg=;
 b=cm1/3EfMuo7u5NqrESw7BL+Z2yF47M4KmGj6cBPthaJlRjKEvdD/4hBMRNBP6/3orI
 rNq6uVKpscWefRSH4cwjyDDLThqjldistvQktQq0AGUnT2U2BYqM13bSAlqS80Xg0tEk
 oweI1lsOCDFMLbCANuwzzKcgKuC7xcr/1bM6/g+yj+yPd8HFNyRBGXQPEeVp80Hr301F
 mNVC5hn+6DF7GGSmObXPueF11ld0fpaBlj1mQrnhD0rsXRkJ1HVN8MzAfiqTXwtwOH+F
 mc3InUE0/XrIyhCryZjlSI47y7iQxJQdv2xvQ7wq6A9p+F1+AbQCvkz8ISC7XuG/B8Cg
 zeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774714030; x=1775318830;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mh8F9k4/dinkDW3+fSJ68XGmJrivibpzhc6HbsO47Hg=;
 b=W5X7RI8AE9F4hObJQLObVHq1+L8TKDvvwUI+BgD2kSQr4Alo95CwGiGAjIfCr2CvNT
 7ItKdKbN1+TaCU1IsLrz/5+alNiE4i1EVmAzNtKHPVkJsvdTrxy90/hFdrk4MXm6OoW8
 rBTqj+ihyCUDtwm+wSVazP87O05f7h7+ktlIVyNslRUmZEWbhtoR5OrSyWP3hd+BQksW
 YD+rdadAPtmrkVOhdQOM3hOQp4DBowYj2vioP238k3HKpyrwdgjoYdN+5QgoSEmahSLE
 oso/O7aimUQICW+GDcPo8kIRxbLQBDg74SauZp/yY0HKyIUI9/QYi8LNPVAW+ZyFAXam
 Y0dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX55we8szeRnrHpQf4fNNnrlF8xfAikFWlZ/irkNhyOqub5koYwsUF3RhcUcbcvPtqoPgkisxQNVhKMKQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz3O2MufmvcCFofsJjRoryCbvEu3Zxgvl/9e1eROL30hbX/YykA
 AgG0s0/mIVrPowjeSzg0h/kUTkoQfmXp+hPND4ZYJ4TIrpS4PEqJ2i93
X-Gm-Gg: ATEYQzwZtXOUqoag7ZK2YVScyR+IFLTlMei/Fk9m3Pri2V37lRy0FkBwoSSJXofff8H
 e9zqsENiDkTQKNIFQTYGIGrVdCWATzDEFaPQA4T8hL654vDUG8ftY7H+puwGTqVU3Cx/5GIngqj
 3T1w0Hn3R2zjc//AJ5o1AgYuhS89iEJ/6KJBO4QZAAWR5UjGz40K/WJkJcp1JRe1CKOnPn/5RZZ
 o70UyFektmfS+8C2GieZt7njmXQpCQ3k8ru4Mw6VyxWfbjUCcxgX1pyq/OOIDfojc+wyKcfbipq
 3wHA1vyKmRoRbXqExeBZpFF/mEqjcR5ti1jXT3OlagBlv8OJnZoctPG3O4UobT3WLwxMj2c3RJK
 4xetoDJPnZzYNIV1EVPeBK0yCngd/JDvbshng9a+ryQo7/tLhT+1J1qDKosZd0+ARyl5fEOYua9
 8HlS2xaKXoz08239zGTKQ9nG54+SVlRL0wXOHH
X-Received: by 2002:a17:90b:4b4c:b0:35b:e591:99d1 with SMTP id
 98e67ed59e1d1-35c30115bf8mr5974559a91.29.1774714030368; 
 Sat, 28 Mar 2026 09:07:10 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35c2ec27da0sm1988140a91.8.2026.03.28.09.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2026 09:07:09 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 29 Mar 2026 00:07:05 +0800
Message-Id: <20260329-stm32-ospi-v1-0-142122466412@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKn8x2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyML3eKSXGMj3fzigkxdsxSj5EQDC2Pj1CQzJaCGgqLUtMwKsGHRsbW
 1AKuhUnpcAAAA
X-Change-ID: 20260328-stm32-ospi-6d2ca0833eb6
To: Mark Brown <broonie@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774714028; l=458;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=Bp6FqcuqvbNaOb4ln+t0fQhjjxmyiJc3wIxmGVnK+W0=;
 b=6Gs+lZTSrrDeaFeCljm1jglrdrUxEIJ+DaahhE1qGO2T/H/LZu0YUfCncOMvDLG4FCni1kwVH
 aHSXyDFyhHnD9e87xgGgrciIUZGsIMgG6dWSAeKw6Bxt4Dm5lQY06am
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Mailman-Approved-At: Mon, 30 Mar 2026 05:51:31 +0000
Cc: linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/2] spi: stm32-ospi: two fixes
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
X-Rspamd-Queue-Id: 06D9F355BA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Felix Gu (2):
      spi: stm32-ospi: Fix reset control leak on probe error
      spi: stm32-ospi: Fix DMA channel leak on stm32_ospi_dma_setup() failure

 drivers/spi/spi-stm32-ospi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260328-stm32-ospi-6d2ca0833eb6

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
