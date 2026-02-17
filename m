Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GtrM/p1lWlCRwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Feb 2026 09:19:06 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D323153F1E
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Feb 2026 09:19:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9E6CC87EC6;
	Wed, 18 Feb 2026 08:19:05 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76320C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 16:00:32 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-65a40f3f048so6894216a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 08:00:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771344032; cv=none;
 d=google.com; s=arc-20240605;
 b=NjyxqjTMC5LNLzi7XgCe+U+H73XdKtV5u07wozeAKkVoDI/6Ja4mOW72NEFHKt5JKk
 kwhuuEST1pU82njEWCi83oBovxG5MUd3x84UdYAfHS804JBf3bf5MEAm94j4ogwD68JC
 3+8jRTYOyJkPmmgeDMzEMb1RvoPjs+DZH72Q3eZsRyrSTFzR9qcPPwGCZJ5ld6dod/Hg
 t5ApgLFgu9G+gMoaQhALkSdjiq05srZnX15rdse+QxaqX9rz6IavzBGu1Bd4zHza8z9e
 0SGGDjZOICdMf/649JLssw/5kJGlLQZ8CmioLXt/ffL50ohmnqYH+B+RM0OqlRGPYgQ0
 ogwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:dkim-signature;
 bh=lBO6AhQqWag/0+NNJRZQvsAXIIMwJp6QA15wbRYbOcE=;
 fh=afFM5ENm9X0MadUNh7Urpii9aoAkyvN5SoHGOVYx6L8=;
 b=RSoTht0FMTvMo71dPTFAL1YEyFswDA/RZrbYKEMIUhbW7wllHGEkBqNN/mLzn1rQPi
 MqkrLNcz6hRCsMhkxwFCMwXNlqBE7zmr7vlym6S6sxjJeVuqPoOubAqALNQTuc2QqxWO
 5ItK6g8gQ42Uqww8coqyanEfcfss7sCIzoma7ZbCGuuXzDKLiFcp2j6X4nFPrTvip3uW
 oz8P1sGp0riB2htDik/YMcwybsZDW92sOW/M9OdsW/fdFxioMGf7m9f+t3rnPKYyGBT6
 EG39Q0ZKcC2Z5PoDg+3M8zPqZIjTUIRaC+qZTLnKiEWTAj67ZgeVyhXahX+lSIKn7Tj2
 LYhA==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771344032; x=1771948832;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=lBO6AhQqWag/0+NNJRZQvsAXIIMwJp6QA15wbRYbOcE=;
 b=k06e8XlifL4y7pldCq1DYFavRryt3/VFlPRRTkKTUUAXIEgHU97zKIyKQqfXGx1v83
 QedtOVLkwPS8oDnAqzBH8E8Zcw5Y7oLTeBmrtgip5SSjTtJyM8wzB8crJqezkwtk+QAq
 a+ri7k/QwbgXgK4dqgvyMRl07cQla3cnPOaaXjEwadAN9uQFYsL45lRwWux3zG4/CeYD
 vuITqQHcBs1oZ7XBosg8RZUP1jxDZj8mKUg4bwYjpNtK9jEkll987tEWUw2viEJG7i/p
 fW2b00RNF8KwErkdsD3xAuwQfjFeHUjWFqlR/mtiVDRCxzbPW1cerpNO1xQQDwPXzwSU
 dH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771344032; x=1771948832;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lBO6AhQqWag/0+NNJRZQvsAXIIMwJp6QA15wbRYbOcE=;
 b=Z8MlRDsUsMCHUmDUzIxCPsi8e842G3EDCY8zjZDsz9K1TabLSeXkjXCCgYzgyrvUeo
 99i983UIVL5OzgqlIreIFS378gp9B1PGwBnzo7X0UqrzDITaAzVKeO3hsWs2TdKJgEQd
 FBiazfxj3OChGRlMlCheRFmi3Ri+qE8Xqb8VdvixU5hARLYQm264m3d8/dkRENBheWKK
 laQBgCqHT1GXhVokWQ5TUuAf6QhhLdxEeyqkIObCQ7oik4MXlYFQ/7BaPnAumZ9ubICQ
 uNr4wrniOXjYH9N8GiO6CmBd1LZ5y7ztz4QBHVunWI1vhJxZDYtkHn492hNmsiOBguja
 P6lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaVAE3RJBTy6M+tKd3cb2dCmq3agH+4KA/HYHOKQauGelLOuuXIaodPKiZ+dJVFYAuixNbuqJZ+aSlgw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyVvoJ+F5KChk6JudIaOCb3fZdgJh/y8j3hO5eo6jpr1Gquj2Z2
 3rRFoNMncPMnHFvnXgUkex06UdJG/aKH99vJfir/PIU48lS1g7DeSgbt7SGc7ih2Up9BhILUTHH
 IOljWVmaT6DjLJY99ksoSJpLKIJx4v4s=
