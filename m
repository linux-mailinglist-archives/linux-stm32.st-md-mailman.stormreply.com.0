Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B29766426
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jul 2023 08:34:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 061A9C6B465;
	Fri, 28 Jul 2023 06:34:24 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37DBEC6B45C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jul 2023 06:34:22 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-52227142a27so2186328a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jul 2023 23:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1690526061; x=1691130861;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aF25RsasGUB1aNRKgB20J0I6Xsy/3huYOi47Fd6Xv1k=;
 b=eO7loPNL73bDnDOXXzgc7RiL8tFcMcyM14rUTfMAm0noLEPQBnrySBSubWBEFMr/Cb
 +0h5irBDAzosUfPuPhmVPpkhSO33ZQak6YDbj5fhE7M1MoqukFTPFcap7CD9m7/ONTBD
 GoMqFQx0wqb9vw5f5U1QG58ZWX1OCQitefos8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690526061; x=1691130861;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aF25RsasGUB1aNRKgB20J0I6Xsy/3huYOi47Fd6Xv1k=;
 b=KoFpO8Fl2UEf31IdXyLreXeLCArqQyZxAML+lLGjae4+RSe0zqh3YAL8FiOEFMeTrC
 M+MaI5X5Z9dZRdJPeJuWuguMOH2sOdX75EtYIsCmDO0b2znH5puh3ZH3nQDX5cXVGitK
 kq0rtWHuFC3N88JnKnM7uPqfKh++DXy7+9HLnMXUQMrPeglnmk3OuyYKfmfe1Ap4gjtW
 VXhIaMJLbsSL6sjltROcAwXYS//dh4GmSDDLpV8wEB+dizTHtWKpE0uX6bpPvUHD+KOm
 vJG/j5FzKk/32uV6Zkcoeya+2OWpNy2cucYpuYb0q9v7TbQpvCGMf2/Epgh++XS/1tEy
 bdcw==
X-Gm-Message-State: ABy/qLaUDsoT4SQHRCNBKbOsnxFY+ICpHsTodRQfQyL19foLzF0hrMn4
 x7YyWQSFCBCcw6/b2IN4gfgFqA==
X-Google-Smtp-Source: APBJJlE2WEyHonoNCKIFWdCPNf+A8XgHkupgbLIvHk6IdkZaX8EyYmCFW58NYzChmdx9pGHU8Kh95A==
X-Received: by 2002:aa7:d549:0:b0:521:a4bb:374f with SMTP id
 u9-20020aa7d549000000b00521a4bb374fmr865376edr.5.1690526061424; 
 Thu, 27 Jul 2023 23:34:21 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-232-62-70.retail.telecomitalia.it. [95.232.62.70])
 by smtp.gmail.com with ESMTPSA id
 n21-20020aa7d055000000b0051e26c7a154sm1425057edo.18.2023.07.27.23.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 23:34:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 28 Jul 2023 08:34:13 +0200
Message-Id: <20230728063417.2980091-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v7 0/3] Add display support on the
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

Changes in v7:
- Add 'Reviewed-by' tags I forgot in v6.
  https://lore.kernel.org/linux-arm-kernel/20230629083726.84910-1-dario.binacchi@amarulasolutions.com/T/

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
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
