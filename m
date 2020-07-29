Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8551A232504
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jul 2020 21:02:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AE13C36B29;
	Wed, 29 Jul 2020 19:02:46 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3960CC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jul 2020 19:02:44 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id g19so11641259ejc.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jul 2020 12:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=F6RvPQWo2rxOQUwgKhzdatI6SzUaFewn4ve7RS5gdpo=;
 b=Km3rNirDci8ACWpblQOYFtlKGE61ojZuMIjTBhQ2RgXV+MJfkEARMX4cnbCgCof7z9
 sIPMtfIKgwfK6V/e2ZgmA1rokArY5BtK+eyPWz4IGeyyqg7FXIbePdJBaWR/+AfTbGJC
 vGRGkruWq7alMMTlhhcSDeLxILhLFAy8lcuYU7Rfye9u2596ZquxVHEFpBPeCdPtwomh
 GmVXUhdvrLqdBPuhsGI4wDZLISKJOxvBQY0yXkgLWQDFbExlhYe1WprNVBs+RLZPEAJv
 IJEODpT8VSFmivclqOlNQOj8cKs/tUkEDpPKLv5f+Ka+37NShT2QJQqZW3Pn5qJV+7Q6
 YZRw==
X-Gm-Message-State: AOAM530ELj5926pCJrhJB4cx1yVehBVZYexK5Fa+yhaNi4B45FAy7HAJ
 +PwqIhIKWk2I5Pr4zkVTXac=
X-Google-Smtp-Source: ABdhPJwrigyfWYWlC1oTscTi/S00vRyVwCtVK1J8TCQ1Ndue3IczGeg0UBI6RW2qdkMOGa4mUYUFCw==
X-Received: by 2002:a17:907:42a0:: with SMTP id
 ny24mr25051905ejb.328.1596049363432; 
 Wed, 29 Jul 2020 12:02:43 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id i10sm2593802edx.42.2020.07.29.12.02.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Jul 2020 12:02:42 -0700 (PDT)
Date: Wed, 29 Jul 2020 21:02:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomasz Figa <tomasz.figa@gmail.com>
Message-ID: <20200729190239.GA5723@kozik-lap>
References: <20200729160942.28867-1-krzk@kernel.org>
 <20200729160942.28867-4-krzk@kernel.org>
 <CA+Ln22HWNSwVWARKL2NeUVx1y5yqHe0SGPZ1hcqBW88awySfPA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+Ln22HWNSwVWARKL2NeUVx1y5yqHe0SGPZ1hcqBW88awySfPA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

