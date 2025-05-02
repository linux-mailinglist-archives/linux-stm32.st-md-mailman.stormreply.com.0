Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EBDAA727A
	for <lists+linux-stm32@lfdr.de>; Fri,  2 May 2025 14:46:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8FD6C78025;
	Fri,  2 May 2025 12:46:34 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 572A1C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 May 2025 12:46:33 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-39d83782ef6so2053117f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 May 2025 05:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746189993; x=1746794793;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c2FlfXbn4hS/8cFqnyoFgpNVEhmx+w6APuLnXY7ftuw=;
 b=B2iOEUR+aXtLjo30SKPCGFKKvQwD5PwDL+dNgldKOh9N5i5TtXir7uLdszJZgXbd+J
 c7RRS9InLxuq7Pi0dKq/6ZQ3M9a/MGqjGMUL2hwMbPrQy2bBaZBIxlmzg63C53dFqlXo
 UiJD5lNQ0BizzUiRH1kPbYgrrwrSVKJcy8aZzRKd65M0SjKebNaCzrT+UDCCwkFRFPiO
 Q+0J/2ZOb16hPsNyq1fLL8MT28S7qWI1SeFooqt+OjCDf75nBkxMhqJa1Tr5ZKHbKBmx
 8oBPoymh3JsjGdUuGrcZySnjBko4sZn8JyEVIcgCrvWaAiY9pk94bIiNk4TU66jQeoSy
 HLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746189993; x=1746794793;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c2FlfXbn4hS/8cFqnyoFgpNVEhmx+w6APuLnXY7ftuw=;
 b=rVErH5pO/lk4r10WT4I8SN9rCImGDyugzY6VbS7d+UctuSJhmFDFUnxvvLidK3EAEm
 LQZVEgczqYX8j+3vPKqjMk6xG434ewpTMR/WJx+3H8oNr6oVj/G2c3UkhDnkg+b1tZfM
 8y3KjHTqhXB2yRr1Qu/vSqiRVm49dqaYR7AHAiyx75FijXkbU8mWqly9kdpVQ2sxJPpv
 ywFXI0BJ6mn5PiId0JxNl0LkR6zikgW/jlG8UrAo/sTSfqgRKGMPlOwt9CIV9DcChQvw
 sXrOXPkHU38mWcO/rCTnH0HGYDZaQzqWLbPwyM03zvcMy0UAqSzKF/LxBx7/7P6s0kjb
 jF2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVORs7ho7Q+nXphQmkWzGULPGzjgekxf4cimiCj9zpA/s/7yqpdyWQPqHLytnuBD8PVhrhfaEo9StM8oQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwuVBcnFURKYwjlKSWwWvABHYoPdhjzfuatGLoDe8Fr5wB8DmtH
 zAAr6FqPhF8sL6PDc4NhJlQ4pDd15VdkiS/iQNuh9a6esRdiZIOr
X-Gm-Gg: ASbGncufPTWhuBE1364DDnv8iWCEL7rQdd/EpkWC6LZ/d/JLadJFZk0mHW/OHjUOfi0
 IjbF/pvvggXiAg5Havh4/3ogEehK1CvomBi/J+Y/SbvubvufG9dDn/MRzxw0mDlC/fK1aFNENMZ
 hWFIKwDoanwx+AHvAjom9YIFitF4aCksa88hRWCQPf5R6CokJL1vCfjwgsCTMl3pF4TNC8lgMHE
 CYUvkJVtk5eVyGI6bsahHaXiC9QT2u7F+pkvB9bMOjUvo3lCH74YUMBtN610/Eq31EEGtFWIgvY
 EhhFGIba12CBFh0VgUYIPV2FCwMV2KjMSi3dM9ecD+yGiR3S/LvCpxqfqAuXDRo2
X-Google-Smtp-Source: AGHT+IEO0uGPBo17YbzVD8A6eqC8NmxQ95EKCHHFrtSUvfPzFyesp/iA2RvWvGw6zbn1FJK1xRraCA==
X-Received: by 2002:a05:6000:3105:b0:39f:bfa:7c90 with SMTP id
 ffacd0b85a97d-3a094038a8fmr4804593f8f.13.1746189992635; 
 Fri, 02 May 2025 05:46:32 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:10cf:e432:b2b:bf99])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099b0f16fsm2059134f8f.77.2025.05.02.05.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 05:46:32 -0700 (PDT)
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
Date: Fri,  2 May 2025 13:46:25 +0100
Message-ID: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/2] Add support for Renesas OSTM on RZ/V2N
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
  clocksource/drivers/renesas-ostm: Enable reprobe for all ARM64 SoCs

 .../devicetree/bindings/timer/renesas,ostm.yaml      | 12 ++++++------
 drivers/clocksource/renesas-ostm.c                   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
