Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBSGLgdBBGokGQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 11:14:47 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CB253069A
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 11:14:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C815C8F297;
	Wed, 13 May 2026 09:14:47 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BE01C8F292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 09:14:46 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-448528f4e69so3820049f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 02:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778663686; x=1779268486;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=;
 b=L6uS5WUveU2pZGnrUk+e1EqQuCiPj2wa32jSbfwnAnNNSztg/lLf9DI0Vi7QQpeY5v
 Pcn9p4vfeBg+S441h7lBpEH3RUSkAMZVvEwkPDCmsnzmH4fvbPjhap93OVEUaQEbfblE
 5uLjKSKM7+ylCasdwuLqyTj3wKjacWDz/kLQpG/JajHBGllZf92dVTmxXDcdlUfPBpsy
 /5u6C9TJ2jIbTLgT+H7Hkam9znzGmq3rePORWFvOEjUWWpjqQ7DPM9Ume818uSCTYdN1
 wm5IX0i7/nA0j/SDd/kqQQ6CIO/tAmAKvAHdG32Jwx8bpK4oPhsg+DH2JrU0Ok4xNfPf
 CNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778663686; x=1779268486;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=;
 b=VS1Q0qnOLGmFdB1rsKPH10n0OJuX7kiMb7us0a6612Ti6uyg2TenjXgk1nz7IEK2TE
 8txp2oySFbED8Lf/HG2NzUtu66gtIeKwFOQOpFkskhk6Y2a0jKsS3xBqwScKOmo0iLju
 hsNBAMFLiamPYKMmZ0J8dPohwtxmsXuSEoL8ID8XxnA/c0GkG5NJkMxCD1OrU579HEBx
 P4isbZapUgxW5I4wrmauo1YliQ7S2xLTgg5FZ5N3gXk7ypXYI2bs023UsZw6uZQbMLoZ
 YJ5BGz+mMniZdC90dft3UZAbdw4Ap8Ij+cm5L1El+rs36mqusXzeo9tiHRyunItxwNAl
 jc1w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/uC/KuHPxLIpvMWK/WYMFBBCesEdzKzOjEGGQ8CUgFJqdoIKFGT4StXEur4DIY2aUy2b6WIPjHHopvDQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyD24csQTUvn/6/Al7O0O/2V5ITIkrbF0Mox1qElYRcSTQ2y1d4
 RqqyRznq2CzbSC367SxNxiCd0hxxrTEPtrFia/LOTqoLbA+cDqzVfwyysGKVYyzozKk=
X-Gm-Gg: Acq92OFSLawyWTxKW0Xc1XdKveV3Txg54m5qKv3zO2T+COYXb/13EcgdTBur6TP5PYi
 EN0xIET8+tsVfu2e4RhfYEFX8wAntWFE49+LKxWacss93cky30FKL5Peyx7XxwCYITFqaine2ib
 s4zbBiO8GI2sXnWkdSKi7klY676jHmztSljefLl4c3bgrSKNfXtF+K57hpOVlfkPeYPh8hQPIWb
 BmSuPokSt0VAGZn4DH/2IWoAzysABd79j5g6wND0tzJrVM/wVu65aqkl2e9g27/uKCFAS9zAcFn
 JTcuXqEmxvXHWH304cW2SPeosjgefPCmpbT1GuBWTAdentYS0SsqGoOrY8sa6HshdJkLrIxeg/a
 qehyKx7/IVRkDTXRcb+5qP/yXQeNiaTzZdx7LvHuzzxiprHUS0+ITuKqn7tCicJRtK5GIG4KYgi
 VfQ4uCA3+A4nuIR5uS5Tpex9/JUGqWEMo=
X-Received: by 2002:a05:6000:26c2:b0:43c:fdd:ea96 with SMTP id
 ffacd0b85a97d-45c59cd1579mr3756642f8f.26.1778663685719; 
 Wed, 13 May 2026 02:14:45 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548e6a66bfsm34590821f8f.4.2026.05.13.02.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 02:14:45 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 13 May 2026 11:14:29 +0200
MIME-Version: 1.0
Message-Id: <20260513-wip-stmark2-dac-v2-5-fcdae50cf51a@baylibre.com>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
In-Reply-To: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v2 05/11] m68k: add DAC modules base addresses
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
X-Rspamd-Queue-Id: A9CB253069A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[baylibre-com.20251104.gappssmtp.com:s=20251104];
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
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:-];
	NEURAL_HAM(-0.00)[-0.885];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,baylibre.com:mid,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url]
X-Rspamd-Action: no action

From: Angelo Dureghello <adureghello@baylibre.com>

Add DAC controller 0 and 1 base addresses.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/include/asm/m5441xsim.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
index f48cf63bd782..f5acc962bb95 100644
--- a/arch/m68k/include/asm/m5441xsim.h
+++ b/arch/m68k/include/asm/m5441xsim.h
@@ -191,6 +191,11 @@
 #define MCFEPORT_EPPAR		0xfc090000
 #define MCFEPORT_EPIER		0xfc090003
 #define MCFEPORT_EPFR		0xfc090006
+/*
+ * DAC Modules.
+ */
+#define MCFDAC_BASE0		0xfc098000
+#define MCFDAC_BASE1		0xfc09c000
 /*
  *  RTC Module.
  */

-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