T24gV2VkLCBKdWwgMjksIDIwMjAgYXQgMDc6NDk6MDJQTSArMDIwMCwgVG9tYXN6IEZpZ2Egd3Jv
dGU6Cj4gMjAyMOW5tDfmnIgyOeaXpSjmsLQpIDE4OjExIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz46Cj4gPgo+ID4gUmVtb3ZlIHRoZSBhcmNoL2FybS9wbGF0LXNhbXN1bmcv
aW5jbHVkZS9wbGF0L3NhbXN1bmctdGltZS5oIGhlYWRlciBhbmQKPiA+IG1vdmUgdGhlIGNvbnRl
bnRzIHRvIGNvbW1vbi5oIGhlYWRlcnMgaW4gbWFjaC1zM2MyNHh4IGFuZCBtYWNoLXMzYzY0eHgu
Cj4gPiBUaGUgZGVmaW5pdGlvbiBvZiBkZWNsYXJlZCBmdW5jdGlvbnMgaXMgYWxyZWFkeSBpbiBj
b21tb24uYyBpbiBtYWNoCj4gPiBkaXJlY3Rvcmllcywgc28gaXQgaXMgbG9naWNhbGx5IHRvIHB1
dCBkZWNsYXJhdGlvbiBuZXh0IHRvIHRoZW0uCj4gPgo+ID4gVGhpcyBpcyBhbHNvIG9uZSBzdGVw
IGZ1cnRoZXIgdG93YXJkcyByZW1vdmFsIG9mIHBsYXQtc2Ftc3VuZyBkaXJlY3RvcnkKPiA+IGFu
ZCBpdCBmaXhlcyBXPTEgYnVpbGQgd2FybmluZ3M6Cj4gPgo+ID4gICAgIGFyY2gvYXJtL21hY2gt
czNjNjR4eC9jb21tb24uYzoxNzQ6MTM6IHdhcm5pbmc6Cj4gPiAgICAgICAgIG5vIHByZXZpb3Vz
IHByb3RvdHlwZSBmb3IgJ3NhbXN1bmdfc2V0X3RpbWVyX3NvdXJjZScgWy1XbWlzc2luZy1wcm90
b3R5cGVzXQo+ID4gICAgICAgMTc0IHwgdm9pZCBfX2luaXQgc2Ftc3VuZ19zZXRfdGltZXJfc291
cmNlKHVuc2lnbmVkIGludCBldmVudCwgdW5zaWduZWQgaW50IHNvdXJjZSkKPiA+Cj4gPiAgICAg
YXJjaC9hcm0vbWFjaC1zM2M2NHh4L2NvbW1vbi5jOjE4MDoxMzogd2FybmluZzoKPiA+ICAgICAg
ICAgbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciAnc2Ftc3VuZ190aW1lcl9pbml0JyBbLVdtaXNz
aW5nLXByb3RvdHlwZXNdCj4gPiAgICAgICAxODAgfCB2b2lkIF9faW5pdCBzYW1zdW5nX3RpbWVy
X2luaXQodm9pZCkKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnprQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICBhcmNoL2FybS9tYWNoLXMzYzI0eHgvY29tbW9u
LmggICAgICAgICAgICAgICAgfCAxMiArKysrKysrKysKPiA+ICBhcmNoL2FybS9tYWNoLXMzYzI0
eHgvbWFjaC1hbWxtNTkwMC5jICAgICAgICAgfCAgMiAtLQo+ID4gIGFyY2gvYXJtL21hY2gtczNj
MjR4eC9tYWNoLWFudWJpcy5jICAgICAgICAgICB8ICAxIC0KPiA+ICBhcmNoL2FybS9tYWNoLXMz
YzI0eHgvbWFjaC1hdDI0NDBldmIuYyAgICAgICAgfCAgMSAtCj4gPiAgYXJjaC9hcm0vbWFjaC1z
M2MyNHh4L21hY2gtYmFzdC5jICAgICAgICAgICAgIHwgIDEgLQo+ID4gIGFyY2gvYXJtL21hY2gt
czNjMjR4eC9tYWNoLWd0YTAyLmMgICAgICAgICAgICB8ICAxIC0KPiA+ICBhcmNoL2FybS9tYWNo
LXMzYzI0eHgvbWFjaC1oMTk0MC5jICAgICAgICAgICAgfCAgMSAtCj4gPiAgYXJjaC9hcm0vbWFj
aC1zM2MyNHh4L21hY2gtaml2ZS5jICAgICAgICAgICAgIHwgIDEgLQo+ID4gIGFyY2gvYXJtL21h
Y2gtczNjMjR4eC9tYWNoLW1pbmkyNDQwLmMgICAgICAgICB8ICAxIC0KPiA+ICBhcmNoL2FybS9t
YWNoLXMzYzI0eHgvbWFjaC1uMzAuYyAgICAgICAgICAgICAgfCAgMSAtCj4gPiAgYXJjaC9hcm0v
bWFjaC1zM2MyNHh4L21hY2gtbmV4Y29kZXIuYyAgICAgICAgIHwgIDEgLQo+ID4gIGFyY2gvYXJt
L21hY2gtczNjMjR4eC9tYWNoLW9zaXJpcy5jICAgICAgICAgICB8ICAxIC0KPiA+ICBhcmNoL2Fy
bS9tYWNoLXMzYzI0eHgvbWFjaC1vdG9tLmMgICAgICAgICAgICAgfCAgMSAtCj4gPiAgYXJjaC9h
cm0vbWFjaC1zM2MyNHh4L21hY2gtcXQyNDEwLmMgICAgICAgICAgIHwgIDEgLQo+ID4gIGFyY2gv
YXJtL21hY2gtczNjMjR4eC9tYWNoLXJ4MTk1MC5jICAgICAgICAgICB8ICAxIC0KPiA+ICBhcmNo
L2FybS9tYWNoLXMzYzI0eHgvbWFjaC1yeDM3MTUuYyAgICAgICAgICAgfCAgMSAtCj4gPiAgYXJj
aC9hcm0vbWFjaC1zM2MyNHh4L21hY2gtc21kazI0MTAuYyAgICAgICAgIHwgIDEgLQo+ID4gIGFy
Y2gvYXJtL21hY2gtczNjMjR4eC9tYWNoLXNtZGsyNDEzLmMgICAgICAgICB8ICAxIC0KPiA+ICBh
cmNoL2FybS9tYWNoLXMzYzI0eHgvbWFjaC1zbWRrMjQxNi5jICAgICAgICAgfCAgMSAtCj4gPiAg
YXJjaC9hcm0vbWFjaC1zM2MyNHh4L21hY2gtc21kazI0NDAuYyAgICAgICAgIHwgIDEgLQo+ID4g
IGFyY2gvYXJtL21hY2gtczNjMjR4eC9tYWNoLXNtZGsyNDQzLmMgICAgICAgICB8ICAxIC0KPiA+
ICBhcmNoL2FybS9tYWNoLXMzYzI0eHgvbWFjaC10Y3RfaGFtbWVyLmMgICAgICAgfCAgMSAtCj4g
PiAgYXJjaC9hcm0vbWFjaC1zM2MyNHh4L21hY2gtdnIxMDAwLmMgICAgICAgICAgIHwgIDEgLQo+
ID4gIGFyY2gvYXJtL21hY2gtczNjMjR4eC9tYWNoLXZzdG1zLmMgICAgICAgICAgICB8ICAxIC0K
PiA+ICBhcmNoL2FybS9tYWNoLXMzYzY0eHgvY29tbW9uLmggICAgICAgICAgICAgICAgfCAxMyAr
KysrKysrKysrCj4gPiAgYXJjaC9hcm0vbWFjaC1zM2M2NHh4L21hY2gtYW53NjQxMC5jICAgICAg
ICAgIHwgIDEgLQo+ID4gIGFyY2gvYXJtL21hY2gtczNjNjR4eC9tYWNoLWNyYWc2NDEwLmMgICAg
ICAgICB8ICAxIC0KPiA+ICBhcmNoL2FybS9tYWNoLXMzYzY0eHgvbWFjaC1obXQuYyAgICAgICAg
ICAgICAgfCAgMSAtCj4gPiAgYXJjaC9hcm0vbWFjaC1zM2M2NHh4L21hY2gtbWluaTY0MTAuYyAg
ICAgICAgIHwgIDEgLQo+ID4gIGFyY2gvYXJtL21hY2gtczNjNjR4eC9tYWNoLW5jcC5jICAgICAg
ICAgICAgICB8ICAxIC0KPiA+ICBhcmNoL2FybS9tYWNoLXMzYzY0eHgvbWFjaC1yZWFsNjQxMC5j
ICAgICAgICAgfCAgMSAtCj4gPiAgYXJjaC9hcm0vbWFjaC1zM2M2NHh4L21hY2gtc21hcnRxLmMg
ICAgICAgICAgIHwgIDEgLQo+ID4gIGFyY2gvYXJtL21hY2gtczNjNjR4eC9tYWNoLXNtYXJ0cTUu
YyAgICAgICAgICB8ICAxIC0KPiA+ICBhcmNoL2FybS9tYWNoLXMzYzY0eHgvbWFjaC1zbWFydHE3
LmMgICAgICAgICAgfCAgMSAtCj4gPiAgYXJjaC9hcm0vbWFjaC1zM2M2NHh4L21hY2gtc21kazY0
MDAuYyAgICAgICAgIHwgIDEgLQo+ID4gIGFyY2gvYXJtL21hY2gtczNjNjR4eC9tYWNoLXNtZGs2
NDEwLmMgICAgICAgICB8ICAxIC0KPiA+ICAuLi4vcGxhdC1zYW1zdW5nL2luY2x1ZGUvcGxhdC9z
YW1zdW5nLXRpbWUuaCAgfCAyNiAtLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgMzcgZmlsZXMgY2hh
bmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgNjEgZGVsZXRpb25zKC0pCj4gPiAgZGVsZXRlIG1vZGUg
MTAwNjQ0IGFyY2gvYXJtL3BsYXQtc2Ftc3VuZy9pbmNsdWRlL3BsYXQvc2Ftc3VuZy10aW1lLmgK
PiA+Cj4gCj4gRm9yIHRoZSBzM2M2NHh4IGJpdHM6Cj4gCj4gUmV2aWV3ZWQtYnk6IFRvbWFzeiBG
aWdhIDx0b21hc3ouZmlnYUBnbWFpbC5jb20+Cj4gCj4gSSBzdXBwb3NlIHRoZSBuZXh0IHN0ZXAg
d291bGQgYmUgcmVuYW1pbmcgdGhvc2UgZnVuY3Rpb25zIHRvIHMzYzI0eHhfKgo+IGFuZCBzM2M2
NHh4XyogdG8gYXZvaWQgbmFtaW5nIGNvbGxpc2lvbnM/CgpUaGF0J3MgYSBnb29kIHBvaW50LiBJ
IHdpbGwgc2VuZCBhIGZvbGxvdyB1cCBwYXRjaC4gVGhhbmtzIQoKQmVzdCByZWdhcmRzLApLcnp5
c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
