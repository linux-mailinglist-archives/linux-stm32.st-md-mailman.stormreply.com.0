Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5178A10FCF
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2025 19:20:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A1C8C78F64;
	Tue, 14 Jan 2025 18:20:34 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 408C2C78032
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 18:20:26 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-38634c35129so4092010f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 10:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1736878825; x=1737483625;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GeNVBB/i2U4Nsgj/JNEuuNrVAFqI6yjOJA02Gh323ro=;
 b=CA8Wh67fkOn7dYLd0N+W3lcNBe+wRVN4+12cg3cqzDOC9drHY4JVRtQbiHO9tOv1EP
 RoP0guRJbDENSJmXqwOrHTfX38l/aIOMclbZLxkjRrtPAnWhpfNuto8BRBcyfNpWJN4D
 5hkHXa2tw4k1l1ZK5v7Rlzmf+tYca4bymdiHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736878825; x=1737483625;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GeNVBB/i2U4Nsgj/JNEuuNrVAFqI6yjOJA02Gh323ro=;
 b=ek8moLdmgFETb7X+aZ9T4CVirfPulYRYE5+vb92hs+Yjvr+kcQL/OHKDVU3bRe7Kvx
 kAbvAOvFU/PNmPuegkIUHpgcLujgeHA0/2wWQrrx+e4cJREHw15prnRLnoUFamH2+5bM
 9hrxTBU0Mz8j1NRPq1U1H2+RbVHbvL0KpHD05IxrXiBEAHbqcBDVIIjgNfhfQ7Kautwy
 xm9sbK//n5kUTe77Gy1N2+CvUl2RQhFqDLpkCLmNUgbAAMcGzxQ+a3yiOwbxjVrPjmQi
 1G4Xfoodd9QiUkoPHzi3IHu8/kxgImMTzlpDoHyLZE3RN/gtjgJuBiCK12FrNTaE/5Ez
 8i2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdai1ejm0jYyKa7BLc9vRhWcFqvuYtDHP8Oy92Of6j8OPbcOW49/hHMUt9ayCg5/Ktb13HJc/6EqJVLQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxj/79+esLI+YrPUSPIXxCd09sSjBEyXdMPyhkCWlQh+yA/ZLs3
 Ypz+tE+3a8ku+PQwD7pTRgpEtpHqL6VQpl3OzILDZsU8du4A5GUyltlBPOl2/+A=
X-Gm-Gg: ASbGncu2fZixsOlATpIkXV61hWmmvf42ZmzSYS7d8FI/aGrqMn/FmoFvPlTtMGB8boB
 2eSYrfY2jziA5TeGTNInmnRfb7sC6TNemMla0ld8hPjMAmxU2KzPyU42Q+f+hxLY/+zQ1E3iz9V
 qegG/lSeogh0VDF41RMNOCfyPkP06N5wlsSWQQ9Hiwx4H8rOTHG9ksDo8CgeEOV5ZrmCaCSKGvP
 gJCQuUJyu8xQD2zeqAJQwGNvUcCe/Td+2ewi2/LrnZA5L4/Binz1ZMfKQmlQ9gafQTP3b6HYCJ5
 OjTsqw7QSXQBpeDSIY0/Vw==
X-Google-Smtp-Source: AGHT+IF0OmB7x+n/pD4cD65liw1i2aC27PQyOn8ab2eaRaudsoa2gu0gSMltwYB/uF3S1FkWb2D2yA==
X-Received: by 2002:a05:6000:2a2:b0:38a:8906:6b66 with SMTP id
 ffacd0b85a97d-38a89066f45mr26441005f8f.38.1736878825526; 
 Tue, 14 Jan 2025 10:20:25 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.147])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38be66b01c7sm278970f8f.22.2025.01.14.10.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 10:20:25 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 14 Jan 2025 19:19:45 +0100
Message-ID: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com>
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
Subject: [Linux-stm32] [PATCH v4 0/4] Support spread spectrum clocking for
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
improve the documentation (conversion of `st,stm32-rcc.txt` according to
the json-schema) and the code (use of FIELD helpers).

The series has been tested on the STM32F469I-DISCO board.

Changes in v4:
- Improve the compatible property in patch 1/4 "dt-bindings: clock:
  convert stm32 rcc bindings to json-schema"

Changes in v3:
- Changes to patch 4/4 "clk: stm32f4: support spread spectrum clock generation"
  according to Stephen Boyd's suggestions.

Changes in v2:
- Fixup patches:
  2/6 dt-bindings: reset: st,stm32-rcc: update reference due to rename
  3/6 dt-bindings: clock: stm32fx: update reference due to rename
  to
  1/6 dt-bindings: clock: convert stm32 rcc bindings to json-schema
- Changes to dt-bindings: clock: convert stm32 rcc bindings to json-schema
- Changes to dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking

Dario Binacchi (4):
  dt-bindings: clock: convert stm32 rcc bindings to json-schema
  dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking
  clk: stm32f4: use FIELD helpers to access the PLLCFGR fields
  clk: stm32f4: support spread spectrum clock generation

 .../bindings/clock/st,stm32-rcc.txt           | 138 ----------------
 .../bindings/clock/st,stm32-rcc.yaml          | 144 ++++++++++++++++
 .../bindings/reset/st,stm32-rcc.txt           |   2 +-
 drivers/clk/clk-stm32f4.c                     | 155 +++++++++++++++++-
 include/dt-bindings/clock/stm32fx-clock.h     |   2 +-
 5 files changed, 295 insertions(+), 146 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
