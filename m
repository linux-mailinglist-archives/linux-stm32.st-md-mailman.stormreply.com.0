Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D71856EF34A
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Apr 2023 13:21:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60862C6907A;
	Wed, 26 Apr 2023 11:21:42 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A774C69069
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Apr 2023 11:21:41 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-4efe9a98736so4675124e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Apr 2023 04:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682508101; x=1685100101;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G9naGDk48Zj+PlZ+Jp1u6lFmP1KTwqXU2XbLPAygHrI=;
 b=eqcXXYmFnj/dE5MQy0eqvxRenOIf3Z5w0huIAj08pe9EuYktVgOpHNkRQl8wT1jn3I
 XXDUJL0HnftlZTRlZKuhAJy4m7b7lpQU7AreWOgWmdfAhiAXaEzQSMzPUWHHESLy34YD
 5m20EeE+Wl7tUMgCB9j9GS6Y4NENmrvk5SVXd4yHV8IVr4pfeQfFaY+m7PxA7a+K4hNo
 Rh06I9iWHUQl+NT9tIejugGmuIQmzXfjgZVf5sQbKarcAdVlHYsThSMF6ATbIBlHXU5O
 bRg11fPfPvjO/uOPsF4/zOxxqNJmBs9Woyg+EgHr+wVA/LUUPL+yDU7AmZ1G+A9eMiDf
 TuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682508101; x=1685100101;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G9naGDk48Zj+PlZ+Jp1u6lFmP1KTwqXU2XbLPAygHrI=;
 b=LTSLCqygZCe9qFjXbgjc6wkeKipkttDE8sP8vKUz53/ESXWslNJ8Buo+g8za/HuL3F
 Gi/Hi6DgZlI1bBFbhu1cDM+cVtrCJke0MdInxsVWAJKa7rrBSlgMLSpxCbBXeI9rNG53
 sXNVX2PwugqnhNEo4OCWkoLfxnfO6LRHnhVH/TsvpyncDt9Qw0IVbCuW4g87ioF4Yl8D
 rPT0R/Fk/69SGAwd8gTWD8X/8K4lAQxDBT+P+JQQ8a0ag+bcBtfu1Wip515BjuGMSatN
 5+qvi2Xk7pnj50smug9ss/xYjWsXwdQnez9QvB6R77g75eaTYt2RkxyoCpTTLDRe3KGi
 E9ow==
X-Gm-Message-State: AAQBX9eNpbd8BT40zzJIA7NEwE031SJuG2G7Oyjy8oh7ITBzvRdtIbZF
 EjJZla5FOjH1rjgngJJrBOgDQw==
X-Google-Smtp-Source: AKy350Z4JDBnZVGtAj1Of/ojtlbjuivI9YyfI2Ny9UUwpUefKlwDymDGD1MQW/sISWtNsuN/8HTHJg==
X-Received: by 2002:ac2:4ade:0:b0:4e9:c627:195d with SMTP id
 m30-20020ac24ade000000b004e9c627195dmr5125919lfp.57.1682508100620; 
 Wed, 26 Apr 2023 04:21:40 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 u28-20020a056512041c00b004ec84d24818sm2453237lfk.282.2023.04.26.04.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 04:21:40 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Apr 2023 13:21:37 +0200
Message-Id: <20230426-stmpe-dt-bindings-v2-0-2f85a1fffcda@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEEJSWQC/z3NQQrCQAyF4auUrA3UtFj1KtJFZhLbgB3LpIhSe
 nenLlz+PD7eCq7Z1OFarZD1ZW7PVIIOFcSR06BoUhqopqZu6YS+TLOiLBgsiaXBMTZtdxHpjkx
 nKC6wK4bMKY67/IMPT499n7Pe7f37vPXb9gUhrSZ3gwAAAA==
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
 Philippe Schenker <philippe.schenker@toradex.com>, 
 Stefan Agner <stefan@agner.ch>, Marek Vasut <marex@denx.de>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.12.1
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/2] STMPE device tree bindings
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

ChangeLog v1->v2:
- Split off a separate GPIO binding
- Updated the MFD binding according to feedback

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (2):
      dt-bindings: gpio: Add STMPE YAML DT schema
      dt-bindings: MFD: Convert STMPE to YAML schema

 .../devicetree/bindings/gpio/st,stmpe-gpio.yaml    |  60 +++++
 .../devicetree/bindings/input/stmpe-keypad.txt     |  41 ---
 .../bindings/input/touchscreen/stmpe.txt           | 108 --------
 .../devicetree/bindings/mfd/st,stmpe.yaml          | 298 +++++++++++++++++++++
 Documentation/devicetree/bindings/mfd/stmpe.txt    |  42 ---
 5 files changed, 358 insertions(+), 191 deletions(-)
---
base-commit: 457391b0380335d5e9a5babdec90ac53928b23b4
change-id: 20230426-stmpe-dt-bindings-c3479dd71a28

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
