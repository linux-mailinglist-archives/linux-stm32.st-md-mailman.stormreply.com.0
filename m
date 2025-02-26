Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA2DA45EEE
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2025 13:27:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9C33C7A831;
	Wed, 26 Feb 2025 12:27:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76C7BC7A820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2025 12:27:56 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q8wODq012375;
 Wed, 26 Feb 2025 13:27:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 hZZuGvujbz+DHcZWLDWVwgKdZX6e4AC0NKcxZ1Mlhwc=; b=MdEAhItmw3+E1u3C
 r8HueeBOvKLTCaKleXHh1C8dodj135VyASWo0XfJ2NifRuQ+x5lYfjjzWR3X6tNZ
 802co02i0Mxx6VYM7W6BoZCSIULZCePY/KRWEATaZLQAxf5AYkJ0yf4vhcgUHl3s
 OmG3W/wVw4GweHAFey0xk3IMjY1X0qCo7jpD4FsoH7GScd27EdJwj2wfRnV9ZNLn
 T6F4onw9J6qRweP5pioK2Dxie2OQQG5w26nW5KoQeoJaD7ajkK9qrFwT2+Qe41e7
 ZZYxL9oEobWQ1SoYMT7XqbOFC2djKKvCQh73Gtl5HSr/Ui749DxYb++YCioXf4fu
 SJFQ5A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 451psv4a64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2025 13:27:41 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DA74B40051;
 Wed, 26 Feb 2025 13:26:31 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC916495277;
 Wed, 26 Feb 2025 11:52:59 +0100 (CET)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 11:52:59 +0100
Message-ID: <264d7fb8-06c2-4ada-82bc-4d3a7cc5e184@foss.st.com>
Date: Wed, 26 Feb 2025 11:52:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
 <20250225-hdp-upstream-v1-2-9d049c65330a@foss.st.com>
 <6fc80544-6fc3-4450-a0cc-bfc740fe97bb@kernel.org>
 <91f19306-4b31-41fe-8ad2-680b1a339204@foss.st.com>
 <00526b1d-b753-4ee5-8f83-67d27d66a43c@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <00526b1d-b753-4ee5-8f83-67d27d66a43c@kernel.org>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_02,2025-02-26_01,2024-11-22_01
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/9] dt-bindings: pinctrl: stm32:
	Introduce HDP
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

