Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD857799EA6
	for <lists+linux-stm32@lfdr.de>; Sun, 10 Sep 2023 16:31:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D565C6B467;
	Sun, 10 Sep 2023 14:31:25 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EAE6C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 10 Sep 2023 14:31:24 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-58cd9d9dbf5so50234977b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 10 Sep 2023 07:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1694356283; x=1694961083;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7pJN9mc8iAvRntmb6giuyrj5QZXjSHQSZCriCmz1SgI=;
 b=E3aDc8YbUcIBEvu+QDal58v2TVhnryajRjBNPBZvBuF2+fbuDK7kyydtULZmWVkMrR
 6PXCOKo0apsvzWGlzbpNNQGQdXeP347oYIZhOx6mnge+TVpDIX2wPmY+ShQpHZktZ4jv
 hhB5lCvMFHD/U9IZKKki3JGnbq7jS0NJS0HXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694356283; x=1694961083;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7pJN9mc8iAvRntmb6giuyrj5QZXjSHQSZCriCmz1SgI=;
 b=hkmFn6Ob0++mruQop8fl0uZvYKmJOAZXhEftXLUpiTFYOx+dHrPCZApYkhxq8VJmRr
 08NyNw5FpLeFOfU3rT0dfNCbq7pfJIKgjFwxLAJzI5GV/Rszs+YBNjNtAnWScjUfM2iB
 HowlA7cWVjm5MkLhwcDqdKTyG4Gfkdg8xiEpUYZOhoS7t1hBHrtBc/P+/nUb+GQAvmqo
 o6sc8edbL27zaJZ5FBfIevLDP3pLs4GsnMCIumVk02Xse2a2DY6SgMQHw1YBYqi78d5R
 9C76bY7SvacnyM5vxXnr0ICbkRQ8ZPejCZydsnej57i7ss7UkfFKcyXaWz8g4t7lx2aM
 6CSw==
X-Gm-Message-State: AOJu0YyvkujgA49umDiMSsOZxK4sGB/UsbderNYzPkds4affdQM2SkxT
 HtNMuPRUcOjmdOT9eaD0Y+pYH6h52BKeNRggpanplQ==
X-Google-Smtp-Source: AGHT+IGooaOYakHxDPnk2oGDAlpVLnyxSc6uNDPEuGDw/nYS0wqmfR2b8bLoKi8P5yI9KnpQpfXCrI5BYhOTlCuAqdI=
X-Received: by 2002:a0d:c605:0:b0:58f:bda3:7d9 with SMTP id
 i5-20020a0dc605000000b0058fbda307d9mr11456024ywd.26.1694356282958; Sun, 10
 Sep 2023 07:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230904180513.923280-1-dario.binacchi@amarulasolutions.com>
 <738c3b54-1f42-454a-90be-505ceba7544b@app.fastmail.com>
In-Reply-To: <738c3b54-1f42-454a-90be-505ceba7544b@app.fastmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 10 Sep 2023 16:31:11 +0200
Message-ID: <CABGWkvrAdiVa9emp29YM84uSTCMUWGRmH61RziNJ+-mPun_1aA@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH] ARM: dts: stm32: fix SDRAM size on
	stm32f469-disco
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

