Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8743F230D
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Aug 2021 00:22:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43DE0C58D7A;
	Thu, 19 Aug 2021 22:22:35 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86F41C57B7D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Aug 2021 22:22:31 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3D71D82999;
 Fri, 20 Aug 2021 00:22:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1629411750;
 bh=33UHPL0RZcL6+9jW56lcEU9a2CDzC1s+ybQGXQwzmfQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Dt65FNaCxgBS+xEd01WWk4ajHnXrhGr0PbF+ALRxohsJqNUqyhXhbH0z/WMP51PzV
 J5K2nkxWLrY7YmMdxUOwaY9TfEq235oiKG3okvKE9/JbggRICauVU6ff35IRYP4Tap
 4q316SIay5cHI4HYKr9md1UqKwsBRywA7AoRfZLtu2u9qyN/K6z76GdPBVZh61lfEk
 XuQLKJPm0Sj1N5cxXOtlPYdi7ZpxYWtk/C6umu29mZd2Q6uXWqgnjdMuX9dNtl6MVy
 J6UcVAoKrAA6sb/oZL9Qu0skmGXaO+cKXK+gkgW2/ZrjoCPOG+0FsRzkOSN0ZUtX62
 r11+g2AKsPs/A==
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
References: <20210629115709.16145-1-raphael.gallais-pou@foss.st.com>
 <420e243d-7541-a07e-177b-d2db11c26aef@denx.de>
 <3bb823e4-4724-7072-fe9f-7b8a355c8e50@foss.st.com>
 <5d65ca80-4f94-49e1-5de1-cf29e8231a6a@denx.de>
 <629b6666-74b3-91f0-5c6c-e26d55ea62d8@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <a051825c-1795-b7c4-6fdd-64595e52a6ca@denx.de>
Date: Fri, 20 Aug 2021 00:22:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <629b6666-74b3-91f0-5c6c-e26d55ea62d8@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: improve pm_runtime to stop
	clocks
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

