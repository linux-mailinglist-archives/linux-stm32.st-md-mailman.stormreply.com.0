Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E352AD8329
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 08:22:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A119C3089D;
	Fri, 13 Jun 2025 06:22:05 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0DECC36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 20:10:41 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-b2fc93728b2so1099788a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 13:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749759040; x=1750363840;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ACQzSKiLB081J7RKsan9TDO2EOdfGESNIDhEKLy5me8=;
 b=Gg7eodLZS0JzAer4z0cw16vzau7oGqHo2i0nsmsSkttkm4O/i/IH8dxBdEkqxOoO1y
 l2prjeiFLO8kW7+H5oBBj4hGOr0JwmcsbtLW0ZWzVzvX4LRxQrw1DEaWLMSEKV3R8nuX
 nJHN77i4Kcz4972WABBWCYMN6CS/a5MOy8/X+Ek8a667VbSY+tMsLjUrnnEwKBNp+aQo
 mDo7xBR/ieZTGHQn3Pk0lC0b3H2MY99nYRmFqt6//zR+JNots7NBgxw4qpnj5D5YCByu
 mqeoizyV4JaL4r2Il9ywfQfNS+Cfo+iN4gK8cgRNWOCTNTW6PSyr3LqW7zjrQ1cZhlU1
 F3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749759040; x=1750363840;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ACQzSKiLB081J7RKsan9TDO2EOdfGESNIDhEKLy5me8=;
 b=cfdWR/NpeAa1VuRkbZkwwbu92b3xBtLlp4kntVGE+dX3r/TbWlSPtAM1N6xPgC3vaK
 6OQN+YJTZJyGuJyvCpwT79SR8zEnVD7EXSGf91iM6V0Snz29KyjMvkwx0+nnwrVB+1yd
 57cpXBqyE6cYUUvUxmlvDQVILYDDwM7nu8NVE/MWUvSCO8ss8I4+SWkQwQa2uOMl/7eR
 90F+furfVd8KjOikdFDUDkSi1lR3MF+Gv2Ehoc0k3DQ+xEF4hCTbQH+tw73xlSee59rk
 BQDXWhEbmQ+tOPR3CWIVUP4Dk3IHxGwSwS8whxj50puqzeGU3uCzqIImvr9izQzuWmCa
 rNFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWP4J/tyh3IFKXTznAliZH3kogmm9pSG6aAMCepFlT8psA02puG/b4bNFlnChSN+DOB9KAsUEQ5tcVKQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyvqSU6z4U6tbV3+BZaAGGzJAlAweICj33gIRmJINlX4tU/Fz7h
 Bjk+Q97ym+RXUSf3Lul1jnUba8ewSVSNZkMS29d2itAQ6BrQtFwqRLmU
X-Gm-Gg: ASbGncubOjxN2gAwjsXaeI9MT0CjJHTq6SfiaawigpvYLWhnBmF6StSQrD5VLwvcChu
 eHxvo4GBQX10EoqoulL64FQTpwYFHc+MYPjuAs0sN/eaL9/cABwiui/nTx5AvlCfkLi1kI81Smx
 ErysI7CTakPziEO6KBGDosH8qewnLNdcsD2tYW9acVoSTOIWIbOmyh0ymAmAxFp942uaflJNk6B
 lOdqFv70Da3r0flyza4jDkOgZfoouYffDyEsDBkx/Ma6pe1xCSI4i2C7yEvL4ep2AmVKrPjUIpT
 F+//TFA4jP6+BBeGY2pmuKxjC2F1FcsFnkPiT15oIIZx4DWXkLSixfG7VDFuqg==
X-Google-Smtp-Source: AGHT+IG8TocKyZo9LiHYpgmcLhk97cCKpOT9D/IFBCoE4AePraGyNKa1PzBXNuqHoDVO+xHoWj80Yg==
X-Received: by 2002:a05:6a21:8dc4:b0:1f5:6c94:2cd7 with SMTP id
 adf61e73a8af0-21fad11efd4mr288514637.42.1749759040324; 
 Thu, 12 Jun 2025 13:10:40 -0700 (PDT)
Received: from localhost ([216.228.127.129]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2fe1691d7fsm150701a12.69.2025.06.12.13.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 13:10:39 -0700 (PDT)
Date: Thu, 12 Jun 2025 16:10:37 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Message-ID: <aEs0PVkwFN9uRgU0@yury>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
 <20250612-byeword-update-v1-1-f4afb8f6313f@collabora.com>
 <20250612124415.3399e26b@kernel.org>
 <22744779.EfDdHjke4D@workhorse>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <22744779.EfDdHjke4D@workhorse>
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
Subject: Re: [Linux-stm32] [PATCH 01/20] bitfield: introduce HWORD_UPDATE
	bitfield macros
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

On Thu, Jun 12, 2025 at 09:50:12PM +0200, Nicolas Frattaroli wrote:
> On Thursday, 12 June 2025 21:44:15 Central European Summer Time Jakub Kicinski wrote:
> > On Thu, 12 Jun 2025 20:56:03 +0200 Nicolas Frattaroli wrote:
> > > Hardware of various vendors, but very notably Rockchip, often uses
> > > 32-bit registers where the upper 16-bit half of the register is a
> > > write-enable mask for the lower half.
> > 
> > Please limit the spread of this weirdness to a rockchip or "hiword"
> > specific header. To a normal reader of bitfield.h these macros will
> > be equally confusing and useless.
> > 
> 
> That is how this change started out, and then a different maintainer told
> me that this is a commonly used thing (see: the sunplus patch), and
> Rockchip just happens to have a lot of these with consistent naming.

That other maintainer was me, and the macro is indeed not used by rockchip
weirdness solely:

$ git grep HIWORD | grep -v rockchip | wc -l
326

I don't think that that having HWORD_UPDATE() in bitfield.h is a wrong
thing. Jakub, if you do, we can just create a new header for it.

Thanks,
Yury
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