T24gMi8yNi8yNSAwODoyMSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAyNS8wMi8y
MDI1IDE2OjUxLCBDbGVtZW50IExFIEdPRkZJQyB3cm90ZToKPj4gT24gMi8yNS8yNSAxNDowNCwg
S3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+IE9uIDI1LzAyLzIwMjUgMDk6NDgsIENsw6lt
ZW50IExlIEdvZmZpYyB3cm90ZToKPj4+PiArCj4+Pj4gK21haW50YWluZXJzOgo+Pj4+ICsgIC0g
Q2zDqW1lbnQgTEUgR09GRklDIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgo+Pj4+ICsK
Pj4+PiArZGVzY3JpcHRpb246IHwKPj4+Cj4+Pgo+Pj4gRG8gbm90IG5lZWQgJ3wnIHVubGVzcyB5
b3UgbmVlZCB0byBwcmVzZXJ2ZSBmb3JtYXR0aW5nLgo+Pgo+PiBPawo+Pgo+Pj4+ICsgIFNUTWlj
cm9lbGVjdHJvbmljcydzIFNUTTMyIE1QVXMgaW50ZWdyYXRlIGEgSGFyZHdhcmUgRGVidWcgUG9y
dCAoSERQKS4KPj4+PiArICBJdCBhbGxvd3MgdG8gb3V0cHV0IGludGVybmFsIHNpZ25hbHMgb24g
U29DJ3MgR1BJTy4KPj4+PiArCj4+Pj4gK3Byb3BlcnRpZXM6Cj4+Pj4gKyAgY29tcGF0aWJsZToK
Pj4+PiArICAgIGNvbnN0OiBzdCxzdG0zMm1wLWhkcAo+Pj4KPj4+IFRoZXJlIGlzIGEgbWVzcyBp
biBTVE0gU29Dcy4gU29tZXRpbWVzIHlvdSBjYWxsIFNvQyBzdG0zMiwgc29tZXRpbWVzCj4+PiBz
dG0zMm1wIGFuZCBzb21ldGltZXMgc3RtMzJtcFhYLgo+Pj4KPj4+IERlZmluZSBmb3IgYWxsIHlv
dXIgU1RNIGNvbnRyaWJ1dGlvbnMgd2hhdCBpcyB0aGUgYWN0dWFsIFNvQy4gVGhpcwo+Pj4gZmVl
ZGJhY2sgd2FzIGFscmVhZHkgZ2l2ZW4gdG8gU1QuCj4+Pgo+Pj4+ICsKPj4+PiArICByZWc6Cj4+
Pj4gKyAgICBtYXhJdGVtczogMQo+Pj4+ICsKPj4+PiArICBjbG9ja3M6Cj4+Pj4gKyAgICBtYXhJ
dGVtczogMQo+Pj4+ICsKPj4+PiArcGF0dGVyblByb3BlcnRpZXM6Cj4+Pj4gKyAgJy1waW5zJCc6
Cj4+Pj4gKyAgICB0eXBlOiBvYmplY3QKPj4+PiArICAgICRyZWY6IHBpbm11eC1ub2RlLnlhbWwj
Cj4+Pj4gKwo+Pj4+ICsgICAgcHJvcGVydGllczoKPj4+PiArICAgICAgZnVuY3Rpb246Cj4+Pj4g
KyAgICAgICAgZW51bTogWyAiMCIsICIxIiwgIjIiLCAiMyIsICI0IiwgIjUiLCAiNiIsICI3IiwK
Pj4+PiArICAgICAgICAgICAgICAgICI4IiwgIjkiLCAiMTAiLCAiMTEiLCAiMTIiLCAiMTMiLCAi
MTQiLAo+Pj4+ICsgICAgICAgICAgICAgICAgIjE1IiBdCj4+Pgo+Pj4gRnVuY3Rpb24gd2hpY2gg
aGFzIGEgbnVtYmVyIGlzIG5vdCByZWFsbHkgdXNlZnVsLiBXaGF0IGRvZXMgaXQgZXZlbiBleHBy
ZXNzPwo+Pgo+PiBBcyBzYWlkIGluIG15IHByZXZpb3VzIGFuc3dlciwgZnVuY3Rpb24gbmFtZXMg
YXJlIHZlcnkgZGlmZmVyZW50IGZyb20KPj4gb25lIHBsYXRmb3JtIHRvIGFub3RoZXIuIE51bWJl
cnMgd2VyZSB1c2VkIGFzIHN0cmluZyB0byBiZSBnZW5lcmljLgo+PiBJJ2xsIGNvbnNpZGVyIGl0
IGluIGEgVjIuCj4gCj4gV2hhdCBkb2VzIGl0IG1lYW4gIm9uZSBwbGF0Zm9ybSB0byBhbm90aGVy
Ij8gVGhpcyBpcyBvbmUgcGxhdGZvcm0hIElzCj4gdGhpcyBzb21lIHNvcnQgb2YgY29udGludWF0
aW9uIG9mIFNvQyBjb21wYXRpYmxlIG1lc3M/CgpJIG1heSB1c2VkIGluY29ycmVjdGx5IHRoZSB3
b3JkIHBsYXRmb3JtLgpUaGlzIGRyaXZlciBpcyB0aGUgc2FtZSBmb3IgdGhlIHRocmVlIFNvQyBm
YW1pbGllcyBTVE0zMk1QMTMsIFNUTTMyTVAxNSAKYW5kIFNUTTMyTVAyNSBiZWNhdXNlIHRoZSBo
YXJkd2FyZSBpcyBtb3N0bHkgdGhlIHNhbWUuCgpXaHkgbW9zdGx5ID8KClRoZSBwZXJpcGhlcmFs
IGlzIGJlaGF2aW5nIGFzIGEgbXV4LCB0aGVyZSBhcmUgOCBIRFAgcG9ydHMsIGZvciBlYWNoIApw
b3J0IHRoZXJlIGlzIHVwIHRvIDE2IHBvc3NpYmxlIGhhcmR3YXJlIHNpZ25hbHMuIE51bWJlcmVk
IGZyb20gMCB0byAxNS4KRWFjaCBvZiB0aGlzIG51bWJlciByZXByZXNlbnQgYSBzaWduYWwgb24g
dGhlIHBvcnQuCgpCdXQgdGhlIGhhcmR3YXJlIHNpZ25hbCBiZWhpbmQgdGhlIG51bWJlciBpcyBu
b3QgdGhlIHNhbWUgZnJvbSBvbmUgU29DIApmYW1pbHkgdG8gYW5vdGhlci4KQXMgZXhhbXBsZSwg
aW4gU1RNMzJNUDE1IGZhbWlseSB0aGUgSERQIGlzIGFibGUgdG8gb3V0cHV0IEdQVSBoYXJkd2Fy
ZSAKc2lnbmFscyBiZWNhdXNlIHRoZSBmYW1pbHkgaGFzIGEgR1BVIGJ1dCBpbiB0aGUgU1RNMzJN
UDEzIGZhbWlseSB0aGlzIApzaWduYWwgaXMgbm90IHByZXNlbnQuCgpUaGUgcHVycG9zZSBvZiBt
eSBoZWxwZXJzIHdhcyB0byBnaXZlIGEgcmVhZGFibGUgbmFtZSB0byBmYWNpbGl0YXRlIHRoZSAK
Y29uZmlndXJhdGlvbiBpbiBib2FyZHMgZGV2aWNldHJlZSdzLiBJZiBuZWVkZWQgSSBjYW4gZ2V0
IHJpZCBvZiB0aGF0IAphbmQgdXNlIG9ubHkgdGhlIG51bWJlciBhcyBzdHJpbmcuCgo+IFdoYXQg
YXJlIHRoZSBleGFjdCBmdW5jdGlvbnMgd3JpdHRlbiBpbiBkYXRhc2hlZXQ/CgpUaGUgZXhhY3Qg
ZnVuY3Rpb25zIG5hbWUgd3JpdHRlbiBpbiB0aGUgZGF0YXNoZWV0IGFyZSB0aGUgb25lcyBvZiBt
eSAKaGVscGVyIGZpbGUgd2l0aG91dCB0aGUgSERQIHByZWZpeC4KCgo+IEJlc3QgcmVnYXJkcywK
PiBLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
