Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 290F6A7DD02
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Apr 2025 14:03:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D009DC78F9C;
	Mon,  7 Apr 2025 12:03:27 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1208C78F97
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Apr 2025 12:03:26 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3913b539aabso2434534f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Apr 2025 05:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744027406; x=1744632206;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SXx2rv9zT35RkoqKlgbg0mm3kdEQQG79f5HFBb1nhgc=;
 b=mythzFVvZJNkrRtjIPBvS+pYn/Gjlk43ee9GmlokChUoM13km39KsErw2MBPD8tknG
 gYGaUMD4TNelc3Ck+wkFtqun7pbXewA6BBsKDC+D6rQF3nKgeIlflY4sUS7asjq2dn+z
 x6+cnCzNSw3ir0pB1IcEOFPMuW36bHKoGd+cmzFclqB8gDltThn9cstNV4fNxtDXF6+f
 dPmLc6QlhoCXfJnBMLr3dfk+ihot1wd7BMnkpCfuNXqPKCUJRUrq135++byJc13KpNKx
 YRHn7fMZNAKuGAPJydNVJ9BqXI2usrPrI6Xsc8my5/st8lcKvyY7pN+erwXOwt8Vae1j
 EB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744027406; x=1744632206;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SXx2rv9zT35RkoqKlgbg0mm3kdEQQG79f5HFBb1nhgc=;
 b=GwZ7FiiQBEL+i4FnaGMuWcIHOnxGmkOFhjlUMj0tmNqvHyT0X/2JGrnRPUq2C++llf
 NjUx8HC8gShqXn/6BjNBJqEK9odv/VrxW5ydDtfDDnJW4H3cvS6QPnVmQhtnuuSMZn/U
 AzpK/6e0UsiED2zIfnAGtzmknc1Ad9wbHAKwBBnYYKh4d4hzhZp+s/wPSYsC6qF/EAKX
 VnFJ/HGBjFBbrpHdRiZZlD1vWX7/awxwKhc1mt1vzNQwmqAka/y6YASj9iB9azeW3K4z
 m/BFceskjD1iQMmWzPYbM2dbjh1Fsr6zJKFsq4ezLy8E/MefxDorsTkipEcXQhQEHTdh
 Ctug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcVszlgvSJps+zm/n6x4OhP25oC5tUiJoLC9Gz+IyA3au3hyFJzk8YduG+rvdjbCTe+vTjMLVdW9Rk+A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzFGm6Ij2TgqJ/cexmNB8NhlijwdmCSKeJbeGkEhEBWEj8jF8Z/
 XDLrewsk8gCQ7G/0q71fwe1knmlbofS8PlJyyxy3YwnZDEukNyy2
X-Gm-Gg: ASbGncuFQRHNIB1UdmfWuVzmHoIsmD2KJuB8fKQljkRhMpfnscB1lalir8BRiNVV2Gl
 WWqOQS1GdK/X1Cl5uL30xKF6fhyQSTimssC3ffzAynLoap3fHJHSBMWpFF3cNAEiorf2c4QZ/f0
 cB1cGIrBA0iYac0G1cpMW8e3Qwvc7YFwPUs9UPp+0Y2AeHUpN+ZgxVkYmuojALXGajoD6WhZcsM
 0qLZUpSDh/F5/vbE4y5jPZXQQuZgehif/RATiAv52xrY4l/ktLTrJTXQveepftZAxkNr2HZA7TQ
 pgeF+/BnSCGU/irKgRp+W4fzi6d/XfH6zFPyZw3x0rQtpZBqOUpVFNmgbQ0bzkxqrIrm/R6RT6p
 RN0f5
X-Google-Smtp-Source: AGHT+IE37bdrVUeb/XqXM/+1lhsEdri9+eE8Oa4q2uNN8bo1IG+kwjQxWy1YJ26YTiId2TriZ2pQ3A==
X-Received: by 2002:a05:6000:248a:b0:397:3900:ef80 with SMTP id
 ffacd0b85a97d-39cb3597eb7mr10077348f8f.22.1744027405651; 
 Mon, 07 Apr 2025 05:03:25 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c3020d943sm11986976f8f.74.2025.04.07.05.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 05:03:25 -0700 (PDT)
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
Date: Mon,  7 Apr 2025 13:03:14 +0100
Message-ID: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v5 0/3] Add GBETH glue layer driver
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

Lad Prabhakar (3):
  dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and
    'interrupt-names'
  dt-bindings: net: Document support for Renesas RZ/V2H(P) GBETH
  net: stmmac: Add DWMAC glue layer for Renesas GBETH

 .../bindings/net/renesas,r9a09g057-gbeth.yaml | 201 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |  25 ++-
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 165 ++++++++++++++
 5 files changed, 394 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
