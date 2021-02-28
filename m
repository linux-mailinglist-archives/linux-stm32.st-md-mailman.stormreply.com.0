Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39908327310
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Feb 2021 16:43:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAB36C56635;
	Sun, 28 Feb 2021 15:43:44 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6760C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 15:43:42 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id i10so589824pfk.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 07:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nJS6qrjZ8dafduMG2mJ+d0lKpg1t0+WahrbSxWdeR6w=;
 b=WpOAosuE+317rG0hKkZT1QmVtawXOC+4f0laoXjx8uwmSbOFP/rSCEua8dh6FW8kZa
 zjYOpFaJ5oUASIXytJIJVFymbethww49+LhvwpTBDFr65qYW1qDu6r46/hxteb0f4YVo
 nCDIkJVk4mKuqUZR6njHPeqGpdkS3WFpbhQ6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nJS6qrjZ8dafduMG2mJ+d0lKpg1t0+WahrbSxWdeR6w=;
 b=Pya4J951AHaVOc/RYI4HIXHGPh+dzz8skpDDKsEO1nfXuyux7NgkGTug0HiIOBdDDv
 8GWjydUjC36mchGWkv/sTwLg7y2VjUzYuyXmKwaobhizWkbtoVOaMsKUz8NsOHBszoea
 /bcBZ1hiPpoHlosJhddGV11gqm/7Sr9WVHomXOn1GC8Figeq9e8j0kEtEZFtqEloMQqA
 UdaAP06LyOvxeo8J73oYgWfdNzF86qjqVF/e7Zw64ZQuU9idHuFRHJed4/g/JGQSMgbF
 p6CNpTyw4FvbGuWzx3a6E8eSfa/8RXvFIzQ6uzC8y5BVd58mClD4P5bi5WOXkR4YGtUb
 DenA==
X-Gm-Message-State: AOAM533/JlmjpeJhVTz7h4BH2JOx+s7lJvKh9iNABtzCvPPE/NQjV+js
 eEoBdsOfR9dtQlufX6w91gz1Lg==
X-Google-Smtp-Source: ABdhPJwU+CCyfO3HGbmKVzzzxLyes6sekTdA2PHQPy2a8tgbO6xRdrip418RZFLLHbJMbMkv3iS/pw==
X-Received: by 2002:a63:1505:: with SMTP id v5mr10567310pgl.95.1614527020647; 
 Sun, 28 Feb 2021 07:43:40 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([103.161.30.225])
 by smtp.gmail.com with ESMTPSA id j3sm13522133pgk.24.2021.02.28.07.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 07:43:40 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Sun, 28 Feb 2021 21:13:13 +0530
Message-Id: <20210228154323.76911-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 00/10] ARM: dts: stm32: Add Engicam
	STM32MP1 SoM
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

This is the initial series to support Engicam MicroGEA STM32MP1 and
i.Core STM32MP1 SoM and it's associated carrier board dts(i) support.

Changes for v3:
- fixed v2 comments
- updated commit messages
Changes for v2:
- fixed v1 comments
- add i.Core STM32MP1 SoM 

Any inputs?
Jagan.

Jagan Teki (10):
  dt-bindings: arm: stm32: Add Engicam MicroGEA STM32MP1 MicroDev 2.0
  ARM: dts: stm32: Add Engicam MicroGEA STM32MP1 SoM
  ARM: dts: stm32: Add Engicam MicroGEA STM32MP1 MicroDev 2.0 board
  dt-bindings: arm: stm32: Add Engicam MicroGEA STM32MP1 MicroDev 2.0 7" OF
  ARM: dts: stm32: Add Engicam MicroGEA STM32MP1 MicroDev 2.0 7" OF
  dt-bindings: arm: stm32: Add Engicam i.Core STM32MP1 C.TOUCH 2.0
  ARM: dts: stm32: Add Engicam i.Core STM32MP1 SoM
  ARM: dts: stm32: Add Engicam i.Core STM32MP1 C.TOUCH 2.0
  dt-bindings: arm: stm32: Add Engicam i.Core STM32MP1 EDIMM2.2 Starter Kit
  ARM: dts: stm32: Add Engicam i.Core STM32MP1 EDIMM2.2 Starter Kit

 .../devicetree/bindings/arm/stm32/stm32.yaml  |  17 ++
 arch/arm/boot/dts/Makefile                    |   4 +
 .../stm32mp157a-icore-stm32mp1-ctouch2.dts    |  47 +++++
 .../stm32mp157a-icore-stm32mp1-edimm2.2.dts   |  47 +++++
 .../boot/dts/stm32mp157a-icore-stm32mp1.dtsi  | 196 ++++++++++++++++++
 ...157a-microgea-stm32mp1-microdev2.0-of7.dts | 154 ++++++++++++++
 ...32mp157a-microgea-stm32mp1-microdev2.0.dts |  55 +++++
 .../dts/stm32mp157a-microgea-stm32mp1.dtsi    | 148 +++++++++++++
 8 files changed, 668 insertions(+)
 create mode 100644 arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-ctouch2.dts
 create mode 100644 arch/arm/boot/dts/stm32mp157a-icore-stm32mp1-edimm2.2.dts
 create mode 100644 arch/arm/boot/dts/stm32mp157a-icore-stm32mp1.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
 create mode 100644 arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts
 create mode 100644 arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
