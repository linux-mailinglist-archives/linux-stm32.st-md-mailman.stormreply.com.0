Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBE76D2217
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 16:11:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A609EC69069;
	Fri, 31 Mar 2023 14:11:31 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B461CC6904F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 14:11:30 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id d2so19238610vso.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 07:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1680271889;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lG/WYsq29l19IPVJ1k1HveeXpXEw8n6whXP0RBXQsVE=;
 b=EvtZrKsNbHzwyuTtRqHQROrrofpQ/sG01uOiuhmiI8aPts7n7Ee5Ir4NvfrBMC9uI+
 rP59rZDcNbSrbcJgAHZuzWOVqM440qSkPSsXQam8gLhm6JrqARMEWp7hP37azlVW4org
 fBACV9jHeMc/fcIgXarc7w17iylr7tNHGmieksiQNlIzpXJ80+yWU+CJGHU8lpI3k2C8
 ICYW0V27W/2DBLWul+Ja7q7aEtfylH/JCpUFcy+E+zrhYwff5tk/+w+43pgclTvoUdaY
 JKB3eTBzT085pwnm7cEdG1xRDF3HVWkUIWkzjjSc40AzCnbk/tZvpSB9Tq3T3RIS9CKy
 06FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680271889;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lG/WYsq29l19IPVJ1k1HveeXpXEw8n6whXP0RBXQsVE=;
 b=WX3coPyuey0MwewGl0EyjkoWa8t4vAvxKaYCo1oN//v5GSIuUK4247Yc6qKu/Xunkp
 SM5iqbis4i8xzpWkitoB5KYj70OMwLgNd2dDuCK7s0dRD74j7P/yK9lpZsqmE7zeWsHt
 D/u9wLtYlztIWNONHivOtYkvBkSjAtgd0TWwpRqL/OrkN4Ar0FH/MGR4ZKTsN3J/0tyq
 PCHvtzCZXC+Hz8dz+1vESjZNWwGDCN7ld8+Vr8QVKCrv7xIgynvnyzdzXtGojsERuCrh
 yZC7kOsD7hmdli2bWQtQhkvinxepcIHrGIg9DP0lXA0w7mVRgoxClTT7lcDX/6w1EaVB
 pR6g==
X-Gm-Message-State: AAQBX9c7Z+nUzbSFoSRRMKVLKZLVHPsifB04DbRY/O0AcrTyQcB1WDnm
 pLdrPQo4LhQK+pKJylNs4p+WeS5O+QujRVhJubC0uw==
X-Google-Smtp-Source: AKy350Ya9O0j2IJ/iXVAszn5aY9fHDH1jV5pYhAfg5ER4OEHtZmmlP21NIaPy6SQjGvX406cL1yK9LBdk5p7JcyHINc=
X-Received: by 2002:a67:e095:0:b0:426:b051:1c4 with SMTP id
 f21-20020a67e095000000b00426b05101c4mr9141092vsl.0.1680271889495; Fri, 31 Mar
 2023 07:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
 <20230331-topic-oxnas-upstream-remove-v1-15-5bd58fd1dd1f@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-15-5bd58fd1dd1f@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 31 Mar 2023 16:11:18 +0200
Message-ID: <CAMRc=Mdp48+DitzSV5gq3arPL75TJXQLoBxTujsWSH4UVpd2ww@mail.gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-clk@vger.kernel.org,
 Richard Weinberger <richard@nod.at>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Michael Turquette <mturquette@baylibre.com>,
 devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Olof Johansson <olof@lixom.net>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH RFC 15/20] dt-bindings: gpio: gpio_oxnas:
	remove obsolete bindings
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

