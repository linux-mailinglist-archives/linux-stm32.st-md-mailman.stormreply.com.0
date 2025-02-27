Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 469CDA47B44
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 12:07:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07910C7A847;
	Thu, 27 Feb 2025 11:07:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F330DC7A843
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 11:07:38 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R9RQsm007985;
 Thu, 27 Feb 2025 12:07:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 PmYOF4wGhNjibuwqHEkxWyFSrgjUr3eu12e+XRp9DPU=; b=ozIJ/Y7+zHtMTIV7
 hyQ1rotHYSzK19kFLs2TIDdp+GLHmUVuN0VaMXuLBVqQ23FjYCiMGNIsj+w36lKb
 0pXpYWvkzhzh8JXR9OpyrJb28J+fxxf/9tILzBvZWoW2hRxEocfm98bAQsHOVcmB
 VPOmGxWcjf4GF2WZpvKhKesKOO6pDWzxWa9eW7dr3BdKoFGFZzsdb7vfQKXVF98F
 JriWOVgjuaO7ESanfU9VBE0dRaTzA8AeIqgAWnqClwmtxm49tridhXODbo0SWinA
 MnpubI7+vcCcxL/gmg5nFp57ewF8IqyQ7keecJHGWEv6+58meEeK2u6ITzz7MJQV
 7CozKg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 451psrj758-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2025 12:07:26 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4815A40047;
 Thu, 27 Feb 2025 12:06:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1CBF13E756B;
 Thu, 27 Feb 2025 12:05:25 +0100 (CET)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 12:05:24 +0100
Message-ID: <cf86046b-00e2-41cc-b93c-7ad6cb4d062e@foss.st.com>
Date: Thu, 27 Feb 2025 12:05:24 +0100
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
 <264d7fb8-06c2-4ada-82bc-4d3a7cc5e184@foss.st.com>
 <46fbdccb-610a-4b73-8697-d7bcf4942a41@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <46fbdccb-610a-4b73-8697-d7bcf4942a41@kernel.org>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_05,2025-02-27_01,2024-11-22_01
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

