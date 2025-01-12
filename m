Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1795DA0AFF4
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 08:19:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9145C78F7F;
	Mon, 13 Jan 2025 07:19:30 +0000 (UTC)
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com
 [95.215.58.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8298ACFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2025 12:36:27 +0000 (UTC)
Message-ID: <ac947d88-750e-4058-aa3e-b539a09b89d0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1736685386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=16i8/HmQrvop6Wq90czxPGnG6F8sVpZRlEdmEypLhGg=;
 b=XOzJkVkQ3/t6r0eAnc340BPC0gjMQa4eBTcCWyH8oWtCQ9H2vQXZNjYlnUcN2zqXW2jUy6
 9gHXwt9PRG05mv3Ho85bgnhhzaMCTLGf/pHyTsgp29lIqr+qupcNfngaijyVQpxGHRpCOJ
 F8tlJzh2UtZzKfU+iLqQ8R7FIFsS0Ps=
Date: Sun, 12 Jan 2025 20:35:32 +0800
MIME-Version: 1.0
To: Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "'David S . Miller'" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20250109155842.60798-1-rgallaispou@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250109155842.60798-1-rgallaispou@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 13 Jan 2025 07:19:29 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: sti: Switch from
 CONFIG_PM_SLEEP guards to pm_sleep_ptr()
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

CuWcqCAxLzkvMjUgMjM6NTgsIFJhcGhhZWwgR2FsbGFpcy1Qb3Ug5YaZ6YGTOgo+IExldHRpbmcg
dGhlIGNvbXBpbGVyIHJlbW92ZSB0aGVzZSBmdW5jdGlvbnMgd2hlbiB0aGUga2VybmVsIGlzIGJ1
aWx0Cj4gd2l0aG91dCBDT05GSUdfUE1fU0xFRVAgc3VwcG9ydCBpcyBzaW1wbGVyIGFuZCBsZXNz
IGVycm9yIHByb25lIHRoYW4gdGhlCj4gdXNlIG9mICNpZmRlZiBiYXNlZCBrZXJuZWwgY29uZmln
dXJhdGlvbiBndWFyZHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYWVsIEdhbGxhaXMtUG91IDxy
Z2FsbGFpc3BvdUBnbWFpbC5jb20+CgpMR1RNIQoKClJldmlld2VkLWJ5OiBZYW50ZW5nIFNpIDxz
aS55YW50ZW5nQGxpbnV4LmRldj4KCgpUaGFua3MsCgpZYW50ZW5nCgo+IC0tLQo+IENoYW5nZXMg
aW4gdjI6Cj4gICAgLSBTcGxpdCBzZXJpZSBpbiBzaW5nbGUgcGF0Y2hlcwo+ICAgIC0gUmVtb3Zl
IGlycmVsZXZhbnQgJ0xpbms6JyBmcm9tIGNvbW1pdCBsb2cKPiAgICAtIExpbmsgdG8gdjE6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDEyMjktdXBkYXRlX3BtX21hY3JvLXYxLTUtYzdk
NGM0ODU2MzM2QGdtYWlsLmNvbQo+IC0tLQo+ICAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvZHdtYWMtc3RpLmMgfCA4ICsrKy0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0
L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN0aS5jIGIvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc3RpLmMKPiBpbmRleCBlYWJjNGRhOWUxYTkuLmRlOWI2
ZGZlZjE1YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9kd21hYy1zdGkuYwo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L2R3bWFjLXN0aS5jCj4gQEAgLTMxMyw3ICszMTMsNiBAQCBzdGF0aWMgdm9pZCBzdGlfZHdtYWNf
cmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAJY2xrX2Rpc2FibGVfdW5w
cmVwYXJlKGR3bWFjLT5jbGspOwo+ICAgfQo+ICAgCj4gLSNpZmRlZiBDT05GSUdfUE1fU0xFRVAK
PiAgIHN0YXRpYyBpbnQgc3RpX2R3bWFjX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ICAg
ewo+ICAgCXN0cnVjdCBzdGlfZHdtYWMgKmR3bWFjID0gZ2V0X3N0bW1hY19ic3BfcHJpdihkZXYp
Owo+IEBAIC0zMzMsMTAgKzMzMiw5IEBAIHN0YXRpYyBpbnQgc3RpX2R3bWFjX3Jlc3VtZShzdHJ1
Y3QgZGV2aWNlICpkZXYpCj4gICAKPiAgIAlyZXR1cm4gc3RtbWFjX3Jlc3VtZShkZXYpOwo+ICAg
fQo+IC0jZW5kaWYgLyogQ09ORklHX1BNX1NMRUVQICovCj4gICAKPiAtc3RhdGljIFNJTVBMRV9E
RVZfUE1fT1BTKHN0aV9kd21hY19wbV9vcHMsIHN0aV9kd21hY19zdXNwZW5kLAo+IC0JCQkJCSAg
IHN0aV9kd21hY19yZXN1bWUpOwo+ICtzdGF0aWMgREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTKHN0
aV9kd21hY19wbV9vcHMsIHN0aV9kd21hY19zdXNwZW5kLAo+ICsJCQkJCQkgIHN0aV9kd21hY19y
ZXN1bWUpOwo+ICAgCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IHN0aV9kd21hY19vZl9kYXRhIHN0
aWg0eHhfZHdtYWNfZGF0YSA9IHsKPiAgIAkuZml4X3JldGltZV9zcmMgPSBzdGloNHh4X2ZpeF9y
ZXRpbWVfc3JjLAo+IEBAIC0zNTMsNyArMzUxLDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9k
cml2ZXIgc3RpX2R3bWFjX2RyaXZlciA9IHsKPiAgIAkucmVtb3ZlID0gc3RpX2R3bWFjX3JlbW92
ZSwKPiAgIAkuZHJpdmVyID0gewo+ICAgCQkubmFtZSAgICAgICAgICAgPSAic3RpLWR3bWFjIiwK
PiAtCQkucG0JCT0gJnN0aV9kd21hY19wbV9vcHMsCj4gKwkJLnBtCQk9IHBtX3NsZWVwX3B0cigm
c3RpX2R3bWFjX3BtX29wcyksCj4gICAJCS5vZl9tYXRjaF90YWJsZSA9IHN0aV9kd21hY19tYXRj
aCwKPiAgIAl9LAo+ICAgfTsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
