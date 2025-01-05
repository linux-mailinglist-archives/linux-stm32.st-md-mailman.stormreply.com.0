Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D892A01B46
	for <lists+linux-stm32@lfdr.de>; Sun,  5 Jan 2025 19:15:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3741C78030;
	Sun,  5 Jan 2025 18:15:38 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A6BEC7802E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  5 Jan 2025 18:15:31 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-aab925654d9so2408463366b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 05 Jan 2025 10:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1736100931; x=1736705731;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7JaCiDSlWL3n6x9r8puiAFWGWFXePu89GjNolb6aW4M=;
 b=VnnnbuyOSSLJUi2eXk8I13h0/VSFNHF5/jzeZw10v4vSiB5K6jQvE7Ibki/d6shHjV
 qNh8gBHZVlcyW7gsaKg5gV6sknYNWwpMLZwhlipAW3f7Hd9KOhRRyBm1W2H2oa1D6BWa
 o+hrGdpaOP1KMDg/qvNlUMoTAG3/FXtodBTXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736100931; x=1736705731;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7JaCiDSlWL3n6x9r8puiAFWGWFXePu89GjNolb6aW4M=;
 b=R7oJZdjRzxGLay/KuBu2ieWkhc0VIAYzz2gTFGTG/swn+TSvDakoPzeM5j+/ioChAV
 KwJL6681/lYfv/DJb3sArliwL80H36W6GQp3uQXjYtWSGHONBr2eI50s3sr3ctMq+YAn
 gVORScghY1NT+lewexpw+JhlPeQFeVTp8ox7m2q8ngesb/X+7RoEAwDOnPBm92UruNbu
 6HrXb7GRMi5Ej7evir35WnlPZx4XzI+SANykaPTYpUu8Qqfskah48u7mG8sO2Dtx/e7A
 Pje6qrxLOwJcApCrM2CF0/MNChfTcCLAPTcj3M/ssNckDBeHlqTg1sB6/dOJTbS8YFzv
 i6Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCXe63tK77UBg4ua9pq806fRbcJh3/Na4V3wsuLC9BolUbQvYXXoMsyUQ9KFsBgpDIMheCw+ECx2f4zA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz15Py3WspzYMQEuXKM3SL5BGlpaLNEoGzHo+l1Gf+asFz7J/aQ
 rmphI2yflEhQnRs1oIiMqHZEPvIpH8IsG1J+fSHBX01wxNjCw4JyDss85fmclX8=
X-Gm-Gg: ASbGncvziTEIIPSsxXNK2HsY4+AmNQh7TMCqBjIdeTtYv8zWdht5bQPlr2lcL2QxdGd
 LlcEmOCTdb0mhHQhrjEmOq1vIyJE97xZMRtRht0DyvffVULZIw5+JL+m8znZIk5UG+cyzf9QVOI
 sPmfr49ZbqY4KzFlhU7MjWxRA9q6BnotHKTxoRMRAD8lXK9U3g2Z98kIYSkHii57wkUONG3Cq7A
 1qVMpZCOCuNRRh84BGnZrbPYq6Hmc/Ys2PNu2sDhIz26UyGfUEu1CFU0BklydqYgJ9HK/WmZErN
 nbtG1lxJGspl6sa1DKExU3HhR+DlzB0+YZzWWUhGgOzLRRcQLfIQlelSyDv0zLQ072NDrUCZ/vU
 K3FpzOOloRLstGTtjqA==
X-Google-Smtp-Source: AGHT+IGx5I432/7zv90tAswquFGM3JlzRsAxUeSnbD4QR3LNzbPaGo4Vdu+XKbNBzzfORLPTWC5EKQ==
X-Received: by 2002:a17:907:7dab:b0:aa6:98c9:aadc with SMTP id
 a640c23a62f3a-aac2d45fb01mr5099786866b.31.1736100930471; 
 Sun, 05 Jan 2025 10:15:30 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e82f178sm2138185066b.38.2025.01.05.10.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 10:15:29 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun,  5 Jan 2025 19:14:12 +0100
Message-ID: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/6] Support spread spectrum clocking for
	stm32f{4, 7} platforms
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

The series adds support for spread spectrum clocking for stm32f{4,7}
main PLL.

To achieve this, it was considered necessary to also apply patches to
improve the documentation (conversion of st,stm32-rcc.txt according to
the json-schema) and the code (use of FIELD helpers).

The series has been tested on the STM32F469I-DISCO board.


Dario Binacchi (6):
  dt-bindings: clock: convert stm32 rcc bindings to json-schema
  dt-bindings: reset: st,stm32-rcc: update reference due to rename
  dt-bindings: clock: stm32fx: update reference due to rename
  dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking
  clk: stm32f4: use FIELD helpers to access the PLLCFGR fields
  clk: stm32f4: support spread spectrum clock generation

 .../bindings/clock/st,stm32-rcc.txt           | 138 --------------
 .../bindings/clock/st,stm32-rcc.yaml          | 170 ++++++++++++++++++
 .../bindings/reset/st,stm32-rcc.txt           |   2 +-
 drivers/clk/clk-stm32f4.c                     | 155 +++++++++++++++-
 include/dt-bindings/clock/stm32fx-clock.h     |   2 +-
 5 files changed, 321 insertions(+), 146 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
