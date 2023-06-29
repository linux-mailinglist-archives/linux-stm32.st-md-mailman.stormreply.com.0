Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0143C742249
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jun 2023 10:37:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8DA8DC6B455;
	Thu, 29 Jun 2023 08:37:36 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4148C6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jun 2023 08:37:35 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-313fb7f0f80so417040f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jun 2023 01:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1688027855; x=1690619855;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eHpE4uTWiAqdi7U0f3J575mib/zD7YmmgRLR1ViHO+A=;
 b=frEbSknS3v438cdIlYKHwjwtwgqkU3mgD/rVMxfM9D/7fjJlbTWQsTlixjZa855t3+
 ZkPMIV/L2XKqU6jFbBBevvmNbKXEujiwIdNIfmd0XkbHhYoT7BU6S6GcY8PYNnLVmVMS
 R8vwKSnMBLxrLXRPzl01uyZzIgNsKMGVCENtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688027855; x=1690619855;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eHpE4uTWiAqdi7U0f3J575mib/zD7YmmgRLR1ViHO+A=;
 b=GUdCa9eLNvEb7T7rYHa1ivN/i8c0/1TJ0rPwRzxU88KP31v5iZvsyGGgAZi3TBAzlF
 A05qih1McrwpGRZueRqShMjupb6lGM+g26sSr2RIMbB4TzFAPpFvb4DWB9MZcqjwhhvX
 NNNgG8YX8AXHG3J9qtj7kVWVQfbn9AyxTdtER7p6ai7tf1JjAX8JvFDVwWB2skRl8Mik
 ujYU8qs6Pdvn1s4YNN0Q7KEmbyHvFijQn+xhxURgCJlyW2HlHgJxxGs4AWPKbR1jMR8l
 02/AZauupUjyaWETZLlU2efvWy31UBnH8zIP4Xs2AatiwMlnqVLymebxx21m/hgbQbQP
 TGpg==
X-Gm-Message-State: ABy/qLZYBSQpCio5KUZHVMbcZJ9PmFOKW82AVtqEvJ8X17IQC+ImBwKC
 diLjl+lTkXOmX4U6szwDoZTPVw==
X-Google-Smtp-Source: APBJJlESkpal0RtTCw62QNAS9feUilaK2gVhUlIYl4Pq7aGF2xLVJApz8huaJEbVLYdmsI0FDdDPtA==
X-Received: by 2002:adf:f88f:0:b0:314:13e2:2f46 with SMTP id
 u15-20020adff88f000000b0031413e22f46mr1223503wrp.27.1688027855157; 
 Thu, 29 Jun 2023 01:37:35 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.praguecc.cz (90-182-211-1.rcp.o2.cz.
 [90.182.211.1]) by smtp.gmail.com with ESMTPSA id
 cw13-20020a056000090d00b003112f836d4esm15266322wrb.85.2023.06.29.01.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 01:37:34 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 29 Jun 2023 10:37:23 +0200
Message-Id: <20230629083726.84910-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 0/3] Add display support on the
	stm32f746-disco board
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

The series adds support for the display on the stm32f746-disco board.

Changes in v5:
I am confident that framebuffer sizing is a real requirement for STM32 boards,
but I need some time to understand if and how to introduce this functionality.
Therefore, I drop the following patches to allow the series to be fully merged:
 - [4/6] dt-bindings: display: stm32-ltdc: add optional st,fb-bpp property
 - [5/6] ARM: dts: stm32: set framebuffer bit depth on stm32f746-disco
 - [6/6] drm/stm: set framebuffer bit depth through DTS property

Changes in v4:
- Use DTS property instead of module parameter to set the framebuffer bit depth.

Changes in v3:
- rename ltdc-pins-a-0 to ltdc-0.
- drop [4/6] dt-bindings: display: simple: add Rocktech RK043FN48H
  Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next):
  https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c42a37a27c777d63961dd634a30f7c887949491a
- drop [5/6] drm/panel: simple: add support for Rocktech RK043FN48H panel
  Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)
  https://cgit.freedesktop.org/drm/drm-misc/commit/?id=13cdd12a9f934158f4ec817cf048fcb4384aa9dc

Dario Binacchi (3):
  ARM: dts: stm32: add ltdc support on stm32f746 MCU
  ARM: dts: stm32: add pin map for LTDC on stm32f7
  ARM: dts: stm32: support display on stm32f746-disco board

 arch/arm/boot/dts/stm32f7-pinctrl.dtsi | 35 ++++++++++++++++++
 arch/arm/boot/dts/stm32f746-disco.dts  | 51 ++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32f746.dtsi       | 10 +++++
 3 files changed, 96 insertions(+)

-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
