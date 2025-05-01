Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7447EAA5E78
	for <lists+linux-stm32@lfdr.de>; Thu,  1 May 2025 14:37:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15142C78F87;
	Thu,  1 May 2025 12:37:19 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B7F9C78032
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 May 2025 12:37:17 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-441ab63a415so8089805e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 May 2025 05:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746103037; x=1746707837;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QarYVaH0v20mTotvxQdSp+TNmjgBdUC/EhjLO8cfUNQ=;
 b=QxOdjjfX6Q6aVfk7XfoQvPTC7tQGhlEa5cfEJuUQtnXmqG3nMpsSJgEzxBVflfy3ei
 lz0T/zgapThka3gxt+C0Gw+0Crwl/zEpGT1kS66v59yvCoPgwljPIroT4AI5I/bCSziS
 SyDUOs24LWOeEOg4917QUgl41OlnPsIyXabiNhxz+vNRN4PR+wMO51SrU9ICWw4TkGPB
 Fz7UsiRPYH1HCrRSnG22UDNNc0vVKvtjqhBHpcTEoUCgjuQlNUxkj1blHcWCTewj2APf
 AovfkNvlyrFWrd6ZSJ8BTZNMXoJQe0yYnkGNoNZkzUoklCImq1VxX3lYkXB4R0DI+Zya
 p5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746103037; x=1746707837;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QarYVaH0v20mTotvxQdSp+TNmjgBdUC/EhjLO8cfUNQ=;
 b=To11gsTPN/T/w0rUjOZHcgEk30PN6xTY7x6rFqR4cVuoM3kusOU40I1OdtB1/J8M3V
 +TChYHGHzaLf89msVYzySfDmW2X3Lq5tzrpDz1Nr6MgKCuTjgMOQUgVd4K9hBxAGsVK3
 sGQ4B8EvkflhF3376L0tIr3IsYx9dU8mQn4Y9Rx6TBEWDCE1Kso8lfoKWM9kNIcDHMR1
 /6foF2Tv+/a5hODRnoT5zgwS2N6sCyJUTWew1/KOGOPW69iLWRigZLIb9nNqwlZoaat3
 FyO3gGsLe0fW1nJDS34HIXS73n5NCRTiHDc2Ms/X/X3h0gYgBCMhFNdpOntWAgUiJ1sy
 +ISg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXV3KQXDsqMxCXm2+ea9hsZZ+hPUPy4A/waCU4UPrWPbm8poSX5V4wvB523MgEDyx+TJG8oLikeJR/A2A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwW5rNyeQGy6Vivwerw1OCcp7gbtCgzYpTRcYGYRkxPP7sVH+Be
 Gi10bEW1ztim+cUyipd4zsaCBcUM8yt/5YQ0BZH1/UHmn/WHrxxM
X-Gm-Gg: ASbGncsLSXXj/iViHV2n4dS5sZ1Sxkqj4wkbzqBX03e5brxqNZwNzCoXASF84RdULnA
 I/FVpbCqAwe3qSglq4N3jemJjl2P8TkYoWT34/nH2gBVo61irH7KVtwOyIvsvpBsKKLqoXhbVVq
 L+ItsdocPGiPS9WA+AoNf6ebkf8vAMQh+mVmrTWpqZOCUY4DCS54h7VMzYApa54VXSdv1ww3LbZ
 Vip65NWetZgwSGTK598wObYqkmHM+czBMoeFIYlFT/OJbarSu7AEv3maTcGUWwQKjaNINuoPlmD
 N70qymKIUpEi4KMq0zCZoLipClk/UJ7doPgTIpkUecXEXS+dbZKnC9sns1dtZUNS
X-Google-Smtp-Source: AGHT+IG8jggn8A7KlYdw5KvTYjXV5NzOswZFTlK/eHsc27wVMfwBj6SLLMeFwc//UR9osY5bfEFJpQ==
X-Received: by 2002:a05:600c:3b0c:b0:43d:745a:5a50 with SMTP id
 5b1f17b1804b1-441b1f388famr64205075e9.19.1746103037104; 
 Thu, 01 May 2025 05:37:17 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:f0e:4490:d947:2c92])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b89cc469sm11144765e9.6.2025.05.01.05.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 05:37:16 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Chris Brandt <chris.brandt@renesas.com>
Date: Thu,  1 May 2025 13:37:07 +0100
Message-ID: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] Add support for Renesas OSTM on RZ/V2N SoC
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds support for the Renesas OS Timer (OSTM) found on
the Renesas RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to
that on other RZ families.

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: timer: renesas,ostm: Document RZ/V2N (R9A09G056) support
  clocksource/drivers/renesas-ostm: Enable OSTM reprobe for RZ/V2N SoC

 Documentation/devicetree/bindings/timer/renesas,ostm.yaml | 2 ++
 drivers/clocksource/renesas-ostm.c                        | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
