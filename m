Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0493FAD6C4E
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 11:34:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A899EC36B24;
	Thu, 12 Jun 2025 09:34:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9606BC36B1E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 09:34:10 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C8k9nE016328;
 Thu, 12 Jun 2025 11:33:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 H8jaND8JdJUfBA787uQMniXNfew6S91UWnfQYEWlZ9U=; b=qO5rOYU0QE+X8XW7
 zu/24y84QT2IzGy37w3R3VQpSZ+z9t7ptH7JgINU5lgqbgQP1sP0zWp7JBVgsIBI
 GHWxK5kV5nkDgGuMHA/AbE59Z6P0hQhx1b2+uGPinJcT7IYN7LZgpjz49Tf05Hjd
 cSzfQiiTh/MpTFvSUByZ2Bpn4iTqaS6ymx/U1wIRYFCVrAVj/0ZZMGCx9Gtf3HCp
 jj3CSEA59A28uRrxZqdJKK9hbAnJmJQXA20279c+8JTE39ycgm2dzHtP9pGSk0Gn
 ZVytPF4MM0R9EPLovMnKtsqeqNASTWYJDjEXGmSBwf6NTCCUIKzrC9uM+dksf7M3
 5IsOUQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs2yf4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jun 2025 11:33:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 787264005D;
 Thu, 12 Jun 2025 11:32:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 01E0C6CF9BF;
 Thu, 12 Jun 2025 11:31:55 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 11:31:54 +0200
Message-ID: <26a4f12a-2295-402e-8e31-45733aa6582d@foss.st.com>
Date: Thu, 12 Jun 2025 11:31:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
 <20250523-hdp-upstream-v3-5-bd6ca199466a@foss.st.com>
 <5b7a2102-ff68-4aab-a88d-0c4f9195ef95@kernel.org>
 <3c868c4b-8a0e-44b5-9d6e-3a0526d9deeb@foss.st.com>
 <3ba588ed-1614-4877-b6fc-b5aa853b8c2e@kernel.org>
 <714ad17d-53f1-4703-8e13-61c290a8da89@foss.st.com>
 <7000f63e-5e68-465d-9d7f-1a6ca0524222@kernel.org>
 <a49d0af2-07b7-4f51-941b-fa25b2879720@foss.st.com>
 <42a0b7ab-d85d-4d52-a263-4a4648c7ff05@kernel.org>
 <2865ab3a-1c20-4951-8132-4be98d73d70e@foss.st.com>
 <f1a63830-0533-4f1c-9116-32e8c1e61a8b@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <f1a63830-0533-4f1c-9116-32e8c1e61a8b@kernel.org>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 5/9] ARM: dts: stm32: add Hardware
 debug port (HDP) on stm32mp13
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

