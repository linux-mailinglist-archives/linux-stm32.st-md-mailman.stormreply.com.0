Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3673725721
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 10:15:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54A5EC65E70;
	Wed,  7 Jun 2023 08:15:20 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26746C65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 08:15:19 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-3f6dfc4e01fso70544255e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jun 2023 01:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686125718; x=1688717718;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qgIJSCejdHbYC6I5SehTRhoGCRpBeLeg1t9A/6zhpJo=;
 b=CIa64ozSdrDVRVg1jUgCTAiz36xySfnySuAigODI+An3r6XQLwAc3N8g+VaXmEjiEg
 He1RlJVQUxoLOzw6647ujk2cBWuG5dLxGbvmEZLSDY/gUh0iyjzUzrkaqmUzjpAHIVto
 lNKKf85hRuxVY5yhehspifd10g2gJM3UEbPTZy8ervc6l0QMC7MVrs7qvS0wu/HlEg80
 1VnX3ZT8NUJESTVrBaVbM2EbqeHm1gyq8NkjCit3BV9MxDJJala3XneiAODy5RWorTMY
 SR8xwkEIMgMIl5LO04gTuqe42G4s/GQE4SzegI6ubCioeBvlyAmb1IvNom+TsBe8gpYj
 WQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686125718; x=1688717718;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qgIJSCejdHbYC6I5SehTRhoGCRpBeLeg1t9A/6zhpJo=;
 b=NoiLRxr9YXwBy5N8yPWfkNLimiutQaXrAhtThvtHQ11IykpHWbhQxbHXYY6TLSqxMW
 Jkj/d7N68Xdtkd2MgVnWXAT0N4ECUflokIFItDVebH3PESugpqNXw3ncuUpr30bR3iFH
 Ty2y6vDlAaLli+50ZbjbJY/ebkdikZbwKU1Sm0+dpYEqBzL+nFDX9TPA4aBCxGn6Z4I0
 raQ0bPAbuMlGtdX144tX7yfXWDbjJN98STzUxBHY+IypNqL38ADAzUTgo/V6ZbVcJTiZ
 JPoFIlSjZUEUGeTNmtb9kg432eOk6GX04Q3jwWBPrXbx6daGqwhnpnwp/Fb+hPGMvch/
 GznA==
X-Gm-Message-State: AC+VfDzR3VM+aWt920mGMzBHURpU7+jiuhePd5ioZlWa4qSc3ZdN8hOg
 c0yHdJF0SJYcO8Iajut6qsAeow==
X-Google-Smtp-Source: ACHHUZ5tk6FymA5P3QCBia2YNIyTmWdjetu2eTi8qhNYTXKqJxyKEcwTWpSXM+EeMCN65Vy6Ap03GQ==
X-Received: by 2002:a7b:c411:0:b0:3f7:3545:4630 with SMTP id
 k17-20020a7bc411000000b003f735454630mr5745200wmi.20.1686125718557; 
 Wed, 07 Jun 2023 01:15:18 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a1c6a08000000b003f72a7918e7sm1228212wmc.45.2023.06.07.01.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 01:15:18 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-kernel@vger.kernel.org, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
References: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
Message-Id: <168612571728.2521024.1084005865126960680.b4-ty@linaro.org>
Date: Wed, 07 Jun 2023 10:15:17 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.2
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [RESEND PATCH v2 0/6] Add display
 support on the stm32f746-disco board
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

Hi,

On Wed, 07 Jun 2023 08:31:33 +0200, Dario Binacchi wrote:
> The series adds support for the display on the stm32f746-disco board,
> along with a generic patch that adds the "bpp" parameter to the stm-drm
> module. The intention is to allow users to size, within certain limits,
> the memory footprint required by the framebuffer.
> 
> Changes in v2:
> - Add 'Acked-by' tag of Conor Dooley.
> - Fix build warning reported by kernel test robot.
> - Add 'Reported-by' tag of kernel test robot.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[4/6] dt-bindings: display: simple: add Rocktech RK043FN48H
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c42a37a27c777d63961dd634a30f7c887949491a
[5/6] drm/panel: simple: add support for Rocktech RK043FN48H panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=13cdd12a9f934158f4ec817cf048fcb4384aa9dc

-- 
Neil

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
