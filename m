Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EE94AF42B
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Feb 2022 15:34:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E58CC5E2CC;
	Wed,  9 Feb 2022 14:34:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1DF6C57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Feb 2022 14:34:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 544C861ACF;
 Wed,  9 Feb 2022 14:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A31C340E7;
 Wed,  9 Feb 2022 14:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644417280;
 bh=93WKM7v5/YychVKtJOLIyN7q2nD5WbrrQq2HCEIbMmQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=paJVL2ma/xQI1G5kTxwmnxYV40yVd6zAOk4T3bBsPOR20gskmG8K7ax28vyCSx/cu
 GJ08Q8l0HASluTtO1CMEVwKINoH+YnA6iz+VEIQ7xNOYXef+j5AkR/kJVA/2T7tOk4
 N4eiWAWnLTOnT9YBMgiDXegtl8Ru/BR6+fwYEqwSZZc3PrriaokxTuKZJCkgioNz1b
 drZQFMz9EW2tPiE7O0Etq6wxP5PcE6FcMNn896QR2L8Ozq/NN4jjocf9JoHBXsXxFx
 1Cour/Zh7lN44947sN/Sjpg3SOqFz5rFUTKB1fVUYMhqwEhVGfjancFyovYkIcUfTu
 Fa3sg+IHf/UwA==
From: Mark Brown <broonie@kernel.org>
To: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220123175201.34839-1-u.kleine-koenig@pengutronix.de>
References: <20220123175201.34839-1-u.kleine-koenig@pengutronix.de>
Message-Id: <164441724879.1527840.5788097152300863157.b4-ty@kernel.org>
Date: Wed, 09 Feb 2022 14:34:08 +0000
MIME-Version: 1.0
Cc: , Andrew Lunn <andrew@lunn.ch>,
	Gwendal Grignou <gwendal@chromium.org>,
	Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>,
	Claudius Heine <ch@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Nanyong Sun <sunnanyong@huawei.com>,
	Zhang Qilong <zhangqilong3@huawei.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Pavel Machek <pavel@ucw.cz>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Christian Lamparter <chunkeey@googlemail.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	linux-clk@vger.kernel.org,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Sidong Yang <realwakka@gmail.com>, libertas-dev@lists.infradead.org,
	Benson Leung <bleung@chromium.org>, Antti Palosaari <crope@iki.fi>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Jean Delvare <jdelvare@suse.com>,
	Thomas Kopp <thomas.kopp@microchip.com>,
	x-foundation.org@stm-ict-prod-mailman-01.stormreply.prv,
	Łukasz Stelmach <l.stelmach@samsung.com>,
	Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
	James Schulman <james.schulman@cirrus.com>,
	linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Randy Dunlap <rdunlap@infradead.org>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	Nuno Sá <nuno.sa@analog.com>, Michael Walle <michael@walle.cc>,
	Noralf Trønnes <noralf@tronnes.org>, kernel@pengutronix.de,
	Jingoo Han <jingoohan1@gmail.com>, linux-mtd@lists.infradead.org,
	Vladimir Oltean <olteanv@gmail.com>, linux-wpan@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	alsa-devel@alsa-project.org, Dan Robertson <dan@dlrobertson.com>,
	Jérôme Pouiller <jerome.pouiller@silabs.com>,
	Jiri Slaby <jirislaby@kernel.org>, David Airlie <airlied@linux.ie>,
	Marco Felsch <m.felsch@pengutronix.de>,
	David Rhodes <david.rhodes@cirrus.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Solomon Peachy <pizza@shaftnet.org>, Marek Behún <kabel@kernel.org>,
	Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
	Sam Ravnborg <sam@ravnborg.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Minghao Chi <chi.minghao@zte.com.cn>,
	Jon Hunter <jonathanh@nvidia.com>,
	dingsenjie <dingsenjie@yulong.com>, Heiko Schocher <hs@denx.de>,
	Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
	Woojung Huh <woojung.huh@microchip.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Ronald Tschalär <ronald@innovation.ch>,
	Ajay Singh <ajay.kathat@microchip.com>,
	Maxime Ripard <mripard@kernel.org>, linux-can@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Rui Miguel Silva <rmfrfs@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
	Aditya Srivastava <yashsri421@gmail.com>,
	Torin Cooper-Bennun <torin@maxiluxsystems.com>,
	Jarkko Sakkinen <jarkko@kernel.org>, linux-usb@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-integrity@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-staging@lists.linux.dev,
	linux-iio@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	r.kernel.org@stm-ict-prod-mailman-01.stormreply.prv,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	platform-driver-x86@vger.kernel.org,
	Wei Yongjun <weiyongjun1@huawei.com>,
	Fabio Estevam <festevam@gmail.com>,
	Markuss Broks <markuss.broks@gmail.com>, linux-rtc@vger.kernel.org,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Lucas Tanure <tanureal@opensource.cirrus.com>,
	Guenter Roeck <groeck@google.com>, Davidlohr Bueso <dbueso@suse.de>,
	Varka Bhadram <varkabhadram@gmail.com>,
	wengjianfeng <wengjianfeng@yulong.com>, linux-input@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Jonathan Neuschäfer <j.neuschaefer@gmx.net>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Mark Gross <markgross@kernel.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andrew Morton <akpm@linu.st-md-mailman.stormreply.com>,
	Stefan Mätje <stefan.maetje@esd.eu>, linux-hwmon@vger.kernel.org,
	Felipe Balbi <balbi@kernel.org>,
	Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-mmc@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Guenter Roeck <linux@roeck-us.net>, patches@opensource.cirrus.com,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Kent Gustavsson <kent@minoris.se>, Matt Kline <matt@bitbashing.io>,
	Charles-Antoine Couret <charles-antoine.couret@nexvision.fr>,
	Alexander Aring <alex.aring@gmail.com>,
	Jiri Prchal <jiri.prchal@aksignal.cz>,
	Vignesh Raghavendra <vigneshr@ti.com>, Emma Anholt <emma@anholt.net>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-fbdev@vge.st-md-mailman.stormreply.com,
	Mark Greer <mgreer@animalcreek.com>,
	Alexandru Ardelean <ardeleanalex@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Peter Huewe <peterhuewe@gmx.de>, UNGLinuxDriver@microchip.com,
	Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
	Eric Piel <eric.piel@tremplin-utc.net>,
	Stephan Gerhold <stephan@gerhold.net>,
	Noralf Tronnes <notro@tronnes.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
	linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Xue Liu <liuxuenetmail@gmail.com>,
	David Lechner <david@lechnology.com>, Will Deacon <will@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kalle Valo <kvalo@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Harry Morris <h.morris@cascoda.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Yang Shen <shenyang39@huawei.com>, netdev@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>, Cai Huoqing <caihuoqing@baidu.com>,
	Daniel Mack <daniel@zonque.org>, Daniel Vetter <daniel@ffwll.ch>,
	Colin Ian King <colin.king@intel.com>, Helge Deller <deller@gmx.de>,
	Alan Ott <alan@signal11.us>
