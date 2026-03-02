Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKq3NPGLpWmoDgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 02 Mar 2026 14:09:05 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DED1D97F2
	for <lists+linux-stm32@lfdr.de>; Mon, 02 Mar 2026 14:09:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C92F0C3F944;
	Mon,  2 Mar 2026 13:09:04 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1611BC35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Mar 2026 13:09:02 +0000 (UTC)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A013240005
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Mar 2026 13:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1772456942;
 bh=/ECnSn+s6d8RzhavbIFJQEnGNDdcB3vQZ0KecCsizik=;
 h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=I49+4W+Ab2x+4ZdPUFs9STW9xcFgMw8YgZgl8zxAIbTWXOdvF0wfhvEZ/MxTdIzRg
 K/md4a3aLpI/F9LYncSvlnHi2BUXprfB7g2B4+NbcQK8AWmDL7Wv1MdhZBDzx5+Bhd
 KLn9tfiIg9BBHsWkqpIkQPGArAnE+sJRhA7/MhwMnbVPOpAuz9bBnl0AZcx0byDrRR
 Nkfr6V5usv4p7KzItQvE1hKGHeu87zIW7tZG5rzvmYOvGZT7T1Icyz4m0fdexBS8wQ
 /SEEB7Ppk42UUx0UxfgGZY+PVmP/35dkFuEa3QJmRuytNXSBArv74HQhYqHs+L/fdI
 ZuIhidBmppOcMpK4cQvxqzRxtTUWgeHTe+RJLeyDw2XXlLLJEMTwBuXIlvEKhhSI7X
 ifjtKO0v5ovCTkUKf/i5rx+umDz6aY4ytU4e0Rq2SYu4VUWC3/4RuZdRO+mDWRmza0
 +OF9Rc7TwR9utGrIDSJSCG5Rf9bTOI1dv6BQmUxTgnvRw/radfJeLdM7nBEAlCApV5
 YP9WYPUUAzRulEE0lrTOpDpZdV40JJSLgXrcIuNBhRO2mUFda1uUEGmiZP8etWrZ0u
 Msp5OX0wCrHsRTPMe5vgC+UcvrfcPPpsA6pHGD4SzLygD1ja4k43i7G1j5HO07IOMR
 jBNQpyPH0gNcGbH1I9v3M6Ac=
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-b935cf0a2e2so514790466b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Mar 2026 05:09:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772456942; cv=none;
 d=google.com; s=arc-20240605;
 b=Hzhc4mnTB0p7neLWTwt/r+osjZ3RSeANdxjCYTtpwuIh/z0qe7JfLocThumaxg9R5S
 Xqwct8iQ270hFC/0lUbwREnr5UtvIf8Gj2deZWOi0/BNvcD4W0jbF0VeUkOqR48vw/5S
 sMClfBphetzTGjXpcks1wYSj8NqBwqKZzYCPoi6gyUJATQ7GnSUTAyiJxUMOTra/MnbO
 wDvYi0/haTjrLuU5B0aBc8Th7gLrFEGbgU2K8nkqhJNeTpLjleieM5Vp1nBClk0+shOM
 BeR/+P0px2vCMnCoWzVXwjC/nGJ2Vlx1T/SWol+TgZZnjpqHe+PWrqSPCpi0KspfUB2w
 Mx9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version;
 bh=/ECnSn+s6d8RzhavbIFJQEnGNDdcB3vQZ0KecCsizik=;
 fh=pOVF58bowAOXupAxLtWWwx1qoYYTulajXjjog5nxCFM=;
 b=fEEXgQP6TjQ0O5Xh4lh0ecIq8u+9nwic78x/k5JAJrNh2jM+xHpA0ee5JZR0DQsqEG
 NToA1A9Lvx0/tWotpKCOqQ2eaLH51rU46IQyksL0q5Vn2q878BjHswGbSUQThIawoMx4
 ZFsA2czP1ff8ZARL8Y1relKR0Zoz2CZa5A0PQgr07iF8AhEvwCkknL5q3yLYY5wYX4eI
 bWK08+IlVz5BXcHpEmy4UvQZwFwUKm74Z5vTkuN4eqjqpurVtRDvaQhJU2ZftQgqLLWl
 N3UjUPcbsjl6Vr4HIokNW4gwCjK9FNX6hQKNihS3iev9QZgmwba5J9vCZlB+vJ/jBy2S
 s3TQ==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772456942; x=1773061742;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ECnSn+s6d8RzhavbIFJQEnGNDdcB3vQZ0KecCsizik=;
 b=n6K2jlHePqFB42B2NAKtGkjlTyrLKZl2CSjirxzzcOWYcrwO7SW8Hg+8c1Rm2G5zII
 WNXJ9DgycEyYvcFXiFCa/SlbD56yjJ9mucwLduuBistTDwP3QYTzYXfpGwUadhWO0s+P
 +4yrQ24xL5hW5BBBPGEoHZPcNus5opFv6eJj1ipEw5HOpGaAMK8+ANDN0RKDvbq7FBl6
 ZoER3Dv5gSLYGVEqY9h5DyqfE3WHX4tWIS6GAMJJ+CeFh0qjjCPH8Bnf659TVPJZem05
 htitaPwWCJAa14sHrvx4PYGm1bEZ3abgECBCid0Uoy+15mnTVpxN/uM3De5nTJn91Jwp
 cKzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+WG1j8OdhiVfKTCaSCkxLMpAR+Xf4jyjeFMFiYeXSYCvSHY4boAH3pKg+qHL+nvMN1QmTVI6sNOo5TA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx4XrrxBcTDiB90cMWQmmENpK4Lkmfx4J3ONrZdj3nO0IxJMq1w
 rfQ2KPv+2QULz11uToBFXWvjAh2w56/J1zwmOC9s+lA/WXkFgYKfN+3XOr7sGlh8SdlQBTK0zO+
 Ah5L4zIwZ0RRFJiMHy7ibi9KA3EFbIDl6pbMHEcU+Bs//bn7nfV0mIj2mg0KvYABid/PJiqG8xZ
 4MdRVOgK1sz59PDrG8IrRJkYuxHWP2YI9ftvHdkIUK9rcM04ZQswnPQAQ75K3+gfiQ9O5uL3Kg
