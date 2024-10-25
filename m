Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1699B0BCC
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Oct 2024 19:39:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04775C78021;
	Fri, 25 Oct 2024 17:39:50 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0B9EC6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2024 17:39:41 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2e2dcf4b153so1690340a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2024 10:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1729877980; x=1730482780;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rRtgBgW6s/EQDOLVk7vTju3fTexfS9nXJ3lju+LyV5U=;
 b=BrBXuIQmZpsIywAC+vvE4SasYHZhUZTh5Iik/CS+5NfVRaio3+imFJWbE558gwTQRn
 UJoJHD/MuSijcB39fap7Wz41LvejGbCbgCqOuWFntp1TDkvBl5qPCevth5uG684Y76BF
 zZortCta569h8HCx+hJI/oL8vDYGH6sG43IB6X8l6LXKgJNr9MSwcsXTb/UCcbdCm3w2
 mckhIdbSXsaOBEi8sJ9UFVmUUYxRI5OptdsAy8bgqvHgc64CYh+IJJEh0IhXipqcFf5K
 Bt3lAdRnqYUjtP6WiwFuM3etN1+tdwtAoiYKxt0bT2aMpIWCdW65vEdBFL4skUIcM2GP
 twHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729877980; x=1730482780;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rRtgBgW6s/EQDOLVk7vTju3fTexfS9nXJ3lju+LyV5U=;
 b=ueMzru17huHHOtv4y5ps1hIK4/PhLI8cIGRalmM58f0lGBnx2tFc+tsUAA+ivFAjPe
 ajQVlMAhD7B/3jA+kAMdY1QPa+Yc0Fig0M3jOLQ0sAfY2vgz95BDOetFP7/z5GplkrVu
 c74L8jusFZyHxZEGIkgQUrAh6lysN8wYjLnfrmprYfHY6MSkMFqlwnpv0jMWT+4YSV9e
 qZCEr8IQH8USSitlmuzn1H/5qQKMoV9Tlhp6BvGwytKJzSooLDXepOKsfz2oPxhPQmzB
 cbZA0wq3ICcIsuELaYGXZuBTP7wacDsFRTI3x3VSi0z8TydFgQq/oZ/ICvs+hzHmiHNu
 OFrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE5uds+yHtDZHajW951zkhzRlXaG5JTTDh/JmECyAGFWGs0LVVMyC0YkCWnt1N7qfs7j/AX+UmHbvgWg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzubE9/Sr7G3MsvAYc6rBXMb1qqnifPLytrLMYnWXex75hM05v3
 rLPiTTkqh3+3b2tbYkFDQQHjN8t4DiXRDoR9A6rhGyUxWIwgpEp3V+fSNwdlQ7w=
X-Google-Smtp-Source: AGHT+IEaYZjwmDMtPye4RiuOg02mqdtcGwqC0dAPHwGmLr3SmAM/hWVbsZOksmPjY0Qxh811xJrTgQ==
X-Received: by 2002:a17:90b:3ec9:b0:2d3:da6d:8330 with SMTP id
 98e67ed59e1d1-2e8f10507f6mr183354a91.4.1729877980066; 
 Fri, 25 Oct 2024 10:39:40 -0700 (PDT)
Received: from [127.0.1.1] ([4.28.11.157]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e77e4ca3fcsm3813961a91.13.2024.10.25.10.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:39:39 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Fri, 25 Oct 2024 10:39:07 -0700
Message-Id: <20241025-th1520-gmac-v5-0-38d0a48406ff@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALvXG2cC/x3MPQqAMAxA4atIZgM1WP+uIg6hRs1glbaIIN7d4
 vgN7z0QJahEGIoHglwa9fAZtizAbexXQZ2zgQzVlSGLaassGVx3dth23DbMvXENQS7OIIve/20
 ELwm93Amm9/0AtTd5gmcAAAA=
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
Subject: [Linux-stm32] [PATCH net-next v5 0/2] Add the dwmac driver support
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
