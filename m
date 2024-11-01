Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D109B8F1F
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Nov 2024 11:25:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F2B2C78034;
	Fri,  1 Nov 2024 10:25:19 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AD27C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Nov 2024 10:25:12 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2fb56cb61baso13366461fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Nov 2024 03:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730456711; x=1731061511;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WpzSgjnpO5Pgi4peizaj5qKRJmTZYgfK/PfyJYP5YwM=;
 b=UE2i9UEjOVh/Sbvc/urUa4YndknXHOXEHHR/HPWyMx+rVhhySnoM7oywq81lM4FNlL
 qZglbbjWn8ygSzeH3oU7a1sEsCKZ7BbAcZkwNlMqQBvC8Pr03hdQPmNWGgrlp4GTtXUf
 ++aE3PdR47/gtRTQqC5woKp3Xd4mEkuTg60KqqilfYW8Jnx0Jv3Ud2eqBP7q85sYq62Z
 sTDgpti8f11hFbD4trJVEkXzUYjLZRZvLh84nqQ59NNa0uG8pVDL4+XPzbZBg8NRdcC+
 Wrj22nDAYfFRRGEcoWHl9w/ug7jVpGo/LN46Jz3mt/BrdN2G8YF01pqyKWPaRn8izNv+
 mK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730456711; x=1731061511;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WpzSgjnpO5Pgi4peizaj5qKRJmTZYgfK/PfyJYP5YwM=;
 b=iZM94+s6KYpVnLSqjQoYD+/ZpBVAR3BKZlmcrHuolD2WAiBbAXA6dkcfw3G+Aeo7Mw
 DDnHtlBRBeXL8HmqibetpVZNKA7ctYnkq0njjAsXuYRgruYFk1ZXLFEo24hWhzSKq2k6
 BTRzwVGxXRJHgaEiO5GTq//z84ePLB4taa/dWQg8P4c++YJX/5Y3oEyGAqeYvGGwGoQ6
 wxyJCf5l2Do0fqU5moZLXbyULEMWQ3i800nzV+kbZDbAfi8XE1c08syN2q2UNN43+V3m
 cXs+0TJTuijthVc5yaFKaMGgZFZjLF4uUGAkXtgQbFVlKorDVhaX4LLOwIPJkxM0bxhI
 IY7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyyZQ1YVdRcdTw+xprT7TjIKlFHazw4NSz3oDPt4LqjWnpJfOeSffSGqtbzrXP5RMbFhsbUuY4Bd17Qw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwOyOKlqDLt21ZpLDOT1J1o0LK7WgLwGZUAEnt5HVbZgR+G7gF2
 kxW2E0AFg/HuxLTw/Sr+HI1nn7Xkgg9czhwKVVg2/wS54hJRptqLgONwuSzeVT/KcvEJbG2zFog
 8m3Ljdd8FLcE2EF7YICb3wd8JtzBr/byy9u5RRA==
X-Google-Smtp-Source: AGHT+IEh3UD7clJCQ/gk/n1lZMbdbxLI4TLsCj8gBPyhuLX6iMsirPWos/kw6T81Ngl9MnmOHHdaCm4w/4b+g80Z8io=
X-Received: by 2002:a2e:819:0:b0:2f7:a5fe:adbe with SMTP id
 38308e7fff4ca-2fdec72f2bemr26733951fa.18.1730456711357; Fri, 01 Nov 2024
 03:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
 <20241022155658.1647350-8-antonio.borneo@foss.st.com>
 <CACRpkdZKimfE_00kxa_qAf+jjwxBtuKizDTd3RvOS_PDuZ_JKg@mail.gmail.com>
 <df12289dc65c21496d4f9818a53d9797406e2663.camel@foss.st.com>
In-Reply-To: <df12289dc65c21496d4f9818a53d9797406e2663.camel@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Nov 2024 11:24:58 +0100
Message-ID: <CACRpkdbne8730=6Hvd2W5ymv3xYNC6ApPthT0Fcb+D-fafA_5A@mail.gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Cheick Traore <cheick.traore@foss.st.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 07/14] dt-bindings: pinctrl: stm32:
 support IO synchronization parameters
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

