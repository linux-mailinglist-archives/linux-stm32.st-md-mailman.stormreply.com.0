Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F432AAC6AE
	for <lists+linux-stm32@lfdr.de>; Tue,  6 May 2025 15:42:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E05F6C78F61;
	Tue,  6 May 2025 13:42:00 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80472C78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 May 2025 13:41:59 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1746538918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6KIDdrTanUmKEwxmKjGlY7d/jG09aY8AhXQLqxXMqzQ=;
 b=H+VsQc831BMBvRdCis3hR9IME8F22ohOOmKZluRXXeIChbYi1i570UHmhVD5rd7PsM0wkw
 1HP7eA6z+5IOLUhZQhdmF7or5iTztS2QKJRbmEAgjwq+1Hky247NEhKEDwxezgoUgE8R63
 V0qhDAjB+7b6J29c/AFLytdeXny2As20JkHKAF/cRWfC8kJjaTkOeduY468BYQE2K9Pe7t
 RZn4xt/lidjhGxatyOKQrc3oS+XevZF44OnoNsT2EV+VMTLkWVspPyrnrP+fONNObWghO5
 kqLvOAkiLKb35XcFpn3CDCCYGOIkDA8SOrbQ3Xkiok9AVLUm0v7enGUguU9+4Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1746538918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6KIDdrTanUmKEwxmKjGlY7d/jG09aY8AhXQLqxXMqzQ=;
 b=A2WDNfDnfT0mD/DZk/nR0ud2qdiz1r7YzlYDJPAh4yEaDeywUZVRbpTk6UzDijgMvH2IBC
 SeknVmXTWgr5wDBA==
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
Date: Tue, 06 May 2025 15:41:57 +0200
Message-ID: <874ixxonyy.ffs@tglx>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Lee Jones <lee@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Naveen N Rao <naveen@kernel.org>,
 linux-sh@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Linus Walleij <linus.walleij@linaro.org>, Eddie James <eajames@linux.ibm.com>,
 x86@kernel.org, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Guo Ren <guoren@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Janne Grunau <j@jannau.net>,
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
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-doc@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Daniel Palmer <daniel@thingy.jp>,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Peter Rosin <peda@axentia.se>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Miodrag Dinic <miodrag.dinic@mips.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 Marek =?utf-8?Q?Beh=C3=BAn?= <kabel@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Fabio Estevam <festevam@gmail.com>,
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
 Christian =?utf-8?Q?K?= =?utf-8?Q?=C3=B6nig?= <christian.koenig@amd.com>,
 Dinh Nguyen <dinguyen@kernel.org>, James Morse <james.morse@arm.com>,
 Corentin Chary <corentin.chary@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Herve Codina <herve.codina@bootlin.com>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 platform-driver-x86@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 Toan Le <toan@os.amperecomputing.com>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>,
 Doug Berger <opendmb@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 "Luke D. Jones" <luke@ljones.dev>, amd-gfx@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Andreas Kemnade <andreas@kemnade.info>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>,
 Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-edac@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>, Robert Richter <rric@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Ray Jui <rjui@broadcom.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Michael Buesch <m@bues.ch>, John Crispin <john@phrozen.org>,
 Takashi Iwai <tiwai@suse.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Talel Shenhar <talel@amazon.com>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
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
 David Airlie <airlied@gmail.com>, WANG Xuerui <kernel@xen0n.name>,
 Alex Shi <alexs@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, Ryder Lee <ryder.lee@mediatek.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, maz@kernel.org,
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
 Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
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
 Philipp Zabel <p.zabel@pengutronix.de>, Anup Patel <anup@brainfault.org>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, Mar 19 2025 at 10:28, Jiri Slaby wrote:

> Hi,
>
> tl;dr if patches are agreed upon, I ask subsys maintainers to take the
> respective ones via their trees (as they are split per subsys), so that
> the IRQ tree can take only the rest. That would minimize churn/conflicts
> during merges.

So. It's rc5 by now and I picked up everything which did not show up in
next yet. As there are some patches in next, I delayed the removal of
functions for the merge window so that we don't end up with merge
dependencies.

To reducde conflicts, I grabbed the irq branch from the PCI tree under
the assumption that this branch is stable.

The series sits now in

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/cleanups

and will be in next soon. If there are duplicates showing up in next,
I'm going to remove them from my branch, so the branch is not for basing
development on.

@Jiri, I fixed up all your subject prefixes as

  'irqdomain: subsys: Switch to foo()'

does not make any sense at all. These subsystems have their regular
prefixes and these changes do not justify made up irqdomain special
prefixes at all.

Thanks,

        tglx
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
