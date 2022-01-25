Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 197BB49B130
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jan 2022 11:20:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9C89C5F1D5;
	Tue, 25 Jan 2022 10:20:08 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46695C5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jan 2022 10:20:07 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DC28B2000C;
 Tue, 25 Jan 2022 10:19:29 +0000 (UTC)
Date: Tue, 25 Jan 2022 11:19:28 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20220125111928.781d0bb3@xps13>
In-Reply-To: <20220123175201.34839-6-u.kleine-koenig@pengutronix.de>
References: <20220123175201.34839-1-u.kleine-koenig@pengutronix.de>
 <20220123175201.34839-6-u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Gwendal Grignou <gwendal@chromium.org>,
 Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>, Claudius Heine <ch@denx.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Nanyong Sun <sunnanyong@huawei.com>, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, Pavel Machek <pavel@ucw.cz>,
 Matt Kline <matt@bitbashing.io>, Christian Lamparter <chunkeey@googlemail.com>,
 Ajay Singh <ajay.kathat@microchip.com>, linux-clk@vger.kernel.org,
 Stefan Schmidt <stefan@datenfreihafen.org>, Sidong Yang <realwakka@gmail.com>,
 libertas-dev@lists.infradead.org, linux-omap@vger.kernel.org,
 Antti Palosaari <crope@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>, linux-serial@vger.kernel.org,
 =?UTF-8?B?xYF1?= =?UTF-8?B?a2Fzeg==?= Stelmach <l.stelmach@samsung.com>,
 Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
 James Schulman <james.schulman@cirrus.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, Zhang Qilong <zhangqilong3@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Michael Walle <michael@walle.cc>,
 Noralf =?UTF-8?B?VHLDuG5uZXM=?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mtd@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, Vladimir Oltean <olteanv@gmail.com>,
 linux-wpan@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dan Robertson <dan@dlrobertson.com>, Markuss Broks <markuss.broks@gmail.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, David Airlie <airlied@linux.ie>,
 linux-wireless@vger.kernel.org, Marco Felsch <m.felsch@pengutronix.de>,
 David Rhodes <david.rhodes@cirrus.com>,
 Thierry Reding <thierry.reding@gmail.com>, Solomon Peachy <pizza@shaftnet.org>,
 Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Jiri Slaby <jirislaby@kernel.org>, Helge Deller <deller@gmx.de>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, Jon Hunter <jonathanh@nvidia.com>,
 dingsenjie <dingsenjie@yulong.com>, Heiko Schocher <hs@denx.de>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 Woojung Huh <woojung.huh@microchip.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Mike Looijmans <mike.looijmans@topic.nl>,
 Ronald =?UTF-8?B?VHNjaGFsw6Ry?= <ronald@innovation.ch>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Hans de Goede <hdegoede@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
 Davidlohr Bueso <dbueso@suse.de>, UNGLinuxDriver@microchip.com,
 Jarkko Sakkinen <jarkko@kernel.org>, linux-usb@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-integrity@vger.kernel.org,
 Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-staging@lists.linux.dev,
 linux-iio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 netdev@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jerome.pouiller@silabs.com>,
 linux-rtc@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Aditya Srivastava <yashsri421@gmail.com>,
 Varka Bhadram <varkabhadram@gmail.com>, wengjianfeng <wengjianfeng@yulong.com>,
 linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>,
 Mark Greer <mgreer@animalcreek.com>, Mark Gross <markgross@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-fbdev@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benson Leung <bleung@chromium.org>,
 Stefan =?UTF-8?B?TcOkdGpl?= <stefan.maetje@esd.eu>,
 linux-hwmon@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
 Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Julia Lawall <Julia.Lawall@inria.fr>,
 Yang Li <yang.lee@linux.alibaba.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 patches@opensource.cirrus.com, Kent Gustavsson <kent@minoris.se>,
 "David S. Miller" <davem@davemloft.net>,
 Charles-Antoine Couret <charles-antoine.couret@nexvision.fr>,
 Alexander Aring <alex.aring@gmail.com>, Jiri Prchal <jiri.prchal@aksignal.cz>,
 Vignesh Raghavendra <vigneshr@ti.com>, Emma Anholt <emma@anholt.net>,
 Peter Zijlstra <peterz@infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexandru Ardelean <ardeleanalex@gmail.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>, Peter Huewe <peterhuewe@gmx.de>,
 Torin Cooper-Bennun <torin@maxiluxsystems.com>,
 Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
 Eric Piel <eric.piel@tremplin-utc.net>, Stephan Gerhold <stephan@gerhold.net>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, Thomas Kopp <thomas.kopp@microchip.com>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 platform-driver-x86@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>,
 Xue Liu <liuxuenetmail@gmail.com>, David Lechner <david@lechnology.com>,
 Will Deacon <will@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Kalle Valo <kvalo@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Harry Morris <h.morris@cascoda.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
 Alessandro Zummo <a.zummo@towertech.it>, Yang Shen <shenyang39@huawei.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Takashi Iwai <tiwai@suse.com>,
 Cai Huoqing <caihuoqing@baidu.com>, Daniel Mack <daniel@zonque.org>,
 Daniel Vetter <daniel@ffwll.ch>, Colin Ian King <colin.king@intel.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Alan Ott <alan@signal11.us>
