Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C29649F1C
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Dec 2022 13:51:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BAB98C69041;
	Mon, 12 Dec 2022 12:51:20 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 514B2C65E4B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Dec 2022 21:53:55 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id h24so4696524qta.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Dec 2022 13:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CogeahCDAeDbkConNno5D9xjUNwnhFqYTxCoNNSIi44=;
 b=gwMxZGYCwrO7jsCEDiClzh8A+LsHYs0+15yt63BjNCy9KjrzUYquIcXyHPsrWLu4aF
 lCqP/akNWkQuJWc2jILHnXhhokRpvFk2c39kf67zvtYXD3DmCKPMALytDx85LPEFwEod
 PTWxkjMNoP+AH8V4TfeiVGFpasFF5sMC2OeAa91RrrcG/Ps4Riufsf7MxvHQo74EbVCB
 Konk9THbEDwIitcvNth0DA1wMDfHcRVIRZOPRphuab1qx0RsRYzdRMIOOlDsbCtHV6qy
 Slvg4fD/GYEfZ9Supz0pUrMbfFAaMKYJnoGviAJ+U5cpIqELkbqvcP54ciHNUy2hd64m
 sTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CogeahCDAeDbkConNno5D9xjUNwnhFqYTxCoNNSIi44=;
 b=Sk/OnHRXaMG4nDL647yda+H8mSqv4yT3+CvBZeQsU1MfXfYzeLW5zfKvt9wcyRxi8g
 l45T78bahOUrCA/wZO92d1DElyGMafrW/tBW/biR7Dasg/Nq3koiwlTTxARpUHMsW6eA
 vGGc0Cb4TWX2/P2J2PeL9CICOPCCSnOB+2Ilst2hKC5Q5tBqYweGhCPz7TFTmfEBjSU6
 vinmKLkP57bMS24CwcTyymMmmE+HCoMAX0HqF3VXnsZWNmAqtgkCrgfBdwopfsuqUbxk
 Eu+YerG4xdHOVc0YOMcOIYSddIZnN8fo0vi78dejXmdSFRGHkCbEAU4s5KHLVyE0ad7I
 ovZA==
X-Gm-Message-State: ANoB5pn4SjIWJsPKBSlOj88YTdrQJArhAa8HC76YMl1Z7vrfHuzd9TJZ
 nq7aUJD6JWPUjl/cygYYnxWGZzcYcxCszw==
X-Google-Smtp-Source: AA0mqf5Se2vnZARHxGLZnlgo8WFco4pE56l2BBYu/6YHuNmd5/aKI85W/31ebRGVZbDr/+KajsjjEg==
X-Received: by 2002:ac8:748d:0:b0:3a5:f909:8a7b with SMTP id
 v13-20020ac8748d000000b003a5f9098a7bmr9446273qtq.58.1670622833978; 
 Fri, 09 Dec 2022 13:53:53 -0800 (PST)
Received: from Dell-Inspiron-15.. ([2601:18c:8380:74b0:e8e5:f40c:d741:8f07])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a05620a057000b006fee9a70343sm712718qkp.14.2022.12.09.13.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 13:53:53 -0800 (PST)
From: Ben Wolsieffer <benwolsieffer@gmail.com>
To: linux-stm32@st-md-mailman.stormreply.com
Date: Fri,  9 Dec 2022 16:48:11 -0500
Message-Id: <20221209214824.3444954-1-benwolsieffer@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 12 Dec 2022 12:51:19 +0000
Cc: Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 linux-kernel@vger.kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Ben Wolsieffer <benwolsieffer@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RESEND 0/2] ARM: v7m: handle faults and enable
	debugging
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

This series enables real exception handlers on no-MMU systems,
increasing robustness in the face of buggy user- or kernel-space
software. Previously, any fault would trigger the invalid exception
handler, which would hang the system. With this series, faults only
kill the offending process and allow the rest of the system to
continue operating.

The second patch in this series adds support for undefined instruction
hooks, enabling software breakpoints through ptrace. Using this
functionality currently requires a patch to gdb.

This series has been tested on an STM32F746 (Cortex-M7).

I would appreciate feedback in particular on the following questions:
* Is the fault table formatting acceptable? Or should the lines be
  wrapped/shortened?
* Does my chosen mapping between faults and signals make sense?

This time around this series has been sent to linux-stm32 as well, as I was
previously unaware of that list.

Ben Wolsieffer (2):
  ARM: v7m: handle faults
  ARM: v7m: support undefined instruction hooks

 arch/arm/include/asm/traps.h |   2 +
 arch/arm/include/asm/v7m.h   |  29 +++++++
 arch/arm/kernel/Makefile     |   2 +-
 arch/arm/kernel/entry-v7m.S  |  68 ++++++++++++++-
 arch/arm/kernel/traps-v7m.c  | 162 +++++++++++++++++++++++++++++++++++
 5 files changed, 258 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm/kernel/traps-v7m.c

-- 
2.38.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
