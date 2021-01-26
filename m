Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E723B304488
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Jan 2021 18:08:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DEDEC57183;
	Tue, 26 Jan 2021 17:08:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C3EDC57181
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Jan 2021 17:08:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 843DFD6E;
 Tue, 26 Jan 2021 09:08:55 -0800 (PST)
Received: from [10.57.40.145] (unknown [10.57.40.145])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 099A63F66E;
 Tue, 26 Jan 2021 09:08:45 -0800 (PST)
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>, Matt Mackall <mpm@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Eric Anholt <eric@anholt.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210126165835.687514-5-u.kleine-koenig@pengutronix.de>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <3e42b2ea-c713-31b2-9c86-c49a70d8e1f4@arm.com>
Date: Tue, 26 Jan 2021 17:08:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210126165835.687514-5-u.kleine-koenig@pengutronix.de>
Content-Language: en-GB
Cc: linux-rtc@vger.kernel.org, kvm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-serial@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 coresight@lists.linaro.org, linux-input@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-crypto@vger.kernel.org, kernel@pengutronix.de,
 Leo Yan <leo.yan@linaro.org>, dmaengine@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
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

SGkKCk9uIDEvMjYvMjEgNDo1OCBQTSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gQWxsIGFt
YmEgZHJpdmVycyByZXR1cm4gMCBpbiB0aGVpciByZW1vdmUgY2FsbGJhY2suIFRvZ2V0aGVyIHdp
dGggdGhlCj4gZHJpdmVyIGNvcmUgaWdub3JpbmcgdGhlIHJldHVybiB2YWx1ZSBhbnlob3csIGl0
IGRvZXNuJ3QgbWFrZSBzZW5zZSB0bwo+IHJldHVybiBhIHZhbHVlIGhlcmUuCj4gCj4gQ2hhbmdl
IHRoZSByZW1vdmUgcHJvdG90eXBlIHRvIHJldHVybiB2b2lkLCB3aGljaCBtYWtlcyBpdCBleHBs
aWNpdCB0aGF0Cj4gcmV0dXJuaW5nIGFuIGVycm9yIHZhbHVlIGRvZXNuJ3Qgd29yayBhcyBleHBl
Y3RlZC4gVGhpcyBzaW1wbGlmaWVzIGNoYW5naW5nCj4gdGhlIGNvcmUgcmVtb3ZlIGNhbGxiYWNr
IHRvIHJldHVybiB2b2lkLCB0b28uCj4gCj4gUmV2aWV3ZWQtYnk6IFVsZiBIYW5zc29uIDx1bGYu
aGFuc3NvbkBsaW5hcm8ub3JnPgo+IFJldmlld2VkLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFy
bmRiLmRlPgo+IEFja2VkLWJ5OiBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlA
Ym9vdGxpbi5jb20+Cj4gQWNrZWQtYnk6IERtaXRyeSBUb3Jva2hvdiA8ZG1pdHJ5LnRvcm9raG92
QGdtYWlsLmNvbT4KPiBBY2tlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwu
b3JnPiAjIGZvciBkcml2ZXJzL21lbW9yeQo+IEFja2VkLWJ5OiBNYXJrIEJyb3duIDxicm9vbmll
QGtlcm5lbC5vcmc+CiAgPiBBY2tlZC1ieTogRG1pdHJ5IFRvcm9raG92IDxkbWl0cnkudG9yb2to
b3ZAZ21haWwuY29tPgo+IEFja2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxp
bmFyby5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtv
ZW5pZ0BwZW5ndXRyb25peC5kZT4KCgo+ICAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2Nv
cmVzaWdodC1ldG00eC1jb3JlLmMgfCA0ICstLS0KCllvdSBhcmUgbW9zdCBsaWtlbHkgdG8gaGF2
ZSBhIGNvbmZsaWN0IGZvciB0aGUgYWJvdmUgZmlsZSwgd2l0aCB3aGF0IGlzCmluIGNvcmVzaWdo
dC9uZXh0LiBJdCBzaG91bGQgYmUgZWFzeSB0byByZXNvbHZlLgoKT3RoZXJ3aXNlLCB0aGUgY2hh
bmdlcyBsb29rIGdvb2QgZm9yIHRoZSBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvKgoKQWNr
ZWQtYnk6IFN1enVraSBLIFBvdWxvc2UgPHN1enVraS5wb3Vsb3NlQGFybS5jb20+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
