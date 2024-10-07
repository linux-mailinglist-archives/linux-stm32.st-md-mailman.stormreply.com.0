Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92ED6993279
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 18:06:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 423A7C6DD94;
	Mon,  7 Oct 2024 16:06:36 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75EA8C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2024 16:06:28 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 94C2788365;
 Mon,  7 Oct 2024 18:06:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1728317187;
 bh=bBYRA6NEh1wZmuhBNUB2eKeJd8Vp9PBvM/JZVxPF1OA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gSMDu+291Aga5QM8YL6kApKlCmxHXLu87h6qft6qEZp+A13AW4MogX5DmmdmCbQdy
 rVqdKXHwY2WZh2fmJpMzaMxOQ2emWpl5WjZ4TrOXXGVFOAHJIj5PXENRMxlRVuuYLa
 MhSAKrBS6SMdBjejjWtCp5WMkvavtRECwbT6fdr0bSsEqYvXK6xQOT9Ivo0AOkOmK7
 uHhij0+CH4bA7UbrDe0zrBAiKlPhsHcWu2sB8Yym4WZQaEud0mcLKq5QN8bDIa4cWA
 NpzPlWJ43mj2fcfaYEZ998C9iuOwnx3Tidbr8hMiQfzjkE7xHjOux7n9lH95UHZwGd
 swbrM8lFZTvCA==
Message-ID: <7adc1fb2-8dec-454c-a6e7-edd00c759c70@denx.de>
Date: Mon, 7 Oct 2024 17:42:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20241007132721.168428-1-gatien.chevallier@foss.st.com>
 <20241007132721.168428-5-gatien.chevallier@foss.st.com>
 <869fe073-c20f-4611-ae84-8268a890a12c@denx.de>
 <d4bfc454-5a20-4cee-85f6-118323c46eca@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <d4bfc454-5a20-4cee-85f6-118323c46eca@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Yang Yingliang <yangyingliang@huawei.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/4] arm64: dts: st: add RNG node on
	stm32mp251
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

T24gMTAvNy8yNCA0OjU5IFBNLCBHYXRpZW4gQ0hFVkFMTElFUiB3cm90ZToKPiAKPiAKPiBPbiAx
MC83LzI0IDE1OjU1LCBNYXJlayBWYXN1dCB3cm90ZToKPj4gT24gMTAvNy8yNCAzOjI3IFBNLCBH
YXRpZW4gQ2hldmFsbGllciB3cm90ZToKPj4+IFVwZGF0ZSB0aGUgZGV2aWNlLXRyZWUgc3RtMzJt
cDI1MS5kdHNpIGJ5IGFkZGluZyB0aGUgUmFuZG9tIE51bWJlcgo+Pj4gR2VuZXJhdG9yKFJORykg
bm9kZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBHYXRpZW4gQ2hldmFsbGllciA8Z2F0aWVuLmNo
ZXZhbGxpZXJAZm9zcy5zdC5jb20+Cj4+PiAtLS0KPj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMv
c3Qvc3RtMzJtcDI1MS5kdHNpIHwgMTAgKysrKysrKysrKwo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0
cy9zdC9zdG0zMm1wMjUxLmR0c2kgYi9hcmNoL2FybTY0LyAKPj4+IGJvb3QvZHRzL3N0L3N0bTMy
bXAyNTEuZHRzaQo+Pj4gaW5kZXggMTE2N2NmNjNkN2U4Li40MGI5NjM1M2E4MDMgMTAwNjQ0Cj4+
PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaQo+Pj4gKysrIGIv
YXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kKPj4+IEBAIC00OTMsNiArNDkz
LDE2IEBAIHVhcnQ4OiBzZXJpYWxANDAzODAwMDAgewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJuZzogcm5nQDQyMDIwMDAw
IHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJzdCxz
dG0zMm1wMjUtcm5nIjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0g
PDB4NDIwMjAwMDAgMHg0MDA+Owo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
bG9ja3MgPSA8JmNsa19yY2JzZWM+LCA8JnJjYyBDS19CVVNfUk5HPjsKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xvY2stbmFtZXMgPSAicm5nX2NsayIsICJybmdfaGNsayI7
Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlc2V0cyA9IDwmcmNjIFJOR19S
PjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYWNjZXNzLWNvbnRyb2xsZXJz
ID0gPCZyaWZzYyA5Mj47Cj4+IEl0IHdvdWxkIGJlIGdvb2QgaWYgc29tZW9uZSBmaW5hbGx5IHNv
cnRlZCB0aGUgYWNjZXNzLWNvbnRyb2xsZXJzIAo+PiBwcm9wZXJ0eSBpbiBhbGwgdGhlIE1QMiBu
b2RlcyBhbHBoYWJldGljYWxseSA7IHRoYXQncyBzZXBhcmF0ZSBwYXRjaC8gCj4+IHNlcmllcyB0
aG91Z2guCj4gCj4gSSdsbCBwaW4geW91ciBjb21tZW50IHRvIHRha2UgYSBsb29rIGludG8gdGhh
dCBpbiB0aGUgbmVhciBmdXR1cmUuClRoYW5rIHlvdSAhCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
