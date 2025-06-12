Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 546B8AD8327
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 08:22:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF426C32EB0;
	Fri, 13 Jun 2025 06:22:04 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63AE3C36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 19:45:05 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-7482377b086so938836b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 12:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749757504; x=1750362304;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=E3L1BRXMYQOPZXwWB+HufjRJxBYhvQ+eeWRIbfY6WI0=;
 b=cP6fFCbYupyKDUuz2Pzmg7TqEIppaf6yMKuoeL77u9bJfbOHIjxbwpa0cKPAze0pMm
 RVImigLbjTXyhxbttS4Rkbqf3Dc5eA33W2kHj8jj+PDKPRyY7RPXxQLYjvPawYcWG7sM
 rZUWrYHNR0LT1JgMY5CVOJHTxpMWO0L46RBzQ8Hpk5T9dkNDgmNB1Smir4ceJQdbxGsI
 7RHNJAZsnNIA6I5lH8vWcGSjrhgi9iH9FqUWwQbTqi1J0Q4bXy/OCE8rXnS40nrhEHeX
 ZqN35fR/rE9IHnDY2oJW5MmpUG8uHCkCQbvnEbg7ntdaOv7iq+K4OZSwDWLWwrpbsmXP
 n7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749757504; x=1750362304;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E3L1BRXMYQOPZXwWB+HufjRJxBYhvQ+eeWRIbfY6WI0=;
 b=KvQUION5l95k8cPu4MlumH4kxitTaHIYnSX8jQ1cXRMdQPDzLpIjULNcFzXhmLvYw1
 sXfqewoEBVQw88DjIULygLsUikZQpfJFEefn7UWyWvec/m78b++zQnlhUBeocYvQYZ3E
 KUTNR5vi44uc/efaN3AwDpIY0KAvKEnKArGGG73m0DaNNXxHhGorxO6lSKaZA5V8Ie/G
 yI2ljttEQORaVBARjEdTRrP3lakoJe9O1zhQ/ntChJVzzDF3EEnJsArjFWraAm4rZvJs
 4t92ATuEXOCQKnFV6wcp/L12qw8dhpJ688XSum34zYQ8ydudke+bbu/xYS48BTJt05PP
 tuXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFDWNhl4P7o2Q/wbeESSIxP4aFnt9xqaYDVViLM/z56StSdQHqtZ1zofTAGIwaXJkyLfqveoumuqWM+Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxX6/SzgQ8ylCH35DG7U4jrFm6i1fEmS1iNaT55B+CAu+16Qg26
 Ar5DoBHG/J7v0ge/kibbpgeN1iRavLdnQBNBilaP3G4mC6gx6FU/H08n
X-Gm-Gg: ASbGncvUFpTkcwojhAXxtO6dURYKhc6h0Cxwjy2vaFJLei0I/DdKn4rx2/4bDOvBDIX
 GjdnbsnzovYAP4N5RteKd0goPCgFqnIdfbI6LHux79C/ciS2Qi/q7sy/77b5JZzrkf9wSS/re6B
 Dn7ATp3AiYhaaK6B14ZHT/eSBvELXPFB5+Ko3k0uBaIkoSYd/GSwNTClM16DZMjS7gK/UgWV4KP
 sBVGeAcMEaY8FhsfNPAaOmO6JLCCy2yLpeU16+pAy225JOL2tVfbgUNuwX35jPBivYbif+Nu5Ak
 7vIhV+ttJgNVaLJN3CSJtK5XCv0L9IseJHQW4QfHIfysm0GDzZkTcQK+KzasWA==
X-Google-Smtp-Source: AGHT+IH5SI3hUshSKHU0j6QBfj5JqczafiiFC8/0KUaseCcKbsSGpfUoReyErqftJzmx0fPZHAtJ2w==
X-Received: by 2002:aa7:88c2:0:b0:740:6f69:f52a with SMTP id
 d2e1a72fcca58-7488f485015mr691851b3a.0.1749757503807; 
 Thu, 12 Jun 2025 12:45:03 -0700 (PDT)
Received: from localhost ([216.228.127.129]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74890082859sm109585b3a.104.2025.06.12.12.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 12:45:03 -0700 (PDT)
Date: Thu, 12 Jun 2025 15:45:00 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Message-ID: <aEsuPN-kuQ8cjR7H@yury>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
X-Mailman-Approved-At: Fri, 13 Jun 2025 06:22:03 +0000
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-pci@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>,
 llvm@lists.linux.dev, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 Eric Dumazet <edumazet@google.com>, Bill Wendling <morbo@google.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 linux-phy@lists.infradead.org, kernel@collabora.com,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Jaehoon Chung <jh80.chung@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-rockchip@lists.infradead.org,
 linux-pm@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-clk@vger.kernel.org, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-media@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org, Qin Jian <qinjian@cqplus1.com>,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 linux-mmc@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vinod Koul <vkoul@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Justin Stitt <justinstitt@google.com>, Andy Yan <andy.yan@rock-chips.com>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 00/20] BYEWORD_UPDATE: unifying (most)
 HIWORD_UPDATE macros
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

On Thu, Jun 12, 2025 at 08:56:02PM +0200, Nicolas Frattaroli wrote:
> This series was spawned by [1], where I was asked to move every instance
> of HIWORD_UPDATE et al that I could find to a common macro in the same
> series that I am introducing said common macro.

And it means, at least for patch #1:

Suggested-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
 
