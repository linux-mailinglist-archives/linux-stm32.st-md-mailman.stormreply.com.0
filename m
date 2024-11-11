Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D378A9C46F6
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Nov 2024 21:36:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B365C78F6B;
	Mon, 11 Nov 2024 20:36:35 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6467C78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 20:36:28 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-460d1145cd8so38952961cf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 12:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731357387; x=1731962187;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h4HZ0ndgBSEIXVqSFh0OWbpXw2/Yq3xXYi8N9kbsxR4=;
 b=icEqr2u8JOgUhNze9mngBsMW4cMd+DquZfgdS7fUpWYmhy936yy0V7p+gWA4t8aBT9
 dQYUFrcG4F1Bmpua+0B/5IV8ELL0ts5SrXxLj/StailioXhQAzIwUqLytdBoMpPW3m14
 e8QdQ02SneKZKmirzzgyQ96rFq2837J9KumMwBNUxX3u149F3ihEKyDWCuBi5fu3MWEV
 CdYgFEJZb6gL2Wb1862yOhmzoZU3iQFVx+t5WsqWYXXjI8IVhz/IhK8bk210juey7N9S
 2pV3xb+1oulwqzwLI96gT+dFB2vLSx8x7YKosakk+BclQ5hjRy4d0xrWwj0x4A0Apdog
 MDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731357387; x=1731962187;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h4HZ0ndgBSEIXVqSFh0OWbpXw2/Yq3xXYi8N9kbsxR4=;
 b=j+f3wfl5PpU9Nxt2Y3Ck1XQHGiByJdO5do2SYSZyygwAsy/gLuIyUqUWw2rvgDDcAx
 AMy8nQAY6fZvBfqCt91FZdSq+hetTHDOFc/T4vdnOnLowbrjuwaxUqi3UPXrzMwRVYVM
 WMlnxw4fbgP+yhO2rPr1jM1apStI0EXIIgqCG2hSJkNYTRxICFkJfX2/1JNYV2bQlXX1
 iq/UuzkOswulMAi2wWJ6mnTiHt+4gEGoEwPOv+Eii/y5D7S5L84oETzRh5ngOQ1ItW1P
 OAwmU+resYkrxzysV3nxXz8e6UghYWSsae8bqPmZnpbwVXNINIM+0VLviArohMkBZX62
 NQsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6EdPeGh6E1qfXB6y9QbNDyglWK6/iAQyn0kpsz+Pbb/oN7U4R0+GBVbVdLpS7vpUeZ0Ui79ritNni8w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwI/fDS5I9J6MNlVZApvGFlvL2C/EkICGxeNU7+wyaI4m8D2L6T
 C6WZpf8veEK+FYetw4iomyBqIaHQF4W59ahRqOzaFr/JuvyYhH88JJh4c3TxwokspbTVdEx/oa/
 05tKmDr4sSqdk4F+JKOKbm0vY8lg=
X-Google-Smtp-Source: AGHT+IGGFUQEIwnDUiJPFPcrC/oKvlw+uylOh5ATXUlyzXultio50WXUAADdwKWpkEa1W8MriQQZjOqXmZVZqAV7yKc=
X-Received: by 2002:ac8:7dc8:0:b0:461:29d9:e86 with SMTP id
 d75a77b69052e-4630921899amr212981011cf.0.1731357387457; Mon, 11 Nov 2024
 12:36:27 -0800 (PST)
MIME-Version: 1.0
References: <20241111191934.17231-1-jiashengjiangcool@gmail.com>
 <8505aa28-5f88-4fcd-b3bc-cb5db89d2a08@baylibre.com>
