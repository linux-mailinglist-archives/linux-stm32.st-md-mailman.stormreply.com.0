Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F6323250F
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jul 2020 21:08:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC0EEC36B29;
	Wed, 29 Jul 2020 19:08:58 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F113C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jul 2020 19:08:56 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id g19so11658553ejc.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jul 2020 12:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Kk6GZ/lJmAXVSU51HkWJo7PA9w7q1gYfnsyVr0WMPOk=;
 b=pxAPk/aStA7ZUaMsW4KxWe81RpyugOg/mkBjHkKXN+Ff9DaBgyNkoBttC/DnMqYkS1
 goKoQ15rCIGea6W4cRySpnqJ0KJhxlgISgouwMCbVO34ZUXKYfoyQ+mGzU66FM0lWhsM
 4EFiCYO78BD4ZQmyqGrVGJwTtLWk3LRUtTWt6HCcctSXzW3dWIgcSFeGjO29gI3HSVzz
 MFQJoCMfkx3jCXDP7RQQh1AqM3EMiGIy5eMdU84rsdH7FDRyDCxkFBCWowJRgz+pYPRu
 4Cwis31tN0I/qwvwEnXUGYAdci60yINRxKgGuS57V7v5NWWQAH8LTLwtO6QlzqYI5ol9
 mi6g==
X-Gm-Message-State: AOAM531j9jQduKwy81I/3q29fZGMRkHXNEZsGsvfJC2fgjQTNFaxNGuP
 5RIz5dA7o0KCeQ4sfMIig4k=
X-Google-Smtp-Source: ABdhPJy+cd4Zv9RClGXMrb12WPzglxJiIigi0VSAL6EF6L9FGlqR/jQZQ2fHi+OZEEkZV03WOmvLzQ==
X-Received: by 2002:a17:906:6d4d:: with SMTP id
 a13mr31002287ejt.146.1596049736098; 
 Wed, 29 Jul 2020 12:08:56 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id m5sm2616809edr.59.2020.07.29.12.08.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Jul 2020 12:08:55 -0700 (PDT)
Date: Wed, 29 Jul 2020 21:08:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomasz Figa <tomasz.figa@gmail.com>
Message-ID: <20200729190852.GA5822@kozik-lap>
References: <20200729160942.28867-1-krzk@kernel.org>
 <20200729160942.28867-6-krzk@kernel.org>
 <20200729170245.GA177035@roeck-us.net>
 <CA+Ln22EcU+mhaYJYd3M-S0ZP-mA0bW4Qit-Kh6MyvwzxTRJ3GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+Ln22EcU+mhaYJYd3M-S0ZP-mA0bW4Qit-Kh6MyvwzxTRJ3GQ@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 5/7] ARM: samsung: Kill useless
	HAVE_S3C2410_WATCHDOG
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