T24gNi8xMS8yNSAxNzo0OCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAxMS8wNi8y
MDI1IDE2OjA4LCBDbGVtZW50IExFIEdPRkZJQyB3cm90ZToKPj4gT24gNi8xMS8yNSAwODozNSwg
S3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+IE9uIDEwLzA2LzIwMjUgMTU6MzMsIENsZW1l
bnQgTEUgR09GRklDIHdyb3RlOgo+Pj4+IE9uIDYvMTAvMjUgMTQ6MzgsIEtyenlzenRvZiBLb3ps
b3dza2kgd3JvdGU6Cj4+Pj4+IE9uIDEwLzA2LzIwMjUgMTQ6MDIsIENsZW1lbnQgTEUgR09GRklD
IHdyb3RlOgo+Pj4+Pj4gT24gNS8yOS8yNSAxMTowMSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90
ZToKPj4+Pj4+PiBPbiAyOC8wNS8yMDI1IDE0OjE0LCBDbGVtZW50IExFIEdPRkZJQyB3cm90ZToK
Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gKwkJfTsKPj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+Pj4gKwkJaGRw
OiBwaW5jdHJsQDUwMDJhMDAwIHsKPj4+Pj4+Pj4+PiArCQkJY29tcGF0aWJsZSA9ICJzdCxzdG0z
Mm1wMTMxLWhkcCI7Cj4+Pj4+Pj4+Pj4gKwkJCXJlZyA9IDwweDUwMDJhMDAwIDB4NDAwPjsKPj4+
Pj4+Pj4+PiArCQkJY2xvY2tzID0gPCZyY2MgSERQPjsKPj4+Pj4+Pj4+PiAgICAgICAJCQlzdGF0
dXMgPSAiZGlzYWJsZWQiOwo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFdoeSBhcmUgeW91IGRpc2FibGlu
ZyBpdD8gV2hhdCBpcyBtaXNzaW5nPwo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBOb3RoaW5nIGlzIG1pc3Np
bmcganVzdCBkaXNhYmxlZCBieSBkZWZhdWx0Lgo+Pj4+Pj4+PiBUaGUgbm9kZSBpcyB0aGVuIGVu
YWJsZWQgd2hlbiBuZWVkZWQgaW4gYm9hcmQncyBkdHMgZmlsZS4KPj4+Pj4+PiBOb2RlcyBzaG91
bGQgbm90IGJlIGRpc2FibGVkIGJ5IGRlZmF1bHQgaWYgdGhleSBhcmUgY29tcGxldGUuIFRoYXQn
cyB3aHkKPj4+Pj4+PiBJIGFza2VkIHdoYXQgaXMgbWlzc2luZy4gRHJvcC4KPj4+Pj4+Cj4+Pj4+
PiBIaSBLcnp5c3p0b2YsIE9LIEkgYmV0dGVyIHVuZGVyc3RhbmQgbm93Lgo+Pj4+Pj4gU28geWVz
IHRoZSAncGluY3RybC0qJyBwcm9wZXJ0aWVzIHdoaWNoIGFyZSBib2FyZCBkZXBlbmRlbnQgYXJl
IGxhY2tpbmcuCj4+Pj4+Cj4+Pj4+IFRoZXNlIGFyZSBub3QgcHJvcGVydGllcyBvZiB0aGlzIG5v
ZGUuCj4+Pj4KPj4+PiBEb2VzIHRoaXMgbWVhbiBJIHNob3VsZCBhZGQgJ3BpbmN0cmwtKicgcHJv
cGVydGllcyBpbiBiaW5kaW5ncyB5YW1sIGZpbGUgPwo+Pj4+IEkgZG9uJ3QgZ2V0IGl0Li4KPj4+
Cj4+PiBUaGVzZSBwcm9wZXJ0aWVzIGhhdmUgbm8gbWVhbmluZyBoZXJlLCBzbyB0aGUgaGFyZHdh
cmUgZGVzY3JpcHRpb24gaXMKPj4+IGNvbXBsZXRlLiBZb3UgY2xhaW0gdGhhdCB5b3UgbWlzcyB0
aGVtIHRodXMgZGV2aWNlIGlzIGluY29tcGxldGUgaXMganVzdAo+Pj4gbm90IGNvcnJlY3Q6IHRo
ZXNlIHByb3BlcnRpZXMgZG8gbm90IGJlbG9uZyBoZXJlISBUaGV5IGJlbG9uZyB0byB0aGUKPj4+
IGJvYXJkIGJ1dCBldmVuIHRoZXJlIHRoZXkgYXJlIHRvdGFsbHkgb3B0aW9uYWwuIFdoeSB3b3Vs
ZCB0aGV5IGJlIGEKPj4+IHJlcXVpcmVkIHJlc291cmNlPwo+Pj4KPj4+IFRvIHJlbWluZDogd2Ug
dGFsayBoZXJlIE9OTFkgYWJvdXQgcmVxdWlyZWQgcmVzb3VyY2VzLgo+Pgo+PiBZZXMsICdwaW5j
dHJsLSonIHByb3BlcnRpZXMgYmVsb25ncyB0byB0aGUgYm9hcmQgYW5kIGFyZSBub3QgcmVxdWly
ZWQuCj4+IFNvIG5vdGhpbmcgaXMgbWlzc2luZy4KPj4KPj4gVGhpcyBoZHAgbm9kZSBpbiB0aGUg
U29DIGR0c2kgZmlsZSBjYW4gYmUgZW5hYmxlZCBieSBkZWZhdWx0Lgo+PiBCdXQgdGhlIGhkcCBk
cml2ZXIgd2lsbCBwcm9iZSBhbmQgZG8gbm90aGluZyBiZWNhdXNlIHdpdGhvdXQgdGhlCj4+ICdw
aW5jdHJsLSonIHByb3BlcnRpZXMgZnJvbSB0aGUgYm9hcmQgZmlsZXMgaXQgd291bGQgbm90IGJl
IGFibGUgdG8KPj4gYWNjZXNzIHRvIGFueSBwaW4uCj4gCj4gCj4gUGluY3RybCBoYXMgb3RoZXIg
ZmVhdHVyZXMgaW4gZ2VuZXJhbCwgaW5jbHVkaW5nIGludGVyZmFjZXMgdG8gdXNlcnNwYWNlCj4g
KGFzIHByZXR0eSBvZnRlbiBjb21iaW5lZCB3aXRoIGdwaW8sIGFsdGhvdWdoIG5vdCBzdXJlIGlm
IHJlbGV2YW50IGhlcmUpLgoKWW91J3JlIHJpZ2h0LiBBbHNvIEhEUCBwaW5jdHJsIGhhcyBhIEdQ
TyBmZWF0dXJlIGFjY2Vzc2libGUgZnJvbSB1c2Vyc3BhY2UuCkJ1dCBieSBkZWZhdWx0IHRoZSBI
RFAgaXMgbm90IGNvbm5lY3RlZCB0byBhbnkgcGFkOyBpdCBuZWVkcyB0aGUgYm9hcmQgCidwaW5j
dHJsLSonIHByb3BlcnRpZXMgdG8gY29uZmlndXJlIHRoZSBTb0MgcGluY3RybCBhbmQgZXhwb3Nl
IEhEUCBvbiAKdGhlIFNvQyBwYWRzLgoKVGhhdCdzIHdoeSBmb3IgbWUgdGhlIGVuYWJsaW5nIG9m
IHRoZSBkcml2ZXIgc2hvdWxkIGJlIGluIHRoZSBib2FyZCBmaWxlIAp0b2dldGhlciB3aXRoIHRo
ZSBTb0MgcGluY3RybCBjb25maWd1cmF0aW9uLgoKVGhlIHVzZXJsYW5kIGNhbm5vdCBjaGFuZ2Ug
dGhlIHBpbmN0cmwgYWx0ZXJuYXRlIGZ1bmN0aW9uIG11eCwgdGhpcyBpcyAKc3RhdGljYWxseSBk
ZWZpbmVkIGJ5IHRoZSBkZXZpY2V0cmVlLgoKPiAKPj4gSSBjb25zaWRlciBlbmFibGluZyB0aGlz
IGRyaXZlciBieSBkZWZhdWx0IGluIFNvQyBkdHNpIGZpbGUgYXMganVzdAo+PiBpbmNyZWFzaW5n
IHRoZSBib290IHRpbWUgb24gImV2ZXJ5IiBib2FyZC4KPj4gSXQncyB0aGUgYm9hcmQgZHRzIHRo
YXQgcmVxdWlyZXMgdGhlIGhkcCBhbmQgcHJvdmlkZXMgdGhlICdwaW5jdHJsLSonCj4+IHByb3Bl
cnRpZXMgdG8gY29ubmVjdCB0aGUgaGRwIHRvIHNvbWUgU29DIHBpbiBhbmQgdGhlbiB0byBzb21l
IHNpZ25hbCBvbgo+PiB0aGUgYm9hcmQuIEZvciBtZSBpdCdzIG5hdHVyYWwgdG8gaGF2ZSB0aGUg
c3RhdHVzIG9rYXkgb25seSBpbiB0aGUgYm9hcmQKPj4gZHRzIGZpbGUuCj4gCj4gVGhlIERUUyBp
cyBub3QgdGhlIHdheSB0byBvcHRpbWl6ZSBib290IHByb2Nlc3Nlcy4gSXQgaXMgT1MtaW5kZXBl
bmRlbnQKPiBoYXJkd2FyZSBkZXNjcmlwdGlvbi4gTXkgQlNEIHN5c3RlbSBmb3IgZXhhbXBsZSB1
c2VzIHNtYXJ0IGRyaXZlciB3aGljaAo+IGF2b2lkcyBwcm9iaW5nLCBidXQgYWxzbyBteSB1c2Vy
LXNwYWNlIG5lZWRzIHRoaXMgZGV2aWNlIHRvIHRhbGsgb3Zlcgo+IGV4cG9zZWQgaW50ZXJmYWNl
LCBzbyB3aHkgY2hvaWNlIG9mIExpbnV4IHByb2Jpbmcgc2hvdWxkIGFmZmVjdCBvdGhlcnM/CgpB
cyBJIHdyb3RlIGFib3ZlIHRoZSBIRFAgd2lsbCBub3Qgb2ZmZXIgYW55IGZ1bmN0aW9uYWxpdHkg
d2l0aG91dCB0aGUgCidwaW5jdHJsLSonIHByb3BlcnRpZXMgaW4gdGhlIGJvYXJkIGZpbGUuCklm
IHlvdSBpbnNpc3QsIEkgY2FuIGVuYWJsZSBpdCBpbiB0aGUgU29DIGZpbGUgYnV0IEkgcmVhbGx5
IGRvbid0IHNlZSAKYW55IHJlYXNvbiBmb3IgdGhhdC4KCkJlc3QgcmVnYXJkcywgQ2zDqW1lbnQK
Cj4gCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
