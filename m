Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 727D0728FCC
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Jun 2023 08:21:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2882EC65E58;
	Fri,  9 Jun 2023 06:21:03 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DCC7C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jun 2023 06:21:02 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5149aafef44so2142171a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Jun 2023 23:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1686291662; x=1688883662;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s0KsiO4chph33S79F9ENBTiIdHIAq8Drk63634LLZQs=;
 b=kbV4G7FpeyKX8vqSKQVxCHgnfKl+l276t269BAHAwJ23WxJ7nO/Oasy+9J5YumKyca
 T0uhyyudNLhM+w7pc9FA736CWqmxTkyTSsXqXOdfoQrYeO1IEHkoZSz4uKQsYCPrsTwM
 ULacDwUYyqRuKtDEU6r//KnkwN3AFNWxWIfls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686291662; x=1688883662;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s0KsiO4chph33S79F9ENBTiIdHIAq8Drk63634LLZQs=;
 b=FgsvHYjrb9lmUn9IApgzpplbpE3zl2K4Vo9XzYSr8mjHkF48apn0T1iTguZg6btoBo
 tF5d1uzIr8judqqaysfwvCV/aRr1ZH8kCpwtODbQb62sAw9d9vDWCXbPwqo1V1UucGXG
 NvulcoVGZPa14OvBgeVrPX7x3Gy4JZjvBvV0auVKVkJWdJyt/v5EDPqplYWO8FtaLgpN
 ceYO3i5iRS7zlsiXfGnKdwE4a2dKa8OP2aQ/My4207p+7q2gbqOiNDw/4ny6XYLHZ/FK
 WrtWlNiHn3q7GGqylPoyA7KKmNLfO/wnhNZHeTbOnWOO7oNWbqStSLUZfUa0MRSvndPW
 aKeA==
X-Gm-Message-State: AC+VfDx1Ll7wdBlsGxstrdzLkgz4Oqw68/5KlYHEjkgRlznr9QWTxRJ7
 ab0Jravecc5L0Tz/tDDJFs6GvQ==
X-Google-Smtp-Source: ACHHUZ6l4dLtGlhnWIwTWUWwtNlYtOyR1yl1ptA5SoQD+GUUgf1U2scpLgKXakdx81uLNojiuXQ7iA==
X-Received: by 2002:aa7:c44a:0:b0:514:bc92:8e1d with SMTP id
 n10-20020aa7c44a000000b00514bc928e1dmr392209edr.14.1686291661889; 
 Thu, 08 Jun 2023 23:21:01 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-248-31-20.retail.telecomitalia.it. [95.248.31.20])
 by smtp.gmail.com with ESMTPSA id
 m7-20020aa7d347000000b005149461b1e0sm1380058edr.25.2023.06.08.23.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 23:21:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Fri,  9 Jun 2023 08:20:46 +0200
Message-Id: <20230609062050.2107143-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/4] Add display support on the
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

Changes in v3:
- rename ltdc-pins-a-0 to ltdc-0.
- drop [4/6] dt-bindings: display: simple: add Rocktech RK043FN48H
  Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next):
  https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c42a37a27c777d63961dd634a30f7c887949491a
- drop [5/6] drm/panel: simple: add support for Rocktech RK043FN48H panel
  Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)
  https://cgit.freedesktop.org/drm/drm-misc/commit/?id=13cdd12a9f934158f4ec817cf048fcb4384aa9dc

Dario Binacchi (4):
  ARM: dts: stm32: add ltdc support on stm32f746 MCU
  ARM: dts: stm32: add pin map for LTDC on stm32f7
  ARM: dts: stm32: support display on stm32f746-disco board
  drm/stm: add an option to change FB bpp

 arch/arm/boot/dts/stm32f7-pinctrl.dtsi | 35 ++++++++++++++++++
 arch/arm/boot/dts/stm32f746-disco.dts  | 51 ++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32f746.dtsi       | 10 +++++
 drivers/gpu/drm/stm/drv.c              |  8 +++-
 4 files changed, 103 insertions(+), 1 deletion(-)

-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
