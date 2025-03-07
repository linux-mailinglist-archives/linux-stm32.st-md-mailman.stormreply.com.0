Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 454C9A55CF5
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 02:16:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFC7AC78F85;
	Fri,  7 Mar 2025 01:16:57 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F8D5C78F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Mar 2025 01:16:56 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6dd420f82e2so17517836d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Mar 2025 17:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741310215; x=1741915015;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gdvNoZdxI+TWENbSWz9hBd4EuJ//tH9knwU3HWPo67o=;
 b=QU9R1HC4SohBuc4HAd48HpdRHSnm4AiqOnAD+xVZsM/QZXfnAlF9OXoT2yVre1XhED
 266G6YrYE4Sh9L4EseAGrhUBvlhArsg9GHjT08OPaHiKVOxNUmAgkANSCFBDbZMcSGCw
 0I7UwMlZ0soNRRu1RDlNWhav/1vE4Y/Y29e4CP+lryYu1y4j5Rn0r/Hu4ZvnPuwK/2Sd
 G7j/1Wj2f+nfY4PkLAq3qxXBn66rdXumkuOAMVcdJVP6hJmyr8KKox0kBa+EV4tpqQ5G
 8n4SFZmvJhYRi8RzgC4NVl3+laeUaPgYujFs6kGho+N4WaHl5dSHm27bu7lf6Td+S4wT
 G1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741310215; x=1741915015;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gdvNoZdxI+TWENbSWz9hBd4EuJ//tH9knwU3HWPo67o=;
 b=DHdtXXnqDcc8ESVSIVqJ5zwiIpINi55VArrAg8kmpOxFDv6Vb48aPbX1/IkYeWCSjp
 otdmf//LsW6p0c4KF+10cotH00c5F30TmzTH0qHKgGs8fpkMAArwAtAW7XUNkF8MHQU2
 BtnazaczHsYwKgDp78q9pm/peUbOfHggniTzMT5Lp8OWWFwq2WHB2nS0CxDEurd/D4JX
 /e7tWrAfkhnI/zajWDadN5SCpEwfWD8kkIQzxYFpJ+19P0er2afLN76SlsY2+VV22/pw
 z3t8XEijSpKKSbqj2NjFhPVuujgiEzcehOgzM5qg/AYoHjnGQkVCa+G4Rda9yzMdCYOJ
 4E1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN5UKwxIyS4exf7G4A1PK2nSmioTLjAAS+yoBObGTgZ8PxujMxk4OaT0MUDzXgSDDAGQEb63CApvENow==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxtrD0Pxc2IbWCHTQolsVGWg+Re1a2YtZGF/GwfE1JLZvZAl8U9
 myNDHo2sCbGYNVPq3We40z8VtAHdAhuovAddbzgF/yI8+RjTGIeF
X-Gm-Gg: ASbGncsrsdqwdLVnoW5aig0V0XFkPDXE9Xw6f+UCQdnAHaYR1avff1TdzIk8qDcvOHv
 jYKKxU6taqyhhyV8FoFVeiiZQ41F1Pl8We9bqpNshvW5H+f1FD50wEXKTeXibUDhQkguZCWQH5k
 GQScxdep4czi/4DWaljxBOgLmZyZBKTRynVZOA8YhboAMFUfwH7N8MpOeNN/+j5W0po1stWJ2Sd
 y7jNBo2fJUIX1F0r+xTOynor9SvxzKcff+JrzGGCsrm4f3qdVoBI6YSfIQ+hkEx71x8V6QLpWl2
 9gvRx0cmIxpLJ2CL7hsU
X-Google-Smtp-Source: AGHT+IFF4yBb+hCS7ZBQCfCT1ORUYw/Gj0CKaqbDjWG3VtyoJXnhpEJioVXA7e3Pa/pLe1dzFKh+kA==
X-Received: by 2002:a05:6214:1c49:b0:6e8:fa72:be47 with SMTP id
 6a1803df08f44-6e900604eaamr17244676d6.8.1741310215325; 
 Thu, 06 Mar 2025 17:16:55 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-6e8f71724d4sm13217566d6.112.2025.03.06.17.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 17:16:41 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@outlook.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Vladimir Oltean <olteanv@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Lothar Rubusch <l.rubusch@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Fri,  7 Mar 2025 09:16:13 +0800
Message-ID: <20250307011623.440792-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v7 0/4] riscv: sophgo: Add ethernet
	support for SG2044
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

The ethernet controller of SG2044 is Synopsys DesignWare IP with
custom clock. Add glue layer for it.

Changed from v6:
- https://lore.kernel.org/netdev/20250305063920.803601-1-inochiama@gmail.com/
1. rebase against latest net-next/main

Changed from v5:
- https://lore.kernel.org/netdev/20250216123953.1252523-1-inochiama@gmail.com/
1. apply Andrew's tag for patch 2,3
3. patch 1: add dma-noncoherent property.
2. patch 2,3: separate original patch into 2 part
4. patch 4: adopt new stmmac_set_clk_tx_rate helper function

Changed from v4:
- https://lore.kernel.org/netdev/20250209013054.816580-1-inochiama@gmail.com/
1. apply Romain's tag
2. patch 3: use device variable to replace &pdev->dev.
3. patch 3: remove unused include.
4. patch 3: make error message more useful.

Changed from v3:
- https://lore.kernel.org/netdev/20241223005843.483805-1-inochiama@gmail.com/
1. rebase for 6.14.rc1
2. remove the dependency requirement as it was already merged
   into master.

Changed from RFC:
- https://lore.kernel.org/netdev/20241101014327.513732-1-inochiama@gmail.com/
1. patch 1: apply Krzysztof' tag

Changed from v2:
- https://lore.kernel.org/netdev/20241025011000.244350-1-inochiama@gmail.com/
1. patch 1: merge the first and the second bindings patch to show the all
            compatible change.
2. patch 2: use of_device_compatible_match helper function to perform check.
2. patch 3: remove unused include and sort the left.
3. patch 3: fix wrong variable usage in sophgo_dwmac_fix_mac_speed
4. patch 3: drop unused variable in the patch.

Changed from v1:
- https://lore.kernel.org/netdev/20241021103617.653386-1-inochiama@gmail.com/
1. patch 2: remove sophgo,syscon as this mac delay is resolved.
2. patch 2: apply all the properties unconditionally.
3. patch 4: remove sophgo,syscon code as this mac delay is resolved.
4. patch 4: use the helper function to compute rgmii clock.
5. patch 4: use remove instead of remove_new for the platform driver.

Inochi Amaoto (4):
  dt-bindings: net: Add support for Sophgo SG2044 dwmac
  net: stmmac: platform: Group GMAC4 compatible check
  net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
  net: stmmac: Add glue layer for Sophgo SG2044 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 126 ++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    |  75 +++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  17 ++-
 6 files changed, 229 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

--
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
