Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 621E5A9F527
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Apr 2025 18:07:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B938C78011;
	Mon, 28 Apr 2025 16:07:52 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 289A0C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 16:07:50 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-73bb647eb23so4161646b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 09:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745856468; x=1746461268;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5sZqFf0pd/XIN1B2NzEquxW9LkBSgzNN2nMSHABe7I8=;
 b=oq8ujuENmAqsGtcrgmU7q47RTyexSPnwCl4t1HqhNhyGJb7MxtK3xc4LD6SLb3HYXo
 MqCR+P0vnWGVItfZo706c8hZgCgzTyGs+DvnY5MJsDcb9kccmjcYyi2K8C3HCB2/SaYH
 AEq6tnF6jvWFwXdUAXGRw7qCM+MfGVC9nnHSBYjWHN64GZy11CQ1SBifL7wkCMCDsENp
 vpJ6lguPJcLycv7bE2iA7KVRbxwEj0IeIayHDa2kQXSlan4bMJ2hC5Sf1bWvrnKTsD31
 h8U6MlrwZdv6SZtzmjkP3wJmngcCM/ms0rLtpNqKUG6S9WZEe66ji/w8IAUYd2MI+an1
 Gt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745856468; x=1746461268;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5sZqFf0pd/XIN1B2NzEquxW9LkBSgzNN2nMSHABe7I8=;
 b=TIUgmCj5SKWjv+dV2ao/L0++CsnL1yRiQjXie6HUlz5wjmeTsUs1GNwUo1W4AfMY9W
 z5qcgH8wHu2hyGv+G5b+xa9eFhWWwpQo5f0WgPoKjyoGE6BzDy2CVjW831PuQZNSo4cS
 OW7Mr9MCvrglyRB7YRZ+N4G+D4OJrcJa6ti5V8C0502D1U1bISDW/UqctgBEpOsXLozj
 CsX85ViXoSDREb8qzw4uVYVw50uPAZuxeD4KAxuPgNZxxQtp4YKOSuySs5wd1PINqy+d
 o99bulKMF5O9OOyze8zp63BXOLhClHD5CgPMY2yFyqxPh9X775xCrfLqBg9Qf/qAPxLf
 gL6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4NVQJEdIvh3FkRV4da9BOE8Rq0Smo9BlgXYsOvq5+vFkey0RhBrdPFHTTP76jvANmBUWjeCbC69C4bg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy/y0jdfdqo9ZKo7q8ZC7/bJ9qWXFwkMXGNn99Xygchaurq5nl8
 WDiYkrq1+h6NXBoY2kuKU2iTyb73nfgkNeuVjBJTpZxX7RlJQCq5YG+jqm86bQ==
X-Gm-Gg: ASbGncuLfjtMHa+S+pks5c2KG2LCyKGWUr//eSNfsZ954L35MYZcwlS7GwQ30uFDsjc
 W4GDylo5qrY3bNpH6+IcgIRxUiwIoFUsXWQKqSRcFTCp52hYThSxJ3sXQWlIXTk1LBBIQgRPKt5
 DWbpj0YzwFy771qqfvh+7OLQRPyFIXVTZI/OtU38Yf/tbY9xhrWT+SESHNiKgAJdaIsw6oq5m1w
 Wk2kHja6gFUd0SIZ5r+E4EgNaStDCb4ndmflIEtydgf+LmTiJud6PxjrdsuKW5DXp8Up2gV7Eoe
 3NrcRpo6NUA5ZBoye/v72beYiYG8iJKZoKTv7Mljf0KbpjdC6A==
X-Google-Smtp-Source: AGHT+IF0ND+g+mFXQq9lcsG6u5nnlgozZt0EphIl6/bHv3S/p1GH2+Y4vlSstnIZ/hRGR6y3aIC3NA==
X-Received: by 2002:a05:6a00:138e:b0:736:3c2f:acdd with SMTP id
 d2e1a72fcca58-73ff72d3d28mr12125481b3a.14.1745856468420; 
 Mon, 28 Apr 2025 09:07:48 -0700 (PDT)
