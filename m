Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC0763F06A
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Dec 2022 13:25:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CCC1C65E59;
	Thu,  1 Dec 2022 12:25:38 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22838C63326
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Dec 2022 08:03:49 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id q7so1361634wrr.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 Dec 2022 00:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=RAIQbbxtK2nJ1NbUghrZ93yJMEm2LyReQuktQwQ+yXw=;
 b=Lo8p+aDFlKlZfG6pP0n7RZNEjwZK+wrouNetRK3rZv63MbeCUctT1ieDjkKZxl3LvQ
 1IUxcYuylIWjoy7vKgfrNL5bEmzdei5+43ayKtzqRIyOjWYlsoDieQD7IgspPDeYN4Rg
 g0Tg2r6urLUhUddkFA8F1g+Y6MZ6LYzNVPQKNUdc62bCqGXALe+tEuJdy6U6nHFQ1VTs
 pd9A/smgMPI5kbQN+yqEnGZNPKCbNRwE4VhlqdS4p01McAPr9GKRJDIzQjVNyphai7am
 M+pt/qh8ja70rWDWaq5xcHGdzPkZEr0JVoVeIN0FLdIf+5vnAZEi/TDzF6dIxj4puvKU
 V1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RAIQbbxtK2nJ1NbUghrZ93yJMEm2LyReQuktQwQ+yXw=;
 b=eqo1Whlak/pVjCt5EI6XHQ/j5J6CoVTsDuTbPSdRScL8r6Z/2rVMKbSsPon0EeG4iP
 Pt+vCqgudSI8eMn9oYABMXbldOT7XJjlv72FcWsgFDrTVNN761kSedk9mMpIkG0neQz1
 Zk6NJksWdjx5IUcKX8k419/1M7QqYqS6Yb0+4YvTB2MbJvepFdob9nH6X94v9eaeupjI
 akdSW+hWE378wL3KxgSOR9d1griob3BSVxlb+zS0i4aPsfEy6TDwByghdET65rU5pTpW
 MiBywCTCKBGau/D3snjBc6qCiarV5xhM+jPedH+STpzTkxlEfhM8UJEGYp4VZX0bSd62
 rG/g==
X-Gm-Message-State: ANoB5plmcJBaI2iwU3ijz+yHtUKs/wLC+tdLkZd6nmtJ7hqzJqQGDCmy
 bPdTvRnHbYpJHENDRAgMnj4Lyg==
X-Google-Smtp-Source: AA0mqf54lvafHdVKKM2CGBzb3Ly91fbeS37TZTU/o75hgaix+kcG2rGxchFiaWC/vEjl7eP4KzxYJQ==
X-Received: by 2002:a05:6000:1d92:b0:241:6e0a:bfe6 with SMTP id
 bk18-20020a0560001d9200b002416e0abfe6mr31726074wrb.34.1669881828568; 
 Thu, 01 Dec 2022 00:03:48 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bec0:73a:70e1:228f?
 ([2a01:e0a:982:cbb0:bec0:73a:70e1:228f])
 by smtp.gmail.com with ESMTPSA id
 az39-20020a05600c602700b003cf78aafdd7sm4517313wmb.39.2022.12.01.00.03.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 00:03:48 -0800 (PST)