X-Gm-Gg: ATEYQzx03glZT+uq+Mv7l1BVpTqH3zKCzq6WJ1n6UWNVLl/BW5LYJNFZhxRL/Z4A9xW
 qgD+z+ICGR5O674CHHOgMMl5s8UcbwjKhoclb2aExGXcMVAaAE1mEXJaNHqEcmxgZH+w+C3THNq
 vjHNbzox6muJy4CgkgyVeKpRIQkIuBbMcPklNA0Z88bDdxPmXPzLVBhSK/JVPdpFc0iPdScFxuj
 rN0
X-Received: by 2002:a17:906:9fc8:b0:b87:efa:8786 with SMTP id
 a640c23a62f3a-b937657d99fmr789096466b.55.1772456942108; 
 Mon, 02 Mar 2026 05:09:02 -0800 (PST)
X-Received: by 2002:a17:906:9fc8:b0:b87:efa:8786 with SMTP id
 a640c23a62f3a-b937657d99fmr789091166b.55.1772456941578; Mon, 02 Mar 2026
 05:09:01 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Mar 2026 08:08:59 -0500
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Mar 2026 08:08:59 -0500
MIME-Version: 1.0
In-Reply-To: <20260227075718.2243818-1-inochiama@gmail.com>
References: <20260227075718.2243818-1-inochiama@gmail.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Mon, 2 Mar 2026 08:08:59 -0500
X-Gm-Features: AaiRm52b-jdW2UNX8CSDWuKrreJ-aGAWnKXn668LfKMnXa2Ks1b4qAF3c1WKw8E
Message-ID: <CAJM55Z_soPhC9P03edfq_A-GN07PbGqu31aHgE_5kKhkQwkMmQ@mail.gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>, 
 Chen-Yu Tsai <wens@kernel.org>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Inochi Amaoto <inochiama@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>,
 Paul Walmsley <pjw@kernel.org>, Quentin Schulz <quentin.schulz@cherry.de>,
 Richard Cochran <richardcochran@gmail.com>, 
 Rob Herring <robh@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <me@ziyao.cc>,
 Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v5 0/3] riscv: spacemit: Add
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
X-Spamd-Result: default: False [6.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:alexandre.torgue@foss.st.com,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:wens@kernel.org,m:yong.liang.choong@linux.intel.com,m:conor+dt@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:peppe.cavallaro@st.com,m:inochiama@gmail.com,m:kuba@kernel.org,m:joabreu@synopsys.com,m:krzk+dt@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:maxime.chevallier@bootlin.com,m:mcoquelin.stm32@gmail.com,m:palmer@dabbelt.com,m:pabeni@redhat.com,m:pjw@kernel.org,m:quentin.schulz@cherry.de,m:richardcochran@gmail.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:siyanteng@cqsoftware.com.cn,m:me@ziyao.cc,m:dlan@kernel.org,m:devicetree@vger.kernel.org,m:dlan@gentoo.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:looong.bin@gmail.com,m:linux-riscv@lists.infradead.org,m:spacemit@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.o
 rg,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:conor@kernel.org,m:krzk@kernel.org,m:mcoquelinstm32@gmail.com,m:looongbin@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[armlinux.org.uk,eecs.berkeley.edu,ghiti.fr,foss.st.com,lunn.ch,altera.com,kernel.org,linux.intel.com,davemloft.net,google.com,st.com,gmail.com,synopsys.com,bp.renesas.com,bootlin.com,dabbelt.com,redhat.com,cherry.de,eswincomputing.com,cqsoftware.com.cn,ziyao.cc];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[emil.renner.berthing@canonical.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	DKIM_TRACE(0.00)[canonical.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[emil.renner.berthing@canonical.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gentoo.org,gmail.com,lists.infradead.org,lists.linux.dev,st-md-mailman.stormreply.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.710];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:url,infradead.org:email,mail.gmail.com:mid,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 67DED1D97F2
X-Rspamd-Action: add header
X-Spam: Yes

Quoting Inochi Amaoto (2026-02-27 08:57:14)
> Add initial support for ethernet controller of the Spacemit K3 SoC.
> This ethernet controller is almost a standard Synopsys DesignWare
> MAC (version 5.40a). This controller require a syscon device to
> configure some basic features, like interface type and internal delay.

I don't know how we can accept this when it can't be tested since it still
doesn't come with the device tree nodes. If you don't want it to be part of the
series, just share a tree where this code is working. There are plenty of free
public git hosting sites available.

/Emil

>
> Change from v4:
> - https://lore.kernel.org/netdev/20260130022705.1059214-1-inochiama@gmail.com
> patch 1:
> 1 Apply Rob's tag.
> 2 Adjust clock description according to Russell's suggestion.
> patch 3:
> 1. Add set_phy_intf_sel() and get_interfaces() hook, suggested by Russell.
>
> Change from v3:
> - https://lore.kernel.org/netdev/20260128072931.875041-1-inochiama@gmail.com
> patch 1:
> 1. fix the uncorrect compatible string postion
> patch 3:
> 1. add "CTRL_" prefix to all ctrl register definition
> 2. only use delay config 0 to calculate delay code.
> 3. fix typo in the comment
>
> Change from v2:
> - https://lore.kernel.org/netdev/20260121071315.940130-1-inochiama@gmail.com
> patch 1:
> 1. remove not needed compatible for select
> 2. drop empty line in "spacemit,apmu" properties
> 3. add spacemit,apmu properties to required.
> patch 3:
> 1. remove misused phy_fix_phy_mode_for_mac_delays.
> 2. use local tx clock instead of the clk_tx_i in the dwmac.
>
> Change from v1:
> - https://lore.kernel.org/netdev/20260120043609.910302-1-inochiama@gmail.com
> patch 1:
> 1. remove phy clock
> patch 3:
> 1. improve comment and include something special about Spacmit K3 dwmac
> 2. reorder the included file
> 3. fix wrong delay macro used in spacemit_dwmac_set_delay.
> 4. add check for maximum supported delay.
> 5. use DIV_ROUND_CLOSEST to calculate best delay configuration.
> 6. use assign for the ctrl register initial value.
> 7. fix input when calling of_property_read_u32().
>
> Inochi Amaoto (3):
>   dt-bindings: net: Add support for Spacemit K3 dwmac
>   net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
>   net: stmmac: Add glue layer for Spacemit K3 SoC
>
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
>  .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 226 ++++++++++++++++++
>  .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
>  6 files changed, 345 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
>
> --
> 2.53.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