Received: from thinkpad ([120.60.72.74]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25acc4casm8463484b3a.172.2025.04.28.09.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 09:07:47 -0700 (PDT)
Date: Mon, 28 Apr 2025 21:37:38 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <ild3eqfgiez4zgtxcha6ki3udfxzdiqeywvwzh7rfympgfps7o@m6h4v5kxhq63>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
 <20250424-gpiochip-set-rv-pinctrl-part2-v1-4-504f91120b99@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-4-504f91120b99@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Cercueil <paul@crapouillou.net>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-mips@vger.kernel.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 Gregory Clement <gregory.clement@bootlin.com>, linux-kernel@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, UNGLinuxDriver@microchip.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH 04/12] pinctrl: owl: use new GPIO line
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgMTA6MzU6MjdBTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3
c2tpQGxpbmFyby5vcmc+Cj4gCj4gc3RydWN0IGdwaW9fY2hpcCBub3cgaGFzIGNhbGxiYWNrcyBm
b3Igc2V0dGluZyBsaW5lIHZhbHVlcyB0aGF0IHJldHVybgo+IGFuIGludGVnZXIsIGFsbG93aW5n
IHRvIGluZGljYXRlIGZhaWx1cmVzLiBDb252ZXJ0IHRoZSBkcml2ZXIgdG8gdXNpbmcKPiB0aGVt
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6
ZXdza2lAbGluYXJvLm9yZz4KCkFja2VkLWJ5OiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2
YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPgoKLSBNYW5pCgo+IC0tLQo+ICBkcml2ZXJzL3Bp
bmN0cmwvYWN0aW9ucy9waW5jdHJsLW93bC5jIHwgOCArKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3BpbmN0cmwvYWN0aW9ucy9waW5jdHJsLW93bC5jIGIvZHJpdmVycy9waW5jdHJsL2FjdGlv
bnMvcGluY3RybC1vd2wuYwo+IGluZGV4IGQ0OWI3N2RjZmNmZi4uODZmM2Q1YzY5ZTM2IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9hY3Rpb25zL3BpbmN0cmwtb3dsLmMKPiArKysgYi9k
cml2ZXJzL3BpbmN0cmwvYWN0aW9ucy9waW5jdHJsLW93bC5jCj4gQEAgLTU5OCw3ICs1OTgsNyBA
QCBzdGF0aWMgaW50IG93bF9ncGlvX2dldChzdHJ1Y3QgZ3Bpb19jaGlwICpjaGlwLCB1bnNpZ25l
ZCBpbnQgb2Zmc2V0KQo+ICAJcmV0dXJuICEhKHZhbCAmIEJJVChvZmZzZXQpKTsKPiAgfQo+ICAK
PiAtc3RhdGljIHZvaWQgb3dsX2dwaW9fc2V0KHN0cnVjdCBncGlvX2NoaXAgKmNoaXAsIHVuc2ln
bmVkIGludCBvZmZzZXQsIGludCB2YWx1ZSkKPiArc3RhdGljIGludCBvd2xfZ3Bpb19zZXQoc3Ry
dWN0IGdwaW9fY2hpcCAqY2hpcCwgdW5zaWduZWQgaW50IG9mZnNldCwgaW50IHZhbHVlKQo+ICB7
Cj4gIAlzdHJ1Y3Qgb3dsX3BpbmN0cmwgKnBjdHJsID0gZ3Bpb2NoaXBfZ2V0X2RhdGEoY2hpcCk7
Cj4gIAljb25zdCBzdHJ1Y3Qgb3dsX2dwaW9fcG9ydCAqcG9ydDsKPiBAQCAtNjA3LDEzICs2MDcs
MTUgQEAgc3RhdGljIHZvaWQgb3dsX2dwaW9fc2V0KHN0cnVjdCBncGlvX2NoaXAgKmNoaXAsIHVu
c2lnbmVkIGludCBvZmZzZXQsIGludCB2YWx1ZSkKPiAgCj4gIAlwb3J0ID0gb3dsX2dwaW9fZ2V0
X3BvcnQocGN0cmwsICZvZmZzZXQpOwo+ICAJaWYgKFdBUk5fT04ocG9ydCA9PSBOVUxMKSkKPiAt
CQlyZXR1cm47Cj4gKwkJcmV0dXJuIC1FTk9ERVY7Cj4gIAo+ICAJZ3Bpb19iYXNlID0gcGN0cmwt
PmJhc2UgKyBwb3J0LT5vZmZzZXQ7Cj4gIAo+ICAJcmF3X3NwaW5fbG9ja19pcnFzYXZlKCZwY3Ry
bC0+bG9jaywgZmxhZ3MpOwo+ICAJb3dsX2dwaW9fdXBkYXRlX3JlZyhncGlvX2Jhc2UgKyBwb3J0
LT5kYXQsIG9mZnNldCwgdmFsdWUpOwo+ICAJcmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnBj
dHJsLT5sb2NrLCBmbGFncyk7Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gIHN0YXRpYyBp
bnQgb3dsX2dwaW9fZGlyZWN0aW9uX2lucHV0KHN0cnVjdCBncGlvX2NoaXAgKmNoaXAsIHVuc2ln
bmVkIGludCBvZmZzZXQpCj4gQEAgLTk2MCw3ICs5NjIsNyBAQCBpbnQgb3dsX3BpbmN0cmxfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKPiAgCXBjdHJsLT5jaGlwLmRpcmVjdGlv
bl9pbnB1dCAgPSBvd2xfZ3Bpb19kaXJlY3Rpb25faW5wdXQ7Cj4gIAlwY3RybC0+Y2hpcC5kaXJl
Y3Rpb25fb3V0cHV0ID0gb3dsX2dwaW9fZGlyZWN0aW9uX291dHB1dDsKPiAgCXBjdHJsLT5jaGlw
LmdldCA9IG93bF9ncGlvX2dldDsKPiAtCXBjdHJsLT5jaGlwLnNldCA9IG93bF9ncGlvX3NldDsK
PiArCXBjdHJsLT5jaGlwLnNldF9ydiA9IG93bF9ncGlvX3NldDsKPiAgCXBjdHJsLT5jaGlwLnJl
cXVlc3QgPSBvd2xfZ3Bpb19yZXF1ZXN0Owo+ICAJcGN0cmwtPmNoaXAuZnJlZSA9IG93bF9ncGlv
X2ZyZWU7Cj4gIAo+IAo+IC0tIAo+IDIuNDUuMgo+IAoKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCu
o+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
