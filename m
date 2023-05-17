Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 269AB707676
	for <lists+linux-stm32@lfdr.de>; Thu, 18 May 2023 01:34:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF309C6B443;
	Wed, 17 May 2023 23:34:00 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A72AC65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 May 2023 23:33:59 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1170D860F1;
 Thu, 18 May 2023 01:33:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1684366439;
 bh=7cQ8MHnnkw+u4jPFTbH2QZwg15cKSVff/yxwNCVRTfw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dMOrzvFm2psxlRz97auMZAlBgFKUPxr0qVAEAwL0I4CBChLUN3FZNjMd5xTXFGf9V
 407aBtxtJOSZYzjQdTsWcPV+3YoNk/Tq0R1G1NNqTpehT1S/3/GtcBwX88w8ajV6Ey
 bXGEm+RodWF1m32wYr1rOXSx7ExznKr+ZEWhGPp4JO2Fo3DBtPFGGHlH0m9C2knCea
 xbYa4t/i5Z5XukvYQy9MFc3Gp9EmHJk210wOuzVGgg5clYiiMtWdx/rhmqL8FtRc8N
 V2y5ll2MlozQCOJwg+o9qudMMXAWf2G8GU+rd1w0NIphJ3VZCvOtFKvpPShl+PPYTE
 vUcw9SuDwEKiQ==
Message-ID: <5f201903-17cb-5054-763c-f03b1066db1d@denx.de>
Date: Thu, 18 May 2023 01:33:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
References: <20230517143542.284029-1-raphael.gallais-pou@foss.st.com>
 <20230517143542.284029-4-raphael.gallais-pou@foss.st.com>
 <f64de05b-8854-4345-80c2-f424968defdc@denx.de>
 <e963370c-7018-243a-712d-62ca8463bfd8@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <e963370c-7018-243a-712d-62ca8463bfd8@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 3/3] ARM: dts: stm32: fix several DT
 warnings on stm32mp15
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

