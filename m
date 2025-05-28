Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2961AC6892
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 13:45:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98F99C36B35;
	Wed, 28 May 2025 11:45:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE170C36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 11:45:53 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SB0xLs006237;
 Wed, 28 May 2025 13:45:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 y0H2U/oo7isvFrY6LzlGfAAitGQ52BI2rQGm2Do/Tms=; b=PkSYp+6TOsroWwK7
 bNaz6ZZwYxpPHjYec1wzx1Cnv80UpaT0mUWvfBoDE6Xdov9AkBAJrV+qMxKdX9Mm
 OWmeoMznLX+gdQuWsZ2+ZTBBXKWBFpUQYXr+Rlo8XqjjoKG7hoCJod3MfEaHwth4
 1Oyj4cQOiNaEYXmgAP/MGAraS222Kc4GxCEyqMdtgZV4kMSvFNa6a3WDRSPC0Pa3
 MbbXJBnt3DNiVVWJ19kU0pBnX1d3cZg7GX+JH12buGIK58U+gbIF8MhXwR5WPmgz
 n3+2yIdwLPhTiNH6OY3+24sJwfyfjXzVkwt618du/BrLq8+skSpicdqr7vP3s9po
 lzKHAA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u3hk9a8w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 May 2025 13:45:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8195E4004B;
 Wed, 28 May 2025 13:44:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 166BD44D095;
 Wed, 28 May 2025 13:43:57 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 13:43:56 +0200
Message-ID: <2ebfc611-ce8f-4b10-8c71-a53eb634343d@foss.st.com>
Date: Wed, 28 May 2025 13:43:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
 <20250523-hdp-upstream-v3-3-bd6ca199466a@foss.st.com>
 <85866e42-b3d4-462c-8890-e2a354627229@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <85866e42-b3d4-462c-8890-e2a354627229@kernel.org>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 3/9] pinctrl: stm32: Introduce HDP
	driver
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

