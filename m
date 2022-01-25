Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3D349AFD6
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jan 2022 10:30:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6E40C5F1D5;
	Tue, 25 Jan 2022 09:30:56 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A2C3C5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jan 2022 09:30:55 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id p7so29029597uao.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jan 2022 01:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1mm7+Qmz3LImo4aFwbhXIFkzVEgm/HAOzd6fbdAVMrg=;
 b=kCmCEgQ+xOVJqgvY6mIiDwGpng9RE64Ri/x5bVEJVgfKmrbder8yB0SJa9j3j/iO6u
 VSlwxJi1GtMfRaX9rz0Fi8V70QZmpTm/yg+yqKEhFTP/kvAigM6NlkG016BHxBuEGBud
 aKKG3vXyGKhkWECz7g02ij5pN8RBjRbfSAGJhF2s+s/E8Wzq61/RmUZzmkHINs6y38kj
 8W/C1tUsfkR71I5xYVxyEgRhxjIz/FmTGO/CwLqL3papla/+aWUpb3kyrOT/GpbDGqeC
 c1kCPdzAMoEjl9Ka3L/ozlubTR502/GpTZoRLS5kuqKqPkl9NQ2lJSPzTzJVIDppuhpp
 EfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1mm7+Qmz3LImo4aFwbhXIFkzVEgm/HAOzd6fbdAVMrg=;
 b=qIQQZ3lwkjLXBT7GAIk0LF7eEkpKp8mxO6nWukgykzSAXiGDNkH4ttthD1hTDnQsfu
 HXQOPDZ5niMFQUyUuPFueOrvGGLsaW1p/qTTAsIkRH/NcXslKe4mOEmp/lT7ZO87nqS2
 Nwt53037gf8EUa8syWgj3YpdB/+Z7blZ+PLo2Twg62gnNBYj9Cpus2xiZwqAT7760oCS
 sCjKMai0JLZCxOWkigpL4VQ7SRjM/qMslUNnzs94mTeta0xMR2OtwAPcm7SBxLja9QoO
 CJWnwyrPd1BmRdhTrfFm5winndZH/I9UVyytWeMgxeuTQ/BGE9JRTbw4FVg+isWWLk5T
 jzTw==
X-Gm-Message-State: AOAM531lX58dZh5E8DR5+oDmBbvNvmyNbobRonmHyaK5DaQTGRrnJ+fq
 mCNhBS4mBur+nWkNyrFI0PBSGkKecSTZ6eWPBUyHow==
X-Google-Smtp-Source: ABdhPJwHGGkAwOnsd7qe0zHQAqHAUzi5PBqvJQ90yr1sdZ5zdG5wkLeKm2Z8HhNpFMDsTHL1nOGUCrWQS9pCXlyV9Y0=
X-Received: by 2002:a67:8c2:: with SMTP id 185mr712613vsi.19.1643103053912;
 Tue, 25 Jan 2022 01:30:53 -0800 (PST)
MIME-Version: 1.0
References: <20220123175201.34839-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220123175201.34839-1-u.kleine-koenig@pengutronix.de>
From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 25 Jan 2022 09:30:43 +0000
Message-ID: <CAF2Aj3g0uxj7=m+USWz9QvmQ511DN83e9WsVDW-484aEdix4hg@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
 James Schulman <james.schulman@cirrus.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Zhang Qilong <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Michael Walle <michael@walle.cc>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Jingoo Han <jingoohan1@gmail.com>, linux-mtd@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, Vladimir Oltean <olteanv@gmail.com>,
 linux-wpan@vger.kernel.org, Claudiu Beznea <Claudiu.Beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dan Robertson <dan@dlrobertson.com>, Markuss Broks <markuss.broks@gmail.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, David Airlie <airlied@linux.ie>,
 linux-wireless@vger.kernel.org, Marco Felsch <m.felsch@pengutronix.de>,
 David Rhodes <david.rhodes@cirrus.com>,
 Thierry Reding <thierry.reding@gmail.com>, Solomon Peachy <pizza@shaftnet.org>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Jiri Slaby <jirislaby@kernel.org>, Helge Deller <deller@gmx.de>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, Jon Hunter <jonathanh@nvidia.com>,
 dingsenjie <dingsenjie@yulong.com>, Heiko Schocher <hs@denx.de>,
 Wolfgang Grandegger <wg@grandegger.com>, Matt Kline <matt@bitbashing.io>,
 Woojung Huh <woojung.huh@microchip.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Mike Looijmans <mike.looijmans@topic.nl>,
 =?UTF-8?Q?Ronald_Tschal=C3=A4r?= <ronald@innovation.ch>,
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
 alsa-devel@alsa-project.org, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 netdev@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
 linux-rtc@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Guenter Roeck <groeck@google.com>,
 Aditya Srivastava <yashsri421@gmail.com>,
 Varka Bhadram <varkabhadram@gmail.com>, wengjianfeng <wengjianfeng@yulong.com>,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Mark Greer <mgreer@animalcreek.com>, Mark Gross <markgross@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-fbdev@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benson Leung <bleung@chromium.org>,
 =?UTF-8?Q?Stefan_M=C3=A4tje?= <stefan.maetje@esd.eu>,
 linux-hwmon@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
 Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Julia Lawall <julia.lawall@inria.fr>,
 Yang Li <yang.lee@linux.alibaba.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 patches@opensource.cirrus.com,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Kent Gustavsson <kent@minoris.se>, "David S. Miller" <davem@davemloft.net>,
 Charles-Antoine Couret <charles-antoine.couret@nexvision.fr>,
 Alexander Aring <alex.aring@gmail.com>, Jiri Prchal <jiri.prchal@aksignal.cz>,
 Vignesh Raghavendra <vigneshr@ti.com>, Emma Anholt <emma@anholt.net>,
 Peter Zijlstra <peterz@infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexandru Ardelean <ardeleanalex@gmail.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Peter Huewe <peterhuewe@gmx.de>,
 Torin Cooper-Bennun <torin@maxiluxsystems.com>, linux-leds@vger.kernel.org,
 Eric Piel <eric.piel@tremplin-utc.net>, Stephan Gerhold <stephan@gerhold.net>,
 Noralf Tronnes <notro@tronnes.org>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Thomas Kopp <thomas.kopp@microchip.com>, Jakub Kicinski <kuba@kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>, platform-driver-x86@vger.kernel.org,
 Stefan Wahren <stefan.wahren@i2se.com>, Xue Liu <liuxuenetmail@gmail.com>,
 David Lechner <david@lechnology.com>, Will Deacon <will@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Harry Morris <h.morris@cascoda.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
 Alessandro Zummo <a.zummo@towertech.it>, Yang Shen <shenyang39@huawei.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Takashi Iwai <tiwai@suse.com>,
 Cai Huoqing <caihuoqing@baidu.com>, Daniel Mack <daniel@zonque.org>,
 Daniel Vetter <daniel@ffwll.ch>, Colin Ian King <colin.king@intel.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Alan Ott <alan@signal11.us>
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

