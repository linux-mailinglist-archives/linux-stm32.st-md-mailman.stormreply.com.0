Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E13232C73
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Jul 2020 09:19:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 269D9C36B37;
	Thu, 30 Jul 2020 07:19:58 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 370D9C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jul 2020 17:49:15 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id z3so9938787ilh.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jul 2020 10:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ycpaC4HDS5mWn3wrZmk78uipQQWS0G3LEzZ0F3Dgd/U=;
 b=RRkWoHYwzXDFpUWYKFbsbzM3WXIDK7iWfjPNTsozoCQfOYxT7sbXZhXSzYdKGwwB0H
 KpaST50MGkKYzAFhpwY4qgurIay8CcPHtQn8ABhCznnMp2vv289WbzaCMlyYHJT3NTeS
 Go9xud04+Q3Y/zDYQfL/TddYRe9boA1FNbQkCXEXHijXE/+x6lEs0Jwt0BG2XAZCz/lH
 2rHM326tBGOGKMVLUqgpGfLtEnoxMFTIdsKHTEQ3/1kZVFHHMYvNG3yP03qecvJyJ25W
 HBH1kiPZAP4BnYRBqBTU8mBqelSqsXd8BJjb+eEzvJl2M2zlsGl885slmt9In/+WHJyb
 14YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ycpaC4HDS5mWn3wrZmk78uipQQWS0G3LEzZ0F3Dgd/U=;
 b=oc0Z372v9EgPEY66tkTeDf0S7Q5BqkGrRRxaEfD61ZunEVqGPI7HQK8C1wXl9mz+HM
 Lp4QIsT2NEJayg6sU9XXdPCswakRpq8w+DgWszvnQGofBj7i2mjU3aEJxAhakmRh6u5c
 kN9Jd6mp8nC/ISRIQ8jDgyaJ3Ac4LUpSUDm3pcUSMCNCrvo6riiDm5ZbaOd/HzLVouvE
 9uk5gRdgbWTdawrAR8FFNDbIt9B/cC3vGGOI8yJkGRhT+kfZnoH6x4FqxWdubXWeqfVc
 BjcvvquVNU9MyjOwO84LqtreZmw8RakhezD220IX7Br6LQz5hfKa5cYeDp26AgZRna9u
 l26g==
X-Gm-Message-State: AOAM5302fGWu6DVJsmKB/MBgJ+IKnvdBXmIxQVbeNYZfE6y5BW3ZgneE
 Em2U2jQ1yMTYII5q5OHARpb4G/JnAGpSk/N1xnM=
X-Google-Smtp-Source: ABdhPJwWoVUeS4X9JOjdrnx4Ap+phImEIiTzRGwLP5R7zQh4ra0gphXJu3YCyKiDLAJgGFxYKrDoA1WvmtLqwKPS00Y=
X-Received: by 2002:a05:6e02:e10:: with SMTP id
 a16mr16254401ilk.204.1596044954472; 
 Wed, 29 Jul 2020 10:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200729160942.28867-1-krzk@kernel.org>
 <20200729160942.28867-4-krzk@kernel.org>
In-Reply-To: <20200729160942.28867-4-krzk@kernel.org>
From: Tomasz Figa <tomasz.figa@gmail.com>
Date: Wed, 29 Jul 2020 19:49:02 +0200
Message-ID: <CA+Ln22HWNSwVWARKL2NeUVx1y5yqHe0SGPZ1hcqBW88awySfPA@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailman-Approved-At: Thu, 30 Jul 2020 07:19:57 +0000
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "moderated list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>,
 Sylwester Nawrocki <snawrocki@kernel.org>, Cedric Roux <sed@free.fr>,
 Russell King <linux@armlinux.org.uk>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 Lihua Yao <ylhuajnu@outlook.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, Sergio Prado <sergio.prado@e-labworks.com>,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Simtec Linux Team <linux@simtec.co.uk>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Vincent Sanders <vince@simtec.co.uk>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [Linux-stm32] [PATCH 3/7] ARM: s3c: Remove
	plat-samsung/.../samsung-time.h
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

