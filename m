Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7019B85348F
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 16:26:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D141C6DD69;
	Tue, 13 Feb 2024 15:26:45 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFADBC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 15:26:43 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1d73066880eso41208645ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 07:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707838002; x=1708442802;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+GIHngw2Uv/9x1adyo14J65FsyM0q1LqEDIZ2pVeC/E=;
 b=hweowi6/L0gR/tMsTAo73UVVR2hQlylUhNo085ZdGx7HkeHYBECJowz6AY7K+QcNeE
 JR9wmYL8wWnpoWeBevjCytI1toNV0Yd3JRaWSI8opdrksN/CzMYq/ngLNy7RATGAjXCk
 ZNyL8nBWvoQWD4no45R7nMhjuW3EtS+mTtI3wXHuF/eXX7hWNJmyd4l0bblgEXEjl2pr
 PTTg+ypOZa/wF6xzvZTzw+z5kEscCS4jBA+vik9MxaBIIL04qYywfNT7Xb5QkHLO52Ha
 Oav+/OLflLAPBHV5jA/V8+fcqwqgn0XYGHS1IJPGeTgDXUWGpLzweHzcEoPasH/Yw1hM
 QdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707838002; x=1708442802;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+GIHngw2Uv/9x1adyo14J65FsyM0q1LqEDIZ2pVeC/E=;
 b=GrSPudTmykhsFu54ZyHoGT1EVWguTnx+hNcLZ0VCJ7INkt2cylTYQfi883NPKHrlxf
 JSw6TF76hqay43VTbPGsIgC1nevdmlRSJGNwQKtio2adReIs/i0ciZ6fieVrb0jKBmNk
 yBTEDlM1t02EkfKdCdJ8Aup+OEPjS385tDmWW/2wTIVEwOSb12x6owatSDldN8gfq2DC
 A5eXqrbZi1GiKTcBO9IP0KxcE1K6OUoQKBqBVans8LyQdpT/EYQDWL/8sxuGYVb+GnwU
 xLF4H6/cpiaXMVXwytprZVoe9xr9oJsft4WKAExWZ0w8XmFC0mFhCotzhYLuM22qfPzy
 Mrvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWh3GpTPoVN5O7H6YBXBLukR1xcnIMybF8mSriNmTsoR8lrI8Lz+Tz6uwn8thLnmapibxMn0ghJyh3IhvMJoSbgKilDZFCJybNXQ/74jZAQQs0CXZOOKr3+
X-Gm-Message-State: AOJu0YzztbANtHB55l3IozwDMLoHtql7/icNE64dWQNyze3PmsnU/wO5
 l1ciNcgnb17yO1GJvMX1WWFkqyn3Yya+AczFwrMgl5ZUxV4OzCIO
