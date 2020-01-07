Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA4C13214F
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2020 09:25:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E52B5C36B0B;
	Tue,  7 Jan 2020 08:25:44 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD31FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2020 08:25:42 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id e10so49675718edv.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jan 2020 00:25:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vT2NN+xI4BcelZZCoGioMbTizcdEYSLI6ni70MbnF8c=;
 b=XbFILo35wYZm3oDfBxddbTzNsyTLp6G4oy6rKZYIggQyXMW7w036AO/s0XQDnVX6Dd
 Qhk6hRPQzEOOJ7k13d76Jz2UYhveKj5nLXphtaViOsQqumOxWZdGFteQfMl3j+GlKm+L
 1Ru3bTUv2jizUQjRKEsRVHLA2VCkB7/O/VI8Wiu64kn+3BSb+zZ8KrAAa1LLmOBhPzoI
 tjE849fhyefdcWF+tczqoxIe446Zc4AAKGXAoYBJzuCL4fRDKCXYjwVxwqKtrIcHxCo8
 4ochiTgxVWzxYWnd/7RUk/8cCtZ5L6mLbZANJmmMqv61qE9dKUrfj83lw7Px+GpsvNx2
 xbmw==
X-Gm-Message-State: APjAAAXggKLV3rKSwT6OkI3+oUcqO4lHRng8b8BGGeDRPff8uqwCqt8r
 BIrr+92ZHQoBcFELTnOsvts=
X-Google-Smtp-Source: APXvYqwRuI+Pu22h1HAS8nBuWY+NEdeOj5ioRnCb8N42vbhDOOIZ7fM0eRKg8UY44R4kju5amCGT3w==
X-Received: by 2002:a05:6402:221c:: with SMTP id
 cq28mr63552685edb.110.1578385542439; 
 Tue, 07 Jan 2020 00:25:42 -0800 (PST)
Received: from pi3 ([194.230.155.149])
 by smtp.googlemail.com with ESMTPSA id ba29sm7398179edb.47.2020.01.07.00.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 00:25:41 -0800 (PST)
Date: Tue, 7 Jan 2020 09:25:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20200107082539.GA31827@pi3>
References: <20191230172113.17222-1-krzk@kernel.org>
 <20191230172113.17222-2-krzk@kernel.org>
 <20200107072645.ko247bwhh3ibdu73@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107072645.ko247bwhh3ibdu73@pengutronix.de>
Cc: linux-pwm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] pwm: Enable compile testing for some
	of drivers
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

