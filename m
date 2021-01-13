Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B5A2F4D73
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Jan 2021 15:45:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34946C5660F;
	Wed, 13 Jan 2021 14:45:12 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68FA3C424BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jan 2021 14:45:10 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DG9GF3d3mz1qw9v;
 Wed, 13 Jan 2021 15:45:09 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DG9GF194Mz1tYWc;
 Wed, 13 Jan 2021 15:45:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Qs4kinPvzBp8; Wed, 13 Jan 2021 15:45:08 +0100 (CET)
X-Auth-Info: e0i2lK6b5VfpekyATUmk8KQgP9D45XgI+JpoatpQhBE=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 13 Jan 2021 15:45:07 +0100 (CET)
To: Yann GAUTIER <yann.gautier@foss.st.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
References: <20210105140718.122752-1-marex@denx.de>
 <CAPDyKFoQfm2ZtPdsZSZtOCDH-FJqNzihYqZny-vUdK4Q4tWTzQ@mail.gmail.com>
 <b83c1112-010b-a40f-319f-84c755424b0f@denx.de>
 <CAPDyKFo5Sqxj31owrnmz1sTZqgW_PtZM2H=pDPBz+9hc0W0hHA@mail.gmail.com>
 <77dd612b-23f0-1f77-797a-9cde512926e3@denx.de>
 <f91fbdfc-453d-78a6-970a-5d6eecd443b2@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <ccef7ae4-8cd7-4434-9632-917a4fb92f53@denx.de>
Date: Wed, 13 Jan 2021 15:45:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f91fbdfc-453d-78a6-970a-5d6eecd443b2@foss.st.com>
Content-Language: en-US
Cc: Linus Walleij <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] [RFC] mmc: mmci: Add support for probing
 bus voltage level translator
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

