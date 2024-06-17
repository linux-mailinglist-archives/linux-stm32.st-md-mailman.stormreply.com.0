Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D41090B77B
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 19:08:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21FA9C6B45B;
	Mon, 17 Jun 2024 17:08:48 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32DF8C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 17:08:41 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9BABF8826E;
 Mon, 17 Jun 2024 19:08:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1718644120;
 bh=1LdYSyTBSDGBxuQ70W3AP01Rdne8htwL8v2sMMNqG24=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QoXrIrvnzwtvEIa5aEXKzpiB/7KC8fX4ff4gWB4XiB6kASzmH7iWchHIaoCNVsSSI
 a6Ed+fjXdLjMjOaGYHlBaEQzEGWC7yfboVKGuboE0TNt8bd5o1vr84Pl/bTttFqCVw
 yOWIfODbtdURahcifJTTNFIgSjqH2M/VZ79+UpYO0Ek0H9tCN7HBuoTqEgPgFMzASM
 tpfL35qrR4V/T7VievY9GSZttD7Ud+At6XtS7VgB6nPQM2mrTGq50fWV9tLrm+Kn2A
 O8+MoG45HM+qRmm5tfmaogYFiUKMLC95kVM0xIMnDeGv6YPfaiJ8x2iCgi3n2T1anG
 3GiBCrxdJxB0Q==
Message-ID: <39d35f6d-4f82-43af-883b-a574b8a67a1a@denx.de>
Date: Mon, 17 Jun 2024 17:57:43 +0200
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
References: <20240614130812.72425-1-christophe.roullier@foss.st.com>
 <20240614130812.72425-3-christophe.roullier@foss.st.com>
 <4c2f1bac-4957-4814-bf62-816340bd9ff6@denx.de>
 <09010b02-fb55-4c4b-9d0c-36bd0b370dc8@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <09010b02-fb55-4c4b-9d0c-36bd0b370dc8@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [net-next,
 PATCH 2/2] net: stmmac: dwmac-stm32: stm32: add management of
 stm32mp25 for stm32
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

T24gNi8xNy8yNCAxOjIzIFBNLCBDaHJpc3RvcGhlIFJPVUxMSUVSIHdyb3RlOgoKSGksCgo+Pj4g
K3N0YXRpYyBpbnQgc3RtMzJtcDJfY29uZmlndXJlX3N5c2NmZyhzdHJ1Y3QgcGxhdF9zdG1tYWNl
bmV0X2RhdGEgCj4+PiAqcGxhdF9kYXQpCj4+PiArewo+Pj4gK8KgwqDCoCBzdHJ1Y3Qgc3RtMzJf
ZHdtYWMgKmR3bWFjID0gcGxhdF9kYXQtPmJzcF9wcml2Owo+Pj4gK8KgwqDCoCB1MzIgcmVnID0g
ZHdtYWMtPm1vZGVfcmVnOwo+Pj4gK8KgwqDCoCBpbnQgdmFsID0gMDsKPj4+ICsKPj4+ICvCoMKg
wqAgc3dpdGNoIChwbGF0X2RhdC0+bWFjX2ludGVyZmFjZSkgewo+Pj4gK8KgwqDCoCBjYXNlIFBI
WV9JTlRFUkZBQ0VfTU9ERV9NSUk6Cj4+PiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+Cj4+IGR3
bWFjLT5lbmFibGVfZXRoX2NrIGRvZXMgbm90IGFwcGx5IHRvIE1JSSBtb2RlID8gV2h5ID8KPiAK
PiBJdCBpcyBsaWtlIE1QMSBhbmQgTVAxMywgbm90aGluZyB0byBzZXQgaW4gc3lzY2ZnIHJlZ2lz
dGVyIGZvciBjYXNlIE1JSSAKPiBtb2RlIHdvIGNyeXN0YWwuCgpIYXZlIGEgbG9vayBhdCBTVE0z
Mk1QMTV4eCBSTTA0MzYgRmlndXJlIDgzLiBQZXJpcGhlcmFsIGNsb2NrIApkaXN0cmlidXRpb24g
Zm9yIEV0aGVybmV0LgoKSWYgUkNDICh0b3AtbGVmdCBjb3JuZXIgb2YgdGhlIGZpZ3VyZSkgZ2Vu
ZXJhdGVzIDI1IE1IeiBNSUkgY2xvY2sgCih5ZWxsb3cgbGluZSkgb24gZXRoX2Nsa19mYiAodG9w
LXJpZ2h0IGNvcm5lciksIGNhbiBJIHNldCAKRVRIX1JFRl9DTEtfU0VMIHRvIHBvc2l0aW9uICcx
JyBhbmQgRVRIX1NFTFsyXSB0byAnMCcgYW5kIGZlZWQgRVRIIAoocmlnaHQgc2lkZSkgY2xrX3J4
X2kgaW5wdXQgd2l0aCAyNSBNSHogY2xvY2sgdGhhdCB3YXkgPwoKSSBzZWVtcyBsaWtlIHRoaXMg
c2hvdWxkIGJlIHBvc3NpYmxlLCBhdCBsZWFzdCB0aGVvcmV0aWNhbGx5LiBDYW4geW91IApjaGVj
ayB3aXRoIHRoZSBoYXJkd2FyZS9zaWxpY29uIHBlb3BsZSA/CgpBcyBhIHJlc3VsdCwgdGhlIE1J
SS9STUlJIG1vZGUgd291bGQgYmVoYXZlIGluIGEgdmVyeSBzaW1pbGFyIHdheSwgYW5kIApzbyB3
b3VsZCBHTUlJL1JHTUlJIG1vZGUgYmVoYXZlIGluIGEgdmVyeSBzaW1pbGFyIHdheS4gRWZmZWN0
aXZlbHkgeW91IAp3b3VsZCBlbmQgdXAgd2l0aCB0aGlzIChub3RpY2UgdGhlIGZhbGx0aHJvdWdo
IHN0YXRlbWVudHMpOgoKKwljYXNlIFBIWV9JTlRFUkZBQ0VfTU9ERV9STUlJOgorCQl2YWwgPSBT
WVNDRkdfRVRIQ1JfRVRIX1NFTF9STUlJOworCQlmYWxsdGhyb3VnaDsKKwljYXNlIFBIWV9JTlRF
UkZBQ0VfTU9ERV9NSUk6CisJCWlmIChkd21hYy0+ZW5hYmxlX2V0aF9jaykKKwkJCXZhbCB8PSBT
WVNDRkdfRVRIQ1JfRVRIX1JFRl9DTEtfU0VMOworCQlicmVhazsKKworCWNhc2UgUEhZX0lOVEVS
RkFDRV9NT0RFX1JHTUlJOgorCWNhc2UgUEhZX0lOVEVSRkFDRV9NT0RFX1JHTUlJX0lEOgorCWNh
c2UgUEhZX0lOVEVSRkFDRV9NT0RFX1JHTUlJX1JYSUQ6CisJY2FzZSBQSFlfSU5URVJGQUNFX01P
REVfUkdNSUlfVFhJRDoKKwkJdmFsID0gU1lTQ0ZHX0VUSENSX0VUSF9TRUxfUkdNSUk7CisJCWZh
bGx0aHJvdWdoOworCWNhc2UgUEhZX0lOVEVSRkFDRV9NT0RFX0dNSUk6CisJCWlmIChkd21hYy0+
ZW5hYmxlX2V0aF9jaykKKwkJCXZhbCB8PSBTWVNDRkdfRVRIQ1JfRVRIX0NMS19TRUw7CisJCWJy
ZWFrOwoKWy4uLl0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
