Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 809A0A89EB1
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 14:56:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F33FBC78F68;
	Tue, 15 Apr 2025 12:56:49 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 780E2CFAC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 12:56:48 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so44974835e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 05:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744721808; x=1745326608;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W5pt4Gvn4yUb3QxIoLfuNe/1WdZ6d8gxyQp1HcF2MJg=;
 b=AxzdryfIAJMiQ6btOR7gaAIpfmjDYCUa+rhnyd9eWNeWP/JoUYh7+VFPDtOBglfBN+
 fDjaO+NhG+BWmxmRNaCyCzrxDgxVWzCLM1UtFbmJfJU06uElYljvILKmQ0rcRf+6uV/b
 /dQ83TqdolNK10pJGGI/6T/bxLYJ0C0j4r3eQEEOKvXIhA+Q8AEaWb7Sni6h8K1VgEiG
 4DCdndS2qTtZay3WJyeaIcEUfdNC9KsHF1iTiTUFWNJky3ODHqJoTwcWeIjrxmu+BmTf
 0MN294bjyr8nzQNx0cp76IRX2D0ywP3Cn1vN/6TiNKnvLlJa35TAc1eWl6j6z/kGTWqz
 NLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744721808; x=1745326608;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W5pt4Gvn4yUb3QxIoLfuNe/1WdZ6d8gxyQp1HcF2MJg=;
 b=UdNyKaAybocrtjY/sbARuQTBFnFlAg3uTQBQ1mzpjwtkNCnMzf8TkH3vg7INsRL4bQ
 LqJ9aVmqud0vg1P/ktIC+cJJWMBS1Cqj2O3KYJg8oObT1WV66fHbced//uRUL3UrCR6A
 og3mRrE2FQw2XIttoA8xTcruc91wxMomxuuF5+ZmeAy4nb0HJ5X1ZIc3I8nrsa7lSMYW
 OM3m4Cq6XpmU8rWzfmLkrrXAk6wAZrplufG5XIKG/FTlxUt9FNV/s0XNduSlWe0DiOln
 0/O2u+giVNn3TYHh1Zangndy3w+6q2aWfaiyFKR52XlD3mHtU49QAi74H8KQO6sKiFT0
 Ho0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXizR299qcYlqQ1RraNmd2dmwyXSFxXo1hko7u/XoYC72Tgk+njGTnS08SJp5UWOOoATJ+rN3C8j/qx5Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw4lTNS8bXtoA4mumxDeFK3ft3//vav5KUb5Ij9C6jWJI0yJNd0
 c64nykYw74fkMmZK3kI+nw5hW/XoO003RPswECWTjSdiGvK7ts0a
X-Gm-Gg: ASbGncs9FEob3KDR2I++CwjjP7eJT/PhJH5GqKdS14qiu81Xerv9UeE0u/YE9oVQt8u
 JYKDBd1MtXn1uPZDDf5ujtpL8z+fV80AB++ai0aXUvzdCEErd9PxRbbCO1U6z0KY6IhrtsVE4UX
 x2ZUycDJ3fzodrcQprb8OJc9K9RUxRFOrd7oAUA2RQX6csnxV/XNUsu8ieFB9E1yVX2k8kR9HoV
 aeDLgT3E812rrhzOSBcJ5KKXTJZj2JmGK/h3TEmmFvXs/zFFfndCetPAWSnxfxUR1o1kmG9r6+M
 qicE+laiMTLjAfbZYZi0Pb3lkfK3edJcaTTnL1nUXIm6kseojTquMH1/DBmU+xI8
X-Google-Smtp-Source: AGHT+IELhuDdfbIl6mFeNSEZkwV/cSRz10AvfqDx/26kpRUF4jOcOhkse6JnsntGo5yjX9aDqfZTjg==
X-Received: by 2002:a05:600c:3501:b0:43c:fa3f:8e5d with SMTP id
 5b1f17b1804b1-43f3a926d56mr162646245e9.2.1744721807628; 
 Tue, 15 Apr 2025 05:56:47 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1883:aa4:a265:bc12])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96bf97sm13922334f8f.25.2025.04.15.05.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 05:56:47 -0700 (PDT)
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
Date: Tue, 15 Apr 2025 13:56:38 +0100
Message-ID: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 0/4] Add GBETH glue layer driver
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
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 148 +++++++++++++
 6 files changed, 385 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
