Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1688F5EDDB6
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Sep 2022 15:32:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF47AC63327;
	Wed, 28 Sep 2022 13:32:47 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CF40C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 13:32:46 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E9EEB84B13;
 Wed, 28 Sep 2022 15:32:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664371965;
 bh=JJLde7X8BKDQyumzE/OIAI/+oFwf58w283WTVtOXriM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PkGyvz1junWK0FWLEsz0Gf355JZqvDVfgAvfehWuxE10//qQ+KpqruRLaJFp3/Gr0
 SvUacU2c60o4A/QUlFk8GppiaCwO+qQmlttPR5wa5nxEhUj0C0E3aKcCKis0kwYD3t
 MmhoDSOz28FZ7Zb8eljmxgEyt18j+96ajoKRMjbQNAVqUEHtEUFph/saQteknYwJw6
 k8BV90gyv/sc2AEj0vMm1l06E5gTP61Y7hJJ2jzknGtQ04+ubYlOsCMyfo6uiuVsTN
 JnpUBwJkLmFbPfmfotJuvH4hvFqXatOxh5hDiykgclIqO/cB0DMMCVGeHuTEP859TT
 FtC2f0DcHXLfA==
Message-ID: <1fa072ed-1e12-4234-a328-92c38de7b7d5@denx.de>
Date: Wed, 28 Sep 2022 15:32:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: Benjamin MUGNIER <benjamin.mugnier@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20220927005538.690997-1-marex@denx.de>
 <7420b97c-1421-03a5-dd47-044b5e1739f1@foss.st.com>
 <162ea4dd-ded9-2905-0e4b-71809c95fd78@denx.de>
 <04cd498e-608d-e1dd-377a-18e27dee23be@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <04cd498e-608d-e1dd-377a-18e27dee23be@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: media: st,
 stmipid02: Convert the text bindings to YAML
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

T24gOS8yOC8yMiAxMDowOCwgQmVuamFtaW4gTVVHTklFUiB3cm90ZToKPiBIaSBNYXJlaywKCkhp
LAoKWy4uLl0KCj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL2kyYy9zdCxzdC1taXBpZDAyLnlhbWwKPj4+PiBAQCAtMCwwICsxLDE3NSBAQAo+Pj4+ICsj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkK
Pj4+PiArJVlBTUwgMS4yCj4+Pj4gKy0tLQo+Pj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9zY2hlbWFzL21lZGlhL2kyYy9zdCxzdC1taXBpZDAyLnlhbWwjCj4+Pj4gKyRzY2hlbWE6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+Pj4+ICsKPj4+PiAr
dGl0bGU6IFNUTWljcm9lbGVjdHJvbmljcyBNSVBJRDAyIENTSS0yIHRvIFBBUkFMTEVMIGJyaWRn
ZQo+Pj4+ICsKPj4+PiArbWFpbnRhaW5lcnM6Cj4+Pj4gK8KgIC0gTWlja2FlbCBHdWVuZSA8bWlj
a2FlbC5ndWVuZUBmb3NzLnN0LmNvbT4KPj4+Cj4+PiBBcyBNaWNrYWVsIGlzIG5vdCB0aGUgbWFp
bnRhaW5lciBvZiB0aGUgZHJpdmVyIGFueW1vcmUsIHRoZXJlIHNob3VsZCBiZSBib3RoIGN1cnJl
bnQgbWFpbnRhaW5lcnMgaW5zdGVhZCwgYXMgbGlzdGVkIGluIHRoZSBNQUlOVEFJTkVSIGZpbGU6
Cj4+PiAgwqAgLSBCZW5qYW1pbiBNdWduaWVyIDxiZW5qYW1pbi5tdWduaWVyQGZvc3Muc3QuY29t
Pgo+Pj4gIMKgIC0gU3lsdmFpbiBQZXRpbm90IDxzeWx2YWluLnBldGlub3RAZm9zcy5zdC5jb20+
Cj4+PiBDYW4geW91IGNoYW5nZSBpdCB3aGlsZSBhdCBpdCA/IFRoYW5rIHlvdS4KPj4KPj4gRG9u
ZSBhbmQgZG9uZSwgSSBhbHNvIGRyb3BwZWQgbXlzZWxmIGZyb20gdGhlIGxpc3QsIHdoaWNoIEkg
aG9wZSBpcyBPSy4KPj4KPiAKPiBObyBwcm9ibGVtIGZvciBkcm9wcGluZyB5b3Vyc2VsZiwgb3V0
IG9mIGN1cmlvc2l0eSB3aHkgc28gPwoKSnVzdCBiZWNhdXNlIEkgdGhpbmsgeW91IGFuZCBTeWx2
YWluIHNob3VsZCBiZSBlbm91Z2ggdG8gbWFpbnRhaW4gdGhpcywgCmFuZCBpdCBpcyBhbHNvIGxp
a2VseSBJIHdvbid0IGJlIGNvbnRyaWJ1dGluZyB0byB0aGlzIGZpbGUgbXVjaCBiZXlvbmQgCnRo
aXMgY29udmVyc2lvbiAoYW5kIGdldF9tYWludGFpbmVyLnBsIHdvdWxkIGFkZCBtZSBvbiBDQyBh
bnl3YXkpLgoKWy4uLl0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