T24gMS8xMy8yMSAzOjIxIFBNLCBZYW5uIEdBVVRJRVIgd3JvdGU6Cj4gT24gMS8xMy8yMSAxMjo1
MiBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IE9uIDEvMTMvMjEgMTI6MzggUE0sIFVsZiBIYW5z
c29uIHdyb3RlOgo+PiBbLi4uXQo+Pj4+Pj4gwqDCoCBzdGF0aWMgaW50IG1tY2lfb2ZfcGFyc2Uo
c3RydWN0IGRldmljZV9ub2RlICpucCwgc3RydWN0IAo+Pj4+Pj4gbW1jX2hvc3QgKm1tYykKPj4+
Pj4+IMKgwqAgewo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBtbWNpX2hvc3QgKmhv
c3QgPSBtbWNfcHJpdihtbWMpOwo+Pj4+Pj4gQEAgLTE5MTMsNyArMTk3Myw3IEBAIHN0YXRpYyBp
bnQgbW1jaV9vZl9wYXJzZShzdHJ1Y3QgZGV2aWNlX25vZGUgCj4+Pj4+PiAqbnAsIHN0cnVjdCBt
bWNfaG9zdCAqbW1jKQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChvZl9nZXRfcHJvcGVy
dHkobnAsICJzdCxuZWctZWRnZSIsIE5VTEwpKQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBob3N0LT5jbGtfcmVnX2FkZCB8PSBNQ0lfU1RNMzJfQ0xLX05FR0VER0U7
Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKG9mX2dldF9wcm9wZXJ0eShucCwgInN0LHVz
ZS1ja2luIiwgTlVMTCkpCj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBob3N0
LT5jbGtfcmVnX2FkZCB8PSBNQ0lfU1RNMzJfQ0xLX1NFTENLSU47Cj4+Pj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBtbWNpX3Byb2JlX2xldmVsX3RyYW5zbGF0b3IobW1jKTsKPj4+
Pj4KPj4+Pj4gSSB0aGluayB5b3UgY2FuIG1ha2UgdGhpcyBjaGFuZ2UgYml0IGxlc3MgaW52YXNp
dmUuIFJhdGhlciB0aGFuIGhhdmluZwo+Pj4+PiB0byBzaHVmZmxlIGNvZGUgYXJvdW5kIGluIC0+
cHJvYmUoKSwgSSBzdWdnZXN0IHlvdSBjYWxsCj4+Pj4+IG1tY2lfcHJvYmVfbGV2ZWxfdHJhbnNs
YXRvcigpIG91dHNpZGUgYW5kIGFmdGVyIG1tY2lfb2ZfcGFyc2UoKSBoYXMKPj4+Pj4gYmVlbiBj
YWxsZWQuCj4+Pj4+Cj4+Pj4+IEluIHRoaXMgd2F5LCB5b3UgY2FuIGFsc28gcHJvdmlkZSBtbWNp
X3Byb2JlX2xldmVsX3RyYW5zbGF0b3IoKSB3aXRoIGEKPj4+Pj4gc3RydWN0IG1tY2lfaG9zdCAq
LCByYXRoZXIgdGhhbiBoYXZpbmcgdG8gcGljayBpdCB1cCBmcm9tCj4+Pj4+IG1tY19wcml2KG1t
YyksIGlmIHlvdSBzZWUgd2hhdCBJIG1lYW4uCj4+Pj4+Cj4+Pj4+IE9mIGNvdXJzZSwgdGhpcyBh
bHNvIG1lYW5zIGluIG1tY2lfcHJvYmVfbGV2ZWxfdHJhbnNsYXRvcigpIHlvdSB3aWxsCj4+Pj4+
IGhhdmUgdG8gY2hlY2sgaWYgTUNJX1NUTTMyX0NMS19TRUxDS0lOIGhhcyBiZWVuIHNldCwgYW5k
IGlmIG5vdCB0aGVuCj4+Pj4+IGRvIGFuIGVhcmx5IHJldHVybi4KPj4+Pgo+Pj4+IFRlc3Rpbmcg
dGhlIHRyYW5zbGF0b3IgcHJlc2VuY2Ugd2hlbiBjaGVja2luZyB3aGV0aGVyIGl0cyBlbmFibGVk
IGluIERUCj4+Pj4gc2VlbXMgbGlrZSB0aGUgcmlnaHQgcGxhY2UsIGJ1dCB0aGF0J3MgcmVhbGx5
IGp1c3QgYW4gaW1wbGVtZW50YXRpb24gCj4+Pj4gZGV0YWlsLgo+Pj4+Cj4+Pj4gSSBhbSBtb3Jl
IGludGVyZXN0ZWQgaW4ga25vd2luZyB3aGV0aGVyIGFkZGluZwo+Pj4+IG1tY2lfcHJvYmVfbGV2
ZWxfdHJhbnNsYXRvcigpIGlzIGV2ZW4gYWNjZXB0YWJsZSBpbiB0aGUgZmlyc3QgcGxhY2UuIAo+
Pj4+IElzIGl0ID8KPj4+Cj4+PiBIb25lc3RseSwgSSBkb24ndCBrbm93Lgo+Pj4KPj4+IEkgdGhp
bmsgSSBuZWVkIHRvIGRlZmVyIHRoYXQgcXVlc3Rpb24gdG8gTGludXMgV2FsbGVpai4gQW5kIG9m
IGNvdXJzZSwKPj4+IGl0IHdvdWxkIGJlIG5pY2UgdG8gZ2V0IHRoZSBvcGluaW9uIGZyb20gTHVk
b3ZpYyBhcyB3ZWxsLgo+Pgo+PiBHb29kLCB0aGF0J3Mgd2hhdCBJIHdhcyBob3BpbmcgZm9yIHRv
by4KPiAKPiBIaSwKPiAKPiBMdWRvdmljIGlzIG91dCBvZiBvZmZpY2UgdGhpcyB3ZWVrLgo+IAo+
IFRoZSBmZWF0dXJlIG9mIGRldGVjdGluZyBhIGxldmVsIHRyYW5zbGF0b3Igc2VlbXMgdG8gYmUg
cXVpdGUgZ2VuZXJpYywgCj4gYW5kIG5vdCBkZWRpY2F0ZWQgdG8gTU1DSSBkcml2ZXIgb3IgdGhl
IFNUIGRlZGljYXRlZCBjb2RlLCBhbmQgd2l0aCBuZXcgCj4gc3QsKiBwcm9wZXJ0aWVzLiBJdCBt
YXkgYmUgaW4gZ2VuZXJpYyBtbWMgY29kZS4gQnV0IEknbGwgbGV0IExpbnVzIAo+IGNvbW1lbnQg
YWJvdXQgdGhhdC4KPiAKPiBJIGFsc28gd29uZGVyIGlmIHRoaXMgSFcgZGV0ZWN0aW9uIHNob3Vs
ZCBiZSBkb25lIGluIGtlcm5lbCwgb3IgaWYgaXQgCj4gc2hvdWxkIGJlIGRvbmUgaW4gQm9vdGxv
YWRlci4gQnV0IGl0IG1heSBiZSBtb3JlIGNvbXBsZXgsIHRvIGFkZCB0aGUgCj4gc3QsdXNlX2Nr
aW4gaW4ga2VybmVsIERUIGlmIGJvb3Rsb2FkZXIgZGV0ZWN0cyB0aGlzIHRyYW5zbGF0b3IuCgpM
ZXRzIG5vdCBhdHRlbXB0IHRvIGhpZGUgaW5vYnZpb3VzIGZ1bmN0aW9uYWxpdHkgaW4gYm9vdGxv
YWRlcnMsIHRoZSAKa2VybmVsIHNob3VsZCBiZSBpbmRlcGVuZGVudCBvZiBib290bG9hZGVyIHdo
ZXJlIHBvc3NpYmxlLiBBbmQgaGVyZSBpdCAKaXMgY2xlYXJseSBhbmQgZWFzaWx5IHBvc3NpYmxl
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
