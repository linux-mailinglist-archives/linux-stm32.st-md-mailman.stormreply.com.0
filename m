Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9455603A2
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jun 2022 16:51:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41D4AC5F1EE;
	Wed, 29 Jun 2022 14:51:09 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DE17C04001
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jun 2022 14:51:07 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id p14so10452783ile.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jun 2022 07:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pwGATE3wVInOXzoFm3DL2iTGSvGusyPbH0jPamzrOPg=;
 b=B9oiCLcIrwwsffiAV8BVsVBfXybUkA5/wZMduPrd4uxnlky8stLK2tfDvUXny6iXKr
 JgHfuIg1T4A2bBVpND7mj4ZD6v4EfH9ADxTObhcX6xPh3I7vZ9BQG5yE8imCWk/OhbYC
 y77BYpEagODmPwREXk1EwgFqaosr/xKUAyn8S+8EchzGzV3HtL4IfoKvDu4K5Msq2ALx
 f3dq0MlZFz4EQr6JyLTd/ftNsrK8HspcqE3W8redGkzLH/HNAK9wWORCS20wSfpKl6n9
 0fVin9rSjvVAY9WniBd6EJIncRKM5IK1k+ieCfjqPXFzsZhYgwSjUnYxv8hhRn4qPsQK
 coGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pwGATE3wVInOXzoFm3DL2iTGSvGusyPbH0jPamzrOPg=;
 b=jWAsTfGZz2mwNp+IP4NzTXzp340XSh1ZG1xaPBBJx3/dNm2aFGDdYKCSlb0ogZpEUI
 SyCVElorur7Ruxnaqf6RAj6IoesqK1+n3IBucRsDiuGtqBR+HBwXyn6YujhpgmwyKVHx
 QFVq9G4JnYsHjvHvqPkWtLOrkEHq+LXiUzKe2tAsKK3BdM8Y7dERmTIrjLUeETt21MOH
 cViCAPq/Xf0TKeczc9lNHPHIqjOG5bLw4VcqVGZjzqh2aSJVK/uhByEQZAgayzsC2kQR
 w0b6JjD3VFzgj2QEk5ayo2F0wWinvoJcX2A6bfk/s+XGubwIheZmez+y39JN/CUb4kzO
 B5WA==
X-Gm-Message-State: AJIora9T7DZHaxk8Ja1F2LlDaRFU72BAs3t85aZHjsCLdZOcyLzrXWF5
 Rn3kCAxeoZ9RUR9eJUenFOUGNzoN6BRPBPidbXA=
X-Google-Smtp-Source: AGRyM1siTyQHr7dYH2cCZ2A9wYi3Xsx12U7qGA8A84nAaysz0D1Kg/QCuzQFR25at5Ho6J2u+X/CmeSal2jIei9STV8=
X-Received: by 2002:a05:6e02:168e:b0:2da:a9f0:c1aa with SMTP id
 f14-20020a056e02168e00b002daa9f0c1aamr2147237ila.151.1656514266336; Wed, 29
 Jun 2022 07:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 29 Jun 2022 16:50:55 +0200
