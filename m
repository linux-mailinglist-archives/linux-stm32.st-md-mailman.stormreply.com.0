Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E6871F024
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Jun 2023 19:03:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC52AC6A61E;
	Thu,  1 Jun 2023 17:03:46 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1739BC65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jun 2023 17:03:45 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-96f99222e80so251833966b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 Jun 2023 10:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1685639024; x=1688231024;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7CktwIDz8iQqFve40BtvAwOOr5PjVMSEqWCcs9KU57A=;
 b=fkg0EKdAjxwuFw+ApM6W/plP+tXu+eZpr9jZfh3mm69cAf7gyFHd7D+i7CTiq3i7Tp
 bnXachRnfNjh91+5nuM9DfYwtLjF5b0JsT4G9Hm9y/Nn+NpOHREBHP7ibsWBTlhrSMkM
 MR1dXNqpdI+hnBE3aN3k3EIhmqMcuDXwykx7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685639024; x=1688231024;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7CktwIDz8iQqFve40BtvAwOOr5PjVMSEqWCcs9KU57A=;
 b=jlhOxejQH10NiEDLbvEDdZKNqpPTYzpcM0FIs5iWxu91z2EXQp/az8i8HDEd6m0Klg
 DbRlatuhBXhbRD1/a4K1nYwcDNGOYe2LbiYtwcxz7LVOm0ZxtiE8behtk1cK8PV7t2Ie
 qikExtQDYTDENUgIKkGhpmOs6c2M55N5Q4qEsKXBrd5KnrYB/52VX4uFzPCuCi2VBCFB
 y1JttKQnNzhDWc0Hp5hQ8UbHSS/CdpniX8mOrOhWBfLQA2efF7AMXeEBMUJcK4JwQYtM
 eZzqSyhdluS1+TukztmdjSMfHHTFFXH5g+I45QwxmZqkQmDawyZ4k+n77olyP6Q5pV24
 5uuA==
X-Gm-Message-State: AC+VfDyBBpCJXrz8s1Uny1+ue4j1AviInXtoNJcy9XQQj0PhzNsqBvEB
 +ibYo+AdwCYw1Pmm/gffSX19xA==
X-Google-Smtp-Source: ACHHUZ5jWPn15sUETnU3sOiLA3ZEq58hqtWA/qPY8dV5vu8echz75s4Xk6xBQQXlIDs32fWSNQEHHw==
X-Received: by 2002:a17:907:d13:b0:96f:8d00:43be with SMTP id
 gn19-20020a1709070d1300b0096f8d0043bemr2133110ejc.0.1685639024540; 
 Thu, 01 Jun 2023 10:03:44 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-248-31-20.retail.telecomitalia.it. [95.248.31.20])
 by smtp.gmail.com with ESMTPSA id
 bh25-20020a170906a0d900b0096165b2703asm10658522ejb.110.2023.06.01.10.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 10:03:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Thu,  1 Jun 2023 19:03:14 +0200
Message-Id: <20230601170320.2845218-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/6] Add display support on the
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