SGVsbG8gQXJuZCwKCk9uIFNhdCwgU2VwIDksIDIwMjMgYXQgNDoyOOKAr1BNIEFybmQgQmVyZ21h
bm4gPGFybmRAYXJuZGIuZGU+IHdyb3RlOgo+Cj4gT24gTW9uLCBTZXAgNCwgMjAyMywgYXQgMjA6
MDUsIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+ID4gVGhlIGJvYXJkIGlzIGVxdWlwcGVkIHdpdGgg
YSAxMjhNYml0IFNEUkFNLgo+ID4gMTI4TWJpdCA9IDE2IE1ieXRlID0gMTYsNzc3LDIxNiBieXRl
cyA9IDB4MTAwMDAwMC4KPiA+Cj4gPiBGaXhlczogNjI2ZTdlYTAwMjE1ICgiQVJNOiBEVDogc3Rt
MzI6IG1vdmUgZG1hIHRyYW5zbGF0aW9uIHRvIGJvYXJkIGZpbGVzIikKPiA+IExpbms6IGh0dHBz
Oi8vd3d3LnN0LmNvbS9lbi9ldmFsdWF0aW9uLXRvb2xzLzMyZjQ2OWlkaXNjb3ZlcnkuaHRtbAo+
ID4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFz
b2x1dGlvbnMuY29tPgo+ID4KPiA+IC0tLQo+ID4KPiA+ICBhcmNoL2FybS9ib290L2R0cy9zdC9z
dG0zMmY0NjktZGlzY28uZHRzIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0
cy9zdC9zdG0zMmY0NjktZGlzY28uZHRzCj4gPiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMy
ZjQ2OS1kaXNjby5kdHMKPiA+IGluZGV4IGNiYmQ1MjFiZjAxMC4uZjE3M2E1ODkyYjdkIDEwMDY0
NAo+ID4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJmNDY5LWRpc2NvLmR0cwo+ID4g
KysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJmNDY5LWRpc2NvLmR0cwo+ID4gQEAgLTg0
LDcgKzg0LDcgQEAgdmRkX2RzaTogdmRkLWRzaSB7Cj4gPiAgICAgICB9Owo+ID4KPiA+ICAgICAg
IHNvYyB7Cj4gPiAtICAgICAgICAgICAgIGRtYS1yYW5nZXMgPSA8MHhjMDAwMDAwMCAweDAgMHgx
MDAwMDAwMD47Cj4gPiArICAgICAgICAgICAgIGRtYS1yYW5nZXMgPSA8MHhjMDAwMDAwMCAweDAg
MHgxMDAwMDAwPjsKPiA+ICAgICAgIH07Cj4KPiBUaGUgZG1hLXJhbmdlcyBzaG91bGQgYmUgaW5k
ZXBlbmRlbnQgb2YgdGhlIGluc3RhbGxlZAo+IG1lbW9yeSwgdGhleSB1c3VhbGx5IHJlZmxlY3Qg
dGhlIGFkZHJlc3NpbmcgY2FwYWJpbGl0aWVzCj4gb2YgdGhlIGJ1cywgc28gdGhpcyBwYXRjaCBz
aG91bGQgbm90IGJlIG5lZWRlZC4KClRoYW5rIHlvdSBmb3IgdGhlIGV4cGxhbmF0aW9uLgoKUXVl
c3Rpb24sIGNvdWxkIEkgdGhlbiB1c2UgdGhpcyBub2RlIHRvIGRlc2NyaWJlIHRoZSBpbnN0YWxs
ZWQgbWVtb3J5PwoKbWVtb3J5QGMwMDAwMDAwIHsKICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAi
bWVtb3J5IjsKICAgICAgICAgICAgcmVnID0gPDB4QzAwMDAwMDAgMHgxMDAwMDAwPjsKfTsKCkkg
cmVjZW50bHkgc3VibWl0dGVkIHRoaXMgc2VyaWVzIHRvIFUtQm9vdAooaHR0cHM6Ly9wYXRjaHdv
cmsub3psYWJzLm9yZy9wcm9qZWN0L3Vib290L3BhdGNoLzIwMjMwOTAzMjA1NzAzLjY2MjA4MC01
LWRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tLyksCmFuZCBJIHdvdWxkIGxpa2Ug
dG8gYWxsb2NhdGUgdGhlIGZyYW1lYnVmZmVyIGJ5IHJldHJpZXZpbmcgdGhlIGNvcnJlY3QKaW5m
b3JtYXRpb24gZnJvbSB0aGUgZGV2aWNlIHRyZWUsIHdpdGhvdXQgd2lyaW5nIGFueXRoaW5nIGlu
IHRoZSBjb2RlLgoKVGhhbmtzIGFuZCByZWdhcmRzLAoKRGFyaW8KCj4KPiAgICAgICBBcm5kCgoK
Ci0tIAoKRGFyaW8gQmluYWNjaGkKClNlbmlvciBFbWJlZGRlZCBMaW51eCBEZXZlbG9wZXIKCmRh
cmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCgoKQW1hcnVsYSBTb2x1dGlvbnMgU1JMCgpWaWEgTGUgQ2FuZXZhcmUgMzAs
IDMxMTAwIFRyZXZpc28sIFZlbmV0bywgSVQKClQuICszOSAwNDIgMjQzIDUzMTAKaW5mb0BhbWFy
dWxhc29sdXRpb25zLmNvbQoKd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
