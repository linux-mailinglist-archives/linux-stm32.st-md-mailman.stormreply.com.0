Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE493A8B6E5
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Apr 2025 12:40:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8592BC78F83;
	Wed, 16 Apr 2025 10:40:24 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF582C78F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 10:40:23 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-39bf44be22fso4266856f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 03:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744800023; x=1745404823;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mv5JrbOdws3HwC8g5+UOFGbdPAGiQtrVxdnxmWTTx/I=;
 b=gcXbxwC0wamRvHGjek4oPQgrtPQi4X99+z7LjbsZc+mckZq7ssEyPM9Y0cJdeq85OV
 IAKYsl6hnUsPzPFep+MAnyIM8K5FzSucaD//TeCugHo+7KBBT5siOJ9MIT9k8eyc4XYA
 3AyF4h0nF84oKOIrFaFkp7K9MgfnRIodpoZ2Te7jan0OmMx4FVrs2cEHduy1hymVmWY1
 LtUNjpWsTtqQfx3R3mRH0fk6lZHKRKKVM9SL+QqLhoLgssLFK67yQ0ldWOtRyHONsQak
 0IfkQDuOtCCkZn5292TU6rhQPGOOZsIHmif+y3iDj5zLmQTRFJtY7X52R2/dPVK7afci
 wzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744800023; x=1745404823;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mv5JrbOdws3HwC8g5+UOFGbdPAGiQtrVxdnxmWTTx/I=;
 b=dKZ/RxWZ8JnOorsymm0Bo786ntYfmroisDqgKWc/kzYr9DP79TdS5vyFNMsUjcQNLA
 dgnFJLV7hIEkkrqmlNNBXk3XeKskoZ0mirVPagb0JuYgrZPiKDXQK/jzwyr38bAjwgmV
 lgdB/FYP2mvmZ+nN1tsETRWKsrM6b8xXM3QDsEdYXbe+/rCl4v/GeNNmG4CLtvLRkJhl
 1Y7kIi0Hky3ijXwfB7CT83cY9KeS3N3dAIheCRJ5W5H4hbauugcJGPr1+D5Q94UAC7Bz
 1re5pQ5lEDTyePi9rVY13bfIprMWRnGLKdmCcwv/b/Y3uWFMnlz01V/7wdEeLDzjZtyF
 oJqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqwTrHsR6bcs7WoEAjvAyaM3wUY8MpW+b46ZFyuGczdzMrYzpTeR6S9OoUqKgHPiubayBmQQlgjJtgug==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx5QxvE8urMO6Fj5RDeCGGklZP2OEvezcSgyd8Ylt7Q1qGRPGsG
 dvBF/7YCUaDZbUNS/kpQ7YyCTGqQ5LIV2p35ws+ubUMt4YEEsJqS
X-Gm-Gg: ASbGncu66LfXeUhicA4gBpGkO8iRKD2JBiqh4+5zmqkN7SAE1MPmenk50IDijN6jC2D
 x7EtoNt/AGbVbzr7JZu/3WW6dIDoh+UR7NbTduNn4jp6MeMIwYglo2O8cCXlLg/I5qRCBLkVWRM
 3GTqbAYCxhTAGufbPpxnYKUrv0FjgoYe8WmwgRgu9AaB8mACZEzWznwUtTfEU0x2lP+MwVnS0Ma
 PdSWyJUeywK5Si6G0lV46R2y5NjvYtcf/FOwck4fToEpKhNYNkqHJrkmYrFFdNtBracfZ6qYoxF
 Si7Rdaj8tJw3P4C2fGV38KrX4twn46N/FxHynj6tVeCgVd2U0yVtcc7ynLEbG3K65A==
X-Google-Smtp-Source: AGHT+IEmC1A8qA+sRExHfTeMoNJfkOFZQJ7/LGNEZ1U+WdFIhRlxg60Mb+7It31CYcz1Dh5JA30pqw==
X-Received: by 2002:a05:6000:4312:b0:39a:c9ac:cd58 with SMTP id
 ffacd0b85a97d-39ee5b1d601mr1003925f8f.29.1744800022869; 
 Wed, 16 Apr 2025 03:40:22 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:b4a2:e121:10d6:ac54])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae964089sm16824975f8f.15.2025.04.16.03.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 03:40:22 -0700 (PDT)
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
Date: Wed, 16 Apr 2025 11:40:11 +0100
Message-ID: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v7 0/4] Add GBETH glue layer driver
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
