Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D331A6A98B
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Mar 2025 16:19:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE0A9C78F64;
	Thu, 20 Mar 2025 15:18:59 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94494C78F60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Mar 2025 15:18:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C2C2BA494D3;
 Thu, 20 Mar 2025 15:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A232C4CEDD;
 Thu, 20 Mar 2025 15:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742483936;
 bh=1Z6H2iLvH3rXMt19HL+9taZFJeo/GqQ1pEgfLHm/VO8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jtAZa04NkVALEmArILtqhgvGWzNrqybg3hrSGdZZ2VVAFhkXh1nT4jpUcZ4Kc2DDn
 0A6i4ERYcuiCeprXqYIMy4u4kiFrkwJYEeYsWv+53EA4mBSJ6BqBYD7yzk5jl0BW7F
 3K+uSeS65G8FFh9VmSyWsSaODa9u59R3cNyzrD/bWKcMoby2y3/LjyBnzNkYD+iJSL
 9QHQkLG/EQ0PXCuzUmTG72RV9mKDT4ZRjt1NiAC6yuM4pg17khef1prwdyUg+6q41R
 XwbECsZNkZ4re5+LVruYEIZ107+IH+Jq6zDSLtPqFFjlA4zbkDNY4cbCQwK98Zoq0c
 4mfWfzYas3b3w==
From: Mark Brown <broonie@kernel.org>
To: tglx@linutronix.de, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
Message-Id: <174248389026.68765.4225899402848645156.b4-ty@kernel.org>
Date: Thu, 20 Mar 2025 15:18:10 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-1b0d6
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
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-doc@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Daniel Palmer <daniel@thingy.jp>,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Peter Rosin <peda@axentia.se>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Miodrag Dinic <miodrag.dinic@mips.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
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
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dinh Nguyen <dinguyen@kernel.org>, James Morse <james.morse@arm.com>,
 Corentin Chary <corentin.chary@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
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
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-edac@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>, Robert Richter <rric@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Ray Jui <rjui@broadcom.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Borislav Petkov <bp@alien8.de>, Michael Buesch <m@bues.ch>,
 John Crispin <john@phrozen.org>, Takashi Iwai <tiwai@suse.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Talel Shenhar <talel@amazon.com>,
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
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
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
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
Subject: Re: [Linux-stm32] (subset) [PATCH v2 00/57] irqdomain: Cleanups and
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

On Wed, 19 Mar 2025 10:28:53 +0100, Jiri Slaby (SUSE) wrote:
> tl;dr if patches are agreed upon, I ask subsys maintainers to take the
> respective ones via their trees (as they are split per subsys), so that
> the IRQ tree can take only the rest. That would minimize churn/conflicts
> during merges.
> 
> ===
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[35/57] irqdomain: sound: Switch to irq_domain_create_linear()
        commit: 83eddf0116b09186f909bc643f2093f266f204ea

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
