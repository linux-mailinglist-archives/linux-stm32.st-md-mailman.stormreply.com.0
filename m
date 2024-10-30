Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAA99B69D0
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Oct 2024 17:58:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E43CFC78030;
	Wed, 30 Oct 2024 16:58:06 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E1CDC78020
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 16:57:59 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-7ed9f1bcb6bso89874a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 09:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1730307478; x=1730912278;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G3cY75BHXNmweywFmWSeI4nTOgqt0J0ThjFEmmpT3Pw=;
 b=XWrltPT93q2zSx8AkkWbXTOJ4OSjPVPr+wk4d9bChnVu0m2wn9R7CwLPhqSj+OVVjl
 CO9rABJ/3Sj2BY1Zvg/jzfe5EnfEMnsDUc+YQQJkDGz2zrrnjVAL/f35z5uF5o8CbErm
 v4m+rd+hsNMNir+YxCPPQiTwsNdRJz23n5FLubOhCKug5niQHHdPRvi4y4XPqfL3qgiV
 4eXEFE4UZCu4ssnT9DsgYx7o3eISGyDKplk4Ra2bo7EucVGTAKq6BNfvDZJVHvGDwyMi
 guLHDcuEYcV0G/AQVE92fKu48xpWBZSJUskZ3b6qb/YOynLMaiAQziXGRf7XL8GqkQ82
 As/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730307478; x=1730912278;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G3cY75BHXNmweywFmWSeI4nTOgqt0J0ThjFEmmpT3Pw=;
 b=FX/azPLb8/uv3Lhia8oXDrhHjwxJQcmO2x8dA4KMOGxBdfjEyyj02gVu0orcZCY3t+
 49bHzMKSIWwipFYBn5b8dzHwDTneOz30btQqRhIFSHC8XjRiY9iUCHKs1wiB01SXiuzv
 1fts6kupNDMQ7H3+1Hg+sspRQFBn9lBmC2B69DscBDxxVrs9JRd7GObqDefcNQAhfxvI
 JLzH3tIu9ub4ov84RHh3HyYGCnmtoxKM8flHtbk/wFmd3iX74flxNCfcbPfWKSKYacHI
 Wg60J8iXtoF+hczEhxspMUqKuDBRfu4e0ezb5mtonQQH2preLa0DCPmkAl6FM8Y6HfHR
 nLsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeT8Weju/MFxcalD9SGN+KQOOIJMP6r5OEZDtTeGlLvVl85/ixI1S9anFwgzpXck7RKIDmoZfeLCJlHQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwquRKNooHOHZB+9Q0vChO+R75zFqrszXkTyAlZCijAP1NdHr+V
 t8NoLQ9laEDn6XSJ2D64floouKzHCEt8IFg+mH54yoXnDXdmuaTjp2KpbDz5XGA=
X-Google-Smtp-Source: AGHT+IFPHksQZP6e8UWi8zk4bshtiITtL2PSHAiSSYJzIXWW2rk419GyCPz8eiYwnahJu8NaW3tnRg==
X-Received: by 2002:a05:6a20:d98:b0:1cf:44bb:1cc4 with SMTP id
 adf61e73a8af0-1d9a851d257mr21593375637.40.1730307477921; 
 Wed, 30 Oct 2024 09:57:57 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72057a1f1ddsm9810776b3a.149.2024.10.30.09.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 09:57:57 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Wed, 30 Oct 2024 09:57:43 -0700
Message-Id: <20241030-th1520-gmac-v6-0-e48176d45116@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIdlImcC/22NQQ6DIBBFr2Jm3WlGKki76j0aFwRHYSE2QIiN8
 e6lrrt8+Xnv75A4ek7waHaIXHzya6igLg1YZ8LM6MfKIEh0LQmJ2bVSEM6Lsdhr0ytj7mSVgGq
 8I09+O2svCJwx8JZhqIvzKa/xc94Uee5/i0Ui4U2PZDrdkZqmZ+bwUyOHfLXrAsNxHF9fjJYKt
 gAAAA==
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
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-riscv@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 0/2] Add the dwmac driver support
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
RISC-V SoC used on boards like BeagleV Ahead and the LicheePi 4A.

The gigabit ethernet on these boards does need pinctrl support to mux
the necessary pads. The pinctrl-th1520 driver, pinctrl binding, and
related dts patches are in linux-next. However, they are not yet in
net-next/main.

Therefore, I am dropping the dts patch for v5 as it will not build on
net-next/main due to the lack of the padctrl0_apsys pin controller node
in next-next/main version th1520.dtsi. It does exist in linux-next [1]
and the two patches in this series allow the ethernet ports to work
correctly on the LPi4A and Ahead when applied to linux-next.

The dwmac-thead driver in this series does not need the pinctrl-th1520
driver to build. Nor does the thead,th1520-gmac.yaml binding need the
pinctrl binding to pass the schema check.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/riscv/boot/dts/thead/th1520.dtsi

Changes in v6:
 - Remove unnecessary semicolon from end of switch() blocks
 - Add Rb from Andrew Lunn on both patches
 - Link to v5: https://lore.kernel.org/r/20241025-th1520-gmac-v5-0-38d0a48406ff@tenstorrent.com

Changes in v5:
 - Rebase on net-next/main
 - Drop the dts patch from this series. It applies to linux-next but
   not net-next/main.
 - Remove repeated properties from required: in binding
 - Add Rb from Krzysztof for binding
 - Link to v4: https://lore.kernel.org/r/20241020-th1520-dwmac-v4-0-c77acd33ccef@tenstorrent.com

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
Jisheng Zhang (2):
      dt-bindings: net: Add T-HEAD dwmac support
      net: stmmac: Add glue layer for T-HEAD TH1520 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml | 110 +++++++++
 MAINTAINERS                                        |   2 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |  10 +
 drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  | 268 +++++++++++++++++++++
 6 files changed, 392 insertions(+)
---
base-commit: 03fc07a24735e0be8646563913abf5f5cb71ad19
change-id: 20241025-th1520-gmac-78a76aa90c62

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
