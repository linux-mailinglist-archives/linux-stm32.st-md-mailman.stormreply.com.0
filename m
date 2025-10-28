Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D11C122E4
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Oct 2025 01:39:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 811D6C628AC;
	Tue, 28 Oct 2025 00:39:09 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D660FC60495
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Oct 2025 00:39:08 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-29490944023so35366915ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 17:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761611947; x=1762216747;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8s7zFl+2eb3TMAz+jhCE+xRnt2/MEJ1FXnvoxEqZlz4=;
 b=ODnDD9QrCHvTUZFhAGuxxDx+pZ4TzqCnJX/hrd2YTujb0uKker/D3w8RALZafKuTIv
 X7uGL+d5w1vtpN3v/IEAb+NjQPKmFIUVGT/ol2Z6UDw8zYhDLU7XvP4GlzpeRg4tH4rW
 HyzI+N0G6uNiTxvWUSpuZYqNlRYG1xAU9Mg1nLxvR1UrfH4QkcgVpaFuKYFsw1YL8YKV
 MEgrtwjB8ThNkCGGH493c5s5q8GY89yh+1ZPDCod4dl4AgGeVobY9XTRnhJM9J48MyEJ
 uL1x1PaDcyXpMfXyathPc5l/vspMJoJeRrTRDyMPinUcC/S593NDndYoEnV+wQ+W00hF
 GXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761611947; x=1762216747;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8s7zFl+2eb3TMAz+jhCE+xRnt2/MEJ1FXnvoxEqZlz4=;
 b=gFNO4o7/Tpb5h7DF/LcObOgDF5+JfqEmkXQxVfV9eaCt40yxQctS+Hol0evhjb2BxY
 8rCPabD/IiDE6+QWX4jp3tu5+AJuA8+X8Hn4Fgfh0cYBOYRIobdIcq8yfe7QYW10BCxl
 TGQB9VRbxE/Z2rIJWsq9PwaAKqGHEEjkZ4vngT6VDLEtEWFCLEv/Z6TgGW/Z7XZ5B6wx
 jz1L+gvSnR171CvL/3On9/MLcZ2V1owkPkclDSirZAQZp3xMkDF4y+sDrzr43YdBB8RJ
 ByZ0OGiqXZ8BzVc1FK6douuko17A9gwk6iN3tH38STGDkcc/pJ0AcVD/I2fJcU8zp/L2
 +kkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSoKl+kXvW9Yo90l+a2O0U/vrHoYQAzObcnYHPXeS+nGe9blWPMd8H8AVap7VI0Xk4XGDuPqgCTuDMSA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxMHyQaftsqsACDdYAlDTwv5/q7T31XId/4siTPN6JCyF9u6GAF
 o51ewaXP1SOYvIjfsiNcaxieJalZKQUM3smtSxrsj3iUpnzpx9qBNRLH
X-Gm-Gg: ASbGncsqH5deE4CMpqD2UVNtoqmpcqG9KcFLe1Z142Mna87k8utyqB5PXW0IXk71XzN
 QqbZVM0KiPZG/orb9ICS06maXaHou4pyXZjZKa2N/0WxXIOj7Z93N/e+0uzid5MrbtFgMmW4Edw
 Yj0ANCW/zE5FHMTMiXLanlaMWwxuQSNwZV/d+57qAl+f4SyqYTY14MLXlcRPgBuMfRmEvZuVQi2
 SYgVoAWouZfHxGg/88Jv2oOwku3SnSo0dnajukpEwDYKtyTMagQLr7a1iwCciBadNCLr6aN/AJU
 6Ftx7tnv4dIAJV2cdJKL6lTepoTDaaqex/Ktff5Tw08q7hRGc/60HiLW2hweuK9SUtegKXkmQzU
 KoF8fTlTyLIe8idu5cTvKcKja5Nj6KKR0uokmsVbfv71bf4O3wzgxXfq1MLLq3o1UL/pGcY0z7T
 spr38e2Iu9oGYY/z+NADdR
X-Google-Smtp-Source: AGHT+IF5ghXu9jBruY6ziKGQyMSMM4oq3ugUChPGlRqBf0309+0SovNGzWf+rJoqR49uQlRPUDRaYw==
X-Received: by 2002:a17:902:c402:b0:290:b14c:4f36 with SMTP id
 d9443c01a7336-294cb52db11mr21604075ad.31.1761611947142; 
 Mon, 27 Oct 2025 17:39:07 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498cf359asm94353925ad.12.2025.10.27.17.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 17:39:06 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Date: Tue, 28 Oct 2025 08:38:55 +0800
Message-ID: <20251028003858.267040-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 0/3] net: stmmac: dwmac-sophgo: Add phy
	interface filter
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

As the SG2042 has an internal rx delay, the delay should be remove
when init the mac, otherwise the phy will be misconfigurated.

Since this delay fix is common for other MACs, add a common helper
for it. And use it to fix SG2042.

Change from v3:
- https://lore.kernel.org/all/20251024015524.291013-1-inochiama@gmail.com
1. patch 1: fix binding check error

Change from v2:
- https://lore.kernel.org/all/20251020095500.1330057-1-inochiama@gmail.com
1. patch 3: fix comment typo
2. patch 3: add check for PHY_INTERFACE_MODE_NA.

Change from v1:
- https://lore.kernel.org/all/20251017011802.523140-1-inochiama@gmail.com
1. Add phy-mode property to dt-bindings of sophgo,sg2044-dwmac
2. Add common helper for fixing RGMII phy mode
3. Use struct to hold the compatiable data.

Inochi Amaoto (3):
  dt-bindings: net: sophgo,sg2044-dwmac: add phy mode restriction
  net: phy: Add helper for fixing RGMII PHY mode based on internal mac
    delay
  net: stmmac: dwmac-sophgo: Add phy interface filter

 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 20 +++++++++
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 20 ++++++++-
 drivers/net/phy/phy-core.c                    | 43 +++++++++++++++++++
 include/linux/phy.h                           |  3 ++
 4 files changed, 85 insertions(+), 1 deletion(-)

--
2.51.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
