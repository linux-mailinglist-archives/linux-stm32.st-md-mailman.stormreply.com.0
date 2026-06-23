Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N8AhGvc5Omo44QcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jun 2026 09:47:03 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CAC6B4F38
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jun 2026 09:47:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=qDBp34CK;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F29AC8F263;
	Tue, 23 Jun 2026 07:47:02 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42729C5A4C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jun 2026 07:47:00 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-8456005a6c4so1949704b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jun 2026 00:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782200819; x=1782805619;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WiYA62dHorpFymdfXssg5HAuL1K3q/QdPM1UUVatA4k=;
 b=qDBp34CKEWuLFgJhpAviFj+6I7a5A7bWVmd6nGDoTt/Eyum88LAAi8PVCDonV9+hKv
 jNNoCVeqDtCYeVAWK1ZGHv0K5P1US2h5TKIT9vCzkSwwtHhS4WPloMgl0ay3SWSc9lEg
 5Em2M8FB1VWgrmhYd4w5t1KJY8wswqn1yIuf0q0EWUuXXdxCTNSXRHPyF1wS/dTeSFFD
 gYUG/vMuPRBZzTI9yN9OrEcRoGDeuloRnF7yt/WRwWSjZiU/LeSzVqoomf7QnCgjiwrd
 Vc/YaPQIvAPtgajOVJcugu+1tf4h477XG6J1nMpwArgd4iG9Z1n0PtPyrQnQANyYqQEi
 ++uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782200819; x=1782805619;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WiYA62dHorpFymdfXssg5HAuL1K3q/QdPM1UUVatA4k=;
 b=tZIBdUzPTgp2kL33znp3jJnSZN9+wMUO3d+MxItNSamJFpSgpOhBHcam6Ud1JipuD9
 0TbXb51y8cQNVTjnWXX/pyZx9Y5ZRPWDSUUfjijz/eSVr+CJPxiOVSRcqT7aafOXrYHa
 SutkMCQow2KHfpAwJZ2Gj1tGsvjRVWvZGi5JjrV9Qet0ZHR6hvFpJhymix5xfYCWeHqf
 UJymp5UMtpyg1LgA2L1SfMCRzrjvRsGoxSnbUYKlZ3qcC0pK8bb31EtmBF4otjFGfLfx
 IO50mUJZODdhl9dE9Vr0WFOLJo1kc43PiLpO4KGO354v9FDD6zwvNnTWJIpiub80iY+l
 zKJw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9qUPpH96ZCtmYauKxWr+v8sRKjo1J9VtFDKOY2YaAwNCeKWvKq0dJK4E1OJa+/Iw1GE6asD05dezfuGA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YynoxQ22Fif7KfCTwfjdsO5Pzf9qXRsAjmtjPav3EGREOVar40n
 kolkI7cjXaRljxpqqghp62Pw4rxRMkc8oJr0eVoMLJUTJ+I7KsfdXBnI
X-Gm-Gg: AfdE7cmykC8Ps1Pafo9lXiumUQTwiLzh0U8FR8tpBg35TkFSVSj8qXL/hNuMJtfDLUz
 Ql3JtFhep4TuwNCiYdvUA9ZjRc4Y6Rpy9/Y9iIbhl2n55nzTe13N7VZ35w7+ZOrLM9L+Bya5k6C
 SaGg7ElFgPSj1kAvaEwQffsAufqBm2poA0nLChfstG9BisziacKnCjW/6aGJ6KQ6YRENF8zrZkv
 Yk8EzRpC4jXE4G7gaW1fGS8wKyUihnwgfKxG+2WUVoFOQTPBxpRLaTMwpqEkdwWsvCnCxHiepxv
 ZbxdBmhzdsbo1c6uTcoaLtg3PeLOdC3ZaYP6df8tNX+SnFzEq3tu6hXOSu4jvOU4h+Oq6rlf0Pt
 lkqhhzGYyhDoPz7oQYx6f0fK4Z9SD2qi313QqTWbMU1D70GQV0zpDkrmMVkUWjwiFobD5pj4GAz
 Ql9lINIe2WTw4ylVV1Mhx9ug==
X-Received: by 2002:a05:6a00:3d09:b0:842:5711:9a2f with SMTP id
 d2e1a72fcca58-845508a0edamr18772015b3a.36.1782200818608; 
 Tue, 23 Jun 2026 00:46:58 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84564ed9516sm9765519b3a.57.2026.06.23.00.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 00:46:58 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Yixun Lan <dlan@kernel.org>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Date: Tue, 23 Jun 2026 15:46:33 +0800
Message-ID: <20260623074637.503864-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Cc: Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v2 0/2] net: stmmac: dwmac-spacemit: Fix
	wrong macro definition
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:inochiama@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:dlan@kernel.org,m:rmk+kernel@armlinux.org.uk,m:dlan@gentoo.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:looong.bin@gmail.com,m:linux-riscv@lists.infradead.org,m:spacemit@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,m:looongbin@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,foss.st.com,armlinux.org.uk];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gentoo.org,vger.kernel.org,gmail.com,lists.infradead.org,lists.linux.dev,st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E6CAC6B4F38

Fix Wrong macro definition of the Spacemit K3.

Changed from v1:
- https://lore.kernel.org/netdev/20260618064143.1102179-1-inochiama@gmail.com
1. Separate the patch into two patches
2. Use the right macro name for the LPI interrupt.

Inochi Amaoto (2):
  net: stmmac: dwmac-spacemit: Fix wrong phy interface definition
  net: stmmac: dwmac-spacemit: Fix wrong irq definition

 .../net/ethernet/stmicro/stmmac/dwmac-spacemit.c    | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

--
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
