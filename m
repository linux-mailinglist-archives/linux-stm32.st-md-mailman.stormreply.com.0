Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOqGD9PIEGq0dgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 22 May 2026 23:21:23 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAAE5BA532
	for <lists+linux-stm32@lfdr.de>; Fri, 22 May 2026 23:21:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D44E8C87ECE;
	Fri, 22 May 2026 21:21:22 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB9AAC8F296
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2026 21:21:20 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4903cbfad68so15397635e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2026 14:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1779484880; x=1780089680;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=00ruy8kpQH+b21j+wCBZYocT5CVhNgJL2HRPgVpHHfE=;
 b=pjkeyf8JaN0ByRMoQ2Xr5v7pKalZHhk7yUwkzQfgSG8rMhMzYcgazITLol2DV9/MfC
 TBZGhNwa5ORKz8XTTQk1B1GXjvsqizXMdelpD7V+mk0NuJCUIZGSBYBiJhUR3nSMSV9T
 OCBs35i1qc+ndkJcWrdQ8+Qy7c/vDb7tMJkuAP33GZZKS9nIZ/gU8Y9ySX5ry7FTjFGc
 bkXs3LwyyxzMliAIxtOvqKgsNcHFlUekdO6NsSUyl5qy8ILz8aj41w0THRW4CRMkeUyX
 SyJlrCasw0EAepwUoYDTaFWrdiDx1aNhxcpMHSdjNpfd/ei8lL7o88DB6DkIGaRTyOol
 vS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779484880; x=1780089680;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=00ruy8kpQH+b21j+wCBZYocT5CVhNgJL2HRPgVpHHfE=;
 b=FFJ8bGRhz8yi0Dew1sqmqlmvXBdvY8vYxE7Lhw0jM0wogikLHvQY/DQkcy0Le/Ol6K
 H9upizJIvI9wNfErSE1UmCVUOzD+KdvdjeshUk6w3lqDpxdam06yKHHfGHD3giXJHB5z
 NOHIIAiMMmywKhOU25pLDd4jDZITAwRbNBpNu1lFa8sjgjd1/JLMcnjB4FC6ddkVl60+
 PVmlbh6I1t3u1nXnvbiTnaSlHYJzcdn+b8QnZmZcuU2tTfmlQHjhX6lISUN0A/b1QZL1
 6Te3J9lP8KcZfI8MZWQoON9wvdFXw21yPIVm4v1mp3fkMrgstDFAZey9VkBUyBD9Xy7r
 LjsQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8aCpJlOBbgYsKRLVP3eu5fxCBo+2MZUD/YygkAdi3ABL85dbeExRBut5YQP5TeBiha8r+nx1bX4BVNjw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxgPMriALozVt7Pq6ZDyke6dZpu/eh0aeE0tK8CE5RTx9JBuJPv
 PYrtUL/B9MEKuyhhDhXaOTbjjzKJjDhDXqYUjD1HAelFDNNv/gn+A9/oTxhLNyNWD+I=
X-Gm-Gg: Acq92OEiLGPfU1/i6Ymrw9sEpplydnl9hDYBQXo6V1PvUz3L4JM1OQUlQo4kWVYXyD0
 PxOZ91krBCZrjIBhSyYhr0yYOH7BgqpIWCb74tKGccaE9AIS6/IkFcNkLGU+IA5OQaegIjTixuW
 +UKpAvMHQgrHJU5F9YW8sWYrerZXN87Ty/Uhcl7IG8sHhwCzYHU/COk8OVgIVpm0QBdL7/SyUUa
 Qx0DpQdf1Sripo0pjcSptQa9WPDmSyCJgE2L0qz7BtNd9UdTkBiC1Pmf0bmj77LJB13g/RRQ6gA
 GlQb8n56SpgITCez60MybuKiYXwYPtMS1JPBoms0MxFjvXF3MCLWAGlUpHKbeIMDL31wwKVrYen
 H059k4RyF7LFu1DuV1JRdRFblO+h5iybevFTYQlhTMXcIOdz8Ais2fDmR+RWtS3tv1SS0lXOLC4
 hdTff4/wwe6L5z5vlvbF6qQSd5dB/y5ik=
X-Received: by 2002:a05:600c:a402:b0:48f:e230:29f5 with SMTP id
 5b1f17b1804b1-490426b0c92mr54271465e9.16.1779484880243; 
 Fri, 22 May 2026 14:21:20 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 14:21:19 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:32 +0200
MIME-Version: 1.0
Message-Id: <20260522-wip-stmark2-dac-v3-4-16be0ad35a67@baylibre.com>
References: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
In-Reply-To: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 04/11] m68k: defconfig: update stmark2
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[baylibre.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
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
	NEURAL_HAM(-0.00)[-0.670];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 1DAAE5BA532
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
