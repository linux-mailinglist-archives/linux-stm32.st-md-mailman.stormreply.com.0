Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 028BD6FB01C
	for <lists+linux-stm32@lfdr.de>; Mon,  8 May 2023 14:35:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A82DEC6904E;
	Mon,  8 May 2023 12:35:12 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38BA8C65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 May 2023 12:35:11 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-4f13d8f74abso5025817e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 May 2023 05:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683549310; x=1686141310;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+Tij+FFEbWqrbKwhf0iTLPcsRvrr4KB1dAOlPPk6qZw=;
 b=wa7C9rAOstOw/5YMYkwIrZD9AyXDkGskPOdNCBBPLMHxliZf5UP99ea1QrUA2QmtAz
 AIdjUWTfi3Am4Lh0jGXuA0M7JLIs+2NIOhPNfyUlzTap1GPq6CB4Scqujhnw9GemclAT
 qOcbsMHfPTYkHKEut6y8H1Xl6ZFC1KC73nUlkpiR2xZqlG5jBmpoWN8PgWzur7GgtgMo
 X00Q5mrg5iWwFy8Ndg0jJuwr+qmWdjb0pZ+h1/BpYI7tXSiXm28/GYp1x5rzqDmjwqvt
 yeaXou2SVUsanLoq97h3wcd7NKH1AnhR4vcxP9+vdtCVd5EstqM7octIp5LlVwHf5o7r
 42vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683549310; x=1686141310;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Tij+FFEbWqrbKwhf0iTLPcsRvrr4KB1dAOlPPk6qZw=;
 b=QHRDqGEd2PQc0A9BJPA9p/Z29JZzGeiPiLFTv5NEpanLIe8inUDUqL3cevHe9FTjp+
 2ITixn/M+DPxVIujuRX428rE2CBIU5GNKJP2ovSGwNwL/JaSbibK4DNkGI9E2GrvoKSS
 p4kPlZpesvg0KCpTEvgobeqBx2zqscIBQvrY7OVmRa/deq2TLz8/goKftWHwFfcwiJHX
 SnMy2rGPN/7BmSISCq5nrCzkr7jhIQLRPFKnDJQs/IOW5VePBlgjkMxiQXDuBB5K4YOi
 W6KSfAgC1+Wa74puOKHW0JCQ7OG1pF0xTb6txoxkS40Z+MLakeq60rY0iV2aGukh1/mC
 s8OQ==
X-Gm-Message-State: AC+VfDxZklG+XhcrdD9eGPStH8xCPXKepzjTy7zmLI+43zIX0Rh9RTNN
 PRmEup78EK+syy06h1MFLcIpdQ==
X-Google-Smtp-Source: ACHHUZ5PEoKAODGoxQPkaW6DFt7BHyOeFUvreaKIu5ClJBbNppYj6RHHJeg1uV0h/uP2qk8jrz+xXg==
X-Received: by 2002:ac2:4890:0:b0:4f1:444e:6c5a with SMTP id
 x16-20020ac24890000000b004f1444e6c5amr2752347lfc.8.1683549310301; 
 Mon, 08 May 2023 05:35:10 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 q2-20020ac25fc2000000b004b55ddeb7e3sm1289593lfg.309.2023.05.08.05.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 05:35:09 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 08 May 2023 14:35:08 +0200
Message-Id: <20230426-stmpe-dt-bindings-v4-0-36fdd53d9919@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHzsWGQC/4WOQQ6CMBBFr0K6tgZahOrKexgXQzuFSaCQlhAJ4
 e62LEzc6PL/yXt/NhbQEwZ2yzbmcaFAo4uhPGVMd+Ba5GRiZiIXMi9FxcM8TMjNzBtyhlwbuJZ
 lfTWmLkAoFrkGAvLGg9NdIj/ACkOf7pNHS69j8/GMuaMwj349XlhEan+tLYLnXFh1gcJaqw3ce
 3Lgx/PoW5Z0i/yrkFGBoAtTywpLpb4U+76/AdGZL/8WAQAA
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
 Philippe Schenker <philippe.schenker@toradex.com>, 
 Stefan Agner <stefan@agner.ch>, Marek Vasut <marex@denx.de>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.12.1
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 0/2] STMPE device tree bindings
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

This adds the missing GPIO bindings for the STMPE port expander
and converts the existing MFD binding to YAML.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v4:
- Make the GPIO bindings a conversion: there were some old
  text bindings for the STMPE GPIO, we now delete them as
  part of the patch.
- I expect Lee or the DT binding tree to pick both patches.
- Link to v3: https://lore.kernel.org/r/20230426-stmpe-dt-bindings-v3-0-eac1d736e488@linaro.org

Changes in v3:
- Update to review feedback
- Collected some ack/review tags
- Link to v2: https://lore.kernel.org/r/20230426-stmpe-dt-bindings-v2-0-2f85a1fffcda@linaro.org

Changes in v2:
- Split off a separate GPIO binding
- Updated the MFD binding according to feedback

---
Linus Walleij (2):
      dt-bindings: gpio: Convert STMPE GPIO to YAML schema
      dt-bindings: MFD: Convert STMPE to YAML schema

 .../devicetree/bindings/gpio/gpio-stmpe.txt        |  17 --
 .../devicetree/bindings/gpio/st,stmpe-gpio.yaml    |  53 ++++
 .../devicetree/bindings/input/stmpe-keypad.txt     |  41 ---
 .../bindings/input/touchscreen/stmpe.txt           | 108 --------
 .../devicetree/bindings/mfd/st,stmpe.yaml          | 297 +++++++++++++++++++++
 Documentation/devicetree/bindings/mfd/stmpe.txt    |  42 ---
 6 files changed, 350 insertions(+), 208 deletions(-)
---
base-commit: b777e950b1e0b9112418e7669c8b6d96915df778
change-id: 20230426-stmpe-dt-bindings-c3479dd71a28

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
