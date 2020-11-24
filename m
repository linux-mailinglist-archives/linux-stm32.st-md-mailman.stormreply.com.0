Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0D82C2FDE
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Nov 2020 19:20:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1661DC56630;
	Tue, 24 Nov 2020 18:20:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45BF1C32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Nov 2020 18:20:26 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AA105206D5;
 Tue, 24 Nov 2020 18:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606242024;
 bh=lOXjqWp/EDocUOsHP0psXVvpJIskpYJTvzKYdVMCdtg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vst+HhGN7iL5UenlTFysw1eusW9jH8Xax/gzhxICa8NjweLOyvWFzLZNdH9kOjAGr
 Ij7vfEkoNGkG0xy1uUCQMz1Agv9yjJX+knDS6zLeB/sq3DfFEsJwC/eXvv7HALqRGK
 5gCZMNiCWVrWaa/2ateZuxRp+bG566FTQyEw+ncE=
Date: Tue, 24 Nov 2020 10:20:22 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Antonio Borneo <antonio.borneo@st.com>
Message-ID: <20201124102022.1a6e6085@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <e2b2b623700401538fe91e70495c348c08b5d2e3.camel@st.com>
References: <20191007154306.95827-1-antonio.borneo@st.com>
 <20191007154306.95827-5-antonio.borneo@st.com>
 <20191009152618.33b45c2d@cakuba.netronome.com>
 <42960ede-9355-1277-9a6f-4eac3c22365c@pengutronix.de>
 <e2b2b623700401538fe91e70495c348c08b5d2e3.camel@st.com>
MIME-Version: 1.0
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, kuba@kernel.org,
 has <has@pengutronix.de>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: add flexible PPS to dwmac
	4.10a
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

T24gVHVlLCAyNCBOb3YgMjAyMCAxNToyMzoyNyArMDEwMCBBbnRvbmlvIEJvcm5lbyB3cm90ZToK
PiBPbiBUdWUsIDIwMjAtMTEtMjQgYXQgMTU6MTUgKzAxMDAsIEFobWFkIEZhdG91bSB3cm90ZToK
PiA+IE9uIDEwLjEwLjE5IDAwOjI2LCBKYWt1YiBLaWNpbnNraSB3cm90ZTogIAo+ID4gPiBPbiBN
b24sIDcgT2N0IDIwMTkgMTc6NDM6MDYgKzAyMDAsIEFudG9uaW8gQm9ybmVvIHdyb3RlOiAgCj4g
PiA+ID4gQWxsIHRoZSByZWdpc3RlcnMgYW5kIHRoZSBmdW5jdGlvbmFsaXRpZXMgdXNlZCBpbiB0
aGUgY2FsbGJhY2sKPiA+ID4gPiBkd21hYzVfZmxleF9wcHNfY29uZmlnKCkgYXJlIGNvbW1vbiBi
ZXR3ZWVuIGR3bWFjIDQuMTBhIFsxXSBhbmQKPiA+ID4gPiA1LjAwYSBbMl0uCj4gPiA+ID4gCj4g
PiA+ID4gUmV1c2UgdGhlIHNhbWUgY2FsbGJhY2sgZm9yIGR3bWFjIDQuMTBhIHRvby4KPiA+ID4g
PiAKPiA+ID4gPiBUZXN0ZWQgb24gU1RNMzJNUDE1eCwgYmFzZWQgb24gZHdtYWMgNC4xMGEuCj4g
PiA+ID4gCj4gPiA+ID4gWzFdIERXQyBFdGhlcm5ldCBRb1MgRGF0YWJvb2sgNC4xMGEgT2N0b2Jl
ciAyMDE0Cj4gPiA+ID4gWzJdIERXQyBFdGhlcm5ldCBRb1MgRGF0YWJvb2sgNS4wMGEgU2VwdGVt
YmVyIDIwMTcKPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbnRvbmlvIEJvcm5lbyA8
YW50b25pby5ib3JuZW9Ac3QuY29tPiAgCj4gPiA+IAo+ID4gPiBBcHBsaWVkIHRvIG5ldC1uZXh0
LiAgCj4gPiAKPiA+IFRoaXMgcGF0Y2ggc2VlbXMgdG8gaGF2ZSBiZWVuIGZ1enppbHkgYXBwbGll
ZCBhdCB0aGUgd3JvbmcgbG9jYXRpb24uCj4gPiBUaGUgZGlmZiBkZXNjcmliZXMgZXh0ZW5zaW9u
IG9mIGR3bWFjIDQuMTBhIGFuZCBzbyBkb2VzIHRoZSBAQCBsaW5lOgo+ID4gCj4gPiDCoMKgQEAg
LTg2NCw2ICs4NjQsNyBAQCBjb25zdCBzdHJ1Y3Qgc3RtbWFjX29wcyBkd21hYzQxMF9vcHMgPSB7
Cj4gPiAKPiA+IFRoZSBwYXRjaCB3YXMgYXBwbGllZCBtYWlubGluZSBhcyA3NTc5MjYyNDc4MzYg
KCJuZXQ6IHN0bW1hYzogYWRkCj4gPiBmbGV4aWJsZSBQUFMgdG8gZHdtYWMgNC4xMGEiKSwgYnV0
IGl0IGV4dGVuZHMgZHdtYWM0X29wcyBpbnN0ZWFkOgo+ID4gCj4gPiDCoMKgQEAgLTkzOCw2ICs5
MzgsNyBAQCBjb25zdCBzdHJ1Y3Qgc3RtbWFjX29wcyBkd21hYzRfb3BzID0gewo+ID4gCj4gPiBJ
IGRvbid0IGtub3cgaWYgZHdtYWM0IGFjdHVhbGx5IHN1cHBvcnRzIEZsZXhQUFMsIHNvIEkgdGhp
bmsgaXQncwo+ID4gYmV0dGVyIHRvIGJlIG9uIHRoZSBzYWZlIHNpZGUgYW5kIHJldmVydCA3NTc5
MjYyNDc4MzYgYW5kIGFkZCB0aGUKPiA+IGNoYW5nZSBmb3IgdGhlIGNvcnJlY3QgdmFyaWFudC4g
IAo+IAo+IEFncmVlLAo+IHRoZSBwYXRjaCBnZXQgYXBwbGllZCB0byB0aGUgd3JvbmcgcGxhY2Uh
Cgo6LW8KClRoaXMgaGFwcGVucyBzb21ldGltZXMgd2l0aCBzdGFibGUgYmFja3BvcnRzIGJ1dCBJ
J3ZlIG5ldmVyIHNlZW4gaXQKaGFwcGVuIHdvcmtpbmcgb24gImN1cnJlbnQiIGJyYW5jaGVzLgoK
U29ycnkgYWJvdXQgdGhhdCEKCldvdWxkIHlvdSBtaW5kIHNlbmRpbmcgdGhlIGFwcHJvcHJpYXRl
IHBhdGNoZXM/IEkgY2FuIGRvIHRoZSByZXZlcnQgaWYKeW91IHByZWZlciwgYnV0IHNpbmNlIHlv
dSBuZWVkIHRvIHNlbmQgdGhlIGZpeCBhbnl3YXkuLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
