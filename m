Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A50C9AE506
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2024 14:39:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E91E8C78F67;
	Thu, 24 Oct 2024 12:39:12 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1B4CC78035
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 10:36:48 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-71e57d89ffaso3299317b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 03:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729507007; x=1730111807;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h3w+t/hy92F7//9WIWnn/8qnkcbEZ1S9KDEWZUEAsd8=;
 b=T48pfiQAhwqe3yhnsNsQ6jsJ9gc6bXpAx/9Y+GMNE42Z5QvX2db+tkrOWd/+1oHg7C
 YY0rl3V2ql/MWlNenpCiS65tdllRLjZIaZfzaBcedyeKkd3TXQNvWhf3x5l4mQeDUqzI
 v0VwcfC8IIFfOK4/OZn9lLrwW/OQmz5BtR6W6DsOhmpNgsBsPbpILg9jd0TC3AqxWHdH
 ysS+9UO3dz0W/tFLhswu8uQ8+2PWm21YljVzHYpVw/bB8jHYvfeFaZVNQNKGSQUHqOjj
 ol8IqF1HYubeGIWNwphVRwYicaYv3z2tX0Q+NSuuxTb9xB3ow7TuB2EndlkiDAuOSoy7
 d9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729507007; x=1730111807;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h3w+t/hy92F7//9WIWnn/8qnkcbEZ1S9KDEWZUEAsd8=;
 b=WVXXMMCillx3oKFO/KySKBJHtmdE+MYqgzRdgsvD9NwilsvSj5YjUKLlMSeeufakLy
 OTJ4zto6HBB7K49M+aYnG3bsv5QN2zvBe/MTl/ThhZYngUgAajnUA/RaXfm2BZTDFnZ1
 NBmFVDPU3m2JdWb8pNkfkQLVF0Td9FqeuBRU2ykxwKy7/ssRPKfSAD4wxHdFDU4dLfw9
 eqRBfbrK8g68JkPbtsbJE1XpIdt7FJwi5/sKZMHHyu0p3xaPs+WjHYAcNW0zU5jqxF+g
 8ivCmZhQ42H/++SkICw0jFLuVUg49eKOLftmbDRqrGSNZKX4HaFMn7Ird2PRRG3z5UEP
 bWZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5EBmEII+5/eSd+Grqp2rQcMzXE0TyEiiiwEuCP62U64yM+PuwME4478S4VotYPFWUEty7SAPrtq4YTw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzEWl1HNoOLbiJRRjDMOJYC8JJkLj4JakIVhsThVNEbUbbTpw+k
 1mvNMRmbwdVbdg/FtiGb1iWyjM2tgLh9mkcFYKbzZMFLGlSG6GCG
X-Google-Smtp-Source: AGHT+IElGNzKYcyHQUiYzNuX8VzKK9Yqlu7dfkHxfLYn3GyJigsTd7wxPDUfyzl4ltkknkIdKtCRXQ==
X-Received: by 2002:a05:6a21:710a:b0:1d9:1aa0:10b6 with SMTP id
 adf61e73a8af0-1d92c4baa97mr14744680637.3.1729507007228; 
 Mon, 21 Oct 2024 03:36:47 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e5ad3677efsm3354501a91.17.2024.10.21.03.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 03:36:46 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Mon, 21 Oct 2024 18:36:13 +0800
Message-ID: <20241021103617.653386-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 24 Oct 2024 12:39:11 +0000
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/4] riscv: sophgo: Add ethernet support for
	SG2044
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

Inochi Amaoto (4):
  dt-bindings: net: snps,dwmac: Add dwmac-5.30a version
  dt-bindings: net: Add support for Sophgo SG2044 dwmac
  net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
  net: stmmac: Add glue layer for Sophgo SG2044 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 145 ++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 132 ++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   3 +-
 6 files changed, 295 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

--
2.47.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