T24gRnJpLCBNYXIgMzEsIDIwMjMgYXQgMTA6MzXigK9BTSBOZWlsIEFybXN0cm9uZwo8bmVpbC5h
cm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBEdWUgdG8gbGFjayBvZiBtYWludGFpbmFu
Y2UgYW5kIHN0YWxsIG9mIGRldmVsb3BtZW50IGZvciBhIGZldyB5ZWFycyBub3csCj4gYW5kIHNp
bmNlIG5vIG5ldyBmZWF0dXJlcyB3aWxsIGV2ZXIgYmUgYWRkZWQgdXBzdHJlYW0sIHJlbW92ZSB0
aGUKPiBPWDgxMCBhbmQgT1g4MjAgZ3BpbyBiaW5kaW5ncy4KPgo+IFNpZ25lZC1vZmYtYnk6IE5l
aWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgo+IC0tLQo+ICAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9ncGlvL2dwaW9fb3huYXMudHh0ICAgICAgICB8IDQ3IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQ3IGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL2dwaW9fb3hu
YXMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vZ3Bpb19veG5h
cy50eHQKPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCA5NjY1MTQ3NDRkZjQuLjAw
MDAwMDAwMDAwMAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlv
L2dwaW9fb3huYXMudHh0Cj4gKysrIC9kZXYvbnVsbAo+IEBAIC0xLDQ3ICswLDAgQEAKPiAtKiBP
eGZvcmQgU2VtaWNvbmR1Y3RvciBPWE5BUyBTb0MgR1BJTyBDb250cm9sbGVyCj4gLQo+IC1QbGVh
c2UgcmVmZXIgdG8gZ3Bpby50eHQgZm9yIGdlbmVyaWMgaW5mb3JtYXRpb24gcmVnYXJkaW5nIEdQ
SU8gYmluZGluZ3MuCj4gLQo+IC1SZXF1aXJlZCBwcm9wZXJ0aWVzOgo+IC0gLSBjb21wYXRpYmxl
OiAib3hzZW1pLG94ODEwc2UtZ3BpbyIgb3IgIm94c2VtaSxveDgyMC1ncGlvIgo+IC0gLSByZWc6
IEJhc2UgYWRkcmVzcyBhbmQgbGVuZ3RoIGZvciB0aGUgZGV2aWNlLgo+IC0gLSBpbnRlcnJ1cHRz
OiBUaGUgcG9ydCBpbnRlcnJ1cHQgc2hhcmVkIGJ5IGFsbCBwaW5zLgo+IC0gLSBncGlvLWNvbnRy
b2xsZXI6IE1hcmtzIHRoZSBwb3J0IGFzIEdQSU8gY29udHJvbGxlci4KPiAtIC0gI2dwaW8tY2Vs
bHM6IFR3by4gVGhlIGZpcnN0IGNlbGwgaXMgdGhlIHBpbiBudW1iZXIgYW5kCj4gLSAgIHRoZSBz
ZWNvbmQgY2VsbCBpcyB1c2VkIHRvIHNwZWNpZnkgdGhlIGdwaW8gcG9sYXJpdHkgYXMgZGVmaW5l
ZCBpbgo+IC0gICBkZWZpbmVkIGluIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD46Cj4gLSAgICAg
IDAgPSBHUElPX0FDVElWRV9ISUdICj4gLSAgICAgIDEgPSBHUElPX0FDVElWRV9MT1cKPiAtIC0g
aW50ZXJydXB0LWNvbnRyb2xsZXI6IE1hcmtzIHRoZSBkZXZpY2Ugbm9kZSBhcyBhbiBpbnRlcnJ1
cHQgY29udHJvbGxlci4KPiAtIC0gI2ludGVycnVwdC1jZWxsczogVHdvLiBUaGUgZmlyc3QgY2Vs
bCBpcyB0aGUgR1BJTyBudW1iZXIgYW5kIHNlY29uZCBjZWxsCj4gLSAgIGlzIHVzZWQgdG8gc3Bl
Y2lmeSB0aGUgdHJpZ2dlciB0eXBlIGFzIGRlZmluZWQgaW4KPiAtICAgPGR0LWJpbmRpbmdzL2lu
dGVycnVwdC1jb250cm9sbGVyL2lycS5oPjoKPiAtICAgICAgSVJRX1RZUEVfRURHRV9SSVNJTkcK
PiAtICAgICAgSVJRX1RZUEVfRURHRV9GQUxMSU5HCj4gLSAgICAgIElSUV9UWVBFX0VER0VfQk9U
SAo+IC0gLSBncGlvLXJhbmdlczogSW50ZXJhY3Rpb24gd2l0aCB0aGUgUElOQ1RSTCBzdWJzeXN0
ZW0sIGl0IGFsc28gc3BlY2lmaWVzIHRoZQo+IC0gICBncGlvIGJhc2UgYW5kIGNvdW50LCBzaG91
bGQgYmUgaW4gdGhlIGZvcm1hdCBvZiBudW1lcmljLWdwaW8tcmFuZ2UgYXMKPiAtICAgc3BlY2lm
aWVkIGluIHRoZSBncGlvLnR4dCBmaWxlLgo+IC0KPiAtRXhhbXBsZToKPiAtCj4gLWdwaW8wOiBn
cGlvQDAgewo+IC0gICAgICAgY29tcGF0aWJsZSA9ICJveHNlbWksb3g4MTBzZS1ncGlvIjsKPiAt
ICAgICAgIHJlZyA9IDwweDAwMDAwMCAweDEwMDAwMD47Cj4gLSAgICAgICBpbnRlcnJ1cHRzID0g
PDIxPjsKPiAtICAgICAgICNncGlvLWNlbGxzID0gPDI+Owo+IC0gICAgICAgZ3Bpby1jb250cm9s
bGVyOwo+IC0gICAgICAgaW50ZXJydXB0LWNvbnRyb2xsZXI7Cj4gLSAgICAgICAjaW50ZXJydXB0
LWNlbGxzID0gPDI+Owo+IC0gICAgICAgZ3Bpby1yYW5nZXMgPSA8JnBpbmN0cmwgMCAwIDMyPjsK
PiAtfTsKPiAtCj4gLWtleXMgewo+IC0gICAgICAgLi4uCj4gLQo+IC0gICAgICAgYnV0dG9uLWVz
YyB7Cj4gLSAgICAgICAgICAgICAgIGxhYmVsID0gIkVTQyI7Cj4gLSAgICAgICAgICAgICAgIGxp
bnV4LGNvZGUgPSA8MT47Cj4gLSAgICAgICAgICAgICAgIGdwaW9zID0gPCZncGlvMCAxMiAwPjsK
PiAtICAgICAgIH07Cj4gLX07Cj4KPiAtLQo+IDIuMzQuMQo+CgpBY2tlZC1ieTogQmFydG9zeiBH
b2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
