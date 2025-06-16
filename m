Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A28ADB1C8
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jun 2025 15:26:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FE3FC35E00;
	Mon, 16 Jun 2025 13:26:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFAEAC36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 13:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750080391; x=1781616391;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=W1ULqCjf8lfOUmBr3Wu+Ci3avbmtCxJZhQsdCwBauN4=;
 b=RXteJH8v1I6WOjkPGzyGLTU3NZGu3iYnaTVLxn4O9vxLtYzi6EVlkGY7
 R6+pgs/zbcLdcnHIIstrjReni3JqKfmGhlu9DCfVqiabLBJAE9fwtxCi6
 irKOkwdCNyIOnrcfksllsQwrxQelzRbVKRYsLZwD8PTxKmDtBYkq7GUaJ
 e073tI14Das3dT/J+qgLJ2vGudu18au3Gv/twxeTrEapBjkBNywf7p7kH
 9nMUw9DrVdaia0E1bVDkzOpfk+19eWnYFtW5uf09oEwbO0RX6NFArXlPh
 +gyuhuhj034I0yEanagY/DqNBTAUfl9cyIHbrNLel7Ia/K54gHaviR9ZA Q==;
X-CSE-ConnectionGUID: qOFyK39jToeaCjy5jOKBPg==
X-CSE-MsgGUID: GNhFDNAyQk6tSXASEX3gng==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63255609"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="63255609"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 06:26:29 -0700
X-CSE-ConnectionGUID: sUy1hWcBTaOgchksDDuQnw==
X-CSE-MsgGUID: y/Hym029QOuoVBlZiI68jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="153426298"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.92])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 06:26:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Robin Murphy
 <robin.murphy@arm.com>, Yury Norov <yury.norov@gmail.com>, Jakub Kicinski
 <kuba@kernel.org>
In-Reply-To: <3361713.44csPzL39Z@workhorse>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
 <1437fe89-341b-4b57-b1fa-a0395081e941@arm.com> <aEw7LBpmkfOqZgf1@yury>
 <3361713.44csPzL39Z@workhorse>
Date: Mon, 16 Jun 2025 16:26:07 +0300
Message-ID: <35d8c6372fb38f6d7e452c2e3b5a80327f20dae6@intel.com>
MIME-Version: 1.0
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-pci@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>,
 llvm@lists.linux.dev, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 Eric Dumazet <edumazet@google.com>, Bill Wendling <morbo@google.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 linux-phy@lists.infradead.org, kernel@collabora.com,
 David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org,
 Krzysztof =?utf-8?Q?Wilczy?= =?utf-8?Q?=C5=84ski?= <kwilczynski@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Jaehoon Chung <jh80.chung@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-rockchip@lists.infradead.org,
 linux-pm@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-media@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@kernel.org>,
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

On Mon, 16 Jun 2025, Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:
> Hello,
>
> On Friday, 13 June 2025 16:52:28 Central European Summer Time Yury Norov wrote:
>> On Fri, Jun 13, 2025 at 02:54:50PM +0100, Robin Murphy wrote:
>> > On 2025-06-12 7:56 pm, Nicolas Frattaroli wrote:
>> > > Hardware of various vendors, but very notably Rockchip, often uses
>> > > 32-bit registers where the upper 16-bit half of the register is a
>> > > write-enable mask for the lower half.
>> > > 
>> > > This type of hardware setup allows for more granular concurrent register
>> > > write access.
>> > > 
>> > > Over the years, many drivers have hand-rolled their own version of this
>> > > macro, usually without any checks, often called something like
>> > > HIWORD_UPDATE or FIELD_PREP_HIWORD, commonly with slightly different
>> > > semantics between them.
>> > > 
>> > > Clearly there is a demand for such a macro, and thus the demand should
>> > > be satisfied in a common header file.
>> > > 
>> > > Add two macros: HWORD_UPDATE, and HWORD_UPDATE_CONST. The latter is a
>> > > version that can be used in initializers, like FIELD_PREP_CONST. The
>> > > macro names are chosen to not clash with any potential other macros that
>> > > drivers may already have implemented themselves, while retaining a
>> > > familiar name.
>> > 
>> > Nit: while from one angle it indeed looks similar, from another it's even
>> > more opaque and less meaningful than what we have already. Personally I
>> > cannot help but see "hword" as "halfword", so logically if we want 32+32-bit
>> > or 8+8-bit variants in future those would be WORD_UPDATE() and
>> > BYTE_UPDATE(), right? ;)
>> > 
>> > It's also confounded by "update" not actually having any obvious meaning at
>> > this level without all the implicit usage context. FWIW my suggestion would
>> > be FIELD_PREP_WM_U16, such that the reader instantly sees "FIELD_PREP with
>> > some additional semantics", even if they then need to glance at the
>> > kerneldoc for clarification that WM stands for writemask (or maybe WE for
>> > write-enable if people prefer). Plus it then leaves room to easily support
>> > different sizes (and potentially even bonkers upside-down Ux_WM variants?!)
>> > without any bother if we need to.
>> 
>> I like the idea. Maybe even shorter: FIELD_PREP_WM16()?
>> 
>
> I do think FIELD_PREP_WM16() is a good name. If everyone is okay with this
> as a name, I will use it in v2 of the series. And by "everyone" I really
> mean everyone should get their hot takes in before the end of the week,
> as I intend to send out a v2 on either Friday or the start of next week
> to keep the ball rolling, but I don't want to reroll a 20 patch series
> with a trillion recipients more than is absolutely necessary.

I'd never guess what WM stands for in this context without looking it
up, but I'll be happy if we have FIELD_PREP_ and 16 in there. So works
for me.

> To that end, I'd also like to get some other naming choices clarified.
>
> As I gathered, these two macros should best be placed in its own header.
> Is include/linux/hw_bitfield.h a cromulent choice, or should we go with
> include/linux/hw_bits.h?

I'll let y'all fight it out.

> Furthermore, should it be FIELD_PREP_WM16_CONST or FIELD_PREP_CONST_WM16?
> I'm personally partial to the former.

Ditto.

> And finally, is it okay if I leave out refactoring Intel's
> _MASKED_FIELD() or should I see if I can at least replace its
> implementation while I'm at it?

I think you can just let us deal with that afterwards. You have enough
users already.


BR,
Jani.


>
> For less opinionated changes, I'll also change all the `U` literal
> suffixes to `UL` wherever I've added them. As I understand it, it doesn't
> really make a difference in these instances, but `UL` is more prevalent
> in the kernel.
>
> Kind regards,
> Nicolas Frattaroli
>
>

-- 
Jani Nikula, Intel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
