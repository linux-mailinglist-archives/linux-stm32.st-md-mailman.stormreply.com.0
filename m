Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7E688CE39
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 21:24:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77ED0C6B46B;
	Tue, 26 Mar 2024 20:24:01 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4DD8C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 20:23:59 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a46a7208eedso818121866b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 13:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711484639; x=1712089439;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=knEQ4mryQwBiq0ncopBZJftzfm8XTJ3CLErQObi0yU0=;
 b=AkG2ED7oLMwoAYwzYqT/FuPMgx+twaaC2XE0oB1m5M9houF8oO1YZy34lYfSregRs2
 fBov/y0f5pERO7A9KTD3KwMf2n/qa2AJyY8exyuL7n54p3kIIRHRYAYaMPd6SWaDLnSN
 aNgk/uwANSfEmqGqkER3Bd6+HldUvDdfDaFVZZRCz8kYxnWYtWsP3S/NDgJ/8ZRhK2l9
 lDnR67hW021xZoiC8ul8l9IyswE5oFMJ/mCPi74ZAlBm69R9lL7bKWRQB7d3L3e3P2Zw
 ynZgIwsPAm552rAQSZDN8q8lYMTyRYDvpLbKKjEC9Hci6e4Ro0x5norAwHN1HegNkFV6
 xDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711484639; x=1712089439;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=knEQ4mryQwBiq0ncopBZJftzfm8XTJ3CLErQObi0yU0=;
 b=MC+NVRn7nzCUNCpd+16n9dIujXP6ODmxYwP9l53bSBHgx54WFiIaCpqN0qPS1GCMk6
 58ueSrKHzY4oksVnXspUVRLfw/Twu25FV8W0jAdGU7gAAX0rIVJk9JHaIf3IbKA20kOZ
 +L4AVQPJmnTaK5P/vminND1g+BPEU4xhqL8ZJouB8xbNdwtbhZS5nT+f4TGSlIGIn1sf
 CxH2lc3mBWG/b6LeOD1GeBq3La0689dRO4rSYlBrfV2NqlELZ8deVfFH8UGEKKp8mcdt
 R+4SlcEfDZw3rnehpxyD3Yj2lBPmtrC3GFcQMQame0B0szNtiw1fEc2xkNIwzyCAntn1
 qMEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbaet4RhNa5h40jnnW47oR8viORbPvUMzz7N5g922pjOydNj+57RwVKA55md3h/aA3LEvugI7PySCJYkmjXLhjgJm9xqJfhqkgobE+g+31Ok1Bb1kJgWiB
X-Gm-Message-State: AOJu0YwyjZqbElu5q99SJao5PZ/XUjzwqBbq4Ll3f7jzQW1lwVPLgklN
 WLgZmfbMEjzdXqspjfz747rSmZBEZGr5/Bw35cL0pTt4ii1/+Wf7LsRwk6QRpUk=
X-Google-Smtp-Source: AGHT+IH0dK859sUAUhEQqGBCv46vWClhoFv9qf1bBqBgtaiUINfNf3lrctA8c7WDHIrVwNuBvhWlKA==
X-Received: by 2002:a17:906:b806:b0:a4d:ff6a:1d93 with SMTP id
 dv6-20020a170906b80600b00a4dff6a1d93mr262242ejb.60.1711484638972; 
 Tue, 26 Mar 2024 13:23:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44]) by smtp.gmail.com with ESMTPSA id
 b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 13:23:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:30 +0100
Message-Id: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMIuA2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDYyMz3dz8lNKcVN388rzUIt3E3KREXePUpCQzUyNTs6RUcyWgvoKi1LT
 MCrCZ0bG1tQCgwIKfYwAAAA==
