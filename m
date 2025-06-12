Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EB0AD7AF7
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 21:17:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19E35C32E8E;
	Thu, 12 Jun 2025 19:17:28 +0000 (UTC)
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9EC3BC36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 19:17:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1749755784; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EFH1gBrXRxnEbdwN8NuKJttxVfo8otLAVWOqMjccSlAJPieQGoreQOALJFOFSNWr7sTm1nnCQDuu/HsQkPOtQ/3OSYvQ4RyjyXBtSHjqSQpOvG+rol3y4CMkvAvX4S8y9ER4JY1+I1De1RTZCspz3nMo9hgIs9GEa29Bt5D3wzA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1749755784;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=sAz8u8Of8VgXN3BQQ00U/F57NlhrS7p1nuOTfYJkSLY=; 
 b=gx56POiNw+tPyzwOMUrXJdu8LXA3Wx0Fc7fpLgAxdL2NAvF06jUmFzQXXgdclEPvSot/sq5wjbKw4wosmJTvqvr3D2Ol7BcVPeIHRceQLb93o93NE842mu2MIU+ewqzhHXcOyn6sA+I1W7R4ndFqRO48pbEglbjFxLxjTpMHRfE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749755783; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=sAz8u8Of8VgXN3BQQ00U/F57NlhrS7p1nuOTfYJkSLY=;
 b=jdBSKwBQJwbK7Wgb1BeOkKDHoXCKiMSRe7vNwtqecSYRDrLuqn7O5OZawJAn+DCb
 1ShpLyDr//VBXzQCMKFW7XHKGS1I5U54aXGur+fPFzehkfen3wY4iloFKJZGU5HBeiY
 CPvZ+rLtAcn7WQvK9zh7a9yesjqizAMrfxYGbQiQ=
Received: by mx.zohomail.com with SMTPS id 1749755781436118.00228707547853;
 Thu, 12 Jun 2025 12:16:21 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Thu, 12 Jun 2025 21:16:09 +0200
Message-ID: <10689894.nUPlyArG6x@workhorse>
In-Reply-To: <5947475f-ef38-44cb-857e-0c7378023ccd@lunn.ch>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
 <20250612-byeword-update-v1-15-f4afb8f6313f@collabora.com>
 <5947475f-ef38-44cb-857e-0c7378023ccd@lunn.ch>
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
 MyungJoo Ham <myungjoo.ham@samsung.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-media@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>,
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
Subject: Re: [Linux-stm32] [PATCH 15/20] net: stmmac: dwmac-rk: switch to
	HWORD_UPDATE macro
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

On Thursday, 12 June 2025 21:08:20 Central European Summer Time Andrew Lunn wrote:
> On Thu, Jun 12, 2025 at 08:56:17PM +0200, Nicolas Frattaroli wrote:
> > The era of hand-rolled HIWORD_UPDATE macros is over, at least for those
> > drivers that use constant masks.
> > 
> > Like many other Rockchip drivers, dwmac-rk has its own HIWORD_UPDATE
> > macro. Its semantics allow us to redefine it as a wrapper to the shared
> > bitfield.h HWORD_UPDATE macros though.
> > 
> > Replace the implementation of this driver's very own HIWORD_UPDATE macro
> > with an instance of HWORD_UPDATE from bitfield.h. This keeps the diff
> > easily reviewable, while giving us more compile-time error checking.
> > 
> > The related GRF_BIT macro is left alone for now; any attempt to rework
> > the code to not use its own solution here would likely end up harder to
> > review and less pretty for the time being.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> Please split this out into a patch for net-next.

I would be surprised if it didn't apply to net-next.

> Also, Russell King has just posted a number of patches for this driver,
> so you will probably want to wait for them to be merged, so you post
> something which will merged without any fuzz.

I would be surprised if an automatic merge did not produce correct code
here, as I specifically replaced the implementation of the macro with
an instance of the new macro and adjusted semantics on purpose. If it
compiles, it's correct.

Would you still prefer for me to re-send this patch based against
net-next once the new macro is merged and within net-next?

> 
> 	Andrew
> 

Best regards,
Nicolas Frattaroli



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
