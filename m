Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMsEDVSJw2m2rQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 08:05:56 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C67320677
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 08:05:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BB52C8F26E;
	Wed, 25 Mar 2026 07:05:55 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4391C87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 18:27:11 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-354bc7c2c46so2790949a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 11:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774376830; x=1774981630;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y8dxWxemVY09l/RSeGxRpi4JIV8mJaxVcxtXBlCQ2JM=;
 b=D303OkibRGkUIt1QyEC223hy/2DsLnSHP+hYLO4GBZfECDzD7i9rLXvTXHnKSKET4k
 eoPIc0SSAAxaldIMFajtn/bowN+fpBzXLD3PHnme6WNmoM1wduKGY0+HucqJZ2toW0Fy
 xkbLt6UBw9r+veQTiDRBsEAGtN5WUrFTi3IO5BXZ4vuuf3iUL0QwW3RxgwxWVdbPuFuK
 /Mz4gDALYSPnf+vC2iEfNOsKZhHwkejyjbluHp/zD0VFl8uxBQVzZl/S6RsZNqtWfRc+
 6Yo16dChSz4KOo60HPnRa5ZWEb6s5axd3l+GgAW+8Lb2VwokbWc+JpBS2JruqT0Qq5BW
 eWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774376830; x=1774981630;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y8dxWxemVY09l/RSeGxRpi4JIV8mJaxVcxtXBlCQ2JM=;
 b=J23zr74wTzz0oaOrPs3+taGAaRk3DwlQwBm+hnk7pIzFRh3BgskIFnFtjWQpeIPA6Y
 tls74AElQA3xyMRW17cMuPuQRTVXVu9y6ntzcoJGfCWWsrCPzA2RGSJ5nNK0QdKu+3Um
 NF7vArMTNphavT0WjyVmE0xrBlINKUCtfYI3tZxS6zlsrRUigQA3Z4jRCWtleLmpC/Mp
 hVnC2UM0k+8QfnIu4a3Fdj+YG7nxRn3TjfEYQ79IRVOZXjxzOtdBUTiKmKKNFgVDoKlH
 JU4svRokYK51dwBXKvLV6f/BZOFwWy1v36FE/5YGcz3kFqnsXvPMI/KXg7EZVygx/PSk
 HvCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3d0LqkqYFRUTIVaQH74VVWzXTSL2TsGa8WsvKhusEwlCyrx8lZBO0o15JEtMVP7FyQlmkv1gT5PT6RQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyj3/azT1ZJIyjUqjR1gQlZyoyFhXMarlIaLgHjEdCM+8usEEhz
 qzB5eGo9WkepJE33Qsb4tskpz2wHKbB31qknjIi7CvdIOANJwhQMvZqA
X-Gm-Gg: ATEYQzxXtArYDf1u+5rUyk+fdTgAUQ391mClNEIF5e/zx8s/Ji5ABvp2vtSOQ2zEYYf
 Q5W35ZWFSPfsaS/RxQy5aF6xPmtggRwYYbo7CQQOrBu8NP+5P5zxBw+PSSt4GgkO5fZbyAzFP6K
 ds+b9XHMawcNN6RO/NBgpHttFOQK8yRWFMy7aq2MQE/UMSIu53socbEVw3Z+zeFU9pttNNwuXyd
 LePqMA4zg3CD7YXnxYfLae3L8y503CsbxJ+v/4XqCnPZ75ry5nJCWK29o60tq0H9sqXSZ762EaO
 VY+sD05uP5HKF6Xd4mAanrgUrTS1CMq2DrJKQYY/AEImkuj4e8DLtYmYoqmIxsgJORYt8jyuaPD
 j0sOrhYCMJgLjGgFwDzm+izrIuc2WKU5LBsikhXJrKhW+wDUXLJXyFh9YBBZW2r5EOe4xrP2Clf
 HVgS6NOlBpptBPNYoG6dsPgM89cQ==
X-Received: by 2002:a17:90a:e705:b0:35a:329:73c6 with SMTP id
 98e67ed59e1d1-35c0dc80d99mr378084a91.3.1774376829881; 
 Tue, 24 Mar 2026 11:27:09 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 11:27:09 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:48 +0530
Message-Id: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGnXwmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMT3ZTUstSiIl2TJIMkg1RTA0NL02QloOKCotS0zAqwQdGxtbUAXM4
 talgAAAA=
X-Change-ID: 20260324-deverr-4b0b0e50195c
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=1970;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=4eB96+tZs9fT6uON/Cp8K3KPDm65oymtk7Doe5oPZv8=;
 b=JHbyxUnpSIHVtTKhxJxQI2JLJGqRVx4xwS3l4IGQaiBFJ6HmJ/N18C/fndglYd7QgKbDy3Fs5
 kHTwhOvM/fYAd0raQ4P7x22Q0EFLgoDhJRXmkPQQ67kohmHbtFETWXF
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=
X-Mailman-Approved-At: Wed, 25 Mar 2026 07:05:52 +0000
Cc: linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 Atharv Dubey <atharvd440@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Enrico Zanda <e.zanda1@gmail.com>
Subject: [Linux-stm32] [PATCH 00/10] i2c: Replace dev_err() with
	dev_err_probe()
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
	NEURAL_SPAM(0.00)[0.979];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 01C67320677
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series replaces dev_err() with dev_err_probe() in the probe() 
functions of each module. 

This simplifies the code and improves logs.

---
This Patch series was intially sent out by Encrio[1],  
this series is an effort to get it reviewed and upstream 
it. 
 
[1]: https://lore.kernel.org/all/20250520194400.341079-3-e.zanda1@gmail.com/t/#u

---
Enrico Zanda (10):
      i2c: tiny-usb: Replace dev_err() with dev_err_probe() in probe function
      i2c: tegra: Replace dev_err() with dev_err_probe() in probe function
      i2c: sun6i-p2wi: Replace dev_err() with dev_err_probe() in probe function
      i2c: stm32f7: Replace dev_err() with dev_err_probe() in probe function
      i2c: stm32f4: Replace dev_err() with dev_err_probe() in probe function
      i2c: stm32: Replace dev_err() with dev_err_probe() in probe function
      i2c: st: Replace dev_err() with dev_err_probe() in probe function
      i2c: sprd: Replace dev_err() with dev_err_probe() in probe function
      i2c: sis96x: Replace dev_err() with dev_err_probe() in probe function
      i2c: sis630: Replace dev_err() with dev_err_probe() in probe function

 drivers/i2c/busses/i2c-sis630.c     | 31 +++++++--------
 drivers/i2c/busses/i2c-sis96x.c     | 30 +++++++-------
 drivers/i2c/busses/i2c-sprd.c       | 13 +++----
 drivers/i2c/busses/i2c-st.c         | 34 +++++++---------
 drivers/i2c/busses/i2c-stm32.c      |  4 +-
 drivers/i2c/busses/i2c-stm32f4.c    | 53 ++++++++++---------------
 drivers/i2c/busses/i2c-stm32f7.c    | 78 ++++++++++++++-----------------------
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 55 ++++++++++----------------
 drivers/i2c/busses/i2c-tegra.c      | 12 +++---
 drivers/i2c/busses/i2c-tiny-usb.c   |  5 +--
 10 files changed, 127 insertions(+), 188 deletions(-)
---
base-commit: c612261bedd6bbab7109f798715e449c9d20ff2f
change-id: 20260324-deverr-4b0b0e50195c

Best regards,
-- 
Atharv Dubey <atharvd440@gmail.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