To: Russell King <linux@armlinux.org.uk>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2890;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vLJVttyU0unj5HjuSsO9gb5EMeZQpEnywYmaCFIJqoc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7IJ8hV8xU+Fvg50aj7Bm1TrFxta5NflDG5C
 Z0GX9z3UjOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMuyAAKCRDBN2bmhouD
 1zMeD/4j+he5Lc0O5CAxCQTaYhyHw2jsG/5EdmADJJfjbMxmsMOFRSqBgFCmMTYlikBybNpMvGX
 Njz5qu6tleCNVFVzX64LgMF9CHk/qK88sFohHb9gDLy3INj8Cc7dCQay4J1RKYsX9JgvTm//yhG
 1i0kOuGUFGiUgkNVllH7OPSUBI01iGXoYWh3MIdiP4adZO5ydPW87HOHzk0K8fGWClJyOsN1l8o
 pk2Nfo0PeoM8o8H2QIcet14VfBgi9QJyqr77GM5vJnpR45KaRc3l93yej3zFWQ6OZHULyGayEtK
 8IUUp9ruU6fkzqDKIEsERhna3Fa1GacQADv0twz9n616/L1pcFTJaoLhItOUm1R+UfMX4mCtXOV
 Xs+nlz7EefbYDT1rvvHDuJ9q1gwp68PBnzMIHQFPM4BMXk25A2Wvjmk6YvBYIrhIMl3azHYFCRQ
 8x9/ojjzQkmBBvAp3CfFUGFpNadd6tLrlZnPySeeHRVnKbaqHw/AQ8h5RiTcTyrIzTqFSFufol7
 FoHmrA7z7yzQukzlsIcq27iQ0ObssgXHnSS1ZjXve056mJ8eQEJ/AAm2QJJW2Qqc1ay32P52oSj
 EE9gfAssEm8pTYJuc2ctEJu4BHdP9Sr+CAZ098xlIaFOiAEwGyAwmrrUoGgp7jm8R9lk0whhQwY
 ZdsRrJGwUkr5EFQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: kvm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org
Subject: [Linux-stm32] [PATCH 00/19] amba: store owner from modules with
 amba_driver_register()
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

Merging
=======
All further patches depend on the first amba patch, therefore please ack
and this should go via one tree.

Description
===========
Modules registering driver with amba_driver_register() often forget to
set .owner field.

Solve the problem by moving this task away from the drivers to the core
amba bus code, just like we did for platform_driver in commit
9447057eaff8 ("platform_device: use a macro instead of
platform_driver_register").

Best regards,
Krzysztof

---
Krzysztof Kozlowski (19):
      amba: store owner from modules with amba_driver_register()
      coresight: cti: drop owner assignment
      coresight: catu: drop owner assignment
      coresight: etm3x: drop owner assignment
      coresight: etm4x: drop owner assignment
      coresight: funnel: drop owner assignment
      coresight: replicator: drop owner assignment
      coresight: etb10: drop owner assignment
      coresight: stm: drop owner assignment
      coresight: tmc: drop owner assignment
      coresight: tpda: drop owner assignment
      coresight: tpdm: drop owner assignment
      coresight: tpiu: drop owner assignment
      i2c: nomadik: drop owner assignment
      hwrng: nomadik: drop owner assignment
      dmaengine: pl330: drop owner assignment
      Input: ambakmi - drop owner assignment
      memory: pl353-smc: drop owner assignment
      vfio: amba: drop owner assignment

 drivers/amba/bus.c                                 | 11 +++++++----
 drivers/char/hw_random/nomadik-rng.c               |  1 -
 drivers/dma/pl330.c                                |  1 -
 drivers/hwtracing/coresight/coresight-catu.c       |  1 -
 drivers/hwtracing/coresight/coresight-cti-core.c   |  1 -
 drivers/hwtracing/coresight/coresight-etb10.c      |  1 -
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  1 -
 drivers/hwtracing/coresight/coresight-etm4x-core.c |  1 -
 drivers/hwtracing/coresight/coresight-funnel.c     |  1 -
 drivers/hwtracing/coresight/coresight-replicator.c |  1 -
 drivers/hwtracing/coresight/coresight-stm.c        |  1 -
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  1 -
 drivers/hwtracing/coresight/coresight-tpda.c       |  1 -
 drivers/hwtracing/coresight/coresight-tpdm.c       |  1 -
 drivers/hwtracing/coresight/coresight-tpiu.c       |  1 -
 drivers/i2c/busses/i2c-nomadik.c                   |  1 -
 drivers/input/serio/ambakmi.c                      |  1 -
 drivers/memory/pl353-smc.c                         |  1 -
 drivers/vfio/platform/vfio_amba.c                  |  1 -
 include/linux/amba/bus.h                           | 11 +++++++++--
 20 files changed, 16 insertions(+), 24 deletions(-)
---
base-commit: 1fdad13606e104ff103ca19d2d660830cb36d43e
change-id: 20240326-module-owner-amba-3ebb65256be7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
