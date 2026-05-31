Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPEsAw9THGqeMgkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 31 May 2026 17:26:07 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6BA616D28
	for <lists+linux-stm32@lfdr.de>; Sun, 31 May 2026 17:26:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E492C90082;
	Sun, 31 May 2026 15:26:06 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1DCBC90080
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 May 2026 15:26:02 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4903f7a90d1so81874065e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 May 2026 08:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1780241162; x=1780845962;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=00ruy8kpQH+b21j+wCBZYocT5CVhNgJL2HRPgVpHHfE=;
 b=F85ocqtuwlOxQ1Fwx0UMGXLRfun+d6KE/h9fya42foSbhU5dQdGrMI3ek9WNKFVswO
 l1v3HIWsjHS99ib+n1wUEYAKCdBJ9BtzEgbTOr4yx9hbAwW+jfXZg8Fdz1XSEkDzsozq
 vYXfL3EkYTny691tnWk7vL0X1bsaQ0OO1wyQZQOH55vWIX2KhoxhPhMzjBp77wVD9aHN
 wyQe/n6BqmF30pvfmZ4U/bPnEuk8NwObr4trnsBoD5OykROtiiwneGZBL2vmBykz0EzU
 n2SIg2ZkvJydwYYKf16sCnBQLlCv+IUawy+kfbr+Jw7KoaG6GwlWhFtgGB8jbxf/GD3c
 TuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780241162; x=1780845962;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=00ruy8kpQH+b21j+wCBZYocT5CVhNgJL2HRPgVpHHfE=;
 b=ggFZZIpal/wpLdFDsTRcwaeHfsvWo1i4BtleNLVHXLGHpGggB1JcHmWBk1VIcxBx/7
 caVCMy9/3QecIwUDtc/rMolUvTitoygJM0KdYsj52P2Na64pn+SugkaIi7rFkv+drYs5
 HocTPFjd4pOnlCRmC/yaDLzTB2bDcxabjCL62tkMIROHmOWdgne7Ja2sPEt0GTKgVAdt
 YGIDxXoF6x98EwlyX1d9dJPSBwb3OouFlRmEflCXjKQZYxNvbtwyDID1Imq/YVzpVTYf
 0pnlpM/n9goWYr8I8tlpPDwShMAFqGxWjwKssUPbKaswSN5AleCJkhtmHswnQgzKgyuj
 UmZQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8nJLY5sG0QLrodDhVRnjpggibvqmEKSL8kX8hS+AO8GtWjvzZkH8g114QPPuBQWeIRzqIyXJ2XoCEWtw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxSotSiMn5K/QbaloUdGaqvh1+jsA21UpNUqS9uZq6aVndoc7Wo
 N8PbM1Bv6rwcO95fkgAfQBxd6kc4II+Oz/150AKhbEacEoOi/zq3P271/E9r8/8Yye8=
X-Gm-Gg: Acq92OFR3eIyW8m2mfHkyE7Q10je9rRKv3aZHdQb3d7BFcTGn+m52ncuhpZ/Fgo1sTj
 SIV9prokYCHGViW9gc64Kb6xuW9LZ57dMu2h8Nlx930RMe1VjuFJlRNU54YdNISt818nt43Y5Nb
 YwkzWRBhbzRBvnCFgVtOy2jKmDxN4Dw8ZzuTQ3oDGsDujvD11vn+JHUtdgH/OVgftDRN4FI7QJO
 X6JDvo8ouVJT+hLVmyu6dvl8JVL6ZzIL/Ftt/nKIZB87De/MvE2lHMAf8UmyJ7oriRNFzF0hJMa
 LCdN18hlqqcnJMBh6ZoYNQ0w1Vp0Q7Vy0grBaVQxl+103ycZS8cJR0Ybd1qRMz1pNfQR06zFxbl
 nWMJ2mIPd3VhGOG77ZkrqVIaCdA0n4FjicxQR/dHAAmr/EEcCyoBQMpyT9dC5Br4dsjYW87/dai
 bRwtsD3yWKugLYBqGddm2TWcC+QxH8iV6/ayIY/3NO2A==
X-Received: by 2002:a05:600c:5395:b0:490:4b89:535d with SMTP id
 5b1f17b1804b1-490a2904b29mr165959705e9.1.1780241162528; 
 Sun, 31 May 2026 08:26:02 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2026 08:26:02 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Sun, 31 May 2026 17:25:57 +0200
MIME-Version: 1.0
Message-Id: <20260531-wip-stmark2-dac-v4-4-7e65ab4215dd@baylibre.com>
References: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
In-Reply-To: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
X-Mailer: b4 0.15.2
Cc: Angelo Dureghello <adureghello@baylibre.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Greg Ungerer <gerg@uclinux.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 04/11] m68k: defconfig: update stmark2
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
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[baylibre.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FREEMAIL_TO(0.00)[linux-m68k.org,fdwdc.com,arndb.de,gmail.com,foss.st.com,kernel.org,baylibre.com,analog.com];
	FORGED_SENDER(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:gerg@linux-m68k.org,m:geert@linux-m68k.org,m:sfking@fdwdc.com,m:arnd@arndb.de,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:adureghello@baylibre.com,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:gerg@uclinux.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
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
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.547];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,baylibre.com:mid,baylibre.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: DF6BA616D28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Angelo Dureghello <adureghello@baylibre.com>

Update stmark2 defconfig enabling MCF5441X DACs.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
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
