Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9741167E75
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Jul 2019 12:09:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A249D1DB61
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Jul 2019 10:09:09 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBAFFC7D101
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Jul 2019 10:09:07 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 72AEA20838;
 Sun, 14 Jul 2019 10:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563098946;
 bh=Yc6A1cGAFiY0v3G2IKWiF9mvk1/HlO1sJcd6V4N1RLw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZDxY3BZOCdUdALgKCB7dBFPWLfaNlyx1FB5VCelksB9alIU6P3TV62dLIed2S0tlT
 ve2lgBis3EJnUiaZ/rkU3FnfKX/xnpA7oZHs+IpX6Bfm+n0LiLQKGMrC1VAdO0ilGi
 twjFVTSheEUNKMg7GCzp5m6bPbumKhpSSSo7P8ok=
Date: Sun, 14 Jul 2019 11:09:01 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20190714110901.752643ae@archlinux>
In-Reply-To: <20190711121620.GA11661@icarus>
References: <20190507091224.17781-1-benjamin.gaignard@st.com>
 <20190711115059.GA7778@icarus>
 <CA+M3ks42Whd=QVQ-4==n5bRJKEwYpQtRHs=gBGEZ_Hr=_8YU1g@mail.gmail.com>
 <20190711121620.GA11661@icarus>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Hartmut Knaack <knaack.h@gmx.de>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] IIO: stm32: Remove quadrature related
 functions from trigger driver
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

T24gVGh1LCAxMSBKdWwgMjAxOSAyMToxNjoyMCArMDkwMApXaWxsaWFtIEJyZWF0aGl0dCBHcmF5
IDx2aWxoZWxtLmdyYXlAZ21haWwuY29tPiB3cm90ZToKCj4gT24gVGh1LCBKdWwgMTEsIDIwMTkg
YXQgMDI6MTI6MjdQTSArMDIwMCwgQmVuamFtaW4gR2FpZ25hcmQgd3JvdGU6Cj4gPiBMZSBqZXUu
IDExIGp1aWwuIDIwMTkgw6AgMTM6NTEsIFdpbGxpYW0gQnJlYXRoaXR0IEdyYXkKPiA+IDx2aWxo
ZWxtLmdyYXlAZ21haWwuY29tPiBhIMOpY3JpdCA6ICAKPiA+ID4KPiA+ID4gT24gVHVlLCBNYXkg
MDcsIDIwMTkgYXQgMTE6MTI6MjRBTSArMDIwMCwgQmVuamFtaW4gR2FpZ25hcmQgd3JvdGU6ICAK
PiA+ID4gPiBRdWFkcmF0dXJlIGZlYXR1cmUgaXMgbm93IGhvc3RlZCBvbiBpdCBvd24gZnJhbWV3
b3JrLgo+ID4gPiA+IFJlbW92ZSBxdWFkcmF0dXJlIHJlbGF0ZWQgY29kZSBmcm9tIHN0bTMyLXRy
aWdnZXIgZHJpdmVyIHRvIGF2b2lkCj4gPiA+ID4gY29kZSBkdXBsaWNhdGlvbiBhbmQgc2ltcGxp
ZnkgdGhlIEFCSS4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJlbmphbWluIEdhaWdu
YXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBzdC5jb20+ICAKPiA+ID4KPiA+ID4gV2hhdCBpcyB0aGUg
c3RhdHVzIG9mIHRoaXMgcGF0Y2g/IEFyZSB0aGVyZSBhbnkgb2JqZWN0aW9ucyBjdXJyZW50bHkg
Zm9yCj4gPiA+IGl0cyBpbmNsdXNpb24/ICAKPiA+IAo+ID4gWW91IHdlcmUgdGhlIG9ubHkgb25l
IGFza2luZyBmb3IgbW9yZSBkZXRhaWxzIGFib3V0IGl0IDotKQo+ID4gSWYgeW91IGFncmVlIEkg
dGhpbmsgdGhhdCBKb25hdGhhbiBjYW4gbWVyZ2UgaXQuCj4gPiAKPiA+IEJlbmphbWluICAKPiA+
ID4KPiA+ID4gV2lsbGlhbSBCcmVhdGhpdHQgR3JheQo+ID4gPgo+ID4gPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiBsaW51eC1hcm0ta2VybmVs
IG1haWxpbmcgbGlzdAo+ID4gPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcK
PiA+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
cm0ta2VybmVsICAKPiAKPiBZZXMsIEpvbmF0aGFuIHBsZWFzZSBtZXJnZSB0aGlzIGlmIHlvdSBo
YXZlIG5vIG9iamVjdGlvbnMsIEkgaGFkbid0Cj4gcmVhbGl6ZWQgSSB3YXMgZGVsYXlpbmcgaXQu
Cj4gCj4gVGhhbmsgeW91LAo+IAo+IFdpbGxpYW0gQnJlYXRoaXR0IEdyYXkKT25lIGxhc3QgdGhp
bmcuLi4gIFRoaXMgc2VlbXMgdG8gYmUgYSB1c2Vyc3BhY2UgQUJJIGNoYW5nZS4gIFdoYXQKYXJl
IG91ciBwb3RlbnRpYWwgaXNzdWVzIHdpdGggdXNlcnMgb2YgdGhpcyBBQkk/CgpJdCdzIG5vdCB0
aGF0IGNvc3RseSB0byBrZWVwIHRoZSBjb2RlLCB0aG91Z2ggZHJvcHBpbmcgdGhlIGRvY3Mgb3IK
cHV0dGluZyBhIGRlcHJlY2lhdGVkIG5vdGUgaW4gdGhlbSBpcyBwcm9iYWJseSBhIGdvb2QgaWRl
YS4gIEhlbmNlCkknbSBub3QgdG90YWxseSBjb252aW5jZWQgdGhlIHJpc2sgb2YgYSByZWdyZXNz
aW9uIGlzIHdvcnRoIGl0LgoKSWYgd2UgdGhpbmsgaXQncyB0aGUgc29ydCBvZiBjaGFuZ2Ugbm8g
b25lIHdpbGwgbm90aWNlLCB0aGVuCmZhaXIgZW5vdWdoIHdlJ2xsIGdpdmUgaXQgYSBnbyBhbmQg
Y3Jvc3Mgb3VyIGZpbmdlcnMuCgpUaGFua3MsCgpKb25hdGhhbgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
