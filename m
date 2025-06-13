Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ED7AD8A55
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 13:23:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26B8AC36B3D;
	Fri, 13 Jun 2025 11:23:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1AEF4C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 09:45:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9FE655C5D0C;
 Fri, 13 Jun 2025 09:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7727C4CEEB;
 Fri, 13 Jun 2025 09:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749807936;
 bh=KZ0BWcWO/Nnu1q5NglmWAod4+nGJ2WWcd5CNjfdsUO4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aCQ+ArOMfZ8sj9/trk2RN4zzQmNDRm57UcCwHqzSNmBb3apdfrSNyzaknWyYLRPjh
 6E3L22twogCDgusyUyZzDGlDING27CHkfgVwL7Qfe5BDfSkbBp55e6vFTCsUCYhfWa
 iFB8yIknypSzugsOXAz7FH6q/xY/0xFIUp7GlroH+Qbv1fuibs4wDOAL+dnSd7SmBh
 PUekiEcVEkwP6WVmzgXHMenCSFCR5E17+KZjgA7/phOXpz9JEn4cTHyKgpHeTYwm+V
 Fhc+PM/4QdvEhSmY2I4S88xQ+fYARMAcOlJnmoU94LA5kiKThUq2MTXDYd0v0NZdZI
 bcsXM5H49D58w==
Date: Fri, 13 Jun 2025 11:45:22 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Message-ID: <aEvzMnxgsjfryCOo@ryzen>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
 <20250612-byeword-update-v1-17-f4afb8f6313f@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250612-byeword-update-v1-17-f4afb8f6313f@collabora.com>
X-Mailman-Approved-At: Fri, 13 Jun 2025 11:23:12 +0000
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

Hello Nicolas,

On Thu, Jun 12, 2025 at 08:56:19PM +0200, Nicolas Frattaroli wrote:
> 
> PCIE_CLIENT_RC_MODE/PCIE_CLIENT_EP_MODE was another field that wasn't
> super clear on what the bit field modification actually is. As far as I
> can tell, switching to RC mode doesn't actually write the correct value
> to the field if any of its bits have been set previously, as it only
> updates one bit of a 4 bit field.
> 
> Replace it by actually writing the full values to the field, using the
> new HWORD_UPDATE macro, which grants us the benefit of better
> compile-time error checking.

The current code looks like this:
#define  PCIE_CLIENT_RC_MODE            HIWORD_UPDATE_BIT(0x40)
#define  PCIE_CLIENT_EP_MODE            HIWORD_UPDATE(0xf0, 0x0)

The device_type field is defined like this:
4'h0: PCI Express endpoint
4'h1: Legacy PCI Express endpoint
4'h4: Root port of PCI Express root complex

The reset value of the device_type field is 0x0 (EP mode).

So switching between RC mode / EP mode should be fine.

But I agree, theoretically there could be a bug if e.g. bootloader
has set the device_type to 0x1 (Legacy EP).

So if you want, you could send a patch:
-#define  PCIE_CLIENT_RC_MODE            HIWORD_UPDATE_BIT(0x40)
+#define  PCIE_CLIENT_RC_MODE            HIWORD_UPDATE(0xf0, 0x40)

With:
Fixes: 0e898eb8df4e ("PCI: rockchip-dwc: Add Rockchip RK356X host controller driver")

But I also think that your current patch is fine as-is.

I do however think that you can drop this line:
+#define  PCIE_CLIENT_MODE_LEGACY       0x1U

Since the define is never used.


Also, is there any point in adding the U suffix?

Usually you see UL or ULL suffix, when that is needed, but there actually
seems to be extremely few hits of simply U suffix:
$ git grep 0x1U | grep -v UL


Kind regards,
Niklas
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