Subject: Re: [Linux-stm32] [PATCH 5/5] spi: make remove callback a void
	function
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

SGkgVXdlLAoKdS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlIHdyb3RlIG9uIFN1biwgMjMg
SmFuIDIwMjIgMTg6NTI6MDEgKzAxMDA6Cgo+IFRoZSB2YWx1ZSByZXR1cm5lZCBieSBhbiBzcGkg
ZHJpdmVyJ3MgcmVtb3ZlIGZ1bmN0aW9uIGlzIG1vc3RseSBpZ25vcmVkLgo+IChPbmx5IGFuIGVy
cm9yIG1lc3NhZ2UgaXMgcHJpbnRlZCBpZiB0aGUgdmFsdWUgaXMgbm9uLXplcm8gdGhhdCB0aGUK
PiBlcnJvciBpcyBpZ25vcmVkLikKPiAKPiBTbyBjaGFuZ2UgdGhlIHByb3RvdHlwZSBvZiB0aGUg
cmVtb3ZlIGZ1bmN0aW9uIHRvIHJldHVybiBubyB2YWx1ZS4gVGhpcwo+IHdheSBkcml2ZXIgYXV0
aG9ycyBhcmUgbm90IHRlbXB0ZWQgdG8gYXNzdW1lIHRoYXQgcGFzc2luZyBhbiBlcnJvciB0bwo+
IHRoZSB1cHBlciBsYXllciBpcyBhIGdvb2QgaWRlYS4gQWxsIGRyaXZlcnMgYXJlIGFkYXB0ZWQg
YWNjb3JkaW5nbHkuCj4gVGhlcmUgaXMgbm8gaW50ZW5kZWQgY2hhbmdlIG9mIGJlaGF2aW91ciwg
YWxsIGNhbGxiYWNrcyB3ZXJlIHByZXBhcmVkIHRvCj4gcmV0dXJuIDAgYmVmb3JlLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9u
aXguZGU+Cj4gLS0tCgpbLi4uXQoKPiAgZHJpdmVycy9tdGQvZGV2aWNlcy9tY2hwMjNrMjU2LmMg
ICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0tCj4gIGRyaXZlcnMvbXRkL2RldmljZXMvbWNo
cDQ4bDY0MC5jICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tLQo+ICBkcml2ZXJzL210ZC9k
ZXZpY2VzL210ZF9kYXRhZmxhc2guYyAgICAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgZHJp
dmVycy9tdGQvZGV2aWNlcy9zc3QyNWwuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCAr
LS0tCgpGb3IgTVREIGRldmljZXM6CkFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzLApNaXF1w6hsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