T24gMi8yNi8yNSAxNjowNSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAyNi8wMi8y
MDI1IDExOjUyLCBDbGVtZW50IExFIEdPRkZJQyB3cm90ZToKPj4gT24gMi8yNi8yNSAwODoyMSwg
S3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+IE9uIDI1LzAyLzIwMjUgMTY6NTEsIENsZW1l
bnQgTEUgR09GRklDIHdyb3RlOgo+Pj4+IE9uIDIvMjUvMjUgMTQ6MDQsIEtyenlzenRvZiBLb3ps
b3dza2kgd3JvdGU6Cj4+Pj4+IE9uIDI1LzAyLzIwMjUgMDk6NDgsIENsw6ltZW50IExlIEdvZmZp
YyB3cm90ZToKPj4+Pj4+ICsKPj4+Pj4+ICttYWludGFpbmVyczoKPj4+Pj4+ICsgIC0gQ2zDqW1l
bnQgTEUgR09GRklDIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgo+Pj4+Pj4gKwo+Pj4+
Pj4gK2Rlc2NyaXB0aW9uOiB8Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IERvIG5vdCBuZWVkICd8JyB1bmxl
c3MgeW91IG5lZWQgdG8gcHJlc2VydmUgZm9ybWF0dGluZy4KPj4+Pgo+Pj4+IE9rCj4+Pj4KPj4+
Pj4+ICsgIFNUTWljcm9lbGVjdHJvbmljcydzIFNUTTMyIE1QVXMgaW50ZWdyYXRlIGEgSGFyZHdh
cmUgRGVidWcgUG9ydCAoSERQKS4KPj4+Pj4+ICsgIEl0IGFsbG93cyB0byBvdXRwdXQgaW50ZXJu
YWwgc2lnbmFscyBvbiBTb0MncyBHUElPLgo+Pj4+Pj4gKwo+Pj4+Pj4gK3Byb3BlcnRpZXM6Cj4+
Pj4+PiArICBjb21wYXRpYmxlOgo+Pj4+Pj4gKyAgICBjb25zdDogc3Qsc3RtMzJtcC1oZHAKPj4+
Pj4KPj4+Pj4gVGhlcmUgaXMgYSBtZXNzIGluIFNUTSBTb0NzLiBTb21ldGltZXMgeW91IGNhbGwg
U29DIHN0bTMyLCBzb21ldGltZXMKPj4+Pj4gc3RtMzJtcCBhbmQgc29tZXRpbWVzIHN0bTMybXBY
WC4KPj4+Pj4KPj4+Pj4gRGVmaW5lIGZvciBhbGwgeW91ciBTVE0gY29udHJpYnV0aW9ucyB3aGF0
IGlzIHRoZSBhY3R1YWwgU29DLiBUaGlzCj4+Pj4+IGZlZWRiYWNrIHdhcyBhbHJlYWR5IGdpdmVu
IHRvIFNULgo+Pj4+Pgo+Pj4+Pj4gKwo+Pj4+Pj4gKyAgcmVnOgo+Pj4+Pj4gKyAgICBtYXhJdGVt
czogMQo+Pj4+Pj4gKwo+Pj4+Pj4gKyAgY2xvY2tzOgo+Pj4+Pj4gKyAgICBtYXhJdGVtczogMQo+
Pj4+Pj4gKwo+Pj4+Pj4gK3BhdHRlcm5Qcm9wZXJ0aWVzOgo+Pj4+Pj4gKyAgJy1waW5zJCc6Cj4+
Pj4+PiArICAgIHR5cGU6IG9iamVjdAo+Pj4+Pj4gKyAgICAkcmVmOiBwaW5tdXgtbm9kZS55YW1s
Iwo+Pj4+Pj4gKwo+Pj4+Pj4gKyAgICBwcm9wZXJ0aWVzOgo+Pj4+Pj4gKyAgICAgIGZ1bmN0aW9u
Ogo+Pj4+Pj4gKyAgICAgICAgZW51bTogWyAiMCIsICIxIiwgIjIiLCAiMyIsICI0IiwgIjUiLCAi
NiIsICI3IiwKPj4+Pj4+ICsgICAgICAgICAgICAgICAgIjgiLCAiOSIsICIxMCIsICIxMSIsICIx
MiIsICIxMyIsICIxNCIsCj4+Pj4+PiArICAgICAgICAgICAgICAgICIxNSIgXQo+Pj4+Pgo+Pj4+
PiBGdW5jdGlvbiB3aGljaCBoYXMgYSBudW1iZXIgaXMgbm90IHJlYWxseSB1c2VmdWwuIFdoYXQg
ZG9lcyBpdCBldmVuIGV4cHJlc3M/Cj4+Pj4KPj4+PiBBcyBzYWlkIGluIG15IHByZXZpb3VzIGFu
c3dlciwgZnVuY3Rpb24gbmFtZXMgYXJlIHZlcnkgZGlmZmVyZW50IGZyb20KPj4+PiBvbmUgcGxh
dGZvcm0gdG8gYW5vdGhlci4gTnVtYmVycyB3ZXJlIHVzZWQgYXMgc3RyaW5nIHRvIGJlIGdlbmVy
aWMuCj4+Pj4gSSdsbCBjb25zaWRlciBpdCBpbiBhIFYyLgo+Pj4KPj4+IFdoYXQgZG9lcyBpdCBt
ZWFuICJvbmUgcGxhdGZvcm0gdG8gYW5vdGhlciI/IFRoaXMgaXMgb25lIHBsYXRmb3JtISBJcwo+
Pj4gdGhpcyBzb21lIHNvcnQgb2YgY29udGludWF0aW9uIG9mIFNvQyBjb21wYXRpYmxlIG1lc3M/
Cj4+Cj4+IEkgbWF5IHVzZWQgaW5jb3JyZWN0bHkgdGhlIHdvcmQgcGxhdGZvcm0uCj4+IFRoaXMg
ZHJpdmVyIGlzIHRoZSBzYW1lIGZvciB0aGUgdGhyZWUgU29DIGZhbWlsaWVzIFNUTTMyTVAxMywg
U1RNMzJNUDE1Cj4gCj4gVGhhdCdzIGRyaXZlciBhbmQgaXQgaXMgZmluZSwgYnV0IHdlIHRhbGsg
YWJvdXQgaGFyZHdhcmUgaGVyZS4gVGhlCj4gYmluZGluZyBpcyBmb3IgZ2l2ZW4gc3BlY2lmaWMg
aGFyZHdhcmUuCj4gCj4+IGFuZCBTVE0zMk1QMjUgYmVjYXVzZSB0aGUgaGFyZHdhcmUgaXMgbW9z
dGx5IHRoZSBzYW1lLgo+Pgo+PiBXaHkgbW9zdGx5ID8KPj4KPj4gVGhlIHBlcmlwaGVyYWwgaXMg
YmVoYXZpbmcgYXMgYSBtdXgsIHRoZXJlIGFyZSA4IEhEUCBwb3J0cywgZm9yIGVhY2gKPj4gcG9y
dCB0aGVyZSBpcyB1cCB0byAxNiBwb3NzaWJsZSBoYXJkd2FyZSBzaWduYWxzLiBOdW1iZXJlZCBm
cm9tIDAgdG8gMTUuCj4+IEVhY2ggb2YgdGhpcyBudW1iZXIgcmVwcmVzZW50IGEgc2lnbmFsIG9u
IHRoZSBwb3J0Lgo+Pgo+PiBCdXQgdGhlIGhhcmR3YXJlIHNpZ25hbCBiZWhpbmQgdGhlIG51bWJl
ciBpcyBub3QgdGhlIHNhbWUgZnJvbSBvbmUgU29DCj4+IGZhbWlseSB0byBhbm90aGVyLgo+PiBB
cyBleGFtcGxlLCBpbiBTVE0zMk1QMTUgZmFtaWx5IHRoZSBIRFAgaXMgYWJsZSB0byBvdXRwdXQg
R1BVIGhhcmR3YXJlCj4+IHNpZ25hbHMgYmVjYXVzZSB0aGUgZmFtaWx5IGhhcyBhIEdQVSBidXQg
aW4gdGhlIFNUTTMyTVAxMyBmYW1pbHkgdGhpcwo+PiBzaWduYWwgaXMgbm90IHByZXNlbnQuCj4g
Cj4gSXQgbG9va3MgbGlrZSB5b3UgaGF2ZSBjbGVhciBtYXBwaW5nIGJldHdlZW4gZnVuY3Rpb24g
YW5kIHBvcnQgbnVtYmVyCj4gKHlvdXIgaGVhZGVyIGFsc28gc3VnZ2VzdHMgdGhhdCksIHNvIHRo
ZSBmdW5jdGlvbiBwcm9wZXJ0eSBzaG91bGQgZm9sbG93Cj4gdGhhdCB1c2VyLXZpc2libGUgZnVu
Y3Rpb24uCj4gCj4gSnVzdCBsaWtlIHdlIGRvIGZvciBtYW55IG90aGVyIGFyY2hpdGVjdHVyZXMg
LSBpdCBpcyBub3QgdGhhdCB2ZXJ5LCB2ZXJ5Cj4gZGlmZmVyZW50LCBJIHRoaW5rLiBhbGwgb2Yg
cGxhdGZvcm0gaGFyZHdhcmVzIGRvIG5vdCBvcGVyYXRlIG9uIHN0cmluZ3MKPiBidXQgc29tZSBi
aXRzIGluIHJlZ2lzdGVycyAoc28gbnVtYmVycykgYnV0IGFsbCAoaWRlYWxseSkgYmluZGluZ3MK
PiBvcGVyYXRlIG9uIHN0cmluZ3MuIFlvdSBjcmVhdGVkIGhlcmUgZXhjZXB0aW9uIG9uIGJhc2lz
IHRoaXMgaXMgc29tZWhvdwo+IHNwZWNpYWwsIGJ1dCB0aGUgcG9pbnQgaXM6IGl0IGlzIG5vdCBz
cGVjaWFsLgo+IAo+Pgo+PiBUaGUgcHVycG9zZSBvZiBteSBoZWxwZXJzIHdhcyB0byBnaXZlIGEg
cmVhZGFibGUgbmFtZSB0byBmYWNpbGl0YXRlIHRoZQo+PiBjb25maWd1cmF0aW9uIGluIGJvYXJk
cyBkZXZpY2V0cmVlJ3MuIElmIG5lZWRlZCBJIGNhbiBnZXQgcmlkIG9mIHRoYXQKPj4gYW5kIHVz
ZSBvbmx5IHRoZSBudW1iZXIgYXMgc3RyaW5nLgo+IAo+IElmIHlvdSB1c2UgIm5hbWVzIiB5b3Ug
ZG8gbm90IG5lZWQgZXZlbiB0aGF0IGhlbHBlciBoZWFkZXIuCj4gCj4+Cj4+PiBXaGF0IGFyZSB0
aGUgZXhhY3QgZnVuY3Rpb25zIHdyaXR0ZW4gaW4gZGF0YXNoZWV0Pwo+Pgo+PiBUaGUgZXhhY3Qg
ZnVuY3Rpb25zIG5hbWUgd3JpdHRlbiBpbiB0aGUgZGF0YXNoZWV0IGFyZSB0aGUgb25lcyBvZiBt
eQo+PiBoZWxwZXIgZmlsZSB3aXRob3V0IHRoZSBIRFAgcHJlZml4Lgo+IAo+IHNvIGZ1bGwgc3Ry
aW5ncyAicHdyX3B3cndha2Vfc3lzIiBhbmQgdGhlc2Ugc2hvdWxkIGJlIHVzZWQuCgpPayBzbyBp
biB0aGUgVjIsIEknbGwga2VlcCB0aGUgJ2Z1bmN0aW9uJyBwcm9wZXJ0eSBvZiB0aGUgcGlubXV4
IGFuZCB1c2UgCnNpZ25hbCBuYW1lcyBzdWNoIGFzICdwd3JfcHdyd2FrZV9zeXMnIHRvIHNlbGVj
dCBzaWduYWxzIGluIHRoZSBEVC4KVGhlIHNpZ25hbCBuYW1lcyBhcmUgZGlmZmVyZW50IGZyb20g
b25lIFNvQyB0byBhbm90aGVyIChzdG0zMm1wMTMxLCAKc3RtMzJtcDE1MSBhbmQgc3RtMzJtcDI1
MSkgc28gSSdsbCBuZWVkIGNvbXBhdGlibGUgZGF0YSBhbmQgdGhlIApjb21wYXRpYmxlcyB3aWxs
IGJlOgoKTVAxNTogY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMTUxLWhkcCI7Ck1QMTM6IGNvbXBh
dGlibGUgPSAic3Qsc3RtMzJtcDEzMS1oZHAiOwpNUDI1OiBjb21wYXRpYmxlID0gInN0LHN0bTMy
bXAyNTEtaGRwIjsKCgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
