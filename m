Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F52B11598
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Jul 2025 03:14:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76BF1C36B2B;
	Fri, 25 Jul 2025 01:14:14 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A203BC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Jul 2025 01:14:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1449B601D9;
 Fri, 25 Jul 2025 01:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E852C4CEED;
 Fri, 25 Jul 2025 01:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753406051;
 bh=QCfq7NK2qUEbOfaVUsUfHClTgphOJ5SqPV/8zEcK5wk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=eib7mR13CXAqUYOGvZuBnzmXTI28/D0YWPjLXhdoeP2ORv2J/Bg0cre+NJXHgkvlK
 JyS6JBrn3yGS57nKM5UJ14FmIckuuILLLwq3pvt1YoDAqLfk5LmjIQCkPIytUlTNpJ
 cLqu+6QxYzG4zkvPS35ormr/S06tETerOT4NCnCpKMKGLmhpCxgtGoze/ZZkjk3W4R
 XYJ6vldLFjCDoLxMoZwR5Q274cnYfR/X6eeqcgq8Pt/Zj4QwzHxBIZi6usZGcL3or7
 h1xE6oTKpeNi3bW0aycHqsQ0vymIyGUOoQjyr1OzMlr8nt92advrsBmVyZRhIuEhEi
 RsgTts79mDXWw==
MIME-Version: 1.0
In-Reply-To: <20250623-byeword-update-v2-19-cf1fc08a2e1f@collabora.com>
References: <20250623-byeword-update-v2-0-cf1fc08a2e1f@collabora.com>
 <20250623-byeword-update-v2-19-cf1fc08a2e1f@collabora.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Andy Yan <andy.yan@rock-chips.com>,
 Bill Wendling <morbo@google.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, David Airlie <airlied@gmail.com>,
 David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Heiko Stuebner <heiko@sntech.de>, Jaehoon Chung <jh80.chung@samsung.com>,
 Jakub Kicinski <kuba@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Justin Stitt <justinstitt@google.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof =?utf-8?q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard <mripard@k
 ernel.org>, Michael Turquette <mturquette@baylibre.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Paolo Abeni <pabeni@redhat.com>, Qin Jian <qinjian@cqplus1.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Rob Herring <robh@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, Shawn Lin <shawn.lin@rock-chips.com>,
 Shreeya Patel <shreeya.patel@collabora.com>, Simona Vetter <simona@ffwll.ch>,
 Takashi Iwai <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Ulf Hansson <ulf.hansson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Yury Norov <yury.norov@gmail.com>
Date: Thu, 24 Jul 2025 18:14:10 -0700
Message-ID: <175340605069.3513.18204498860033427106@lazor>
User-Agent: alot/0.11
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-pm@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 19/20] clk: sp7021: switch to
	FIELD_PREP_WM16 macro
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

Quoting Nicolas Frattaroli (2025-06-23 09:05:47)
> The sp7021 clock driver has its own shifted high word mask macro,
> similar to the ones many Rockchip drivers have.
> 
> Remove it, and replace instances of it with hw_bitfield.h's
> FIELD_PREP_WM16 macro, which does the same thing except in a common
> macro that also does compile-time error checking.
> 
> This was compile-tested with 32-bit ARM with Clang, no runtime tests
> were performed as I lack the hardware. However, I verified that fix
> commit 5c667d5a5a3e ("clk: sp7021: Adjust width of _m in HWM_FIELD_PREP()")
> is not regressed. No warning is produced.

Does it generate the same code before and after?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
