Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D20374BB941
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Feb 2022 13:38:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89F4EC6046A;
	Fri, 18 Feb 2022 12:38:22 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 264ECC5F1FA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Feb 2022 12:38:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4C2AFB825FD;
 Fri, 18 Feb 2022 12:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38114C340E9;
 Fri, 18 Feb 2022 12:37:52 +0000 (UTC)
Message-ID: <c70113dc-d017-b5bc-1466-02530f4707e2@xs4all.nl>
Date: Fri, 18 Feb 2022 13:37:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Mark Brown <broonie@kernel.org>
References: <20220123175201.34839-1-u.kleine-koenig@pengutronix.de>
 <20220123175201.34839-6-u.kleine-koenig@pengutronix.de>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220123175201.34839-6-u.kleine-koenig@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Gwendal Grignou <gwendal@chromium.org>,
 Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>, Claudius Heine <ch@denx.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Nanyong Sun <sunnanyong@huawei.com>, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, Pavel Machek <pavel@ucw.cz>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Christian Lamparter <chunkeey@googlemail.com>,
 Ajay Singh <ajay.kathat@microchip.com>, linux-clk@vger.kernel.org,
 Stefan Schmidt <stefan@datenfreihafen.org>, Sidong Yang <realwakka@gmail.com>,
 libertas-dev@lists.infradead.org, linux-omap@vger.kernel.org,
 Antti Palosaari <crope@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>, linux-serial@vger.kernel.org,
 =?UTF-8?Q?=c5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
 James Schulman <james.schulman@cirrus.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, Zhang Qilong <zhangqilong3@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Michael Walle <michael@walle.cc>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mtd@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, Vladimir Oltean <olteanv@gmail.com>,
 linux-wpan@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dan Robertson <dan@dlrobertson.com>, Markuss Broks <markuss.broks@gmail.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, David Airlie <airlied@linux.ie>,
 linux-wireless@vger.kernel.org, Marco Felsch <m.felsch@pengutronix.de>,
 David Rhodes <david.rhodes@cirrus.com>,
 Thierry Reding <thierry.reding@gmail.com>, Solomon Peachy <pizza@shaftnet.org>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Jiri Slaby <jirislaby@kernel.org>, Helge Deller <deller@gmx.de>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, Jon Hunter <jonathanh@nvidia.com>,
 dingsenjie <dingsenjie@yulong.com>, Heiko Schocher <hs@denx.de>,
 Wolfgang Grandegger <wg@grandegger.com>, Matt Kline <matt@bitbashing.io>,
 Woojung Huh <woojung.huh@microchip.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Mike Looijmans <mike.looijmans@topic.nl>,
 =?UTF-8?Q?Ronald_Tschal=c3=a4r?= <ronald@innovation.ch>,
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
 alsa-devel@alsa-project.org, =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
 netdev@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
 linux-rtc@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Aditya Srivastava <yashsri421@gmail.com>,
 Varka Bhadram <varkabhadram@gmail.com>, wengjianfeng <wengjianfeng@yulong.com>,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Mark Greer <mgreer@animalcreek.com>, Mark Gross <markgross@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-fbdev@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>,
 =?UTF-8?Q?Stefan_M=c3=a4tje?= <stefan.maetje@esd.eu>,
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