TXkgdXN1YWwgbWFpbGVyIHdvbid0IGxldCBtZSByZXBseSB0byB0aGlzIG1hbnkgcGVvcGxlLCBz
byBJJ20gdXNpbmcgR21haWwuCgpObyBpZGVhIHdoYXQgY2hhb3MgdGhpcyB3aWxsIGNhdXNlLCBi
dXQgaGVyZSBnb2VzIC4uLgoKPiBUaGUgdmFsdWUgcmV0dXJuZWQgYnkgYW4gc3BpIGRyaXZlcidz
IHJlbW92ZSBmdW5jdGlvbiBpcyBtb3N0bHkgaWdub3JlZC4KPiAoT25seSBhbiBlcnJvciBtZXNz
YWdlIGlzIHByaW50ZWQgaWYgdGhlIHZhbHVlIGlzIG5vbi16ZXJvIHRoYXQgdGhlCj4gZXJyb3Ig
aXMgaWdub3JlZC4pCj4KPiBTbyBjaGFuZ2UgdGhlIHByb3RvdHlwZSBvZiB0aGUgcmVtb3ZlIGZ1
bmN0aW9uIHRvIHJldHVybiBubyB2YWx1ZS4gVGhpcwo+IHdheSBkcml2ZXIgYXV0aG9ycyBhcmUg
bm90IHRlbXB0ZWQgdG8gYXNzdW1lIHRoYXQgcGFzc2luZyBhbiBlcnJvciB0bwo+IHRoZSB1cHBl
ciBsYXllciBpcyBhIGdvb2QgaWRlYS4gQWxsIGRyaXZlcnMgYXJlIGFkYXB0ZWQgYWNjb3JkaW5n
bHkuCj4gVGhlcmUgaXMgbm8gaW50ZW5kZWQgY2hhbmdlIG9mIGJlaGF2aW91ciwgYWxsIGNhbGxi
YWNrcyB3ZXJlIHByZXBhcmVkIHRvCj4gcmV0dXJuIDAgYmVmb3JlLgo+Cj4gU2lnbmVkLW9mZi1i
eTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KPiAt
LS0KClsuLi5dCgo+ICBkcml2ZXJzL21mZC9hcml6b25hLXNwaS5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9tZmQvZGE5MDUyLXNwaS5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAzICstLQo+ICBkcml2ZXJzL21mZC9lengtcGNhcC5jICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9tZmQvbWFk
ZXJhLXNwaS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVy
cy9tZmQvbWMxM3h4eC1zcGkuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKy0tCj4g
IGRyaXZlcnMvbWZkL3JzbXVfc3BpLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDQgKy0tLQo+ICBkcml2ZXJzL21mZC9zdG1wZS1zcGkuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9tZmQvdHBzNjU5MTItc3BpLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDQgKy0tLQoKPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvYW1z
MzY5ZmcwNi5jICAgICAgICAgfCAgMyArLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvY29y
Z2lfbGNkLmMgICAgICAgICAgICAgICB8ICAzICstLQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9pbGk5MjJ4LmMgICAgICAgICAgICAgICAgICAgIHwgIDMgKy0tCj4gIGRyaXZlcnMvdmlkZW8v
YmFja2xpZ2h0L2w0ZjAwMjQydDAzLmMgICAgICAgICAgIHwgIDMgKy0tCj4gIGRyaXZlcnMvdmlk
ZW8vYmFja2xpZ2h0L2xtczUwMWtmMDMuYyAgICAgICAgICAgIHwgIDMgKy0tCj4gIGRyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L2x0djM1MHF2LmMgICAgICAgICAgICAgICAgIHwgIDMgKy0tCj4gIGRy
aXZlcnMvdmlkZW8vYmFja2xpZ2h0L3RkbzI0bS5jICAgICAgICAgICAgICAgICAgfCAgMyArLS0K
PiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvdG9zYV9sY2QuYyAgICAgICAgICAgICAgICB8ICA0
ICstLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvdmdnMjQzMmE0LmMgICAgICAgICAgICB8
ICA0ICstLS0KCklmIGl0J3Mgb2theSB3aXRoIE1hcmssIGl0J3Mgb2theSB3aXRoIG1lLgoKQWNr
ZWQtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgotLSAKTGVlIEpvbmVzIFvm
nY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBQcmluY2lwbGUgVGVjaG5pY2FsIExlYWQKTGluYXJv
Lm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86
IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