T24gNS8xNy8yMyAxOTowNCwgUmFwaGFlbCBHYWxsYWlzLVBvdSB3cm90ZToKPiBIaSBNYXJlawoK
SGksCgo+IE9uIDUvMTcvMjMgMTc6NDEsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBPbiA1LzE3LzIz
IDE2OjM1LCBSYXBoYWVsIEdhbGxhaXMtUG91IHdyb3RlOgo+Pgo+PiBIaSwKPj4KPj4+IGRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1ka3guZHRzaQo+Pj4gYi9hcmNo
L2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1ka3guZHRzaQo+Pj4gaW5kZXggMGYxMTEwZTQyYzkz
Li5hNmUyZTIwZjEyZmEgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1w
MTV4eC1ka3guZHRzaQo+Pj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGt4
LmR0c2kKPj4+IEBAIC00NTcsOCArNDU3LDcgQEAgJmx0ZGMgewo+Pj4gIMKgwqDCoMKgwqAgc3Rh
dHVzID0gIm9rYXkiOwo+Pj4gIMKgIMKgwqDCoMKgwqAgcG9ydCB7Cj4+PiAtwqDCoMKgwqDCoMKg
wqAgbHRkY19lcDBfb3V0OiBlbmRwb2ludEAwIHsKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJlZyA9IDwwPjsKPj4+ICvCoMKgwqDCoMKgwqDCoCBsdGRjX2VwMF9vdXQ6IGVuZHBvaW50IHsK
Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZW1vdGUtZW5kcG9pbnQgPSA8JnNpaTkw
MjJfaW4+Owo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+Pj4gIMKgwqDCoMKgwqAgfTsKPj4K
Pj4gVGhpcyBMVERDIHBvcnQvZW5kcG9pbnQgc3R1ZmYgYWx3YXlzIHNjYXJlcyBtZSwgYmVjYXVz
ZSBJIGFsd2F5cyBmZWVsIEkgZ2V0IGl0Cj4+IHdyb25nLgo+Pgo+PiBJIGJlbGlldmUgdGhlIExU
REMgZG9lcyBoYXZlIG9uZSAicG9ydCIgLCBjb3JyZWN0Lgo+Pgo+PiBCdXQgSSB0aGluayAoPykg
dGhhdCB0aGUgTFREQyBoYXMgdHdvIGVuZHBvaW50cywgZW5kcG9pbnRAMCBmb3IgRFBJIChwYXJh
bGxlbAo+PiBvdXRwdXQgb3V0IG9mIHRoZSBTb0MpIGFuZCBlbmRwb2ludEAxIGZvciBEU0kgKGlu
dGVybmFsIGNvbm5lY3Rpb24gaW50byB0aGUKPj4gRFNJIHNlcmlhbGl6ZXIpID8KPiAKPiBZb3Ug
YXJlIGNvcnJlY3QgaW5kZWVkLCBJIHJ1c2hlZCB0aGUgcGF0Y2ggYW5kIGRpZCBub3QgdGhvdWdo
dCBhYm91dCB0aGlzLiBJCj4gYWdyZWUgdGhhdCB0aGlzIGNhbiBiZSBjb25mdXNpbmcsIGFzIEkg
YWxzbyB0YWtlIHNvbWUgdGltZSB0byB0aGluayB0aHJvdWdoIGl0Lgo+IAo+Pgo+PiBPbmx5IG9u
ZSBvZiB0aGUgZW5kcG9pbnRzIGNhbiBiZSBjb25uZWN0ZWQgYXQgYSB0aW1lLCBidXQgdGhlcmUg
YXJlIGFjdHVhbGx5Cj4+IHR3byBlbmRwb2ludHMgaW4gdGhlIExUREMgcG9ydCB7fSBub2RlLCBh
cmVuJ3QgdGhlcmUgPwo+IFllcywgdGhleSBhcmUgbXV0dWFsbHkgZXhjbHVzaXZlLgo+Pgo+PiBT
byB0aGUgb3JpZ2luYWwgZGVzY3JpcHRpb24gc2hvdWxkIGJlIE9LIEkgdGhpbmsgLCBtYXliZSAj
YWRkcmVzcy8jc2l6ZS1jZWxscwo+PiBhcmUgbWlzc2luZyBpbnN0ZWFkID8KPiAKPiBUaGluZyBp
czogdGhpcyBmaWxlIGlzIG9ubHkgaW5jbHVkZWQgaW4gdHdvIGRldmljZS10cmVlcyA6IHN0bTMy
bXAxNTdjLWRrMS5kdHMKPiBhbmQgc3RtMzJtcDE1N2MtZGsyLmR0cy4KPiAKPiBBbW9uZyB0aG9z
ZSB0d28gZmlsZXMgdGhlcmUgaXMgb25seSBvbmUgd2hpY2ggYWRkcyBhIHNlY29uZCBlbmRwb2lu
dC4gVGh1cyBpZgo+IHRoZSBmaWVsZHMgYXJlIHNldCBoaWdoZXIgaW4gdGhlIGhpZXJhcmNoeSwg
YSB3YXJuaW5nIHlpZWxkcy4KCkkgZG8gbm90IHVuZGVyc3RhbmQgdGhpcyBvbmUgcGFydCwgd2hp
Y2ggd2FybmluZyBhcmUgeW91IHRyeWluZyB0byBmaXggPwpJIGp1c3QgcmFuICckIG1ha2UgQ0hF
Q0tfRFRCUz0xIHN0bTMybXAxNTdhLWRrMS5kdGIgc3RtMzJtcDE1N2MtZGsyLmR0YicgCmluIGxh
dGVzdCBsaW51eC1uZXh0IGFuZCB0aGVyZSB3YXMgbm8gd2FybmluZyByZWxhdGVkIHRvIExUREMg
LgoKSSB0aGluayBpZiB5b3UgcmV0YWluIHRoZSBzdG0zMm1wMTUxLmR0c2kgJmx0ZGMgeyBwb3J0
IHsgI2FkZHJlc3MtY2VsbHMgCj0gPDE+OyAjc2l6ZS1jZWxscyA9IDwwPjsgfTsgfTsgcGFydCwg
dGhlbiB5b3Ugd291bGRuJ3QgYmUgZ2V0dGluZyBhbnkgCndhcm5pbmdzIHJlZ2FyZGluZyBMVERD
ICwgYW5kIHlvdSB3b3VsZG4ndCBoYXZlIHRvIHJlbW92ZSB0aGUgCnVuaXQtYWRkcmVzcyBmcm9t
IGVuZHBvaW50QDAgLgoKYnR3LiBJIGRvIHVzZSBib3RoIGVuZHBvaW50QDAvZW5kcG9pbnRAMSBp
biBBdmVuZ2VyOTYgRFRPcywgYnV0IHRob3NlIAphcmUgbm90IHN1Ym1pdHRlZCB5ZXQsIEkgaGF2
ZSB0byBjbGVhbiB0aGVtIHVwIGEgYml0IG1vcmUgZmlyc3QuCgo+IE9uZSB3YXkgdG8gZG8gaXQg
d291bGQgYmUgdG8gbWFrZSB0aGUgZW5kcG9pbnRAMCBnbyBkb3duIGluIHRoZSBkZXZpY2UtdHJl
ZSB3aXRoCj4gaXRzIGRlcGVuZGVuY2llcywgc28gdGhhdCBib3RoIGVuZHBvaW50cyBhcmUgdGhl
IHNhbWUgbGV2ZWwgd2l0aG91dCBnZW5lcmF0aW5nCj4gbm9pc2UuCgpJJ20gYWZyYWlkIEkgcmVh
bGx5IGRvbid0IHF1aXRlIHVuZGVyc3RhbmQgd2hpY2ggd2FybmluZyB5b3UncmUgCnJlZmVycmlu
ZyB0by4gQ2FuIHlvdSBwbGVhc2Ugc2hhcmUgdGhhdCB3YXJuaW5nIGFuZCBpZGVhbGx5IGhvdyB0
byAKdHJpZ2dlciBpdCAodGhlIGNvbW1hbmQtbGluZSBpbmNhbnRhdGlvbikgPwoKLS0gCkJlc3Qg
cmVnYXJkcywKTWFyZWsgVmFzdXQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
