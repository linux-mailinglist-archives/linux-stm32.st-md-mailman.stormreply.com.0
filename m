Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7083FAE3370
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jun 2025 03:56:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E292C349C2;
	Mon, 23 Jun 2025 01:56:52 +0000 (UTC)
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com
 [95.215.58.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3342BC349C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jun 2025 01:56:50 +0000 (UTC)
Message-ID: <5dc786e1-0e2e-468c-b2d5-b8e93e6d8265@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1750643809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ZeaYSvjn6JUg4GMyZmlR25k/eELyipTcGo/9lSTmGA=;
 b=pUsOTE+fGNzyYUdlj32n3mwL/6desRujdrVDvH0OPo3T5FiBJykop9UNruC7nGCrPCFG0n
 /8DcTeqKO8Pq7OuZXWNQ+qXHMYbOisFRZV1Nlk8JE0qwddwGbndo9PnJ752loZD72P0IRw
 BgdrdXjKSAOxdNM25QDDhwKZPlgzb1I=
Date: Mon, 23 Jun 2025 09:56:39 +0800
MIME-Version: 1.0
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <E1uSBri-004fL5-FI@rmk-PC.armlinux.org.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <E1uSBri-004fL5-FI@rmk-PC.armlinux.org.uk>
X-Migadu-Flow: FLOW_OUT
Cc: Vladimir Zapolskiy <vz@mleia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: lpc18xx: use
 plat_dat->phy_interface
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

5ZyoIDYvMTkvMjUgNTo0NyBQTSwgUnVzc2VsbCBLaW5nIChPcmFjbGUpIOWGmemBkzoKPiBscGMx
OHh4IHVzZXMgcGxhdF9kYXQtPm1hY19pbnRlcmZhY2UsIGRlc3BpdGUgd2FudGluZyB0byB2YWxp
ZGF0ZSB0aGUKPiBQSFkgaW50ZXJmYWNlLiBDaGVja2luZyB0aGUgRFQgZmlsZXMgKGFyY2gvYXJt
L2Jvb3QvZHRzL254cC9scGMvKSwgbm9uZQo+IG9mIHRoZW0gc3BlY2lmeSBtYWMtbW9kZSB3aGlj
aCBtZWFucyBtYWNfaW50ZXJmYWNlIGFuZCBwaHlfaW50ZXJmYWNlCj4gd2lsbCBiZSBpZGVudGlj
YWwuCj4gCj4gbWFjX2ludGVyZmFjZSBpcyBvbmx5IHVzZWQgd2hlbiB0aGVyZSBpcyBzb21lIGtp
bmQgb2YgTUlJIGNvbnZlcnRlcgo+IGJldHdlZW4gdGhlIERlc2lnbldhcmUgTUFDIGFuZCBQSFks
IGFuZCBkZXNjcmliZXMgdGhlIGludGVyZmFjZSBtb2RlCj4gdGhhdCB0aGUgRFcgTUFDIG5lZWRz
IHRvIHVzZSwgd2hlcmVhcyBwaHlfaW50ZXJmYWNlIGRlc2NyaWJlcyB0aGUKPiBpbnRlcmZhY2Ug
bW9kZSB0aGF0IHRoZSBQSFkgdXNlcy4KPiAKPiBOb3RpbmcgdGhhdCBscGMxOHh4IG9ubHkgc3Vw
cG9ydHMgTUlJIGFuZCBSTUlJIGludGVyZmFjZSBtb2Rlcywgc3dpdGNoCj4gdGhpcyBnbHVlIGRy
aXZlciB0byB1c2UgcGxhdF9kYXQtPnBoeV9pbnRlcmZhY2UsIGFuZCB0byBtYXJrIHRoYXQgdGhl
Cj4gbWFjX2ludGVyZmFjZSBpcyBub3QgdXNlZCwgZXhwbGljaXRseSBzZXQgaXQgdG8gUEhZX0lO
VEVSRkFDRV9NT0RFX05BLgo+IFRoZSBsYXR0ZXIgaXMgc2FmZSBhcyB0aGUgb25seSB1c2VyIG9m
IG1hY19pbnRlcmZhY2UgZm9yIHRoaXMgcGxhdGZvcm0KPiB3b3VsZCBiZSBpbiBzdG1tYWNfY2hl
Y2tfcGNzX21vZGUoKSwgd2hpY2ggb25seSBjaGVja3MgZm9yIFJHTUlJIG9yCj4gU0dNSUkuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBLaW5nIChPcmFjbGUpIDxybWsra2VybmVsQGFybWxp
bnV4Lm9yZy51az4KUmV2aWV3ZWQtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0BjcXNvZnR3YXJl
LmNvbS5jbj4KClRoYW5rcywKWWFudGVuZwo+IC0tLQo+ICAgZHJpdmVycy9uZXQvZXRoZXJuZXQv
c3RtaWNyby9zdG1tYWMvZHdtYWMtbHBjMTh4eC5jIHwgNSArKystLQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbHBjMTh4eC5jIGIvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbHBjMTh4eC5jCj4gaW5kZXggMjI2
NTNmZmQyYTA0Li5jMGM0NDkxNmY4NDkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbHBjMTh4eC5jCj4gKysrIGIvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbHBjMTh4eC5jCj4gQEAgLTQxLDYgKzQxLDcgQEAg
c3RhdGljIGludCBscGMxOHh4X2R3bWFjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCj4gICAJaWYgKElTX0VSUihwbGF0X2RhdCkpCj4gICAJCXJldHVybiBQVFJfRVJSKHBsYXRf
ZGF0KTsKPiAgIAo+ICsJcGxhdF9kYXQtPm1hY19pbnRlcmZhY2UgPSBQSFlfSU5URVJGQUNFX01P
REVfTkE7Cj4gICAJcGxhdF9kYXQtPmhhc19nbWFjID0gdHJ1ZTsKPiAgIAo+ICAgCXJlZyA9IHN5
c2Nvbl9yZWdtYXBfbG9va3VwX2J5X2NvbXBhdGlibGUoIm54cCxscGMxODUwLWNyZWciKTsKPiBA
QCAtNDksOSArNTAsOSBAQCBzdGF0aWMgaW50IGxwYzE4eHhfZHdtYWNfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKPiAgIAkJcmV0dXJuIFBUUl9FUlIocmVnKTsKPiAgIAl9Cj4g
ICAKPiAtCWlmIChwbGF0X2RhdC0+bWFjX2ludGVyZmFjZSA9PSBQSFlfSU5URVJGQUNFX01PREVf
TUlJKSB7Cj4gKwlpZiAocGxhdF9kYXQtPnBoeV9pbnRlcmZhY2UgPT0gUEhZX0lOVEVSRkFDRV9N
T0RFX01JSSkgewo+ICAgCQlldGhtb2RlID0gTFBDMThYWF9DUkVHX0NSRUc2X0VUSE1PREVfTUlJ
Owo+IC0JfSBlbHNlIGlmIChwbGF0X2RhdC0+bWFjX2ludGVyZmFjZSA9PSBQSFlfSU5URVJGQUNF
X01PREVfUk1JSSkgewo+ICsJfSBlbHNlIGlmIChwbGF0X2RhdC0+cGh5X2ludGVyZmFjZSA9PSBQ
SFlfSU5URVJGQUNFX01PREVfUk1JSSkgewo+ICAgCQlldGhtb2RlID0gTFBDMThYWF9DUkVHX0NS
RUc2X0VUSE1PREVfUk1JSTsKPiAgIAl9IGVsc2Ugewo+ICAgCQlkZXZfZXJyKCZwZGV2LT5kZXYs
ICJPbmx5IE1JSSBhbmQgUk1JSSBtb2RlIHN1cHBvcnRlZFxuIik7CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