X-Google-Smtp-Source: AGHT+IG0HcXD1rWo9g1JLTi5S5Xtb+Kag9Ao9jEu8Uy7TWW+NEyts0jd9VKEPbyr2WgtQsV6DxPe7g==
X-Received: by 2002:a17:902:eb8e:b0:1d9:9774:7e8a with SMTP id
 q14-20020a170902eb8e00b001d997747e8amr11805935plg.24.1707838002213; 
 Tue, 13 Feb 2024 07:26:42 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVENJMIdmgJ8B933ISdsKbYjSLSNNiJw9hRe426uNo1XtrsNmNeodhN0qpObJ9NtQYV8RwRej3RqLjlxrzZrqvl6mgt12eP47Ur35tp8EEFEMuphG8QUquIDvA6DArx4d8okDMx21Zo1jOE2JyD0v7LMCReLjU1FW44uWoIu79wqMcAaH+s19tj/EcYHeKRbWHQLe0ddUzSfbl4BIgsajpcykzny1W0qAbTQTFpJ/H3lC9O9PMAP0SEex1On9fqmseZhA7X4WOqTZgifMndJ4gS7Z/jxzKtqL3ikJZ5CW6tLGfMLV/a5vpXxu9bwsxXAdezF7dte4z8rYwH8lsZy7r9/sfd4Bj+l06636KbC028E2hT32G0JPmtTjzEF3rgx41mpDYjsWQFa7d98IDuFjTp3dhtZuXbzh9/u8T5AooeQU20qGyr0fXhczSigKglRJTjwc+zX0JwWnCzFs6GUZQBeDDxx+xuXsvk9PVwysfucCCwRKgR+FLwVWJIQJj0iDhobkEsSUnGQTXMAvlL2pS5+HnhVX7ij2Na6RBsXYTdPgFrPVzFT4+Z6CUIPJ5+zZkaPE3FBbzZyR5qvn6IMhUJIeQpdmmbXnBeUHr2pCjmL+Ssr/kqAHnvv3cjy8lXjKjMVbTUZoWsAU5jZ+wTj4uytdeTnHgLUNrL0plApt+l
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a17090323c800b001d78a08e8e7sm2213947plh.250.2024.02.13.07.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 07:26:41 -0800 (PST)
Date: Tue, 13 Feb 2024 07:26:40 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Eric Dumazet <edumazet@google.com>
Message-ID: <20d94512-c4f2-49f7-ac97-846dc24a6730@roeck-us.net>
References: <20240203190927.19669-1-petr@tesarici.cz>
 <ea1567d9-ce66-45e6-8168-ac40a47d1821@roeck-us.net>
 <Zct5qJcZw0YKx54r@xhacker>
 <CANn89i+4tVWezqr=BYZ5AF=9EgV2EPqhdHun=u=ga32CEJ4BXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANn89i+4tVWezqr=BYZ5AF=9EgV2EPqhdHun=u=ga32CEJ4BXQ@mail.gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Petr Tesarik <petr@tesarici.cz>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 Marc Haber <mh+netdev@zugschlus.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Chen-Yu Tsai <wens@csie.org>,
 Jose Abreu <joabreu@synopsys.com>, stable@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "David S. Miller" <davem@davemloft.net>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net v3] net: stmmac: protect updates of
 64-bit statistics counters
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

