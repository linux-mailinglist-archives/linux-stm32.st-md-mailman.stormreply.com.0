Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5590D74FF2C
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 08:29:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02B30C6B459;
	Wed, 12 Jul 2023 06:29:24 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCAA0C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 06:29:22 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-986d8332f50so798997866b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 23:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1689143362; x=1691735362;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yG02hGmRFX3YN1rDfl25zcD+fatvJq2guzcIO8Dwka8=;
 b=nde+wEHEDGU4f5RbKVdti+mGl+/lFbpfUVStmcklOCtPDXdig/Wwt0AZGTdgJyDf4x
 Vjfja1f6zKMS6BQIUTMJUwXlg0sC+3w2mCw/tDKRVYuZySIXgKzuaDOuOvSsAP9DLaiS
 KU8nVvXmEDHBpEL/gT6r4oR6Z/NOF0F/m/Xrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689143362; x=1691735362;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yG02hGmRFX3YN1rDfl25zcD+fatvJq2guzcIO8Dwka8=;
 b=GsiS5Vd5jw7EtddEWb+j5v0sOBXdwl/6XSbCadw1kzNGI4ujl01IOj47uNixiIxkDs
 XySKXiIhUM1R0V4P9ogn0hfWzlbaqcdfpIx8KH9HXsFHz64Es3vgZInbH9Suii7xwbgm
 GVQJPB+jA/7E9KvmCKBILP5wMA8HXJGqZ++GxQ/qQ2blsJonMPP/PqNwW3rjSIeRxxak
 OlNe8kpLJ/UARdRWzQI5RIjjPSxeU5FquGYdOhlZqamH4gDi5cIwk3a387qYagLMm9a4
 gzI46Y6Ka26K9QzyOMyjjRRoMyyT0ygGI9eVhVkBo0utbSwFfVEVprMofFQjggUF7vWr
 QN5w==
X-Gm-Message-State: ABy/qLaJGalq81h917Z1Ab/MXx8TywlkO4b/MiPucXI5K2J1WYFOwdKz
 +/6NyPlU+tLKV8rYFVo6TsCU9A==
X-Google-Smtp-Source: APBJJlFKwpWGlraWmRLur+WCheXKHsV7RlRykuzp+cw+/a1UVZKrUnLjNOHWxPXq679jqjDQNiGQdw==
X-Received: by 2002:a17:906:13:b0:993:d536:3caf with SMTP id
 19-20020a170906001300b00993d5363cafmr14821054eja.4.1689143361957; 
 Tue, 11 Jul 2023 23:29:21 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (host-82-58-49-236.retail.telecomitalia.it. [82.58.49.236])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a170906371500b009890e402a6bsm2065390ejc.221.2023.07.11.23.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 23:29:21 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 12 Jul 2023 08:29:15 +0200
Message-Id: <20230712062918.2248573-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 0/3] Add display support on the
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

Changes in v6:
- Remove dma nodes from stm32f746-disco.dts, they are not used by LTDC,
  so there is no need to enable them.

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

 arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi | 35 ++++++++++++++++++
 arch/arm/boot/dts/st/stm32f746-disco.dts  | 43 +++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32f746.dtsi       | 10 ++++++
 3 files changed, 88 insertions(+)

-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