Message-ID: <b19c4956-3f92-f6be-7d61-9b826e5d6fe1@linaro.org>
Date: Thu, 1 Dec 2022 09:03:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
X-Mailman-Approved-At: Thu, 01 Dec 2022 12:25:36 +0000
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>,
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
 Douglas Anderson <dianders@chromium.org>, Michael Walle <michael@walle.cc>,
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMzAvMTEvMjAyMiAxNjoyMSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gLmdldF9zdGF0
ZSgpIG1pZ2h0IGZhaWwgaW4gc29tZSBjYXNlcy4gVG8gbWFrZSBpdCBwb3NzaWJsZSB0aGF0IGEg
ZHJpdmVyCj4gc2lnbmFscyBzdWNoIGEgZmFpbHVyZSBjaGFuZ2UgdGhlIHByb3RvdHlwZSBvZiAu
Z2V0X3N0YXRlKCkgdG8gcmV0dXJuIGFuCj4gZXJyb3IgY29kZS4KPiAKPiBUaGlzIHBhdGNoIHdh
cyBjcmVhdGVkIHVzaW5nIGNvY2NpbmVsbGUgYW5kIHRoZSBmb2xsb3dpbmcgc2VtYW50aWMgcGF0
Y2g6Cj4gCj4gQHAxQAo+IGlkZW50aWZpZXIgZ2V0c3RhdGVmdW5jOwo+IGlkZW50aWZpZXIgZHJp
dmVyOwo+IEBACj4gICBzdHJ1Y3QgcHdtX29wcyBkcml2ZXIgPSB7Cj4gICAgICAgICAgLi4uLAo+
ICAgICAgICAgIC5nZXRfc3RhdGUgPSBnZXRzdGF0ZWZ1bmMKPiAgICAgICAgICAsLi4uCj4gICB9
Owo+IAo+IEBwMkAKPiBpZGVudGlmaWVyIHAxLmdldHN0YXRlZnVuYzsKPiBpZGVudGlmaWVyIGNo
aXAsIHB3bSwgc3RhdGU7Cj4gQEAKPiAtdm9pZAo+ICtpbnQKPiAgIGdldHN0YXRlZnVuYyhzdHJ1
Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sIHN0cnVjdCBwd21fc3Rh
dGUgKnN0YXRlKQo+ICAgewo+ICAgICAuLi4KPiAtICByZXR1cm47Cj4gKyAgcmV0dXJuIDA7Cj4g
ICAgIC4uLgo+ICAgfQo+IAo+IHBsdXMgdGhlIGFjdHVhbCBjaGFuZ2Ugb2YgdGhlIHByb3RvdHlw
ZSBpbiBpbmNsdWRlL2xpbnV4L3B3bS5oIChwbHVzIHNvbWUKPiBtYW51YWwgZml4aW5nIG9mIGlu
ZGVudGlvbnMgYW5kIGVtcHR5IGxpbmVzKS4KPiAKPiBTbyBmb3Igbm93IGFsbCBkcml2ZXJzIHJl
dHVybiBzdWNjZXNzIHVuY29uZGl0aW9uYWxseS4gVGhleSBhcmUgYWRhcHRlZAo+IGluIHRoZSBm
b2xsb3dpbmcgcGF0Y2hlcyB0byBtYWtlIHRoZSBjaGFuZ2VzIGVhc2llciByZXZpZXdhYmxlLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVu
Z3V0cm9uaXguZGU+Cj4gLS0tCj4gICBkcml2ZXJzL2dwaW8vZ3Bpby1tdmVidS5jICAgICAgICAg
ICAgIHwgIDkgKysrKysrLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4
Ni5jIHwgMTQgKysrKysrKystLS0tLS0KPiAgIGRyaXZlcnMvbGVkcy9yZ2IvbGVkcy1xY29tLWxw
Zy5jICAgICAgfCAxNCArKysrKysrKy0tLS0tLQo+ICAgZHJpdmVycy9wd20vcHdtLWF0bWVsLmMg
ICAgICAgICAgICAgICB8ICA2ICsrKystLQo+ICAgZHJpdmVycy9wd20vcHdtLWJjbS1pcHJvYy5j
ICAgICAgICAgICB8ICA4ICsrKysrLS0tCj4gICBkcml2ZXJzL3B3bS9wd20tY3JjLmMgICAgICAg
ICAgICAgICAgIHwgMTAgKysrKysrLS0tLQo+ICAgZHJpdmVycy9wd20vcHdtLWNyb3MtZWMuYyAg
ICAgICAgICAgICB8ICA4ICsrKysrLS0tCj4gICBkcml2ZXJzL3B3bS9wd20tZHdjLmMgICAgICAg
ICAgICAgICAgIHwgIDYgKysrKy0tCj4gICBkcml2ZXJzL3B3bS9wd20taGlidnQuYyAgICAgICAg
ICAgICAgIHwgIDYgKysrKy0tCj4gICBkcml2ZXJzL3B3bS9wd20taW14LXRwbS5jICAgICAgICAg
ICAgIHwgIDggKysrKystLS0KPiAgIGRyaXZlcnMvcHdtL3B3bS1pbXgyNy5jICAgICAgICAgICAg
ICAgfCAgOCArKysrKy0tLQo+ICAgZHJpdmVycy9wd20vcHdtLWludGVsLWxnbS5jICAgICAgICAg
ICB8ICA2ICsrKystLQo+ICAgZHJpdmVycy9wd20vcHdtLWlxczYyMGEuYyAgICAgICAgICAgICB8
ICA2ICsrKystLQo+ICAgZHJpdmVycy9wd20vcHdtLWtlZW1iYXkuYyAgICAgICAgICAgICB8ICA2
ICsrKystLQo+ICAgZHJpdmVycy9wd20vcHdtLWxwc3MuYyAgICAgICAgICAgICAgICB8ICA2ICsr
KystLQo+ICAgZHJpdmVycy9wd20vcHdtLW1lc29uLmMgICAgICAgICAgICAgICB8ICA4ICsrKysr
LS0tCj4gICBkcml2ZXJzL3B3bS9wd20tbXRrLWRpc3AuYyAgICAgICAgICAgIHwgMTIgKysrKysr
Ky0tLS0tCj4gICBkcml2ZXJzL3B3bS9wd20tcGNhOTY4NS5jICAgICAgICAgICAgIHwgIDggKysr
KystLS0KPiAgIGRyaXZlcnMvcHdtL3B3bS1yYXNwYmVycnlwaS1wb2UuYyAgICAgfCAgOCArKysr
Ky0tLQo+ICAgZHJpdmVycy9wd20vcHdtLXJvY2tjaGlwLmMgICAgICAgICAgICB8IDEyICsrKysr
KystLS0tLQo+ICAgZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jICAgICAgICAgICAgICB8ICA2ICsr
KystLQo+ICAgZHJpdmVycy9wd20vcHdtLXNsMjhjcGxkLmMgICAgICAgICAgICB8ICA4ICsrKysr
LS0tCj4gICBkcml2ZXJzL3B3bS9wd20tc3ByZC5jICAgICAgICAgICAgICAgIHwgIDggKysrKyst
LS0KPiAgIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jICAgICAgICAgICAgfCAgOCArKysrKy0t
LQo+ICAgZHJpdmVycy9wd20vcHdtLXN1bjRpLmMgICAgICAgICAgICAgICB8IDEyICsrKysrKyst
LS0tLQo+ICAgZHJpdmVycy9wd20vcHdtLXN1bnBsdXMuYyAgICAgICAgICAgICB8ICA2ICsrKyst
LQo+ICAgZHJpdmVycy9wd20vcHdtLXZpc2NvbnRpLmMgICAgICAgICAgICB8ICA2ICsrKystLQo+
ICAgZHJpdmVycy9wd20vcHdtLXhpbGlueC5jICAgICAgICAgICAgICB8ICA4ICsrKysrLS0tCj4g
ICBpbmNsdWRlL2xpbnV4L3B3bS5oICAgICAgICAgICAgICAgICAgIHwgIDQgKystLQo+ICAgMjkg
ZmlsZXMgY2hhbmdlZCwgMTQ2IGluc2VydGlvbnMoKyksIDg5IGRlbGV0aW9ucygtKQo+IAoKPHNu
aXA+Cgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tbWVzb24uYyBiL2RyaXZlcnMvcHdt
L3B3bS1tZXNvbi5jCj4gaW5kZXggNTcxMTJmNDM4YzZkLi4xNmQ3OWNhNWQ4ZjUgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKPiArKysgYi9kcml2ZXJzL3B3bS9wd20tbWVz
b24uYwo+IEBAIC0zMTgsOCArMzE4LDggQEAgc3RhdGljIHVuc2lnbmVkIGludCBtZXNvbl9wd21f
Y250X3RvX25zKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwKPiAgIAlyZXR1cm4gY250ICogZmluX25z
ICogKGNoYW5uZWwtPnByZV9kaXYgKyAxKTsKPiAgIH0KPiAgIAo+IC1zdGF0aWMgdm9pZCBtZXNv
bl9wd21fZ2V0X3N0YXRlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2Ug
KnB3bSwKPiAtCQkJCXN0cnVjdCBwd21fc3RhdGUgKnN0YXRlKQo+ICtzdGF0aWMgaW50IG1lc29u
X3B3bV9nZXRfc3RhdGUoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAq
cHdtLAo+ICsJCQkgICAgICAgc3RydWN0IHB3bV9zdGF0ZSAqc3RhdGUpCj4gICB7Cj4gICAJc3Ry
dWN0IG1lc29uX3B3bSAqbWVzb24gPSB0b19tZXNvbl9wd20oY2hpcCk7Cj4gICAJc3RydWN0IG1l
c29uX3B3bV9jaGFubmVsX2RhdGEgKmNoYW5uZWxfZGF0YTsKPiBAQCAtMzI3LDcgKzMyNyw3IEBA
IHN0YXRpYyB2b2lkIG1lc29uX3B3bV9nZXRfc3RhdGUoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBz
dHJ1Y3QgcHdtX2RldmljZSAqcHdtLAo+ICAgCXUzMiB2YWx1ZSwgdG1wOwo+ICAgCj4gICAJaWYg
KCFzdGF0ZSkKPiAtCQlyZXR1cm47Cj4gKwkJcmV0dXJuIDA7Cj4gICAKPiAgIAljaGFubmVsID0g
Jm1lc29uLT5jaGFubmVsc1twd20tPmh3cHdtXTsKPiAgIAljaGFubmVsX2RhdGEgPSAmbWVzb25f
cHdtX3Blcl9jaGFubmVsX2RhdGFbcHdtLT5od3B3bV07Cj4gQEAgLTM1Nyw2ICszNTcsOCBAQCBz
dGF0aWMgdm9pZCBtZXNvbl9wd21fZ2V0X3N0YXRlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3Ry
dWN0IHB3bV9kZXZpY2UgKnB3bSwKPiAgIAkJc3RhdGUtPnBlcmlvZCA9IDA7Cj4gICAJCXN0YXRl
LT5kdXR5X2N5Y2xlID0gMDsKPiAgIAl9Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gICB9Cj4gICAKPiAg
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHdtX29wcyBtZXNvbl9wd21fb3BzID0gewoKPHNuaXA+CgpG
b3IgcHdtLW1lc29uOgoKUmV2aWV3ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9u
Z0BsaW5hcm8ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
