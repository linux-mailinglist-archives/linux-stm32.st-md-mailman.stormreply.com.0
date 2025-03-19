Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFE4A68961
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Mar 2025 11:22:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F7DFC78F60;
	Wed, 19 Mar 2025 10:22:32 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBA1CC7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Mar 2025 10:22:30 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-ac2c663a3daso648211966b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Mar 2025 03:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742379750; x=1742984550;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YAciZfuoMKuWSR7eQBgdr98ucgp4qUAEyHPTl4MU2Sc=;
 b=DwL/DVR2nj/+tQtQU7zdWoA2Wto3AHPQ1FCc4tpmS/6IxcnjR2l//MnBCHVSZb2C0W
 yb5qY7AM6Tjlah6zaUo0epGbeDH8zMYdT2DCMfg5Pm8AF6CmfeFdDrVG/q2pyER4OmpH
 rhSKvQHdXZcBtp/6v51ap70VtFJ2CeC33zCNj2C6RsV9i93VHyPO9nGQt6OD7wjbOwGh
 fWn36vXx+1k3PILozw8afmiLb/+8tJIhhLZHUbTSSA+6overlqmr1V29MqJW0upwo7c6
 k4wBvJfWf2PRZRdONJUQqRt/XTJWH4QFaIsUibHjlOWIa7LUpZwbN71rOUzTSjgImARj
 kKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742379750; x=1742984550;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YAciZfuoMKuWSR7eQBgdr98ucgp4qUAEyHPTl4MU2Sc=;
 b=laOXZdjgzhinyj95j1FmRrVjteQn3orkLP3miaH30dXzWnVHEafocicZmluAxqQNIl
 EB9HxNTmYyP56p2XuwY27OR/OotRVtXSpmtrA760kRi0XMILDCTWpVww7Qj9XxSVQRJ+
 p0VYUmHpsCUDlUo83r7t6FZVVU4cF7QPXj5nFy+sk/mXNcaZ5T9Q1eKFrthoErAwL0ex
 OQyhO8wfva9EjmmV3LY4vsW7EH1TomzhL3qy8HgXvB02crrln7yrczrJl4b9QDYAh3nM
 vb5cHADgFdXZVqSieRm12k2TOZf25JQaVi+ILrUq7c3XEkzKB8c837oI5QAZgqfghTUB
 wTnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjOmkgHVLmR1+AkHjXzHXmYPeB/BBBEdLveuGqPz+hcp0pWOSSQy1PzLkcRxTC9Kt0tz6K0XiaDB8xYw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz1kv6wluBYvkjvn429EGuUnMpncYsFAEHtnVXVVaQgSlFiQHx7
 D2+NtVlFLw0I6b397jEGlmJAphi8enmNLvS2x8hj+RGkA42tyob5768tMa0SU9u01ntqC8nliUX
 2BcLTiHL+JjfuFefybAANzMtLzFc=
X-Gm-Gg: ASbGncuZYMeSII3SC8B/4ZoEqnBofyEXyVa5R6QwzXJFJVU3OeYVyOFymlnAeEeAfZC
 xhWUyCIuEdHIcvQa3IIg/+OEvW2OkTHWQLKVgav7C4T5cSeXc3ExwCoRXL2D7gaAZpUJj0Z7RbC
 TuMCrm/q7EfteGXhZwx/0EVkqXLdu9
