Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA714971E2D
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Sep 2024 17:38:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46CADC6DD9E;
	Mon,  9 Sep 2024 15:38:53 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18B65C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Sep 2024 15:38:46 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-6db449f274fso32348627b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Sep 2024 08:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725896324; x=1726501124;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mFPvrWEZnfEN8TWP1cJnvMCekclj4UD9Cp6NnLKH86A=;
 b=EL1ENIb/KZe1mi+do2SWS6wAPuWfoilWKme3kvZGwGyQlkNA8dGa2W0ATuyfhDhuGd
 YXmLcwtoNueNeRbsFSdDAQHWAbkGl5arjdKCSaDrhoQvd3WEtW9mXM1JlpXBUPbaJUle
 qDz+AKmlj/Djt+s69dj2t6L1sNmUibHNmOd9/zNbDdUGgwRYX2+587GN8NZntVNDA0Bg
 eVvo+1YEKFRBrXzm1dxG8aO8ctfVHGHIa7eIqXfAOY5CWP7VHO+DvyuVJjzLmpmYAL/5
 XnPCJBm8ehB9dJl9EHSYhgYLsya2/sfEUuxY5NRhcicekWBhYzhEWGV5gULaHOm2yYtm
 ykYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEEqurr9UiEt3N9J2UC0g44XKPQphgHcOFYr8HqfHblB9zrvjbQO17mK6vy9G16cG9Pi+pIH3z0+G7YA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywu464eJ2BwoyYBHOV79OXs3Mt9dpa6rcaTSJCF/JrEwOuDgE3B
 /X53NGk1gxWaFIVgtP47QluSteyzLp6HBKA4VjiImrNorCbqilWYG0j1y6tJ
X-Google-Smtp-Source: AGHT+IG/pw1wV/WPxE/MQqn9HOH2x/x2weEzqA2PkF2Ij97qn/vHQL7ZEamuuNjdiEDuyRDG/motRA==
X-Received: by 2002:a05:690c:338c:b0:6ae:486c:59f with SMTP id
 00721157ae682-6db4516c9a8mr134542157b3.29.1725896324247; 
 Mon, 09 Sep 2024 08:38:44 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com.
 [209.85.128.177]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6db5c659c54sm9464757b3.63.2024.09.09.08.38.43
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 08:38:43 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6d5893cd721so39747097b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Sep 2024 08:38:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUhjFXDID8zAhx8ybof4T0oOb65p/nnzJrwz2MIqK9CdiXdRuOEGuz78TvdesVk4dyddjkHsLdx10E2kA==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:690c:a99:b0:6d7:4dea:5f16 with SMTP id
 00721157ae682-6db45133363mr150456127b3.26.1725896323567; Mon, 09 Sep 2024
 08:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240909144026.870565-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20240909144026.870565-2-u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Sep 2024 17:38:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXOwfHgLwCSB-koVjW0eHDXkNvo_Af8eRkfbLPdU8ZrsA@mail.gmail.com>
Message-ID: <CAMuHMdXOwfHgLwCSB-koVjW0eHDXkNvo_Af8eRkfbLPdU8ZrsA@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 arm-scmi@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] clk: Switch back to struct
	platform_driver::remove()
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

T24gTW9uLCBTZXAgOSwgMjAyNCBhdCA0OjQw4oCvUE0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
aW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+IHdyb3RlOgo+IEFmdGVyIGNvbW1pdCAwZWRiNTU1YTY1
ZDEgKCJwbGF0Zm9ybTogTWFrZSBwbGF0Zm9ybV9kcml2ZXI6OnJlbW92ZSgpCj4gcmV0dXJuIHZv
aWQiKSAucmVtb3ZlKCkgaXMgKGFnYWluKSB0aGUgcmlnaHQgY2FsbGJhY2sgdG8gaW1wbGVtZW50
IGZvcgo+IHBsYXRmb3JtIGRyaXZlcnMuCj4KPiBDb252ZXJ0IGFsbCBjbGsgZHJpdmVycyB0byB1
c2UgLnJlbW92ZSgpLCB3aXRoIHRoZSBldmVudHVhbCBnb2FsIHRvIGRyb3AKPiBzdHJ1Y3QgcGxh
dGZvcm1fZHJpdmVyOjpyZW1vdmVfbmV3KCkuIEFzIC5yZW1vdmUoKSBhbmQgLnJlbW92ZV9uZXco
KSBoYXZlCj4gdGhlIHNhbWUgcHJvdG90eXBlcywgY29udmVyc2lvbiBpcyBkb25lIGJ5IGp1c3Qg
Y2hhbmdpbmcgdGhlIHN0cnVjdHVyZQo+IG1lbWJlciBuYW1lIGluIHRoZSBkcml2ZXIgaW5pdGlh
bGl6ZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29l
bmlnQGJheWxpYnJlLmNvbT4KCj4gIGRyaXZlcnMvY2xrL3JlbmVzYXMvcmNhci11c2IyLWNsb2Nr
LXNlbC5jICAgICAgIHwgMiArLQoKQWNrZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQr
cmVuZXNhc0BnbGlkZXIuYmU+ICMgcmVuZXNhcwoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdz
IGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBl
cnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxm
IGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5
ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
