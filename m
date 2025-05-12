Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1357AB3423
	for <lists+linux-stm32@lfdr.de>; Mon, 12 May 2025 11:56:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FA55C78F92;
	Mon, 12 May 2025 09:56:22 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99E3CC78F91
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 May 2025 09:56:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5F7BB61127;
 Mon, 12 May 2025 09:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20E1C4CEE7;
 Mon, 12 May 2025 09:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747043779;
 bh=i+C4MquKCE5DzjebZIg1suA7nSkmpPf5qHNeApUsg1A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qRopC9c+wx/+YYC0sJ/UvJzWi+Nuq8Af/LOL6TTdw1ObAiA1N4EP+e6QolBr4MpT6
 p5ltChjlCbyDDYRz89R5OVuaZ83tbLw+pYcksx/XVXGNoBUri07jOIpHu8d097AHB/
 gSDUJRuD+w/qmayEwLfKcRkm+4e+sfpRcvHaPFTEPbrRTxGpnFsatWWUdcTBd7OQnA
 w+ym87xDkxssPWo79tPQu/rSntgc4PEKUjTQ4e3C6qaM9CVgjCp/lHxzZltc1AavRM
 /LPUSo4AklmCrtIuWgWZpLqR0YnBmCrfB22k4a1IjHg5OgJnYBulNV1QgQrtx5KTRE
 uIiF1y2I3VB1w==
Message-ID: <a40c0dfc-b531-4cc0-80b2-5b972d9fb65c@kernel.org>
Date: Mon, 12 May 2025 11:55:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Gleixner <tglx@linutronix.de>
References: <20250319092951.37667-1-jirislaby@kernel.org> <874ixxonyy.ffs@tglx>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <874ixxonyy.ffs@tglx>
Cc: Andrew Lunn <andrew@lunn.ch>, Lee Jones <lee@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Naveen N Rao <naveen@kernel.org>,
 linux-sh@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Linus Walleij <linus.walleij@linaro.org>, Eddie James <eajames@linux.ibm.com>,
 x86@kernel.org, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Guo Ren <guoren@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jim Quinlan <jim2101024@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, linux-um@lists.infradead.org,
 linux-sound@vger.kernel.org, Scott Wood <oss@buserror.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-omap@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Andy Shevchenko <andy@kernel.org>, Qin Jian <qinjian@cqplus1.com>,
 Scott Branden <sbranden@broadcom.com>, Eric Dumazet <edumazet@google.com>,
 Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-wireless@vger.kernel.org,
 Daniel Golle <daniel@makrotopia.org>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-doc@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Daniel Palmer <daniel@thingy.jp>,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Peter Rosin <peda@axentia.se>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Miodrag Dinic <miodrag.dinic@mips.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, Yanteng Si <si.yanteng@linux.dev>,
 Anatolij Gustschin <agust@denx.de>, Masami Hiramatsu <mhiramat@kernel.org>,
 Woojung Huh <woojung.huh@microchip.com>, Andi Shyti <andi.shyti@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Roger Quadros <rogerq@kernel.org>,
 linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, Bjorn Helgaas <bhelgaas@google.com>,
 linux-amlogic@lists.infradead.org, Stafford Horne <shorne@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Tony Luck <tony.luck@intel.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>, Stephen Boyd <sboyd@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Antoine Tenart <atenart@kernel.org>,
 Nipun Gupta <nipun.gupta@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dinh Nguyen <dinguyen@kernel.org>, James Morse <james.morse@arm.com>,
 Corentin Chary <corentin.chary@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Herve Codina <herve.codina@bootlin.com>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 platform-driver-x86@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 Toan Le <toan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>,
 Doug Berger <opendmb@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 "Luke D. Jones" <luke@ljones.dev>, amd-gfx@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Andreas Kemnade <andreas@kemnade.info>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-edac@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>, Robert Richter <rric@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Ray Jui <rjui@broadcom.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Michael Buesch <m@bues.ch>, John Crispin <john@phrozen.org>,
 Takashi Iwai <tiwai@suse.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Talel Shenhar <talel@amazon.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 linux-snps-arc@lists.infradead.org, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Linus Walleij <linusw@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Dongliang Mu <dzm91@hust.edu.cn>, asahi@lists.linux.dev,
 netdev@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>,
 Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
 "David S. Miller" <davem@davemloft.net>, Nishanth Menon <nm@ti.com>,
 Baruch Siach <baruch@tkos.co.il>, Rich Felker <dalias@libc.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Liam Girdwood <lgirdwood@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>, linux-remoteproc@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Haojian Zhuang <haojian.zhuang@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Joyce Ooi <joyce.ooi@intel.com>,
 linux-riscv@lists.infradead.org, UNGLinuxDriver@microchip.com,
 Janne Grunau <j@jannau.net>, WANG Xuerui <kernel@xen0n.name>,
 Alex Shi <alexs@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, Ryder Lee <ryder.lee@mediatek.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 David Airlie <airlied@gmail.com>,
 Thangaraj Samynathan <Thangaraj.S@microchip.com>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Santosh Shilimkar <ssantosh@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Simona Vetter <simona@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sven Peter <sven@svenpeter.dev>, Richard Cochran <richardcochran@gmail.com>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 DENG Qingfang <dqfext@gmail.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 linux-mediatek@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>,
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Weinberger <richard@nod.at>, Keerthy <j-keerthy@ti.com>,
 Bjorn Andersson <andersson@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 linux-mips@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Tero Kristo <kristo@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, maz@kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 Gregory Clement <gregory.clement@bootlin.com>, Daniel Mack <daniel@zonque.org>
Subject: Re: [Linux-stm32] [PATCH v2 00/57] irqdomain: Cleanups and
	Documentation
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 06. 05. 25, 15:41, Thomas Gleixner wrote:
> On Wed, Mar 19 2025 at 10:28, Jiri Slaby wrote:
> 
>> Hi,
>>
>> tl;dr if patches are agreed upon, I ask subsys maintainers to take the
>> respective ones via their trees (as they are split per subsys), so that
>> the IRQ tree can take only the rest. That would minimize churn/conflicts
>> during merges.
> 
> So. It's rc5 by now and I picked up everything

Good, thanks.

> which did not show up in next yet. 

Which is the majority -- routing through subsystems didn't work as well 
as I anticipated.

I planned to retry with v3 after the next merge window, but you were faster.

V3 contains a switch from nodes to dev_fwnode() in some cases. It 
simplifies the code there. This did not get lost, I will send this 
separately to maintainers once everything from this series settles in 
the tree. I.e. likely after the next merge window.

> @Jiri, I fixed up all your subject prefixes as
> 
>    'irqdomain: subsys: Switch to foo()'
> 
> does not make any sense at all. These subsystems have their regular
> prefixes and these changes do not justify made up irqdomain special
> prefixes at all.

Yes.

thanks,
-- 
js
suse labs
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
