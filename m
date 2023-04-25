Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 477AB6EDC8A
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Apr 2023 09:28:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C87F5C69065;
	Tue, 25 Apr 2023 07:28:09 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 469D1C65068
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Apr 2023 07:28:08 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-b980ec2a95cso7303638276.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Apr 2023 00:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682407687; x=1684999687;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uGl5U27dIAVcoPRAhAw7M++MtUvlNkzHHP3i/+uz8BM=;
 b=Tz7px3q6zYfEQPpqvwy59tqwDG/VzvOnP/mzp5XVnx5o8rTMt0cUfsejdQ/KMUYX6P
 Ivldd6oj3QK2h/xL6Y7v4VJR7fmvP1QpJ0T47nPI1sQuCrOojL8jgsuAupGGgzfk0PlH
 TCrDKz7S3eaRaPn/zc0QP3tDMb5iyQhS2GBETnB0IipZGcAthD4jjEt9yAUeJPAsdV4S
 2gwhURVbf70+cOhRBaehYlTuxH4gWT7HWcBzNGeJ/JHsg75yoLqPPBzwV1PQ/Ek0ihgm
 kOq3etJHYtIWgeLdHZ7CrQOZi3HnigZI3Q99N92sPsIR2OBVbHUj41CswI1KM2KlFjAb
 /Kgw==
X-Gm-Message-State: AAQBX9dIabI/QtdzimtBZCkUt3ib4rm5irfFcW3hYZgGOg9uIofQA50p
 ZFp1yaiDEFjN46D/JPmCyG77LmyALKA3qw==
X-Google-Smtp-Source: AKy350Y8Io1vYqIfvaqi4l3dvGvHtkMrO0LADKxA9aCVBqqtLiaTzhfe1xKTHp1UlksEYUI3/8gvcA==
X-Received: by 2002:a25:2085:0:b0:b96:f486:9efa with SMTP id
 g127-20020a252085000000b00b96f4869efamr10847568ybg.40.1682407686863; 
 Tue, 25 Apr 2023 00:28:06 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 130-20020a250f88000000b00b92426aba45sm3342384ybp.57.2023.04.25.00.28.04
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 00:28:05 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-54fe2e39156so63555767b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Apr 2023 00:28:04 -0700 (PDT)
X-Received: by 2002:a81:4e4a:0:b0:54c:9c2:d1be with SMTP id
 c71-20020a814e4a000000b0054c09c2d1bemr10102189ywb.13.1682407684508; Tue, 25
 Apr 2023 00:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Apr 2023 09:27:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
Message-ID: <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ansuel Smith <ansuelsmth@gmail.com>, linux-renesas-soc@vger.kernel.org,
 kernel@dh-electronics.com, Olof Johansson <olof@lixom.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-oxnas@groups.io
Subject: Re: [Linux-stm32] [RFC PATCH 0/1] Categorize ARM dts directory
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

SGkgUm9iLAoKT24gVHVlLCBBcHIgMjUsIDIwMjMgYXQgMTI6MTbigK9BTSBSb2IgSGVycmluZyA8
cm9iaCtkdEBrZXJuZWwub3JnPiB3cm90ZToKPiBJIGhhdmUgYSBzY3JpcHRbMV0gdGhhdCBkb2Vz
IHRoZSBjb252ZXJzaW9uIHdyaXR0ZW4gdGhlIGxhc3QgdGltZSB0aGlzCj4gY2FtZSB1cC4gSnVz
dCBoYXZlIHRvIGFncmVlIG9uIGRpcmVjdG9yeSBuYW1lcy4gSSB0aGluayB0aGUgZWFzaWVzdAo+
IHdvdWxkIGJlIGZvciBBcm5kL09sb2YgdG8gcnVuIGl0IGF0IHRoZSBlbmQgb2YgYSBtZXJnZSB3
aW5kb3cgYmVmb3JlCj4gcmMxLgoKImVtZXYyIiBhbmQgInNoNyIgYXJlIG1pc3NpbmcgZm9yIHJl
bmVzYXMuCgpEb2VzIHlvdXIgc2NyaXB0IGFsc28gY2F0ZXIgZm9yIC5kdHMgZmlsZXMgbm90IG1h
dGNoaW5nIGFueSBwYXR0ZXJuLApidXQgaW5jbHVkaW5nIGEgLmR0c2kgZmlsZSB0aGF0IGRvZXMg
bWF0Y2ggYSBwYXR0ZXJuPwoKPiBJJ20gdmVyeSBtdWNoIGluIGZhdm9yIG9mIHRoaXMgaGFwcGVu
aW5nIGVzcGVjaWFsbHkgYmVmb3JlICphbnkqCj4gb3ZlcmxheXMgYXJlIGFkZGVkIHRvIGFkZCB0
byB0aGUgbWVzcyAoaXQncyBwcm9iYWJseSBhbHJlYWR5Cj4gaGFwcGVuZWQpLgoKOy0pCgo+IFsx
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAxODEyMDQxODM2NDkuR0E1NzE2QGJvZ3Vz
LwoKVGhhbmtzIQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBH
ZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlv
bnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hl
biBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBz
b21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExp
bnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
