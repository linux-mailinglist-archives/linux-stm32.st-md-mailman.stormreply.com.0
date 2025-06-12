Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1352BAD7B74
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 21:51:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B6CBC32E8E;
	Thu, 12 Jun 2025 19:51:28 +0000 (UTC)
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 995EFC36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 19:51:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1749757825; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=niCZ7gfbCTphUt9F4A6BqJhyAWLYx6ZFwS619hLJe6PBl39fzz0Cx8vMltl3JFnMTsylPx4rmHxzSjlI6+i7JxXqUGT3s6Es/ezleTw1LiVQjojUFV2MChvno5MY8Cvp/2xtoIVUvXIUkrk6ZQaLkHxbgid9Eb84F9rtiiep3/w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1749757825;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=mU+CcqNywPoimgVbJRvOWx8a/xllDqeUM7RTijoC4cY=; 
 b=QslLP2IFvCv129jJG9S1czdWGSll5oQcKPTGbu69twy2y6tft074Tj9gl4VSLqgkHbZePSQXCS47CfPxgVRXhkhNwNcM8sjdLMyylkaGbgAbNTkJteWsZT0or3z04oq3pKdilJf94Uubjr2Ok5GHz0dv8po0Wsr3HlZiPRC3pWc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749757824; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=mU+CcqNywPoimgVbJRvOWx8a/xllDqeUM7RTijoC4cY=;
 b=dgrFviZisw0pqrB+YqDeMyESyiRkmHgCVyEhMK+qA9s5JJEM1kHaX6FSiVjc6CAL
 ESUjzFUcC4kIRX5GaLHv+75hTR9fo3lR/+rESxFHOrnAIQiuvgMjh0P0wu1u/jZe70V
 f2+QqcSa+85I9n/Kg//f8lLHO3nJsdYBvCrZC82w=
Received: by mx.zohomail.com with SMTPS id 1749757823600263.75629300643163;
 Thu, 12 Jun 2025 12:50:23 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Jakub Kicinski <kuba@kernel.org>
Date: Thu, 12 Jun 2025 21:50:12 +0200
Message-ID: <22744779.EfDdHjke4D@workhorse>
In-Reply-To: <20250612124415.3399e26b@kernel.org>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
 <20250612-byeword-update-v1-1-f4afb8f6313f@collabora.com>
 <20250612124415.3399e26b@kernel.org>
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
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Yury Norov <yury.norov@gmail.com>,
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

On Thursday, 12 June 2025 21:44:15 Central European Summer Time Jakub Kicinski wrote:
> On Thu, 12 Jun 2025 20:56:03 +0200 Nicolas Frattaroli wrote:
> > Hardware of various vendors, but very notably Rockchip, often uses
> > 32-bit registers where the upper 16-bit half of the register is a
> > write-enable mask for the lower half.
> 
> Please limit the spread of this weirdness to a rockchip or "hiword"
> specific header. To a normal reader of bitfield.h these macros will
> be equally confusing and useless.
> 

That is how this change started out, and then a different maintainer told
me that this is a commonly used thing (see: the sunplus patch), and
Rockchip just happens to have a lot of these with consistent naming.

I believe normal readers of bitfield.h will be much more confused by the
undocumented concatenating macro soup at the end, but maybe that's just
me.

Best regards,
Nicolas Frattaroli


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