T24gNS8yOC8yNSAxMDoyOCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAyMy8wNS8y
MDI1IDE0OjM4LCBDbMOpbWVudCBMZSBHb2ZmaWMgd3JvdGU6CgpIaSwKCj4+IFRoaXMgcGF0Y2gg
aW50cm9kdWNlIHRoZSBkcml2ZXIgZm9yIHRoZSBIYXJkd2FyZSBEZWJ1ZyBQb3J0IGF2YWlsYWJs
ZSBvbgo+IAo+ICJBZGQgZHJpdmVyLi4uIiwgc2VlIHN1Ym1pdHRpbmcgcGF0Y2hlcwoKU3VyZSwg
SSdsbCBzaG9ydGVuIHRoZSBjb21taXQgbWVzc2FnZQoKPiAKPiAKPiAKPj4gU1RNMzJNUCBwbGF0
Zm9ybXMuIFRoZSBIRFAgYWxsb3dzIHRoZSBvYnNlcnZhdGlvbiBvZiBpbnRlcm5hbCBTb0MKPj4g
c2lnbmFscyBieSB1c2luZyBtdWx0aXBsZXhlcnMuIEVhY2ggSERQIHBvcnQgY2FuIHByb3ZpZGUg
dXAgdG8gMTYKPj4gaW50ZXJuYWwgc2lnbmFscyAob25lIG9mIHRoZW0gY2FuIGJlIHNvZnR3YXJl
IGNvbnRyb2xsZWQgYXMgYSBHUE8pLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBH
b2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMv
cGluY3RybC9zdG0zMi9LY29uZmlnICAgICAgICAgICAgIHwgIDE0ICsKPj4gICBkcml2ZXJzL3Bp
bmN0cmwvc3RtMzIvTWFrZWZpbGUgICAgICAgICAgICB8ICAgMSArCj4+ICAgZHJpdmVycy9waW5j
dHJsL3N0bTMyL3BpbmN0cmwtc3RtMzItaGRwLmMgfCA3MjAgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCj4+ICAgMyBmaWxlcyBjaGFuZ2VkLCA3MzUgaW5zZXJ0aW9ucygrKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL3N0bTMyL0tjb25maWcgYi9kcml2ZXJzL3BpbmN0
cmwvc3RtMzIvS2NvbmZpZwo+PiBpbmRleCAyNjU2ZDNkM2FlNDAuLjRiNDc0Y2ZkMWYyYyAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3N0bTMyL0tjb25maWcKPj4gKysrIGIvZHJpdmVy
cy9waW5jdHJsL3N0bTMyL0tjb25maWcKPj4gQEAgLTU3LDQgKzU3LDE4IEBAIGNvbmZpZyBQSU5D
VFJMX1NUTTMyTVAyNTcKPj4gICAJZGVwZW5kcyBvbiBPRiAmJiBIQVNfSU9NRU0KPj4gICAJZGVm
YXVsdCBNQUNIX1NUTTMyTVAyNQo+PiAgIAlzZWxlY3QgUElOQ1RSTF9TVE0zMgo+PiArCj4+ICtj
b25maWcgUElOQ1RSTF9TVE0zMl9IRFAKPj4gKwl0cmlzdGF0ZSAiU1RNaWNyb2VsZWN0cm9uaWNz
IFNUTTMyIEhhcmR3YXJlIERlYnVnIFBvcnQgKEhEUCkgcGluIGNvbnRyb2wiCj4+ICsJZGVwZW5k
cyBvbiBPRiAmJiBIQVNfSU9NRU0KPj4gKwlkZWZhdWx0IEFSTTY0IHx8IChBUk0gJiYgQ1BVX1Y3
KQo+IAo+IEkganVzdCBjbGVhbmVkIHRoaXMgdXAgYW5kIEkgc3RpbGwgdGhpbmsgdGhpcyBzaG91
bGQgYmUgZGVmYXVsdCBmb3IgeW91cgo+IGFyY2gsIG5vdCBmb3IgZXZlcnkgb3RoZXIgcGxhdGZv
cm0gZHVyaW5nIGNvbXBpbGUgdGVzdC4gU2VlIGJ1bmNoIG9mIG15Cj4gY29tbWl0cyAiRG8gbm90
IGVuYWJsZSBieSBkZWZhdWx0IGR1cmluZyBjb21waWxlIHRlc3RpbmciLgo+IAoKT2sgSSdsbCB1
c2UgImRlZmF1bHQgQVJDSF9TVE0zMiAmJiAhQVJNX1NJTkdMRV9BUk1WN00iIHdoaWNoIGlzIG1v
cmUgCnJlc3RyaWN0aXZlLgoKPiAKPj4gKwlzZWxlY3QgUElOTVVYCj4+ICsJc2VsZWN0IEdFTkVS
SUNfUElOQ09ORgo+PiArCXNlbGVjdCBHUElPTElCCj4+ICsJaGVscAo+PiArCSAgVGhlIEhhcmR3
YXJlIERlYnVnIFBvcnQgYWxsb3dzIHRoZSBvYnNlcnZhdGlvbiBvZiBpbnRlcm5hbCBzaWduYWxz
Lgo+PiArCSAgSXQgdXNlcyBjb25maWd1cmFibGUgbXVsdGlwbGV4ZXIgdG8gcm91dGUgc2lnbmFs
cyBpbiBhIGRlZGljYXRlZCBvYnNlcnZhdGlvbiByZWdpc3Rlci4KPj4gKwkgIFRoaXMgZHJpdmVy
IGFsc28gcGVybWl0cyB0aGUgb2JzZXJ2YXRpb24gb2Ygc2lnbmFscyBvbiBleHRlcm5hbCBTb0Mg
cGlucy4KPj4gKwkgIEl0IHBlcm1pdHMgdGhlIG9ic2VydmF0aW9uIG9mIHVwIHRvIDE2IHNpZ25h
bHMgcGVyIEhEUCBsaW5lLgo+PiArCj4+ICAgZW5kaWYKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cGluY3RybC9zdG0zMi9NYWtlZmlsZSBiL2RyaXZlcnMvcGluY3RybC9zdG0zMi9NYWtlZmlsZQo+
PiBpbmRleCA3YjE3NDY0ZDhkZTEuLjk4YTFiYmM3ZTE2YyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9waW5jdHJsL3N0bTMyL01ha2VmaWxlCj4+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9zdG0zMi9N
YWtlZmlsZQo+PiBAQCAtMTEsMyArMTEsNCBAQCBvYmotJChDT05GSUdfUElOQ1RSTF9TVE0zMkg3
NDMpCSs9IHBpbmN0cmwtc3RtMzJoNzQzLm8KPj4gICBvYmotJChDT05GSUdfUElOQ1RSTF9TVE0z
Mk1QMTM1KSArPSBwaW5jdHJsLXN0bTMybXAxMzUubwo+PiAgIG9iai0kKENPTkZJR19QSU5DVFJM
X1NUTTMyTVAxNTcpICs9IHBpbmN0cmwtc3RtMzJtcDE1Ny5vCj4+ICAgb2JqLSQoQ09ORklHX1BJ
TkNUUkxfU1RNMzJNUDI1NykgKz0gcGluY3RybC1zdG0zMm1wMjU3Lm8KPj4gK29iai0kKENPTkZJ
R19QSU5DVFJMX1NUTTMyX0hEUCkgKz0gcGluY3RybC1zdG0zMi1oZHAubwo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9waW5jdHJsL3N0bTMyL3BpbmN0cmwtc3RtMzItaGRwLmMgYi9kcml2ZXJzL3Bp
bmN0cmwvc3RtMzIvcGluY3RybC1zdG0zMi1oZHAuYwo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
PiBpbmRleCAwMDAwMDAwMDAwMDAuLmU5MTQ0MmViNTY2Ygo+PiAtLS0gL2Rldi9udWxsCj4+ICsr
KyBiL2RyaXZlcnMvcGluY3RybC9zdG0zMi9waW5jdHJsLXN0bTMyLWhkcC5jCj4+IEBAIC0wLDAg
KzEsNzIwIEBACj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Cj4+
ICsvKgo+PiArICogQ29weXJpZ2h0IChDKSBTVE1pY3JvZWxlY3Ryb25pY3MgMjAyNSAtIEFsbCBS
aWdodHMgUmVzZXJ2ZWQKPj4gKyAqIEF1dGhvcjogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50
LmxlZ29mZmljQGZvc3Muc3QuY29tPiBmb3IgU1RNaWNyb2VsZWN0cm9uaWNzLgo+PiArICovCj4+
ICsjaW5jbHVkZSA8bGludXgvYml0cy5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgo+PiAr
I2luY2x1ZGUgPGxpbnV4L2dwaW8vZHJpdmVyLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvaW8uaD4K
Pj4gKyNpbmNsdWRlIDxsaW51eC9vZi5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5o
Pgo+IAo+IE5vdCB1c2VkLgoKQWNrCgo+IAo+PiArI2luY2x1ZGUgPGxpbnV4L3BpbmN0cmwvY29u
c3VtZXIuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9waW5jdHJsL3BpbmNvbmYtZ2VuZXJpYy5oPgo+
PiArI2luY2x1ZGUgPGxpbnV4L3BpbmN0cmwvcGluY3RybC5oPgo+PiArI2luY2x1ZGUgPGxpbnV4
L3BpbmN0cmwvcGlubXV4Lmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+
Cj4+ICsjaW5jbHVkZSA8bGludXgvcG0uaD4KPj4gKwo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0
b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
