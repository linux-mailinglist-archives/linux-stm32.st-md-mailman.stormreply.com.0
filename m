Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 103BDADFD72
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Jun 2025 08:02:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B21C1C36B36;
	Thu, 19 Jun 2025 06:02:28 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A7DAC36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jun 2025 05:49:20 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-55350d0eedeso342095e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jun 2025 22:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750312160; x=1750916960;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LP0+v+yPMTvWP3QRlvcaJX6go4/gtqoSeY1FPuuU0EQ=;
 b=EQ4eJYTcxqPmggWxYRIXJdTj+ORmTAn1peB00zbh37qeX26ncmsPnn3pK2aCCjYMcq
 AppwqPLwX2invH1b80s5zxjNJFSQCTxeQUR2yscrQzPz2gp/WpPRbh03NWGClR5w0U7d
 zdBKVnlHkABK3KAK+yWFZ9KacWGukUJPpL1sXEpWGe5nDCvKS/dcNpTz7ALqmKa8GzJP
 dEgILNvQDLSdvOiKiOGeSFGgzwScg0iuAhhTue9QPpu/Y4vWS3/2h8tCERLut1+ngxdW
 3t47NTajkWyzd7BX2c1XGUgJd28IV33IzmCdvQJplA3pBHGefYBZOeY8vQaDkrgZma+k
 Y9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750312160; x=1750916960;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LP0+v+yPMTvWP3QRlvcaJX6go4/gtqoSeY1FPuuU0EQ=;
 b=fP1eZg854bwlU0pWjkJw+3jjkDeHBrROBoDBYTQvkEb7Or0cLAv8ODmEjU/F66P9N9
 9Z+wMdBI/jfnP40jxdTZhzI/8eP3K0WiLW5k0bd+hWVhb0Deq+qpoeBNdHLfEHy/ttvC
 nNatGYCHEKUyzcN4d8J4GI+G8h1gCSYZloVL/HexAtKZ82fktiAcNt93d7qKESJPKnqv
 wkqzuzLxwu4S6ywR8fmcqSYQZfl5PvIkjwikZyms/+TWTtwO5E4Qx3w1DePEN+u0DtVc
 NcCC10UvwXmTp2fwy7s0wUQrNk7S/AnDrRFzsiM3nJ/Oht4SAooxkuKcBkZDmtnk2k+z
 +k2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6h5op6eo4Jo2iCOTbMB/I7yj+wrHo2f1s/mMh/Kxqd//ZshkXOsdbXXce3eQSIFbZIjWUg3hXfxJg/w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz8kJUwfmXPABjEujgotcgWdsJyRZpBS0o1LZdTDGkNnKfiq5ZA
 32hZ/wJ+FZS9CbgEyJWTS4cHKlUk2hL+pf9/eenrMq7qTjD0FPKHDVNQk2PdZSwaDlnDx5QSXbz
 T9nSvNsqpxbLcLnFhw/TcRbzHiaB32VM=
X-Gm-Gg: ASbGncsLI43Oz/k0wpgXHmBP6Lw1kaZUYhYr2uiwZM4gyns9MJjxVMtHBxpG873wpa4
 OZ8uYB5sByMCF35m9ezpIABlSIvhwwp+6/FBemkJNqhojl65Qw697Mw9PHS5CFyZKgFzdrozyHq
 6whItVqflq1pC997ts9zRaUXkLMyZ5CeK8My9kNxtjv4lZ
X-Google-Smtp-Source: AGHT+IEAtdtfArajT5szIQvBU7UGnWhv91Qs5Lq4eHuTo5U3W8BhvGer+g6N8WmU7PLHZ8aDkn6H5sM9ZBf+qYCptUo=
X-Received: by 2002:a05:6512:ea5:b0:553:2d93:d31 with SMTP id
 2adb3069b0e04-553b6ecba35mr5597131e87.22.1750312159320; Wed, 18 Jun 2025
 22:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
 <E1uRqE9-004c7G-CB@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1uRqE9-004c7G-CB@rmk-PC.armlinux.org.uk>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Thu, 19 Jun 2025 13:48:42 +0800
