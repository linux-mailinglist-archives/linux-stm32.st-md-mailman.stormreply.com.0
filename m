Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 243D89FA955
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Dec 2024 03:24:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B288CC7803A;
	Mon, 23 Dec 2024 02:24:03 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8585C78039
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Dec 2024 02:23:55 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5d3cf094768so6196877a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 Dec 2024 18:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734920635; x=1735525435;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mzTaQw0I4DCqNdV3XbT1uU84Y8+BcPXmBxbBNcSW7I0=;
 b=QtnH0xO0J158nrzASKEe3qtguT+EgOO6bxdZ4yMYJBAfuYHOZs83bFV1TvxThp0qEN
 +IdhBPmf+mNEmAVDZn0yl1Ta4TNH+7eEHwqfiPHN9Ghnj9KFzVYrSPJVaoeXbOADSyBW
 zyMoi/Y7pN5x7CIDf0mrHYn4tFQZ7mkGC5NqOWIEIVs8phfsCL0JaDKS+FYmpjZr3kW3
 USEN76uuzl4dke7KNIPNvVBqEW9VfZGnPDOFvm9g5K2b4fAbPpFGwnz13z+3Fv/dso7K
 CH2PHCpRY3MxJ4cdMZwFmbvEF8wP1n+W2vDZLONh6NrmkV50tDVz42NPPLmxlO9bX41F
 JpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734920635; x=1735525435;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mzTaQw0I4DCqNdV3XbT1uU84Y8+BcPXmBxbBNcSW7I0=;
 b=ItCVjpcWPP3+wKqfqRpdOVMtGknT5nBd2mARIItDR4vji6BfHVFx8E0jde5/kO8o68
 Bi8cpFb/IofGO58xa1sN/AFVCCDjLUQh0ku+F1tsq3pA6Wl/uvBh0h+GsF+x9jbqedxz
 yadVilni9weWfBTg7ZXd5FKfqvRWY11Vo/jjlQfX5VE6+lC0VmQp9Ohv89VmBucCcLfH
 8NDiJ7H+BV2E9GN3tSN02VNKuFa3xPDCfsPWXrU8ygcTB8jzf7h/MNiNQn3b5OYdFPaS
 EPL6N9xhrRr7fFoYAevuXYK3wwKMCDmR4FBWNJjN5nJe4kT+GYQYNu7KQ/qn5tAuRr10
 dWvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpKDAUf9QOqSNhNRhSgvfgoCJsNAVrvASevLNA3vq1OrmCpJDIOr6JAt5TVP0D7yDakYh5ipISgWZiuA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YypywhNJc0fvEZHYLodiHhvpjqhZLn9BpE/5fbSjtZjMlkiMTKK
 YgFwYZk433xvC3cV+qanetOpLayZ6BuyfyjbEFG5WBzD87kfNn5tzNazT0tkPS06mFEx+2gGDbP
 AAFNRP7hr8x1rzBdCwxYxrBIbr0o=
X-Gm-Gg: ASbGncunnPm+WYTZhoMPSAFiEd41xuh7ka9STeOIH0BA9dFihkWywgEmd8XDTvJR1rp
 O7tr+YNQJ5CLs72LsipGkU1DI48NKqKjYLbLnjOcVv7pfC9Ya6vhDBIYBO+u7iuJfOrS78c0=
X-Google-Smtp-Source: AGHT+IFOQ+YJJjZ98YVVZNwOrG0qsOM9r08CSwciPXEClz4vbTeokWJahyw8uhtMV2WnJ1NN+6tN5a7MOjvOSmVwcIw=
X-Received: by 2002:a05:6402:5251:b0:5cf:43c1:6ba7 with SMTP id
 4fb4d7f45d1cf-5d81de162acmr11181357a12.30.1734920635218; Sun, 22 Dec 2024
 18:23:55 -0800 (PST)
MIME-Version: 1.0
References: <20241215204014.4076659-1-zmw12306@gmail.com>
 <9745b3ee-ae89-4edb-8ff7-b20096dbe1de@denx.de>
In-Reply-To: <9745b3ee-ae89-4edb-8ff7-b20096dbe1de@denx.de>
From: Mingwei Zheng <zmw12306@gmail.com>
Date: Sun, 22 Dec 2024 21:23:43 -0500
X-Gm-Features: AbW1kvZUUzJKKpkCx1FgWYjvLlCb7cV9If9o4mEuNky8MJMq5ODnIq-nWEKhIdY
Message-ID: <CAN4iqtRuj9M=GzFbY-hY4Ks3ktSKfA2W5yLT19vkJ2CSe1it9Q@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: make24@iscas.ac.cn, linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
 peng.fan@nxp.com, linux-gpio@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>, fabien.dessenne@foss.st.com,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5] pinctrl: stm32: Add check for
	clk_enable()
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

SGkgTWFyZWssCgpPbiBTdW4sIERlYyAxNSwgMjAyNCBhdCA2OjU04oCvUE0gTWFyZWsgVmFzdXQg
PG1hcmV4QGRlbnguZGU+IHdyb3RlOgo+Cj4gT24gMTIvMTUvMjQgOTo0MCBQTSwgTWluZ3dlaSBa
aGVuZyB3cm90ZToKPgo+IFsuLi5dCj4KPiA+IEBAIC0xNjE3LDEwICsxNjAyLDE4IEBAIGludCBz
dG0zMl9wY3RsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgICAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gICAgICAgfQo+ID4gICAgICAgcGN0bC0+YmFua3Mg
PSBkZXZtX2tjYWxsb2MoZGV2LCBiYW5rcywgc2l6ZW9mKCpwY3RsLT5iYW5rcyksCj4gPiAtICAg
ICAgICAgICAgICAgICAgICAgR0ZQX0tFUk5FTCk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBHRlBfS0VSTkVMKTsKPgo+IFBsZWFzZSBkcm9wIHRoaXMgb25lIGNoYW5nZS4K
CkZpeGVkIGluIFBBVENIIHY2LgoKPgo+ID4gICAgICAgaWYgKCFwY3RsLT5iYW5rcykKPiA+ICAg
ICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gPgo+ID4gKyAgICAgcGN0bC0+Y2xrcyA9IGRl
dm1fa2NhbGxvYyhkZXYsIGJhbmtzLCBzaXplb2YoKnBjdGwtPmNsa3MpLAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBHRlBfS0VSTkVMKTsKPiA+ICsgICAgIGlmICghcGN0bC0+
Y2xrcykKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gPiArCj4gPiArICAgICBm
b3IgKGkgPSAwOyBpIDwgYmFua3M7ICsraSkKPiA+ICsgICAgICAgICAgICAgcGN0bC0+Y2xrc1tp
XS5pZCA9ICIiOwo+Cj4gSXMgdGhpcyBeIGFzc2lnbm1lbnQgbmVjZXNzYXJ5ID8gSWYgc28sIHdo
eSA/Cj4KPiBbLi4uXQoKVGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dC4gV2UgY2FsbCBkZXZt
X2Nsa19idWxrX2dldF9hbGwgaW4Kc3RtMzJfcGN0bF9wcm9iZSgpIHRvIGhhbmRsZSBnZXQgY2xr
IGluIFBBVENIIHY2LgoKQmVzdCwKTWluZ3dlaQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
