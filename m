Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 990953390B0
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Mar 2021 16:05:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56EC9C57B53;
	Fri, 12 Mar 2021 15:05:44 +0000 (UTC)
Received: from smtp.wifcom.cz (smtp.wifcom.cz [85.207.3.150])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABC17C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 15:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=eaxlabs.cz;
 s=mail; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
 bh=UwtzL4pDkwTQcSrJ+2meBQW1w8X0nrXrsAaZqyjKa0A=; 
 b=c0+fb+RWYoBtShUccUrvuuwXJIkZbe8H4zynmm4WiYTT2OrDz69F37RSVs2ybenTn8pacujGhlyGxSBK+BgQwMfQl6Qks72QXBUuwD9L9mtQD46DJXx0wOW2Ty9ud2ydBrxsNgZLINLkREhbjC7/YAqRhzyz/z1pgBbyK7yPN8w=;
From: Martin DEVERA <devik@eaxlabs.cz>
To: Rob Herring <robh@kernel.org>
References: <YEsjMJae3cGOdyjG@kroah.com>
 <20210312102713.27776-1-devik@eaxlabs.cz>
 <1615559009.788146.2976052.nullmailer@robh.at.kernel.org>
 <e1cee5c4-8802-bf6b-be06-e453af559e62@eaxlabs.cz>
Message-ID: <f1762dc1-d359-e499-ace7-f957bca519b8@eaxlabs.cz>
Date: Fri, 12 Mar 2021 16:03:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e1cee5c4-8802-bf6b-be06-e453af559e62@eaxlabs.cz>
Content-Language: en-US
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus
X-Wif-ss: -2.9 (--)
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Le Ray <erwan.leray@st.com>
Subject: Re: [Linux-stm32] [PATCH v6 1/2] dt-bindings: serial: Add
	rx-tx-swap to stm32-usart
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

T24gMy8xMi8yMSAzOjU2IFBNLCBNYXJ0aW4gREVWRVJBIHdyb3RlOgo+IE9uIDMvMTIvMjEgMzoy
MyBQTSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+IE9uIEZyaSwgMTIgTWFyIDIwMjEgMTE6Mjc6MTIg
KzAxMDAsIE1hcnRpbiBEZXZlcmEgd3JvdGU6Cj4+PiBBZGQgbmV3IHJ4LXR4LXN3YXAgcHJvcGVy
dHkgdG8gYWxsb3cgZm9yIFJYICYgVFggcGluIHN3YXBwaW5nLgo+Pj4KPj4+IFNpZ25lZC1vZmYt
Ynk6IE1hcnRpbiBEZXZlcmEgPGRldmlrQGVheGxhYnMuY3o+Cj4+PiBBY2tlZC1ieTogRmFicmlj
ZSBHYXNuaWVyIDxmYWJyaWNlLmdhc25pZXJAZm9zcy5zdC5jb20+Cj4+PiAtLS0KPj4+IHY2Ogo+
Pj4gwqDCoCAtIGFkZCB2ZXJzaW9uIGNoYW5nZWxvZwo+Pj4gdjU6Cj4+PiDCoMKgIC0geWFtbCBm
aXhlcyBiYXNlZCBvbiBSb2IgSGVycmluZyBjb21tZW50cwo+Pj4gwqDCoMKgwqAgLSBhZGQgc2Vy
aWFsLnlhbWwgcmVmZXJlbmNlCj4+PiDCoMKgwqDCoCAtIG1vdmUgY29tcGF0aWJsZSBmcm9tICd0
aGVuJyB0byAnaWYnCj4+PiB2MzoKPj4+IMKgwqAgLSBkb24ndCBhbGxvdyByeC10eC1zd2FwIGZv
ciBzdCxzdG0zMi11YXJ0IChzdWdnZXN0ZWQKPj4+IMKgwqDCoMKgIGJ5IEZhYnJpY2UgR2Fzbmll
cikKPj4+IHYyOgo+Pj4gwqDCoCAtIGNoYW5nZSBzdCxzd2FwIHRvIHJ4LXR4LXN3YXAgKHN1Z2dl
c3RlZCBieSBSb2IgSGVycmluZykKPj4+IC0tLQo+Pj4gwqAgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc2VyaWFsL3N0LHN0bTMyLXVhcnQueWFtbMKgIHwgMjkgCj4+PiArKysrKysrKysrKysrKy0t
LS0tLS0tCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRp
b25zKC0pCj4+Pgo+PiBNeSBib3QgZm91bmQgZXJyb3JzIHJ1bm5pbmcgJ21ha2UgZHRfYmluZGlu
Z19jaGVjaycgb24geW91ciBwYXRjaDoKPj4KPj4geWFtbGxpbnQgd2FybmluZ3MvZXJyb3JzOgo+
PiAuL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvc3Qsc3RtMzItdWFy
dC55YW1sOjgxOjEyOiAKPj4gW3dhcm5pbmddIHdyb25nIGluZGVudGF0aW9uOiBleHBlY3RlZCAx
MCBidXQgZm91bmQgMTEgKGluZGVudGF0aW9uKQo+Pgo+PiBkdHNjaGVtYS9kdGMgd2FybmluZ3Mv
ZXJyb3JzOgo+Pgo+PiBTZWUgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC8xNDUx
ODYxCj4+Cj4+IFRoaXMgY2hlY2sgY2FuIGZhaWwgaWYgdGhlcmUgYXJlIGFueSBkZXBlbmRlbmNp
ZXMuIFRoZSBiYXNlIGZvciBhIHBhdGNoCj4+IHNlcmllcyBpcyBnZW5lcmFsbHkgdGhlIG1vc3Qg
cmVjZW50IHJjMS4KPj4KPj4gSWYgeW91IGFscmVhZHkgcmFuICdtYWtlIGR0X2JpbmRpbmdfY2hl
Y2snIGFuZCBkaWRuJ3Qgc2VlIHRoZSBhYm92ZQo+PiBlcnJvcihzKSwgdGhlbiBtYWtlIHN1cmUg
J3lhbWxsaW50JyBpcyBpbnN0YWxsZWQgYW5kIGR0LXNjaGVtYSBpcyB1cCB0bwo+PiBkYXRlOgo+
Pgo+PiBwaXAzIGluc3RhbGwgZHRzY2hlbWEgLS11cGdyYWRlCj4+Cj4gWW95IGFyZSByaWdodCwg
dGhlcmUgaXMgb25lIGV4dHJhIHNwYWNlLiBCdXQgZm9yIHNvbWUgcmVhc29uIHRoZSBjaGVjayAK
PiBkb2Vzbid0Cj4gZmluZCBpdDogCkFyZ2guLi4gc29ycnksIGlnbm9yZSBpdCBwbGVhc2UuIEl0
IHNlZW1zIEkgcmVtb3ZlZCB5YW1sbGludC4KSSBzZWUgdGhlIGVycm9yIG5vdy4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
