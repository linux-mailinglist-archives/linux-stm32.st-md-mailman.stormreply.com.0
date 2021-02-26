Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7578C325DD8
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Feb 2021 08:03:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 287D6C57B61;
	Fri, 26 Feb 2021 07:03:27 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9C83C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 07:03:24 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id d12so3106796pfo.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 23:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+j5qJuOZSbQysXD/JvLKk0ZQswOeC5SGkz/d6BdcFcg=;
 b=N2XLogZuLsxAgBn8YmeZBrAP87b2Ul4RMTTf5CT3klEH9Un+lFYDL8t2qz4GlaWOFP
 TSBNgirKvPcQ0ttYcHMluSYqirsjgDJiPo7v4m6CL9Iwb4ZMp6l1I7QXGikpBenmvKvK
 fE3ugSlT+/xBqvULXQLNlvp2rpaa8dk3BIChc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+j5qJuOZSbQysXD/JvLKk0ZQswOeC5SGkz/d6BdcFcg=;
 b=kCWbTZcUaVu+ll9rlf+Is4GIuqm6iZZGy+LX4sqhLaKHA7Wxpy7hqeaGrwm2HHgBRp
 7mnkFaHOis30zPKGCeCxfbjMP+L4yFuwJWe9WTJQOYjqK7bEy2XoMBhT5FCv2lGHV5mX
 2vcdV/Sxn2noFhuDMsE+MsMJT+Yhf5stXGdI2paogZBaGpRkTApR6tNsrrii+nhC3RQY
 cjBFh2YEjvfe1qImcdZcqMQH7TOQ0iJCLPkBQu6HZMHOPLJwTLJSjgCy+iBRo0i4UKCY
 IuaHg6Ypk4VmLmSzhOrV8uTCkYNLxIJXCPSMQ6+hfDZbOyA+//Qqlm4VkORSd2UOWzZO
 f+OA==
X-Gm-Message-State: AOAM5331Jn0DG8cmARsC9O1x8RHhc1KeMMKuf3fUDYJ+pm+IJhsu0frp
 DJE0ijzk0IAmEu34Vzb53833Vg==
X-Google-Smtp-Source: ABdhPJwYBClGgFC8cYKGWzWdFhfQORrre5aTlESCiZ/M7eXTZMRntwBrV1DvM3urLS5FLfHk1E5oow==
X-Received: by 2002:a62:1e41:0:b029:1e6:fe13:b78e with SMTP id
 e62-20020a621e410000b02901e6fe13b78emr1911923pfe.26.1614323003138; 
 Thu, 25 Feb 2021 23:03:23 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([103.161.30.220])
 by smtp.gmail.com with ESMTPSA id f7sm7592156pjh.45.2021.02.25.23.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 23:03:22 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Fri, 26 Feb 2021 12:32:54 +0530
Message-Id: <20210226070304.8028-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 00/10] ARM: dts: stm32: Add Engicam
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

Changes for v2:
- fixed v1 comments
- add i.Core STM32MP1 SoM 

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
 .../boot/dts/stm32mp157a-icore-stm32mp1.dtsi  | 195 ++++++++++++++++++
 ...157a-microgea-stm32mp1-microdev2.0-of7.dts | 154 ++++++++++++++
 ...32mp157a-microgea-stm32mp1-microdev2.0.dts |  55 +++++
 .../dts/stm32mp157a-microgea-stm32mp1.dtsi    | 147 +++++++++++++
 8 files changed, 666 insertions(+)
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