X-Gm-Gg: AZuq6aIY8WgvUbE8dVjFAOAWUTIIIFAQ7ybCoElFFNaKmk1xydg6+wz6GwLwDTNskM7
 rQA7YRwQDmmQUogOULZZ8NcLPgueW9AV2RU8aaU2y+M4I8MWHgUzdPUyVtal40dippHCn3ArXgi
 HAljmbZKnnjLLDzcA+I2G5r1s9P7jhk4mfszYbvHTwlzWGNIAElsN4K/pawWxDpvnxpVGWLoQIf
 NB4ng9HdOoXWZWiFiHKHFFA0Njb8NATWR4znbMqHGdOqQs3bPfIj3FTW8uD2/TS+QqIIwdJipBQ
 6LxQBw==
X-Received: by 2002:a05:6402:1ece:b0:659:329a:bc12 with SMTP id
 4fb4d7f45d1cf-65bb13b7f0amr6896476a12.29.1771344031210; Tue, 17 Feb 2026
 08:00:31 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Feb 2026 10:00:29 -0600
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Feb 2026 10:00:29 -0600
MIME-Version: 1.0
In-Reply-To: <20260130022705.1059214-1-inochiama@gmail.com>
References: <20260130022705.1059214-1-inochiama@gmail.com>
From: Emil Renner Berthing <emil.renner.berthing@gmail.com>
User-Agent: alot/0.0.0
Date: Tue, 17 Feb 2026 10:00:29 -0600
X-Gm-Features: AaiRm52I-Ps0aB0W3gGP80VOXo7IKX3SoIAUz1UAML5FnQLUef3qoiKkhjg5t58
Message-ID: <CANBLGczi6o4NwDF0fge0_RZ+TVX2dQ=vYD2PYMSupb5xSnabZQ@mail.gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Inochi Amaoto <inochiama@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>,
 Paul Walmsley <pjw@kernel.org>, Quentin Schulz <quentin.schulz@cherry.de>,
 Richard Cochran <richardcochran@gmail.com>, 
 Rob Herring <robh@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <ziyao@disroot.org>, 
 Yixun Lan <dlan@gentoo.org>, Zhi Li <lizhi2@eswincomputing.com>
X-Mailman-Approved-At: Wed, 18 Feb 2026 08:19:04 +0000
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 0/3] riscv: spacemit: Add
	ethernet support for K3
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:alexandre.torgue@foss.st.com,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:wens@kernel.org,m:conor+dt@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:peppe.cavallaro@st.com,m:inochiama@gmail.com,m:kuba@kernel.org,m:joabreu@synopsys.com,m:krzk+dt@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:maxime.chevallier@bootlin.com,m:mcoquelin.stm32@gmail.com,m:palmer@dabbelt.com,m:pabeni@redhat.com,m:pjw@kernel.org,m:quentin.schulz@cherry.de,m:richardcochran@gmail.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:siyanteng@cqsoftware.com.cn,m:ziyao@disroot.org,m:dlan@gentoo.org,m:lizhi2@eswincomputing.com,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:looong.bin@gmail.com,m:linux-riscv@lists.infradead.org,m:spacemit@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.or
 g.uk,m:andrew@lunn.ch,m:conor@kernel.org,m:krzk@kernel.org,m:mcoquelinstm32@gmail.com,m:looongbin@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[armlinux.org.uk,eecs.berkeley.edu,ghiti.fr,foss.st.com,lunn.ch,altera.com,kernel.org,davemloft.net,google.com,st.com,gmail.com,synopsys.com,bp.renesas.com,bootlin.com,dabbelt.com,redhat.com,cherry.de,eswincomputing.com,cqsoftware.com.cn,disroot.org,gentoo.org];
	FORGED_SENDER(0.00)[emilrennerberthing@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[37];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.infradead.org,lists.linux.dev,st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[emilrennerberthing@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6D323153F1E
X-Rspamd-Action: no action

Quoting Inochi Amaoto (2026-01-30 03:27:01)
> Add initial support for ethernet controller of the Spacemit K3 SoC.
> This ethernet controller is almost a standard Synopsys DesignWare
> MAC (version 5.40a). This controller require a syscon device to
> configure some basic features, like interface type and internal delay.

Hi Inochi,

Do you have a tree that includes the dt entries?
Otherwise how are we going to test this?

/Emil
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
