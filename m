Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CDE642634
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Dec 2022 10:57:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D947EC65E60;
	Mon,  5 Dec 2022 09:57:38 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD9F0C63326
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Dec 2022 15:43:13 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id td2so5150640ejc.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 Dec 2022 07:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=14XZ2O4FVzL1QGTsdtTUFr9T59k2FsnxsuG+9VtNi+I=;
 b=YOSKLNbCT/4q5PjmWEt1oRxSc0fAHVkR9aCRojDmy6dX3JIfmuh09oI2+RqgLe5/jd
 rhksY1dFQr1NIf0y+S4W3Srw2WU7sHKiYYle1iNRxPBiBIzFXL82IukHMHMtY9muYje3
 xmUTZGxkap/l3tbGPVsjXSxV7D/2u9/HaWZ6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=14XZ2O4FVzL1QGTsdtTUFr9T59k2FsnxsuG+9VtNi+I=;
 b=KmSTFEiCt8I2YyF+xi8L2fpHvBhDAaeAfcKWigY1YcG43GvCKUxxGDN+zoZCehWK3n
 plbdqUFTHCVbOM5ucsob/VCsLot57OuRp3at4B1+4Z0rQmRthHCnbiaLIrKW6qyZTQJC
 NSMAO065n3+vBLqj3nJpHE/MR3rcz8ked4zCuVx/3PRdCZroMOhIL1g+7xOJEgM57FAU
 7n2sL3vIAZDpK6wL4Hch4aCERMcoqY8Kcpm166uMEAHEX3+QrLoIVCh/a3qRXvlO7Yx9
 n4TuCPc/1CqXQzcJ4ej3B51LT3u0/u68Ei/9hAHojvEFgvBbfbdvbrizgSTRWiM4EqZW
 ytPA==
X-Gm-Message-State: ANoB5pnCjZ88/nGp7oDO/DT9PwLvtG4/mndaf4JMiA3u8GDDTqMIt6zr
 /HXVDEmQ+kRicSGiYjgimUQ7w+e/HhU3SOh5
X-Google-Smtp-Source: AA0mqf57cQy0zqkUcJ4TIKJSqu4dfkzCxZj2cmFO8aY7Z5hPnN6/QEkJAyF5uiqBVQYUtOlBs34OLw==
X-Received: by 2002:a17:906:d0da:b0:7ad:9891:8756 with SMTP id
 bq26-20020a170906d0da00b007ad98918756mr57190191ejb.203.1669909392927; 
 Thu, 01 Dec 2022 07:43:12 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51]) by smtp.gmail.com with ESMTPSA id
 o12-20020aa7c50c000000b00468f7bb4895sm1861988edq.43.2022.12.01.07.43.12
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 07:43:12 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id x17so3319093wrn.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 Dec 2022 07:43:12 -0800 (PST)
X-Received: by 2002:a5d:4950:0:b0:242:1f80:6cd9 with SMTP id
 r16-20020a5d4950000000b002421f806cd9mr9556520wrs.405.1669909041754; Thu, 01
 Dec 2022 07:37:21 -0800 (PST)
MIME-Version: 1.0
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 1 Dec 2022 07:37:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VJ-YygjS9ukN8+hYxebUneFd-8=UEX3ZvSVQso7CGgng@mail.gmail.com>
Message-ID: <CAD=FV=VJ-YygjS9ukN8+hYxebUneFd-8=UEX3ZvSVQso7CGgng@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-Mailman-Approved-At: Mon, 05 Dec 2022 09:57:35 +0000
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, Conor Dooley <conor.dooley@microchip.com>,
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

