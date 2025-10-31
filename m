Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D57C22DDE
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Oct 2025 02:24:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E414C5A4C7;
	Fri, 31 Oct 2025 01:24:54 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E27A7C1A977
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Oct 2025 01:24:53 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-28e7cd6dbc0so21472265ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 18:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761873892; x=1762478692;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4k5u4IDHa2ldPO/YRgbWN7ExpsWnE3pSTkUg9MZsePQ=;
 b=edMtMlTr8VpmUj1dBz/g1BydG5rH+dD5BarTYWBrBa38P6Ijw+Q94PpN0NplYg1FfS
 QBLSDCtdi9wDwXkfJ1JcRVvtg1hcGpmBJLi1N/CDHRtPlfy1UCPHRboaZ6JFjJZr0/JQ
 B+QyuJa2nrmFs3oKiw9N1vlsS9myI77JOPr72V9G8B82E119UtFWm30WXEB9BWacNbKL
 X8XCGpj556H9R/06D3Yh8lIxM8PDEi2rkUun01toTUA1HnDKSsb2ZziB1psvombTr++H
 LDiisOHwm6IQ5NtJmxIR2VefeFtdLFxPBzKLgYPbpWjLjFTES+GcQe5t0gr539Ip6Pv5
 WPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761873892; x=1762478692;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4k5u4IDHa2ldPO/YRgbWN7ExpsWnE3pSTkUg9MZsePQ=;
 b=tNpjLroH1CKLW4in/VWoibydyTIyLygnPkZDKyq+LQi8S8x5JP05g/Znby+CHjUq/z
 24f73dmM5gHQyD36gqjvlU07M8qlUEcvYX/MoRlwFsPPVCdrIWkB7ivFetLUsgPHyr5p
 wInJzJzvYC4PjdoHaJNxoNOLVoEKCHOJDFY58D2Vk2mgsMDTu/M7ZbQFKr5jjjzhnwzu
 6ZgeaCMnfIGeHQO1yBKt7Q115n5aBF0n/obGCr6Uovbh7P5sfAlZAYBiQdYCZuhQR9sO
 Ry0kOH7e5ISxNAKJo36jaU4/SfkCrF69vitwUQ/4AbNe73yTB5SiyK7D+p5vvz6Qzv6o
 G7WQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW68Rks0ha6/R6SueDDMMwzcd9dcpPrHgZdSlj+EYFo9qMMMa7+h0bEhoyBypwzawTCFAUPVnroemoCjA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywym9P805sKl/n9G8BYa6PooWg9dECDJaL6u8MOd6lFrE5Wnptm
 cUeILXYFvXygkujnqogJ2vRO6q8H94EfyX8/dTuVWiDXrBCF9of4ZYwW
X-Gm-Gg: ASbGncs1qQbZZGtM4mqwuUmQrYfFnDRmyr0EJqwsjaPCwmgaMNFa5lKihIRsMllXul2
 aP4u0x3D9zcW+sCIG8PG7a61EXp8oc4aRix6fFaLU1hH0LvOdAldOTVNAgiQusuoo0uQ4r96Smo
 oG+r8riMf5uxH7ajw7136Xr61zUG9rt1OwtKYVXTwG97/X0BBxOa7TzRGzcVeXPYgawbeq/51cA
 N47Uf7UWhc7xcl2LrladbSHKMnJUSPkQYT9RYayc9zQjyiG1huTOC6vP4DaiVi4KuQWSpVUdlxz
 FH7dy45F8ov3alwJJHANCCgOk/kRUP+OAlbAxM6Yz77ammsbIYWE6J9hzhcZT5ZcxY7azL7qg37
 jt48PbmyyjNeFcsGERx7qF2Yh5T1WusaBBN7xu1JH6JgNL1GsQOKcXovP4YPkLi7fXJ8TdQFi4G
 4=
X-Google-Smtp-Source: AGHT+IEKj3bBCS9FtDr97rBmPSsnGuT/6Hzs7PvtGv6PRK2iG5dvba7cpbCl+e/48QRV8/RBzMyxUg==
X-Received: by 2002:a17:902:c401:b0:24b:182b:7144 with SMTP id
 d9443c01a7336-2951a38fdf9mr20303525ad.7.1761873892179; 
 Thu, 30 Oct 2025 18:24:52 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2952699baabsm3091035ad.76.2025.10.30.18.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 18:24:51 -0700 (PDT)
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
Date: Fri, 31 Oct 2025 09:24:25 +0800
Message-ID: <20251031012428.488184-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 0/3] net: stmmac: dwmac-sophgo: Add phy
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

Change from v4:
- https://lore.kernel.org/all/20251028003858.267040-1-inochiama@gmail.com
1. patch 3: add const qualifier to struct sg2042_dwmac_data

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
2.51.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
