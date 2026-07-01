Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id svUMGn0hRWon7goAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Jul 2026 16:17:33 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB476EE9B4
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Jul 2026 16:17:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=baylibre.com header.s=google header.b="aRjU+/Bj";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=none
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 198A0C8F280;
	Wed,  1 Jul 2026 14:17:33 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09623C8F262
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Jul 2026 14:17:31 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4938d5f86f3so5123125e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Jul 2026 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1782915450; x=1783520250;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KoOn6a9eFPu3j3lxjvRT84RKODlbnmxk6NgG22+hUT4=;
 b=aRjU+/BjVc8gqBf2dh4AVLr0rprVd49ownHPexReKRSkU3knCtdFZ6d5tx+LON4zMu
 /DTuuUqJR4pkfhGjB1i9HW7by0shgyawvmhZ67YrZdUoQc4N7DEB75073tiyuhJmWWcU
 29DYEzRpUGqS2w843XweaxiIbVUb6NnZ+fUNs0n83rz+wosQKQyjAfQWNpi7B9rNreZ+
 wB5ESn48TrE5qJDU35iGvb4Lklz8EB1ueGWQJMzUUUqf0WeCWcO+AXUI9a6SpYkMgwYJ
 n/oElszG6qwK2QtH6eM6XJQWDSCpaPBhFLd2mJFNTM4suxkZKDV2kU7gsIWbul8p55tw
 0d/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782915450; x=1783520250;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KoOn6a9eFPu3j3lxjvRT84RKODlbnmxk6NgG22+hUT4=;
 b=RuFAJOqUKwIwCjENdU+U8QDUm+F4jcwRFCHtmr+H4K92sIo454cswH0wujgriaywen
 HE8nG2S2CHLJad/BBFixnB+hFCRRELTqWUMbGCuvuqqw94aI42sXmnBbg1gfR4EdNhbQ
 T/bQ94PpTbA22mvWcjg9CujYCQY+0Q3E0vq0zncxsBi0oeV8xp9Z9pGmLEeM+rIGmTP3
 GCK/3UQvXHHq+3QsAQe7nK6lg0RFOfmB8df2LMVMfspR/x1L/hN8SvO6PjxQm1bwRnzN
 UeisQzdiqci9jd2Uiw3hb+cEBU60Ir7MYAPP8KWJWMsgbzZFO6V+kU0F2ifwNjxV2r6p
 hUOA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/eHVGoHIUPKJRXnFbDd7LG23dxh3D1c5whKzS6CCgNu3NE5G5e6aqEo7bioLoii61IEUax+dZt6MM0Jg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyM7lResr0i3XmGuMS1IDFrMbK+ZZ8OYOeZYaGOBmozX4LodU7v
 sM8z1AfRl85llD4X+YzLawR9G3hk/J7p2Lc9Ssfd1eCfmW/ohbMT0fGkpL9Uo45P6/Q=
X-Gm-Gg: AfdE7cn073tQO9+nfzYF+9p58AigZirIv3CkkY2g4ETkAzP4baGjZiKsecXXfjouwW2
 JUnG4mA5/Bl6TNdOqnd/5TEyqeXuql4+p4/MewhsZB4+gFvERwNSEu2qzuO0AybG8lXEl6CyX42
 7B3MXp7oitCu9KiCNyObp7wkq/FWGPSayfh6qdjVXU5KWr1O2FFc+IWbtflvMh8uSNwJGh8gIEO
 b31VliUJWA3893saCLZA1f7CN4xh5GRIoCUNGGbrNVr2neYt5U2L5JCi2ZCzJyO77Stf9sPCHu2
 wJQOsSTqgi7BOyL4gAsOSiOU/Effm5HwLWIneuptbrkL/EBL20ddxUlpc4PFl8FSSDNePpKJdSv
 +p3aTWTboIQH1Wstzi7I3QSGa9oDvFDRc/X6ZGp5tbBDrfaiqcbKmTIABV8V/EF+XapIFVxhbAA
 IRO7qftVSYx+oTX6He1vDiNcR+jOMx0vGIbP6CoZaQZKxDyaQHNm6N
X-Received: by 2002:a05:600c:4f83:b0:493:c064:316f with SMTP id
 5b1f17b1804b1-493c230bb07mr25432565e9.3.1782915450355; 
 Wed, 01 Jul 2026 07:17:30 -0700 (PDT)
Received: from [192.168.0.2] (host93-7-32-195.dimensionesrl.eu. [195.32.7.93])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493be81df2asm152552155e9.12.2026.07.01.07.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2026 07:17:29 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 01 Jul 2026 16:17:24 +0200
MIME-Version: 1.0
Message-Id: <20260701-wip-stmark2-dac-v7-2-ff8fdcc8010a@baylibre.com>
References: <20260701-wip-stmark2-dac-v7-0-ff8fdcc8010a@baylibre.com>
In-Reply-To: <20260701-wip-stmark2-dac-v7-0-ff8fdcc8010a@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v7 2/2] m68k: defconfig: update stmark2
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,baylibre.com:mid,baylibre.com:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FB476EE9B4

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
