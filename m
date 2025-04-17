Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE2DA916A2
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Apr 2025 10:41:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82760C78F61;
	Thu, 17 Apr 2025 08:41:58 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 816A3C78034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Apr 2025 08:41:57 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so2533535e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Apr 2025 01:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744879317; x=1745484117;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DXozyqUJ9d4xtCCzMWxO4QOFhe8g2i4PdCmKZX1X/X4=;
 b=VCgQb18IBElGaTsug6JxkolbYz+Fx+tYyImYOrAaqv3yw3W5XVtKtHRu2GibQLRgCv
 iJ9YXMeypN0HOpeuFLhealrOCUlurxuBaX2wfgmjsvDsB7oomExtEAmeDM7qbdUMchQn
 KpukntapUEIkinjdO7MiU89RwpIRB8NF7TCXaefK5mbWthBN4ei2q75YwssEA44WRbjE
 QXQlEZzRuZL3ysSPe3Hdzx/7FHMBwXfJTc+0QJLG0hU2rZBwnMBsWdYbUSnb4fsF3KQ6
 nSiWJhZMwLBG71H/dW/xnMspcOyJ+ORHVBxCZXEapD75Gr5qWABMXcxOUFiGnSW8QeqH
 I5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744879317; x=1745484117;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DXozyqUJ9d4xtCCzMWxO4QOFhe8g2i4PdCmKZX1X/X4=;
 b=VkewJ+hmgh5WBBle2ahji3W0HH8Wv4oxVmG2erDCVIKI7YMhWR+GdnGyeQbLPQe82U
 53g4dGinuT8XETNtxuzoQdJ7CeYAPWNejJ3d30LeJbxdkQo9rvSOsQwD3jdjtZr+q/7J
 lYaOq+JNKPicDdd68g2mBz+qonmeeQC72ZEssYK2E3e5aS2TMrDYemE2duzlbz8ZOl7R
 DDyAeGb1g7UZ1CfPJ6eDxwbmF9cPkp7l0Hs/4g4kSe1ER86q3dh4s7X8qfbr0+okDyqg
 OB6TDkzDGCoa9KkUbqaUKMZ2ElWU8/CogY3+XMWHDq2OSWPkaHH166VJIjNYVkiPxvAp
 c8lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7zyHOMN6BMSWRFVHDkaDrTQQZR+C8/ZQT9B6SxIpkfTVb7ITeLbxVdakNP7dPKuBQivDc42VdkE3F+Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyInjXLJyTM66BFysOLYW8R32YwX+5m2+HX/3+OQiOE/6J2ecx+
 6Zn3dkC++S8mYqYsVLPTmJc+NC/rgfBYe9gyvmV5oMP44ajDFdoK
X-Gm-Gg: ASbGncthc/CH3j4X4JJWEnBQ1i0+3gA7YAXWywH8WPPLY8vXHN93iW3g7STAavJOqRv
 pEb0OdG3C6i7l9X2BrPecQnApaoN1ls4QTeA1dnzJnHv2Ir+VEBwN4apNglsupQCmkm5lC4EzGB
 Of6gARQeOoHfbEdJwRHzNbA4YDRUoNwegdTDCPOIzYz9h3NLk0FVKPprzM4Sq7ampx5V42Z72hG
 UyLFgQYCiPtcHzF3g1eka2cpCdystWzQb7hQuDf75ZF/MCp9s4vuXUzhBL6R7xTS/2u1rYiBiOE
 3F4EBFvxgFVmPoQ99v8BpPeRV9um2cmSspoigaP3q+3t96Sokj88PLkF5Favc2Hk
X-Google-Smtp-Source: AGHT+IErRiAS0z3JNyUleWBdVl92EfrzdQ3pXN9rJF3OKf8o4ZU/wUUqjoSjXJtkv9PYKHE0yGdVDw==
X-Received: by 2002:a05:600c:b8c:b0:43d:94:2d1e with SMTP id
 5b1f17b1804b1-4405d61c914mr54409795e9.13.1744879316325; 
 Thu, 17 Apr 2025 01:41:56 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f0f:d684:f4a:34e6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96cf1asm19657712f8f.39.2025.04.17.01.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 01:41:55 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Thu, 17 Apr 2025 09:40:11 +0100
Message-ID: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v8 0/4] Add GBETH glue layer driver
	for Renesas RZ/V2H(P) SoC
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for the GBETH (Gigabit Ethernet) glue layer
driver for the Renesas RZ/V2H(P) SoC. The GBETH IP is integrated with
the Synopsys DesignWare MAC (version 5.20). The changes include updating
the device tree bindings, documenting the GBETH bindings, and adding the
DWMAC glue layer for the Renesas GBETH.

v7->v8
- Rebased the changes on net-next
- Fixed return value in renesas_gbeth_init()

v6->v7
- Rebased the changes on net-next
- Added Reviewed-by tag from Russell
- Folded contenets of renesas_gbeth_clks_config()
  in renesas_gbeth_init/exit() as suggested by Philipp
- Dropped regs member from struct renesas_gbeth

v5->v6
- stmmac_pltfr_find_clk() is now used to find the clocks
- devm_stmmac_pltfr_probe() is now used to probe the platform device
  and dropped remove callback
- Switched to using init/exit callback to configure the clock
  instead of using the clks_config callback
- Dropped pm callback
- Fixed checkpatch warnings
- Added a new patch to update the MAINTAINERS file

v4->v5
- Rebased the changes on net-next

v3->v4
- Fixed maxItems for interrupt-names property
- Maintained reverse christmas tree order in renesas_gbeth_clks_config
- Returned err in case of success in renesas_gbeth_probe()

v2->v3
- Fixed review comments from Rob and Russell

v1->v2
- Updated commit description for patch 2/3
- Updated tx/rx queue completion interrupt names
- Added clks_config callback

v1:
https://lore.kernel.org/all/20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and
    'interrupt-names'
  dt-bindings: net: Document support for Renesas RZ/V2H(P) GBETH
  net: stmmac: Add DWMAC glue layer for Renesas GBETH
  MAINTAINERS: Add entry for Renesas RZ/V2H(P) DWMAC GBETH glue layer
    driver

 .../bindings/net/renesas,r9a09g057-gbeth.yaml | 201 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |  25 ++-
 MAINTAINERS                                   |   8 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 146 +++++++++++++
 6 files changed, 383 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