T24gVHVlLCBKYW4gMDcsIDIwMjAgYXQgMDg6MjY6NDVBTSArMDEwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gSGVsbG8gS3J6eXN6dG9mLAo+IAo+IE9uIE1vbiwgRGVjIDMwLCAyMDE5IGF0
IDA2OjIxOjEzUE0gKzAxMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gPiBTb21lIG9m
IHRoZSBQV00gZHJpdmVycyBjYW4gYmUgY29tcGlsZSB0ZXN0ZWQgdG8gaW5jcmVhc2UgYnVpbGQK
PiA+IGNvdmVyYWdlLgo+ID4gCj4gPiBUaGUgTWVzb24gUFdNIGRyaXZlciByZXF1aXJlcyBDT01N
T05fQ0xLIGRlcGVuZGVuY3kuCj4gCj4gSSdtIHN1cnByaXNlZCB0aGF0IHRoZXJlIGFyZSBub3Qg
bW9yZSB0aGF0IG5lZWQgdGhpcy4gSXMgSEFWRV9DTEsgbm90Cj4gZW5vdWdoPwoKTm9wZS4gRS5n
LiBmb3IgYWxwaGEgYXJjaGl0ZWN0dXJlLCBIQVZFX0NMSyBpcyBub3Qgc2V0IGFuZCB3aXRob3V0
CkNPTU1PTl9DTEs6Cgpkcml2ZXJzL3B3bS9wd20tbWVzb24ubzogSW4gZnVuY3Rpb24gYG1lc29u
X3B3bV9pbml0X2NoYW5uZWxzJzoKKC50ZXh0KzB4MjQ0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0
byBgZGV2bV9jbGtfcmVnaXN0ZXInCgpJIGd1ZXNzIG90aGVyIHNvbHV0aW9uIHdvdWxkIGJlIHRv
IGFkZCBzdHVicyBmb3IgZmV3IGNsayBmdW5jdGlvbnMuLi4KCj4gQWxzbyBIQVNfSU9NRU0gaXMg
YSB0eXBpY2FsIHJlcXVpcmVtZW50LCBidXQgSSB0ZXN0ZWQgd2l0aCBhbiBBUkNIPXVtCj4gY29u
ZmlnICh3aGljaCBkb2VzJ3QgaGF2ZSBIQVNfSU9NRU0pIGFuZCB0aGV5IGFsbCBjb21waWxlIGZp
bmUuCgpCZWNhdXNlIG9mICFIQVNfSU9NRU0sIHNpbmNlIHNvbWUgdGltZSBBUkNIPXVtIGRvZXMg
bm90IHN1cHBvcnQKQ09NUElMRV9URVNULiBUaGVyZWZvcmUgSEFTX0lPTUVNIGRlcGVuZGVuY3kg
aXMgbm90IG5lZWRlZCBmb3IgY29tcGlsZQp0ZXN0aW5nIChhbmQgZm9yIHJlZ3VsYXIgYnVpbGQg
aXQgaXMgc2VsZWN0ZWQgYnkgQVJDSCkuCgo+IAo+ID4gQEAgLTMxOCw3ICszMTksNyBAQCBjb25m
aWcgUFdNX01FRElBVEVLCj4gPiAgCj4gPiAgY29uZmlnIFBXTV9NWFMKPiA+ICAJdHJpc3RhdGUg
IkZyZWVzY2FsZSBNWFMgUFdNIHN1cHBvcnQiCj4gPiAtCWRlcGVuZHMgb24gQVJDSF9NWFMgJiYg
T0YKPiA+ICsJZGVwZW5kcyBvbiAoQVJDSF9NWFMgJiYgT0YpIHx8IENPTVBJTEVfVEVTVAo+ID4g
IAlzZWxlY3QgU1RNUF9ERVZJQ0UKPiA+ICAJaGVscAo+ID4gIAkgIEdlbmVyaWMgUFdNIGZyYW1l
d29yayBkcml2ZXIgZm9yIEZyZWVzY2FsZSBNWFMuCj4gPiBAQCAtMzI4LDcgKzMyOSw4IEBAIGNv
bmZpZyBQV01fTVhTCj4gPiAgCj4gPiAgY29uZmlnIFBXTV9PTUFQX0RNVElNRVIKPiA+ICAJdHJp
c3RhdGUgIk9NQVAgRHVhbC1Nb2RlIFRpbWVyIFBXTSBzdXBwb3J0Igo+ID4gLQlkZXBlbmRzIG9u
IE9GICYmIEFSQ0hfT01BUCAmJiBPTUFQX0RNX1RJTUVSCj4gPiArCWRlcGVuZHMgb24gKEFSQ0hf
T01BUCAmJiBPTUFQX0RNX1RJTUVSKSB8fCBDT01QSUxFX1RFU1QKPiA+ICsJZGVwZW5kcyBvbiBP
Rgo+IAo+IEknbSBzdXJwcmlzZWQgdGhhdCBPRiBpc24ndCByZXF1aXJlZCBmb3IgUFdNX01YUyBi
dXQgaXMgaXMgZm9yCj4gUFdNX09NQVBfRE1USU1FUi4gcHdtLW14cyBjb21waWxlcyB3aXRob3V0
IENPTkZJR19PRiwgZGlkbid0IHRlc3QKPiBwd20tb21hcC1kbXRpbWVyLgoKU2luY2Ugc29tZSB0
aW1lICFPRiBoYXMgYWxsIG5lY2Vzc2FyeSBzdHVicyBzbyBPRiBpcyBhY3R1YWxseSBuZWVkZWQK
b25seSBmb3IgYmluZGluZywgbm90IGNvbXBpbGluZy4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9m
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
