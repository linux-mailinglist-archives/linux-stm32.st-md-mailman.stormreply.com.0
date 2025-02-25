Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C19ABA44761
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 18:07:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B92EC78F9F;
	Tue, 25 Feb 2025 17:07:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09C7CC78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 17:07:15 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PEv1Fd023213;
 Tue, 25 Feb 2025 18:07:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 T/Jb54THTfDypOaw3j9QTlja8nsXEGzKOXd88jtbmz0=; b=FcPQ9JeyT9/q5+3h
 OsRL5WzXhKeLYyKAIBd/2RaNwppTEw4jT6g4cu9RW8r/S6xSfzlzVqMDH1FQD+qS
 J1Q+eaPbzyEHnEH3aqOMdTOZygNqXR2w1SVcEkkZRxSssvNzJbVX1BOe0jKyzUqC
 6WOOBKh32TcuCXyJL6Siwpg08uBKinAOivi3qiocwu6pj1IJeJNSgrl5R5jyv2el
 FnQnT82E8iRK/B3VE3RTxyrEJI8510s0dRia93BYHFf3Bw64g0y6mYZlSgUYxtXe
 Jx+yWTYEQjtOcdJSRBg0wh4hdF+g0/NuVKNv6Pt+M61ZD4cXV0xQtJYIrIYeccmr
 BbACLw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512sp4ua5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Feb 2025 18:07:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9DA5D40065;
 Tue, 25 Feb 2025 18:05:59 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 694ED4F37FF;
 Tue, 25 Feb 2025 16:46:19 +0100 (CET)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 16:46:18 +0100
Message-ID: <7bc5c425-1d6e-4e25-b913-287478d4149f@foss.st.com>
Date: Tue, 25 Feb 2025 16:46:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
 <20250225-hdp-upstream-v1-1-9d049c65330a@foss.st.com>
 <f17eadf3-eb2d-470d-ad77-909f00584d44@kernel.org>
Content-Language: en-US
In-Reply-To: <f17eadf3-eb2d-470d-ad77-909f00584d44@kernel.org>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_05,2025-02-25_03,2024-11-22_01
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/9] dt-bindings: pinctrl: stm32: Add HDP
 includes for stm32mp platforms
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

T24gMi8yNS8yNSAxNDowMSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAyNS8wMi8y
MDI1IDA5OjQ4LCBDbMOpbWVudCBMZSBHb2ZmaWMgd3JvdGU6Cj4+IEVhY2ggZmlsZSBpbnRyb2R1
Y2VzIGhlbHBlcnMgdG8gY2hvb3NlIHRoZSBzaWduYWwgdG8gbW9uaXRvciB0aHJvdWdoIHRoZQo+
PiBIRFAgcGluLgo+PiBTaWduYWxzIGFyZSBkaWZmZXJlbnQgZm9yIGVhY2ggcGxhdGZvcm1zOiBz
dG0zMm1wMTMsIHN0bTMybXAxNSwgc3RtMzJtcDI1Lgo+IAo+IEhlYWRlcnMgYXJlIHBhcnQgb2Yg
YmluZGluZ3MgY29tbWl0LCBhc3N1bWluZyB0aGlzIHN0YXlzLi4uCgpPayB3aWxsIHNxdWFzaCB3
aXRoIHRoZSBuZXh0IHBhdGNoCgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2Zm
aWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Cj4+IC0tLQo+PiAgIGluY2x1ZGUvZHQt
YmluZGluZ3MvcGluY3RybC9zdG0zMm1wMTMtaGRwLmggfCAxMzAgKysrKysrKysrKysrKysrKysr
KysrKysrKwo+PiAgIGluY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9zdG0zMm1wMTUtaGRwLmgg
fCAxMTYgKysrKysrKysrKysrKysrKysrKysrKwo+PiAgIGluY2x1ZGUvZHQtYmluZGluZ3MvcGlu
Y3RybC9zdG0zMm1wMjUtaGRwLmggfCAxNDQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
PiAgIDMgZmlsZXMgY2hhbmdlZCwgMzkwIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9zdG0zMm1wMTMtaGRwLmggYi9pbmNsdWRlL2R0
LWJpbmRpbmdzL3BpbmN0cmwvc3RtMzJtcDEzLWhkcC5oCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uYTM0ODdlNzAwMTQzCj4+IC0tLSAvZGV2L251bGwKPj4g
KysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsL3N0bTMybXAxMy1oZHAuaAo+PiBAQCAt
MCwwICsxLDEzMCBAQAo+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9u
bHkgT1IgQlNELTMtQ2xhdXNlKSAqLwo+PiArLyoKPj4gKyAqIENvcHlyaWdodCAoQykgU1RNaWNy
b2VsZWN0cm9uaWNzIDIwMjUgLSBBbGwgUmlnaHRzIFJlc2VydmVkCj4+ICsgKiBBdXRob3I6IENs
w6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4gZm9yIFNUTWlj
cm9lbGVjdHJvbmljcy4KPj4gKyAqLwo+PiArCj4+ICsjaWZuZGVmIF9EVF9CSU5ESU5HU19TVE0z
Mk1QMTNfSERQX0gKPj4gKyNkZWZpbmUgX0RUX0JJTkRJTkdTX1NUTTMyTVAxM19IRFBfSAo+PiAr
Cj4+ICsvKiBkZWZpbmUgYSBtYWNybyBmb3IgZWFjaCBmdW5jdGlvbiBhIEhEUCBwaW4gY2FuIHRy
YW5zbWl0ICovCj4+ICsjZGVmaW5lIEhEUDBfUFdSX1BXUldBS0VfU1lTCQkJICIwIgo+IAo+IAo+
IFdoeSB0aGlzIGlzIGEgc3RyaW5nIG5vdCBhIG51bWJlcj8KPiAKPiBXaGVyZSBpcyBpdCB1c2Vk
PyBJIGRvbid0IHNlZSB1c2FnZSBpbiB0aGUgZHJpdmVyLCBzbyB0aGlzIGRvZXMgbm90IGxvb2sK
PiBsaWtlIGJpbmRpbmcgKGFuZCBEVFMgaXMgbm90IGEgZHJpdmVyKS4KClRob3NlIGZpbGVzIGFy
ZSBoZWxwZXJzIGZvciB0aGUgZGV2aWNldHJlZXMgYW5kIG1heSBiZSBpbmNsdWRlZCBpbiAKc3Rt
MzJtcCotcGluY3RybC5kdHNpIGZpbGVzLgpJdCBpcyBhIHN0cmluZyBiZWNhdXNlIGl0IGlzIGFu
IGhlbHBlciBmb3IgdGhlIGBmdW5jdGlvbmAgcHJvcGVydHkgb2YgCmBwaW5tdXgtbm9kZS55YW1s
YCB3aGljaCBpcyBhIHN0cmluZy4KCkkgdW5kZXJzdGFuZCB0aGF0IGhhdmluZyBhIG51bWJlciBh
cyBhIHN0cmluZyBpcyBub3QgZWFzaWx5IHVuZGVyc3RhbmRhYmxlLgpJJ2xsIGNvbnNpZGVyIGl0
IGluIGEgVjIgYnkgdHJ5aW5nIHRvIHVzZSB0aGUgYHBpbm11eGAgcHJvcGVydHkuCgo+IEJlc3Qg
cmVnYXJkcywKPiBLcnp5c3p0b2YKCkJlc3QgcmVnYXJkcywKCkNsw6ltZW50CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
