Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A49BAB48AC4
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Sep 2025 12:59:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC577C3F956;
	Mon,  8 Sep 2025 10:59:13 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D629FC36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Sep 2025 10:59:12 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-45ddc7d5731so14333785e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Sep 2025 03:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757329152; x=1757933952;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M/o3gVX4A+pC8uV/C9zqtdbM1sj81BgITs/nnRizczU=;
 b=RvL/Q/RUjYaMZCIP3+vOTwV47wzWlF7qincdIzYCuMks2UmImOMaGIrRXvmMKaONfy
 vZejPtuUYguNHm4K15YlGqgwEZa6QuhtulGiPR3PSP0rBzvjYkQx21K8jlkXiGZdRzBq
 mtMhkpMVfLP8xdusvSO/hvlm0LUquSA53eO2u4Ja7aEAh1+3AxU/VsnDQYPKs873R3M0
 qf/y48pyDRccRlm8dSD9M0CdCIlkDuYH9mlDkQnGmiaDzJwTACGWpfsptFRC29+gPjxI
 1vEX/CxRjGGbDD464zGDwTxY4DPtpeDmcDA5YdjQ8zSvnTW5pryZvyR69Mg2uFGwZTqo
 Xiiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757329152; x=1757933952;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M/o3gVX4A+pC8uV/C9zqtdbM1sj81BgITs/nnRizczU=;
 b=Mal0rNljPHLlFOEBXiX0iKOCbSFYq7o5ShVLqn2V+AST/YxFKhgsrcNTfyprzFVx0R
 Ly1tqpBspSjE3R4/woB1+v1chjfxtZUF0KcLd97pF5wCFb51gG6PoXVDNBjL+DWO6ZdG
 YER2ObJI5APcDOb94vUKvbZ+ntzMitf4TWaXtsVkEJBXhiUxmHvW5hCFcGEQlT0wMcuy
 n+lnS3L2J+l++yE+wVNxIDtb8s2PNAN3SmOHY3Fuv7uKalWhpP2DyX7GtmHbLtljsNYj
 Fux7qzN4EHu6JO6DN2piIh9357DPuOKPxZOqlzBSI+hVtfAq+K1GNB3TGqPcafaE5ejJ
 k5GA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3DToZFHHyF1binbtgxqCOhydv52XD6ISUHQVaBoh24Jie9Kr/MvCODCd+hoOoOxFjajHBrcl4pLK5ZA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx2FWLOBH2PfWOvazqVJD91UuytiYvevrDPFdrIR8m0S5GI/k4r
 N1uVFXC4VZifJC6Hjygppm0PZdUFsKcHMrZ3+Mbi1Ir7Av6xku3sFL5J
X-Gm-Gg: ASbGncsjq9s1NmZN2m5JE0r7IoGA7SxHIvLrOkdO9ymgM0V7piazuaM4ZgaUUGb+HrS
 3a3qjSuspLHFtmc9SxvUnnEoo9Kn7FRjFDhJjWojhh+elmFOBAhSrkO7RwflZGnUigVHArYXOhP
 v7DGsJszHvza01Tq42q9T2s6RGxfSrwNiDeLcdqh8JG0H5IcGGCXm/V8skxwh5upKuSTxkKvmL1
 /QM7Qk/8twIyp3BbudJRLtXf4Tmclbk4929ZpyaqdAgIu5K7kOpxVRfo5dV9khsGo/qjj8LcKnC
 v+hgHd6mYR77HWCPRFoZik5SZDdmGMF5OtrddvQMlQdmzqfPlV+neV+hY8tgrCDi2/Snt1PvVo7
 N3u2LxJhxdrX2Zd90EJ8Mtad3emllwaBOY6GVZLFHoX5IVrq8OyL2pqRnqg==
X-Google-Smtp-Source: AGHT+IG6IGAiVacXOQNaZCh79TsdsAnmzFtfGBHM8HXzbwbzvmmNbEzbLXTJmKcec+tTtlvN5FexMg==
X-Received: by 2002:a05:600c:468f:b0:45d:dbf4:888a with SMTP id
 5b1f17b1804b1-45de6da472cmr20141115e9.25.1757329151701; 
 Mon, 08 Sep 2025 03:59:11 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:393b:4605:1f6c:eea1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45ddfe0b654sm91063195e9.3.2025.09.08.03.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 03:59:11 -0700 (PDT)
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
 Russell King <linux@armlinux.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Mon,  8 Sep 2025 11:58:58 +0100
Message-ID: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 0/3] Add GMAC support for Renesas
	RZ/{T2H, N2H} SoCs
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

This series adds support for the Ethernet MAC (GMAC) IP present on
the Renesas RZ/T2H and RZ/N2H SoCs.

While these SoCs use the same Synopsys DesignWare MAC IP (version 5.20) as
the existing RZ/V2H(P), the hardware is synthesized with different options
that require driver and binding updates:
- 8 RX/TX queue pairs instead of 4 (requiring 19 interrupts vs 11)
- Different clock requirements (3 clocks vs 7)
- Different reset handling (2 named resets vs 1 unnamed)
- Split header feature enabled
- GMAC connected through a MIIC PCS on RZ/T2H

The series first updates the generic dwmac binding to accommodate the
higher interrupt count, then extends the Renesas-specific binding with
a to document both SoCs.

The driver changes prepare for multi-SoC support by introducing OF match
data for per-SoC configuration, then add RZ/T2H support including PCS
integration through the existing RZN1 MIIC driver.

Note this patch series is dependent on the PCS driver [0]
(not a build dependency).
[0] https://lore.kernel.org/all/20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v2->v3:
- Rebased on top next-20250908.
- Made sure STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag is
  always set for all the SoCs.
- Updated Kconfig to include RZ/T2H and RZ/N2H.

- Fixed commit message typos.
v1->v2:
- Squshed incerasing interrupt count changes to snps,dwmac.yaml into this patch.
- Dropped un-necessary blank lines.
- Switched using "renesas,r9a09g077-gbeth" compatible string for RZ/T2H
  instead of "renesas,rzt2h-gbeth" and used it as a fallback for RZ/N2H.
- Updated description for reset property.
- Added pcs-handle property required for RZ/T2H.
- Updated commit message to reflect changes for patch 1/3.

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/T2H and
    RZ/N2H SoCs
  net: stmmac: dwmac-renesas-gbeth: Use OF data for configuration
  net: stmmac: dwmac-renesas-gbeth: Add support for RZ/T2H SoC

 .../bindings/net/renesas,rzv2h-gbeth.yaml     | 178 ++++++++++++++----
 .../devicetree/bindings/net/snps,dwmac.yaml   |   9 +-
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +-
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 108 ++++++++++-
 4 files changed, 248 insertions(+), 59 deletions(-)

-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