SGksCgpPbiBXZWQsIE5vdiAzMCwgMjAyMiBhdCA3OjIyIEFNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1
LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gLmdldF9zdGF0ZSgpIG1p
Z2h0IGZhaWwgaW4gc29tZSBjYXNlcy4gVG8gbWFrZSBpdCBwb3NzaWJsZSB0aGF0IGEgZHJpdmVy
Cj4gc2lnbmFscyBzdWNoIGEgZmFpbHVyZSBjaGFuZ2UgdGhlIHByb3RvdHlwZSBvZiAuZ2V0X3N0
YXRlKCkgdG8gcmV0dXJuIGFuCj4gZXJyb3IgY29kZS4KPgo+IFRoaXMgcGF0Y2ggd2FzIGNyZWF0
ZWQgdXNpbmcgY29jY2luZWxsZSBhbmQgdGhlIGZvbGxvd2luZyBzZW1hbnRpYyBwYXRjaDoKPgo+
IEBwMUAKPiBpZGVudGlmaWVyIGdldHN0YXRlZnVuYzsKPiBpZGVudGlmaWVyIGRyaXZlcjsKPiBA
QAo+ICBzdHJ1Y3QgcHdtX29wcyBkcml2ZXIgPSB7Cj4gICAgICAgICAuLi4sCj4gICAgICAgICAu
Z2V0X3N0YXRlID0gZ2V0c3RhdGVmdW5jCj4gICAgICAgICAsLi4uCj4gIH07Cj4KPiBAcDJACj4g
aWRlbnRpZmllciBwMS5nZXRzdGF0ZWZ1bmM7Cj4gaWRlbnRpZmllciBjaGlwLCBwd20sIHN0YXRl
Owo+IEBACj4gLXZvaWQKPiAraW50Cj4gIGdldHN0YXRlZnVuYyhzdHJ1Y3QgcHdtX2NoaXAgKmNo
aXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sIHN0cnVjdCBwd21fc3RhdGUgKnN0YXRlKQo+ICB7
Cj4gICAgLi4uCj4gLSAgcmV0dXJuOwo+ICsgIHJldHVybiAwOwo+ICAgIC4uLgo+ICB9Cj4KPiBw
bHVzIHRoZSBhY3R1YWwgY2hhbmdlIG9mIHRoZSBwcm90b3R5cGUgaW4gaW5jbHVkZS9saW51eC9w
d20uaCAocGx1cyBzb21lCj4gbWFudWFsIGZpeGluZyBvZiBpbmRlbnRpb25zIGFuZCBlbXB0eSBs
aW5lcykuCj4KPiBTbyBmb3Igbm93IGFsbCBkcml2ZXJzIHJldHVybiBzdWNjZXNzIHVuY29uZGl0
aW9uYWxseS4gVGhleSBhcmUgYWRhcHRlZAo+IGluIHRoZSBmb2xsb3dpbmcgcGF0Y2hlcyB0byBt
YWtlIHRoZSBjaGFuZ2VzIGVhc2llciByZXZpZXdhYmxlLgo+Cj4gU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KPiAtLS0KPiAg
ZHJpdmVycy9ncGlvL2dwaW8tbXZlYnUuYyAgICAgICAgICAgICB8ICA5ICsrKysrKy0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jIHwgMTQgKysrKysrKystLS0tLS0K
PiAgZHJpdmVycy9sZWRzL3JnYi9sZWRzLXFjb20tbHBnLmMgICAgICB8IDE0ICsrKysrKysrLS0t
LS0tCj4gIGRyaXZlcnMvcHdtL3B3bS1hdG1lbC5jICAgICAgICAgICAgICAgfCAgNiArKysrLS0K
PiAgZHJpdmVycy9wd20vcHdtLWJjbS1pcHJvYy5jICAgICAgICAgICB8ICA4ICsrKysrLS0tCj4g
IGRyaXZlcnMvcHdtL3B3bS1jcmMuYyAgICAgICAgICAgICAgICAgfCAxMCArKysrKystLS0tCj4g
IGRyaXZlcnMvcHdtL3B3bS1jcm9zLWVjLmMgICAgICAgICAgICAgfCAgOCArKysrKy0tLQo+ICBk
cml2ZXJzL3B3bS9wd20tZHdjLmMgICAgICAgICAgICAgICAgIHwgIDYgKysrKy0tCj4gIGRyaXZl
cnMvcHdtL3B3bS1oaWJ2dC5jICAgICAgICAgICAgICAgfCAgNiArKysrLS0KPiAgZHJpdmVycy9w
d20vcHdtLWlteC10cG0uYyAgICAgICAgICAgICB8ICA4ICsrKysrLS0tCj4gIGRyaXZlcnMvcHdt
L3B3bS1pbXgyNy5jICAgICAgICAgICAgICAgfCAgOCArKysrKy0tLQo+ICBkcml2ZXJzL3B3bS9w
d20taW50ZWwtbGdtLmMgICAgICAgICAgIHwgIDYgKysrKy0tCj4gIGRyaXZlcnMvcHdtL3B3bS1p
cXM2MjBhLmMgICAgICAgICAgICAgfCAgNiArKysrLS0KPiAgZHJpdmVycy9wd20vcHdtLWtlZW1i
YXkuYyAgICAgICAgICAgICB8ICA2ICsrKystLQo+ICBkcml2ZXJzL3B3bS9wd20tbHBzcy5jICAg
ICAgICAgICAgICAgIHwgIDYgKysrKy0tCj4gIGRyaXZlcnMvcHdtL3B3bS1tZXNvbi5jICAgICAg
ICAgICAgICAgfCAgOCArKysrKy0tLQo+ICBkcml2ZXJzL3B3bS9wd20tbXRrLWRpc3AuYyAgICAg
ICAgICAgIHwgMTIgKysrKysrKy0tLS0tCj4gIGRyaXZlcnMvcHdtL3B3bS1wY2E5Njg1LmMgICAg
ICAgICAgICAgfCAgOCArKysrKy0tLQo+ICBkcml2ZXJzL3B3bS9wd20tcmFzcGJlcnJ5cGktcG9l
LmMgICAgIHwgIDggKysrKystLS0KPiAgZHJpdmVycy9wd20vcHdtLXJvY2tjaGlwLmMgICAgICAg
ICAgICB8IDEyICsrKysrKystLS0tLQo+ICBkcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMgICAgICAg
ICAgICAgIHwgIDYgKysrKy0tCj4gIGRyaXZlcnMvcHdtL3B3bS1zbDI4Y3BsZC5jICAgICAgICAg
ICAgfCAgOCArKysrKy0tLQo+ICBkcml2ZXJzL3B3bS9wd20tc3ByZC5jICAgICAgICAgICAgICAg
IHwgIDggKysrKystLS0KPiAgZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMgICAgICAgICAgICB8
ICA4ICsrKysrLS0tCj4gIGRyaXZlcnMvcHdtL3B3bS1zdW40aS5jICAgICAgICAgICAgICAgfCAx
MiArKysrKysrLS0tLS0KPiAgZHJpdmVycy9wd20vcHdtLXN1bnBsdXMuYyAgICAgICAgICAgICB8
ICA2ICsrKystLQo+ICBkcml2ZXJzL3B3bS9wd20tdmlzY29udGkuYyAgICAgICAgICAgIHwgIDYg
KysrKy0tCj4gIGRyaXZlcnMvcHdtL3B3bS14aWxpbnguYyAgICAgICAgICAgICAgfCAgOCArKysr
Ky0tLQo+ICBpbmNsdWRlL2xpbnV4L3B3bS5oICAgICAgICAgICAgICAgICAgIHwgIDQgKystLQo+
ICAyOSBmaWxlcyBjaGFuZ2VkLCAxNDYgaW5zZXJ0aW9ucygrKSwgODkgZGVsZXRpb25zKC0pCgpG
b3IgdGktc242NWRzaTg2LmM6CgpBY2tlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNA
Y2hyb21pdW0ub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
