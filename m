Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B63E7C3F707
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 11:30:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62C8BC5F1FF;
	Fri,  7 Nov 2025 10:30:07 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D1D0C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 10:30:05 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-47754e9cc7fso3732215e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Nov 2025 02:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762511404; x=1763116204;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6lK1bWhoDlOt3D7+OTYGFbwlQlHjc0qM/7Y1vcvdtOY=;
 b=Z0qqNbS9r/j3Ho86maM7dgwAMq/XkDdJP1di3HrgZ09Q5JXBFGNhNlVDgWQ1Otfiai
 ItWjA5ilCGUycVxLuY/Tl5EtFjv4Lt7p53hhrD+l0I2hGhM6ZG/xopLX88kuaNF5Ej9v
 0/nPSCGmjgfGVR8cfRUEfX+QefjEP7JxvX4oM54uAFWrc8OAamARPKfF4MELW/o6C2lU
 yLtm2OGfXxXC4NehENV0XrAUriziFGpT02sd9ponGj74NlsB4My6+LV9iror+Jm6R3CX
 HAxhD/jxVJd58R/gqSDZHC7jrdHYkA0ckBlPSvERTxZ2ggvIUK7lU2R1iUy58iv+74ZQ
 2rSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762511404; x=1763116204;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6lK1bWhoDlOt3D7+OTYGFbwlQlHjc0qM/7Y1vcvdtOY=;
 b=kRnlBJxd11+I0JA0ELarKIKeYAc9YSAkgx5oQdzNzCTSMD/15AmehGvst8SFDKwE/2
 1OJx4I8/8A6zuVqwcGA2HM2kH9HQowF4gjf5NQQm0WkUJG3pTeMtM3ZQR48XJLsMhSsZ
 /beWsfBCfWGtxX8LhXPQgSy4qjE8V/DGFVfCvqy/FEp8eH1Z1pm4NCQIhyJgZzkjDgi9
 gWr79O92cKxOKQJXfURf3FDELpXBW76w3sOfajwGNX+kk2nG2/wk3SdXr9h7juZs51NO
 EYiIo7A79KHgvfFWN55HeFTrmNiHO/INhF/o0AJ4O11Ti61VsLnv1u6eCilHkctEdeOP
 6aeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3JtKy9iyJpU1pfeWAjrp6RGZDxWNt3Ufee+T86VPp7A65cqcfGn/qMH00sZ39yBmMo2C18EJS6HtOog==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw9E53CwajXGtZ64ykJs0upoFS59D8q4xpvYzPbTivHvA+rd8Z7
 sQZZaUmv+Nhcv7OomeSU/GpmxenR/eYuB7m1NxSKxgN0rsRNudjubR1oDeoO7NRHWo4=
X-Gm-Gg: ASbGncsLgAtEagYqVcnOnQZ6eDWjLaoO5oJX6Ys0rTiyrpXMp6zhlTlsnEKV/Xl41xi
 s9eIwqre2jRdEI7h+fkDkBdxM7EgcmWZ5zMkkxQ2qKLsq+p5tEEvq/wsKxzMNnpXCN1p8gQjr29
 1tvvjleSe/WUT0+Ag0LGpSf9LHYCL2fQ4iHVPJjWMR4uv0B1yW1o/PMxDOVJKm9H2BQmMTufkWo
 FIWnAXmWyuD6c3BCcseRauDaVnhobUb+YfsVB4hvQKOiemaCjMsww16EURhqCy+JzBLGZjirMeL
 Vc621J3WIgjQfQys546RwlwuzxJOXwsVabjZpAFXli6pl4uceZyOXJNByuQ6Dz9kgE5B0umsaxk
 U/vfxLyr8el04QT/ZiosoHQtYhONGlMG1VdZWmUL436FXWPrDZ5FuTbxso6cY2/O6SNFjchKtmQ
 Ut5YzctWCCkARYdQ==
X-Google-Smtp-Source: AGHT+IGLasgznDpysA1VVPTGU5y82R7RrVgkRw3m6DuFOG2T0Xrl7Qi/ZwJh7t3lCXtqhciZW19mKg==
X-Received: by 2002:a05:600c:1384:b0:471:14b1:da13 with SMTP id
 5b1f17b1804b1-4776bc93e89mr17460965e9.14.1762511404248; 
 Fri, 07 Nov 2025 02:30:04 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fb6d:2ee:af61:f551])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ac67920fcsm4414864f8f.39.2025.11.07.02.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 02:30:03 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 07 Nov 2025 11:29:50 +0100
