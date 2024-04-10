Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C045E89ECF2
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Apr 2024 10:02:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71B92C6C858;
	Wed, 10 Apr 2024 08:02:41 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1A8CC6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Apr 2024 08:02:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 019B5CE2645;
 Wed, 10 Apr 2024 08:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EDFDC43390;
 Wed, 10 Apr 2024 08:02:36 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
 id 324081063262; Wed, 10 Apr 2024 10:02:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20240403080702.3509288-1-arnd@kernel.org>
References: <20240403080702.3509288-1-arnd@kernel.org>
Message-Id: <171273615213.1094883.18382201508159771859.b4-ty@collabora.com>
Date: Wed, 10 Apr 2024 10:02:32 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Heiko Stuebner <heiko@sntech.de>, "Rafael J. Wysocki" <rafael@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Christoph Hellwig <hch@lst.de>, linux-samsung-soc@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-pm@vger.kernel.org,
 linux-sound@vger.kernel.org, Ian Abbott <abbotti@mev.co.uk>,
 linux-omap@vger.kernel.org, Trond Myklebust <trond.myklebust@hammerspace.com>,
 Alex Elder <elder@kernel.org>, Tero Kristo <kristo@kernel.org>,
 Xiang Chen <chenxiang66@hisilicon.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 linux-crypto@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-trace-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Markuss Broks <markuss.broks@gmail.com>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>, linux-i2c@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, Corey Minyard <minyard@acm.org>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Len Brown <lenb@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Michael Hennerich <michael.hennerich@analog.com>, linux-kbuild@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, greybus-dev@lists.linaro.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Jarkko Sakkinen <jarkko@kernel.org>, Anna Schumaker <anna@kernel.org>,
 linux-integrity@vger.kernel.org, alsa-devel@alsa-project.org,
 Jonathan Cameron <jic23@kernel.org>, linux-efi@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fpga@vger.kernel.org,
 linux-fbdev@vger.kernel.org, kasan-dev@googlegroups.com,
 Jiri Slaby <jirislaby@kernel.org>, linux-rtc@vger.kernel.org,
 Stanislaw Gruszka <stf_xl@wp.pl>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-staging@lists.linux.dev, linux-input@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jiri Kosina <jikos@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Steven Rostedt <rostedt@goodmis.org>,
 Nathan Chancellor <nathan@kernel.org>, Mark Brown <broonie@kernel.org>,
 Moritz Fischer <mdf@kernel.org>, openipmi-developer@lists.sourceforge.net,
 linux-nfs@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Peter Rosin <peda@axentia.se>,
 linux-stm32@st-md-mailman.stormreply.com, Tony Lindgren <tony@atomide.com>,
 Liviu Dudau <liviu.dudau@arm.com>, linux-ide@vger.kernel.org,
 Peter Huewe <peterhuewe@gmx.de>, Ard Biesheuvel <ardb@kernel.org>,
 linux-leds@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-scsi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 John Allen <john.allen@amd.com>, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Damien Le Moal <dlemoal@kernel.org>, dmaengine@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] (subset) [PATCH 00/34] address all -Wunused-const
	warnings
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


On Wed, 03 Apr 2024 10:06:18 +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Compilers traditionally warn for unused 'static' variables, but not
> if they are constant. The reason here is a custom for C++ programmers
> to define named constants as 'static const' variables in header files
> instead of using macros or enums.
> 
> [...]

Applied, thanks!

[09/34] power: rt9455: hide unused rt9455_boost_voltage_values
        commit: 452d8950db3e839aba1bb13bc5378f4bac11fa04

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