T24gV2VkLCBKdWwgMjksIDIwMjAgYXQgMDc6MzY6MzhQTSArMDIwMCwgVG9tYXN6IEZpZ2Egd3Jv
dGU6Cj4gMjAyMOW5tDfmnIgyOeaXpSjmsLQpIDE5OjAyIEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJv
ZWNrLXVzLm5ldD46Cj4gPgo+ID4gT24gV2VkLCBKdWwgMjksIDIwMjAgYXQgMDY6MDk6NDBQTSAr
MDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiA+ID4gQSBzZXBhcmF0ZSBLY29uZmln
IG9wdGlvbiBIQVZFX1MzQzI0MTBfV0FUQ0hET0cgZm9yIFNhbXN1bmcgU29DcyBkb2VzCj4gPiA+
IG5vdCBoYXZlIHNlbnNlLCBiZWNhdXNlOgo+ID4gPiAxLiBBbGwgQVJNdjcgYW5kIEFSTXY4IFNh
bXN1bmcgU29DcyBoYXZlIHdhdGNoZG9nLAo+ID4gPiAyLiBBbGwgYXJjaGl0ZWN0dXJlIEtjb25m
aWdzIHdlcmUgc2VsZWN0aW5nIGl0IChpZiBXQVRDSERPRyBmcmFtZXdvcmsgaXMKPiA+ID4gICAg
Y2hvc2VuKSwKPiA+ID4gMy4gSEFWRV9TM0MyNDEwX1dBVENIRE9HIGlzIGRvaW5nIG5vdGhpbmcg
ZXhjZXB0IGJlaW5nIGEgZGVwZW5kZW5jeSBvZgo+ID4gPiAgICBhY3R1YWwgU2Ftc3VuZyBTb0Mg
d2F0Y2hkb2cgZHJpdmVyLCB3aGljaCBpcyBlbmFibGVkIG1hbnVhbGx5IGJ5Cj4gPiA+ICAgIHNw
ZWNpZmljIGRlZmNvbmZpZ3MuCj4gPiA+Cj4gPiA+IEhBVkVfUzNDMjQxMF9XQVRDSERPRyBjYW4g
YmUgc2FmZWx5IHJlbW92ZWQuCj4gPiA+Cj4gPgo+ID4gVGhhdCBpcyBub3QgcmVhbGx5IGNvcnJl
Y3QuIEhBVkVfUzNDMjQxMF9XQVRDSERPRyBpcyB1c2VkIHRvIGVuc3VyZQo+ID4gdGhhdCB1c2Vy
cyBjYW4gb25seSBlbmFibGUgUzNDMjQxMF9XQVRDSERPRyBpZiB0aGUgd2F0Y2hkb2cgYWN0dWFs
bHkKPiA+IGV4aXN0cyBpbiBhIHN5c3RlbS4gV2l0aCB0aGlzIGNoYW5nZSwgaXQgY2FuIGJlIGVu
YWJsZWQgZm9yIGFsbAo+ID4gYXJjaGl0ZWN0dXJlcyBhbmQgcGxhdGZvcm1zLgo+ID4KPiA+IE5B
Q0suCj4gPgo+ID4gR3VlbnRlcgo+ID4KPiAKPiBJJ2Qgc2lkZSB3aXRoIEd1ZW50ZXIgb24gdGhp
cy4gV2UgYmV0dGVyIG5vdCBmbG9vZCB1c2Vycycgc2NyZWVucyB3aXRoCj4gb3B0aW9ucyB0aGF0
IGFyZSBub3QgcmVsZXZhbnQgdG8gdGhlaXIgaGFyZHdhcmUuCj4gCj4gQW4gYWx0ZXJuYXRpdmUg
aGVyZSBjb3VsZCBiZSBtYWtpbmcgQ09ORklHX1MzQzI0MTBfV0FUQ0hET0cgZGVwZW5kIG9uCj4g
YSBnZW5lcmFsIHN5bWJvbCBmb3IgU2Ftc3VuZyBTb0Mgc3VwcG9ydCBpZiB0aGVyZSBpcyBzdWNo
LCBidXQgdGhlbiwKPiBhcmUgd2UgMTAwJSBzdXJlIHRoYXQgYWxsIHRoZSBTYW1zdW5nIFNvQ3Mg
d291bGQgYWN0dWFsbHkgaGF2ZSBleGFjdGx5Cj4gdGhpcyB3YXRjaGRvZz8gSWYgYSBuZXcgb25l
IHNob3dzIHVwLCBvbmUgd291bGQgaGF2ZSB0byBicmluZyBiYWNrCj4gdGhpcyBIQVZFX1MzQzI0
MTBfV0FUQ0hET0cgc3ltYm9sLgoKQWgsIGdvb2QgcG9pbnRzLiBJbmRlZWQgZm9yIGFsbCBvZiBz
dWNoIFNvQyBkcml2ZXJzIHdlIHVzdWFsbHkganVzdApkZXBlbmQgb24gYXJjaGl0ZWN0dXJlIHRv
IGxpbWl0IHRoZSBjaG9pY2VzIG9uIG90aGVyIGFyY2hpdGVjdHVyZXMuCkluIHRoaXMgY2FzZSBp
dCB3b3VsZCBiZToKICAgIGRlcGVuZHMgb24gQVJDSF9FWFlOT1MgfHwgQVJDSF9TM0MyNFhYIHx8
IEFSQ0hfUzNDNjRYWCB8fCBBUkNIX1M1UFYyMTAgfHwgQ09NUElMRV9URVNUCgpJIGFkbWl0IGl0
IGlzIHByZXR0eSBsb25nLCBidXQgd2UgYWxyZWFkeSB1c2UgdGhpcyBwYXR0ZXJuLiBJbiBzaG9y
dGVyCnZlcnNpb24gKGxlc3MgQVJDSCopIGZvciBhbGwgZHJpdmVycywgaW4gZnVsbCB2ZXJzaW9u
IGFsc28gaW46CmRyaXZlcnMvaWlvL2FkYy9LY29uZmlnCmRyaXZlcnMvZ3B1L2RybS9leHlub3Mv
S2NvbmZpZwoKSGF2ZSBpbiBtaW5kIHRoYXQgaW4gZ2VuZXJhbCB3ZSBmb2xsb3cgdGhlIGZpcnN0
IGFwcHJvYWNoIGFuZCBvbmx5IHRocmVlCmRyaXZlcnMgaGF2ZSBzdGlsbCB0aGUgSEFWRV94eHgg
b3B0aW9uIChhbHNvIEhBVkVfUzNDMjQxMF9JMkMgYW5kCkhBVkVfUzNDX1JUQykuCgpJIGNhbiB1
cGRhdGUgdGhlcmVmb3JlIHRoZSAiZGVwZW5kcyIgd2hpbGUgcmVtb3ZpbmcgdGhlCkhBVkVfUzND
MjQxMF9XQVRDSERPRyBvcHRpb24gb3IganVzdCBrZWVwIGl0LgoKQmVzdCByZWdhcmRzLApLcnp5
c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
