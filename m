Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B14363F288
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Dec 2022 15:17:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEFC2C65E62;
	Thu,  1 Dec 2022 14:17:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B695C63326
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Dec 2022 14:17:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F40CED1;
 Thu,  1 Dec 2022 06:17:23 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0F8B3F73D;
 Thu,  1 Dec 2022 06:17:09 -0800 (PST)
Date: Thu, 1 Dec 2022 14:17:07 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20221201141707.28af0d1d@donnerap.cambridge.arm.com>
In-Reply-To: <20221201131604.beq4l22d42tjy6dm@pengutronix.de>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
 <20221201102252.52ace284@donnerap.cambridge.arm.com>
 <20221201131604.beq4l22d42tjy6dm@pengutronix.de>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Satya Priya <quic_c_skakit@quicinc.com>, Pavel Machek <pavel@ucw.cz>,
 Guenter Roeck <groeck@chromium.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-riscv@lists.infradead.org,
 linux-leds@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 chrome-platform@lists.linux.dev, Florian Fainelli <f.fainelli@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Sean Anderson <sean.anderson@seco.com>,
 Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Michal Simek <michal.simek@xilinx.com>,
 linux-stm32@st-md-mailman.stormreply.com, Hammer Hsieh <hammerh0314@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Stephen Boyd <swboyd@chromium.org>, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>, Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v2 01/11] pwm: Make .get_state() callback
 return an error code
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

T24gVGh1LCAxIERlYyAyMDIyIDE0OjE2OjA0ICswMTAwClV3ZSBLbGVpbmUtS8O2bmlnIDx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgoKSGkgVXdlLAoKPiBIZWxsbyBBbmRy
ZSwKPiAKPiBPbiBUaHUsIERlYyAwMSwgMjAyMiBhdCAxMDoyMjo1MkFNICswMDAwLCBBbmRyZSBQ
cnp5d2FyYSB3cm90ZToKPiA+IEp1c3Qgb25lIGNvbW1lbnQ6IEkgZG9uJ3Qgc2VlIGEgc3VueGkg
c3BlY2lmaWMgcGF0Y2ggbGF0ZXIgaW4gdGhlIHNlcmllcywKPiA+IHRob3VnaCBpdCBzZWVtcyB3
ZSBoYXZlIGF0IGxlYXN0IG9uZSBlcnJvciBlcnJvciBleGl0IChzZWUgcHJlc2NhbGVyID09IDAK
PiA+IGFib3ZlKS4gUGx1cyBwb3RlbnRpYWxseSBhbm90aGVyIGV4aXQgaWYgY2xrX2dldF9yYXRl
KCkgKGF0IHRoZSB2ZXJ5Cj4gPiBiZWdpbm5pbmcpIGZhaWxzLgo+ID4gU2hhbGwgSSBzZW5kIGEg
cGF0Y2ggZm9yIHRoYXQ/ICAKPiAKPiBUaGF0IHdvdWxkIHdlIHZlcnkgd2VsY29tZS4gSSBtZW50
aW9uZWQgdGhhdCBzaG9ydGx5IGluIHRoZSBjb3Zlcgo+IGxldHRlciwgSSB3YXNuJ3QgZW50aXJl
bHkgc3VyZSBob3cgdG8gaGFuZGxlIHRoYXQgcHJlc2NhbGVyID0gMCBjYXNlLgoKQWggcmlnaHQs
IHNvcnJ5LCBJIG1pc3NlZCB0aGF0LgpTbyB0aGUgQWxsd2lubmVyIG1hbnVhbCBzb21laG93IG1h
cmtzIHRob3NlIHByZXNjYWxlciBlbmNvZGluZ3MgYXMgcmVzZXJ2ZWQKb3IgaW52YWxpZCAoaXQn
cyBqdXN0IGEgIi8iIGluIHRoZXJlKSwgYW5kIHdlIG5ldmVyIHNldCB0aG9zZSB2YWx1ZXMgaW4g
dGhlCmRyaXZlciAodGhlcmUgaXMgYW4gZXhwbGljaXQgY2hlY2spLiBTbyBpdCBjb3VsZCBvbmx5
IGJlIGEgbGVmdG92ZXIgZnJvbQpmaXJtd2FyZS9ib290bG9hZGVyLCBvciBzb21lb25lIHBva2lu
ZyBhdCB0aGlzIHJlZ2lzdGVyIGJlaGluZCBvdXIgYmFjay4KSSBhbSB0ZW1wdGVkIHRvIGp1c3Qg
cmV0dXJuIHNvbWUgLUVJTlZBTC4gQXMgdGhlIGN1cnJlbnQgY29kZSBzdGFuZHMsIHdlCmRvbid0
IG1hbmlwdWxhdGUgYW55IHN0YXRlIGZsYWdzIGJlZm9yZSB0aGF0IGNoZWNrLCBzbyBpdCBkb2Vz
bid0CnJlYWxseSBtYXR0ZXIsIGJ1dCB3b3VsZCBiZSBiZXN0IHByYWN0aXNlLCBhdCBsZWFzdC4K
CkNoZWVycywKQW5kcmUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
