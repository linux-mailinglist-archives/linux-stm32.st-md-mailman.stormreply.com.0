Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WwyPNUGYL2oHDAUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2026 08:14:25 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61970683B11
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2026 08:14:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=GfC3A1N6;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C781C8F27F;
	Mon, 15 Jun 2026 06:14:25 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A869C424DE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Jun 2026 16:57:07 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2bf237e1433so30949205ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Jun 2026 09:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781456226; x=1782061026;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KmOBCXRMxHUy9xFI3toxiU28u5v8kqCzk7z0VpaRiLk=;
 b=GfC3A1N6wxyfpVP5Wljhd8EsN+kdWieDDJi6IEwje5IW5zfiTIbtYG0HniE/pX6DR7
 kJWXU2LDUZHNY2qmBBWjgCTFlBBhsUM5hcltyn+OZOlq71fmVQLLawQKIcvc1u6ssWjE
 hIPtOhPjIB89vElmaR/7SLFSO7ix60nvF+Z2dqu0Wo1J32Ewq0L1GhqtHW/tHriNOpL9
 EkPCAQ8pmjdbz16U7fKoNSWQLaTWct2V9ckpEJmYfY35VLFPBOeB0bV1emCdDnIXBDuX
 hzauG9FnBkBq0M+ylyWe/QHrQJiznyK0OW3m5Wo2N9WvIKiOsaH4AmjwXkcqpsL3hY6c
 0OQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781456226; x=1782061026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KmOBCXRMxHUy9xFI3toxiU28u5v8kqCzk7z0VpaRiLk=;
 b=pSMUVizfjPsUNKljxQ4G4wNZ6hFhs8xfCEoiKeYGxfRkQjmau5MJjH/Ws9tkjJzjbf
 6QOwWVakYvPWUY8i4uuM2tXOlWW1nrDhKcUAT/nRdvtyuiDlxq6niMF+09PSBmG2APxi
 qvT2Dh6prQ0TR8LP/fnUrNPAbe3Ks2gw8b2aemvsc0/QTDggT5cLHIxMMfJDv2ZbhZDD
 qR/i9gAXmohlXJ/p2On95o3AxnVQrU39s8QnWAlbHIN3YD83d596cBHZNyergSdAHFtj
 6AhHyVDc2cdkXDoOj7nxM5YHiXca81KlqdG26tH/IAGw68s7NHCxSxpfAzGFXgXcvQbr
 //hQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9CiRfLZzBygYxpEdP0V+B9Zt+eAlO4PvSE3mUwjnzwykeVkb/tJWvxoA+ERedmR902SsR7dtL7GR2feA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxnGmp3N4uULMbTffVJHSu6dnGnfq6pFTXE56v1mDJuNh+8iGBG
 Oma8kBCaCc5wt+WS41buqVJZf0Zo+C9pHQMEtMdk+0K10rqsyNbHimBA
X-Gm-Gg: Acq92OEikgdosd4YsVoysOJgRxAKSK08i8znIszxfuwxoHKDNeNeytwiXMDKSxaqEBL
 c6nime+UFZ+r/pLDJ/QreiLjE3xQfYS9ezmCmEXcsOaEZ3xoYV4z73KU/mDCJGsAl3Dii+B4kLz
 JG+hDe2EKYLpdi/fYCSbR0NRc9Dv7MK5GYI5zXS3Gs6nyjlZV5YJzyui2dIq7YkJxneRTwtqooB
 R4nXWq5yljdqTwMre6BJoG6JhHZ8jZI6NhQXmyeMI9lbMBF0DdG3MgQD1PxgsrXC1sPVKznaE3F
 iHhiE+zU4OXbri/N5KGGUrmNOn9QghAbKxYOUC7MNzow+MISg9xhDRECBbsbNzPGC/MxAyD0/Xf
 AH3zjjnw4mjMriLOBsf/hmMcDUh3Z8yqG3QNAvl2PlODbOph9iB21dMnRwW6X0FmlfLvFOi4LSh
 nSCIqrZRhnWfEj/upqIP5UmTzjTxD2P9x4U9c3LoEwEJiKIfM/b4up
X-Received: by 2002:a17:903:238b:b0:2c1:77cd:fb0b with SMTP id
 d9443c01a7336-2c412f17bcfmr118511375ad.37.1781456226362; 
 Sun, 14 Jun 2026 09:57:06 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.57.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 14 Jun 2026 09:57:06 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Date: Sun, 14 Jun 2026 22:25:43 +0530
Message-ID: <20260614165630.3896-7-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614165630.3896-1-birenpandya@gmail.com>
References: <20260614165630.3896-1-birenpandya@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Jun 2026 06:14:24 +0000
Cc: linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biren Pandya <birenpandya@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 06/22] media: platform: stm32-csi: Add missing
	media_entity_cleanup()
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,m:mcoquelin.stm32@gmail.com,m:birenpandya@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61970683B11

Fixes: dcb0f4c16be5 ("media: stm32: csi: addition of the STM32 CSI driver")
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index fd2b6dfbd44c..0847fd347d56 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -1060,6 +1060,7 @@ static int stm32_csi_probe(struct platform_device *pdev)
 
 err_cleanup:
 	v4l2_async_nf_cleanup(&csidev->notifier);
+	media_entity_cleanup(&csidev->sd.entity);
 	return ret;
 }
 
@@ -1068,6 +1069,7 @@ static void stm32_csi_remove(struct platform_device *pdev)
 	struct stm32_csi_dev *csidev = platform_get_drvdata(pdev);
 
 	v4l2_async_unregister_subdev(&csidev->sd);
+	media_entity_cleanup(&csidev->sd.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
