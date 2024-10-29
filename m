Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9539B5334
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Oct 2024 21:17:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8596EC7801A;
	Tue, 29 Oct 2024 20:17:01 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5ED9BC78016
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 20:16:54 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2B01789187;
 Tue, 29 Oct 2024 21:16:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1730233013;
 bh=ar9OhxoAhlsVrdr4yEALxcch1UzmR8/RO9WPA/0wzAs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WDLJ8/T7qdqbh9TU9iY8jrWdf1nchk8L0g2jvT4cfW7AQJD8nDZIrJwrjy0FKAHJi
 f/JKoSzhzc+xGX1SVPGWRfItrjRRtyEYmclopqU5NjAWHoRRRTlKkAZeMBfwAYwP2C
 T4LqjD6OJlzTrvz2xi1ULmf2+nsTSVL589+j0/j0Dcb0ttdfbNAM4Nu/zWQ/YpAPHO
 CycTmQh9hB2YzKIYUFNGfxCKMelC6fVH80CkKcEPJ+Cl2WaTziBsyt3OgwNqtdFwda
 WWmmVstEMDobAsWNTbpsDrHVUMByRSjw/GoCWEqVKOYUgZKS03G8rlKw4QquM6oTZj
 v5uX3dBOe3bsA==
Message-ID: <e521394a-a7e1-495e-8a67-637f30d7866d@denx.de>
Date: Tue, 29 Oct 2024 20:07:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20240623195136.81522-1-marex@denx.de>
 <43c2cd64-2c70-43f3-9470-b6f8bcaa8027@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <43c2cd64-2c70-43f3-9470-b6f8bcaa8027@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-stm32@st-md-mailman.stormreply.com, Guenter Roeck <linux@roeck-us.net>,
 linux-watchdog@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3] ARM: dts: stm32: Add IWDG2 EXTI
 interrupt mapping and mark as wakeup source
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

T24gMTAvMjkvMjQgNDoxNiBQTSwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPiBIaSBNYXJlawoK
SGVsbG8gQWxleGFuZHJlLAoKPiBPbiA2LzIzLzI0IDIxOjUxLCBNYXJlayBWYXN1dCB3cm90ZToK
Pj4gVGhlIElXREcyIGlzIGNhcGFibGUgb2YgZ2VuZXJhdGluZyBwcmUtdGltZW91dCBpbnRlcnJ1
cHQsIHdoaWNoIGNhbiBiZSAKPj4gdXNlZAo+PiB0byB3YWtlIHRoZSBzeXN0ZW0gdXAgZnJvbSBz
dXNwZW5kIHRvIG1lbS4gQWRkIHRoZSBFWFRJIGludGVycnVwdCBtYXBwaW5nCj4+IGFuZCBtYXJr
IHRoZSBJV0RHMiBhcyB3YWtlIHVwIHNvdXJjZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWFyZWsg
VmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4+IC0tLQo+PiBDYzogQWxleGFuZHJlIFRvcmd1ZSA8YWxl
eGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KPj4gQ2M6IEFudG9uaW8gQm9ybmVvIDxhbnRvbmlv
LmJvcm5lb0Bmb3NzLnN0LmNvbT4KPj4gQ2M6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVz
Lm5ldD4KPj4gQ2M6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2krZHRA
bGluYXJvLm9yZz4KPj4gQ2M6IE1hcmMgWnluZ2llciA8bWF6QGtlcm5lbC5vcmc+Cj4+IENjOiBN
YXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+Cj4+IENjOiBSaWNoYXJk
IENvY2hyYW4gPHJpY2hhcmRjb2NocmFuQGdtYWlsLmNvbT4KPj4gQ2M6IFJvYiBIZXJyaW5nIDxy
b2JoK2R0QGtlcm5lbC5vcmc+Cj4+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25p
eC5kZT4KPj4gQ2M6IFdpbSBWYW4gU2Vicm9lY2sgPHdpbUBsaW51eC13YXRjaGRvZy5vcmc+Cj4+
IENjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwo+PiBDYzogbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnCj4+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4+
IENjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4+IENjOiBsaW51
eC13YXRjaGRvZ0B2Z2VyLmtlcm5lbC5vcmcKPj4gLS0tCj4+IFYyOiBObyBjaGFuZ2UKPj4gVjM6
IE5vIGNoYW5nZQo+PiAtLS0KPj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1MS5k
dHNpIHwgMiArKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4+Cj4+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTUxLmR0c2kgYi9hcmNoL2Fy
bS9ib290L2R0cy8gCj4+IHN0L3N0bTMybXAxNTEuZHRzaQo+PiBpbmRleCAxODA0ZTIwMmViNDI1
Li42ODg0NjY5OWIyNmZkIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0z
Mm1wMTUxLmR0c2kKPj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1MS5kdHNp
Cj4+IEBAIC0zNTUsNiArMzU1LDggQEAgaXdkZzI6IHdhdGNoZG9nQDVhMDAyMDAwIHsKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4NWEwMDIwMDAgMHg0MDA+Owo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbG9ja3MgPSA8JnJjYyBJV0RHMj4sIDwmcmNjIENLX0xT
ST47Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2NrLW5hbWVzID0gInBjbGsiLCAi
bHNpIjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50ZXJydXB0cy1leHRlbmRlZCA9IDwm
ZXh0aSA0NiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
d2FrZXVwLXNvdXJjZTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdHVzID0gImRp
c2FibGVkIjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4gCj4gQXBwbGllZCBvbiBzdG0zMi1u
ZXh0ICEhCj4gKGxhdGUgYnV0IGFwcGxpZWQgOykpCldvb2hvbyAhIFRoYW5rIHlvdS4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
