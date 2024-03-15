Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F1787E468
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Mar 2024 08:54:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 032ADC6DD75;
	Mon, 18 Mar 2024 07:54:23 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8DCEC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Mar 2024 22:28:29 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5688eaf1165so3907147a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Mar 2024 15:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710541709; x=1711146509;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VKMrVBH/fNSeezyhVeqSE7P3QRxBY9UAa0c3DLVNqYA=;
 b=NLGtc+S8zjSyW7B/yXcsPgZFJC0Z2Po2jM7dLZLIh9BUuNIyaO70Sxkm6RKvZUZQHl
 BI62rlUvtbMQTcJ23aoRFHarbJq4OCw6+eAv/pI+XDGJ1k56r12E4L3YZ+qTUN6TwyAz
 ciXxoFiC0IcdReBauzqDOGgirI+lgX7CUOrE/aL1OYgXhM5CvxySaD37ODFMPHqueOvo
 zRzDnidnRoEXcTX57WMbCv2oCZHb9kprUr7GAX0GEm5M+CpX8vh/076gdZcgL5pbMmlB
 MtdN7tXfR1qnD9MqzsTwcvAPjrAhkaHXynjQwo36kMuj2SvkIKpOsSthO7wjX6m+yfxh
 PxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710541709; x=1711146509;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VKMrVBH/fNSeezyhVeqSE7P3QRxBY9UAa0c3DLVNqYA=;
 b=UzzIzr/QtlYPId846IlgKWaSaNpbYPDgmLpkAH231POsAxK5tp0kfeTd4p92o02DXo
 onkm0Fp+OPjQWy1uefWg62FoJ2pUZgSk0Rt9GfMVsxKGA5BSd7rTieFqwFw4IkS+qAiY
 5dEV9fOT0jRwORHS/hgNh1yKpkCAycJITtWBVh8Aa6ZGOp6IsdqNwWVdU1SlyOYe7jxE
 Gv3SnaJZr7YSsDDDjpkgCBbsZanMlTL/tXq+pK36d7sJrU4pwIlrvuyTealyisjaXCai
 kATMuMQ5WiusrgRWuRoir9UqgZYoEqlE01zwdYeP5QV3EPbU0ndfEGO+JRpq8mAM8mml
 wbSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw+Btb5LXgTztSriGobVO0oTcKDnIoqxPmkgAye/SzQH8L0EhVsJTM63NFE5xbhcUmvDlpoo6JWgtUe0MnEXNfxDzAeJOYaC5AtnRKhMVJg7gY1JDn6P8y
X-Gm-Message-State: AOJu0Ywl6SPwLuwU45UMXVXrnqQPJmyDkDzHWTP0tx8MExuLdU3lF11r
 SbgptOB/YMMxR6MVbz08R698bTlb1MY3ANKnZ93PPKvyt/ya+VcJ
X-Google-Smtp-Source: AGHT+IHMiOXqAu3IOFZbWybq/E7AHBFjYPqnN6JICZlEg0O6rLl7kC8XY7jGhpfuWwf3jwEHz5Vu5g==
X-Received: by 2002:aa7:d792:0:b0:568:231e:31dd with SMTP id
 s18-20020aa7d792000000b00568231e31ddmr4054551edq.30.1710541708964; 
 Fri, 15 Mar 2024 15:28:28 -0700 (PDT)
Received: from bhlegrsu.conti.de ([2a02:908:2525:6ea0::f845])
 by smtp.googlemail.com with ESMTPSA id
 el9-20020a056402360900b005684173e413sm2039833edb.72.2024.03.15.15.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 15:28:27 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: 
Date: Fri, 15 Mar 2024 23:27:46 +0100
Message-Id: <20240315222754.22366-1-wafgo01@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 Mar 2024 07:54:20 +0000
Cc: NXP S32 Linux Team <s32@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Wadim Mueller <wafgo01@gmail.com>,
 Swee Leong Ching <leong.ching.swee@intel.com>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shenwei Wang <shenwei.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Johannes Zink <j.zink@pengutronix.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-clk@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 Andrew Halaney <ahalaney@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Linux-stm32] [PATCH 0/3] NXP S32G3 SoC initial bring-up
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

This series brings up initial support for the NXP S32G3 SoC (8 x cortex-a53), used on the S32G-VNP-RDB3 board [1].

The following features are supported in this initial port:

  Devicetree for the S32G-VNP-RDB3 
  UART (fsl-linflexuart) with earlycon support
  SDHC: fsl-imx-esdhc (SD/eMMC)
  Ethernet: synopsys gmac/stmac. This is based on a patch series provided by Chester Lin in [2]


[1] https://www.nxp.com/design/design-center/designs/s32g3-vehicle-networking-reference-design:S32G-VNP-RDB3
[2] https://patchwork.kernel.org/project/netdevbpf/patch/20221031101052.14956-6-clin@suse.com/#25068228

Wadim Mueller (3):
  arm64: dts: S32G3: Introduce device trees for S32G-VNP-RDB3
  net: stmmac: Add NXP S32 SoC family support
  dt-bindings: net: add schema for NXP S32 dwmac glue driver

 .../bindings/net/nxp,s32-dwmac.yaml           | 130 +++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   5 +-
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 arch/arm64/boot/dts/freescale/s32g3.dtsi      | 352 ++++++++++++++++++
 .../boot/dts/freescale/s32g399a-rdb3.dts      |  57 +++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 drivers/net/ethernet/stmicro/stmmac/common.h  |   3 +
 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 313 ++++++++++++++++
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |   9 +
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.h  |   3 +
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |   5 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |   7 +
 .../dt-bindings/clock/nxp,s32-scmi-clock.h    | 158 ++++++++
 include/linux/stmmac.h                        |   9 +
 15 files changed, 1063 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/s32g3.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
 create mode 100644 include/dt-bindings/clock/nxp,s32-scmi-clock.h

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
