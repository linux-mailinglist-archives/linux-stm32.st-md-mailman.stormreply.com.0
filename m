Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5956A72542F
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 08:31:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF796C65E70;
	Wed,  7 Jun 2023 06:31:44 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 226B8C65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 06:31:44 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-30af159b433so6845967f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Jun 2023 23:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1686119503; x=1688711503;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3q0SzVmGHZSYA8dRUVFZwmu0+tSDXCd1K6OkYFYtOd8=;
 b=M7Y9qbOgr2mCzPYbaTG2gTTgpe758R7rQlGfASKS5JQv7ihIt9vNrw/L7whQ9Ujgb2
 5OsGaVMznTABhT+h2tEiJSyBIK1GlpO7P/n1vVgeBxLFIDtwRjdHE6vLDhT7+BWdpFMj
 WG7dUZTg9+7/DB9QL5QDyO4hDjtU6LePF3u9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686119503; x=1688711503;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3q0SzVmGHZSYA8dRUVFZwmu0+tSDXCd1K6OkYFYtOd8=;
 b=jIb6CinTjm0qJzhN4HaKIGLaK+SLQAtmdbf1c8MsdXiEE4el931RjT5oIKnd46ZNe2
 DxcR6JgQauHqGIsf0znQLGlZj8GZCDLv02cDHoU7YV4mtrtuFFx/mW5IQDOgkFbVrehW
 /1sOHhnI7VKJpPxJWjhbNtK6/AAZv5nPd9w3cJBOJ/LYrKG/pL79E2k7gyxZQAQaLEHg
 UdHXPvIfe7HYDx2RJehvPRu/Q3a0KM1OokdDk8Ra8MGS2Nw0QwRfJ7O4c/NW8wf0bJ5y
 ATjQEgMzysU+NpQumADn216mTfNmA0eSf0yMkgmGeChyiPewvRwhuU93RqNs4cbTobkY
 ozvg==
X-Gm-Message-State: AC+VfDzHW3jbpkszQcKS3Hr1Z8tgQCFgUjEotYD0JPzT2mSPfIu+KF2L
 5GUgToMTOfvayXdQJW9CF1zwMA==
X-Google-Smtp-Source: ACHHUZ7EBKC8ivl2FMOsG5mX9X/Fuw2ks1BSOq8ZukumLjV6wxbR5wx5KRK++ZkvEZChP06D2V6KKw==
X-Received: by 2002:adf:f0c8:0:b0:30a:dd26:63cd with SMTP id
 x8-20020adff0c8000000b0030add2663cdmr3825382wro.5.1686119503550; 
 Tue, 06 Jun 2023 23:31:43 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([37.159.114.163])
 by smtp.gmail.com with ESMTPSA id
 m6-20020adff386000000b0030630120e56sm14385127wro.57.2023.06.06.23.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 23:31:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Wed,  7 Jun 2023 08:31:33 +0200
Message-Id: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND PATCH v2 0/6] Add display support on the
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

The series adds support for the display on the stm32f746-disco board,
along with a generic patch that adds the "bpp" parameter to the stm-drm
module. The intention is to allow users to size, within certain limits,
the memory footprint required by the framebuffer.

Changes in v2:
- Add 'Acked-by' tag of Conor Dooley.
- Fix build warning reported by kernel test robot.
- Add 'Reported-by' tag of kernel test robot.

Dario Binacchi (6):
  ARM: dts: stm32: add ltdc support on stm32f746 MCU
  ARM: dts: stm32: add pin map for LTDC on stm32f7
  ARM: dts: stm32: support display on stm32f746-disco board
  dt-bindings: display: simple: add Rocktech RK043FN48H
  drm/panel: simple: add support for Rocktech RK043FN48H panel
  drm/stm: add an option to change FB bpp

 .../bindings/display/panel/panel-simple.yaml  |  2 +
 arch/arm/boot/dts/stm32f7-pinctrl.dtsi        | 35 +++++++++++++
 arch/arm/boot/dts/stm32f746-disco.dts         | 51 +++++++++++++++++++
 arch/arm/boot/dts/stm32f746.dtsi              | 10 ++++
 drivers/gpu/drm/panel/panel-simple.c          | 29 +++++++++++
 drivers/gpu/drm/stm/drv.c                     |  8 ++-
 6 files changed, 134 insertions(+), 1 deletion(-)

-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