T24gMjMvMDEvMjAyMiAxODo1MiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gVGhlIHZhbHVl
IHJldHVybmVkIGJ5IGFuIHNwaSBkcml2ZXIncyByZW1vdmUgZnVuY3Rpb24gaXMgbW9zdGx5IGln
bm9yZWQuCj4gKE9ubHkgYW4gZXJyb3IgbWVzc2FnZSBpcyBwcmludGVkIGlmIHRoZSB2YWx1ZSBp
cyBub24temVybyB0aGF0IHRoZQo+IGVycm9yIGlzIGlnbm9yZWQuKQo+IAo+IFNvIGNoYW5nZSB0
aGUgcHJvdG90eXBlIG9mIHRoZSByZW1vdmUgZnVuY3Rpb24gdG8gcmV0dXJuIG5vIHZhbHVlLiBU
aGlzCj4gd2F5IGRyaXZlciBhdXRob3JzIGFyZSBub3QgdGVtcHRlZCB0byBhc3N1bWUgdGhhdCBw
YXNzaW5nIGFuIGVycm9yIHRvCj4gdGhlIHVwcGVyIGxheWVyIGlzIGEgZ29vZCBpZGVhLiBBbGwg
ZHJpdmVycyBhcmUgYWRhcHRlZCBhY2NvcmRpbmdseS4KPiBUaGVyZSBpcyBubyBpbnRlbmRlZCBj
aGFuZ2Ugb2YgYmVoYXZpb3VyLCBhbGwgY2FsbGJhY2tzIHdlcmUgcHJlcGFyZWQgdG8KPiByZXR1
cm4gMCBiZWZvcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KPiAtLS0KPiAgZHJpdmVycy9idXMvbW94dGV0LmMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0tCj4gIGRyaXZlcnMvY2hh
ci90cG0vc3QzM3pwMjQvc3BpLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tLQo+ICBk
cml2ZXJzL2NoYXIvdHBtL3RwbV90aXNfc3BpX21haW4uYyAgICAgICAgICAgICAgICAgICB8ICAz
ICstLQo+ICBkcml2ZXJzL2Nsay9jbGstbG1rMDQ4MzIuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9ncGlvL2dwaW8tNzR4MTY0LmMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgNCArLS0tCj4gIGRyaXZlcnMvZ3Bpby9ncGlvLW1heDMxOTF4LmMg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tLQo+ICBkcml2ZXJzL2dwaW8vZ3Bpby1t
YXg3MzAxLmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9n
cGlvL2dwaW8tbWMzMzg4MC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0tCj4g
IGRyaXZlcnMvZ3Bpby9ncGlvLXBpc29zci5jICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDQgKy0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtYWJ0LXkwMzB4eDA2N2EuYyAg
ICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWlsaXRlay1p
bGk5MzIyLmMgICAgICAgICAgfCAgNCArLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1pbGl0ZWstaWxpOTM0MS5jICAgICAgICAgIHwgIDMgKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1pbm5vbHV4LWVqMDMwbmEuYyAgICAgICAgIHwgIDQgKy0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtbGctbGIwMzVxMDIuYyAgICAgICAgICAgICB8ICA0ICstLS0K
PiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWxnLWxnNDU3My5jICAgICAgICAgICAgICAg
fCAgNCArLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1uZWMtbmw4MDQ4aGwxMS5j
ICAgICAgICAgIHwgIDQgKy0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbm92YXRl
ay1udDM5MDE2LmMgICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLXNhbXN1bmctZGI3NDMwLmMgICAgICAgICAgfCAgMyArLS0KPiAgZHJpdmVycy9ncHUvZHJt
L3BhbmVsL3BhbmVsLXNhbXN1bmctbGQ5MDQwLmMgICAgICAgICAgfCAgNCArLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZDI3YTEuYyAgICAgICAgIHwgIDMgKy0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTYzbTAtc3BpLmMgICAg
IHwgIDMgKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaXRyb25peC1zdDc3ODl2
LmMgICAgICAgIHwgIDQgKy0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc29ueS1h
Y3g1NjVha20uYyAgICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLXRwby10ZDAyOHR0ZWMxLmMgICAgICAgICAgfCAgNCArLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC10cG8tdGQwNDNtdGVhMS5jICAgICAgICAgIHwgIDQgKy0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRwZzExMC5jICAgICAgICAgICAgICB8ICAzICst
LQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtd2lkZWNoaXBzLXdzMjQwMS5jICAgICAg
ICB8ICAzICstLQo+ICBkcml2ZXJzL2dwdS9kcm0vdGlueS9oeDgzNTdkLmMgICAgICAgICAgICAg
ICAgICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9ncHUvZHJtL3RpbnkvaWxpOTE2My5jICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS90aW55L2ls
aTkyMjUuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vdGlueS9pbGk5MzQxLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgZHJp
dmVycy9ncHUvZHJtL3RpbnkvaWxpOTQ4Ni5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCAr
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS90aW55L21pMDI4M3F0LmMgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDQgKy0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdGlueS9yZXBhcGVyLmMgICAgICAgICAg
ICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9ncHUvZHJtL3Rpbnkvc3Q3NTg2LmMg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS90aW55
L3N0NzczNXIuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tLQo+ICBkcml2ZXJzL2h3
bW9uL2FkY3h4LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAg
ZHJpdmVycy9od21vbi9hZHQ3MzEwLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MyArLS0KPiAgZHJpdmVycy9od21vbi9tYXgxMTExLmMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMyArLS0KPiAgZHJpdmVycy9od21vbi9tYXgzMTcyMi5jICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgNCArLS0tCj4gIGRyaXZlcnMvaWlvL2FjY2VsL2JtYTQwMF9zcGku
YyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tLQo+ICBkcml2ZXJzL2lpby9hY2NlbC9i
bWMxNTAtYWNjZWwtc3BpLmMgICAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9p
aW8vYWNjZWwvYm1pMDg4LWFjY2VsLXNwaS5jICAgICAgICAgICAgICAgICAgfCAgNCArLS0tCj4g
IGRyaXZlcnMvaWlvL2FjY2VsL2t4c2Q5LXNwaS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDQgKy0tLQo+ICBkcml2ZXJzL2lpby9hY2NlbC9tbWE3NDU1X3NwaS5jICAgICAgICAgICAgICAg
ICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9paW8vYWNjZWwvc2NhMzAwMC5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgNCArLS0tCj4gIGRyaXZlcnMvaWlvL2FkYy9hZDcyNjYuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tLQo+ICBkcml2ZXJzL2lpby9hZGMv
bHRjMjQ5Ni5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVy
cy9paW8vYWRjL21jcDMyMHguYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0t
Cj4gIGRyaXZlcnMvaWlvL2FkYy9tY3AzOTExLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDQgKy0tLQo+ICBkcml2ZXJzL2lpby9hZGMvdGktYWRjMTIxMzguYyAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9paW8vYWRjL3RpLWFkczc5NTAuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0tCj4gIGRyaXZlcnMvaWlvL2FkYy90aS1hZHM4
Njg4LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tLQo+ICBkcml2ZXJzL2lpby9h
ZGMvdGktdGxjNDU0MS5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgZHJp
dmVycy9paW8vYW1wbGlmaWVycy9hZDgzNjYuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgNCAr
LS0tCj4gIGRyaXZlcnMvaWlvL2NvbW1vbi9zc3Bfc2Vuc29ycy9zc3BfZGV2LmMgICAgICAgICAg
ICAgIHwgIDQgKy0tLQo+ICBkcml2ZXJzL2lpby9kYWMvYWQ1MzYwLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9paW8vZGFjL2FkNTM4MC5jICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0tCj4gIGRyaXZlcnMvaWlvL2RhYy9hZDU0
NDYuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tLQo+ICBkcml2ZXJzL2lp
by9kYWMvYWQ1NDQ5LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAg
ZHJpdmVycy9paW8vZGFjL2FkNTUwNC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
NCArLS0tCj4gIGRyaXZlcnMvaWlvL2RhYy9hZDU1OTJyLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDQgKy0tLQo+ICBkcml2ZXJzL2lpby9kYWMvYWQ1NjI0cl9zcGkuYyAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9paW8vZGFjL2FkNTY4Ni1zcGku
YyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0tCj4gIGRyaXZlcnMvaWlvL2RhYy9h
ZDU3NjEuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tLQo+ICBkcml2ZXJz
L2lpby9kYWMvYWQ1NzY0LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLS0K
PiAgZHJpdmVycy9paW8vZGFjL2FkNTc5MS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgNCArLS0tCj4gIGRyaXZlcnMvaWlvL2RhYy9hZDg4MDEuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDQgKy0tLQo+ICBkcml2ZXJzL2lpby9kYWMvbHRjMTY2MC5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9paW8vZGFjL2x0YzI2MzIu
YyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0tCj4gIGRyaXZlcnMvaWlvL2Rh
Yy9tY3A0OTIyLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tLQo+ICBkcml2
ZXJzL2lpby9kYWMvdGktZGFjMDgyczA4NS5jICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICst
LS0KPiAgZHJpdmVycy9paW8vZGFjL3RpLWRhYzczMTEuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMyArLS0KPiAgZHJpdmVycy9paW8vZnJlcXVlbmN5L2FkZjQzNTAuYyAgICAgICAgICAg
ICAgICAgICAgICAgfCAgNCArLS0tCj4gIGRyaXZlcnMvaWlvL2d5cm8vYm1nMTYwX3NwaS5jICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tLQo+ICBkcml2ZXJzL2lpby9neXJvL2Z4YXMy
MTAwMmNfc3BpLmMgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9paW8v
aGVhbHRoL2FmZTQ0MDMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0tCj4gIGRy
aXZlcnMvaWlvL21hZ25ldG9tZXRlci9ibWMxNTBfbWFnbl9zcGkuYyAgICAgICAgICAgIHwgIDQg
Ky0tLQo+ICBkcml2ZXJzL2lpby9tYWduZXRvbWV0ZXIvaG1jNTg0M19zcGkuYyAgICAgICAgICAg
ICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9paW8vcG90ZW50aW9tZXRlci9tYXg1NDg3LmMgICAg
ICAgICAgICAgICAgICAgfCAgNCArLS0tCj4gIGRyaXZlcnMvaWlvL3ByZXNzdXJlL21zNTYxMV9z
cGkuYyAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tLQo+ICBkcml2ZXJzL2lpby9wcmVzc3Vy
ZS96cGEyMzI2X3NwaS5jICAgICAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9p
bnB1dC9rZXlib2FyZC9hcHBsZXNwaS5jICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0tCj4g
IGRyaXZlcnMvaW5wdXQvbWlzYy9hZHhsMzR4LXNwaS5jICAgICAgICAgICAgICAgICAgICAgIHwg
IDQgKy0tLQo+ICBkcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL2Fkczc4NDYuYyAgICAgICAgICAg
ICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9jeXR0c3A0X3Nw
aS5jICAgICAgICAgICAgICAgfCAgNCArLS0tCj4gIGRyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4v
dHNjMjAwNS5jICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tLQo+ICBkcml2ZXJzL2xlZHMvbGVk
cy1jcjAwMTQxMTQuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVy
cy9sZWRzL2xlZHMtZGFjMTI0czA4NS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0t
Cj4gIGRyaXZlcnMvbGVkcy9sZWRzLWVsMTUyMDMwMDAuYyAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDQgKy0tLQo+ICBkcml2ZXJzL2xlZHMvbGVkcy1zcGktYnl0ZS5jICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9tZWRpYS9zcGkvY3hkMjg4MC1zcGkuYyAg
ICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0tCj4gIGRyaXZlcnMvbWVkaWEvc3BpL2dzMTY2
Mi5jICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tLQo+ICBkcml2ZXJzL21lZGlh
L3R1bmVycy9tc2kwMDEuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzICstLQoKQSBiaXQg
bGF0ZSwgYnV0IGZvciBkcml2ZXJzL21lZGlhOgoKQWNrZWQtYnk6IEhhbnMgVmVya3VpbCA8aHZl
cmt1aWwtY2lzY29AeHM0YWxsLm5sPgoKVGhhbmtzIQoKCUhhbnMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
