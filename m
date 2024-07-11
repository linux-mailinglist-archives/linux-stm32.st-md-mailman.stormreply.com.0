Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B97392E914
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jul 2024 15:16:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0962C6DD9D;
	Thu, 11 Jul 2024 13:16:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFF24C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jul 2024 13:16:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9837F61D2F;
 Thu, 11 Jul 2024 13:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DEA8C4AF07;
 Thu, 11 Jul 2024 13:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720703804;
 bh=r4dU6vqYjav3VvaXX3Sjsxc+xsxGdgu1+j2zgdtBir0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p6+2Cwc3E4O2uSx+DH2Km80jUBJZO8J64ERrKxq9KkUeFczRflG9OflmEO510OaXv
 45jt2cHUGxBY/BUC0Z9hW6R8nyC6DamtRdsZkHJARIg7E3kp7GzysSngCujqlP3VWR
 TPqx6sTZQOFskGr1UzbUnP1+s/mtIHMsYSvjvwH86bewjS89AL3t0A4IeTK4ozMmE9
 VfQlqnSZYJdUae8LIwJEfllYADu4Q5SdM6BISkS88tS/ThyaimP+0SKo9mM2mVW7a1
 WrZ7yUkx93n0H/pTz8Qc0943VkrKQagoUfasatX2jprIFXJOAYW6pqWFKD3Q2FcVk5
 vMsq9BOw/f7RA==
Date: Thu, 11 Jul 2024 15:16:40 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Message-ID: <nbi3fngfcipt35gzguk2mh4zzh3vy5a5gsk7dti5smm2iimytl@drm7p2iqsinp>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Baruch Siach <baruch@tkos.co.il>,
 Heiko Stuebner <heiko@sntech.de>, Ajay Gupta <ajayg@nvidia.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Eddie James <eajames@linux.ibm.com>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chris Brandt <chris.brandt@renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Kamal Dasu <kamal.dasu@broadcom.com>, Benson Leung <bleung@chromium.org>,
 Stefan Roese <sr@denx.de>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, Peter Korsgaard <peter@korsgaard.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>, Binbin Zhou <zhoubinbin@loongson.cn>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Sven Peter <sven@svenpeter.dev>, Jochen Friedrich <jochen@scram.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Ray Jui <rjui@broadcom.com>,
 linux-sunxi@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>,
 Masami Hiramatsu <mhiramat@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>,
 Jean Delvare <jdelvare@suse.com>, Robert Richter <rric@kernel.org>,
 Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, Hans Hu <hanshu@zhaoxin.com>,
 linux-actions@lists.infradead.org, virtualization@lists.linux.dev,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Hans de Goede <hdegoede@redhat.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-tegra@vger.kernel.org, Yicong Yang <yangyicong@hisilicon.com>,
 Conghui Chen <conghui.chen@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Scott Branden <sbranden@broadcom.com>, openbmc@lists.ozlabs.org,
 Thor Thayer <thor.thayer@linux.intel.com>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, Michael Shych <michaelsh@nvidia.com>,
 linux-renesas-soc@vger.kernel.org, asahi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 Till Harbaum <till@harbaum.org>
Subject: Re: [Linux-stm32] [PATCH v2 00/60] i2c: reword first drivers
 according to newest specification
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

Hi Wolfram,

pushed in i2c/i2c-host.

Thanks for this big work, at the end it turned out quite nice and
I'm happy of the outcome!

Thanks
Andi

