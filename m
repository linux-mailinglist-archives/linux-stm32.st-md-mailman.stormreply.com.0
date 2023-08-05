Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D27A771138
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Aug 2023 20:04:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C87D1C6B46E;
	Sat,  5 Aug 2023 18:04:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6E14C6B469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Aug 2023 18:04:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 745E660D3E;
 Sat,  5 Aug 2023 18:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7354BC433C7;
 Sat,  5 Aug 2023 18:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691258694;
 bh=96EhEx/ZwAoLEZrGKhah56CZPPgGexCaaNmFBjOhFbo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hvB++aps/bNGYC6pSwdXTNR5Fj41/6hoGjDLgBIcH9qUmPPT3i1+7LyB0Yk5rrExR
 j4sVxJewj4lZu2OUjCHkzzBP2AfjvPSTxJRxqAWhK0lSKFCP39BMwkUObyW3BET+OB
 nPDmNvVPduv6yM/imIEF54LXw9VuloACj101O2b8OfUkDEZ64ZZPad1IHiLyO/a4gd
 bEUMjjoW/XXoXcaYNmaW3juFPHhMuQXWPGRLFXwGnYvdzuxbweJvIAFywwnOLERHYu
 jxfyNpXBp1EqIcIB0lMP0GfOWKUHn0FLOlnOuosTWgkQt+gs/M5OOMWGYV1vEBaBTP
 tAqmdtEJEEpGw==
Date: Sat, 5 Aug 2023 19:04:45 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Alexandru Ardelean <alex@shruggie.ro>
Message-ID: <20230805190445.08036501@jic23-huawei>
In-Reply-To: <CAH3L5QpuoDYU6qvWH7_z5Yx0cW2qPMbCA8AFEYAPsiEkSzCiwQ@mail.gmail.com>
References: <20230802120915.25631-1-aboutphysycs@gmail.com>
 <CAH3L5QpuoDYU6qvWH7_z5Yx0cW2qPMbCA8AFEYAPsiEkSzCiwQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: lars@metafoo.de, linux-iio@vger.kernel.org,
 Andrei Coardos <aboutphysycs@gmail.com>, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: trigger: stm32-lptimer-trigger:
 remove unneeded platform_set_drvdata()
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

T24gV2VkLCAyIEF1ZyAyMDIzIDE1OjM3OjAyICswMzAwCkFsZXhhbmRydSBBcmRlbGVhbiA8YWxl
eEBzaHJ1Z2dpZS5ybz4gd3JvdGU6Cgo+IE9uIFdlZCwgQXVnIDIsIDIwMjMgYXQgMzowOeKAr1BN
IEFuZHJlaSBDb2FyZG9zIDxhYm91dHBoeXN5Y3NAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBU
aGlzIGZ1bmN0aW9uIGNhbGwgd2FzIGZvdW5kIHRvIGJlIHVubmVjZXNzYXJ5IGFzIHRoZXJlIGlz
IG5vIGVxdWl2YWxlbnQKPiA+IHBsYXRmb3JtX2dldF9kcnZkYXRhKCkgY2FsbCB0byBhY2Nlc3Mg
dGhlIHByaXZhdGUgZGF0YSBvZiB0aGUgZHJpdmVyLiBBbHNvLAo+ID4gdGhlIHByaXZhdGUgZGF0
YSBpcyBkZWZpbmVkIGluIHRoaXMgZHJpdmVyLCBzbyB0aGVyZSBpcyBubyByaXNrIG9mIGl0IGJl
aW5nCj4gPiBhY2Nlc3NlZCBvdXRzaWRlIG9mIHRoaXMgZHJpdmVyIGZpbGUuCj4gPgo+ID4gUmV2
aWV3ZWQtYnk6IEFsZXhhbmRydSBBcmRlbGVhbiA8YWxleEBzaHJ1Z2dpZS5ybz4KPiA+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJlaSBDb2FyZG9zIDxhYm91dHBoeXN5Y3NAZ21haWwuY29tPgo+ID4gLS0t
Cj4gPiAgZHJpdmVycy9paW8vdHJpZ2dlci9zdG0zMi1scHRpbWVyLXRyaWdnZXIuYyB8IDIgLS0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9paW8vdHJpZ2dlci9zdG0zMi1scHRpbWVyLXRyaWdnZXIuYyBiL2RyaXZlcnMvaWlv
L3RyaWdnZXIvc3RtMzItbHB0aW1lci10cmlnZ2VyLmMKPiA+IGluZGV4IDJlNDQ3YTNmMDQ3ZC4u
ZGYyNDE2ZTMzMzc1IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9paW8vdHJpZ2dlci9zdG0zMi1s
cHRpbWVyLXRyaWdnZXIuYwo+ID4gKysrIGIvZHJpdmVycy9paW8vdHJpZ2dlci9zdG0zMi1scHRp
bWVyLXRyaWdnZXIuYwo+ID4gQEAgLTkyLDggKzkyLDYgQEAgc3RhdGljIGludCBzdG0zMl9scHRp
bV90cmlnZ2VyX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgICAgICAg
IGlmIChyZXQpCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsgIAo+IAo+IHRoaXMgY2Fu
IGJlY29tZSBub3c6Cj4gCj4gICAgICAgICAgICAgcmV0dXJuIHN0bTMyX2xwdGltX3NldHVwX3Ry
aWcocHJpdik7CkkgbWFkZSB0aGF0IGNoYW5nZSB3aGlsc3QgYXBwbHlpbmcuCgpBcHBsaWVkIHRv
IHRoZSB0b2dyZWcgYnJhbmNoIG9mIGlpby5naXQgYW5kIHB1c2hlZCBvdXQgYXMgdGVzdGluZyBm
b3IKdGhlIGF1dG9idWlsZGVycyB0byB0YWtlIGEgbG9vayBhdCBpdCBhbmQgc2VlIGlmIHRoZXkg
Y2FuIGZpbmQgYW55dGhpbmcKd2UgbWlzc2VkLgoKVGhhbmtzLAoKSm9uYXRoYW4KCj4gCj4gCj4g
Pgo+ID4gLSAgICAgICBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBwcml2KTsKPiA+IC0KPiA+
ICAgICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+IC0tCj4gPiAyLjM0LjEKPiA+ICAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