T24gOC8xNy8yMSAxMTo0MyBBTSwgUmFwaGFlbCBHYWxsYWlzLVBvdSB3cm90ZToKPiAKPiBPbiA3
LzIvMjEgODowNyBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IE9uIDcvMi8yMSAxMToyMyBBTSwg
UmFwaGFlbCBHYWxsYWlzLVBvdSB3cm90ZToKPj4+IEhlbGxvIE1hcmVrLAo+Pgo+PiBIaSwKPj4K
Pj4+IFNvcnJ5IGZvciB0aGUgbGF0ZSBhbnN3ZXIuCj4+Cj4+IE5vIHdvcnJpZXMsIHRha2UgeW91
ciB0aW1lCj4+Cj4+PiBPbiA2LzMwLzIxIDI6MzUgQU0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4+
IE9uIDYvMjkvMjEgMTo1OCBQTSwgUmFwaGFlbCBHQUxMQUlTLVBPVSAtIGZvc3Mgd3JvdGU6Cj4+
Pj4KPj4+PiBbLi4uXQo+Pj4+Cj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5j
Cj4+Pj4+IEBAIC00MjUsMTAgKzQyNSwxNyBAQCBzdGF0aWMgdm9pZCBsdGRjX2NydGNfYXRvbWlj
X2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4+Pj4+ICDCoCB7Cj4+Pj4+ICDCoMKgwqDC
oMKgIHN0cnVjdCBsdGRjX2RldmljZSAqbGRldiA9IGNydGNfdG9fbHRkYyhjcnRjKTsKPj4+Pj4g
IMKgwqDCoMKgwqAgc3RydWN0IGRybV9kZXZpY2UgKmRkZXYgPSBjcnRjLT5kZXY7Cj4+Pj4+ICvC
oMKgwqAgaW50IHJldDsKPj4+Pj4gIMKgIMKgwqDCoMKgwqAgRFJNX0RFQlVHX0RSSVZFUigiXG4i
KTsKPj4+Pj4gIMKgIC3CoMKgwqAgcG1fcnVudGltZV9nZXRfc3luYyhkZGV2LT5kZXYpOwo+Pj4+
PiArwqDCoMKgIGlmICghcG1fcnVudGltZV9hY3RpdmUoZGRldi0+ZGV2KSkgewo+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgcmV0ID0gcG1fcnVudGltZV9nZXRfc3luYyhkZGV2LT5kZXYpOwo+Pj4+Cj4+
Pj4gQWxsIHRoZXNlIGlmICghcG1fcnVudGltZV9hY3RpdmUoKSkgdGhlbiBwbV9ydW50aW1lX2dl
dF9zeW5jKCkgY2FsbHMgbG9vayBsaWtlIHdvcmthcm91bmQgZm9yIHNvbWUgbGFyZ2VyIGlzc3Vl
LiBTaG91bGRuJ3QgdGhlIHBtX3J1bnRpbWUgZG8gc29tZSByZWZjb3VudGluZyBvbiBpdHMgb3du
ICwgc28gdGhpcyBzaG91bGRuJ3QgYmUgbmVlZGVkID8KPj4+Cj4+Pgo+Pj4gVGhpcyBwcm9ibGVt
IHB1cmVseSBjb21lcyBmcm9tIHRoZSBkcml2ZXIgaW50ZXJuYWxzLCBzbyBJIGRvbid0IHRoaW5r
IGl0IGlzIGEgd29ya2Fyb3VuZC4KPj4+Cj4+PiBCZWNhdXNlIG9mIHRoZSAibHRkY19jcnRjX21v
ZGVfc2V0X25vZmIiIGZ1bmN0aW9uIHdoaWNoIGRvZXMgbm90IGhhdmUgYW55ICJzeW1tZXRyaWNh
bCIgY2FsbCwgc3VjaCBhcyBlbmFibGUvZGlzYWJsZSBmdW5jdGlvbnMsIHRoZXJlIHdhcyB0d28g
Y2FsbHMgdG8gcG1fcnVudGltZV9nZXRfc3luYyBhZ2FpbnN0IG9uZSBjYWxsIHRvIHBtX3J1bnRp
bWVfcHV0X3N5bmMuCj4+Pgo+Pj4gVGhpcyBpbnN0YWJpbGl0eSByZXN1bHRlZCBpbiB0aGUgTFRE
QyBjbG9ja3MgYmVpbmcgYWx3YXlzIGVuYWJsZWQsIGV2ZW4gd2hlbiB0aGUgcGVyaXBoZXJhbCB3
YXMgZGlzYWJsZWQuIFRoaXMgY291bGQgYmUgc2VlbiBpbiB0aGUgY2xrX3N1bW1hcnkgYXMgZXhw
bGFpbmVkIGluIHRoZSBwYXRjaCBzdW1tYXJ5IGFtb25nIG90aGVyIHRoaW5ncy4KPj4+Cj4+PiBC
eSBkb2luZyBzbywgd2UgZmlyc3QgY2hlY2sgaWYgdGhlIGNsb2NrcyBhcmUgbm90IGFscmVhZHkg
YWN0aXZhdGVkLCBhbmQgaW4gdGhhdCBjYXNlIHdlIGNhbGwgcG1fcnVudGltZV9nZXRfc3luYy4K
Pj4KPj4gSSBqdXN0IGhhdmUgdG8gd29uZGVyLCBob3cgY29tZSBvdGhlciBkcml2ZXJzIGRvbid0
IG5lZWQgdGhlc2UgaWYgKCFwbV9ydW50aW1lX2FjdGl2ZSgpKSBwbV9ydW50aW1lX2dldF9zeW5j
KCkgY29uZGl0aW9ucy4gSSB0aGluayB0aGV5IGp1c3QgZ2V0L3B1dCB0aGUgcnVudGltZSBQTSB3
aXRoaW4gYSBjYWxsIGl0c2VsZiwgbm90IGFjcm9zcyBmdW5jdGlvbiBjYWxscy4gTWF5YmUgdGhh
dCBjb3VsZCBiZSB0aGUgcmlnaHQgZml4IGhlcmUgdG9vID8KPiAKPiAKPiBIZWxsbyBNYXJlaywK
CkhpLAoKPiBJJ3ZlIHJ1biBhIGRlZXBlciBhbmFseXNpcyBvdmVyIHRoaXMgaW1wbGVtZW50YXRp
b24uCgpUaGFuayB5b3UKCj4gSWYgSSBtYXkgdGFrZSByb2NrY2hpcCdzICJyb2NrY2hpcF9kcm1f
dm9wLmMiIGRyaXZlciwgdGhlcmUgaXMgYW4gYm9vbGVhbiAiaXNfZW5hYmxlZCIgc2V0IHRvIHRy
dWUgd2hlbiBjcnRjX2F0b21pY19lbmFibGUgaXMgY2FsbGVkLgo+IAo+IFRoZSBhYm92ZSBpbXBs
ZW1lbnRhdGlvbiBjb3VsZCBzYXZlIHVzIGZyb20gYWRkaW5nIHN1Y2ggZmllbGQgaW4gdGhlIGx0
ZGNfZGV2IHN0cnVjdHVyZS4KPiAKPiBBbm90aGVyIHNvbHV0aW9uIGNvdWxkIGJlIGluIG9yZGVy
IHRvIHNpbXBseSBjYWxsIHBtX3J1bnRpbWVfZ2V0X3N5bmMoKSBpbiBsdGRjX2NydGNfbW9kZV9z
ZXRfbm9mYigpIGFuZCBieSByZW1vdmluZyB0aGlzIGNvbmRpdGlvbiBpbiBsdGRjX2F0b21pY19j
cnRjX2Rpc2FibGUoKSB0aGUgZHJpdmVyIGJlaGF2ZXMganVzdCBsaWtlIHRoZSBmaXJzdCB2ZXJz
aW9uIG9mIHRoaXMgcGF0Y2guCj4gCj4gSW4gdGhpcyB3YXksIGl0IGF2b2lkcyBzdWNoIGNvbmRp
dGlvbnMgYW5kIHNlZW1zIG1vcmUgdG8gZ2V0IGFsb25nIHdpdGggdGhlIGN1cnJlbnQgaW1wbGVt
ZW50YXRpb24uCgpMZXQgbWUgbWF5YmUgYXNrIGEgZGlmZmVyZW50IHF1ZXN0aW9uIC0tIGNhbiBs
dGRjX2NydGNfbW9kZV9zZXRfbm9mYigpIApldmVyIGJlIGNhbGxlZCB3aXRoIHRoZSBMVERDIHN1
c3BlbmRlZCAoc28geW91IHdvdWxkIGhhdmUgdG8gY2FsbCAKcG1fcnVudGltZV9nZXRfc3luYygp
IGluIHRoYXQgZnVuY3Rpb24gdG8gcG93ZXIgdGhlIGJsb2NrIHVwIGFuZCB0byBnZXQgCmFjY2Vz
cyB0byBpdHMgcmVnaXN0ZXJzKSA/CgpbLi4uXQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