In-Reply-To: <8505aa28-5f88-4fcd-b3bc-cb5db89d2a08@baylibre.com>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Mon, 11 Nov 2024 15:36:16 -0500
Message-ID: <CANeGvZVE6fX5hV-p1xXsGR=Z=pABzDtvV9wY_XBbLwJUWNVtyQ@mail.gmail.com>
To: David Lechner <dlechner@baylibre.com>
Cc: tgamblin@baylibre.com, lars@metafoo.de, benjamin.gaignard@linaro.org,
 linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 u.kleine-koenig@baylibre.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v3] iio: trigger: stm32-timer-trigger: Add
	check for clk_enable()
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

T24gTW9uLCBOb3YgMTEsIDIwMjQgYXQgMjo0NeKAr1BNIERhdmlkIExlY2huZXIgPGRsZWNobmVy
QGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4KPiBPbiAxMS8xMS8yNCAxOjE5IFBNLCBKaWFzaGVuZyBK
aWFuZyB3cm90ZToKPiA+IEFkZCBjaGVjayBmb3IgdGhlIHJldHVybiB2YWx1ZSBvZiBjbGtfZW5h
YmxlKCkgaW4gb3JkZXIgdG8gY2F0Y2ggdGhlCj4gPiBwb3RlbnRpYWwgZXhjZXB0aW9uLgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IEppYXNoZW5nIEppYW5nIDxqaWFzaGVuZ2ppYW5nY29vbEBnbWFp
bC5jb20+Cj4gPiAtLS0KPiA+IENoYW5nZWxvZzoKPiA+Cj4gPiB2MiAtPiB2MzoKPiA+Cj4gPiAx
LiBTaW1wbGlmeSBjb2RlIHdpdGggY2xlYW51cCBoZWxwZXJzLgo+ID4KPiA+IHYxIC0+IHYyOgo+
ID4KPiA+IDEuIFJlbW92ZSB1bnN1aXRhYmxlIGRldl9lcnJfcHJvYmUoKS4KPiA+IC0tLQo+Cj4g
Li4uCj4KPiA+IEBAIC00OTIsMjEgKzQ5NSwyNSBAQCBzdGF0aWMgaW50IHN0bTMyX2NvdW50ZXJf
d3JpdGVfcmF3KHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsCj4gPiAgICAgICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOwo+ID4KPiA+ICAgICAgIGNhc2UgSUlPX0NIQU5fSU5GT19FTkFCTEU6Cj4g
PiAtICAgICAgICAgICAgIG11dGV4X2xvY2soJnByaXYtPmxvY2spOwo+ID4gLSAgICAgICAgICAg
ICBpZiAodmFsKSB7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgaWYgKCFwcml2LT5lbmFibGVk
KSB7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwcml2LT5lbmFibGVkID0gdHJ1
ZTsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNsa19lbmFibGUocHJpdi0+Y2xr
KTsKPiA+IC0gICAgICAgICAgICAgICAgICAgICB9Cj4gPiAtICAgICAgICAgICAgICAgICAgICAg
cmVnbWFwX3NldF9iaXRzKHByaXYtPnJlZ21hcCwgVElNX0NSMSwgVElNX0NSMV9DRU4pOwo+ID4g
LSAgICAgICAgICAgICB9IGVsc2Ugewo+ID4gLSAgICAgICAgICAgICAgICAgICAgIHJlZ21hcF9j
bGVhcl9iaXRzKHByaXYtPnJlZ21hcCwgVElNX0NSMSwgVElNX0NSMV9DRU4pOwo+ID4gLSAgICAg
ICAgICAgICAgICAgICAgIGlmIChwcml2LT5lbmFibGVkKSB7Cj4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwcml2LT5lbmFibGVkID0gZmFsc2U7Cj4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjbGtfZGlzYWJsZShwcml2LT5jbGspOwo+ID4gKwo+ID4gKyAgICAgICAg
ICAgICBzY29wZWRfZ3VhcmQobXV0ZXgsICZwcml2LT5sb2NrKSB7Cj4gPiArICAgICAgICAgICAg
ICAgICAgICAgaWYgKHZhbCkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYg
KCFwcml2LT5lbmFibGVkKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHByaXYtPmVuYWJsZWQgPSB0cnVlOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZXQgPSBjbGtfZW5hYmxlKHByaXYtPmNsayk7Cj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQpCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIH0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ21h
cF9zZXRfYml0cyhwcml2LT5yZWdtYXAsIFRJTV9DUjEsIFRJTV9DUjFfQ0VOKTsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICB9IGVsc2Ugewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmVnbWFwX2NsZWFyX2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fQ1IxLCBUSU1fQ1IxX0NFTik7
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocHJpdi0+ZW5hYmxlZCkgewo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwcml2LT5lbmFibGVkID0g
ZmFsc2U7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNsa19kaXNh
YmxlKHByaXYtPmNsayk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgfQo+ID4gICAgICAgICAgICAgICB9Cj4gPiAtICAgICAgICAg
ICAgIG11dGV4X3VubG9jaygmcHJpdi0+bG9jayk7Cj4gPiArCj4gPiAgICAgICAgICAgICAgIHJl
dHVybiAwOwo+ID4gICAgICAgfQo+Cj4KPiBBbm90aGVyIHdheSB0byBkbyB0aGlzIHRoYXQgYXZv
aWRzIGNoYW5naW5nIHRoZSBpbmRlbnQKPiBzbyBtdWNoIGlzIHBsYWNpbmcgYnJhY2VzIGFyb3Vu
ZCB0aGUgY2FzZSBib2R5IGxpa2UgdGhpcy4KPiBUaGlzIGFsc28gYXZvaWRzIHRoZSBjb21waWxl
IGVycm9yIGZyb20gdXNpbmcgZ3VhcmQgYWZ0ZXIKPiBjYXNlIGRpcmVjdGx5Lgo+Cj4KPiAgICAg
ICAgIGNhc2UgSUlPX0NIQU5fSU5GT19FTkFCTEU6IHsKPiAgICAgICAgICAgICAgICAgZ3VhcmQo
bXV0ZXgpKCZwcml2LT5sb2NrKTsKPgo+ICAgICAgICAgICAgICAgICBpZiAodmFsKSB7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgaWYgKCFwcml2LT5lbmFibGVkKSB7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwcml2LT5lbmFibGVkID0gdHJ1ZTsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJldCA9IGNsa19lbmFibGUocHJpdi0+Y2xrKTsKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQpCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
fQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ21hcF9zZXRfYml0cyhwcml2LT5yZWdtYXAs
IFRJTV9DUjEsIFRJTV9DUjFfQ0VOKTsKPiAgICAgICAgICAgICAgICAgfSBlbHNlIHsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICByZWdtYXBfY2xlYXJfYml0cyhwcml2LT5yZWdtYXAsIFRJTV9D
UjEsIFRJTV9DUjFfQ0VOKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocHJpdi0+ZW5h
YmxlZCkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJpdi0+ZW5hYmxlZCA9
IGZhbHNlOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2xrX2Rpc2FibGUocHJp
di0+Y2xrKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgIH0K
Pgo+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAgICAgIH0KPgoKTG9va3MgZ3JlYXQu
CkJ1dCB0aGVyZSBpcyBubyBpbmRlbnRhdGlvbiBiZXR3ZWVuICJzd2l0Y2giIGFuZCAiY2FzZSIu
CkFzIGEgcmVzdWx0LCB0aGUgY2xvc2luZyBicmFjZXMgb2YgInN3aXRjaCIgYW5kICJjYXNlIiB3
aWxsCmJlIHBsYWNlZCBpbiB0aGUgc2FtZSBjb2x1bW4uCgpMaWtlIHRoaXM6Cgpzd2l0Y2gobWFz
aykgewpjYXNlIElJT19DSEFOX0lORk9fRU5BQkxFOiB7Cgp9Cn0KCi1KaWFzaGVuZwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
