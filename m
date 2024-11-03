Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B23B59BA6BE
	for <lists+linux-stm32@lfdr.de>; Sun,  3 Nov 2024 17:58:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67FAFC6DD9E;
	Sun,  3 Nov 2024 16:58:16 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0877C6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Nov 2024 16:58:08 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-20c693b68f5so36266205ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Nov 2024 08:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1730653087; x=1731257887;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SiRHBTzAaAAcdz9wR1AEo/4hHR8Jww4cDbAZ/MX74uo=;
 b=DePVYkgmRSnRi2Sq0yxLatuybD2b/xj45w76Mjf/w/nvC7I1+8Ow9Z+fAtj5Uxbgou
 6urg0lssGFXAXb4Ict20YTD9FC4wC29jODUf91KMaMNPHBafmyt+aazuqfJX+JEnWdT2
 V4J0okqAcwictU2+qJtpDSdtIltY9U0aBhHBJsnKudWTPurnxOpTYbFE+NY19sRZ9yTr
 I0VI0v/LVe/OZhlRZf3DnTXmJImpTHo69rcd+jDmEto+RaBFOYuzM7WSTbu3kOp6kcPS
 2K9XI453JzsTeX6pYok2yXTTmFpCXVSYI4+ZDA6iq3wLiwrEgDWpRpYA4mXzxYjaPOm7
 BHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730653087; x=1731257887;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SiRHBTzAaAAcdz9wR1AEo/4hHR8Jww4cDbAZ/MX74uo=;
 b=k4zIrVfLV4TuYPrOQB2XSijJQJnYbJBnEP7HVFmHNYH2/UPYh5M5QuwJrMH9JFgUyO
 GN9zyJPx4c1+paZzppy71agdwf9l1fMhwiqP+MWjVgILu0DG/JxWBZNQ+6tFM3MXWQPx
 N74w0335MRvEcEK7WSZDKSzir6YKrwFOCvwJOglKCB1KeaBRe0SKAGXCKOJgNFvHWW4F
 mC/tgBo9/oxnstK7N9Uoh65GjkFgB0OYtkHIwvb1iSGZGmuDEwzmP/oBT5GZzlh56Fpr
 hQNIGhnOYtPo4yg53yonLoUYP2tdli+LCpHCE9TotC+QNpw8R9yBPB1tIw2wouyipiOf
 GaPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUE9uEyEhsVTYuaO12GH/hV6DzM9ihaO7u5uFo8V3LAHI2VnJYiqNx+fZ+fKmO/kXZmuh9A+xFtnOTNwQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxXzSQkerAyTrg/vMiWQ5yVTZVyQwRbi3LkEjD0qeB9n2a+ISIF
 rDQg/+KGReHwUyeOrBMXIRhFhuWY9a76uDoWppVxgHf+F0cT1N/KJGiG9U60aGA=
X-Google-Smtp-Source: AGHT+IHZ3SR688u4NeecI0FgN5pXp5mQEMhPTdsDVQGdNI3vsPP0cL6muQcMZTinATTJ8tXbeT7e2A==
X-Received: by 2002:a17:902:c40c:b0:20c:7d4c:64db with SMTP id
 d9443c01a7336-21103c7bfafmr179492615ad.49.1730653087220; 
 Sun, 03 Nov 2024 08:58:07 -0800 (PST)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211057c9783sm47531355ad.236.2024.11.03.08.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Nov 2024 08:58:06 -0800 (PST)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sun, 03 Nov 2024 08:57:58 -0800
Message-Id: <20241103-th1520-gmac-v7-0-ef094a30169c@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJerJ2cC/23NTQ7CIBQE4KuYtxYDlD9deQ/jgtDXlkWpAUJqm
 t5dZKXR5WQy32yQMHpMcDlsELH45JdQgz4ewE02jEh8XzNwygWjXJI8MckpGWfriDZWK2vP1Ck
 OdfGIOPi1aTcImEnANcO9NpNPeYnPdlNk6/+KRRJKOtNTK4ygahiuGcN7GjHkk1vmphX1IXT0W
 1BVQGGYVr2QjKlfYd/3F0fDCcj4AAAA
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
Subject: [Linux-stm32] [PATCH net-next v7 0/2] Add the dwmac driver support
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

Changes in v7:
 - Remove GMAC_RXCLK_DELAY_VAL(x), GMAC_RXCLK_DELAY_VAL(x) and
   GMAC_PLLCLK_DIV_NUM(x) marcos
 - Fix register write in thead_dwmac_fix_speed() by using FIELD_PREP()
   directly instead of the above macros
 - Fix thead_dwmac_init() to preserve bypass and invert bits when writing
   to GMAC_RXCLK_DELAY_CTRL and GMAC_TXCLK_DELAY_CTRL
 - Add sentinel to end of thead_dwmac_match[]
 - Normalize capitalization in dev_err_probe message
 - Link to v6: https://lore.kernel.org/r/20241030-th1520-gmac-v6-0-e48176d45116@tenstorrent.com

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
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  | 273 +++++++++++++++++++++
 6 files changed, 397 insertions(+)
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
