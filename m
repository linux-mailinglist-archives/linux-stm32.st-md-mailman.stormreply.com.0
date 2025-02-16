Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04908A3742A
	for <lists+linux-stm32@lfdr.de>; Sun, 16 Feb 2025 13:40:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A15F0C7802E;
	Sun, 16 Feb 2025 12:40:27 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AC52C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2025 12:40:20 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6e672a21b9dso9297026d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2025 04:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739709619; x=1740314419;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dGDs3HpGQkICOAu67lknk/dBvFr+k4sdCQo4X5U4Pgo=;
 b=CXMHB+mhmByXp8Z1EqcNdMLIPsl6Z/TUdl/l6NUwI6et+80/rFvjpF43lN5sLj4pIU
 NXMNzRCw8j//Ut4E9FLrj+PwjvAx41y+uwVwHvSGsdjgCcqt9h3CsWl9lJmeDcetKM9M
 k7ztB439FD6F5096lWCuKoPAdTwfgaSI2TeZnxxDknJbFV6qLL6LF3jDZ9Jb/Ual3ucj
 a5tm+iwiRjcVLJQ3GFFELW9oQET74LuVrdMAytlU5NXYrAaWcE0GT/rya3vaGZPdKOo2
 kOQ8MzWDV0HzJdjGqZm5MDzuxQO1F3Biav8tm14OpYHmXS2ga6rPXtFC/zGa70Ibqtts
 iY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739709619; x=1740314419;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dGDs3HpGQkICOAu67lknk/dBvFr+k4sdCQo4X5U4Pgo=;
 b=dN3+ii1PScH3O1fC7IVQHzV6Bg+atoCXFuTFXiO1vpZwoW3rowEWu8kWSnwsgqU7h+
 3AJUxLMhFMnI5kjM1TA1PYBwrR8tmfotSld12QEqoC7FvOK9TmZwWIdSzn9J3CwoutPl
 Xupoh292Ks6AhVm3kEVC213JvZGuTahMpcgGHT6WNharYgXNdF0tDfw7IzPkooOk0XZy
 78xRuo6xc92v4KisOoZbWPDy8MeXajVcMEWZad60mzs2f4HU8+v0POdahdFrgjeUqQla
 P4AnnIWs08Dzfech8DR6M4JsCAHSz2DqLpMlNReC3oj8PN4xLGvnpqUXFqW79SlxfTpU
 WzJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmOl88HLOOUDlsEAnmjgaSPYbWE4qd2ONQJOrS665zXmFT8LNNzXyt1dSh9IkX22uDdVRs+5JwHsLDUA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyGXQpAVfYbRJUGhPLsPDy3j7TrVJVlPbTTVgC6z68fePMnzLDh
 xk/LIPtM8kqD3JO5YezbJ8R+77OwEAisW9/jjIKbhqim7uei9U+0
X-Gm-Gg: ASbGncuja6Bqr/fV20NrTLU99f1X5oEFMVD9Pl08InA0aKRu6yCJRrpNuPXAIDFDJxb
 dDm6HJCOlVY9Bwg1bAjSSWUQ9BU4C4lB1T5Jpf0MRuKWAKwX5m7dM3v/M+Ws/itRpUo11m+KTQr
 kU0dCdethiDn1z2cH4pSmUSMHsPzA2fymGuGRS7viwOH7xYfkwhsFNtNZP53rNY2OBEJyE2CfCM
 bEnDQfvCZhSjedhJjSPi9V8qXWBc+sXgPcYL3NRFNSthpKxh/lwQyjY0DLu0LonqNo=
X-Google-Smtp-Source: AGHT+IEpfpOMHZ8O/1KvInhk3KcC7dM/mez8wsS2NuX284w3zcB/+PjufIWyqrWrlCFEXBwTJBBy2Q==
X-Received: by 2002:ad4:5f0a:0:b0:6e0:ad33:36c with SMTP id
 6a1803df08f44-6e66cc86d3cmr90601876d6.2.1739709619021; 
 Sun, 16 Feb 2025 04:40:19 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-6e65d77927csm41319936d6.10.2025.02.16.04.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 04:40:18 -0800 (PST)
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
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
 Hariprasad Kelam <hkelam@marvell.com>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Drew Fustini <dfustini@tenstorrent.com>, Furong Xu <0x1207@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Serge Semin <fancer.lancer@gmail.com>,
 Lothar Rubusch <l.rubusch@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Sun, 16 Feb 2025 20:39:48 +0800
Message-ID: <20250216123953.1252523-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v5 0/3] riscv: sophgo: Add ethernet
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

Inochi Amaoto (3):
  dt-bindings: net: Add support for Sophgo SG2044 dwmac
  net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
  net: stmmac: Add glue layer for Sophgo SG2044 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 124 ++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 107 +++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  17 ++-
 6 files changed, 259 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

--
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
