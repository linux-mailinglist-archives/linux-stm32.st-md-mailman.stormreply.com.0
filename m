Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 889139022E6
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2024 15:45:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 415C6C7801B;
	Mon, 10 Jun 2024 13:45:34 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A96FEC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 13:45:27 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id CB023883D2;
 Mon, 10 Jun 2024 15:45:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1718027127;
 bh=z+YAHBI/Z+3VNc3TEhUT33G8bD0GATdmtiU4ObQgIxU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oswnRRgJs0dZeDx6cEzRP+cjqeMFnq3UbuJLyc5aJTofIafPTT9C8bKu9mgtbOqAc
 +V6Y9/sXhHD8dNsYWqwsSsyLtHOw25bbSc1AV5moxNghJeMYnZ3x2fZstr6cHrt5rz
 A7jNAkDI/liwIuAQk4YweZns11YDYRMu/KdZMjrmm+wMC+NP2uQKd02tqTmUY5i+gC
 Hb+ya75YE4ks9RncB4P1ZlH7tG8qdngaFYwSxp31zRfo0SIV1bku5KxLeT/pG1ewzY
 tO09rOcb9RaUY3rC5qsLHbJYxQETX/nwayPj9oTG5pBShdPehD5OBmM9TuQRv3zvPU
 i/taDf05suEhg==
Message-ID: <09105afe-1123-407a-96c3-2ea88602aad0@denx.de>
Date: Mon, 10 Jun 2024 15:43:52 +0200
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
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <c5ea12e7-5ee6-4960-9141-e774ccd9977b@foss.st.com>
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

T24gNi8xMC8yNCAxOjQ1IFBNLCBDaHJpc3RvcGhlIFJPVUxMSUVSIHdyb3RlOgo+IAo+IE9uIDYv
MTAvMjQgMTI6MzksIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBPbiA2LzEwLzI0IDk6MTQgQU0sIENo
cmlzdG9waGUgUm91bGxpZXIgd3JvdGU6Cj4+Cj4+IFsuLi5dCj4+Cj4+PiDCoCBzdGF0aWMgaW50
IHN0bTMybXAxX3NldF9tb2RlKHN0cnVjdCBwbGF0X3N0bW1hY2VuZXRfZGF0YSAqcGxhdF9kYXQp
Cj4+PiBAQCAtMzAzLDcgKzMwNyw3IEBAIHN0YXRpYyBpbnQgc3RtMzJtY3Vfc2V0X21vZGUoc3Ry
dWN0IAo+Pj4gcGxhdF9zdG1tYWNlbmV0X2RhdGEgKnBsYXRfZGF0KQo+Pj4gwqDCoMKgwqDCoCBk
ZXZfZGJnKGR3bWFjLT5kZXYsICJNb2RlICVzIiwgCj4+PiBwaHlfbW9kZXMocGxhdF9kYXQtPm1h
Y19pbnRlcmZhY2UpKTsKPj4+IMKgIMKgwqDCoMKgwqAgcmV0dXJuIHJlZ21hcF91cGRhdGVfYml0
cyhkd21hYy0+cmVnbWFwLCByZWcsCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZHdtYWMtPm9wcy0+c3lzY2ZnX2V0aF9tYXNrLCB2YWwgPDwgMjMpOwo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNZU0NGR19NQ1VfRVRIX01BU0ssIHZhbCA8PCAyMyk7
Cj4+PiDCoCB9Cj4+PiDCoCDCoCBzdGF0aWMgdm9pZCBzdG0zMl9kd21hY19jbGtfZGlzYWJsZShz
dHJ1Y3Qgc3RtMzJfZHdtYWMgKmR3bWFjLCAKPj4+IGJvb2wgc3VzcGVuZCkKPj4+IEBAIC0zNDgs
OCArMzUyLDE1IEBAIHN0YXRpYyBpbnQgc3RtMzJfZHdtYWNfcGFyc2VfZGF0YShzdHJ1Y3QgCj4+
PiBzdG0zMl9kd21hYyAqZHdtYWMsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9F
UlIoZHdtYWMtPnJlZ21hcCk7Cj4+PiDCoCDCoMKgwqDCoMKgIGVyciA9IG9mX3Byb3BlcnR5X3Jl
YWRfdTMyX2luZGV4KG5wLCAic3Qsc3lzY29uIiwgMSwgCj4+PiAmZHdtYWMtPm1vZGVfcmVnKTsK
Pj4+IC3CoMKgwqAgaWYgKGVycikKPj4+ICvCoMKgwqAgaWYgKGVycikgewo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiQ2FuJ3QgZ2V0IHN5c2NvbmZpZyBtb2RlIG9mZnNldCAo
JWQpXG4iLCBlcnIpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBlcnI7Cj4+PiArwqDCoMKg
IH0KPj4+ICsKPj4+ICvCoMKgwqAgZHdtYWMtPm1vZGVfbWFzayA9IFNZU0NGR19NUDFfRVRIX01B
U0s7Cj4+PiArwqDCoMKgIGVyciA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyX2luZGV4KG5wLCAic3Qs
c3lzY29uIiwgMiwgCj4+PiAmZHdtYWMtPm1vZGVfbWFzayk7Cj4+PiArwqDCoMKgIGlmIChlcnIp
Cj4+PiArwqDCoMKgwqDCoMKgwqAgZGV2X2RiZyhkZXYsICJXYXJuaW5nIHN5c2NvbmZpZyByZWdp
c3RlciBtYXNrIG5vdCBzZXRcbiIpOwo+Pgo+PiBJc24ndCB0aGlzIGFuIGVycm9yICwgc28gZGV2
X2VycigpID8KPiBObywgaXQgaXMgb25seSAid2FybmluZyIgaW5mb3JtYXRpb24sIGZvciBNUDEg
dGhlIG1hc2sgaXMgbm90IG5lZWRlZCAKPiAoYW5kIGZvciBiYWNrd2FyZCBjb21wYXRpYmlsaXR5
IGlzIG5vdCBwbGFubmVkIHRvIHB1dCBtYXNrIHBhcmFtZXRlciAKPiBtYW5kYXRvcnkpCgpTaG91
bGQgdGhpcyBiZSBhbiBlcnJvciBmb3IgYW55dGhpbmcgbmV3ZXIgdGhhbiBNUDE1IHRoZW4gPwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
