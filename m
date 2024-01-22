Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E1F835C17
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jan 2024 08:55:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A78CCC6B458;
	Mon, 22 Jan 2024 07:55:20 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92625C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jan 2024 07:55:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 132D2CE2863;
 Mon, 22 Jan 2024 07:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D660EC433F1;
 Mon, 22 Jan 2024 07:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705910117;
 bh=OlIF/YgaBAY0KyswtUOGGdnsqxNRgTdzZnKd+teQ718=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uDyYzwoQ8xCvf7wsWZYBF72Aa+S38tDJDyaj4uJmgonltMWcHGjY/BO/Hy5cGn886
 uoB70SMEzpuE9X/6YakmQOIYpELnIj9ehkCXV1+WZf50U6VVuTgakTKvseAj7U7QPX
 arbEXg1qPFoID/WpCszL6c7s8sTHRkAxAAVNV6x0pqoKhZae+KDBeMdLcWRNh6cxf8
 Qfk8S809uuwjxvUmVu7ZljaalsBEU7KPIMi9oJ5xv4WO8lq7GIl0preIJw/EPsaEyK
 fL6s1jGVTBqLYrtGiNb7QMJkswWkL+vpPtIIdPmqymVXEV+CK8JtTmZlUP6+WvZ0nx
 GskgLhvwPsg6A==
Message-ID: <01c61975-cc78-4045-8c60-bb11045a7c97@kernel.org>
Date: Mon, 22 Jan 2024 08:55:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Ziyang Huang <hzyitc@outlook.com>, mcoquelin.stm32@gmail.com
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB5556DEA3D4740441EC561414C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <TYZPR01MB5556DEA3D4740441EC561414C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Cc: netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-kernel@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>,
 linux-mediatek@lists.infradead.org, Praveenkumar I <ipkumar@codeaurora.org>,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH 5/8] clk: qcom: support for duplicate freq
 in RCG2 freq table
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

