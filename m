Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52207B37680
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Aug 2025 03:09:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA89EC3F953;
	Wed, 27 Aug 2025 01:09:31 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2616C3F952
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Aug 2025 01:09:30 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b49d6f8f347so3046780a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 18:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756256969; x=1756861769;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rYru9aDq9lQqkQVO+bwcYPZ+KioVEL3wdcshlzZLQl8=;
 b=M00p5UigdnMFT5BhWYc/IfKSVGwt+J5rpjOvJuaU34q4lQqjOaO86KzXShwdXbgWkM
 l1UNkjyAW57TLvhImz5DOxBQr16RiRPWnI7My2BR6+3Nhs9tzrK0PB9K/vEyRpx+Iq/b
 YjUbOMLQV/S5i96T9vynzeI/FUm4Nm3PsWYvNSw+Mpjg7LuzAIoc527ep8r8c39xFCn9
 X3DWc/5+PeG81bGa+nhhBC5bVLgreyonALj3U3kxx3jO3kwJ/AMbDBq1ViYDSFA9xHsY
 wjqopzD6Q/t6svCOAgtzqoUnQDZnIp8nkfdM75ZzshN9RfjzXX09VaO9Ph0zmn25RTA4
 0dRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756256969; x=1756861769;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rYru9aDq9lQqkQVO+bwcYPZ+KioVEL3wdcshlzZLQl8=;
 b=r/2d2aNJr8vspxCG60xUBO74CgPeXWHhkYRVvTuJVsizOaz+aku0OSizOPO4ePbPQo
 v0Oq4eE5K9+so3QrayX6fyEod9OxqhbrMafPfkB9MjaiMVoeQBFI8hZNxC49XdFbQLUV
 rrGwxIe9C5JeDcGt/35xFxzG1xSjz5xrjHKPB8IBqCAjIpQ6vhfRbUrMFMB0PRCKwLOo
 QzFJnVZmFu8Z26KqYmSJNELcs8n9GvnKFNu23+cGUjEFv01EPXgG/c9CRIDE1kC7lx57
 CzvSGqows3qaUuX0KWuds8M2PiivfoCiduXrIvRXWws24+G4hOF07bTEqBuvmxZdtY0Y
 sgig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsAIINcrH8r9lgqz6lEPdgwY02PcRbarKJrXMwxgJiCoVFuXm055waeyOp6qYhFiuoooNsMtUbvK8fng==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz8CQr5yAdBBjJ3bZcIRAb3p9wXJrepNrLLO1RhpXYmIypwaEHg
 LftZNWVrLwP3biw1ZV7dTCQR9K+BrwBn5ijhab3LaxkkWYhb01sJ91mH
X-Gm-Gg: ASbGncvnqAiUiqnrUOYSuRDB/1VnTvCeh82Pdq23o50fxqhIsmdHReSG8XxR9ZKgvE3
 +uruP+8ChNPeIpXvZEugKGL1WfeIY+ULyY4cOuHdAdjIGE1ypQf1dtEmUyd9Q5/3gga5fBNT0zW
 +2kAJehlhhpGILh4ZF6UBjX5OFB2N9VgPzMzlMw7tOuH+gQeNm2X0NzskhWFGfbW84HhblzKFcH
 obOIlcQkYAysqJ3+Cdh0DW1NdwCon7HAIfDBxLg3pRzqXjrBJbO7yNydYXdI3SLPFNru5fG2Ti3
 670Lj8QgOOe/62L5mZ1wzuLu2toEqamO+GvlUTSmNlnUavsnM7eH0UgnyNmICKTNOi0CU6WD9IJ
 4xQwXjm8i2ObTrLi49D8kHWirH+XyIeLa
X-Google-Smtp-Source: AGHT+IHkfsVuZ+4qDUB9kGWXKNs3ixhtdzwAG20w+Ik2IkMK7IqkqBUunACMn5yLzf65+cgJRTumCw==
X-Received: by 2002:a05:6a20:7286:b0:240:d7a:9591 with SMTP id
 adf61e73a8af0-24340d1c50amr25873828637.46.1756256969084; 
 Tue, 26 Aug 2025 18:09:29 -0700 (PDT)
Received: from localhost ([216.228.127.130]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4a8b7b301csm6847632a12.35.2025.08.26.18.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:09:28 -0700 (PDT)
Date: Tue, 26 Aug 2025 21:09:26 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Message-ID: <aK5aujavDc4PvvjO@yury>
References: <20250825-byeword-update-v3-0-947b841cdb29@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250825-byeword-update-v3-0-947b841cdb29@collabora.com>
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
 Justin Stitt <justinstitt@google.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 00/20] BYEWORD_UPDATE: unifying (most)
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

Hi Nicolas,

Thanks for the work!

On Mon, Aug 25, 2025 at 10:28:20AM +0200, Nicolas Frattaroli wrote:
> This series was spawned by [1], where I was asked to move every instance
> of HIWORD_UPDATE et al that I could find to a common macro in the same
> series that I am introducing said common macro.
> 
> The first patch of the series introduces a new header file,
> hw_bitfield.h, which contains two new macros: FIELD_PREP_WM16 and
> FIELD_PREP_WM16_CONST. The latter can be used in initializers.
> 
> I've cheekily added the hw_bitfield.h header to the BITMAP API section
> of the MAINTAINERS file.
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

+ Michal Simek <michal.simek@amd.com>

>  - drivers/phy/rockchip/phy-rockchip-inno-csidphy.c: mask is
>    non-constant likely by way of runtime pointer dereferencing, even if
>    struct and members are made const.

+ Vinod Koul <vkoul@kernel.org> (already in the list)

>  - drivers/clk/rockchip/clk.h: way too many clock drivers use non-const
>    masks in the context of an initializer.

+ Heiko Stuebner <heiko@sntech.de> (already in the list)

Guys, can you please take a look? Would be nice to finish the
consolidation.

--

I'll take #1 and the acknowledged (or at least reviewed) per-driver
fixes in bitmap-for-next in 2-3 weeks before the end of cycle.
Everyone, please send your tags!

Nicolas, please ping me if I forget. For the rest of the series, in
case of no feedback from maintainers, let's wait for one more merge
window, and then move everything altogether.

Thanks,
Yury
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
