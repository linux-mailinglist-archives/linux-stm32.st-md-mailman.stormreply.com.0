Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wC8XNeExfGlVLQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jan 2026 05:21:53 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B32FB7120
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jan 2026 05:21:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A5B3C01FBF;
	Fri, 30 Jan 2026 04:21:53 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1E3DC36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jan 2026 04:21:51 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-93f5729f159so982099241.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jan 2026 20:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769746910; x=1770351710;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aZc1WohjUyOxX27WIht/QOavnc3r+d/i0XwRkPc1NWc=;
 b=cAl4r5yGBXzQ1bp2kr4sQRjAzhw9jykNabRykyPiNh+9nrmkWEtCt2hLVoElpJXih0
 ULX2HyN6Q8xvm2oNqe51ulA0korBCniiGNAV8bXUy6Icc5cDmHB/rw2sbipbzHUkpMXX
 Om26vQeJqPNALuvIxX/3Ajb7Di8ZJFrxM9dWLynyVrfpcNQt7aw06FhJug30DxSyyy1/
 eX8NYFvlQPbZJQRqkhHmu/vF9rNPhGUzOFSHCLQ0b3PsPH9NIXfkNx6AOmqjHQruiZpD
 DoF2wIZIoA7uxgRD4HhEA0FfW3DnNqMGsG+qRir7sqV2sbizK2/7bZmXo6ePwQze8mnz
 StBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769746910; x=1770351710;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aZc1WohjUyOxX27WIht/QOavnc3r+d/i0XwRkPc1NWc=;
 b=Y58mcKP8BoeFMD5xbusuUdaupAIwBSaGp1av+V3Gh0ejIPVbiVP8DjoITBkYMvz8cT
 QrKADd4lOCSOCj6EznU6ljTv3XreW5sy7zo3+pzGArQF1XyAJefD4TSogEMhZY9fwXe0
 bs7fRJoN7Iju2yXpFDxAcF8t6Xg5XuGjcuIQ0rebcu20rg07AM52csylswrYsUmFfzRe
 /PrBKqtkX4u4jD6i6D8wJGedcIJmJpK/uv4W0cAgizyrJXtGT1/NI3FqQ8aXjaTjrLVA
 +sFtmUGJaBqeBC0OHnrqlr+gRfBMxpOMOrKuIPS/xWDPZkweq/5J0UfmSvWSRJI90cP4
 1fSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTTMCBvFu3ej3ioiMoiLaiyNb7pdVXx61lQL0Yx2aY6wlSUgV4tJfvE9k5lYPyv3k+FUb32Yr/NatvBw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx5HUhsMGpp5ghfw0q9jPfuA/K/4GkSOHHZP3BWwjms6PjRuKyZ
 rvCIJc+KhX0/5HUVgqJ8WHrIaqIIH4QxRJGcE97Lv/nlzwZYxrhQtJmbXQgHy2Sb
X-Gm-Gg: AZuq6aJV+Os01bR+PUhnbi4Z7dg1YfQ7GGp3i6nAHpnQUp3J/wjePS+AqciZdpaimkC
 ZEO/ex8s8qqpY8Qdzpln2BPNAzmCIkWKsRHRa5Tf/j/FG9zVzSf4alau9bn9iwsiObZSmXEb2g8
 2X9Jd5LtadcTiQvK91AVAapJoATRoPic/V0k7An5RQZ5Z4ZyCBBrCisFVC7Oy5ouV2Qz1M230Zc
 ICCOyda2HoAKGWKqG7XySm+NoqmwXBWaaIzwI3AdKO6vW1bjfYokmZiLq7ZjQY3fagiUU36SAiQ
 OCvL7hnb9cAWrE+N8MmrxOqZqvxQdCZRHk6CcV1zySbpRjTtzOK5NTuP2dieV71DKEdnzzU9V7k
 LxW7/AEulWQLxsV73M81qE3/hFtP1KU01Hstdk+KzP2dw51NAYy+RMQ5cKOi9HOCtgQmwondabU
 mu+GW6eQyfEw==
X-Received: by 2002:a05:693c:228a:b0:2b0:4ae1:b4ae with SMTP id
 5a478bee46e88-2b7c88d6423mr747779eec.24.1769740046251; 
 Thu, 29 Jan 2026 18:27:26 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b7a1abe938sm9799883eec.16.2026.01.29.18.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 18:27:25 -0800 (PST)
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
 Inochi Amaoto <inochiama@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Chen-Yu Tsai <wens@kernel.org>, Zhi Li <lizhi2@eswincomputing.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Fri, 30 Jan 2026 10:27:01 +0800
Message-ID: <20260130022705.1059214-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 0/3] riscv: spacemit: Add ethernet
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlan@gentoo.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:richardcochran@gmail.com,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:rmk+kernel@armlinux.org.uk,m:siyanteng@cqsoftware.com.cn,m:ziyao@disroot.org,m:inochiama@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:weishangjuan@eswincomputing.com,m:maxime.chevallier@bootlin.com,m:wens@kernel.org,m:lizhi2@eswincomputing.com,m:boon.khai.ng@altera.com,m:quentin.schulz@cherry.de,m:peppe.cavallaro@st.com,m:joabreu@synopsys.com,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:looong.bin@gmail.com,m:linux-riscv@lists.infradead.org,m:spacemit@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,
 m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,m:looongbin@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.infradead.org,lists.linux.dev,st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[37];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gentoo.org,gmail.com,foss.st.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,armlinux.org.uk,cqsoftware.com.cn,disroot.org,bp.renesas.com,eswincomputing.com,bootlin.com,altera.com,cherry.de,st.com,synopsys.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6B32FB7120
X-Rspamd-Action: no action

Add initial support for ethernet controller of the Spacemit K3 SoC.
This ethernet controller is almost a standard Synopsys DesignWare
MAC (version 5.40a). This controller require a syscon device to
configure some basic features, like interface type and internal delay.

Change from v3:
- https://lore.kernel.org/netdev/20260128072931.875041-1-inochiama@gmail.com
patch 1:
1. fix the uncorrect compatible string postion
patch 3:
1. add "CTRL_" prefix to all ctrl register definition
2. only use delay config 0 to calculate delay code.
3. fix typo in the comment

Change from v2:
- https://lore.kernel.org/netdev/20260121071315.940130-1-inochiama@gmail.com
patch 1:
1. remove not needed compatible for select
2. drop empty line in "spacemit,apmu" properties
3. add spacemit,apmu properties to required.
patch 3:
1. remove misused phy_fix_phy_mode_for_mac_delays.
2. use local tx clock instead of the clk_tx_i in the dwmac.

Change from v1:
- https://lore.kernel.org/netdev/20260120043609.910302-1-inochiama@gmail.com
patch 1:
1. remove phy clock
patch 3:
1. improve comment and include something special about Spacmit K3 dwmac
2. reorder the included file
3. fix wrong delay macro used in spacemit_dwmac_set_delay.
4. add check for maximum supported delay.
5. use DIV_ROUND_CLOSEST to calculate best delay configuration.
6. use assign for the ctrl register initial value.
7. fix input when calling of_property_read_u32().

Inochi Amaoto (3):
  dt-bindings: net: Add support for Spacemit K3 dwmac
  net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
  net: stmmac: Add glue layer for Spacemit K3 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 194 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 6 files changed, 313 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