T24gMjEvMDEvMjAyNCAxMzo0MiwgWml5YW5nIEh1YW5nIHdyb3RlOgo+IEZyb206IFByYXZlZW5r
dW1hciBJIDxpcGt1bWFyQGNvZGVhdXJvcmEub3JnPgo+IAo+IEN1cnJlbnRseSBSQ0cgY29kZSBs
b29rcyB1cCB0aGUgZnJlcXVlbmN5IHRhYmxlIGR1cmluZyBzZXQKPiByYXRlIGFuZCByZXR1cm4g
dGhlIGZpcnN0IGF2YWlsYWJsZSBmcmVxdWVuY3kgZ3JlYXRlciB0aGFuCj4gcmVxdWVzdGVkIHJh
dGUuIElmIENMS19TRVRfUkFURV9QQVJFTlQgZmxhZyBpcyBzZXQgdGhlbiB0aGUKPiBzZXRfcmF0
ZSByZXF1ZXN0IHdpbGwgZ28gdG8gaXRzIHBhcmVudCBvdGhlcndpc2UgdGhlIGNsb2NrCj4gZnJh
bWV3b3JrIHdpbGwgY29uZmlndXJlIHByZS1kaXYsIG0gYW5kIG4gYWNjb3JkaW5nIHRvIHRoZQo+
IHJldHVybmVkIGZyZXF1ZW5jeSB0YWJsZSBlbnRyeS4gSW4gdGhpcyBjYXNlLCBpdCBpcyBhc3N1
bWluZwo+IHRoYXQgcGFyZW50IGNsb2NrIHdpbGwgcnVuIGluIHRoZSBzYW1lIGZyZXF1ZW5jeSB3
aXRoIHdoaWNoCj4gcHJlLWRpdiwgbSBhbmQgbiBoYXMgYmVlbiBkZXJpdmVkLiBCdXQgaXQgbWF5
IGJlIHBvc3NpYmxlCj4gdGhhdCB0aGUgcGFyZW50IGNsb2NrIHN1cHBvcnRzIG11bHRpcGxlIGZy
ZXF1ZW5jeSBhbmQgdGhlCj4gc2FtZSBmcmVxdWVuY3kgY2FuIGJlIGRlcml2ZWQgd2l0aCBkaWZm
ZXJlbnQgcHJlLWRpdiwgbSBhbmQKPiBuIHZhbHVlcyBkZXBlbmRpbmcgdXBvbiBjdXJyZW50IGZy
ZXF1ZW5jeS4gIEFsc28sIHRoZSBzYW1lCj4gZnJlcXVlbmN5IGNhbiBiZSBkZXJpdmVkIGZyb20g
ZGlmZmVyZW50IHBhcmVudCBzb3VyY2VzIGFuZAo+IGN1cnJlbnRseSB0aGVyZSBpcyBubyBvcHRp
b24gZm9yIGhhdmluZyBkdXBsaWNhdGUKPiBmcmVxdWVuY2llcyBpbiBmcmVxdWVuY3kgdGFibGUg
YW5kIGNob29zaW5nIHRoZSBiZXN0IG9uZQo+IGFjY29yZGluZyB0byBjdXJyZW50IHJhdGUuCj4g
Cj4gTm93IHRoaXMgcGF0Y2ggYWRkcyB0aGUgc3VwcG9ydCBmb3IgaGF2aW5nIGR1cGxpY2F0ZQo+
IGZyZXF1ZW5jaWVzIGluIGZyZXF1ZW5jeSB0YWJsZS4gRHVyaW5nIHNldCByYXRlLCBpdCB3aWxs
Cj4gY29tcGFyZSB0aGUgYWN0dWFsIHJhdGUgZm9yIGVhY2ggZW50cnkgd2l0aCByZXF1ZXN0ZWQg
cmF0ZQo+IGFuZCB3aWxsIHNlbGVjdCB0aGUgYmVzdCBlbnRyeSBpbiB3aGljaCB0aGUgZGlmZmVy
ZW5jZSB3aWxsCj4gYmUgbGVzcy4KPiAKPiBUaGUgZXhpc3RpbmcgZnVuY3Rpb25hbGl0eSB3b27i
gJl0IGJlIGFmZmVjdGVkIHdpdGggdGhpcyBjb2RlCj4gY2hhbmdlIHNpbmNlIHRoaXMgY29kZSBj
aGFuZ2Ugd2lsbCBoaXQgb25seSBpZiBmcmVxdWVuY3kKPiB0YWJsZSBoYXMgZHVwbGljYXRlIHZh
bHVlcy4KPiAKPiBDaGFuZ2UtSWQ6IEk5N2Q5ZTFiNTVkOGYzZWUwOTVmNmYwMTcyOWFmNTI3YmE5
MGU1MGU1Cj4gU2lnbmVkLW9mZi1ieTogQWJoaXNoZWsgU2FodSA8YWJzYWh1QGNvZGVhdXJvcmEu
b3JnPgo+IChjaGVycnkgcGlja2VkIGZyb20gY29tbWl0IDc3NWU3ZDNiNjlmZmM5N2FmYjViZDVh
NmM5YzQyM2YyZjRkOGEwYjIpCj4gU2lnbmVkLW9mZi1ieTogUHJhdmVlbmt1bWFyIEkgPGlwa3Vt
YXJAY29kZWF1cm9yYS5vcmc+Cj4gCj4gQ2hhbmdlLUlkOiBJZjEwMTkzZmM3OWEzYzEzNzVhYjcz
NTk3ODEzNzQ1ZmYxZjRkZjBhZAoKUGxlYXNlIHJ1biBzY3JpcHRzL2NoZWNrcGF0Y2gucGwgYW5k
IGZpeCByZXBvcnRlZCB3YXJuaW5ncy4gU29tZQp3YXJuaW5ncyBjYW4gYmUgaWdub3JlZCwgYnV0
IHRoZSBjb2RlIGhlcmUgbG9va3MgbGlrZSBpdCBuZWVkcyBhIGZpeC4KRmVlbCBmcmVlIHRvIGdl
dCBpbiB0b3VjaCBpZiB0aGUgd2FybmluZyBpcyBub3QgY2xlYXIuCgpCZXN0IHJlZ2FyZHMsCkty
enlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
