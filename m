Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C97EB2E20B7
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Dec 2020 20:15:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7106DC57183;
	Wed, 23 Dec 2020 19:15:48 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A764CC5660F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Dec 2020 19:15:46 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id e2so136539plt.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Dec 2020 11:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ALRcLK4O4+D5f37pUZG4i9TvZILQCAE+H6Afc3wmxiQ=;
 b=Su8AVDFmrOjPvMr6V+fcjbSTsmzpK729Jx+V31N47wJjGaIr10pxavsx/8lpmUVSnG
 Ci/W3O9rOZIuEz6S8Qgsue/v5s0IuaPo/OV2pmZe+l+Dl3uSbBz7ifp7VCuLQU7SXYTY
 3tWA0qrYk/Hmbm51roluWdyAZEv4rbHOIVA7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ALRcLK4O4+D5f37pUZG4i9TvZILQCAE+H6Afc3wmxiQ=;
 b=HuXc4Kf1P/c67LD5zTx/NIPgHzLBFOtn0E7MJm6m3NJgvcp5DJ+VioQG4WcATuFCN/
 9sNDMbjfQEajEbeFMHZQ0VBTzzCofiZ3N2idJd7vzUUAkaMXKkWpFfM8PaMPJ5h9de9g
 Z6XWveXm9J3GJzvhArx4Vhk60i9QEnbe4l6OcPwL6/zVFawDy/qZ7lzMNEAqrLuB+Lb9
 ydvm+EtGPokQ08p2hSVcmeSN+oBMTy5hxi/xDCc3v3fX0aMW1yE9pDGbd/QOuU58/n9B
 B3gtECpneTkAe5MxuCX4N7+wKqEPAWqbsYgjg6BBKp/fAO421naJUDDM8/CZsWGa6QQK
 oQFA==
X-Gm-Message-State: AOAM533eJmfFZ9UATDQIG44rWH4E8gzgtIAUFCB9yK0CAh12VeeOjf+0
 kve2TnWLbuH0NSJjT5yYDdlQSw==
X-Google-Smtp-Source: ABdhPJzHHsKKA8084Hskzd1mlI1QvZ3SKWcsCeQXrWzvCLkGCuL8qKsUSiCpa3sQ6tsy0wTJbGphpw==
X-Received: by 2002:a17:902:ed45:b029:da:c274:d7ac with SMTP id
 y5-20020a170902ed45b02900dac274d7acmr26550233plb.69.1608750945056; 
 Wed, 23 Dec 2020 11:15:45 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a884:29f0:6e54:608c:e1b9])
 by smtp.gmail.com with ESMTPSA id i2sm397640pjd.21.2020.12.23.11.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Dec 2020 11:15:44 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Thu, 24 Dec 2020 00:43:57 +0530
Message-Id: <20201223191402.378560-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/5] ARM: dts: stm32: Add Engicam MicroGEA
	STM32MP1
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

This is the initial series to support Engicam MicroGEA STM32MP1
SoM and it's associated carrier board dts(i) support.

MicroGEA STM32MP1 is an EDIMM SoM based on STM32MP157A from Engicam.

MicroGEA STM32MP1 needs to mount on top of Engicam carrier boards for
creating complete platform boards.

Possible carrier boards are,
- MicroDev 2.0
- MicroDev 7" Open Frame.

Any inputs?
Jagan.

Jagan Teki (5):
  dt-bindings: arm: stm32: Add Engicam MicroGEA STM32MP1 MicroDev 2.0
  ARM: dts: stm32: Add Engicam MicroGEA STM32MP1 SoM
  ARM: dts: stm32: Add Engicam MicroGEA STM32MP1 MicroDev 2.0 board
  dt-bindings: arm: stm32: Add Engicam MicroGEA STM32MP1 MicroDev 2.0 7" OF
  ARM: dts: stm32: Add Engicam MicroGEA STM32MP1 MicroDev 2.0 7" OF

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   9 ++
 arch/arm/boot/dts/Makefile                    |   2 +
 .../dts/stm32mp157a-engicam-microdev2.0.dtsi  |  44 ++++++
 ...157a-microgea-stm32mp1-microdev2.0-of7.dts | 120 ++++++++++++++
 ...32mp157a-microgea-stm32mp1-microdev2.0.dts |  21 +++
 .../dts/stm32mp157a-microgea-stm32mp1.dtsi    | 147 ++++++++++++++++++
 6 files changed, 343 insertions(+)
 create mode 100644 arch/arm/boot/dts/stm32mp157a-engicam-microdev2.0.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
 create mode 100644 arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts
 create mode 100644 arch/arm/boot/dts/stm32mp157a-microgea-stm32mp1.dtsi

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
