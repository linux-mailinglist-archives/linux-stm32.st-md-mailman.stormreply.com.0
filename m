Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R6ReNVhdNGpAWAYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jun 2026 23:04:24 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B786A6A2B68
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jun 2026 23:04:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=baylibre.com header.s=google header.b=Egx9nEyZ;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=none
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CA16C9AE31;
	Thu, 18 Jun 2026 21:04:24 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41ADBC9AE48
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2026 21:04:23 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5aa61503fdaso2497587e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2026 14:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1781816662; x=1782421462;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KoOn6a9eFPu3j3lxjvRT84RKODlbnmxk6NgG22+hUT4=;
 b=Egx9nEyZaMUeu2bnmfvuxGDTEnc1mix6LiFX2TVhNqV4dwJgTblHwiPj5IeL314oYA
 Md84tF/JEeB8TPwHmg7mf20fVBKndVhMOGXGU8xRHBcE04QZNHV/pvM2aOR9xZQ2d7yc
 m+XMsUMMH1Zo/JPeuAk6lpsFeDo+bcmnOTYDHGg5AuH1k5Ys/sKHkNIdCMevhzCxzq3p
 RJIQzrBcbN3379LE9qoULXsNHV6CnzaRnv54nso7sCDjLTj+D3nsJ0DId3VIy+sxGL41
 11YA3Le5Qq7t5X5tbZQ+hoYE38/08B182QuxN5SwJcZ6k2MT6DkNAYh/W9XuE2v/IgyH
 fULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781816662; x=1782421462;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KoOn6a9eFPu3j3lxjvRT84RKODlbnmxk6NgG22+hUT4=;
 b=XThRwEBE71IGnv/FB02wa+AJkXZpV6RQWztgBFdUUCWkyf6CwM2puvwuNOy7lmxjoG
 s2/MGNotBDVuHPhEumDaz+H3nqHX7Sa0JndJ6xbkowFXtySqu824L+tu5eqUzobtspf4
 37nFSKgZHRDYbukpzA7GZfMNLG+1W6zQWii69ogOgWiQQtt3ajxbE2u118MiSb//FPdF
 VuJVLQ7p+NE3Dr4/IQapqtNXu+4l0Dm2tM7+EWMGZIkNY2OvyH7LPXbRmTsnoSQxCRou
 GMAhTaJK+12lc3BWK5II9dnZSAljRSr6X+scFRSDioq8RefuQ73CUsl7Qfapfh0D8aRA
 2JsA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9POcqEqOAfk3PbPBUR1iuyGRNdrUqdQXKipHlywZ91uvKp9KxKBmnbvksJaLIuuH9unrtnrv2ZsEiVUg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywk9yAvM+sMoMZRX1WoAXNwnt4NdkeXChseHE5Dz4wC1H7Dn04J
 GUnq5Ig0xQubPjdyXSSyYk/lBtQDahZ7P38yJu0JSoj/gPmft2QFUopEB8XSkrfuA/0=
X-Gm-Gg: AfdE7cl89ay8sxAVuY0Pp/SYQPIHOdQ0fIa++MAOaBMyWRrZtenICrjAcflsY83OGNx
 PbPJuIwwXakG3Nrul5Hu/de17SpwCa/82wOo5LX9NPrz7+pkar6cxAf5AcVsPPXnHOj/O+Acf7+
 gbr+crZXrq1IwhfmSYIk8HU3ut5V1uXiyYHOvwYaMTVSQbpnzMLesHxbetfYEvVopq2XS5HnF6k
 niuX1wgrxgCpEyKSZX6vnF9c8o/IUVJXGnP6HXQ10l0zCgfB0oagmvnqEDgtUPLtvD6mBnPO9sP
 xQMA6j4NkKfA+o552BZ/YO5IXq4Pzlp9aZzJ7E0fee3zUMBLuOByfNYOAWpPkslVAFlqsAe2NiC
 9DQCCZ6zrM8HMuLvp4M4gNXvkwejnb+ixfdivPzmFXe64Mh20UQrzDo1/7VEOMiAV+fbPeoqFba
 6rdVhd/yIVlbsl0kA3uY24
X-Received: by 2002:a05:6512:2387:b0:5aa:684d:3c7c with SMTP id
 2adb3069b0e04-5ad571f3eb6mr148655e87.5.1781816662483; 
 Thu, 18 Jun 2026 14:04:22 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ad57493145sm108586e87.69.2026.06.18.14.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 14:04:21 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Thu, 18 Jun 2026 23:04:16 +0200
MIME-Version: 1.0
Message-Id: <20260618-wip-stmark2-dac-v6-2-48761dbb96d7@baylibre.com>
References: <20260618-wip-stmark2-dac-v6-0-48761dbb96d7@baylibre.com>
In-Reply-To: <20260618-wip-stmark2-dac-v6-0-48761dbb96d7@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15.2
Cc: Angelo Dureghello <adureghello@baylibre.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 2/2] m68k: defconfig: update stmark2
	defconfig
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
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[baylibre.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:geert@linux-m68k.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:adureghello@baylibre.com,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,linux-m68k.org,gmail.com,foss.st.com];
	FORGED_SENDER(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,baylibre.com:email,baylibre.com:mid,baylibre.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B786A6A2B68

From: Angelo Dureghello <adureghello@baylibre.com>

Update stmark2 defconfig enabling MCF5441X DACs.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes for v5:
- move this patch after new Kconfig symbols are added
---
 arch/m68k/configs/stmark2_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
index b3fb95f73a95..3941113bc60b 100644
--- a/arch/m68k/configs/stmark2_defconfig
+++ b/arch/m68k/configs/stmark2_defconfig
@@ -76,6 +76,8 @@ CONFIG_DMADEVICES=y
 CONFIG_MCF_EDMA=y
 # CONFIG_VIRTIO_MENU is not set
 # CONFIG_VHOST_MENU is not set
+CONFIG_IIO=y
+CONFIG_MCF54415_DAC=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT2_FS_POSIX_ACL=y

-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
