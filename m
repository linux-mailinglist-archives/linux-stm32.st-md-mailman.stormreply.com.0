Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3498D3BE72
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 05:36:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FD4DC36B3C;
	Tue, 20 Jan 2026 04:36:25 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com
 [74.125.82.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2B6DC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 04:36:23 +0000 (UTC)
Received: by mail-dy1-f172.google.com with SMTP id
 5a478bee46e88-2b6f5a9cecaso948786eec.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 20:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768883782; x=1769488582;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=29OkNoazPkO3Cz/ca1GMRTcjG5fAIFuxe8NjRt6vIh0=;
 b=h4XN095dYDv9ncxWJlh3UbloRNg5/f9gCDpElm+lFMD+aAWTyNPR2gUeQ4vshs8puo
 h4OQaWlX6hiQZBqxDNfJ720Wiz4lHOti3dnevTKZhlvfHdEwvhDJ0MHOSh3UfO+0QbMF
 taQ1n/E1FEP1KJYxEtkBZ4fOaZhekvevYoBN57+v6W5qN1RHYSpwZgpX76fPG7nRAN8X
 ZR3bmN8I1H1ltoi2TjdXKuGVZVAPMysZx2DZaXFZxqjQT3I6LWNy7Bq5yhXlJj3uNWXG
 m/Or5Nssztq8U2EN+OOQHtNJTCxDvVJ9bR28dIkHjxWdqa+jMa09FNWDukX+7ADfp3ot
 DaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768883782; x=1769488582;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=29OkNoazPkO3Cz/ca1GMRTcjG5fAIFuxe8NjRt6vIh0=;
 b=uUYpuqz6RICx4efSElx09OBn3vgRecrNW59ZEXG4Hgk2UwKQB0OUXIBWr4cj9TTvxR
 W9JWzjSHhU5hL1hkS6LrUB4GMPcxvnJk0SdRePCR1ey1Uq6RdkGZbuflahnEXmpUqF40
 WIOPO5g9mS88sEuKp5dJd3X9Rc4V02d/dyeF2zmNhyMjljb8BfS9L+llgYNxct02y+Iv
 wk+3nXyzd++KdIIK2vtjoU2yJOAqDsbCU4rPie8VLht9vnC8/UdU22zthxO1WogNlb5Z
 pB4s8L2lremsENP8OzELv1Fpy8MARgsJ0UCb2OBGyox2oHbbNNDjyZi01/0eoydera1S
 PHdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYG+MzUdLNDR041bTMYFEqfNvw+kxY6lE/XOm9hjZYKsDNB4zhN6qxy1H3S21Asowsvi540owtp8DFdg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxwaZOHQ6yQb7OhL+tYquynfJrxdzOwB5CgYnAsIWA8IFrwyhak
 MFgjVqchTDJ9PoxRHwhY1wq5sHo617haM/7HBPHeEdG3h2Nb8C1vlxPD
X-Gm-Gg: AZuq6aL7gITFosPzhctTizGohJcnRzA8mE6ae8x832smd3cHxFQGoAuiYmcilh7dp+L
 3A6GrIR6UrkJbZgnRigtDHJJsamHtm6BMgmPr2btK/FBlhHzczVUJSyvR+40kS7fFnU15IeYW4v
 H8tl8tqdfmTVib5r1y/cQp2nIrQjb9dG3sYY9P78eGghYX6qTBbKxMGh3Usn80pHvvDNfSuNAVr
 P02F+Vt3Kw+A4wYA973F6zDruGWly8sNUHc6ctzvM9K4yyFVPgBLOxRPufEPZ+KH11rXieSRAXX
 OItjhTQ5/kfTedOFgdw09j5EqRkSEsLr95eIkGpOB2obqE6Fv5TCwLW+onXQP5IFbJgqUBcJKEH
 gu1h0Y7e4Pk40Evh/MHukXsY+xblAhTks/D5zR3BZPybI0GC+8rjdAiIxMx12UlPoZFHjfs9fJ8
 nFGzxtcao4vA==
X-Received: by 2002:a05:7300:a188:b0:2b6:af85:dd29 with SMTP id
 5a478bee46e88-2b6fd3a7b8fmr363879eec.0.1768883781926; 
 Mon, 19 Jan 2026 20:36:21 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b6fba43c3dsm1271369eec.0.2026.01.19.20.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 20:36:21 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <ziyao@disroot.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Chen-Yu Tsai <wens@kernel.org>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Tue, 20 Jan 2026 12:36:05 +0800
Message-ID: <20260120043609.910302-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/3] riscv: spacemit: Add ethernet
	support for K3
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

Add initial support for ethernet controller of the Spacemit K3 SoC.
This ethernet controller is almost a standard Synopsys DesignWare
MAC (version 5.40a). This controller require a syscon device to
configure some basic features, like interface type and internal delay.

Inochi Amaoto (3):
  dt-bindings: net: Add support for Spacemit K3 dwmac
  net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
  net: stmmac: Add glue layer for Spacemit K3 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 107 +++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 224 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 6 files changed, 348 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