SGkgQW50b25pbywKCnNvbWUgcmVzcG9uc2VzIGJlbG93IQoKT24gVGh1LCBPY3QgMzEsIDIwMjQg
YXQgMjo0NOKAr1BNIEFudG9uaW8gQm9ybmVvCjxhbnRvbmlvLmJvcm5lb0Bmb3NzLnN0LmNvbT4g
d3JvdGU6Cgo+ID4gT3RoZXJ3aXNlIEkgd291bGQgc2F5IHRoYXQganVzdCBjaGVja2luZyBpZiB0
aGUgbGluZSBpcyBpbiBpbnB1dAo+ID4gb3Igb3V0cHV0IGZyb20gb3RoZXIgcHJvcGVydGllcyBz
aG91bGQgYmUgZW5vdWdoIHRvIGNvbmZpZ3VyZQo+ID4gdGhpcz8gaW5wdXQtZW5hYmxlLCBvdXRw
dXQtZW5hYmxlIHRvIG5hbWUgdGhlIG9idmlvdXMuCj4KPiBPbiBTVE0zMk1QMjV4IHRoZXJlIGlz
IGEgJ3NrZXctZGVsYXknIEhXIGJsb2NrIG9uIGVhY2ggcGluLAo+IGJ1dCBpdCdzIGFwcGxpZWQg
aW5kZXBlbmRlbnRseSBvbiBlYWNoIHBpbiBlaXRoZXIgb25seSBvbiB0aGUKPiBpbnB1dCBkaXJl
Y3Rpb24gT1Igb25seSBvbiB0aGUgb3V0cHV0IGRpcmVjdGlvbi4KPiBUaGVyZSBpcyBubyBhdXRv
bWF0aWMgd2F5IHRvIHN3aXRjaCBpdCBiZXR3ZWVuIGlucHV0IGFuZAo+IG91dHB1dCBwYXRoLiBU
aGlzIHByb3BlcnR5IGFzc2lnbnMgdGhlIGRlbGF5IHRvIG9uZSBwYXRoLgo+IFRoZSBnZW5lcmlj
IHByb3BlcnR5ICdza2V3LWRlbGF5JyBkb2VzIG5vdCBjb25zaWRlcnMgdGhpcwo+IGNhc2UuCj4K
PiBXaGlsZSBJIGNvdWxkIGV4dGVuZCB0aGUgcGluY3RybCBkcml2ZXIgdG8gaW5jbHVkZSB0aGUg
aW5mbyBhYm91dAo+IGRpcmVjdGlvbiwgdGhhdCBpcyB0cml2aWFsIGZvciBleGFtcGxlIGZvciBV
QVJUIG9yIFNQSSwgaXQgd2lsbCBmYWlsCj4gZm9yIGJpZGlyZWN0aW9uYWwgcGlucyBsaWtlIEky
QydzIFNEQTsgc29tZSB1c2UgY2FzZSBjb3VsZAo+IHJlcXVpcmUgdGhlIHNrZXctZGVsYXkgb24g
U0RBIGlucHV0IHBhdGgsIG90aGVyIG9uIHRoZSBvdXRwdXQgcGF0aC4KPiBBbHNvIHRoZSBpZGVh
IG9mIGFzc2lnbmluZyB0aGUgZGlyZWN0aW9uIGF0IHN0YXJ0dXAgKGUuZy4gaW4gdGhlCj4gYm9v
dGxvYWRlcikgaXMgbm90IGZlYXNpYmxlIGFzIHRoZSBkZWxheSBkZXBlbmRzIG9uIHRoZQo+IGZ1
bmN0aW9uYWxpdHkgdGhhdCBjYW4gY2hhbmdlIGF0IHJ1bnRpbWUgZS5nLiBieSBsb2FkaW5nIG1v
ZHVsZXMuCj4gSSBwcmVmZXIgaGF2aW5nIHRoaXMgImRpcmVjdGlvbiIgcGF0aCBleHBsaWNpdGx5
IHNlbGVjdGVkIHRocm91Z2gKPiBhIERUIHByb3BlcnR5Lgo+Cj4gVGhlIGV4aXN0aW5nIHByb3Bl
cnRpZXMgJ2lucHV0LWVuYWJsZScgYW5kICdvdXRwdXQtZW5hYmxlJyBhcmUKPiBub3Qgc3BlY2lm
aWMgZm9yIHRoZSBza2V3LWRlbGF5Lgo+IEFuZCBJIHRoaW5rIGl0IHdvdWxkIGJlIGNvbmZ1c2lu
ZyBoYXZpbmcgJ2lucHV0LWVuYWJsZScgb3IKPiAnb3V0cHV0LWVuYWJsZScgYXNzb2NpYXRlZCB3
aXRoIGEgYmlkaXJlY3Rpb25hbCBwaW5zIGxpa2UgSTJDJ3MgU0RBLgo+Cj4gSSBwcm9wb3NlIHRv
IGNoYW5nZSBpdCBhcywgZS5nLgo+ICAgc3Qsc2tldy1kZWxheS1vbi1pbnB1dDoKPiAgICAgdHlw
ZTogYm9vbGVhbgo+ICAgICBkZXNjcmlwdGlvbjogfAo+ICAgICAgIElmIHRoaXMgcHJvcGVydHkg
aXMgcHJlc2VudCwgdGhlbiBza2V3LWRlbGF5IGFwcGxpZXMgdG8gaW5wdXQgcGF0aCBvbmx5LAo+
ICAgICAgIG90aGVyd2lzZSBpdCBhcHBsaWVzIHRvIG91dHB1dCBwYXRjaCBvbmx5Lgo+Cj4gT3Is
IGl0IGNvdWxkIGJlIGEgbmV3IGdlbmVyaWMgcHJvcGVydHkgKGtlZXBpbmcgYmFja3dhcmQgY29t
cGF0aWJpbGl0eSksIGUuZy46Cj4gICBza2V3LWRlbGF5LWRpcmVjdGlvbjoKPiAgICAgZW51bSBb
MCwgMSwgMl0KPiAgICAgZGVmYXVsdDogMAo+ICAgICBkZXNjcmlwdGlvbjogfAo+ICAgICAgIDA6
IHNrZXctZGVsYXkgYXBwbGllcyB0byBib3RoIGlucHV0IGFuZCBvdXRwdXQgcGF0aCwgb3IgaXQg
c3dpdGNoZXMgYXV0b21hdGljYWxseQo+ICAgICAgICAgIGJldHdlZW4gdGhlIHR3byBkaXJlY3Rp
b24KPiAgICAgICAxOiBza2V3LWRlbGF5IGFwcGxpZXMgb25seSB0byBpbnB1dCBwYXRoCj4gICAg
ICAgMjogc2tldy1kZWxheSBhcHBsaWVzIG9ubHkgdG8gb3V0cHV0IHBhdGgKCkkgbGlrZSB0aGlz
IHByb3BlcnR5IHRoZSBtb3N0LiBDYW4gd2UgZ28gd2l0aCB0aGUgZ2VuZXJpYwpza2V3LWRlbGF5
LWRpcmVjdGlvbj8KCkFsc28gc3RhdGUgaW4gdGhlIGV4aXN0aW5nIHNrZXctZGVsYXkgcHJvcGVy
dHkgdGhhdCBpZgpza2V3LWRlbGF5LWRpcmVjdGlvbiBpcyBub3QKcHJlc2VudCB0aGVuIGl0IGlz
IGFzc3VtZWQgdGhhdCB0aGUgcHJvcGVydHkgYXBwbGllcyB0byBhbGwKZGlyZWN0aW9ucyBvZiBh
IHBpbi4KCj4gPiA+ICsgICAgICAgICAgc3QsaW8tY2xrLWVkZ2U6Cj4gPiA+ICsgICAgICAgICAg
ICBkZXNjcmlwdGlvbjogfAo+ID4gPiArICAgICAgICAgICAgICBJTyBzeW5jaHJvbml6YXRpb24g
Y2xvY2sgZWRnZQo+ID4gPiArICAgICAgICAgICAgICAwOiBEYXRhIHNpbmdsZS1lZGdlIChjaGFu
Z2luZyBvbiByaXNpbmcgb3IgZmFsbGluZyBjbG9jayBlZGdlKQo+ID4gPiArICAgICAgICAgICAg
ICAxOiBEYXRhIGRvdWJsZS1lZGdlIChjaGFuZ2luZyBvbiBib3RoIGNsb2NrIGVkZ2VzKQo+ID4g
PiArICAgICAgICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWlu
dDMyCj4gPiA+ICsgICAgICAgICAgICBlbnVtOiBbMCwgMV0KPiA+Cj4gPiBUaGlzIGxvb2tzIGxp
a2UgaXQgc2hvdWxkIGJlIG1hZGUgaW50byBhIGdlbmVyaWMgcHJvcGVydHksCj4KPiBJIGJlbGll
dmUgaXQgaXMgdG9vIHNwZWNpZmljIHRvIFNUIGltcGxlbWVudGF0aW9uLgo+IEkgc2VlIGFscmVh
ZHkgc29tZSAncmV0aW1lJyBtZW50aW9uZWQgaW4gb2xkIFNUIGJpbmRpbmdzCj4gYmluZGluZ3Mv
cGluY3RybC9waW5jdHJsLXN0LnR4dCBhbmQgYmluZGluZ3MvbmV0L3N0aS1kd21hYy50eHQsIGJ1
dCB0aGUgY29udHJvbCBsb29rcyBxdWl0ZSBkaWZmZXJlbnQ7IEkgZG9uJ3QgcGxhbiB0byByZXVz
ZSB0aGVtLgo+Cj4gSSB3aWxsIGZ1c2UgaW4gVjIgdGhpcyBwcm9wZXJ0eSB0b2dldGhlciB3aXRo
IHRoZSBuZXh0IHR3byBpbiBhIG1vcmUKPiBtZWFuaW5nZnVsIG9uZSwgcGFydGlhbGx5IGFja25v
d2xlZGdpbmcgeW91ciBwcm9wb3NhbCBiZWxvdy4KCkhtbW1tLiBMZXQncyBzZWUuIEkga25vdyB0
aGF0IGUuZy4gTU1DIGhhcyBzaW1pbGFyIHByb3BlcnRpZXMKYW5kIGlmIHNpbWlsYXIgdGhpbmdz
IGFwcGVhciBpbiBvdGhlciBiaW5kaW5ncyAobm90IG5lY2Vzc2FyaWx5CnBpbmN0cmwgYmluZGlu
Z3MpIHRoZW4gdGhhdCBzaG91bGQgYWxzbyBiZSB0YWtlbiBpbnRvIGFjY291bnQuCgpBbmQgaW4g
TU1DIHRoaXMgaXMgY2FsbGVkIEREUi4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