> The first patch of the series introduces the two new macros in
> bitfield.h, called HWORD_UPDATE and HWORD_UPDATE_CONST. The latter can
> be used in initializers.
> 
> This macro definition checks that the mask fits, and that the value fits
> in the mask. Like FIELD_PREP, it also shifts the value up to the mask,
> so turning off a bit does not require using the mask as a value. Masks
> are also required to be contiguous, like with FIELD_PREP.
> 
> For each definition of such a macro, the driver(s) that used it were
> evaluated for three different treatments:
>  - full conversion to the new macro, for cases where replacing the
>    implementation of the old macro wouldn't have worked, or where the
>    conversion was trivial. These are the most complex patches in this
>    series, as they sometimes have to pull apart definitions of masks
>    and values due to the new semantics, which require a contiguous
>    mask and shift the value for us.
>  - replacing the implementation of the old macro with an instance of the
>    new macro, done where I felt it made the patch much easier to review
>    because I didn't want to drop a big diff on people.
>  - skipping conversion entirely, usually because the mask is
>    non-constant and it's not trivial to make it constant. Sometimes an
>    added complication is that said non-constant mask is either used in a
>    path where runtime overhead may not be desirable, or in an
>    initializer.
> 
> Left out of conversion:
>  - drivers/mmc/host/sdhci-of-arasan.c: mask is non-constant.
>  - drivers/phy/rockchip/phy-rockchip-inno-csidphy.c: mask is
>    non-constant likely by way of runtime pointer dereferencing, even if
>    struct and members are made const.
>  - drivers/clk/rockchip/clk.h: way too many clock drivers use non-const
>    masks in the context of an initializer.
> 
> I will not be addressing these 3 remaining users in this series, as
> implementing a runtime checked version on top of this and verifying that
> it doesn't cause undue overhead just for 3 stragglers is a bit outside
> the scope of wanting to get my RK3576 PWM series unblocked. Please have
> mercy.
> 
> In total, I count 19 different occurrences of such a macro fixed out of
> 22 I found. The vast majority of these patches have either undergone
> static testing to ensure the values end up the same during development,
> or have been verified to not break the device the driver is for at
> runtime. Only a handful are just compile-tested, and the individual
> patches remark which ones those are.
> 
> This took a lot of manual work as this wasn't really something that
> could be automated: code had to be refactored to ensure masks were
> contiguous, made sense to how the hardware actually works and to human
> readers, were constant, and that the code uses unshifted values.
> 
> https://lore.kernel.org/all/aD8hB-qJ4Qm6IFuS@yury/ [1]
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
> Nicolas Frattaroli (20):
>       bitfield: introduce HWORD_UPDATE bitfield macros
>       mmc: dw_mmc-rockchip: switch to HWORD_UPDATE macro
>       soc: rockchip: grf: switch to HWORD_UPDATE_CONST macro
>       media: synopsys: hdmirx: replace macros with bitfield variants
>       drm/rockchip: lvds: switch to HWORD_UPDATE macro
>       phy: rockchip-emmc: switch to HWORD_UPDATE macro
>       drm/rockchip: dsi: switch to HWORD_UPDATE* macros
>       drm/rockchip: vop2: switch to HWORD_UPDATE macro
>       phy: rockchip-samsung-dcphy: switch to HWORD_UPDATE macro
>       drm/rockchip: dw_hdmi_qp: switch to HWORD_UPDATE macro
>       drm/rockchip: inno-hdmi: switch to HWORD_UPDATE macro
>       phy: rockchip-usb: switch to HWORD_UPDATE macro
>       drm/rockchip: dw_hdmi: switch to HWORD_UPDATE* macros
>       ASoC: rockchip: i2s-tdm: switch to HWORD_UPDATE_CONST macro
>       net: stmmac: dwmac-rk: switch to HWORD_UPDATE macro
>       PCI: rockchip: switch to HWORD_UPDATE* macros
>       PCI: dw-rockchip: switch to HWORD_UPDATE macro
>       PM / devfreq: rockchip-dfi: switch to HWORD_UPDATE macro
>       clk: sp7021: switch to HWORD_UPDATE macro
>       phy: rockchip-pcie: switch to HWORD_UPDATE macro
> 
>  drivers/clk/clk-sp7021.c                           |  21 +--
>  drivers/devfreq/event/rockchip-dfi.c               |  26 ++--
>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    | 142 ++++++++++-----------
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |  80 ++++++------
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     |  68 +++++-----
>  drivers/gpu/drm/rockchip/inno_hdmi.c               |  11 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h       |   1 -
>  drivers/gpu/drm/rockchip/rockchip_lvds.h           |  21 +--
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |  14 +-
>  .../media/platform/synopsys/hdmirx/snps_hdmirx.h   |   5 +-
>  drivers/mmc/host/dw_mmc-rockchip.c                 |   7 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     |   3 +-
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c      |  39 +++---
>  drivers/pci/controller/pcie-rockchip.h             |  35 ++---
>  drivers/phy/rockchip/phy-rockchip-emmc.c           |   3 +-
>  drivers/phy/rockchip/phy-rockchip-pcie.c           |  72 +++--------
>  drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c  |  10 +-
>  drivers/phy/rockchip/phy-rockchip-usb.c            |  51 +++-----
>  drivers/soc/rockchip/grf.c                         |  35 +++--
>  include/linux/bitfield.h                           |  47 +++++++
>  sound/soc/rockchip/rockchip_i2s_tdm.h              |   4 +-
>  21 files changed, 342 insertions(+), 353 deletions(-)
> ---
> base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
> change-id: 20250610-byeword-update-445c0eea771d
> 
> Best regards,
> -- 
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
