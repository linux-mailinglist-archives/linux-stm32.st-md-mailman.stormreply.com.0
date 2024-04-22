Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3008B8AC698
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 10:18:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DACCAC6DD67;
	Mon, 22 Apr 2024 08:18:51 +0000 (UTC)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4882DC64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 08:18:50 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VNJ6g0Nzdz4x1R;
 Mon, 22 Apr 2024 18:18:35 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20240403080702.3509288-1-arnd@kernel.org>
References: <20240403080702.3509288-1-arnd@kernel.org>
Message-Id: <171377378377.1025456.1313405994816400451.b4-ty@ellerman.id.au>
Date: Mon, 22 Apr 2024 18:16:23 +1000
MIME-Version: 1.0
Cc: , Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Heiko Stuebner <heiko@sntech.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Christoph Hellwig <hch@lst.de>, linux-samsung-soc@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	g.com@stm-ict-prod-mailman-01.stormreply.prv,
	linux-pm@vger.kernel.org, linux-sound@vger.kernel.org,
	Ian Abbott <abbotti@mev.co.uk>, linux-omap@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Alex Elder <elder@kernel.org>, Tero Kristo <kristo@kernel.org>,
	Xiang Chen <chenxiang66@hisilicon.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-spi@vger.kernel.org,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Iyappan Subramanian <iyappan@os.amperecomputing.com>,
	linux-crypto@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-trace-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Markuss Broks <markuss.broks@gmail.com>,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	linux-i2c@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
	Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev, Yisen Zhuang <yisen.zhuang@huawei.com>,
	Len Brown <lenb@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Corey Minyard <minyard@acm.org>, linux-kbuild@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analo.st-md-mailman.stormreply.com>,
	greybus-dev@lists.linaro.org,
	org@stm-ict-prod-mailman-01.stormreply.prv,
	linux-arm-kernel@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>,
	Anna Schumaker <anna@kernel.org>, linux-integrity@vger.kernel.org,
	alsa-devel@alsa-project.org, Jonathan Cameron <jic23@kernel.org>,
	linux-efi@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-fpga@vger.kernel.org, linux-fbdev@vger.kernel.org,
	kasan-dev@googlegroups.com, linux-amlogic@lists.infradead.org,
	linux-rtc@vger.kernel.org, Stanislaw Gruszka <stf_xl@wp.pl>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-staging@lists.linux.dev, Jiri Slaby <jirislaby@kernel>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-input@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Mark Brown <broonie@kernel.org>, Moritz Fischer <mdf@kernel.org>,
	openipmi-developer@lists.sourceforge.net, linux-nfs@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sebastian Reichel <sre@kernel.org>, netdev@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, Tony Lindgren <tony@atomide.com>,
	Liviu Dudau <liviu.dudau@arm.com>, linux-ide@vger.kernel.org,
	Peter Huewe <peterhuewe@gmx.de>, Ard Biesheuvel <ardb@kernel.org>,
	linux-leds@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	linux-scsi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	linux-stm32@st-md-mailman.stormr, linux-serial@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Jiri Kosina <jikos@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	John Allen <john.allen@amd.com>,
	eply.com@stm-ict-prod-mailman-01.stormreply.prv,
	Robin Murphy <robin.murphy@arm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
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
> Compilers traditionally warn for unused 'static' variables, but not
> if they are constant. The reason here is a custom for C++ programmers
> to define named constants as 'static const' variables in header files
> instead of using macros or enums.
> 
> In W=1 builds, we get warnings only static const variables in C
> files, but not in headers, which is a good compromise, but this still
> produces warning output in at least 30 files. These warnings are
> almost all harmless, but also trivial to fix, and there is no
> good reason to warn only about the non-const variables being unused.
> 
> [...]

Applied to powerpc/next.

[01/34] powerpc/fsl-soc: hide unused const variable
        https://git.kernel.org/powerpc/c/01acaf3aa75e1641442cc23d8fe0a7bb4226efb1

cheers
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
