Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E46DCA9B591
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 19:43:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 985A5C78F70;
	Thu, 24 Apr 2025 17:43:29 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAFCCC78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 17:43:27 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-54e7967cf67so1492496e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 10:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745516602; x=1746121402;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PmRnlbEicfo57AAZvezn0z0uuZ1cfiLTFbR9RI0t2I8=;
 b=suQLKZoFrmF8POKUSxmDgcO39bRuyz3s0eCEdwcsc/oVwEdbPRmXJfMgH+FfwRksFt
 F6L4GSiaFvnmVldb9n6hgp9Qn3FNWu+9hCI3Wf9H+BSfymPdgM09ux1cTotWyDbN2sQ0
 bkXJ99T9VdqC3SCsMehLxOAEvVrxGrGUMKDmUvreMfpjNVbe1aqIWQlDKcpV+1BLYRIm
 PmgZYnwex5T5N02FBR+zbknj71PMAjiBocAxjB3fMN4WmhdfYdBUVdjId2b3Ld9iT8FF
 bj/T+O/mNym30Aks7okoQSVO5FRep2xwxcAXRhJbt53qN8PTmrRuNyoyWCHpZUgmgFnB
 Y4kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW36IewPm3W3sHvu3PYsnojxWjlBLO5KDPbK9jZiQnMVGcXpc3D8/UFKX/7lXncRcB5dFarXfkMEW5vtw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxpn641pfp0vqN8FbrWxKZrwIWN9RqYAPKk63hof6+RI/1e+Dsb
 jLwmMxmEqt2IwNLHx4CDTdzolaWIwiEmMNi8kWRCjBWUd/MYGIQAPub5REWn
X-Gm-Gg: ASbGncvwyFrH4qjwMlRlVgplA+AxyTxcbiclmO/CIXFNRzUw/V2IAaFJ2p1lWjU9OB5
 Uw8DWAJ4fRpJ3NKTZjg+FmTtWlA9pBNidLTm1/bP++EgiUwYxUp0sNTk86CXqoEqdBg4+KVP3q5
 SU6ABKMYtoQoHW5EAlIyw7Gmaj1s0yl8jsugM2PABhycLQ/LebxiZsMEASxidXwK5CdTrN2EDFQ
 Q5Z63ezUZfI+11RGerQo6lN61uui2p/CYPTUi6RykNxo/Vug/wV7Dj0NZ5zPlJEJp3UVc22ytkM
 YhUAd1nW+XGUyN5o7neFftQ1SS8dHcSzRwFkIJns8WT8Cps0OvYmFMvBfPTeOdfzGyc9yjO04J1
 qUR30
X-Google-Smtp-Source: AGHT+IHJaXQFHrDu9bzhgXX+omF7nHz++kMD7Tbbrgd6Biz/RXujoh+xvaINiyK1bQmMqHE9JGrmRQ==
X-Received: by 2002:a05:6512:2310:b0:540:2fd2:6c87 with SMTP id
 2adb3069b0e04-54e8977aeb9mr70122e87.16.1745516601808; 
 Thu, 24 Apr 2025 10:43:21 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb408f5sm307186e87.104.2025.04.24.10.43.20
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 10:43:20 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-54e7967cf67so1492374e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 10:43:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVGRleGl7jb5fdUhx+/VBpMsg4sp4fgIlH7KLvAatqsHsFwG9TB8q5WdhWkDlj2k+df7vXdJGxg/lq2eA==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6512:2310:b0:540:2fd2:6c87 with SMTP id
 2adb3069b0e04-54e8977aeb9mr70103e87.16.1745516600353; Thu, 24 Apr 2025
 10:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
 <20250424-gpiochip-set-rv-pinctrl-part2-v1-2-504f91120b99@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-2-504f91120b99@linaro.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Apr 2025 01:43:07 +0800
