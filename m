Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D83559A58E9
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Oct 2024 04:37:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BDBDC78033;
	Mon, 21 Oct 2024 02:37:03 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C7B8C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 02:36:55 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2e2cc47f1d7so2605575a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Oct 2024 19:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1729478214; x=1730083014;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SDwVvRsmB8PgMAF9NalbRCBobUSoLoKxM6gCOMAKho0=;
 b=BDSTmUML4zDJyK6IZ95ASNHlNKEa+1kVh3AFlZO3YGKZQAaLTkL7eydsxMdK7QpECs
 o/f+WzAwpJdyxz4oxU/VkhOLEzMak7BgJ4SnQlsSuZYiVMyFkopDCLlXVhTH5icq0poS
 DU1oxozmaoEwHMRIAyy37GEaZkq6N3gWn5a8ucVPk6eHvUK+Jp8/eUtIQNmaYQd5bpeQ
 1powzkb/ei99ALAmYEjEuFzSI3txTzcF7npY5lHLwpHyd5dShCEKKfslApKimwT8S+F2
 UmFmCyXYxbcYH86UHEkKWClSOZUsg/Up1uW+9AxOrp3HAVd/v5Xul7qb/UL1mHo2KWA4
 SDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729478214; x=1730083014;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SDwVvRsmB8PgMAF9NalbRCBobUSoLoKxM6gCOMAKho0=;
 b=MSsbxG6x88bsfQtDZlcETl0jNE2Mx2USU9TI6Sk0vW2QOK28moqgLAofpkTwA6QpyB
 /VCWNZ7pQOgpju4hsyjAu9kcwM/wzsCfyFCZh18WlOQ/NywVGlodz49T/5CZ/4P8t5WH
 QJw3ncKu3IajJ8XIEiMOASDBRVFY0VWpDyVBfUvI3O7FNccNdwDN8iX+abDWnSGOLpOf
 Mtx32yfkK5bXg9emu4kS6YZYa56yX5W9BF5UB9IymloAQmzxB10hWNN0JdyYaEgiXLIE
 ASZ5j5GxLlI3nmVFlv5DMwvg8+SdT8PQOl9JeAzhwnSu5KAeSMC/EAk0Lz1BXOk0oA9M
 VQQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUgmB4vHxa4+r6bVIenbQeMXwMQUJD9NVi48AYSFzDFyFLuKbW7Qa0g/3em7tuBjxRwyXFHYxciYeBRQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YysKaARZIWIZqjMoWGEfCk2vJXfpR1y75g+YnhpVcT8WzWqyDku
 FcBiAAy9jZLg95qzYt9ct/buuMfRwyNTWItq2CYkgAa+lnkgXJO321VwUkxE3Hg=
X-Google-Smtp-Source: AGHT+IGNXTzbHIjYscMQc1FyHJL74YRfT9c4LzptWN49IdWjspBw/dUxnVD8S9MWaYzR1JmG3gfNjA==
X-Received: by 2002:a17:90a:bc9:b0:2d8:7a63:f9c8 with SMTP id
 98e67ed59e1d1-2e3dc2d22f0mr20946491a91.14.1729478213703; 
 Sun, 20 Oct 2024 19:36:53 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e5ad355bebsm2337008a91.7.2024.10.20.19.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2024 19:36:53 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sun, 20 Oct 2024 19:35:59 -0700
Message-Id: <20241020-th1520-dwmac-v4-0-c77acd33ccef@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAA++FWcC/x2MQQqAIBAAvyJ7TlAxkr4SHUq33EMWKiWEf086D
 XOYeSFhJEwwshci3pToDE10x8D6JezIyTUHJZSWQgmevewb3HMslqPU1prNaDWs0JIr4kbl300
 QMPOAJcNc6wd0tB++aAAAAA==
To: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Drew Fustini <drew@pdp7.com>
X-Mailer: b4 0.14.1
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 0/3] Add the dwmac driver support
 for T-HEAD TH1520 SoC
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

This series adds support for dwmac gigabit ethernet in the T-Head TH1520
RISC-V SoC along with dts patches to enable the ethernet ports on the
BeagleV Ahead and the LicheePi 4A.

The pinctrl-th1520 driver, pinctrl binding, and related dts patches are
in linux-next so there are no longer any prerequisite series that need
to be applied first.

Changes in v4:
 - Rebase on next for pinctrl dependency
 - Add 'net-next' prefix to subject per maintainer-netdev.rst
 - Add clocks, clock-names, interrupts and interrupt-names to binding
 - Simplify driver code by switching from regmap to regualar mmio

Changes in v3:
 - Rebase on v6.12-rc1
 - Remove thead,rx-internal-delay and thead,tx-internal-delay properties
 - Remove unneeded call to thead_dwmac_fix_speed() during probe
 - Fix filename for the yaml file in MAINTAINERS patch
 - Link: https://lore.kernel.org/linux-riscv/20240930-th1520-dwmac-v3-0-ae3e03c225ab@tenstorrent.com/

Changes in v2:
 - Drop the first patch as it is no longer needed due to upstream commit
   d01e0e98de31 ("dt-bindings: net: dwmac: Validate PBL for all IP-cores")
 - Rename compatible from "thead,th1520-dwmac" to "thead,th1520-gmac"
 - Add thead,rx-internal-delay and thead,tx-internal-delay properties
   and check that it does not exceed the maximum value
 - Convert from stmmac_dvr_probe() to devm_stmmac_pltfr_probe() and
   delete the .remove_new hook as it is no longer needed
 - Handle return value of regmap_write() in case it fails
 - Add phy reset delay properties to the BeagleV Ahead device tree
 - Link: https://lore.kernel.org/linux-riscv/20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com/

Changes in v1:
 - remove thead,gmacapb that references syscon for APB registers
 - add a second memory region to gmac nodes for the APB registers
 - Link: https://lore.kernel.org/all/20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com/

---
Emil Renner Berthing (1):
      riscv: dts: thead: Add TH1520 ethernet nodes

Jisheng Zhang (2):
      dt-bindings: net: Add T-HEAD dwmac support
      net: stmmac: Add glue layer for T-HEAD TH1520 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml | 115 +++++++++
 MAINTAINERS                                        |   2 +
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  91 +++++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 119 +++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi              |  50 ++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |  10 +
 drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  | 268 +++++++++++++++++++++
 9 files changed, 657 insertions(+)
---
base-commit: f2493655d2d3d5c6958ed996b043c821c23ae8d3
change-id: 20241020-th1520-dwmac-e14cc8f8427b

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
