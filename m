Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0253281C63F
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Dec 2023 09:10:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5BFEC6C820;
	Fri, 22 Dec 2023 08:10:35 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 025BCC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 08:10:34 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-40c3ceded81so15739435e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 00:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703232634; x=1703837434;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lM68vCaPXNUUDycrx+XvGL33ppz+BtAdK19lvJ8+7sw=;
 b=Fi0olgGbV1qxufuCqxE4OyH44/op6ys+++wPV5cLl2qbUvJvLz2/C2aWzoGXscbxIZ
 mUunHzhLFrysJs+zRqVEfXbtGTFfBOQ1syOIK7vQCU/SaN5ve1dmovd06t4qmdyW2WDd
 3c8r07yxzHqCDqT1ZguluWI+momdAajvZBtUA/hicZ03wu439VY5pBSibr5X7QVV/0Hi
 01WBWOnnFNGdK+37sNqj4EYm32vIHdLNdF/9uB7sr+xxg0PCqwjAsOnlqlDbrzOdFsEI
 vH7D/N2LzoYmrncBvXTjKrZSFccg6ucQ213clFhlgUeqMlDCgZe5lrve1QaVJHbkVxvw
 wmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703232634; x=1703837434;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lM68vCaPXNUUDycrx+XvGL33ppz+BtAdK19lvJ8+7sw=;
 b=T682Rz7sJ58uU2eVX05BLrl1wbUcjAeHBDiCk1N7l8hQoSskTC1APyd2x+CiGHJSU0
 mOo/oevU0YjHDe4iZ59d+mhWik84+2eWMV2E3CUVWxTwiqZzSPzRR7S/mRROfq32XBTg
 qfaeoSQySmH3RmooxEZ04VpXVZFShkom711ZLcJj0Z6CBqXzmXA5ccU+DNugIauT9ZtE
 klYreZgKudKb1Crobkb3D5IbR70OXkeS+XWiCNNrSNc8IYLnmR40qAJqHXU/vvBH+yPK
 3qW8pgkSpDNBqhL4ahGBo6vQTEu3fSHrLNpWEAXnBFq24qPsd/1UjxcGLls5qA/bIcdH
 MSnQ==
X-Gm-Message-State: AOJu0YyZr1RoXyFa0zBdhwHmSZDsL/ll6v+lJqmGq2rRNuV7FiYT6ZsQ
 oQNmZ15U+J5BNSMVs/kheIiXaeFV/LrZ2Q==
X-Google-Smtp-Source: AGHT+IEXWH54whXuzJ+v2aRaRnfaeKABy4t4cZ8sKiFBmqzByppB9AgX/JMhJXGJHk1onMtQ80/7DA==
X-Received: by 2002:a05:600c:6010:b0:40d:4a25:ee0e with SMTP id
 az16-20020a05600c601000b0040d4a25ee0emr16278wmb.11.1703232634442; 
 Fri, 22 Dec 2023 00:10:34 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a05600c001100b0040d44dcf233sm1527024wmc.12.2023.12.22.00.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 00:10:34 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20231221124339.420119-1-raphael.gallais-pou@foss.st.com>
References: <20231221124339.420119-1-raphael.gallais-pou@foss.st.com>
Message-Id: <170323263335.3968091.3418124758627043970.b4-ty@linaro.org>
Date: Fri, 22 Dec 2023 09:10:33 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.4
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] (subset) [PATCH RESEND v1 0/8] Introduce STM32
	LVDS driver
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

On Thu, 21 Dec 2023 13:43:31 +0100, Raphael Gallais-Pou wrote:
> This serie introduces a new DRM bridge driver for STM32MP257 platforms
> based on Arm Cortex-35. It also adds an instance in the device-tree and
> handle the inclusion of the driver within the DRM framework. First patch
> adds a new panel compatible in the panel-lvds driver, which is used by
> default on the STM32MP257.
> 
> Raphael Gallais-Pou (7):
>   dt-bindings: panel: lvds: Append edt,etml0700z9ndha in panel-lvds
>   dt-bindings: display: add dt-bindings for STM32 LVDS device
>   drm/stm: lvds: add new STM32 LVDS Display Interface Transmitter driver
>   drm/stm: ltdc: add lvds pixel clock
>   arm64: dts: st: add ltdc support on stm32mp251
>   arm64: dts: st: add lvds support on stm32mp253
>   arm64: dts: st: add display support on stm32mp257f-ev
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/8] dt-bindings: panel: lvds: Append edt,etml0700z9ndha in panel-lvds
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=021a81e7ac8f579b049e5bc76efabd9e67bd627c

-- 
Neil

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
