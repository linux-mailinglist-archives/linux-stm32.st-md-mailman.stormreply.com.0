Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EA23385BC
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Mar 2021 07:24:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4358C5718D;
	Fri, 12 Mar 2021 06:24:44 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35F4EC56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 06:24:41 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 ga23-20020a17090b0397b02900c0b81bbcd4so10271548pjb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 22:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=9W91lxMjmS6duxJfVFbpN9OrD/qgQmXljbVxuKRaByg=;
 b=sZvn3dlRhwvxJZo9kABsq7xJGUX3cJwgnX/tbpaERYKuHlQilkL5Zgwv9IEZ3mWGWz
 4Z/dyota91Aw12qxr2Dnns+kQQQs82MBNxmcqVS1/6bSpZpxfEAO15ewaCptQQhrpk5c
 +bQeNPFmKaS3jkfdNl/M1mnW7n+RkpjLZvh+++HoaVCQtXG+xqucQgqzaBreXam/Sb8f
 50am4t2xy8X7NQozoJ4PuVe8LRW4xHxQvwCcbiZVx3NfD2faZQG8hC03vCdhCwDA3DZy
 HJZFSqNGFx9ifx13L/skpBz7BGHhD/8yCtB+BowywmI5c+EPjUQccOz5om4zp+/G7kBp
 gqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=9W91lxMjmS6duxJfVFbpN9OrD/qgQmXljbVxuKRaByg=;
 b=l6sVV4XsxTTA6cy0FkSTYa2qk657pqoyKRGL7h16pUjPCLZGKlO3h7tssGycZYpECf
 AHV5g47JEW6pE8BZnRYGOnu76GN0CMqnM8JNKxcd8MfEzU5AAMuc1AyvjS5wA98/JfRh
 pYmm5epsl+Z+pv5VI7YXrRSJUC5KvDZfGmFALvN8w5/D03q2RFVdz+fLasjuGea8K3Mc
 nMo44ctaDQc+dvvrBzoG2YoLtRHkg2LJTDIQ4NLww8/grZRnIgBcv6ieude4RkWbroyN
 1MX0NWAADFj1/uVTU4A2EHJiHbl+OVFpinzlBjfTFw2aTwdIkBzGjceZeDEc/DUIMHLM
 gKMw==
X-Gm-Message-State: AOAM533VQbu693niufWdLFqTbASRCzsHwBvCm2+jubZD/krrMybV+zYg
 uSy2ZX/D5+0nvxS9EMWGUXc=
X-Google-Smtp-Source: ABdhPJw3ig/kHvwglXds1+7Jh0zNQfsxEoFGGunCQggwqPlTWRTNSOykTswFi7lN2H166PzmXGZEhg==
X-Received: by 2002:a17:90b:100a:: with SMTP id
 gm10mr12595731pjb.0.1615530279658; 
 Thu, 11 Mar 2021 22:24:39 -0800 (PST)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id h6sm4048406pfb.157.2021.03.11.22.24.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Mar 2021 22:24:39 -0800 (PST)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, alexandre.torgue@foss.st.com, a.fatoum@pengutronix.de,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com
Date: Fri, 12 Mar 2021 14:24:26 +0800
Message-Id: <1615530274-31422-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v2 0/8] ARM: STM32: add art-pi(stm32h750xbh6)
	board support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

This patchset intend to add art-pi board support, this board developed
by rt-thread(https://www.rt-thread.org/).

Board resources:

8MiB QSPI flash
16MiB SPI flash
32MiB SDRAM
AP6212 wifi,bt,fm comb

sw context:
- as stm32h750 just has 128k bytes internal flash, so running a fw on
  internal flash to download u-boot/kernel to qspi flash, boot
  u-boot/kernel from qspi flash. this fw is based on rt-thread.
- kernel can be xip on qspi flash or load to sdram
- root filesystem is jffs2(created by buildroot), stored on spi flash

to support the boad, add following changes.
- fix r0-r3, r12 register restore failed after svc call,
- add dts binding
- update yaml doc

changes in v2:
- reorganize the pinctrl device tree about stm32h7-pinctrl/stm32h743/750-pinctrl
  stm32h7-pinctrl.dtsi --> stm32h743-pinctrl.dtsi --> stm32h743i-disco.dts
                       |                          |-> stm32h743i-eval.dts
                       |-> stm32h750-pinctrl.dtsi --> stm32h750i-art-pi.dts
   same to the stm32f7/f4's pinctrl style
- fix author name/copyright mistake
- add compatible string st,stm32h750-pinctrl to pinctl-stm32h743.c as they
  have same pin alternate functions, update Kconfig description
- make item in stm32h750i-art-pi.dts sort by letter


dillon min (8):
  Documentation: arm: stm32: Add stm32h750 value line doc
  dt-bindings: arm: stm32: Add compatible strings for ART-PI board
  dt-bindings: pinctrl: stm32: Add stm32h750 pinctrl
  ARM: dts: stm32: introduce stm32h7-pinctrl.dtsi to support stm32h750
  ARM: dts: stm32: add stm32h750-pinctrl.dtsi
  ARM: dts: stm32: add support for art-pi board based on stm32h750xbh6
  ARM: stm32: Add a new SOC - STM32H750
  pinctrl: stm32: Add STM32H750 MCU pinctrl support

 Documentation/arm/index.rst                        |   1 +
 Documentation/arm/stm32/stm32h750-overview.rst     |  33 ++
 .../devicetree/bindings/arm/stm32/stm32.yaml       |   4 +
 .../bindings/pinctrl/st,stm32-pinctrl.yaml         |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/stm32h7-pinctrl.dtsi             | 392 +++++++++++++++++++++
 arch/arm/boot/dts/stm32h743-pinctrl.dtsi           | 307 +---------------
 arch/arm/boot/dts/stm32h743.dtsi                   |  30 ++
 arch/arm/boot/dts/stm32h750-pinctrl.dtsi           |  11 +
 arch/arm/boot/dts/stm32h750.dtsi                   |   5 +
 arch/arm/boot/dts/stm32h750i-art-pi.dts            | 228 ++++++++++++
 arch/arm/mach-stm32/board-dt.c                     |   1 +
 drivers/pinctrl/stm32/Kconfig                      |   2 +-
 drivers/pinctrl/stm32/pinctrl-stm32h743.c          |   3 +
 14 files changed, 717 insertions(+), 302 deletions(-)
 create mode 100644 Documentation/arm/stm32/stm32h750-overview.rst
 create mode 100644 arch/arm/boot/dts/stm32h7-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/stm32h750-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/stm32h750.dtsi
 create mode 100644 arch/arm/boot/dts/stm32h750i-art-pi.dts

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
