Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C719E9027E9
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2024 19:43:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75D6AC6C838;
	Mon, 10 Jun 2024 17:43:09 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48D05C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 17:43:02 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 684A2885A5;
 Mon, 10 Jun 2024 19:42:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1718041381;
 bh=oaOQDVrDft+8XHfut53lIpAIfzu9c8ayaQ0+Eg7Nxow=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WQBUSD3704u5IksQ+4ToSk+UzpJxx5XDQUX1YPYUz2ydq/y8quhOFWlrcza8nueUx
 YjyxaYOzD3WEXXa6xqFxLJrdCr6zaNB9WgGZY/cwqTySfG2ktmoLSn+IAAWJ39aYaz
 lPQro+4RKDvhuztSWyu8q/z3j1tMDLNlwddixzQkrqjyXL2HnaTqIiulZaLTRSXTEv
 f8smfN95RqhPw7Oe0wrkOqrAfmJtowy0aeaOUH9SM+MfZjRXqzbNp6lgRvVKq1y57y
 RJ6FKOabNXnR1VORrukqhc/kzNhX7sErSjR5iOTp5aBK2NyQwk34IH9z00pYbnV5NW
 O/HppF4vFXwGA==
Message-ID: <bf3238fb-4fad-49b2-975c-e35d93cafe7c@denx.de>
Date: Mon, 10 Jun 2024 19:29:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe ROULLIER <christophe.roullier@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Jose Abreu
 <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20240610071459.287500-1-christophe.roullier@foss.st.com>
 <20240610071459.287500-8-christophe.roullier@foss.st.com>
 <20139233-4e95-4fe5-84ca-734ee866afca@denx.de>
 <c5ea12e7-5ee6-4960-9141-e774ccd9977b@foss.st.com>
 <09105afe-1123-407a-96c3-2ea88602aad0@denx.de>
 <91af5c61-f23f-4f72-a8c8-f32b2c368768@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <91af5c61-f23f-4f72-a8c8-f32b2c368768@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [net-next,
 PATCH v6 7/8] net: stmmac: dwmac-stm32: Mask support for PMCR
 configuration
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

