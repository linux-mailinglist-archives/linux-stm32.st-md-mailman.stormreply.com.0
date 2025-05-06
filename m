Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A64EFAAC15F
	for <lists+linux-stm32@lfdr.de>; Tue,  6 May 2025 12:32:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 592F3C78F83;
	Tue,  6 May 2025 10:32:00 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C12DC78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 May 2025 10:31:58 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso34352285e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 May 2025 03:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746527518; x=1747132318;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ea2yeqyCln5YmQUlQrOfEBlQkw4IJEtC+0ef1Pufbzk=;
 b=PkRg+jWnf7dI7PfzNlGMnPZqN1UTzg/NofhgFywGPONo2noyzMrHvpklTVTvOGTa4T
 J+T06Z17iyKnRzcwNsgZF75+L6Rd0+FHeTfbHO/l7upD5zgvJg5YrR042iORPqpF/MEq
 Ksf0rLi9eaGyfEveY4C+RGfTTpqZRo1sYXQcKX0phFK9o33UAql5H/LoXlz/nxg3inGq
 DmJtJZR2ODJHP/9yMm9HhGw/JLXcfvouGFhBv12a5LezkJOt2Ewxa7vKIZiA/w0SQK80
 mSTLuullyAsXDYm1i2Qg1M6mcB6dRUpJOvL1y3CDJkcXF8jdxZQVy12S1LPYqXFfPL3s
 cj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746527518; x=1747132318;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ea2yeqyCln5YmQUlQrOfEBlQkw4IJEtC+0ef1Pufbzk=;
 b=gB965Bktds1l2UDcX0PzGW/n44tUykyQeTs/zcLwf2eN0owbZ1W+PVmB21ooeAsRpr
 ykBdjwc6LVwxMOvgue8yOrq0lDRqWUHd12QYGhcFIopnEi0s74G1m264siUzTb+WeIjS
 179BSy1cWQB2oOxDDVB2nYbF7UG7u4WbIBm8IL1H6WOHjxPpgRTQ6O4mb/P4M5Jkvl1s
 L8xi4fa3qPDp6C9EPx97QkFEMOd68d2OcE2GwJQj3GCBH+3UwEFjXveqFlyS2IPuIRCU
 peiGzgo3zl2Hfd3fiCXf7AzgugvJwlumCj9WAutweRy0tv2gf0OQCMBtsyUMxHTRws2P
 gwJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY8FH5bJrYIrjRIajppjtKYhRtKwUrMRuZVR9XcEHqnM8v0vacADNO4LDaaSZQz8kS0QUP0uoS4v0LKQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwPjN1ConeF5kVRbG6fTe9LkAcjTs/AdnEmmJZG0OlSjeKLByuO
 nWjnz48L75B8HfUwy5nAVA4weadN9gADi0g89VV7xIgaSzbud4mA
X-Gm-Gg: ASbGncshfJzCs6mZGL72bOf2ByEUwX2A/X96F/zpZXFdEC1rA91bW6FdeeM+Xw+ix62
 w9KjYD22G6m2B5pu+OmKhgE0M2uyUVwRFe71+MyNjKqyEeGpI3p3nuFeAJNdeeQyIYsGK3OOtf5
 XO7KwxC/Eigb46JHpWf6Iz0mk50NIp4nRFezZQRNBxdgGrTm3frcjG2BvBiGzxju0csvq97OrO9
 NoS1jCzAXgQVtMyov1kYncK88TTSsI/CEzI+bcR4owIhg0bfhoFhxOYYmupyjC59cdjqekqdHo3
 mhNbyNH7xjjiXKLHEHv0dahe+wqN8O9+Oi+cWmj0KLVwvblFSaZcnin+gMDOCurdgQ==
X-Google-Smtp-Source: AGHT+IFlaL3zlxfWhU9eMQsd2gakbJ4MFYO8Vvi3cHZ3L2dU+abGaPcYIyJZw9nvTDrS+u/WlfaH6w==
X-Received: by 2002:a05:600c:8212:b0:43c:fae1:5151 with SMTP id
 5b1f17b1804b1-441d0531289mr19620165e9.25.1746527518190; 
 Tue, 06 May 2025 03:31:58 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:26ec:c7bf:3d4f:d8ea])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b89cc469sm166148695e9.6.2025.05.06.03.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 03:31:57 -0700 (PDT)
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
Date: Tue,  6 May 2025 11:31:50 +0100
Message-ID: <20250506103152.109525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/2] Add support for Renesas OSTM on RZ/V2N
	SoC
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

v2->v3:
- Dropped config check and unconditionally enabled reprobe support for all
  SoCs.

v1->v2:
- Inveted the logic in the dt-bindings to require the "resets" property
- Instead of adding config for new SoC, changed the probe condition to
  `CONFIG_ARM64`.
- Updated commit messages
- Added a Reviewed-by tag from Geert.

v1:
https://lore.kernel.org/all/20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: timer: renesas,ostm: Document RZ/V2N (R9A09G056) support
  clocksource/drivers/renesas-ostm: Unconditionally enable reprobe
    support

 .../devicetree/bindings/timer/renesas,ostm.yaml      | 12 ++++++------
 drivers/clocksource/renesas-ostm.c                   |  2 --
 2 files changed, 6 insertions(+), 8 deletions(-)

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
