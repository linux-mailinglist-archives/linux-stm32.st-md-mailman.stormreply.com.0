Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C68C193FA02
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88F7CC78F69;
	Mon, 29 Jul 2024 15:58:23 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 356C6C6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jul 2024 22:35:22 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-70445f0d9b8so1892773a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jul 2024 15:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1720910121; x=1721514921;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=59P5oqU7NcCQSekZycQB8SHFulzZjU5cylTceccordQ=;
 b=gmOK2cb4aUk7jsJh00gil/MsHmWqQxzV3pvOP4+03A2HS5dp+DVuWjgSKKvf2sZlUD
 ig68FY3moPHiQYpCEKHuxdvjvwhUR9bQHo4GYvPdbyzO79gQH5iQ7QTarImmZyqlR1Kk
 zBN1xteyrqSCH2Qg5R1tDvLXmF1iEIZNxzKTVfiZJfxCdDi7l6+BllNqReG928xD7Cvn
 1T94RVmp6ixI0Lr8UZfy7TZ40E82mn5mXU+7hYqqfTcV+kozZ73lpErxLSNRMD0j6ETg
 m2EhP2Hkm9ywbt52GrsspY7LA70IC3PapjFSFHdQ55enfoU3URwM6rKvgEsn9+JoLcmB
 w9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720910121; x=1721514921;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=59P5oqU7NcCQSekZycQB8SHFulzZjU5cylTceccordQ=;
 b=ULklujs84QnnLicyP+7nClTQzHtJheyxmgFpRHNTixMuo7e3uxMVTklq79nDRkIH9T
 fmCb29Fv5trnDLi5OHRZwvZw9GlQ3djSmYECKDTpKYvA66SjJvv/5tt9iwUg2odbZTZM
 WS/dWC6Sms52COHzZCuYucIWQvh6ziXPnkhZ3mnSxCJQn6X2eS/9zuA3rkqBujhwBn/J
 fdQcT0fSHOtV7TtOMYrRjsLBWhfW4v+eYLuofnC+W1V9ql0qhz4tb7uZoq92G5vCOHi6
 xSdW/6uH/Qe01nsRxq7G5nFXhAOQ6V0iOu4gF6fQCnbhStlsoJiv8uvRfYrf0zj9ChPD
 gpMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLFU2QjurfZshL8bfYdVHISSAvoyfZNA1jfLQ4XfaHNXd0pYVwQBrUpO6yeM2AK0fVTQQFcyRKqdL4nPGCzzkoqWd7xX3D3a9aKDUnzOjcIGLPiTqmQ9dc
X-Gm-Message-State: AOJu0YxSzsENRE+gdaQp/GP6i1OSPgVrKZ1+QDAe9Q4cnbWEuwaJrrGO
 pURazHAFmh8+O9oWoW3WkQmUMt8wHiZvSoYb7mMO2+4AUp1p8bYasIMa9ClQU8s=
X-Google-Smtp-Source: AGHT+IEg9antJl5Um5shbWWC4aJSAEXG1X4QgFtAyLnt8rqbE/pGgSXXmoU49K8Rk27lGnV7pllKRA==
X-Received: by 2002:a05:6808:19a8:b0:3d6:317b:a95c with SMTP id
 5614622812f47-3d93c07512amr17596782b6e.38.1720910120935; 
 Sat, 13 Jul 2024 15:35:20 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:d7fc:57d0:ada6:13b7])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc4d9d8sm14640025ad.264.2024.07.13.15.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 15:35:20 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
Date: Sat, 13 Jul 2024 15:35:09 -0700
Message-Id: <20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAB4Bk2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDc0Mj3ZKM1MQU3ZTy3MRkXcMUE5NkE3OjpKQUUyWgjoKi1LTMCrBp0Up
 Bbs4gsbzUEt281IoSpdjaWgC5/rGAbgAAAA==
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Jisheng Zhang <jszhang@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720910119; l=2542;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=w/NbNx0hQrYCCt4fhGgjxPcsuaVQDgpxDwOcni8EUgY=;
 b=zhSGOkCGTA785OB0MaNJWsmX/0kLmkWTEMMzX8DoIdS3pa54QR5Rc1GW96RessAlJhjWKCsbm
 OZwPPbSVHNBARLIGPxYzRew0qKbsZpMAUxb9mzEk1yLH2//jZDwblTr
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-Mailman-Approved-At: Mon, 29 Jul 2024 15:58:21 +0000
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 0/4] Add the dwmac driver support
 for T-HEAD TH1520 SoC.
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

I am marking this as an RFC since it has been almost a year since the
previous series and Jisheng has handed it off to me. There was
discussion about the syscon for the APB registers in Jisheng's v2. I've
gone a different route and switched to adding a second memory region to
the gmac node:

  dwmac: DesignWare GMAC IP core registers
    apb: GMAC APB registers

This patch depends my clock controller series:

 [PATCH v3 0/7] clk: thead: Add support for TH1520 AP_SUBSYS clock controller
 https://lore.kernel.org/linux-riscv/20240711-th1520-clk-v3-0-6ff17bb318fb@tenstorrent.com/

and the pinctrl series from Emil:

 [PATCH v2 0/8] Add T-Head TH1520 SoC pin control
 https://lore.kernel.org/linux-riscv/20240103132852.298964-1-emil.renner.berthing@canonical.com

I have a branch with this series and the dependencies on top of 6.10-rc7:
 https://github.com/pdp7/linux/tree/b4/thead-dwmac

Changes since Jisheng v2:
 - remove thead,gmacapb that references syscon for APB registers
 - add a second memory region to gmac nodes for the APB registers
 - Link: https://lore.kernel.org/all/20230827091710.1483-1-jszhang@kernel.org/

Changes since Jisheng v1:
 - rebase on the lastest net-next
 - collect Reviewed-by tag
 - address Krzysztof's comment of the dt binding
 - fix "div is not initialised" issue pointed out by Simon
 - Link: https://lore.kernel.org/all/20230820120213.2054-1-jszhang@kernel.org/

---
Emil Renner Berthing (1):
      riscv: dts: thead: Add TH1520 ethernet nodes

Jisheng Zhang (3):
      dt-bindings: net: snps,dwmac: allow dwmac-3.70a to set pbl properties
      dt-bindings: net: add T-HEAD dwmac support
      net: stmmac: add glue layer for T-HEAD TH1520 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml        |   2 +
 .../devicetree/bindings/net/thead,dwmac.yaml       |  81 ++++++
 MAINTAINERS                                        |   2 +
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  89 ++++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 131 +++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi              |  55 +++-
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  | 300 +++++++++++++++++++++
 9 files changed, 670 insertions(+), 2 deletions(-)
---
base-commit: 568c4e4b646777f3373f383cc38864a3cd91bbb7
change-id: 20240712-thead-dwmac-1d44c472bbd5

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