X-Google-Smtp-Source: AGHT+IFUke584GUxH6BvQB3fX7lUAUv9QcZ9e9muiwjx2XhCfAyl6Rwt1VC/I5GgI047etAZIOOFi7pICkkhLIq8oi8=
X-Received: by 2002:a17:906:f59f:b0:ac3:97f4:9c08 with SMTP id
 a640c23a62f3a-ac3b7de1176mr194902266b.31.1742379749621; Wed, 19 Mar 2025
 03:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250319092951.37667-1-jirislaby@kernel.org>
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Mar 2025 12:21:53 +0200
X-Gm-Features: AQ5f1JplWeGobilHQOGjnSRx3FqTIg2f9LEWqzrz_L_kygQImpD-DssVqoDvovg
Message-ID: <CAHp75VfJPgaGyERBaSxSGap+Daeuy8kOjyjg+QkCtzxUydzHiQ@mail.gmail.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
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
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, tglx@linutronix.de,
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
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>,
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
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gV2VkLCBNYXIgMTksIDIwMjUgYXQgMTE6MzDigK9BTSBKaXJpIFNsYWJ5IChTVVNFKSA8amly
aXNsYWJ5QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGksCj4KPiB0bDtkciBpZiBwYXRjaGVzIGFy
ZSBhZ3JlZWQgdXBvbiwgSSBhc2sgc3Vic3lzIG1haW50YWluZXJzIHRvIHRha2UgdGhlCj4gcmVz
cGVjdGl2ZSBvbmVzIHZpYSB0aGVpciB0cmVlcyAoYXMgdGhleSBhcmUgc3BsaXQgcGVyIHN1YnN5
cyksIHNvIHRoYXQKPiB0aGUgSVJRIHRyZWUgY2FuIHRha2Ugb25seSB0aGUgcmVzdC4gVGhhdCB3
b3VsZCBtaW5pbWl6ZSBjaHVybi9jb25mbGljdHMKPiBkdXJpbmcgbWVyZ2VzLgo+Cj4gPT09Cj4K
PiBXaGlsZSBJIHdhcyByZWFkaW5nIHRocm91Z2ggdGhlIGlycWRvbWFpbiBjb2RlIGFuZCBoZWFk
ZXJzLCBJIGZvdW5kIHNvbWUKPiBuYW1pbmcgYW5kIGRvY3VtZW50YXRpb24gaGFyZCB0byBmb2xs
b3cgb3IgaW5jb21wbGV0ZS4gRXNwZWNpYWxseSB0aGUKPiBuYW1pbmcgb2YgX2FkZC9fY3JlYXRl
L19pbnN0YW50aWF0ZSBmdW5jdGlvbnMuCj4KPiBJIHRyaWVkIHRvIGNvbWUgdXAgd2l0aCBhIGJl
dHRlciBzdGF0ZSB3aXRoIHRoaXMgcGF0Y2hzZXQ6Cj4gKiBvbmx5IGlycSBfZG9tYWluXyAobm90
IGhvc3QpLAo+ICogb25seSBpcnFfZG9tYWluX2NyZWF0ZSooKSBmdW5jdGlvbnMsIGFsbCB0YWtp
bmcgZndub2RlIHVuaWZvcm1seSwKPgo+IEZpbmFsbHksIGFsbCB0aGUgaXJxZG9tYWluIHN0dWZm
IGlzIG5vdyBwbHVnZ2VkIChhbmQgZ2VuZXJhdGVkKSBpbnRvCj4gRG9jdW1lbnRhdGlvbi4gU28g
dGhhdCBldmVyeW9uZSBjYW4gd2FsayB0aHJvdWdoIGl0IGF0Cj4gaHR0cHM6Ly93d3cua2VybmVs
Lm9yZy9kb2MvIChvbmNlIGFwcGxpZWQsIG9mIGNvdXJzZSkuCgpJIGFtIGFsbCB0byBzdXBwb3J0
IHRoZSBpZGVhLCBidXQgaW4gc29tZSBjYXNlcyBJIHdvdWxkIHRoaW5rIG9mIGEgYml0Cm1vcmUg
d29yayB0byBiZSBkb25lIHRvIGdldCByaWQgb2YgdGhlIG9mX2Z3bm9kZV9oYW5kbGUobnApIGlu
IGZhdm91cgpvZiBkZXZfZndub2RlKGRldikuIE5vdGUsIHRoaXMgaXMgYmFzZWQgb24gYSBicmll
ZiBsb29rLCBJIGhhdmVuJ3QgYW55CmV4YW1wbGUgYXQgaGFuZCByaWdodCBub3cuCgotLSAKV2l0
aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
