Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA55FCF18C2
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 02:17:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54F39C349C4;
	Mon,  5 Jan 2026 01:17:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E80B4C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jan 2026 01:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=pZJXqr1shDOJNTqRYSFVIu1Zdtd7/8R285rGmkkRm1E=; b=AKRq+C0RidbJ2ebH1AwJJaiFtO
 8KWAnzMMb5j2/RD+jEWnlyhtwoMIEpAqesaCl2mj+Bgr79rcXC2iLY4X8UoUZ1J6ZcERcRLZf/1Mr
 Qj9AvTYMuYYMDIchA/83TyX753gWfZ5EHQHWWsZhznwSoZHN6XQ9mSMXkqJBZRxUOF8JjK7kxTjy8
 YRYm5cRRxcqihc4WnIbQJI4hdpLFCyLFM5d6xhV3rSlhTjcSnziwDYdjnr6V0QQi5WmSmqCxg8qg0
 JaNWJvB4I8S7f1CbEKaO5cHJ++lZok1J0rNm2fPDugTXr2azRdsHFhVo21Rw9ChmdPDMCgZBM4Cj0
 TJFOwEpA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vcZDf-0000000AbSy-3tej; Mon, 05 Jan 2026 01:17:16 +0000
Message-ID: <eb7c246a-6c5f-4d8d-bc96-2a71ece2e042@infradead.org>
Date: Sun, 4 Jan 2026 17:17:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Randy Dunlap <rdunlap@infradead.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>, Arnd Bergmann
 <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
 <5e335232-89b4-4c35-93bd-efad7e4d8995@app.fastmail.com>
 <0220ec0592b6ef8936c25cffbc6cbfa0539fb71a.camel@foss.st.com>
Content-Language: en-US
In-Reply-To: <0220ec0592b6ef8936c25cffbc6cbfa0539fb71a.camel@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-sh@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 andrew.jones@linux.dev, Paul Cercueil <paul@crapouillou.net>,
 Max Filippov <jcmvbkbc@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, openbmc@lists.ozlabs.org, x86@kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Kocialkowski <paulk@sys-base.io>,
 linux-sound@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mips@vger.kernel.org,
 asahi@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [Linux-stm32] Kconfig dangling references (BZ 216748)
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

CgpPbiAxMi84LzI1IDE6NDggQU0sIEFudG9uaW8gQm9ybmVvIHdyb3RlOgo+IE9uIE1vbiwgMjAy
NS0xMi0wOCBhdCAwOTo1NSArMDEwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPj4gT24gTW9uLCBE
ZWMgOCwgMjAyNSwgYXQgMDM6MDQsIFJhbmR5IER1bmxhcCB3cm90ZToKPj4+IGZyb23CoCBodHRw
czovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxNjc0OAo+Pj4KPj4+IFRo
ZSBidWd6aWxsYSBlbnRyeSBpbmNsdWRlcyBhIFBlcmwgc2NyaXB0IGFuZCBhIHNoZWxsIHNjcmlw
dC4KPj4+IFRoaXMgaXMgdGhlIGVkaXRlZCByZXN1bHQgb2YgcnVubmluZyB0aGVtIChJIHJlbW92
ZWQgc29tZSBlbnRyaWVzIHRoYXQgCj4+PiB3ZXJlIG5vaXNlKS4KPj4+Cj4+PiBJJ2xsIHRyeSB0
byBDYzogYWxsIG9mIHRoZSByZWxldmFudCBtYWlsaW5nIGxpc3RzIG9yIGluZGl2aWR1YWxzLgo+
Pj4KPj4+IC4uLgo+Pj4KPj4+IE1BQ0hfU1RNMzJNUDI1IC0tLQo+Pj4gZHJpdmVycy9waW5jdHJs
L3N0bTMyL0tjb25maWc6NTg6wqDCoMKgwqDCoMKgwqBkZWZhdWx0IE1BQ0hfU1RNMzJNUDI1IHx8
IChBUkNIX1NUTTMyIAo+Pj4gJiYgQVJNNjQpCj4+Cj4+IFRoaXMgd2FzIGxpa2VseSBpbnRlbmRl
ZCBmb3IgMzItYml0IGtlcm5lbHMgb24gNjQtYml0IFNUTTMyTVAyNQo+PiBjaGlwcywgd2hpY2gg
d2UgZG9uJ3Qgc3VwcG9ydC4gSSB0aGluayB0aGlzIGNhbiBnby4KPiAKPiBZZXMsIEkgZnVsbHkg
YWdyZWUhCj4gCj4gSSBoYXZlIGEgc2VyaWVzIHBpbmN0cmwgc3RtMzIgdG8gYmUgcmViYXNlZCBv
biB2Ni4xOS1yYzEgYW5kIEkgY2FuIGluY2x1ZGUgdGhlCj4gZHJvcCBvZiBNQUNIX1NUTTMyTVAy
NSBpbnNpZGUgaXQuCgphbmQgd2hhdCBhYm91dCB0aGlzIGRhbmdsaW5nIHN5bWJvbD8KYXJjaC9h
cm02NC9LY29uZmlnLnBsYXRmb3JtczozNzU6CXNlbGVjdCBBUk1fU01DX01CT1gKCkl0IHdhcyBt
ZXJnZWQgd2l0aCBBUkNIX1NUTTMyIGluCjllNGUyNDQxNGNjNiAoImFybTY0OiBpbnRyb2R1Y2Ug
U1RNMzIgZmFtaWx5IG9uIEFybXY4IGFyY2hpdGVjdHVyZSIpCgpTYW1lIGFuc3dlciBhcyBmb3Ig
TUFDSF9TVE0zMk1QMjU/CklmIHNvLCBBbnRvbmlvLCBjYW4geW91IHRha2UgY2FyZSBvZiB0aGF0
IG9uZSBhbHNvLCBwbGVhc2U/Cgp0aGFua3MuCi0tIAp+UmFuZHkKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
