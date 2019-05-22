Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB16C2AF31
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 09:07:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5138C59794
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 07:07:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FA3BC555BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2019 00:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hm8KAS51FJgM/544BU4ZzW/jeZKKGVPb5yRLDzOERlY=; b=leU35Iybl8T8ZH3/2J0Fayieg
 mN0/yeeBqOYuC1ZYQEHNHy+tTiuO6vwwKgp2pusxI1PCN1xOmyoCip2vAGQ82/HtdWs+jY8Knha44
 GHz3WT4Gy/EWueH1O3bpM7XJ//tOIrptKYN2Pz9+Akp+IWOK39Emv9W9+3koZlzWlugA2xK4evtx7
 CHq/WoxfPmVWTtmTub4WBz/x8vf+AAu/4nbu876cLK+Y1g6Ig5gouPbuMZis2Ds5Hi8Aey6EqEoMZ
 uB45sUVwuTSVK1YPNx7l4oP/p6p2esbXtZ8Q1Li5u5A3J6a91keIpH8v8w1q/bV29aqVUvSEv+FzY
 B7F7y1Dew==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=midway.dunlab)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTF1v-0004pF-Gz; Wed, 22 May 2019 00:22:51 +0000
To: Amelie Delaunay <amelie.delaunay@st.com>, Lee Jones
 <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <1558338735-8444-1-git-send-email-amelie.delaunay@st.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <381dcecc-2ca9-c44f-5a83-a293372ecd1e@infradead.org>
Date: Tue, 21 May 2019 17:22:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1558338735-8444-1-git-send-email-amelie.delaunay@st.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 27 May 2019 07:07:42 +0000
Cc: linux-gpio@vger.kernel.org, kbuild-all@01.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stmfx: Fix compile issue when
 CONFIG_OF_GPIO is not defined
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

T24gNS8yMC8xOSAxMjo1MiBBTSwgQW1lbGllIERlbGF1bmF5IHdyb3RlOgo+IFdoZW4gQ09ORklH
X0dQSU9fT0YgaXMgbm90IGRlZmluZWQsIHN0cnVjdCBncGlvX2NoaXAgJ29mX25vZGUnIG1lbWJl
ciBkb2VzCj4gbm90IGV4aXN0Ogo+IGRyaXZlcnMvcGluY3RybC9waW5jdHJsLXN0bWZ4LmM6IElu
IGZ1bmN0aW9uICdzdG1meF9waW5jdHJsX3Byb2JlJzoKPiBkcml2ZXJzL3BpbmN0cmwvcGluY3Ry
bC1zdG1meC5jOjY1MjoxNzogZXJyb3I6ICdzdHJ1Y3QgZ3Bpb19jaGlwJyBoYXMgbm8gbWVtYmVy
IG5hbWVkICdvZl9ub2RlJwo+ICAgICAgcGN0bC0+Z3Bpb19jaGlwLm9mX25vZGUgPSBucDsKPiAK
PiBGaXhlczogMTQ5MGQ5Zjg0MWIxICgicGluY3RybDogQWRkIFNUTUZYIEdQSU8gZXhwYW5kZXIg
UGluY3RybC9HUElPIGRyaXZlciIpCj4gUmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0IHJvYm90IDxs
a3BAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFtZWxpZSBEZWxhdW5heSA8YW1lbGllLmRl
bGF1bmF5QHN0LmNvbT4KClRoaXMgaXMgZ29vZCBhcyBmYXIgYXMgaXQgZ29lcywgYnV0IEkgYW0g
YWxzbyBzZWVpbmcgYSBidWlsZCBlcnJvciBpbgpwaW5jdHJsLXN0bWZ4LmMgd2hlbiBDT05GSUdf
T0YgaXMgbm90IHNldC9lbmFibGVkIChyYW5kY29uZmlnKToKCi4uL2RyaXZlcnMvcGluY3RybC9w
aW5jdHJsLXN0bWZ4LmM6NDA5OjIwOiBlcnJvcjog4oCYcGluY29uZl9nZW5lcmljX2R0X25vZGVf
dG9fbWFwX3BpbuKAmSB1bmRlY2xhcmVkIGhlcmUgKG5vdCBpbiBhIGZ1bmN0aW9uKQogIC5kdF9u
b2RlX3RvX21hcCA9IHBpbmNvbmZfZ2VuZXJpY19kdF9ub2RlX3RvX21hcF9waW4sCiAgICAgICAg
ICAgICAgICAgICAgXgoKPiAtLS0KPiAgZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtc3RtZnguYyB8
IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3BpbmN0cmwvcGluY3RybC1zdG1meC5jIGIvZHJpdmVycy9waW5jdHJsL3BpbmN0
cmwtc3RtZnguYwo+IGluZGV4IGViYTg3MmMuLmJiNjRhYTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9waW5jdHJsL3BpbmN0cmwtc3RtZnguYwo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9waW5jdHJs
LXN0bWZ4LmMKPiBAQCAtNjQ4LDcgKzY0OCw5IEBAIHN0YXRpYyBpbnQgc3RtZnhfcGluY3RybF9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJcGN0bC0+Z3Bpb19jaGlwLmJh
c2UgPSAtMTsKPiAgCXBjdGwtPmdwaW9fY2hpcC5uZ3BpbyA9IHBjdGwtPnBjdGxfZGVzYy5ucGlu
czsKPiAgCXBjdGwtPmdwaW9fY2hpcC5jYW5fc2xlZXAgPSB0cnVlOwo+ICsjaWZkZWYgQ09ORklH
X09GX0dQSU8KPiAgCXBjdGwtPmdwaW9fY2hpcC5vZl9ub2RlID0gbnA7Cj4gKyNlbmRpZgo+ICAJ
cGN0bC0+Z3Bpb19jaGlwLm5lZWRfdmFsaWRfbWFzayA9IHRydWU7Cj4gIAo+ICAJcmV0ID0gZGV2
bV9ncGlvY2hpcF9hZGRfZGF0YShwY3RsLT5kZXYsICZwY3RsLT5ncGlvX2NoaXAsIHBjdGwpOwo+
IAoKCi0tIAp+UmFuZHkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
