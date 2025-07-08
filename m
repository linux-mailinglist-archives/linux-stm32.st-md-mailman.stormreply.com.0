Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFDFAFC2E4
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Jul 2025 08:41:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5425FC3F92E;
	Tue,  8 Jul 2025 06:41:08 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC2C1C3089F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Jul 2025 06:41:04 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-235f9e87f78so41392085ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Jul 2025 23:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751956863; x=1752561663;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NYG4DorpfLLHRrZb8LcTYUGaXr911+Bv8Mdy1JA60DE=;
 b=Uy/Kn454H6VNWNlMnH6tTQwMJu8U7CJ6tThkGWIw24Tu/n7mJ4oxJT7hQ9grm3iN4y
 W/ixozryGDCDqCc6x3aHUnsmMOHTnCJ3t9tJMcodo7rKvqKGgJeVk11rdi4425xrVHBp
 JVuRwAb2IYkdRjT0j1wJdXuDm9LICC+if0WH6Z9pJ9Zp2+p6Fk6iQAeM6RmjiN0k4wRG
 zSm3x8QuJzbKRRzRLNFwZDX8u6FeKuVzglttMRJymHJZPhAQ8Tvyu1AWZCsIJbAzoNOg
 VDCwWIuq5pJ0MV0xfFe57Tq1Pp10DhaaeIG200Y+2vRysMnCSLtZWxwcGR7Q9gU0Hdr8
 BLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751956863; x=1752561663;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NYG4DorpfLLHRrZb8LcTYUGaXr911+Bv8Mdy1JA60DE=;
 b=jYd9udyx1MU0VE14k7novRu9oDMdK/AZqPhjiJvQ1tIOCpy1Uat8tPySaDl/COBIes
 luB4HwDjrScnh4bIuOjt/Tn6WmGP9IDVCtOCLp2A3YDW4Ne7PwPtJxF85o217d+A634L
 htsQWsFZySdbUfJBqEQ4slNhy8KEu1y6JR+AlJe8l+SEKi71UEYwNqUZuOjgkTtNZgT1
 j7Rgy2lziFT0eeD6J9U78Re53AFrDME4WuMqcd11so2FzF4S2nquWwG++h+Zp41+wGKA
 8kmMzAJVaHWTMljWwLLrDdZ2cLYbnsAexJHSvm1elA2/Kmi8RQB4BBh0JOUue+X+8k7n
 t1Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7LTP+iE3B90heftJ+pcno0iyzgeMisaQnzjAYDCGbqyraLwfHQAtN26IVAvnU22Awdd+nPHP+3rQ+1w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyuaxmdVeTRIjWz+PmLUrKPznhIv/ApDlTe03RUKm54pYhIVt1C
 5cPq0mWDFnSTyuNCd22L5cwqkIELfz31PbQUmuyS5DGa6qTo2DSzwgbQ
X-Gm-Gg: ASbGncsjJevRT3sZk5oC2CiXxT85dNuf7ks/tPAUwt6F5QrNYW3pw6g3uRknjnHx5aM
 Jl9ABWJO7O00hTUPJqfS7X7f4Vm3ATyX66+c7QXeS7wSkx5mgAT4vU/GqG1cZsRsQumVqlTTNAE
 aI2gLUrwl+O0oguSsqUMWQVISmoT3N+iGvrmS/B2K3ML9qPRtXv8r0d7h6II0y/udzDupxncb2U
 anoiA7IkxBAEowur/JXOtKEkWc766OOSKWDJn3D4tDqLv0KH/BL+blkphDLKB5xCln0+MeMkxXc
 /0QA27Pkw8e0e2FtVtZ00bprTs3de6va/MaODQ8znNjwMiM5WPVtAmZrs32WgA==
X-Google-Smtp-Source: AGHT+IE8dNh/94h7PP9qu+pz6QETQuEDR3G8DOsyx27YTdMrR6Zstgx9PwNjmLqJHYn8N5lM6qUYiw==
X-Received: by 2002:a17:903:286:b0:235:ecf2:397 with SMTP id
 d9443c01a7336-23c85e7671emr225145495ad.33.1751956863291; 
 Mon, 07 Jul 2025 23:41:03 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-23c84597371sm108407375ad.207.2025.07.07.23.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 23:41:02 -0700 (PDT)
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
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Lothar Rubusch <l.rubusch@gmail.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Tue,  8 Jul 2025 14:40:48 +0800
Message-ID: <20250708064052.507094-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 0/3] riscv: sophgo: Add ethernet
	support for SG2042
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

The ethernet controller of SG2042 is Synopsys DesignWare IP with
tx clock. Add device id for it.

This patch can only be tested on a SG2042 evb board, as pioneer
does not expose this device.

The user dts patch link:
https://lore.kernel.org/linux-riscv/cover.1751700954.git.rabenda.cn@gmail.com

Change form v1:
1. add user link at cover
2. separate the devicetree patch as a standalone series
3. patch 1: Apply Conor's tag

Inochi Amaoto (3):
  dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042
    dwmac
  net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC
  net: stmmac: platform: Add snps,dwmac-5.00a IP compatible string

 Documentation/devicetree/bindings/net/snps,dwmac.yaml |  4 ++++
 .../devicetree/bindings/net/sophgo,sg2044-dwmac.yaml  | 11 ++++++++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c    |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c |  1 +
 4 files changed, 14 insertions(+), 3 deletions(-)

--
2.50.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
