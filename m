Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF996D5C1B
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 11:43:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04DDCC6A614;
	Tue,  4 Apr 2023 09:43:12 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FA9EC0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 09:43:10 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id q16so41584853lfe.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 02:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680601389;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KRzv9smVSuXlAiuE6nE47MRg/YlyfJfzc/qVDw1E+Jg=;
 b=YeuAYOJg8RKBKpsfUQjs/kgAenYVEmVwzqJbLFsEPK/KvREOv8xHEoKRmXoFF7sPyG
 v2qbxWjM6hY16GcIoIv5VlHp1y3IWXkCvM033GOY60rNXlDxTma6lriRVkpEecryoOuI
 4Swi+Hc4peb5e13297zht3+L7ukFfdsHE1oflRo/336tvzgz+SlmDq1uV/oG7cqiw3SQ
 ZDDW8p1Fg9K6mHpto+5dHuUssMgWQG9JwDkCUgkJMewCircHt2XNc5aqRRfRZVCQGN5L
 UcbwPZmtLWSbcIk7BUNj1Q0lKn6PxJYm2CxlJ+uzg+3ec3cyst41vGif/jvVpx6dTIIj
 Wt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680601389;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KRzv9smVSuXlAiuE6nE47MRg/YlyfJfzc/qVDw1E+Jg=;
 b=osMwCW56H/NRdL5aGIAHfDJHqczyP37u6DuOT+lg1RScrtXYzrvw0BQfPcQepUgkBe
 o0Gxfu6CgIcwMXz2/4pgj4AfnxQww42wfimr4vmMsB84X6JO7s1br0RaibsPj2Rc0m6Q
 F0BrXRk+S3LJhF/LqiIOmduG3TCrhRKys7tvJ+P5F/x9Tx7C6p2xj+wt1Txob+fuU4qU
 YN52X9yYu5AqINXEI/dM5z3JkX/AAoR6qpxMyuWHDudR4k9a1XneCYTY+3BRgGTg5e1T
 GX6nNfJ3c15EXKaHbV3G6vRSvF/X3PAmxwvV1a3+Hz+eb+t7yPQ07pyT0YpNrFS4jc56
 NOlQ==
X-Gm-Message-State: AAQBX9dMMhMHOXFYlJSiTGDwsXBno1ddgWmQzjpDUI3ZKA2IvJFAhlNg
 dx+doiMZzYNvFDLAbbPfsXp3Bg==
X-Google-Smtp-Source: AKy350b7Z4E6Q1dfw8Fpr7MDoDfW/n0vIeQesGBJNCLP89rnF9qd2fn2IS/qJGPHUXKFEfnY+2tHEg==
X-Received: by 2002:ac2:4c34:0:b0:4b6:f51e:b8b6 with SMTP id
 u20-20020ac24c34000000b004b6f51eb8b6mr517329lfq.56.1680601389522; 
 Tue, 04 Apr 2023 02:43:09 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 l25-20020a19c219000000b004eb258f73a9sm2218443lfc.163.2023.04.04.02.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 02:43:09 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 04 Apr 2023 11:43:02 +0200
Message-Id: <20230403-immutable-irqchips-v1-0-503788a7f6e6@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACbxK2QC/22NSw7CMAwFr1J5TaS0qcrnKoiFkxpiiYZgU4RU9
 e64rFmO5o3eAkrCpHBqFhB6s/KjGLS7BlLGciPHozF0vgu+98HxNM0vjHcT8kyZq7rjAdMY+j2
 1wwAWRlRyUbCkvKVX/sz1T7dNq5Dp3//5sq5f3vhqFo8AAAA=
To: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.1
Cc: Marc Zyngier <maz@kernel.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/9] Convert low hanging pinctrl irqchips to
	be immutable
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

This repeats the two-fold exercise in the GPIO subsystem
by doing the same for pin control: let's switch over all
easily identifiable irqchips to be immutable.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (9):
      pinctrl: iproc: Convert to immutable irq_chip
      pinctrl: nsp: Convert to immutable irq_chip
      pinctrl: armada-37xx: Convert to immutable irq_chip
      pinctrl: npcm7xx: Convert to immutable irq_chip
      pinctrl: equilibrium: Convert to immutable irq_chip
      pinctrl: mcp23s08: Convert to immutable irq_chip
      pinctrl: st: Convert to immutable irq_chip
      pinctrl: stmfx: Convert to immutable irq_chip
      pinctrl: sx150x: Convert to immutable irq_chip

 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c    | 38 +++++++++++------
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c      | 23 ++++++-----
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 34 ++++++++++-----
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c   | 34 +++++++--------
 drivers/pinctrl/pinctrl-equilibrium.c       | 22 ++++++----
 drivers/pinctrl/pinctrl-equilibrium.h       |  2 -
 drivers/pinctrl/pinctrl-mcp23s08.c          | 36 +++++++++++-----
 drivers/pinctrl/pinctrl-mcp23s08.h          |  1 -
 drivers/pinctrl/pinctrl-st.c                | 16 ++++----
 drivers/pinctrl/pinctrl-stmfx.c             | 36 ++++++++++------
 drivers/pinctrl/pinctrl-sx150x.c            | 64 +++++++++++++++++------------
 11 files changed, 190 insertions(+), 116 deletions(-)
---
base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
change-id: 20230403-immutable-irqchips-98acd347e166

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