X-Gmail-Original-Message-ID: <CAGb2v67jH2G_i51fg3T7qu2dDtj7FqUO7q9pBJJw_uKhdGV6uQ@mail.gmail.com>
X-Gm-Features: ATxdqUHeMGKXwILdemaV4iIduxoy9n-SC7kRH607ob8j4Z0cm-iXg78WkqCwkx4
Message-ID: <CAGb2v67jH2G_i51fg3T7qu2dDtj7FqUO7q9pBJJw_uKhdGV6uQ@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>, Alim Akhtar <alim.akhtar@samsung.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-mips@vger.kernel.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 Gregory Clement <gregory.clement@bootlin.com>, linux-kernel@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, UNGLinuxDriver@microchip.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH 02/12] pinctrl: axp209: use new GPIO line
	value setter callbacks
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
Reply-To: wens@csie.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgNDozNeKAr1BNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAYmdkZXYucGw+IHdyb3RlOgo+Cj4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9z
ei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+Cj4gc3RydWN0IGdwaW9fY2hpcCBub3cgaGFzIGNh
bGxiYWNrcyBmb3Igc2V0dGluZyBsaW5lIHZhbHVlcyB0aGF0IHJldHVybgo+IGFuIGludGVnZXIs
IGFsbG93aW5nIHRvIGluZGljYXRlIGZhaWx1cmVzLiBDb252ZXJ0IHRoZSBkcml2ZXIgdG8gdXNp
bmcKPiB0aGVtLgo+Cj4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9z
ei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL3BpbmN0cmwvcGluY3Ry
bC1heHAyMDkuYyB8IDI5ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3BpbmN0cmwvcGluY3RybC1heHAyMDkuYyBiL2RyaXZlcnMvcGluY3RybC9waW5j
dHJsLWF4cDIwOS5jCj4gaW5kZXggMmI0ODA1ZTc0ZWVkLi4yOGZmODQ2ZDI2M2EgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtYXhwMjA5LmMKPiArKysgYi9kcml2ZXJzL3Bp
bmN0cmwvcGluY3RybC1heHAyMDkuYwo+IEBAIC0xOTIsMzQgKzE5MiwzMSBAQCBzdGF0aWMgaW50
IGF4cDIweF9ncGlvX2dldF9kaXJlY3Rpb24oc3RydWN0IGdwaW9fY2hpcCAqY2hpcCwKPiAgc3Rh
dGljIGludCBheHAyMHhfZ3Bpb19vdXRwdXQoc3RydWN0IGdwaW9fY2hpcCAqY2hpcCwgdW5zaWdu
ZWQgaW50IG9mZnNldCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgdmFsdWUp
Cj4gIHsKPiAtICAgICAgIGNoaXAtPnNldChjaGlwLCBvZmZzZXQsIHZhbHVlKTsKPiAtCj4gLSAg
ICAgICByZXR1cm4gMDsKPiArICAgICAgIHJldHVybiBjaGlwLT5zZXRfcnYoY2hpcCwgb2Zmc2V0
LCB2YWx1ZSk7Cj4gIH0KPgo+IC1zdGF0aWMgdm9pZCBheHAyMHhfZ3Bpb19zZXQoc3RydWN0IGdw
aW9fY2hpcCAqY2hpcCwgdW5zaWduZWQgaW50IG9mZnNldCwKPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaW50IHZhbHVlKQo+ICtzdGF0aWMgaW50IGF4cDIweF9ncGlvX3NldChzdHJ1Y3Qg
Z3Bpb19jaGlwICpjaGlwLCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgIGludCB2YWx1ZSkKPiAgewo+ICAgICAgICAgc3RydWN0IGF4cDIweF9wY3RsICpw
Y3RsID0gZ3Bpb2NoaXBfZ2V0X2RhdGEoY2hpcCk7Cj4gICAgICAgICBpbnQgcmVnOwo+Cj4gICAg
ICAgICAvKiBBWFAyMDkgaGFzIEdQSU8zIHN0YXR1cyBzaGFyaW5nIHRoZSBzZXR0aW5ncyByZWdp
c3RlciAqLwo+ICAgICAgICAgaWYgKG9mZnNldCA9PSAzKSB7Cj4gLSAgICAgICAgICAgICAgIHJl
Z21hcF91cGRhdGVfYml0cyhwY3RsLT5yZWdtYXAsIEFYUDIwWF9HUElPM19DVFJMLAo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQVhQMjBYX0dQSU8zX0ZVTkNUSU9OUywKPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZhbHVlID8gQVhQMjBYX0dQSU8zX0ZV
TkNUSU9OX09VVF9ISUdIIDoKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFY
UDIwWF9HUElPM19GVU5DVElPTl9PVVRfTE9XKTsKPiAtICAgICAgICAgICAgICAgcmV0dXJuOwo+
ICsgICAgICAgICAgICAgICByZXR1cm4gcmVnbWFwX3VwZGF0ZV9iaXRzKHBjdGwtPnJlZ21hcCwg
QVhQMjBYX0dQSU8zX0NUUkwsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgQVhQMjBYX0dQSU8zX0ZVTkNUSU9OUywKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB2YWx1ZSA/Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgQVhQMjBYX0dQSU8zX0ZVTkNUSU9OX09VVF9ISUdIIDoKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBWFAyMFhfR1BJTzNf
RlVOQ1RJT05fT1VUX0xPVyk7Cj4gICAgICAgICB9CgpJIGd1ZXNzIHlvdSBjb3VsZCBhbHNvIGRy
b3AgdGhlIGN1cmx5IGJyYWNlcywgYnV0IG90aGVyd2lzZQoKUmV2aWV3ZWQtYnk6IENoZW4tWXUg
VHNhaSA8d2Vuc0Bjc2llLm9yZz4KCj4KPiAgICAgICAgIHJlZyA9IGF4cDIweF9ncGlvX2dldF9y
ZWcob2Zmc2V0KTsKPiAgICAgICAgIGlmIChyZWcgPCAwKQo+IC0gICAgICAgICAgICAgICByZXR1
cm47Cj4gKyAgICAgICAgICAgICAgIHJldHVybiByZWc7Cj4KPiAtICAgICAgIHJlZ21hcF91cGRh
dGVfYml0cyhwY3RsLT5yZWdtYXAsIHJlZywKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICBB
WFAyMFhfR1BJT19GVU5DVElPTlMsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgdmFsdWUg
PyBBWFAyMFhfR1BJT19GVU5DVElPTl9PVVRfSElHSCA6Cj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgQVhQMjBYX0dQSU9fRlVOQ1RJT05fT1VUX0xPVyk7Cj4gKyAgICAgICByZXR1cm4gcmVn
bWFwX3VwZGF0ZV9iaXRzKHBjdGwtPnJlZ21hcCwgcmVnLCBBWFAyMFhfR1BJT19GVU5DVElPTlMs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZhbHVlID8gQVhQMjBYX0dQSU9f
RlVOQ1RJT05fT1VUX0hJR0ggOgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIEFYUDIwWF9HUElPX0ZVTkNUSU9OX09VVF9MT1cpOwo+ICB9Cj4KPiAgc3RhdGljIGlu
dCBheHAyMHhfcG14X3NldChzdHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYsIHVuc2lnbmVkIGlu
dCBvZmZzZXQsCj4gQEAgLTQ2OCw3ICs0NjUsNyBAQCBzdGF0aWMgaW50IGF4cDIweF9wY3RsX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAgICAgICBwY3RsLT5jaGlwLm93
bmVyICAgICAgICAgICAgICAgID0gVEhJU19NT0RVTEU7Cj4gICAgICAgICBwY3RsLT5jaGlwLmdl
dCAgICAgICAgICAgICAgICAgID0gYXhwMjB4X2dwaW9fZ2V0Owo+ICAgICAgICAgcGN0bC0+Y2hp
cC5nZXRfZGlyZWN0aW9uICAgICAgICA9IGF4cDIweF9ncGlvX2dldF9kaXJlY3Rpb247Cj4gLSAg
ICAgICBwY3RsLT5jaGlwLnNldCAgICAgICAgICAgICAgICAgID0gYXhwMjB4X2dwaW9fc2V0Owo+
ICsgICAgICAgcGN0bC0+Y2hpcC5zZXRfcnYgICAgICAgICAgICAgICA9IGF4cDIweF9ncGlvX3Nl
dDsKPiAgICAgICAgIHBjdGwtPmNoaXAuZGlyZWN0aW9uX2lucHV0ICAgICAgPSBwaW5jdHJsX2dw
aW9fZGlyZWN0aW9uX2lucHV0Owo+ICAgICAgICAgcGN0bC0+Y2hpcC5kaXJlY3Rpb25fb3V0cHV0
ICAgICA9IGF4cDIweF9ncGlvX291dHB1dDsKPgo+Cj4gLS0KPiAyLjQ1LjIKPgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
