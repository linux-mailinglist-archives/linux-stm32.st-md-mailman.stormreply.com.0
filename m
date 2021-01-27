Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D59305550
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Jan 2021 09:13:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BACBC57183;
	Wed, 27 Jan 2021 08:13:01 +0000 (UTC)
Received: from mail.mleia.com (mleia.com [178.79.152.223])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38495C5662E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Jan 2021 08:12:59 +0000 (UTC)
Received: from mail.mleia.com (localhost [127.0.0.1])
 by mail.mleia.com (Postfix) with ESMTP id 9227042EB56;
 Wed, 27 Jan 2021 08:12:58 +0000 (UTC)
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210126165835.687514-5-u.kleine-koenig@pengutronix.de>
From: Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <b9bfa80b-ed5f-50f9-de50-76090007556c@mleia.com>
Date: Wed, 27 Jan 2021 10:12:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210126165835.687514-5-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20210127_081258_639999_D23EB9E2 
X-CRM114-Status: GOOD (  14.44  )
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Eric Anholt <eric@anholt.net>, linux-i2c@vger.kernel.org,
 linux-spi@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-rtc@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Mike Leach <mike.leach@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 linux-fbdev@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 linux-watchdog@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Leo Yan <leo.yan@linaro.org>,
 dmaengine@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [Linux-stm32] [PATCH v3 4/5] amba: Make the remove callback
	return void
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMS8yNi8yMSA2OjU4IFBNLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBBbGwgYW1iYSBk
cml2ZXJzIHJldHVybiAwIGluIHRoZWlyIHJlbW92ZSBjYWxsYmFjay4gVG9nZXRoZXIgd2l0aCB0
aGUKPiBkcml2ZXIgY29yZSBpZ25vcmluZyB0aGUgcmV0dXJuIHZhbHVlIGFueWhvdywgaXQgZG9l
c24ndCBtYWtlIHNlbnNlIHRvCj4gcmV0dXJuIGEgdmFsdWUgaGVyZS4KPiAKPiBDaGFuZ2UgdGhl
IHJlbW92ZSBwcm90b3R5cGUgdG8gcmV0dXJuIHZvaWQsIHdoaWNoIG1ha2VzIGl0IGV4cGxpY2l0
IHRoYXQKPiByZXR1cm5pbmcgYW4gZXJyb3IgdmFsdWUgZG9lc24ndCB3b3JrIGFzIGV4cGVjdGVk
LiBUaGlzIHNpbXBsaWZpZXMgY2hhbmdpbmcKPiB0aGUgY29yZSByZW1vdmUgY2FsbGJhY2sgdG8g
cmV0dXJuIHZvaWQsIHRvby4KPiAKPiBSZXZpZXdlZC1ieTogVWxmIEhhbnNzb24gPHVsZi5oYW5z
c29uQGxpbmFyby5vcmc+Cj4gUmV2aWV3ZWQtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+Cj4gQWNrZWQtYnk6IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBib290
bGluLmNvbT4KPiBBY2tlZC1ieTogRG1pdHJ5IFRvcm9raG92IDxkbWl0cnkudG9yb2tob3ZAZ21h
aWwuY29tPgo+IEFja2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+
ICMgZm9yIGRyaXZlcnMvbWVtb3J5Cj4gQWNrZWQtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVAa2Vy
bmVsLm9yZz4KPiBBY2tlZC1ieTogRG1pdHJ5IFRvcm9raG92IDxkbWl0cnkudG9yb2tob3ZAZ21h
aWwuY29tPgo+IEFja2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5v
cmc+Cj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0Bw
ZW5ndXRyb25peC5kZT4KCkZvciBkcml2ZXJzL21lbW9yeS9wbDE3Mi5jOgoKQWNrZWQtYnk6IFZs
YWRpbWlyIFphcG9sc2tpeSA8dnpAbWxlaWEuY29tPgoKLS0KQmVzdCB3aXNoZXMsClZsYWRpbWly
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
