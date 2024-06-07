Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 444A4900CA6
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jun 2024 21:56:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE909C7129F;
	Fri,  7 Jun 2024 19:56:11 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1FDFC69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jun 2024 19:56:05 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C4C2A88495;
 Fri,  7 Jun 2024 21:56:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717790165;
 bh=fcZUQQypZFORhc7qwo/JAaFB/BTgCpG8ND7fMIEShJ8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZIBnH1r7UGj/1c2aR6Ncyb7LZofhdrqOjYfLniiVescmnvmglFwIS7p/f2d+D/HFd
 Czqdd3YaX9quFL3YM0z7/PQL+TIYC16wgR8H6Ykyvnh/OCRkW0Oj+wA4ADrxhTwIO+
 4HivpYevvRLxlffePldFv0VTazeQeUftkazfs0UO9s7M2z2wACBuHcMXkF3CZa79aD
 Mbek8ciDILkweF+jGqeqUq1yUlVSxI9649daiKtmzNSA61d9GE+X++5Ye5XdPiTZOO
 Wu4Fnrdk+wVuEu2Zu3L7N7ZvFQrM214cc9UrhTZAJAFePsmpGCO/oO4xGx77UEnQlc
 qlRqjxRJuU+zg==
Message-ID: <329fb476-405e-458e-98a8-883ecd9cf15a@denx.de>
Date: Fri, 7 Jun 2024 21:54:16 +0200
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
References: <20240607095754.265105-1-christophe.roullier@foss.st.com>
 <20240607095754.265105-9-christophe.roullier@foss.st.com>
 <6f44537a-3d60-46f5-a159-919cc2a144ec@denx.de>
 <c3e21cbf-bf9e-45d5-b6eb-f1f4d50e39a3@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <c3e21cbf-bf9e-45d5-b6eb-f1f4d50e39a3@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 08/12] net: stmmac: dwmac-stm32: add
 management of stm32mp13 for stm32
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

T24gNi83LzI0IDI6NTkgUE0sIENocmlzdG9waGUgUk9VTExJRVIgd3JvdGU6Cj4gCj4gT24gNi83
LzI0IDE0OjQ4LCBNYXJlayBWYXN1dCB3cm90ZToKPj4gT24gNi83LzI0IDExOjU3IEFNLCBDaHJp
c3RvcGhlIFJvdWxsaWVyIHdyb3RlOgo+Pgo+PiBbLi4uXQo+Pgo+Pj4gQEAgLTIyNCwxMSArMjI1
LDE4IEBAIHN0YXRpYyBpbnQgc3RtMzJtcDFfY29uZmlndXJlX3BtY3Ioc3RydWN0IAo+Pj4gcGxh
dF9zdG1tYWNlbmV0X2RhdGEgKnBsYXRfZGF0KQo+Pj4gwqAgewo+Pj4gwqDCoMKgwqDCoCBzdHJ1
Y3Qgc3RtMzJfZHdtYWMgKmR3bWFjID0gcGxhdF9kYXQtPmJzcF9wcml2Owo+Pj4gwqDCoMKgwqDC
oCB1MzIgcmVnID0gZHdtYWMtPm1vZGVfcmVnOwo+Pj4gLcKgwqDCoCBpbnQgdmFsOwo+Pj4gK8Kg
wqDCoCBpbnQgdmFsID0gMDsKPj4KPj4gSXMgdGhlIGluaXRpYWxpemF0aW9uIHJlYWxseSBuZWVk
ZWQgPyBJdCBzZWVtcyB0aGUgc3dpdGNoLWNhc2UgYmVsb3cgCj4+IGRvZXMgYWx3YXlzIGluaXRp
YWxpemUgJHZhbCAuCj4gCj4gWWVzIGl0IGlzIG5lZWRlZCBvdGhlcndpc2U6Cj4gCj4+PiBkcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdG0zMi5jOjIzOTo0OiB3YXJu
aW5nOiAKPj4+IHZhcmlhYmxlICd2YWwnIGlzIHVuaW5pdGlhbGl6ZWQgd2hlbiB1c2VkIGhlcmUg
Wy1XdW5pbml0aWFsaXplZF0KPiAKPiB2YWwgfD0gU1lTQ0ZHX1BNQ1JfRVRIX1NFTF9NSUk7Cj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+
Cj4gIMKgwqAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc3RtMzIu
YzoyMjg6OTogbm90ZTogCj4gaW5pdGlhbGl6ZSB0aGUgdmFyaWFibGUgJ3ZhbCcgdG8gc2lsZW5j
ZSB0aGlzIHdhcm5pbmcKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50IHZhbDsKCk9LLCB0aGFu
a3MgZm9yIGNoZWNraW5nLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
