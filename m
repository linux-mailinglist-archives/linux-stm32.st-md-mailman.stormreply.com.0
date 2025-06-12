Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 671F6AD7E23
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 00:01:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16B58C36B2A;
	Thu, 12 Jun 2025 22:01:36 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B159C36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 22:01:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2D614A52192;
 Thu, 12 Jun 2025 22:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E14DC4CEEA;
 Thu, 12 Jun 2025 22:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749765693;
 bh=4c23EVlBRbC0Sh2HVGAeTrWF8ckuRzyb3wIApq3EJ0Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pyPMHD+jhG+UTqABmIsWKlZaWpYwYT8yRbeTaj6af6mv0CScs81OZC14hEgpOQpqo
 RxUjx7u0c04zWdOWA3HP8r3YCxfTUGgt7/6IXy+olWrZBlDDPCnHfJ2v85tlNdrCRD
 UXqXIBSfdaqN7b2Zw9ekGq/d+2TWFahI8NypgSV/iEUgbik9cuIv4+7KQ4X2/YGiui
 ToRHQcO0nLaHP41ty5z3+YlPdDtFsHUjqfXoXCbBt0r8dFq6GTqY/uU3iMpROb1OVO
 RPp4P9+AYRiUOFuciFsilpSUhTCO/Q80c3PWR/d5rsYLxFbYNnCdfYj4zHkbScfKyp
 +9szYBH1OtjOA==
Date: Thu, 12 Jun 2025 15:01:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yury Norov <yury.norov@gmail.com>
Message-ID: <20250612150130.36b01844@kernel.org>
In-Reply-To: <aEs0PVkwFN9uRgU0@yury>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
 <20250612-byeword-update-v1-1-f4afb8f6313f@collabora.com>
 <20250612124415.3399e26b@kernel.org>
 <22744779.EfDdHjke4D@workhorse> <aEs0PVkwFN9uRgU0@yury>
MIME-Version: 1.0
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-pci@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>,
 llvm@lists.linux.dev, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 Eric Dumazet <edumazet@google.com>, Bill Wendling <morbo@google.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 linux-phy@lists.infradead.org, kernel@collabora.com,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Jaehoon Chung <jh80.chung@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-rockchip@lists.infradead.org,
 linux-pm@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-clk@vger.kernel.org, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-media@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org, Qin Jian <qinjian@cqplus1.com>,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 linux-mmc@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vinod Koul <vkoul@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Justin Stitt <justinstitt@google.com>, Andy Yan <andy.yan@rock-chips.com>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
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

On Thu, 12 Jun 2025 16:10:37 -0400 Yury Norov wrote:
> I don't think that that having HWORD_UPDATE() in bitfield.h is a wrong
> thing. Jakub, if you do, we can just create a new header for it.

Yes, I'd prefer to contain it. This looks very much like a CSR tooling
convention of Rockchip's ASIC developers. IOW this is really about how
CSRs are access for a specific vendor, not a generic bitfield operator.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
