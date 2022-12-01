Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7D863F06B
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Dec 2022 13:25:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74EBDC65E5F;
	Thu,  1 Dec 2022 12:25:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F497C63326
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Dec 2022 10:23:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A95EED1;
 Thu,  1 Dec 2022 02:23:09 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4DF93F67D;
 Thu,  1 Dec 2022 02:22:55 -0800 (PST)
Date: Thu, 1 Dec 2022 10:22:52 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20221201102252.52ace284@donnerap.cambridge.arm.com>
In-Reply-To: <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 01 Dec 2022 12:25:36 +0000
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
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
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Stephen Boyd <swboyd@chromium.org>, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>, Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
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

T24gV2VkLCAzMCBOb3YgMjAyMiAxNjoyMTozOCArMDEwMApVd2UgS2xlaW5lLUvDtm5pZyA8dS5r
bGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKCkhpLAoKPiAuZ2V0X3N0YXRlKCkg
bWlnaHQgZmFpbCBpbiBzb21lIGNhc2VzLiBUbyBtYWtlIGl0IHBvc3NpYmxlIHRoYXQgYSBkcml2
ZXIKPiBzaWduYWxzIHN1Y2ggYSBmYWlsdXJlIGNoYW5nZSB0aGUgcHJvdG90eXBlIG9mIC5nZXRf
c3RhdGUoKSB0byByZXR1cm4gYW4KPiBlcnJvciBjb2RlLgo+IAo+IFRoaXMgcGF0Y2ggd2FzIGNy
ZWF0ZWQgdXNpbmcgY29jY2luZWxsZSBhbmQgdGhlIGZvbGxvd2luZyBzZW1hbnRpYyBwYXRjaDoK
PiAKPiBAcDFACj4gaWRlbnRpZmllciBnZXRzdGF0ZWZ1bmM7Cj4gaWRlbnRpZmllciBkcml2ZXI7
Cj4gQEAKPiAgc3RydWN0IHB3bV9vcHMgZHJpdmVyID0gewo+ICAgICAgICAgLi4uLAo+ICAgICAg
ICAgLmdldF9zdGF0ZSA9IGdldHN0YXRlZnVuYwo+ICAgICAgICAgLC4uLgo+ICB9Owo+IAo+IEBw
MkAKPiBpZGVudGlmaWVyIHAxLmdldHN0YXRlZnVuYzsKPiBpZGVudGlmaWVyIGNoaXAsIHB3bSwg
c3RhdGU7Cj4gQEAKPiAtdm9pZAo+ICtpbnQKPiAgZ2V0c3RhdGVmdW5jKHN0cnVjdCBwd21fY2hp
cCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwgc3RydWN0IHB3bV9zdGF0ZSAqc3RhdGUp
Cj4gIHsKPiAgICAuLi4KPiAtICByZXR1cm47Cj4gKyAgcmV0dXJuIDA7Cj4gICAgLi4uCj4gIH0K
PiAKPiBwbHVzIHRoZSBhY3R1YWwgY2hhbmdlIG9mIHRoZSBwcm90b3R5cGUgaW4gaW5jbHVkZS9s
aW51eC9wd20uaCAocGx1cyBzb21lCj4gbWFudWFsIGZpeGluZyBvZiBpbmRlbnRpb25zIGFuZCBl
bXB0eSBsaW5lcykuCj4gCj4gU28gZm9yIG5vdyBhbGwgZHJpdmVycyByZXR1cm4gc3VjY2VzcyB1
bmNvbmRpdGlvbmFsbHkuIFRoZXkgYXJlIGFkYXB0ZWQKPiBpbiB0aGUgZm9sbG93aW5nIHBhdGNo
ZXMgdG8gbWFrZSB0aGUgY2hhbmdlcyBlYXNpZXIgcmV2aWV3YWJsZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+
IC0tLQo+ICBkcml2ZXJzL2dwaW8vZ3Bpby1tdmVidS5jICAgICAgICAgICAgIHwgIDkgKysrKysr
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMgfCAxNCArKysrKysr
Ky0tLS0tLQo+ICBkcml2ZXJzL2xlZHMvcmdiL2xlZHMtcWNvbS1scGcuYyAgICAgIHwgMTQgKysr
KysrKystLS0tLS0KPiAgZHJpdmVycy9wd20vcHdtLWF0bWVsLmMgICAgICAgICAgICAgICB8ICA2
ICsrKystLQo+ICBkcml2ZXJzL3B3bS9wd20tYmNtLWlwcm9jLmMgICAgICAgICAgIHwgIDggKysr
KystLS0KPiAgZHJpdmVycy9wd20vcHdtLWNyYy5jICAgICAgICAgICAgICAgICB8IDEwICsrKysr
Ky0tLS0KPiAgZHJpdmVycy9wd20vcHdtLWNyb3MtZWMuYyAgICAgICAgICAgICB8ICA4ICsrKysr
LS0tCj4gIGRyaXZlcnMvcHdtL3B3bS1kd2MuYyAgICAgICAgICAgICAgICAgfCAgNiArKysrLS0K
PiAgZHJpdmVycy9wd20vcHdtLWhpYnZ0LmMgICAgICAgICAgICAgICB8ICA2ICsrKystLQo+ICBk
cml2ZXJzL3B3bS9wd20taW14LXRwbS5jICAgICAgICAgICAgIHwgIDggKysrKystLS0KPiAgZHJp
dmVycy9wd20vcHdtLWlteDI3LmMgICAgICAgICAgICAgICB8ICA4ICsrKysrLS0tCj4gIGRyaXZl
cnMvcHdtL3B3bS1pbnRlbC1sZ20uYyAgICAgICAgICAgfCAgNiArKysrLS0KPiAgZHJpdmVycy9w
d20vcHdtLWlxczYyMGEuYyAgICAgICAgICAgICB8ICA2ICsrKystLQo+ICBkcml2ZXJzL3B3bS9w
d20ta2VlbWJheS5jICAgICAgICAgICAgIHwgIDYgKysrKy0tCj4gIGRyaXZlcnMvcHdtL3B3bS1s
cHNzLmMgICAgICAgICAgICAgICAgfCAgNiArKysrLS0KPiAgZHJpdmVycy9wd20vcHdtLW1lc29u
LmMgICAgICAgICAgICAgICB8ICA4ICsrKysrLS0tCj4gIGRyaXZlcnMvcHdtL3B3bS1tdGstZGlz
cC5jICAgICAgICAgICAgfCAxMiArKysrKysrLS0tLS0KPiAgZHJpdmVycy9wd20vcHdtLXBjYTk2
ODUuYyAgICAgICAgICAgICB8ICA4ICsrKysrLS0tCj4gIGRyaXZlcnMvcHdtL3B3bS1yYXNwYmVy
cnlwaS1wb2UuYyAgICAgfCAgOCArKysrKy0tLQo+ICBkcml2ZXJzL3B3bS9wd20tcm9ja2NoaXAu
YyAgICAgICAgICAgIHwgMTIgKysrKysrKy0tLS0tCj4gIGRyaXZlcnMvcHdtL3B3bS1zaWZpdmUu
YyAgICAgICAgICAgICAgfCAgNiArKysrLS0KPiAgZHJpdmVycy9wd20vcHdtLXNsMjhjcGxkLmMg
ICAgICAgICAgICB8ICA4ICsrKysrLS0tCj4gIGRyaXZlcnMvcHdtL3B3bS1zcHJkLmMgICAgICAg
ICAgICAgICAgfCAgOCArKysrKy0tLQo+ICBkcml2ZXJzL3B3bS9wd20tc3RtMzItbHAuYyAgICAg
ICAgICAgIHwgIDggKysrKystLS0KPiAgZHJpdmVycy9wd20vcHdtLXN1bjRpLmMgICAgICAgICAg
ICAgICB8IDEyICsrKysrKystLS0tLQo+ICBkcml2ZXJzL3B3bS9wd20tc3VucGx1cy5jICAgICAg
ICAgICAgIHwgIDYgKysrKy0tCj4gIGRyaXZlcnMvcHdtL3B3bS12aXNjb250aS5jICAgICAgICAg
ICAgfCAgNiArKysrLS0KPiAgZHJpdmVycy9wd20vcHdtLXhpbGlueC5jICAgICAgICAgICAgICB8
ICA4ICsrKysrLS0tCj4gIGluY2x1ZGUvbGludXgvcHdtLmggICAgICAgICAgICAgICAgICAgfCAg
NCArKy0tCj4gIDI5IGZpbGVzIGNoYW5nZWQsIDE0NiBpbnNlcnRpb25zKCspLCA4OSBkZWxldGlv
bnMoLSkKPiAKClsgLi4uIF0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXN1bjRpLmMg
Yi9kcml2ZXJzL3B3bS9wd20tc3VuNGkuYwo+IGluZGV4IGM4NDQ1YjBhMzMzOS4uMzdkNzVlMjUy
ZDRlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcHdtL3B3bS1zdW40aS5jCj4gKysrIGIvZHJpdmVy
cy9wd20vcHdtLXN1bjRpLmMKPiBAQCAtMTA4LDkgKzEwOCw5IEBAIHN0YXRpYyBpbmxpbmUgdm9p
ZCBzdW40aV9wd21fd3JpdGVsKHN0cnVjdCBzdW40aV9wd21fY2hpcCAqY2hpcCwKPiAgCXdyaXRl
bCh2YWwsIGNoaXAtPmJhc2UgKyBvZmZzZXQpOwo+ICB9Cj4gIAo+IC1zdGF0aWMgdm9pZCBzdW40
aV9wd21fZ2V0X3N0YXRlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwKPiAtCQkJCXN0cnVjdCBwd21f
ZGV2aWNlICpwd20sCj4gLQkJCQlzdHJ1Y3QgcHdtX3N0YXRlICpzdGF0ZSkKPiArc3RhdGljIGlu
dCBzdW40aV9wd21fZ2V0X3N0YXRlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwKPiArCQkJICAgICAg
IHN0cnVjdCBwd21fZGV2aWNlICpwd20sCj4gKwkJCSAgICAgICBzdHJ1Y3QgcHdtX3N0YXRlICpz
dGF0ZSkKPiAgewo+ICAJc3RydWN0IHN1bjRpX3B3bV9jaGlwICpzdW40aV9wd20gPSB0b19zdW40
aV9wd21fY2hpcChjaGlwKTsKPiAgCXU2NCBjbGtfcmF0ZSwgdG1wOwo+IEBAIC0xMzIsNyArMTMy
LDcgQEAgc3RhdGljIHZvaWQgc3VuNGlfcHdtX2dldF9zdGF0ZShzdHJ1Y3QgcHdtX2NoaXAgKmNo
aXAsCj4gIAkJc3RhdGUtPmR1dHlfY3ljbGUgPSBESVZfUk9VTkRfVVBfVUxMKHN0YXRlLT5wZXJp
b2QsIDIpOwo+ICAJCXN0YXRlLT5wb2xhcml0eSA9IFBXTV9QT0xBUklUWV9OT1JNQUw7Cj4gIAkJ
c3RhdGUtPmVuYWJsZWQgPSB0cnVlOwo+IC0JCXJldHVybjsKPiArCQlyZXR1cm4gMDsKPiAgCX0K
PiAgCj4gIAlpZiAoKFBXTV9SRUdfUFJFU0NBTCh2YWwsIHB3bS0+aHdwd20pID09IFBXTV9QUkVT
Q0FMX01BU0spICYmCj4gQEAgLTE0Miw3ICsxNDIsNyBAQCBzdGF0aWMgdm9pZCBzdW40aV9wd21f
Z2V0X3N0YXRlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwKPiAgCQlwcmVzY2FsZXIgPSBwcmVzY2Fs
ZXJfdGFibGVbUFdNX1JFR19QUkVTQ0FMKHZhbCwgcHdtLT5od3B3bSldOwo+ICAKPiAgCWlmIChw
cmVzY2FsZXIgPT0gMCkKPiAtCQlyZXR1cm47Cj4gKwkJcmV0dXJuIDA7Cj4gIAo+ICAJaWYgKHZh
bCAmIEJJVF9DSChQV01fQUNUX1NUQVRFLCBwd20tPmh3cHdtKSkKPiAgCQlzdGF0ZS0+cG9sYXJp
dHkgPSBQV01fUE9MQVJJVFlfTk9STUFMOwo+IEBAIC0xNjIsNiArMTYyLDggQEAgc3RhdGljIHZv
aWQgc3VuNGlfcHdtX2dldF9zdGF0ZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsCj4gIAo+ICAJdG1w
ID0gKHU2NClwcmVzY2FsZXIgKiBOU0VDX1BFUl9TRUMgKiBQV01fUkVHX1BSRCh2YWwpOwo+ICAJ
c3RhdGUtPnBlcmlvZCA9IERJVl9ST1VORF9DTE9TRVNUX1VMTCh0bXAsIGNsa19yYXRlKTsKPiAr
Cj4gKwlyZXR1cm4gMDsKPiAgfQo+ICAKPiAgc3RhdGljIGludCBzdW40aV9wd21fY2FsY3VsYXRl
KHN0cnVjdCBzdW40aV9wd21fY2hpcCAqc3VuNGlfcHdtLAoKRm9yIHN1bnhpOgoKUmV2aWV3ZWQt
Ynk6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBhcm0uY29tPgoKSnVzdCBvbmUgY29t
bWVudDogSSBkb24ndCBzZWUgYSBzdW54aSBzcGVjaWZpYyBwYXRjaCBsYXRlciBpbiB0aGUgc2Vy
aWVzLAp0aG91Z2ggaXQgc2VlbXMgd2UgaGF2ZSBhdCBsZWFzdCBvbmUgZXJyb3IgZXJyb3IgZXhp
dCAoc2VlIHByZXNjYWxlciA9PSAwCmFib3ZlKS4gUGx1cyBwb3RlbnRpYWxseSBhbm90aGVyIGV4
aXQgaWYgY2xrX2dldF9yYXRlKCkgKGF0IHRoZSB2ZXJ5CmJlZ2lubmluZykgZmFpbHMuClNoYWxs
IEkgc2VuZCBhIHBhdGNoIGZvciB0aGF0PwoKQ2hlZXJzLApBbmRyZS4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
