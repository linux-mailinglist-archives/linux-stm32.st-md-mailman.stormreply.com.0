Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0384D6F9BC1
	for <lists+linux-stm32@lfdr.de>; Sun,  7 May 2023 23:19:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65E5AC6A5F7;
	Sun,  7 May 2023 21:19:23 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2297DC6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  7 May 2023 21:19:22 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-4f24d4900bbso700136e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 07 May 2023 14:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683494361; x=1686086361;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7M6ub/NmPwBZXz6BefX6rH5VtXUTAlDRqSeqfc1qlxg=;
 b=EsAGTRj4To4BnlSeJPHuQ6zLtRUgWkHzrZG3B2PmWYSFLmEvY/OCEu/yuc2F8AtK82
 /OSXzCpBPOQGFMw+g1cqRYA1gS51dfuMHx+IsN1a4qsqhUJlO0THP8/1rscWRTQiQQN1
 SUbhDJVLQZPbRkCKZcdFulgZpMs6h/brht98wBzdimvW51IcqLh+M5xH5zJL7/Q0h0ph
 dR7hRuSXpn5nLr41KfQBq77unyiZL6lQmBG+LPH1Ml0GTNZ8kqntxU8UCoTMMLfgsbS1
 8BalEB+UDuc7452mxBLZBr0VN1v1pdw6ex3KXsNvbhEfKyB+Hyh5t+kxO2jwQ/3Snyxw
 kCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683494361; x=1686086361;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7M6ub/NmPwBZXz6BefX6rH5VtXUTAlDRqSeqfc1qlxg=;
 b=GNnX5HAQReT0PLHd9bL4shDZoMQYMDhCDsK+ybknBI1UlYnuk7kwLZGIIs+me7vBh2
 4TTnvgfa6ad7I1O9+6TsZtyoiDZOyviunmy72ItQjGBrjN0bj8YvO8AAtsGLBaymyNZL
 IyYqbAUsQtP3E2NBSQ1bW5LotcpsSYoy2vCBlK2H+VqJyis8A+nALqngIZo1AdoP1wfr
 pNNqkRHuCimPhCATy66O+KdLDdI/bAvmAdbujjqZ7mMIZh+D6OsBHEE1TJacV3agKVKL
 87JX+TbmzrJUPABSAhAhngXevy9XVcaZxlYHCHP9VH2pP6kwGwoV4IOEMGgIvGQ0R7jU
 mmfQ==
X-Gm-Message-State: AC+VfDzYB7ocic3Ns/yAxIMIt4Dl2QVIsDWLz9mpesBxXHC4DGCFuaZj
 G3bzZfWcU96eqmbCjMP8yHQaMg==
X-Google-Smtp-Source: ACHHUZ42PhnxOTSa9MUk+fDi4qwQQ2n7hdg3WYajR6JoHgqh87ZZbsxPnSWkcYDti3YOqkZNiHTpUQ==
X-Received: by 2002:a05:6512:2185:b0:4f1:1de7:1aac with SMTP id
 b5-20020a056512218500b004f11de71aacmr2169073lft.20.1683494361230; 
 Sun, 07 May 2023 14:19:21 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 c27-20020ac244bb000000b004f195cc3918sm623424lfm.176.2023.05.07.14.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 14:19:20 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 07 May 2023 23:19:18 +0200
Message-Id: <20230426-stmpe-dt-bindings-v3-0-eac1d736e488@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANYVWGQC/32OOw6DMBBEr4JcZyMwJJBUuUdEsfgDK4GNvBYKQ
 tw9hiJlyjejp5lNsAlkWDyzTQSzEJN3CcpLJtSArjdAOrGQuSzzSt6B4zQb0BE6cppcz6DKqn5
 oXRcoG5G8DtlAF9Cp4TB/worTePRzMJY+5+a7TTwQRx/W88Iij/Tf2iIhB2mbGxbWWqXxNZLD4
 K8+9KLd9/0LVFwtENMAAAA=
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
Subject: [Linux-stm32] [PATCH v3 0/2] STMPE device tree bindings
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
Changes in v3:
- Update to review feedback
- Collected some ack/review tags
- I guess Bartosz should apply 1/2 and Lee should apply 2/2.
- Link to v2: https://lore.kernel.org/r/20230426-stmpe-dt-bindings-v2-0-2f85a1fffcda@linaro.org

Changes in v2:
- Split off a separate GPIO binding
- Updated the MFD binding according to feedback

---
Linus Walleij (2):
      dt-bindings: gpio: Add STMPE YAML DT schema
      dt-bindings: MFD: Convert STMPE to YAML schema

 .../devicetree/bindings/gpio/st,stmpe-gpio.yaml    |  51 ++++
 .../devicetree/bindings/input/stmpe-keypad.txt     |  41 ---
 .../bindings/input/touchscreen/stmpe.txt           | 108 --------
 .../devicetree/bindings/mfd/st,stmpe.yaml          | 297 +++++++++++++++++++++
 Documentation/devicetree/bindings/mfd/stmpe.txt    |  42 ---
 5 files changed, 348 insertions(+), 191 deletions(-)
---
base-commit: c712a112ed4e91afab1cc7c978af228c77a4fb13
change-id: 20230426-stmpe-dt-bindings-c3479dd71a28

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
