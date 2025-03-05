Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA799A4F73B
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Mar 2025 07:39:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A528C78F6D;
	Wed,  5 Mar 2025 06:39:52 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4331ECFAC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Mar 2025 06:39:51 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7c3b44dabe0so327516385a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Mar 2025 22:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741156790; x=1741761590;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SZA5b2x/fScL7d+i7eRMvLOrisXrqpzgaeKI+s5E2mY=;
 b=eWUwMre6NVK0sjh9UW50V9UrnmRk8VMKxprLNC/kUyJk3MPOVw2Scfb36xd3lGa6uh
 25fV1kr+dlSHIsoyJgEaGmyqkO5LzqPB7uyfNqGNeGb8F9VtibHttuH9RFTKa3xyVsHi
 VJ9h+P2EmTBTkxSxaO2+0c9GNnV+zX034ARSP1azD8b3l5yOVAgaahWWgukBS8QSu5Co
 AH3LCtCr2CfrqS3H1msVxnbTf+HR8KuYYTH/F2VEhiyLw/L7O2+Zs+NTj5fUtvYiAlxO
 18+oidqqjeJc3R4g6BHq4t0Q2YgxNHcuFWdCJnz7BhqAQR5IwAXd+Iv6KOx79HiVbb5B
 lKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741156790; x=1741761590;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SZA5b2x/fScL7d+i7eRMvLOrisXrqpzgaeKI+s5E2mY=;
 b=QyG9LYSllb4gYMderXaE7lA4IiF/SX2Glg5ghEb4PdFh59oplGU8nrZ9lYE7928nf4
 eHgNEVgVvpf96rn6l2xCWwoNLRmGL/M9fxbph0/vkEaWEgK53tPgesUtM1V+tO0dJcZW
 27kIfFy1x0q4lUSTRkL8g1oZ9QDcf2yLkVnqY4AeGIN6eKLnn5doy1deemxCNk/cEd1A
 b1fHjFjWMcmrm5EP0UcKU12O7UGDIdbx4REKsADLYx1WBM5nhw2vxzKPVMiwsTrOkFdk
 wKQahIlkdz3/Maa00Ke0UtFhdFkMYhJO1ipdJfSV3VXM9HXHikncraB4ilD/D2nXVnDk
 wExQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy1UcBoufr+jexN3aYsx0AjAHnJeYW7lO1gJ3NCmLescLEYUpxrZVau0e8HOjxU6ce4SCEk1Szg8ec9g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwzEbtXOcRoRYUNNsqiX62dhnTujms4a0O8Juqhe/YE3W+4CV57
 7vmIM64kuQfFHCiWQABq0DUveNOFItFyKRsOdFO4JQrQB4JrX9w6
X-Gm-Gg: ASbGncvV6GeRO3s4oi1CSabq0ThzHHaMpqMQEd5UOi0DJiGep8cg/S3rQiU0ht+pmIY
 CaOYsSJNZHXIh6EhoA2w8jx8AwjWhaWhoWNFQfbwZqA1sKyB8CfSNWdAO/zL5G7sNinNLbZxYqd
 b2flNPN0FrJVhXVjEi7ifWOV2lxQJ6KUAy/Z3ByMCmu2gVIYDhrSqeh/quyR56O1oBJYIOIO68M
 WgnHQvX2FEart+kfsC/YFTgKi854Gt8YvO5KuEZgNC90xBCI+n4ChzDDINjyqkZxEmdAuIOGmb5
 efwADIKRSVk9wNskgBN5
X-Google-Smtp-Source: AGHT+IHQn5rcf/yZwl7qfbDraLVtkQEZKtE6MR9UkwRor+hKRVkXlhUT2tJZmUlvvrfGucfe6+0vEA==
X-Received: by 2002:a05:620a:4899:b0:7c3:c01e:ad0a with SMTP id
 af79cd13be357-7c3d8ef2cd2mr402188285a.49.1741156790046; 
 Tue, 04 Mar 2025 22:39:50 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 af79cd13be357-7c3cc0c20ffsm231314385a.91.2025.03.04.22.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 22:39:49 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Hariprasad Kelam <hkelam@marvell.com>, Jisheng Zhang <jszhang@kernel.org>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
 Simon Horman <horms@kernel.org>, Furong Xu <0x1207@gmail.com>,
 Lothar Rubusch <l.rubusch@gmail.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Wed,  5 Mar 2025 14:39:12 +0800
Message-ID: <20250305063920.803601-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 0/4] riscv: sophgo: Add ethernet
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

Changed from v5:
- https://lore.kernel.org/netdev/20250216123953.1252523-1-inochiama@gmail.com/
1. apply Andrew's tag for patch 2,3
3. patch 1: add dma-noncoherent property.
2. patch 2,3: separate original patch into 2 part
4. patch 4: adopt new stmmac_set_clk_tx_rate helper function

Changed from v4:
- https://lore.kernel.org/netdev/20250209013054.816580-1-inochiama@gmail.com/
1. apply Romain's tag
2. patch 3: use device variable to replace &pdev->dev.
3. patch 3: remove unused include.
4. patch 3: make error message more useful.

Changed from v3:
- https://lore.kernel.org/netdev/20241223005843.483805-1-inochiama@gmail.com/
1. rebase for 6.14.rc1
2. remove the dependency requirement as it was already merged
   into master.

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

Inochi Amaoto (4):
  dt-bindings: net: Add support for Sophgo SG2044 dwmac
  net: stmmac: platform: Group GMAC4 compatible check
  net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
  net: stmmac: Add glue layer for Sophgo SG2044 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 126 ++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    |  75 +++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  17 ++-
 6 files changed, 229 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

--
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