MjAyMOW5tDfmnIgyOeaXpSjmsLQpIDE4OjExIEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2Vy
bmVsLm9yZz46Cj4KPiBSZW1vdmUgdGhlIGFyY2gvYXJtL3BsYXQtc2Ftc3VuZy9pbmNsdWRlL3Bs
YXQvc2Ftc3VuZy10aW1lLmggaGVhZGVyIGFuZAo+IG1vdmUgdGhlIGNvbnRlbnRzIHRvIGNvbW1v
bi5oIGhlYWRlcnMgaW4gbWFjaC1zM2MyNHh4IGFuZCBtYWNoLXMzYzY0eHguCj4gVGhlIGRlZmlu
aXRpb24gb2YgZGVjbGFyZWQgZnVuY3Rpb25zIGlzIGFscmVhZHkgaW4gY29tbW9uLmMgaW4gbWFj
aAo+IGRpcmVjdG9yaWVzLCBzbyBpdCBpcyBsb2dpY2FsbHkgdG8gcHV0IGRlY2xhcmF0aW9uIG5l
eHQgdG8gdGhlbS4KPgo+IFRoaXMgaXMgYWxzbyBvbmUgc3RlcCBmdXJ0aGVyIHRvd2FyZHMgcmVt
b3ZhbCBvZiBwbGF0LXNhbXN1bmcgZGlyZWN0b3J5Cj4gYW5kIGl0IGZpeGVzIFc9MSBidWlsZCB3
YXJuaW5nczoKPgo+ICAgICBhcmNoL2FybS9tYWNoLXMzYzY0eHgvY29tbW9uLmM6MTc0OjEzOiB3
YXJuaW5nOgo+ICAgICAgICAgbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciAnc2Ftc3VuZ19zZXRf
dGltZXJfc291cmNlJyBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gICAgICAgMTc0IHwgdm9pZCBf
X2luaXQgc2Ftc3VuZ19zZXRfdGltZXJfc291cmNlKHVuc2lnbmVkIGludCBldmVudCwgdW5zaWdu
ZWQgaW50IHNvdXJjZSkKPgo+ICAgICBhcmNoL2FybS9tYWNoLXMzYzY0eHgvY29tbW9uLmM6MTgw
OjEzOiB3YXJuaW5nOgo+ICAgICAgICAgbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciAnc2Ftc3Vu
Z190aW1lcl9pbml0JyBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gICAgICAgMTgwIHwgdm9pZCBf
X2luaXQgc2Ftc3VuZ190aW1lcl9pbml0KHZvaWQpCj4KPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0
b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGFyY2gvYXJtL21hY2gtczNj
MjR4eC9jb21tb24uaCAgICAgICAgICAgICAgICB8IDEyICsrKysrKysrKwo+ICBhcmNoL2FybS9t
YWNoLXMzYzI0eHgvbWFjaC1hbWxtNTkwMC5jICAgICAgICAgfCAgMiAtLQo+ICBhcmNoL2FybS9t
YWNoLXMzYzI0eHgvbWFjaC1hbnViaXMuYyAgICAgICAgICAgfCAgMSAtCj4gIGFyY2gvYXJtL21h
Y2gtczNjMjR4eC9tYWNoLWF0MjQ0MGV2Yi5jICAgICAgICB8ICAxIC0KPiAgYXJjaC9hcm0vbWFj
aC1zM2MyNHh4L21hY2gtYmFzdC5jICAgICAgICAgICAgIHwgIDEgLQo+ICBhcmNoL2FybS9tYWNo
LXMzYzI0eHgvbWFjaC1ndGEwMi5jICAgICAgICAgICAgfCAgMSAtCj4gIGFyY2gvYXJtL21hY2gt
czNjMjR4eC9tYWNoLWgxOTQwLmMgICAgICAgICAgICB8ICAxIC0KPiAgYXJjaC9hcm0vbWFjaC1z
M2MyNHh4L21hY2gtaml2ZS5jICAgICAgICAgICAgIHwgIDEgLQo+ICBhcmNoL2FybS9tYWNoLXMz
YzI0eHgvbWFjaC1taW5pMjQ0MC5jICAgICAgICAgfCAgMSAtCj4gIGFyY2gvYXJtL21hY2gtczNj
MjR4eC9tYWNoLW4zMC5jICAgICAgICAgICAgICB8ICAxIC0KPiAgYXJjaC9hcm0vbWFjaC1zM2My
NHh4L21hY2gtbmV4Y29kZXIuYyAgICAgICAgIHwgIDEgLQo+ICBhcmNoL2FybS9tYWNoLXMzYzI0
eHgvbWFjaC1vc2lyaXMuYyAgICAgICAgICAgfCAgMSAtCj4gIGFyY2gvYXJtL21hY2gtczNjMjR4
eC9tYWNoLW90b20uYyAgICAgICAgICAgICB8ICAxIC0KPiAgYXJjaC9hcm0vbWFjaC1zM2MyNHh4
L21hY2gtcXQyNDEwLmMgICAgICAgICAgIHwgIDEgLQo+ICBhcmNoL2FybS9tYWNoLXMzYzI0eHgv
bWFjaC1yeDE5NTAuYyAgICAgICAgICAgfCAgMSAtCj4gIGFyY2gvYXJtL21hY2gtczNjMjR4eC9t
YWNoLXJ4MzcxNS5jICAgICAgICAgICB8ICAxIC0KPiAgYXJjaC9hcm0vbWFjaC1zM2MyNHh4L21h
Y2gtc21kazI0MTAuYyAgICAgICAgIHwgIDEgLQo+ICBhcmNoL2FybS9tYWNoLXMzYzI0eHgvbWFj
aC1zbWRrMjQxMy5jICAgICAgICAgfCAgMSAtCj4gIGFyY2gvYXJtL21hY2gtczNjMjR4eC9tYWNo
LXNtZGsyNDE2LmMgICAgICAgICB8ICAxIC0KPiAgYXJjaC9hcm0vbWFjaC1zM2MyNHh4L21hY2gt
c21kazI0NDAuYyAgICAgICAgIHwgIDEgLQo+ICBhcmNoL2FybS9tYWNoLXMzYzI0eHgvbWFjaC1z
bWRrMjQ0My5jICAgICAgICAgfCAgMSAtCj4gIGFyY2gvYXJtL21hY2gtczNjMjR4eC9tYWNoLXRj
dF9oYW1tZXIuYyAgICAgICB8ICAxIC0KPiAgYXJjaC9hcm0vbWFjaC1zM2MyNHh4L21hY2gtdnIx
MDAwLmMgICAgICAgICAgIHwgIDEgLQo+ICBhcmNoL2FybS9tYWNoLXMzYzI0eHgvbWFjaC12c3Rt
cy5jICAgICAgICAgICAgfCAgMSAtCj4gIGFyY2gvYXJtL21hY2gtczNjNjR4eC9jb21tb24uaCAg
ICAgICAgICAgICAgICB8IDEzICsrKysrKysrKysKPiAgYXJjaC9hcm0vbWFjaC1zM2M2NHh4L21h
Y2gtYW53NjQxMC5jICAgICAgICAgIHwgIDEgLQo+ICBhcmNoL2FybS9tYWNoLXMzYzY0eHgvbWFj
aC1jcmFnNjQxMC5jICAgICAgICAgfCAgMSAtCj4gIGFyY2gvYXJtL21hY2gtczNjNjR4eC9tYWNo
LWhtdC5jICAgICAgICAgICAgICB8ICAxIC0KPiAgYXJjaC9hcm0vbWFjaC1zM2M2NHh4L21hY2gt
bWluaTY0MTAuYyAgICAgICAgIHwgIDEgLQo+ICBhcmNoL2FybS9tYWNoLXMzYzY0eHgvbWFjaC1u
Y3AuYyAgICAgICAgICAgICAgfCAgMSAtCj4gIGFyY2gvYXJtL21hY2gtczNjNjR4eC9tYWNoLXJl
YWw2NDEwLmMgICAgICAgICB8ICAxIC0KPiAgYXJjaC9hcm0vbWFjaC1zM2M2NHh4L21hY2gtc21h
cnRxLmMgICAgICAgICAgIHwgIDEgLQo+ICBhcmNoL2FybS9tYWNoLXMzYzY0eHgvbWFjaC1zbWFy
dHE1LmMgICAgICAgICAgfCAgMSAtCj4gIGFyY2gvYXJtL21hY2gtczNjNjR4eC9tYWNoLXNtYXJ0
cTcuYyAgICAgICAgICB8ICAxIC0KPiAgYXJjaC9hcm0vbWFjaC1zM2M2NHh4L21hY2gtc21kazY0
MDAuYyAgICAgICAgIHwgIDEgLQo+ICBhcmNoL2FybS9tYWNoLXMzYzY0eHgvbWFjaC1zbWRrNjQx
MC5jICAgICAgICAgfCAgMSAtCj4gIC4uLi9wbGF0LXNhbXN1bmcvaW5jbHVkZS9wbGF0L3NhbXN1
bmctdGltZS5oICB8IDI2IC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMzcgZmlsZXMgY2hhbmdlZCwg
MjUgaW5zZXJ0aW9ucygrKSwgNjEgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBh
cmNoL2FybS9wbGF0LXNhbXN1bmcvaW5jbHVkZS9wbGF0L3NhbXN1bmctdGltZS5oCj4KCkZvciB0
aGUgczNjNjR4eCBiaXRzOgoKUmV2aWV3ZWQtYnk6IFRvbWFzeiBGaWdhIDx0b21hc3ouZmlnYUBn
bWFpbC5jb20+CgpJIHN1cHBvc2UgdGhlIG5leHQgc3RlcCB3b3VsZCBiZSByZW5hbWluZyB0aG9z
ZSBmdW5jdGlvbnMgdG8gczNjMjR4eF8qCmFuZCBzM2M2NHh4XyogdG8gYXZvaWQgbmFtaW5nIGNv
bGxpc2lvbnM/CgpCZXN0IHJlZ2FyZHMsClRvbWFzegpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
