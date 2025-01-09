Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46090A08218
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jan 2025 22:19:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10CA9C78011;
	Thu,  9 Jan 2025 21:19:16 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59B4AC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2025 21:19:14 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5d88c355e0dso2269593a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Jan 2025 13:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1736457554; x=1737062354;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nYWwEHMv7Pi4/aMuIfIEd0m898Lr2Kb8/a+FILyxHPY=;
 b=iWYr3M8XnOtlch91OG5pnaj5UV94nQh9eTxpExHWeWg3kpeViZhvbxi+bMbqtuC4pt
 BFdXdHyaCjytvRvztPYab6wDWYSuPb21bjRubIkbpoYK/aX4SCujkaWpAJTem6W99t2M
 dJ57nDWebiDtUjGVGK2Ao5iMh2l7TqUoJPvHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736457554; x=1737062354;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nYWwEHMv7Pi4/aMuIfIEd0m898Lr2Kb8/a+FILyxHPY=;
 b=KCYgNJ+U6LvuY59kkQPrZFRo8OMamGjUHMZnBU26tPz/vxtaxjRaKLsD3QMSLMV6re
 bXTtp+936RGjefcm/dnFol6km8FqkllhlZOyxlgC3Rf2yjWpYpo3e4rhkYnZBkJa82iK
 5DMpY/woKBZvnmX+zPGDSsnTFXdFLFwe5gc26XWGjQXZFdul+qGbUGnxRpaVKNve4/iL
 mTt/yPKpQf3Xkh4q20TkiTiVzyU80cwtzie9DB7BITrVmVHAM6COTasprvrujm8eDXy4
 ZaBWGaKIn5R7usXSyoDfjBJZVKCilMM1n9K5wqHC4Exbzqu6iSYUHB+RwNfWGvjAFzew
 idFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo9T8M/E7830/wtp/ZW9Tfkan5Dn4ISK2AKMsAup8XeNsZNW6vvDkJ1PRmzX5Db3ylIm1UdpO2errpSA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YziVOKWARLXt/rxrBu12qWUjPWQtxfwD/YJijuiWKuzjB49DRGt
 E+sJdn9MjVx3vLg+AVit3xIYEbmGp4uQTwwzE8MC4sccZ7qdOQ+ppC/k3UaxMT0=
X-Gm-Gg: ASbGncvqwU7v2VEz2orNZ5rEE/jQAZVbKdrzXTRkAwlYfYbKt6gphBN8GzRc6bRWjQW
 s1afXWVO0l5tlm+Kkkdn3FC7plzbIVC0hOfM8ScsC7rhP/Q/yhUcxD0BHwQcp6F/9ImvJODVLQS
 JlQs7kZio7dZo7qdIQR7XTIZJEwKqAE23jBmGiTToDo6NfqrZYih1sWY+82F8MC3sMyo11s8Cxw
 7LmpBqMoctqDBVHGDORcPf5KajAHMyMOf/rJMIe+c6dXz7ert/melshHIq7CkjUMkMxaGstwRRl
 0w9sCmDWs6TVPc+a0CkD6ZOGVaOcdDuNY/dwC7norabIBQ9KbasKQr7ERNXn2S+Ej59+Pi1Fugl
 D/I0XkQqyJ04KtQpldQ==
X-Google-Smtp-Source: AGHT+IGDVisAyEQwSigpcUtiYjGMdYnHM9AmzlwjHAKTXZuLBmm721gRf+PfVKaw25o+OkloXI5uXA==
X-Received: by 2002:a05:6402:430c:b0:5d3:e45d:ba7c with SMTP id
 4fb4d7f45d1cf-5d972e7148bmr6635147a12.29.1736457553855; 
 Thu, 09 Jan 2025 13:19:13 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9900c4b56sm925567a12.32.2025.01.09.13.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 13:19:12 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Thu,  9 Jan 2025 22:18:27 +0100
Message-ID: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
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
Subject: [Linux-stm32] [PATCH v2 0/4] Support spread spectrum clocking for
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
