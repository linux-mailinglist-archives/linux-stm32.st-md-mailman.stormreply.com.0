Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D17B5B59733
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Sep 2025 15:15:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 789D5C3087A;
	Tue, 16 Sep 2025 13:15:34 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF618C32EB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Sep 2025 13:05:13 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-56fbc36b94aso861735e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Sep 2025 06:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758027913; x=1758632713;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7/8TL00Hlar3x8JkbaIO/sy+q7FGgNPnwJ9JADaoRL4=;
 b=UT7fnNmL5z16giKZr1/OaAfMWSrOwVZGlazmsjM7RrwLLs8oUxksaBPsN2jZgWLawq
 RVqW58ZZqPpiIO0uwP7aHlcr6JZ5IjKt7CC5GR7R1Uc1Y0Oag/jjZWBl7Q+96t5UqV8j
 0hrw+HBJ5Qn0CE1tqdXJhUqYx9PsRQu3jojHa/0BrIkJt9gZC20iHTxotgPO8PDsQNiS
 RuicCF2Kq5TGnrbZ/x1d3Uh0/4OmIiaLziavkqB2scztwRmbgWupBclcQf3LP8S8kX4t
 2qUGSZGbD7yJCvCacuFy1hoYW86zsN3UFBryWfDexo3xdMHAbzjwjfV8Y2Fga6kgYkIs
 Do1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758027913; x=1758632713;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7/8TL00Hlar3x8JkbaIO/sy+q7FGgNPnwJ9JADaoRL4=;
 b=DhmhAQm/T/8hPwVVaMiJL+DA0FKkFiYjVCEPdWxMu1LCH9qEAb7ViUu7Nz+rbQFwyt
 YzRzOjrVBQuXFtKe6pLBu9fadOz7tl6dpyfpFSbVV48nk8FScLzoC7LjhY5Wr8mkVslq
 XrDq/TCTh0gjm9CwbeWSMqoyNCHO0b47JVSktuPyqnv2e8FU1p1IpUcUz/84qrw0e4kP
 fsOmTeHgWVJbI+XZ38YpfPKtZNUvHvnPCIULRLrij2bztqzQ9MlvlVydZUyaBLAjGbAX
 SrYpqG9EmdxV4Ym+7ZPcG4N1/v3meq5i2m+akReBPKsiiXo9fmbKZ62AN1OCZjOxQdKk
 eJbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPbsPBrqOHD6gzzDyftVlpLL+7iz39/OVWYnCqt0AwgqryZY0W0qKQmspX3cLuNmhoUc8WIrCkpGqovQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzrSjdLl5fQ5wTgSL9lrBOwiwsK+SOlXWZB/eAZTxZwkwf8EbxE
 C5KZyyj2hWsWAkHMpIQEBxAugR2yrsY4S3tYYWTWnCv3xetO/K6MJMiP7YIS1swIPvQ=
X-Gm-Gg: ASbGncvsQ9l+gNYrAdVJzISFVaXrCcukqE6WL9bdVUqLFLIsi9RO2eT0cOwonKnK+nE
 CyEFWWhrknwKXzaYDc/PRLTPrgp8vybbTyz+oN9aKOQ7Tmd8h+xQVErHKx12PIkzb3zokrsXjcC
 wSJ8QA+notd4I8RHFh6wHLNB8nqiQPiFreRJ4CsFLis2hmHdAWW7mNBP+ULcXK+bM5wEjTqVkJ1
 KBJVIuZuZ5PHjIVE/Bj3HvBqjwBCMlcbVOIT6onbVPBX3a99xdb8eoy/T3DENDHDRrmVbmVQZgj
 PVve90Ov2OLePC9j1sH44QJZsISN2nKnZtMdjzmI6xChW4cVhsaecXOEv+SfPzSMoVwhDpddpFP
 5f9xz1E7nrcgKoY/D5m7KDAQvC3TnrWGPTmtCtn20hePybpf4iAcoA0UcrqUSPfIryg==
