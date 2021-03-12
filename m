Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5889339084
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Mar 2021 15:58:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81DF5C57B53;
	Fri, 12 Mar 2021 14:58:14 +0000 (UTC)
Received: from smtp.wifcom.cz (smtp.wifcom.cz [85.207.3.150])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70804C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 14:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=eaxlabs.cz;
 s=mail; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=+ODlebsRi7UBFpuw2Qtf/wIJy/tAExCwWIBFL8tLU1Q=; 
 b=Rwth2iPK6Sr8Mw/yowD1aORpKm/YGYY+WsbT/roHiNKs8ztdxtsdghyfGUUc768u1EkUHjsbkK7l1wj6txrBx5Mif+8eGbqaIubiy2yZF4Sy2cFZmfxctiF4yc2RbCGBPbxfV4cpbmxsOI98tUfGnTc7aZlzboHbbdOW+acyFCg=;
To: Rob Herring <robh@kernel.org>
References: <YEsjMJae3cGOdyjG@kroah.com>
 <20210312102713.27776-1-devik@eaxlabs.cz>
 <1615559009.788146.2976052.nullmailer@robh.at.kernel.org>
From: Martin DEVERA <devik@eaxlabs.cz>
Message-ID: <e1cee5c4-8802-bf6b-be06-e453af559e62@eaxlabs.cz>
Date: Fri, 12 Mar 2021 15:56:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1615559009.788146.2976052.nullmailer@robh.at.kernel.org>
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

T24gMy8xMi8yMSAzOjIzIFBNLCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBGcmksIDEyIE1hciAy
MDIxIDExOjI3OjEyICswMTAwLCBNYXJ0aW4gRGV2ZXJhIHdyb3RlOgo+PiBBZGQgbmV3IHJ4LXR4
LXN3YXAgcHJvcGVydHkgdG8gYWxsb3cgZm9yIFJYICYgVFggcGluIHN3YXBwaW5nLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBNYXJ0aW4gRGV2ZXJhIDxkZXZpa0BlYXhsYWJzLmN6Pgo+PiBBY2tlZC1i
eTogRmFicmljZSBHYXNuaWVyIDxmYWJyaWNlLmdhc25pZXJAZm9zcy5zdC5jb20+Cj4+IC0tLQo+
PiB2NjoKPj4gICAgLSBhZGQgdmVyc2lvbiBjaGFuZ2Vsb2cKPj4gdjU6Cj4+ICAgIC0geWFtbCBm
aXhlcyBiYXNlZCBvbiBSb2IgSGVycmluZyBjb21tZW50cwo+PiAgICAgIC0gYWRkIHNlcmlhbC55
YW1sIHJlZmVyZW5jZQo+PiAgICAgIC0gbW92ZSBjb21wYXRpYmxlIGZyb20gJ3RoZW4nIHRvICdp
ZicKPj4gdjM6Cj4+ICAgIC0gZG9uJ3QgYWxsb3cgcngtdHgtc3dhcCBmb3Igc3Qsc3RtMzItdWFy
dCAoc3VnZ2VzdGVkCj4+ICAgICAgYnkgRmFicmljZSBHYXNuaWVyKQo+PiB2MjoKPj4gICAgLSBj
aGFuZ2Ugc3Qsc3dhcCB0byByeC10eC1zd2FwIChzdWdnZXN0ZWQgYnkgUm9iIEhlcnJpbmcpCj4+
IC0tLQo+PiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9zdCxzdG0zMi11YXJ0Lnlh
bWwgIHwgMjkgKysrKysrKysrKysrKystLS0tLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxOSBp
bnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPj4KPiBNeSBib3QgZm91bmQgZXJyb3JzIHJ1
bm5pbmcgJ21ha2UgZHRfYmluZGluZ19jaGVjaycgb24geW91ciBwYXRjaDoKPgo+IHlhbWxsaW50
IHdhcm5pbmdzL2Vycm9yczoKPiAuL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9z
ZXJpYWwvc3Qsc3RtMzItdWFydC55YW1sOjgxOjEyOiBbd2FybmluZ10gd3JvbmcgaW5kZW50YXRp
b246IGV4cGVjdGVkIDEwIGJ1dCBmb3VuZCAxMSAoaW5kZW50YXRpb24pCj4KPiBkdHNjaGVtYS9k
dGMgd2FybmluZ3MvZXJyb3JzOgo+Cj4gU2VlIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cGF0Y2gvMTQ1MTg2MQo+Cj4gVGhpcyBjaGVjayBjYW4gZmFpbCBpZiB0aGVyZSBhcmUgYW55IGRl
cGVuZGVuY2llcy4gVGhlIGJhc2UgZm9yIGEgcGF0Y2gKPiBzZXJpZXMgaXMgZ2VuZXJhbGx5IHRo
ZSBtb3N0IHJlY2VudCByYzEuCj4KPiBJZiB5b3UgYWxyZWFkeSByYW4gJ21ha2UgZHRfYmluZGlu
Z19jaGVjaycgYW5kIGRpZG4ndCBzZWUgdGhlIGFib3ZlCj4gZXJyb3IocyksIHRoZW4gbWFrZSBz
dXJlICd5YW1sbGludCcgaXMgaW5zdGFsbGVkIGFuZCBkdC1zY2hlbWEgaXMgdXAgdG8KPiBkYXRl
Ogo+Cj4gcGlwMyBpbnN0YWxsIGR0c2NoZW1hIC0tdXBncmFkZQo+CllveSBhcmUgcmlnaHQsIHRo
ZXJlIGlzIG9uZSBleHRyYSBzcGFjZS4gQnV0IGZvciBzb21lIHJlYXNvbiB0aGUgY2hlY2sgCmRv
ZXNuJ3QKZmluZCBpdDoKJCBtYWtlIGR0X2JpbmRpbmdfY2hlY2sgCkRUX1NDSEVNQV9GSUxFUz1E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL3N0LHN0bTMyLXVhcnQueWFt
bAogwqAgQ0hLRFQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Byb2Nlc3NlZC1z
Y2hlbWEtZXhhbXBsZXMuanNvbgogwqAgU0NIRU1BIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9wcm9jZXNzZWQtc2NoZW1hLWV4YW1wbGVzLmpzb24KL2hvbWUvZGV2aWsvLmxvY2Fs
L2xpYi9weXRob24zLjkvc2l0ZS1wYWNrYWdlcy9kdHNjaGVtYS9zY2hlbWFzL3NlcmlhbC9yczQ4
NS55YW1sOiAKZHVwbGljYXRlICckaWQnIHZhbHVlICdodHRwOi8vZGV2aWNldHJlZS5vcmcvc2No
ZW1hcy9zZXJpYWwvcnM0ODUueWFtbCMnCiDCoCBEVEVYIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zZXJpYWwvc3Qsc3RtMzItdWFydC5leGFtcGxlLmR0cwogwqAgRFRDIApEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL3N0LHN0bTMyLXVhcnQuZXhhbXBs
ZS5kdC55YW1sCiDCoCBDSEVDSyAKRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nl
cmlhbC9zdCxzdG0zMi11YXJ0LmV4YW1wbGUuZHQueWFtbAoKJCBnaXQgZGVzY3JpYmUKdjUuMTIt
cmMyLTItZzJmMmE0YTk1ZGQzOAoKJCBwaXAzIHNob3cgZHRzY2hlbWEKTmFtZTogZHRzY2hlbWEK
VmVyc2lvbjogMjAyMS4yLjEKCkFueSBpZGVhIHdoeSA/CgpUaGFua3MsIE1hcnRpbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
