Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF7EA102BE
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2025 10:11:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83C07C7802D;
	Tue, 14 Jan 2025 09:11:33 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA521C7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 09:11:32 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-aaee0b309adso859462166b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 01:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1736845892; x=1737450692;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tBJtngiebfYxaY6Xsqyz7X62QEYJt/s8BWutCfjsmVg=;
 b=TX30Z41kef2HWZ0NPPOwpWMuEd0RRCooODH1DPsTGb3Et8FxIbiWjtP4IrFDP7nOI0
 KG3DxHTQETaOOnex+z3HzKAjq0tBbMgQQsYlfbW8dZ2Dv7O0EeDQJXe/b+fWNKXSrehT
 26K7gk7nUcgODR6QUjigKLGvirmkPpmEwduv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736845892; x=1737450692;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tBJtngiebfYxaY6Xsqyz7X62QEYJt/s8BWutCfjsmVg=;
 b=co4daT2J13Y1mMahhuarzMElX6CdEBxW9xMic9y+JzBbXbpAb1lPxidpgh0m4gCjJ4
 RaMJwWxA/V7FK6Ni2HodIJM1zHTUeVhCh4WezlUUoumMHHcivckMMPbdXgjxS4NFCllV
 DgitKlmA3YcU7TuXddRSm2UCH1ellj+kvA03DOE76jpUzZPfY6QuMCK63do3/BDyqrzS
 5szIuLcm4CnMccqvt6Feql7DqqHCrt3xqFdnywA8lYCwHJVLzLeU32Ao8Kllv52RCDA7
 HWrflrBF1IRIgpPxAUD+vwKdzLz8ZtcPhLDjpldI6fYr6V88MpY4Q53fVcrg1Y9REJVz
 p1Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhoKn1P3NM0qby8xSsdGRcUAo0UHaq7bbxH/sxcf8vGiRUAw4iLno4At2vLDHcA+LqBnbMHn/XigsOTA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzNMgiXdvSlS7w9BRfLVoB249pv3EhJiWedmsEAnvimWbbqBQmj
 8cPEpa4qzOf3xS+v14ZylWbwYLAaziKnI+Wg3U+J+La2B8Y78GgXuOsBSSV4itw=
X-Gm-Gg: ASbGncuE0DLVE36EkjLjzudvM9ybZPnGwS9N8LoWqm8JrWkbwafp9c7qci2hPMEe2o+
 4zUIDedHmIfDVhDuZP/KjzmMSHanNhyndUnc0MCY7fJm313QLcJqfXM2NyaozIAHN+TdQMzBLRg
 p4sMgwEvDGbOnNp39Mh9XO11462IqAg8XIcIZQU8RjeL7AjZGduB5cKnWGYnNTvzLkMXNJgQJBF
 zwpxg4kbRZCSpKPoOKQuKPHfix0lJeQ5TqleZrddlnSo6YnHhm3MSp81wEs8sD4whXochvkQrIp
 5RDSRLqvjArhoRuog4nrTQ==
X-Google-Smtp-Source: AGHT+IFP0NoB1nleymlyPhioCTpMBb5sIxJwE/HcZBxgMFsQqKGSpudKtOUDjpU6FXv2wGNPs8+Egg==
X-Received: by 2002:a17:907:7e91:b0:aa6:834b:d138 with SMTP id
 a640c23a62f3a-ab2ab6b52e7mr2115633366b.19.1736845892238; 
 Tue, 14 Jan 2025 01:11:32 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.147])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95b7317sm599640766b.154.2025.01.14.01.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 01:11:31 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 14 Jan 2025 10:11:12 +0100
Message-ID: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
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
Subject: [Linux-stm32] [PATCH v3 0/4] Support spread spectrum clocking for
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
 .../bindings/clock/st,stm32-rcc.yaml          | 147 +++++++++++++++++
 .../bindings/reset/st,stm32-rcc.txt           |   2 +-
 drivers/clk/clk-stm32f4.c                     | 155 +++++++++++++++++-
 include/dt-bindings/clock/stm32fx-clock.h     |   2 +-
 5 files changed, 298 insertions(+), 146 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