X-Gm-Features: Ac12FXwywCRDElBPzLsFtuXFdNKKqhum4JUE_fePl755xSXSFzh60WUfPkWp7Z4
Message-ID: <CAJhJPsUDmQgunCk_Fbe5vFtBzE6Yy6m6Q0oRcXmpWRTu4nqQ0A@mail.gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
X-Mailman-Approved-At: Thu, 19 Jun 2025 06:02:27 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-mips@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: loongson1:
	provide match data struct
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

UmV2aWV3ZWQtYnk6IEtlZ3VhbmcgWmhhbmcgPGtlZ3VhbmcuemhhbmdAZ21haWwuY29tPgpUZXN0
ZWQtYnk6IEtlZ3VhbmcgWmhhbmcgPGtlZ3VhbmcuemhhbmdAZ21haWwuY29tPiAjIG9uIExTMUIg
JiBMUzFDCgpPbiBXZWQsIEp1biAxOCwgMjAyNSBhdCA2OjQx4oCvUE0gUnVzc2VsbCBLaW5nIChP
cmFjbGUpCjxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBQcm92aWRlIGEg
c3RydWN0dXJlIGZvciBtYXRjaCBkYXRhIHJhdGhlciB0aGFuIHVzaW5nIHRoZSBmdW5jdGlvbgo+
IHBvaW50ZXIgYXMgbWF0Y2ggZGF0YS4gVGhpcyBhbGxvd3Mgc3Ryb25nZXIgdHlwZS1jaGVja2lu
ZyBmb3IgdGhlCj4gZnVuY3Rpb24gaXRzZWxmLCBhbmQgYWxsb3dzIGV4dGVuc2lvbnMgdG8gdGhl
IG1hdGNoIGRhdGEuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgPHJt
aytrZXJuZWxAYXJtbGludXgub3JnLnVrPgo+IC0tLQo+ICAuLi4vZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvZHdtYWMtbG9vbmdzb24xLmMgfCAyNCArKysrKysrKysrKysrKy0tLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWxvb25nc29uMS5j
IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbG9vbmdzb24xLmMK
PiBpbmRleCAzZTg2ODEwNzE3ZDMuLjc4ZDk1NDBiZTEwYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1sb29uZ3NvbjEuYwo+ICsrKyBiL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWxvb25nc29uMS5jCj4gQEAg
LTQ2LDYgKzQ2LDEwIEBAIHN0cnVjdCBsczF4X2R3bWFjIHsKPiAgICAgICAgIHN0cnVjdCByZWdt
YXAgKnJlZ21hcDsKPiAgfTsKPgo+ICtzdHJ1Y3QgbHMxeF9kYXRhIHsKPiArICAgICAgIGludCAo
KmluaXQpKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsIHZvaWQgKmJzcF9wcml2KTsKPiAr
fTsKPiArCj4gIHN0YXRpYyBpbnQgbHMxYl9kd21hY19zeXNjb25faW5pdChzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2LCB2b2lkICpwcml2KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgbHMxeF9k
d21hYyAqZHdtYWMgPSBwcml2Owo+IEBAIC0xNDMsOSArMTQ3LDkgQEAgc3RhdGljIGludCBsczF4
X2R3bWFjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsKPiAgICAgICAg
IHN0cnVjdCBwbGF0X3N0bW1hY2VuZXRfZGF0YSAqcGxhdF9kYXQ7Cj4gICAgICAgICBzdHJ1Y3Qg
c3RtbWFjX3Jlc291cmNlcyBzdG1tYWNfcmVzOwo+ICsgICAgICAgY29uc3Qgc3RydWN0IGxzMXhf
ZGF0YSAqZGF0YTsKPiAgICAgICAgIHN0cnVjdCByZWdtYXAgKnJlZ21hcDsKPiAgICAgICAgIHN0
cnVjdCBsczF4X2R3bWFjICpkd21hYzsKPiAtICAgICAgIGludCAoKmluaXQpKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYsIHZvaWQgKnByaXYpOwo+ICAgICAgICAgaW50IHJldDsKPgo+ICAg
ICAgICAgcmV0ID0gc3RtbWFjX2dldF9wbGF0Zm9ybV9yZXNvdXJjZXMocGRldiwgJnN0bW1hY19y
ZXMpOwo+IEBAIC0xNTksOCArMTYzLDggQEAgc3RhdGljIGludCBsczF4X2R3bWFjX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAgICAgICAgICAgICAgIHJldHVybiBkZXZf
ZXJyX3Byb2JlKCZwZGV2LT5kZXYsIFBUUl9FUlIocmVnbWFwKSwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIlVuYWJsZSB0byBmaW5kIHN5c2NvblxuIik7Cj4KPiAtICAg
ICAgIGluaXQgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoJnBkZXYtPmRldik7Cj4gLSAgICAg
ICBpZiAoIWluaXQpIHsKPiArICAgICAgIGRhdGEgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEo
JnBkZXYtPmRldik7Cj4gKyAgICAgICBpZiAoIWRhdGEpIHsKPiAgICAgICAgICAgICAgICAgZGV2
X2VycigmcGRldi0+ZGV2LCAiTm8gb2YgbWF0Y2ggZGF0YSBwcm92aWRlZFxuIik7Cj4gICAgICAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICAgICAgICAgfQo+IEBAIC0xNzUsMjEgKzE3OSwy
OSBAQCBzdGF0aWMgaW50IGxzMXhfZHdtYWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImR0IGNvbmZpZ3Vy
YXRpb24gZmFpbGVkXG4iKTsKPgo+ICAgICAgICAgcGxhdF9kYXQtPmJzcF9wcml2ID0gZHdtYWM7
Cj4gLSAgICAgICBwbGF0X2RhdC0+aW5pdCA9IGluaXQ7Cj4gKyAgICAgICBwbGF0X2RhdC0+aW5p
dCA9IGRhdGEtPmluaXQ7Cj4gICAgICAgICBkd21hYy0+cGxhdF9kYXQgPSBwbGF0X2RhdDsKPiAg
ICAgICAgIGR3bWFjLT5yZWdtYXAgPSByZWdtYXA7Cj4KPiAgICAgICAgIHJldHVybiBkZXZtX3N0
bW1hY19wbHRmcl9wcm9iZShwZGV2LCBwbGF0X2RhdCwgJnN0bW1hY19yZXMpOwo+ICB9Cj4KPiAr
c3RhdGljIGNvbnN0IHN0cnVjdCBsczF4X2RhdGEgbHMxYl9kd21hY19kYXRhID0gewo+ICsgICAg
ICAgLmluaXQgPSBsczFiX2R3bWFjX3N5c2Nvbl9pbml0LAo+ICt9Owo+ICsKPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBsczF4X2RhdGEgbHMxY19kd21hY19kYXRhID0gewo+ICsgICAgICAgLmluaXQg
PSBsczFjX2R3bWFjX3N5c2Nvbl9pbml0LAo+ICt9Owo+ICsKPiAgc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgbHMxeF9kd21hY19tYXRjaFtdID0gewo+ICAgICAgICAgewo+ICAgICAg
ICAgICAgICAgICAuY29tcGF0aWJsZSA9ICJsb29uZ3NvbixsczFiLWdtYWMiLAo+IC0gICAgICAg
ICAgICAgICAuZGF0YSA9ICZsczFiX2R3bWFjX3N5c2Nvbl9pbml0LAo+ICsgICAgICAgICAgICAg
ICAuZGF0YSA9ICZsczFiX2R3bWFjX2RhdGEsCj4gICAgICAgICB9LAo+ICAgICAgICAgewo+ICAg
ICAgICAgICAgICAgICAuY29tcGF0aWJsZSA9ICJsb29uZ3NvbixsczFjLWVtYWMiLAo+IC0gICAg
ICAgICAgICAgICAuZGF0YSA9ICZsczFjX2R3bWFjX3N5c2Nvbl9pbml0LAo+ICsgICAgICAgICAg
ICAgICAuZGF0YSA9ICZsczFjX2R3bWFjX2RhdGEsCj4gICAgICAgICB9LAo+ICAgICAgICAgeyB9
Cj4gIH07Cj4gLS0KPiAyLjMwLjIKPgoKCi0tIApCZXN0IHJlZ2FyZHMsCgpLZWd1YW5nIFpoYW5n
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