T24gNi8xMC8yNCAzOjQ5IFBNLCBDaHJpc3RvcGhlIFJPVUxMSUVSIHdyb3RlOgo+IAo+IE9uIDYv
MTAvMjQgMTU6NDMsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBPbiA2LzEwLzI0IDE6NDUgUE0sIENo
cmlzdG9waGUgUk9VTExJRVIgd3JvdGU6Cj4+Pgo+Pj4gT24gNi8xMC8yNCAxMjozOSwgTWFyZWsg
VmFzdXQgd3JvdGU6Cj4+Pj4gT24gNi8xMC8yNCA5OjE0IEFNLCBDaHJpc3RvcGhlIFJvdWxsaWVy
IHdyb3RlOgo+Pj4+Cj4+Pj4gWy4uLl0KPj4+Pgo+Pj4+PiDCoCBzdGF0aWMgaW50IHN0bTMybXAx
X3NldF9tb2RlKHN0cnVjdCBwbGF0X3N0bW1hY2VuZXRfZGF0YSAqcGxhdF9kYXQpCj4+Pj4+IEBA
IC0zMDMsNyArMzA3LDcgQEAgc3RhdGljIGludCBzdG0zMm1jdV9zZXRfbW9kZShzdHJ1Y3QgCj4+
Pj4+IHBsYXRfc3RtbWFjZW5ldF9kYXRhICpwbGF0X2RhdCkKPj4+Pj4gwqDCoMKgwqDCoCBkZXZf
ZGJnKGR3bWFjLT5kZXYsICJNb2RlICVzIiwgCj4+Pj4+IHBoeV9tb2RlcyhwbGF0X2RhdC0+bWFj
X2ludGVyZmFjZSkpOwo+Pj4+PiDCoCDCoMKgwqDCoMKgIHJldHVybiByZWdtYXBfdXBkYXRlX2Jp
dHMoZHdtYWMtPnJlZ21hcCwgcmVnLAo+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZHdtYWMtPm9wcy0+c3lzY2ZnX2V0aF9tYXNrLCB2YWwgPDwgMjMpOwo+Pj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU1lTQ0ZHX01DVV9FVEhfTUFTSywgdmFsIDw8
IDIzKTsKPj4+Pj4gwqAgfQo+Pj4+PiDCoCDCoCBzdGF0aWMgdm9pZCBzdG0zMl9kd21hY19jbGtf
ZGlzYWJsZShzdHJ1Y3Qgc3RtMzJfZHdtYWMgKmR3bWFjLCAKPj4+Pj4gYm9vbCBzdXNwZW5kKQo+
Pj4+PiBAQCAtMzQ4LDggKzM1MiwxNSBAQCBzdGF0aWMgaW50IHN0bTMyX2R3bWFjX3BhcnNlX2Rh
dGEoc3RydWN0IAo+Pj4+PiBzdG0zMl9kd21hYyAqZHdtYWMsCj4+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gUFRSX0VSUihkd21hYy0+cmVnbWFwKTsKPj4+Pj4gwqAgwqDCoMKgwqDCoCBl
cnIgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMl9pbmRleChucCwgInN0LHN5c2NvbiIsIDEsIAo+Pj4+
PiAmZHdtYWMtPm1vZGVfcmVnKTsKPj4+Pj4gLcKgwqDCoCBpZiAoZXJyKQo+Pj4+PiArwqDCoMKg
IGlmIChlcnIpIHsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiQ2FuJ3Qg
Z2V0IHN5c2NvbmZpZyBtb2RlIG9mZnNldCAoJWQpXG4iLCBlcnIpOwo+Pj4+PiArwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIGVycjsKPj4+Pj4gK8KgwqDCoCB9Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoCBk
d21hYy0+bW9kZV9tYXNrID0gU1lTQ0ZHX01QMV9FVEhfTUFTSzsKPj4+Pj4gK8KgwqDCoCBlcnIg
PSBvZl9wcm9wZXJ0eV9yZWFkX3UzMl9pbmRleChucCwgInN0LHN5c2NvbiIsIDIsIAo+Pj4+PiAm
ZHdtYWMtPm1vZGVfbWFzayk7Cj4+Pj4+ICvCoMKgwqAgaWYgKGVycikKPj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIGRldl9kYmcoZGV2LCAiV2FybmluZyBzeXNjb25maWcgcmVnaXN0ZXIgbWFzayBub3Qg
c2V0XG4iKTsKPj4+Pgo+Pj4+IElzbid0IHRoaXMgYW4gZXJyb3IgLCBzbyBkZXZfZXJyKCkgPwo+
Pj4gTm8sIGl0IGlzIG9ubHkgIndhcm5pbmciIGluZm9ybWF0aW9uLCBmb3IgTVAxIHRoZSBtYXNr
IGlzIG5vdCBuZWVkZWQgCj4+PiAoYW5kIGZvciBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IGlzIG5v
dCBwbGFubmVkIHRvIHB1dCBtYXNrIHBhcmFtZXRlciAKPj4+IG1hbmRhdG9yeSkKPj4KPj4gU2hv
dWxkIHRoaXMgYmUgYW4gZXJyb3IgZm9yIGFueXRoaW5nIG5ld2VyIHRoYW4gTVAxNSB0aGVuID8K
PiBGb3IgTVAyNSwgbm8gbmVlZCBvZiBtYXNrLCBzbyBmb3IgbW9tZW50IGl0IGlzIHNwZWNpZmlj
IHRvIE1QMTMuCgpNYWtlIHRoaXMgYSB3YXJuaW5nIGZvciBNUDE1LCBlcnJvciBmb3IgTVAxMywg
ZG8gbm90IGNoZWNrIHN0LHN5c2NvbiAKcHJlc2VuY2UgZm9yIE1QMiBhdCBhbGwuIFdvdWxkIHRo
YXQgd29yayA/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