Message-Id: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAB7KDWkC/23PSwrCMBCA4auUrI1M3q0r7yEu0pi2AdvURIJSe
 nfTCorY5T8w3zATijY4G9GhmFCwyUXnhxxiVyDT6aG12F1yIwpUgAKOb8b3OOqSCjFi22uDSy6
 BMqGNIBTlvTHYxj1W83TO3bl49+G5nkhkmb61isCGlggGzKhWlWmIlbI8Xt2gg9/70KKFS+xDE
 KBqi2CZUEJJVVeUga7/CP4lyOZPiWeiUVJKgFIZq3+IeZ5fGplk2DkBAAA=
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Matthew Gerlach <matthew.gerlach@altera.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, 
 s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, Drew Fustini <fustini@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Shuang Liang <liangshuang@eswincomputing.com>, 
 Zhi Li <lizhi2@eswincomputing.com>, 
 Shangjuan Wei <weishangjuan@eswincomputing.com>, 
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
 Samin Guo <samin.guo@starfivetech.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Swathi K S <swathi.ks@samsung.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4165;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ZivlGpi+T1c5DUoMpOPkmITE34pLl/IzVvSOHSJ88dQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDcojt3k/2PQCBq6F4SnzHXqKBXG0p9VyMcZAB
 IR/euEb67iJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQ3KIwAKCRARpy6gFHHX
 cq4aEADTN+ZUS9OBISS21hcbWDotjjlsSXxfMzNstpmanMhTAjTDqTozFbZykCw0Vf274vKfVTb
 3g3WrNgP5cYiyZLsDLBQrRu6Ymi7HMPV/05dLA/ZwUDNCnI1z7BZ88PIdxY5BkCZVJ3GKChFHtc
 /MO9zH6RfTWIudWrMD7Lfd9ZY6jZIvDoq773GGAi6RNBmUIuMwrmFa6KoiNx9FQ0NswFVmDySZh
 JXxm6zVaFTbIkl9oXrLqI2XJ/gVgWH0/Z84+6CyYJJfsal7i8ARil61hGY321B8LC7SosFR+j7j
 B++DT5/YtpyqEq7RWzvA9k+oYt2zfujGqApAhNHp98SeFy5vw7tmBvrmtAU5n+KbCm9f3NTe1i2
 fknVSt8R40eV+g1TckJWN/2/vn4TyZd0s9D7Xa8ovqOBTJDAbL9f+suLfjhBL3R5AIF1jlWhh64
 mk81XGCxt6IW5TnYAMUXhE+G4unUmH8c2hdj/NqoR1owhNhOADjIgBosXOV3YrxLMKT0gL57ydA
 hvbBFUSxE6/hrs7QM6W8VUkwoGv2QB0OI8zxJo6s2F2ZMuoMMLhGpkgud1m20fPaPHx4HQTSZR5
 +NT8ZRc9bQyTREbDWHw9J0JKcCeAP3mxkCDn1v3X1p7YmUtI4pBF/WjLgOT6OM9riUztf9yMJFV
 h4+xLNJvvsQjMdw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 sophgo@lists.linux.dev, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 0/8] net: stmmac: qcom-ethqos: add support
 for SCMI power domains
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

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v5:
- Name the DT binding document after the new compatbile
- Add missing space
- Make the power-domains limits stricter
- Link to v4: https://lore.kernel.org/r/20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org

Changes in v4:
- Remove the phys property from the SCMI bindings
- Mark the power-domain-names property as required
- Set maxItems for power-domains to 1 for all existing bindings to
  maintain the current requirements after modifying the value in the
  top-level document
- Link to v3: https://lore.kernel.org/r/20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org

Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (8):
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: use generic device properties
      net: stmmac: qcom-ethqos: improve typing in devres callback
      net: stmmac: qcom-ethqos: wrap emac driver data in additional structure
      net: stmmac: qcom-ethqos: split power management fields into a separate structure
      net: stmmac: qcom-ethqos: split power management context into a separate struct
      net: stmmac: qcom-ethqos: define a callback for setting the serdes speed
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |   3 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |   3 +
 .../bindings/net/amlogic,meson-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/eswin,eic7700-eth.yaml |   3 +
 .../devicetree/bindings/net/intel,dwmac-plat.yaml  |   3 +
 .../bindings/net/loongson,ls1b-gmac.yaml           |   3 +
 .../bindings/net/loongson,ls1c-emac.yaml           |   3 +
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |   3 +
 .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |   3 +
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |   3 +
 .../devicetree/bindings/net/qcom,ethqos.yaml       |   3 +
 .../bindings/net/qcom,sa8255p-ethqos.yaml          |  98 ++++++
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |   3 +
 .../bindings/net/renesas,rzv2h-gbeth.yaml          |   3 +
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |   3 +
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 .../bindings/net/sophgo,cv1800b-dwmac.yaml         |   3 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml          |   3 +
 .../bindings/net/starfive,jh7110-dwmac.yaml        |   3 +
 .../devicetree/bindings/net/stm32-dwmac.yaml       |   3 +
 .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |   3 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml |   3 +
 .../bindings/net/toshiba,visconti-dwmac.yaml       |   3 +
 MAINTAINERS                                        |   1 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   2 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 342 +++++++++++++++++----
 26 files changed, 448 insertions(+), 63 deletions(-)
---
base-commit: 9c0826a5d9aa4d52206dd89976858457a2a8a7ed
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