Message-ID: <CANiq72nmXBv2z-LzEZe47iL39T2Bjjqr4pJqOCta-JCL4rZ9QA@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Ricardo Ribalda <ribalda@kernel.org>,
 Jimmy Su <jimmy.su@intel.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sekhar Nori <nsekhar@ti.com>,
 Gwendal Grignou <gwendal@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jaroslav Kysela <perex@perex.cz>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Paul Mackerras <paulus@samba.org>,
 Moses Christopher Bollavarapu <mosescb.dev@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Evgeniy Polyakov <zbr@ioremap.net>, Matt Johnston <matt@codeconstruct.com.au>,
 Olli Salonen <olli.salonen@iki.fi>, Angela Czubak <acz@semihalf.com>,
 Robert Marko <robert.marko@sartura.hr>, Luka Perkov <luka.perkov@sartura.hr>,
 Sean Young <sean@mess.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Zheyu Ma <zheyuma97@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Chanwoo Choi <cw00.choi@samsung.com>, linux-omap@vger.kernel.org,
 Antti Palosaari <crope@iki.fi>, Wenyou Yang <wenyou.yang@microchip.com>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>, Miaoqian Lin <linmq006@gmail.com>,
 Steve Longerbeam <slongerbeam@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Shunqian Zheng <zhengsq@rock-chips.com>, lijian <lijian@yulong.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Viorel Suman <viorel.suman@nxp.com>, Petr Machata <petrm@nvidia.com>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Jean Delvare <jdelvare@suse.com>, linux-serial@vger.kernel.org,
 linux-pm@vger.kernel.org, Eddie James <eajames@linux.ibm.com>,
 Riku Voipio <riku.voipio@iki.fi>, James Schulman <james.schulman@cirrus.com>,
 Scott Wood <oss@buserror.net>, Cai Huoqing <cai.huoqing@linux.dev>,
 Jonas Malaco <jonas@protocubo.io>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Haibo Chen <haibo.chen@nxp.com>, Petr Cvek <petrcvekcz@gmail.com>,
 linux-leds@vger.kernel.org, Joe Tessler <jrt@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Andy Shevchenko <andy@kernel.org>,
 Robert Jones <rjones@gateworks.com>,
 George Joseph <george.joseph@fairview5.com>,
 Vincent Knecht <vincent.knecht@mailoo.org>,
 Robin van der Gracht <robin@protonic.nl>, Randy Dunlap <rdunlap@infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Michael Tretter <m.tretter@pengutronix.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Phong LE <ple@baylibre.com>,
 Daniel Beer <daniel.beer@igorinstitute.com>,
 Krzysztof Opasiak <k.opasiak@samsung.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Heungjun Kim <riverful.kim@samsung.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, David Lin <CTLIN0@nuvoton.com>,
 Vladimir Oltean <olteanv@gmail.com>, David Rhodes <david.rhodes@cirrus.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dan Robertson <dan@dlrobertson.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jiri Slaby <jirislaby@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Jon Nettleton <jon.nettleton@gmail.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Sebastian Reichel <sre@kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Martiros Shakhzadyan <vrzh@vrzh.net>, Guenter Roeck <groeck@chromium.org>,
 Matthias Schwarzott <zzam@gentoo.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Eric Dumazet <edumazet@google.com>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 Saranya Gopal <saranya.gopal@intel.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Corey Minyard <minyard@acm.org>, Evgeny Novikov <novikov@ispras.ru>,
 Frank Rowand <frowand.list@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, linux-clk@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Charles Gorand <charles.gorand@effinnov.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Miguel Ojeda <ojeda@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Martin Donnelly <martin.donnelly@ge.com>,
 Woojung Huh <woojung.huh@microchip.com>, Rudolf Marek <r.marek@assembler.cz>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Ido Schimmel <idosch@nvidia.com>, acpi4asus-user@lists.sourceforge.net,
 Simon Trimmer <simont@opensource.cirrus.com>,
 Ricard Wanderlof <ricardw@axis.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jiri Valek - 2N <valek@2n.cz>,
 linux-rpi-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Wayne Chang <waynec@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Sing-Han Chen <singhanc@nvidia.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Hans de Goede <hdegoede@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
 Maslov Dmitry <maslovdmitry@seeed.cc>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Jens Frederich <jfrederich@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Wolfram Sang <wsa@kernel.org>,
 Jarkko Sakkinen <jarkko@kernel.org>, USB list <linux-usb@vger.kernel.org>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, CGEL ZTE <cgel.zte@gmail.com>,
 Colin Leroy <colin@colino.net>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 linux-integrity <linux-integrity@vger.kernel.org>,
 Kevin Tsai <ktsai@capellamicro.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Daniel Palmer <daniel@0x0f.com>, Arec Kao <arec.kao@intel.com>,
 Crt Mori <cmo@melexis.com>, Jose Cazarin <joseespiriki@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 Tom Rix <trix@redhat.com>, Michael Turquette <mturquette@baylibre.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Jan-Simon Moeller <jansimon.moeller@gmx.de>,
 Wei Yongjun <weiyongjun1@huawei.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nikita Travkin <nikita@trvn.ru>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Jasmin Jessich <jasmin@anw.at>,
 Sam Ravnborg <sam@ravnborg.org>, Kevin Cernekee <cernekee@chromium.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-rtc@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Stefan Mavrodiev <stefan@olimex.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Network Development <netdev@vger.kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Xin Ji <xji@analogixsemi.com>,
 Seven Lee <wtli@nuvoton.com>, Matt Ranostay <matt.ranostay@konsulko.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>, chrome-platform@lists.linux.dev,
 Mats Randgaard <matrandg@cisco.com>, Paolo Abeni <pabeni@redhat.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, Joel Stanley <joel@jms.id.au>,
 linux-input <linux-input@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Lyude Paul <lyude@redhat.com>,
 Kees Cook <keescook@chromium.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>,
 Jonas Karlman <jonas@kwiboo.se>, Yang Li <yang.lee@linux.alibaba.com>,
 Tim Harvey <tharvey@gateworks.com>, Jiri Kosina <jikos@kernel.org>,
 Akinobu Mita <akinobu.mita@gmail.com>, Mark Gross <markgross@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 wengjianfeng <wengjianfeng@yulong.com>, Maxime Ripard <maxime@cerno.tech>,
 Sven Peter <sven@svenpeter.dev>, Martin Kepplinger <martink@posteo.de>,
 openipmi-developer@lists.sourceforge.net,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-hwmon@vger.kernel.org,
 Felipe Balbi <balbi@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 Support Opensource <support.opensource@diasemi.com>,
 Alexandru Ardelean <ardeleanalex@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Marc Hulsman <m.hulsman@tudelft.nl>, Corentin Chary <corentin.chary@gmail.com>,
 Stephen Kitt <steve@sk2.org>, Daniel Scally <djrscally@gmail.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Kirill Shilimanov <kirill.shilimanov@huawei.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, patches@opensource.cirrus.com,
 Zheng Yongjun <zhengyongjun3@huawei.com>,
 Alejandro Tafalla <atafalla@dnyon.com>, Peter Rosin <peda@axentia.se>,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 Hector Martin <marcan@marcan.st>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nick Dyer <nick@shmanahar.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tony Lindgren <tony@atomide.com>, Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>,
 George McCollister <george.mccollister@gmail.com>,
 Mac Chiang <mac.chiang@intel.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Alexander Potapenko <glider@google.com>, linux-staging@lists.linux.dev,
 Adam Ford <aford173@gmail.com>, Peter Huewe <peterhuewe@gmx.de>,
 UNGLinuxDriver@microchip.com, Lee Jones <lee.jones@linaro.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>, Marek Vasut <marex@denx.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Eric Piel <eric.piel@tremplin-utc.net>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Tobias Schrammm <t.schramm@manjaro.org>, Richard Weinberger <richard@nod.at>,
 Tomasz Duszynski <tduszyns@gmail.com>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>,
 linux-pwm@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Thomas Zimmermann <tzimmermann@suse.de>, Bastien Nocera <hadess@hadess.net>,
 Jingoo Han <jingoohan1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>, Yizhuo <yzhai003@ucr.edu>,
 Shawn Tu <shawnx.tu@intel.com>, Leon Luo <leonl@leopardimaging.com>,
 Yan Lei <yan_lei@dahuatech.com>, Akihiro Tsukada <tskd08@gmail.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Dmitry Rokosov <DDRokosov@sberdevices.ru>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Alistair Francis <alistair@alistair23.me>,
 Dongliang Mu <mudongliangabcd@gmail.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Eduardo Valentin <edubezval@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Michael Srba <Michael.Srba@seznam.cz>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 kasan-dev <kasan-dev@googlegroups.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Nicola Lunghi <nick83ola@gmail.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Ramesh Shanmugasundaram <rashanmu@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Juerg Haefliger <juergh@gmail.com>,
 Oder Chiou <oder_chiou@realtek.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 Luca Ceresoli <luca@lucaceresoli.net>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Colin Ian King <colin.king@intel.com>,
 Maximilian Luz <luzmaximilian@gmail.com>, Helge Deller <deller@gmx.de>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH 6/6] i2c: Make remove callback return void
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

T24gVHVlLCBKdW4gMjgsIDIwMjIgYXQgNDowOCBQTSBVd2UgS2xlaW5lLUvDtm5pZwo8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+ICBkcml2ZXJzL2F1eGRpc3BsYXkv
aHQxNmszMy5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICstLS0KPiAgZHJpdmVy
cy9hdXhkaXNwbGF5L2xjZDJzLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMyAr
LS0KCkFja2VkLWJ5OiBNaWd1ZWwgT2plZGEgPG9qZWRhQGtlcm5lbC5vcmc+CgpDaGVlcnMsCk1p
Z3VlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
