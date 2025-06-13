Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF47AAD8BB0
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 14:09:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7DDAC36B3C;
	Fri, 13 Jun 2025 12:09:24 +0000 (UTC)
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F7A5C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 12:09:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1749816504; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HxsUUIkbJLHor7xQVOxFnKjQL2tcvAU/8U7uOGAT8YJ5SzkaPujbsMSqqr80mMJL7/C6qPJ5R72AJZZz4V+WGvRuhbDD8RcEdYVp0T3jFCWzPUWFNNQ68W3mkdPx/uRz9Q8CO9KUVnMiuh0wlCTVhHSoXI4LkoQwVLhFcDXTcHE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1749816504;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=oC6j4XXPtFnpNI59vFPxucp8Atnh3iWQ7iCtDWJTvGo=; 
 b=A1ATiiZZKeXR51mKcGYEcu+ievsJrJBhXTLF5fKN6m6uGlmf+gN+qSW/4BgN2DXa3+ihmm5IDJ0LMQYccMcRuItr2vNHq1tFXK2h6DApxhwbIV2hxsLhxWB7MZeQnM9wPRrdMCbbUDX2/hY046rowLcFe6wBngVN1Vd+mah2Cyc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749816504; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=oC6j4XXPtFnpNI59vFPxucp8Atnh3iWQ7iCtDWJTvGo=;
 b=iYPe6hd7lzD5NmEuVNlPJNUR1sBcQMTEzgFULW5ZE1tzhGuUUZmsrhquSUKDA+Cs
 I90mwM0EoNm4PSiTntzA6phjzUyTdMpluFlcfHK8TNliE3+1AYflsiylQRbXHpwn2NL
 nJ0riWRwAIxWd/I6yzJxEXtQHSBfMYaBpXVI3PVg=
Received: by mx.zohomail.com with SMTPS id 1749816501559794.9356716993168;
 Fri, 13 Jun 2025 05:08:21 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Niklas Cassel <cassel@kernel.org>
Date: Fri, 13 Jun 2025 14:08:08 +0200
Message-ID: <12129790.nUPlyArG6x@workhorse>
In-Reply-To: <aEvzMnxgsjfryCOo@ryzen>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
 <20250612-byeword-update-v1-17-f4afb8f6313f@collabora.com>
 <aEvzMnxgsjfryCOo@ryzen>
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
Subject: Re: [Linux-stm32] [PATCH 17/20] PCI: dw-rockchip: switch to
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

Hello,

On Friday, 13 June 2025 11:45:22 Central European Summer Time Niklas Cassel wrote:
> Hello Nicolas,
> 
> On Thu, Jun 12, 2025 at 08:56:19PM +0200, Nicolas Frattaroli wrote:
> > 
> > PCIE_CLIENT_RC_MODE/PCIE_CLIENT_EP_MODE was another field that wasn't
> > super clear on what the bit field modification actually is. As far as I
> > can tell, switching to RC mode doesn't actually write the correct value
> > to the field if any of its bits have been set previously, as it only
> > updates one bit of a 4 bit field.
> > 
> > Replace it by actually writing the full values to the field, using the
> > new HWORD_UPDATE macro, which grants us the benefit of better
> > compile-time error checking.
> 
> The current code looks like this:
> #define  PCIE_CLIENT_RC_MODE            HIWORD_UPDATE_BIT(0x40)
> #define  PCIE_CLIENT_EP_MODE            HIWORD_UPDATE(0xf0, 0x0)
> 
> The device_type field is defined like this:
> 4'h0: PCI Express endpoint
> 4'h1: Legacy PCI Express endpoint
> 4'h4: Root port of PCI Express root complex
> 
> The reset value of the device_type field is 0x0 (EP mode).
> 
> So switching between RC mode / EP mode should be fine.
> 
> But I agree, theoretically there could be a bug if e.g. bootloader
> has set the device_type to 0x1 (Legacy EP).
> 
> So if you want, you could send a patch:
> -#define  PCIE_CLIENT_RC_MODE            HIWORD_UPDATE_BIT(0x40)
> +#define  PCIE_CLIENT_RC_MODE            HIWORD_UPDATE(0xf0, 0x40)
> 
> With:
> Fixes: 0e898eb8df4e ("PCI: rockchip-dwc: Add Rockchip RK356X host controller driver")
> 
> But I also think that your current patch is fine as-is.
> 
> I do however think that you can drop this line:
> +#define  PCIE_CLIENT_MODE_LEGACY       0x1U
> 
> Since the define is never used.

Will do

> 
> 
> Also, is there any point in adding the U suffix?
> 
> Usually you see UL or ULL suffix, when that is needed, but there actually
> seems to be extremely few hits of simply U suffix:
> $ git grep 0x1U | grep -v UL

Sort of. Literals without the U suffix are considered signed iirc, and
operating with them and then left-shifting the result can run into issues
if you shift their bits into the sign bit. In the patch at [1] I needed to
quell a compiler warning about signed long overflows with a U suffix. This
should only ever really be a problem for anything that gets shifted up to
bit index 31 I believe, and maybe there's a better way to handle this in
the macro itself with an explicit cast to unsigned, but explicit casts
give me the ick. I'm also open to changing it to an UL, which will have
the same effect, and has more precedent.

> 
> 
> Kind regards,
> Niklas
> 

Best Regards,
Nicolas Frattaroli

Link: https://lore.kernel.org/all/20250612-byeword-update-v1-7-f4afb8f6313f@collabora.com/ [1]


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