X-Google-Smtp-Source: AGHT+IENshuIe1ZzBTlZI8ErHAIWfYofEIxwEqD/DxJUwphDcoj5NYeMYiaSJpT5gnIx28eNAX2rmA==
X-Received: by 2002:a2e:bea2:0:b0:336:e445:92c5 with SMTP id
 38308e7fff4ca-3513dd54c2amr23580931fa.3.1758027912735; 
 Tue, 16 Sep 2025 06:05:12 -0700 (PDT)
Received: from monster (c-85-229-7-191.bbcust.telenor.se. [85.229.7.191])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34f1b2a931fsm33599691fa.47.2025.09.16.06.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 06:05:10 -0700 (PDT)
Date: Tue, 16 Sep 2025 15:05:07 +0200
From: Anders Roxell <anders.roxell@linaro.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Message-ID: <aMlgg_QpJOEDGcEA@monster>
References: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250908105901.3198975-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250908105901.3198975-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailman-Approved-At: Tue, 16 Sep 2025 13:15:32 +0000
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac:
 dwmac-renesas-gbeth: Add support for RZ/T2H SoC
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

On 2025-09-08 11:59, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Extend the Renesas GBETH stmmac glue driver to support the RZ/T2H SoC,
> where the GMAC is connected through a MIIC PCS. Introduce a new
> `has_pcs` flag in `struct renesas_gbeth_of_data` to indicate when PCS
> handling is required.
> 
> When enabled, the driver parses the `pcs-handle` phandle, creates a PCS
> instance with `miic_create()`, and wires it into phylink. Proper cleanup
> is done with `miic_destroy()`. New init/exit/select hooks are added to
> `plat_stmmacenet_data` for PCS integration.
> 
> Update Kconfig to select `PCS_RZN1_MIIC` when building the Renesas GBETH
> driver so the PCS support is always available.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Dropped passing STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag in stmmac_flags
>   as it is always set for all the SoCs.
> - Updated Kconfig to include RZ/T2H and RZ/N2H.
> 
> v1->v2:
> - No changes.

The following warning is seen when doing a defconfig build (make
defconfig) for arm64 on the Linux next-20250915 tag.

First seen on next-20250915
Good: next-20250912
Bad: next-20250915

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Build regression: WARNING: unmet direct dependencies detected for PCS_RZN1_MIIC

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

This is the build warning:
WARNING: unmet direct dependencies detected for PCS_RZN1_MIIC
  Depends on [n]: NETDEVICES [=y] && OF [=y] && (ARCH_RZN1 [=n] || COMPILE_TEST [=n])
  Selected by [m]:
  - DWMAC_RENESAS_GBETH [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_ETH [=m] && STMMAC_PLATFORM [=m] && OF [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=n])

WARNING: unmet direct dependencies detected for PCS_RZN1_MIIC
  Depends on [n]: NETDEVICES [=y] && OF [=y] && (ARCH_RZN1 [=n] || COMPILE_TEST [=n])
  Selected by [m]:
  - DWMAC_RENESAS_GBETH [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_ETH [=m] && STMMAC_PLATFORM [=m] && OF [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=n])
I: config: PASS in 0:00:01.592356


By reverting this patch the warning disapears.


## Source
* Kernel version: 6.17.0-rc6
* Git tree:
* https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: next-20250915
* Git commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
* Architectures: arm64
* Toolchains: gcc and clang
* Kconfigs: lkftconfigs

## Build
* Build log: https://storage.tuxsuite.com/public/linaro/lkft/builds/32l4UF8KltAzu6kUpW3hXaYRWjZ/build.log
* Test details: https://regressions.linaro.org/lkft/linux-next-master/next-20250915/log-parser-build-clang/general-unmet-dependencies-warning-unmet-direct-dependencies-detected-for-pcs_rzn_miic/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/32l4UF8KltAzu6kUpW3hXaYRWjZ/
* Kernel config: https://storage.tuxsuite.com/public/linaro/lkft/builds/32l4UF8KltAzu6kUpW3hXaYRWjZ/config


--
Linaro LKFT
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