On Sat, Jul 06, 2024 at 01:20:00PM GMT, Wolfram Sang wrote:
> Start changing the wording of the I2C main header wrt. the newest I2C
> v7 and SMBus 3.2 specifications and replace "master/slave" with more
> appropriate terms. This first step renames the members of struct
> i2c_algorithm. Once all in-tree users are converted, the anonymous union
> will go away again. All this work will also pave the way for finally
> seperating the monolithic header into more fine-grained headers like
> "i2c/clients.h" etc. So, this is not a simple renaming-excercise but
> also a chance to update the I2C core to recent Linux standards.
> 
> Changes since v1:
> 
> * changed wording according to the terminology we agreed on and defined
>   upstream. That means consistent use of "controller/target", and no
>   more "host/client". I added "local/remote target" where necessary.
> * added tags which I kept despite some changes in wording. The approach
>   and code changes (if necessary) did not change.
> * rebased to Andi's for-next branch
> * this series only contains patches which convert the drivers fully. If
>   all goes well, no more updates for them are needed. The previous
>   series converted all users of "master_xfer". But to avoid tons of
>   incremental patches to one driver, I will incrementally improve i2c.h
>   and see which drivers can be fully converted step-by-step.
> * do not mention I3C specs in commit messages, not really relevant here
> 
> Please note that I am not super strict with the 80 char limit. And, as
> agreed, I did not convert occasions where old terminology is used in
> register names or bits etc. or in function names outside of the I2C
> realm.
> 
> The outcome is that before this series 115 drivers use old terminology,
> after this only 54. Hooray.
> 
> And a comment to all janitors: Do not convert I2C drivers outside of
> drivers/i2c yet. Let us first gain experience here and present the
> well-tested results of what we figured out to other maintainers then.
> This ensures they have to deal with way less patch revisions.
> 
> Thanks and happy hacking!
> 
> 
> Wolfram Sang (60):
>   i2c: reword i2c_algorithm according to newest specification
>   i2c: ali15x3: reword according to newest specification
>   i2c: altera: reword according to newest specification
>   i2c: au1550: reword according to newest specification
>   i2c: bcm-kona: reword according to newest specification
>   i2c: bcm2835: reword according to newest specification
>   i2c: brcmstb: reword according to newest specification
>   i2c: cht-wc: reword according to newest specification
>   i2c: cp2615: reword according to newest specification
>   i2c: cros-ec-tunnel: reword according to newest specification
>   i2c: davinci: reword according to newest specification
>   i2c: digicolor: reword according to newest specification
>   i2c: diolan-u2c: reword according to newest specification
>   i2c: dln2: reword according to newest specification
>   i2c: fsi: reword according to newest specification
>   i2c: gpio: reword according to newest specification
>   i2c: highlander: reword according to newest specification
>   i2c: hisi: reword according to newest specification
>   i2c: hix5hd2: reword according to newest specification
>   i2c: i801: reword according to newest specification
>   i2c: ibm_iic: reword according to newest specification
>   i2c: iop3xx: reword according to newest specification
>   i2c: isch: reword according to newest specification
>   i2c: jz4780: reword according to newest specification
>   i2c: kempld: reword according to newest specification
>   i2c: ljca: reword according to newest specification
>   i2c: lpc2k: reword according to newest specification
>   i2c: ls2x: reword according to newest specification
>   i2c: mlxcpld: reword according to newest specification
>   i2c: mpc: reword according to newest specification
>   i2c: mt7621: reword according to newest specification
>   i2c: mv64xxx: reword according to newest specification
>   i2c: ocores: reword according to newest specification
>   i2c: octeon: reword according to newest specification
>   i2c: opal: reword according to newest specification
>   i2c: owl: reword according to newest specification
>   i2c: pasemi: reword according to newest specification
>   i2c: piix4: reword according to newest specification
>   i2c: powermac: reword according to newest specification
>   i2c: pxa-pci: reword according to newest specification
>   i2c: riic: reword according to newest specification
>   i2c: rk3x: reword according to newest specification
>   i2c: robotfuzz-osif: reword according to newest specification
>   i2c: rzv2m: reword according to newest specification
>   i2c: sis5595: reword according to newest specification
>   i2c: sprd: reword according to newest specification
>   i2c: stm32f4: reword according to newest specification
>   i2c: sun6i-p2wi: reword according to newest specification
>   i2c: taos-evm: reword according to newest specification
>   i2c: tegra-bpmp: reword according to newest specification
>   i2c: thunderx-pcidrv: reword according to newest specification
>   i2c: tiny-usb: reword according to newest specification
>   i2c: uniphier-f: reword according to newest specification
>   i2c: uniphier: reword according to newest specification
>   i2c: viperboard: reword according to newest specification
>   i2c: viai2c: reword according to newest specification
>   i2c: nvidia-gpu: reword according to newest specification
>   i2c: virtio: reword according to newest specification
>   i2c: cpm: reword according to newest specification
>   i2c: st: reword according to newest specification
> 
>  drivers/i2c/busses/i2c-ali15x3.c         |  2 +-
>  drivers/i2c/busses/i2c-altera.c          |  4 +-
>  drivers/i2c/busses/i2c-au1550.c          | 15 +++----
>  drivers/i2c/busses/i2c-bcm-kona.c        | 13 +++---
>  drivers/i2c/busses/i2c-bcm2835.c         | 10 ++---
>  drivers/i2c/busses/i2c-brcmstb.c         | 11 +++--
>  drivers/i2c/busses/i2c-cht-wc.c          |  8 ++--
>  drivers/i2c/busses/i2c-cp2615.c          |  8 ++--
>  drivers/i2c/busses/i2c-cpm.c             |  4 +-
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c  |  4 +-
>  drivers/i2c/busses/i2c-davinci.c         | 17 ++++---
>  drivers/i2c/busses/i2c-digicolor.c       |  6 +--
>  drivers/i2c/busses/i2c-diolan-u2c.c      |  2 +-
>  drivers/i2c/busses/i2c-dln2.c            |  4 +-
>  drivers/i2c/busses/i2c-fsi.c             | 56 ++++++++++++------------
>  drivers/i2c/busses/i2c-gpio.c            |  8 ++--
>  drivers/i2c/busses/i2c-highlander.c      |  2 +-
>  drivers/i2c/busses/i2c-hisi.c            |  8 ++--
>  drivers/i2c/busses/i2c-hix5hd2.c         |  6 +--
>  drivers/i2c/busses/i2c-i801.c            | 12 ++---
>  drivers/i2c/busses/i2c-ibm_iic.c         | 27 +++++-------
>  drivers/i2c/busses/i2c-iop3xx.c          | 15 +++----
>  drivers/i2c/busses/i2c-isch.c            |  2 +-
>  drivers/i2c/busses/i2c-jz4780.c          |  4 +-
>  drivers/i2c/busses/i2c-kempld.c          |  4 +-
>  drivers/i2c/busses/i2c-ljca.c            | 20 ++++-----
>  drivers/i2c/busses/i2c-lpc2k.c           | 10 ++---
>  drivers/i2c/busses/i2c-ls2x.c            | 11 +++--
>  drivers/i2c/busses/i2c-mlxcpld.c         | 14 +++---
>  drivers/i2c/busses/i2c-mpc.c             |  4 +-
>  drivers/i2c/busses/i2c-mt7621.c          | 26 +++++------
>  drivers/i2c/busses/i2c-mv64xxx.c         | 12 ++---
>  drivers/i2c/busses/i2c-nvidia-gpu.c      |  7 ++-
>  drivers/i2c/busses/i2c-ocores.c          |  8 ++--
>  drivers/i2c/busses/i2c-octeon-core.c     |  6 +--
>  drivers/i2c/busses/i2c-octeon-core.h     |  4 +-
>  drivers/i2c/busses/i2c-octeon-platdrv.c  |  2 +-
>  drivers/i2c/busses/i2c-opal.c            | 10 ++---
>  drivers/i2c/busses/i2c-owl.c             | 12 ++---
>  drivers/i2c/busses/i2c-pasemi-core.c     |  6 +--
>  drivers/i2c/busses/i2c-piix4.c           |  2 +-
>  drivers/i2c/busses/i2c-powermac.c        | 14 +++---
>  drivers/i2c/busses/i2c-pxa-pci.c         |  2 +-
>  drivers/i2c/busses/i2c-riic.c            |  8 ++--
>  drivers/i2c/busses/i2c-rk3x.c            | 20 ++++-----
>  drivers/i2c/busses/i2c-robotfuzz-osif.c  |  4 +-
>  drivers/i2c/busses/i2c-rzv2m.c           | 12 ++---
>  drivers/i2c/busses/i2c-sis5595.c         |  2 +-
>  drivers/i2c/busses/i2c-sprd.c            | 16 +++----
>  drivers/i2c/busses/i2c-st.c              |  8 ++--
>  drivers/i2c/busses/i2c-stm32f4.c         |  8 ++--
>  drivers/i2c/busses/i2c-sun6i-p2wi.c      | 20 ++++-----
>  drivers/i2c/busses/i2c-taos-evm.c        |  2 +-
>  drivers/i2c/busses/i2c-tegra-bpmp.c      |  4 +-
>  drivers/i2c/busses/i2c-thunderx-pcidrv.c |  2 +-
>  drivers/i2c/busses/i2c-tiny-usb.c        |  6 +--
>  drivers/i2c/busses/i2c-uniphier-f.c      | 26 +++++------
>  drivers/i2c/busses/i2c-uniphier.c        | 15 +++----
>  drivers/i2c/busses/i2c-viai2c-common.c   |  2 +-
>  drivers/i2c/busses/i2c-viai2c-wmt.c      |  8 ++--
>  drivers/i2c/busses/i2c-viai2c-zhaoxin.c  | 12 ++---
>  drivers/i2c/busses/i2c-viperboard.c      | 10 ++---
>  drivers/i2c/busses/i2c-virtio.c          |  2 +-
>  include/linux/i2c.h                      | 24 +++++++---
>  64 files changed, 313 insertions(+), 320 deletions(-)
> 
> -- 
> 2.43.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
