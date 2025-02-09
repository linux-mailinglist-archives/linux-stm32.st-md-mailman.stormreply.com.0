Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19023A2DA34
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Feb 2025 02:31:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1BB5C78F91;
	Sun,  9 Feb 2025 01:31:10 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47711C78F8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  9 Feb 2025 01:31:03 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-7be49f6b331so339429685a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 08 Feb 2025 17:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739064662; x=1739669462;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mpE4zKyAH8svDQr1EVUQPc0P7SOzCqW4Zan7hwoFlao=;
 b=aUjU0whedKfp3v82GMHFkcD3oz+sEP5kXNs5klpmAQPmdoJOww1q/XW4/3SvnkfHu7
 pgVSQ0bfdXLa48ppa0yDkj/WaFpy8qffLBpxZQH5lnaOwdwMMSVaV9LC1hMGIwf2ygJB
 ats187rBQM5OA0e4WuSF1WoB4taHEdKSAw+wOhL8qiB8eQ4VVbZ6lYGqzR5y356cnw0c
 CrIzZ2vllNmqWVZ9myX2Rni1msSGvnLDOPxP3Eu2atxL2rKtJ0kETwDg3mfqJp6BT8kr
 knth5Ai1QOcNXu38aKc+ETC8P0TsQk4U+Vlo0uHVM2FTO4E/FgMF/0ZsHRRopyZvgvTT
 QDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739064662; x=1739669462;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mpE4zKyAH8svDQr1EVUQPc0P7SOzCqW4Zan7hwoFlao=;
 b=jsdUwc/TF3VMyF1lvHhIJi+sHmbnUwKMdt7JBalC+Yr2aSrvqEfAZMRUTgU7g4quC4
 0t7L0k1oeMjJ0EPOYREVasuotd5A6VNGZw2pMG3vKIzjpA9UswPV4g0I1nK2SjdI78k0
 ZYHXgjf32bQeIivwFBwfUCyNtLsPZlO54yaoPw7uoYsG6JAB26qEqn3igHYufFUv7tAf
 3tr2xAdmxhwwskXAlN53XJwAQjbmS1R1agntGMjRKELRH+O5u2I8dk18WQfHjI1uYJoq
 vPzDE/nI74Z+2a/NR+CJe2Wia2TRs9N03G7b1ULn9l8v601N1l/rLDEHwfOWHyh6pNOw
 Gz0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCduQ3y1R1OsKXKFFAJa9uuKi9WBQYfD1RFxRRzqo9PsVdjFDokAHZmFz6NSTcG+uoQ6SGXO7s5f3BFA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyWSJ+a0RtlU/Gl8vHpccbkhECO58tYNTJIwwU0BAX5rYHDyffk
 qbd+1GpPn9f3HPYuhjss4j3nsWeAOLLxh4yigLc9cllj7XXZ1GCg
X-Gm-Gg: ASbGncu7/NrqtvwSfpNAoRO3yrroe8G16wxXcnPt1hUSGEJ9OjS2diahHEysECzBsoE
 Kh/MIdaay793T7d4O1ka6Am5y3wrV+eKvPD0k6o6ukoSCPwZZnatw5X4grM1n6lI/ApgTOYkGV/
 +YdtLHzJeyOrBLYv60EGXt6orVFOgq1xJsMffpuRrnzZ9C5U/2l6KpqG6RN/WSxGnyST/9nkdWb
 NkkeO1C0V4A+S6P3S+PoyNRt8ZE2h6DbDNgSdbLoxFzmv+LcsMJqdipOGTHWznndJ8=
X-Google-Smtp-Source: AGHT+IErNG966adydDNeNbSis7LGgBN1C8RNiREv5yWv/KkleMlno0XmKLtdyzMfyEP6jLn7m+bHdQ==
X-Received: by 2002:ac8:7dc2:0:b0:467:4f9a:6511 with SMTP id
 d75a77b69052e-47167a348c6mr149530651cf.30.1739064661848; 
 Sat, 08 Feb 2025 17:31:01 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 d75a77b69052e-4714928d886sm31368431cf.18.2025.02.08.17.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 17:31:00 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@outlook.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 Simon Horman <horms@kernel.org>, Furong Xu <0x1207@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Lothar Rubusch <l.rubusch@gmail.com>,
 Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Sun,  9 Feb 2025 09:30:49 +0800
Message-ID: <20250209013054.816580-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 0/3] riscv: sophgo: Add ethernet
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
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 105 +++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  17 ++-
 6 files changed, 257 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

--
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