Subject: Re: [Linux-stm32] [PATCH 0/5] spi: make remove callback a void
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

T24gU3VuLCAyMyBKYW4gMjAyMiAxODo1MTo1NiArMDEwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6Cj4gdGhpcyBzZXJpZXMgZ29hbCBpcyB0byBjaGFuZ2UgdGhlIHNwaSByZW1vdmUgY2FsbGJh
Y2sncyByZXR1cm4gdmFsdWUgdG8gdm9pZC4KPiBBZnRlciBudW1lcm91cyBwYXRjaGVzIG5lYXJs
eSBhbGwgZHJpdmVycyBhbHJlYWR5IHJldHVybiAwIHVuY29uZGl0aW9uYWxseS4KPiBUaGUgZm91
ciBmaXJzdCBwYXRjaGVzIGluIHRoaXMgc2VyaWVzIGNvbnZlcnQgdGhlIHJlbWFpbmluZyB0aHJl
ZSBkcml2ZXJzIHRvCj4gcmV0dXJuIDAsIHRoZSBmaW5hbCBwYXRjaCBjaGFuZ2VzIHRoZSByZW1v
dmUgcHJvdG90eXBlIGFuZCBjb252ZXJ0cyBhbGwKPiBpbXBsZW1lbnRlcnMuCj4gCj4gVGhlIGRy
aXZlciBjb3JlIGRvZXNuJ3Qgc3VwcG9ydCBlcnJvciBoYW5kbGluZyBvbiByZW1vdmUsIHRoZSBz
cGkgY29yZSBpc3N1ZXMKPiBvbmx5IGEgdmVyeSBnZW5lcmljIHdhcm5pbmcgd2hlbiBhIHJlbW92
ZSBjYWxsYmFjayByZXR1cm5zIGFuIGVycm9yLiBJZiB0aGVyZQo+IGlzIHJlYWxseSB0aGUgbmVl
ZCBmb3IgYSBmdW5jdGlvbiBjYWxsIHRoYXQgY2FuIGZhaWwsIHRoZSBkcml2ZXIgY2FuIGlzc3Vl
IGEKPiBtb3JlIGhlbHBmdWwgZXJyb3IgbWVzc2FnZS4gSSBkaWRuJ3QgZmluZCBhIHNpbmdsZSBk
cml2ZXIgd2hlcmUgcmV0dXJuaW5nCj4gYW4gZXJyb3IgY29kZSBhbmQgZXJyb3IgaGFuZGxpbmcg
aW4gdGhlIHNwaSBjb3JlIHdvdWxkIGhhdmUgYmVlbiBoZWxwZnVsLgo+IAo+IFsuLi5dCgpBcHBs
aWVkIHRvCgogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9icm9vbmllL3NwaS5naXQgZm9yLW5leHQKClRoYW5rcyEKClsxLzVdIHN0YWdpbmc6IGZidGZ0
OiBGaXggZXJyb3IgcGF0aCBpbiBmYnRmdF9kcml2ZXJfbW9kdWxlX2luaXQoKQogICAgICBjb21t
aXQ6IDdkOGU0Yzk4ZDEzYjZiNTQ2NTUxNDBkNmI2YTZhMTdmYmM5YjMyZjEKWzIvNV0gc3RhZ2lu
ZzogZmJ0ZnQ6IERlZHVwbGljYXRlIGRyaXZlciByZWdpc3RyYXRpb24gbWFjcm9zCiAgICAgIGNv
bW1pdDogYzIyMmVhNWQyZjMzNjE0NTg2NzJkMWY1MmM3ODk3MGFhMDIxY2I2MQpbMy81XSB0cG06
IHN0MzN6cDI0OiBNYWtlIHN0MzN6cDI0X3JlbW92ZSgpIGEgdm9pZCBmdW5jdGlvbgogICAgICBj
b21taXQ6IDMxNmY1NjlkZjc2NmRmOWE0OWMzNmMwNTJlYzZhZmFmMTljYjY5MzMKWzQvNV0gcGxh
dGZvcm0vY2hyb21lOiBjcm9zX2VjOiBNYWtlIGNyb3NfZWNfdW5yZWdpc3RlcigpIHJldHVybiB2
b2lkCiAgICAgIGNvbW1pdDogYWZiMGE4MGU2M2Q2N2U5NTdiNWQwZWI0YWRlMzAxYWZmNmUxM2M4
YwpbNS81XSBzcGk6IG1ha2UgcmVtb3ZlIGNhbGxiYWNrIGEgdm9pZCBmdW5jdGlvbgogICAgICBj
b21taXQ6IDJjYmZhMjEyODY2MmM2Yjg0MWY2OGNkMmZlNTRkZjE5OTQ1N2UzOGEKCkFsbCBiZWlu
ZyB3ZWxsIHRoaXMgbWVhbnMgdGhhdCBpdCB3aWxsIGJlIGludGVncmF0ZWQgaW50byB0aGUgbGlu
dXgtbmV4dAp0cmVlICh1c3VhbGx5IHNvbWV0aW1lIGluIHRoZSBuZXh0IDI0IGhvdXJzKSBhbmQg
c2VudCB0byBMaW51cyBkdXJpbmcKdGhlIG5leHQgbWVyZ2Ugd2luZG93IChvciBzb29uZXIgaWYg
aXQgaXMgYSBidWcgZml4KSwgaG93ZXZlciBpZgpwcm9ibGVtcyBhcmUgZGlzY292ZXJlZCB0aGVu
IHRoZSBwYXRjaCBtYXkgYmUgZHJvcHBlZCBvciByZXZlcnRlZC4KCllvdSBtYXkgZ2V0IGZ1cnRo
ZXIgZS1tYWlscyByZXN1bHRpbmcgZnJvbSBhdXRvbWF0ZWQgb3IgbWFudWFsIHRlc3RpbmcKYW5k
IHJldmlldyBvZiB0aGUgdHJlZSwgcGxlYXNlIGVuZ2FnZSB3aXRoIHBlb3BsZSByZXBvcnRpbmcg
cHJvYmxlbXMgYW5kCnNlbmQgZm9sbG93dXAgcGF0Y2hlcyBhZGRyZXNzaW5nIGFueSBpc3N1ZXMg
dGhhdCBhcmUgcmVwb3J0ZWQgaWYgbmVlZGVkLgoKSWYgYW55IHVwZGF0ZXMgYXJlIHJlcXVpcmVk
IG9yIHlvdSBhcmUgc3VibWl0dGluZyBmdXJ0aGVyIGNoYW5nZXMgdGhleQpzaG91bGQgYmUgc2Vu
dCBhcyBpbmNyZW1lbnRhbCB1cGRhdGVzIGFnYWluc3QgY3VycmVudCBnaXQsIGV4aXN0aW5nCnBh
dGNoZXMgd2lsbCBub3QgYmUgcmVwbGFjZWQuCgpQbGVhc2UgYWRkIGFueSByZWxldmFudCBsaXN0
cyBhbmQgbWFpbnRhaW5lcnMgdG8gdGhlIENDcyB3aGVuIHJlcGx5aW5nCnRvIHRoaXMgbWFpbC4K
ClRoYW5rcywKTWFyawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