T24gVHVlLCBGZWIgMTMsIDIwMjQgYXQgMDM6NTE6MzVQTSArMDEwMCwgRXJpYyBEdW1hemV0IHdy
b3RlOgo+IE9uIFR1ZSwgRmViIDEzLCAyMDI0IGF0IDM6MjnigK9QTSBKaXNoZW5nIFpoYW5nIDxq
c3poYW5nQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFN1biwgRmViIDExLCAyMDI0IGF0
IDA4OjMwOjIxUE0gLTA4MDAsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6Cj4gPiA+IEhpLAo+ID4gPgo+
ID4gPiBPbiBTYXQsIEZlYiAwMywgMjAyNCBhdCAwODowOToyN1BNICswMTAwLCBQZXRyIFRlc2Fy
aWsgd3JvdGU6Cj4gPiA+ID4gQXMgZXhwbGFpbmVkIGJ5IGEgY29tbWVudCBpbiA8bGludXgvdTY0
X3N0YXRzX3N5bmMuaD4sIHdyaXRlIHNpZGUgb2Ygc3RydWN0Cj4gPiA+ID4gdTY0X3N0YXRzX3N5
bmMgbXVzdCBlbnN1cmUgbXV0dWFsIGV4Y2x1c2lvbiwgb3Igb25lIHNlcWNvdW50IHVwZGF0ZSBj
b3VsZAo+ID4gPiA+IGJlIGxvc3Qgb24gMzItYml0IHBsYXRmb3JtcywgdGh1cyBibG9ja2luZyBy
ZWFkZXJzIGZvcmV2ZXIuIFN1Y2ggbG9ja3Vwcwo+ID4gPiA+IGhhdmUgYmVlbiBvYnNlcnZlZCBp
biByZWFsIHdvcmxkIGFmdGVyIHN0bW1hY194bWl0KCkgb24gb25lIENQVSByYWNlZCB3aXRoCj4g
PiA+ID4gc3RtbWFjX25hcGlfcG9sbF90eCgpIG9uIGFub3RoZXIgQ1BVLgo+ID4gPiA+Cj4gPiA+
ID4gVG8gZml4IHRoZSBpc3N1ZSB3aXRob3V0IGludHJvZHVjaW5nIGEgbmV3IGxvY2ssIHNwbGl0
IHRoZSBzdGF0aWNzIGludG8KPiA+ID4gPiB0aHJlZSBwYXJ0czoKPiA+ID4gPgo+ID4gPiA+IDEu
IGZpZWxkcyB1cGRhdGVkIG9ubHkgdW5kZXIgdGhlIHR4IHF1ZXVlIGxvY2ssCj4gPiA+ID4gMi4g
ZmllbGRzIHVwZGF0ZWQgb25seSBkdXJpbmcgTkFQSSBwb2xsLAo+ID4gPiA+IDMuIGZpZWxkcyB1
cGRhdGVkIG9ubHkgZnJvbSBpbnRlcnJ1cHQgY29udGV4dCwKPiA+ID4gPgo+ID4gPiA+IFVwZGF0
ZXMgdG8gZmllbGRzIGluIHRoZSBmaXJzdCB0d28gZ3JvdXBzIGFyZSBhbHJlYWR5IHNlcmlhbGl6
ZWQgdGhyb3VnaAo+ID4gPiA+IG90aGVyIGxvY2tzLiBJdCBpcyBzdWZmaWNpZW50IHRvIHNwbGl0
IHRoZSBleGlzdGluZyBzdHJ1Y3QgdTY0X3N0YXRzX3N5bmMKPiA+ID4gPiBzbyB0aGF0IGVhY2gg
Z3JvdXAgaGFzIGl0cyBvd24uCj4gPiA+ID4KPiA+ID4gPiBOb3RlIHRoYXQgdHhfc2V0X2ljX2Jp
dCBpcyB1cGRhdGVkIGZyb20gYm90aCBjb250ZXh0cy4gU3BsaXQgdGhpcyBjb3VudGVyCj4gPiA+
ID4gc28gdGhhdCBlYWNoIGNvbnRleHQgZ2V0cyBpdHMgb3duLCBhbmQgY2FsY3VsYXRlIHRoZWly
IHN1bSB0byBnZXQgdGhlIHRvdGFsCj4gPiA+ID4gdmFsdWUgaW4gc3RtbWFjX2dldF9ldGh0b29s
X3N0YXRzKCkuCj4gPiA+ID4KPiA+ID4gPiBGb3IgdGhlIHRoaXJkIGdyb3VwLCBtdWx0aXBsZSBp
bnRlcnJ1cHRzIG1heSBiZSBwcm9jZXNzZWQgYnkgZGlmZmVyZW50IENQVXMKPiA+ID4gPiBhdCB0
aGUgc2FtZSB0aW1lLCBidXQgaW50ZXJydXB0cyBvbiB0aGUgc2FtZSBDUFUgd2lsbCBub3QgbmVz
dC4gTW92ZSBmaWVsZHMKPiA+ID4gPiBmcm9tIHRoaXMgZ3JvdXAgdG8gYSBuZXdseSBjcmVhdGVk
IHBlci1jcHUgc3RydWN0IHN0bW1hY19wY3B1X3N0YXRzLgo+ID4gPiA+Cj4gPiA+ID4gRml4ZXM6
IDEzMzQ2NmMzYmJlMSAoIm5ldDogc3RtbWFjOiB1c2UgcGVyLXF1ZXVlIDY0IGJpdCBzdGF0aXN0
aWNzIHdoZXJlIG5lY2Vzc2FyeSIpCj4gPiA+ID4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbmV0ZGV2L1phMTczUGh2aVlnLTFxSW5AdG9ycmVzLnp1Z3NjaGx1cy5kZS90Lwo+ID4gPiA+
IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUGV0ciBU
ZXNhcmlrIDxwZXRyQHRlc2FyaWNpLmN6Pgo+ID4gPgo+ID4gPiBUaGlzIHBhdGNoIHJlc3VsdHMg
aW4gYSBsb2NrZGVwIHNwbGF0LiBCYWNrdHJhY2UgYW5kIGJpc2VjdCByZXN1bHRzIGF0dGFjaGVk
Lgo+ID4gPgo+ID4gPiBHdWVudGVyCj4gPiA+Cj4gPiA+IC0tLQo+ID4gPiBbICAgMzMuNzM2NzI4
XSA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4gPiBbICAgMzMuNzM2ODA1XSBX
QVJOSU5HOiBpbmNvbnNpc3RlbnQgbG9jayBzdGF0ZQo+ID4gPiBbICAgMzMuNzM2OTUzXSA2Ljgu
MC1yYzQgIzEgVGFpbnRlZDogRyAgICAgICAgICAgICAgICAgTgo+ID4gPiBbICAgMzMuNzM3MDgw
XSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gPiBbICAgMzMuNzM3MTU1XSBp
bmNvbnNpc3RlbnQge0hBUkRJUlEtT04tV30gLT4ge0lOLUhBUkRJUlEtV30gdXNhZ2UuCj4gPiA+
IFsgICAzMy43MzczMDldIGt3b3JrZXIvMDoyLzM5IFtIQzFbMV06U0MwWzJdOkhFMDpTRTBdIHRh
a2VzOgo+ID4gPiBbICAgMzMuNzM3NDU5XSBlZjc5MjA3NCAoJnN5bmNwLT5zZXEjMil7Py4uLn0t
ezA6MH0sIGF0OiBzdW44aV9kd21hY19kbWFfaW50ZXJydXB0KzB4OWMvMHgyOGMKPiA+ID4gWyAg
IDMzLjczODIwNl0ge0hBUkRJUlEtT04tV30gc3RhdGUgd2FzIHJlZ2lzdGVyZWQgYXQ6Cj4gPiA+
IFsgICAzMy43MzgzMThdICAgbG9ja19hY3F1aXJlKzB4MTFjLzB4MzY4Cj4gPiA+IFsgICAzMy43
Mzg0MzFdICAgX191NjRfc3RhdHNfdXBkYXRlX2JlZ2luKzB4MTA0LzB4MWFjCj4gPiA+IFsgICAz
My43Mzg1MjVdICAgc3RtbWFjX3htaXQrMHg0ZDAvMHhjNTgKPiA+Cj4gPiBpbnRlcmVzdGluZyBs
b2NrZGVwIHNwbGF0Li4uCj4gPiBzdG1tYWNfeG1pdCgpIG9wZXJhdGVzIG9uIHR4cV9zdGF0cy0+
cV9zeW5jcCwgd2hpbGUgdGhlCj4gPiBzdW44aV9kd21hY19kbWFfaW50ZXJydXB0KCkgb3BlcmF0
ZXMgb24gcGNwdSdzIHByaXYtPnhzdGF0cy5wY3B1X3N0YXRzCj4gPiB0aGV5IGFyZSBkaWZmZXJl
bnQgc3luY3AuIHNvIGhvdyBkb2VzIGxvY2tkZXAgc3BsYXQgaGFwcGVuLgo+IAo+IFJpZ2h0LCBJ
IGRvIG5vdCBzZWUgYW55dGhpbmcgb2J2aW91cyB5ZXQuCgpXaWxkIGd1ZXNzOiBJIHRoaW5rIGl0
IG1heWJlIHNheWluZyB0aGF0IGR1ZSB0bwoKCWluY29uc2lzdGVudCB7SEFSRElSUS1PTi1XfSAt
PiB7SU4tSEFSRElSUS1XfSB1c2FnZS4KCnRoZSBjcml0aWNhbCBjb2RlIG1heSBzb21laG93IGJl
IGludGVycnVwdGVkIGFuZCwgd2hpbGUgaGFuZGxpbmcgdGhlCmludGVycnVwdCwgdHJ5IHRvIGFj
cXVpcmUgdGhlIHNhbWUgbG9jayBhZ2Fpbi4KCkd1ZW50ZXIKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
