Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 351329FA8CD
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Dec 2024 01:59:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C231CC7803A;
	Mon, 23 Dec 2024 00:59:27 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93AC7C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Dec 2024 00:59:20 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-6d918f066c1so18478986d6.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 Dec 2024 16:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734915559; x=1735520359;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rZiA8+8cgK1p5p7ZdtgnD9VuQej6yYU4CGShpBV3y6M=;
 b=DxpPM3oRy4a9UYiDcCCZzY8OH9vfrBCFrrT+5BnXtcHtP3IYJ2FWCx3TM6/xIul//z
 h9rn4Vd0uYIJ7SoTuEyryKGf4zqFEWslQxvulCJAscV/dU7lDf7zW91721/CWF9WVuLW
 D0SiO7X7halOzpB/iVrU7IMmKOeFkmfAEs8vPKQiCp7c29SbMKClmTndPnQkgmLQTN+y
 4BxqpbOneKvUBlaC4giej/CMmGU27fAjvcIU+hgk3o8oBilfgJQpIo2uPgo+AjgbfIpE
 MzYsBqM6EbKv2ZjmQX0wP+3FfJ8gi1L/hR8zS04AUYU76aifX7AMoA/mgMQxnBC3q3MG
 d4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734915559; x=1735520359;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rZiA8+8cgK1p5p7ZdtgnD9VuQej6yYU4CGShpBV3y6M=;
 b=p1Rs8Pl+G4ixEJYsF1fN85GqVoZfPZBSV4CjM/R2E86akd81ZaoZ6TRvzEoSubY1Ay
 dDe+4wJW2IVM3xY6HXvoYnK5QyL/DG54kQYAdzxi96Kz/HhRwpDiwSYRsvB7hjQb0rIi
 ru9MuDhoV05YB8g2yndfBZ+ng6iTqm1gfr1U5xKItobP2VVfdKnSnK8aVLNKzdMA/FQ5
 7EOqUXOD3etQy0J3cIqkGx7kTlaVZMK8r2emjH9PEDWkiP/ez11dUz5V3vxJCvilH3Py
 kk/Gw7MBLNqmZE8+SzcaLyBSkLZ3YURybmDdSBPBBzRNyIvOEhRRlUtOTAFw4nBQpiG9
 Gisg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaZq68u4ObD+CuBpMJ1mfiIURhyCoN1nTl5H6655EmAq2fnARhHTOy+AFQR9iQbqIKTPvq+vwUiyd5LA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw+IQjvzeNmOw7dTuK503V64qDJZSaku8sX/hYhnzhFERsyRyCC
 a6hyQBgKv/X2yQ8NhopneYOTH56cD2gvRj2ke4a1g10GyA2O3D9X
X-Gm-Gg: ASbGncvtYh7HP+JWFVLy8yBCUoAqk0TCNvB11ICI+SgEKNCCYxueGIrkzRmHcmVieVM
 vJCPHHDSfnYvpfnJ7TfhJL/aZS9FYUYYI8FHKSZ6d9e+HZItdGnuAZI5WC21H1QHEmJLRNWfEWM
 GtBo+ckLMaeY77xqtsFFvWEnJTcim9XThTvuB23J2a7Cyem3piwjE4UM2t2rDsvQOl0yGxgqkru
 zWoNT/1UdYj2QMCEghRGC2GTDQi9PpT
X-Google-Smtp-Source: AGHT+IHSkClTiIOMU6UV3EvrSaxtK6rioCiVEHPiLA/vc1hX5NvNNm2L1qNaUclIZVtTYbzu6LhDcw==
X-Received: by 2002:ad4:5ae9:0:b0:6cb:ef8d:b10 with SMTP id
 6a1803df08f44-6dd2339fb2cmr222084936d6.39.1734915559348; 
 Sun, 22 Dec 2024 16:59:19 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6dd181bb4b1sm39250996d6.78.2024.12.22.16.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2024 16:59:18 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@outlook.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Mon, 23 Dec 2024 08:58:36 +0800
Message-ID: <20241223005843.483805-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 0/3] riscv: sophgo: Add ethernet
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

Since v2, these patch depends on that following patch that provides
helper function to compute rgmii clock, As for now, this patch is merged
in net/for-next
https://lore.kernel.org/netdev/173380743727.355055.17303486442146316315.git-patchwork-notify@kernel.org/

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


Inochi Amaoto (3):
  dt-bindings: net: Add support for Sophgo SG2044 dwmac
  net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
  net: stmmac: Add glue layer for Sophgo SG2044 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 124 ++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 105 +++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  17 ++-
 6 files changed, 257 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

--
2.47.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
