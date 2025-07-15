Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A62DBB05371
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jul 2025 09:40:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E2E3C3F933;
	Tue, 15 Jul 2025 07:40:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6D88C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 07:40:32 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F6lxuk020561;
 Tue, 15 Jul 2025 09:40:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 lJy4u2cOTJUFfRT/p8pwkIm5hoX5bxeCYsLaFA2bBsA=; b=7kAjTzeNW9FJV216
 7OqeUNQPrLxCdIZ323fzJsJWpFke4072y6L1dk8QqL8V2Vpsfpf+JCVXMRI3MH4C
 6lW9tUL2O+o+cMjwG2y4ygq793VuqJmdt37dIYs7qmpdWYRpMYE9nWvGWeAmRRrz
 k7jZqRHdNfrNjKvZNqcPab9+hytQGubWNxDd7ZD9sxUxQKmwAPBy6EtbATRkVD1p
 0EI7lnohov4idm03jKs7x0XVdjMQPwxzVE+PDjvGFOYYhvx9ECCObsYgZ60kRap5
 oYEt9+iKARslZ1D2NdCMcaKTcpKdPsChEKJL4huaDlxZpwvRDzEVrPBtxfyX55oi
 9KotqQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47uf22kuc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jul 2025 09:40:04 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1D20F40045;
 Tue, 15 Jul 2025 09:38:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3AF65B5857F;
 Tue, 15 Jul 2025 09:37:23 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 09:37:22 +0200
Message-ID: <765eccdc-7d51-42c6-bcba-07813077fc1d@foss.st.com>
Date: Tue, 15 Jul 2025 09:37:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>, =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?=
 <clement.legoffic@foss.st.com>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
 <20250711-ddrperfm-upstream-v2-2-cdece720348f@foss.st.com>
 <20250715031717.GA4144523-robh@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20250715031717.GA4144523-robh@kernel.org>
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-doc@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-perf-users@vger.kernel.org, Le Goffic <legoffic.clement@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 02/16] dt-bindings: stm32: stm32mp25:
 add `access-controller-cell` property
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

SGVsbG8gUm9iLAoKT24gNy8xNS8yNSAwNToxNywgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gRnJp
LCBKdWwgMTEsIDIwMjUgYXQgMDQ6NDg6NTRQTSArMDIwMCwgQ2zDqW1lbnQgTGUgR29mZmljIHdy
b3RlOgo+PiBSQ0MgaXMgYWJsZSB0byBjaGVjayB0aGUgYXZhaWxhYmlsaXR5IG9mIGEgY2xvY2su
Cj4+IEFsbG93IHRvIHF1ZXJ5IHRoZSBSQ0Mgd2l0aCBhIGZpcmV3YWxsIElELgo+IAo+IElmIGl0
IGlzIHRpZWQgdG8gYSBjbG9jaywgZG8gd2UgbmVlZCBhbm90aGVyIHByb3ZpZGVyPyBXZSBoYXZl
IHRoZQo+ICJwcm90ZWN0ZWQgY2xvY2tzIiB0aGluZywgYnV0IHRoYXQgbWlnaHQgYmUgYSBiaXQg
ZGlmZmVyZW50Lgo+IAoKSSBjb3VsZG4ndCBmaW5kIGFueSByZWZlcmVuY2UgdG8gInByb3RlY3Rl
ZC1jbG9ja3MiIG91dHNpZGUgb2YgcWNvbQpyZWxhdGVkIGNvZGUsIGlzIHRoZXJlIGEgZG9jdW1l
bnRhdGlvbj8gKENvdWxkbid0IGZpbmQgaXQgaW4KY2xvY2tzLnlhbWwpLgoKVGhlIFJDQyBpcyBm
aXJld2FsbC1hd2FyZSBhbmQgaGFzIGl0J3Mgb3duIGZpcmV3YWxsIGNvbmZpZ3VyYXRpb24gYXQK
UkNDIGxldmVsIGZvciBzb21lIHN5c3RlbSByZXNvdXJjZXMuIFdoZW4gY2hlY2tpbmcgYWNjZXNz
IHRvIGEgY2xvY2ssCm9yIGEgcmVzZXQsIHdlJ3JlIHJlYWRpbmcgUkNDIHJlZ2lzdGVycywgaGVu
Y2UgZGVjbGFyaW5nIGl0IGFzIGFuCmFjY2Vzcy1jb250cm9sbGVyLgoKQSBSQ0MgcmVzb3VyY2Un
cyBmaXJld2FsbCBjb25maWd1cmF0aW9uIHVzdWFsbHkgY292ZXJzIG1vcmUgdGhhbiBhCmNsb2Nr
LgoKPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29m
ZmljQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvY2xvY2svc3Qsc3RtMzJtcDI1LXJjYy55YW1sIHwgNyArKysrKysrCj4+ICAgMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3N0LHN0bTMybXAyNS1yY2MueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9zdCxzdG0zMm1wMjUtcmNjLnlhbWwK
Pj4gaW5kZXggODhlNTJmMTBkMWVjLi40ZDQ3MWUzZDg5YmMgMTAwNjQ0Cj4+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9zdCxzdG0zMm1wMjUtcmNjLnlhbWwK
Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3N0LHN0bTMy
bXAyNS1yY2MueWFtbAo+PiBAQCAtMzEsNiArMzEsMTEgQEAgcHJvcGVydGllczoKPj4gICAgICcj
cmVzZXQtY2VsbHMnOgo+PiAgICAgICBjb25zdDogMQo+PiAgIAo+PiArICAnI2FjY2Vzcy1jb250
cm9sbGVyLWNlbGxzJzoKPj4gKyAgICBjb25zdDogMQo+PiArICAgIGRlc2NyaXB0aW9uOgo+PiAr
ICAgICAgQ29udGFpbnMgdGhlIGZpcmV3YWxsIElEIGFzc29jaWF0ZWQgdG8gdGhlIHBlcmlwaGVy
YWwuCj4+ICsKPj4gICAgIGNsb2NrczoKPj4gICAgICAgaXRlbXM6Cj4+ICAgICAgICAgLSBkZXNj
cmlwdGlvbjogQ0tfU0NNSV9IU0UgSGlnaCBTcGVlZCBFeHRlcm5hbCBvc2NpbGxhdG9yICg4IHRv
IDQ4IE1IeikKPj4gQEAgLTEyMyw2ICsxMjgsNyBAQCByZXF1aXJlZDoKPj4gICAgIC0gcmVnCj4+
ICAgICAtICcjY2xvY2stY2VsbHMnCj4+ICAgICAtICcjcmVzZXQtY2VsbHMnCj4+ICsgIC0gJyNh
Y2Nlc3MtY29udHJvbGxlci1jZWxscycKPj4gICAgIC0gY2xvY2tzCj4+ICAgCj4+ICAgYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlCj4+IEBAIC0xMzYsNiArMTQyLDcgQEAgZXhhbXBsZXM6Cj4+
ICAgICAgICAgICByZWcgPSA8MHg0NDIwMDAwMCAweDEwMDAwPjsKPj4gICAgICAgICAgICNjbG9j
ay1jZWxscyA9IDwxPjsKPj4gICAgICAgICAgICNyZXNldC1jZWxscyA9IDwxPjsKPj4gKyAgICAg
ICAgI2FjY2Vzcy1jb250cm9sbGVyLWNlbGxzID0gPDE+Owo+PiAgICAgICAgICAgY2xvY2tzID0g
IDwmc2NtaV9jbGsgQ0tfU0NNSV9IU0U+LAo+PiAgICAgICAgICAgICAgICAgICAgIDwmc2NtaV9j
bGsgQ0tfU0NNSV9IU0k+LAo+PiAgICAgICAgICAgICAgICAgICAgIDwmc2NtaV9jbGsgQ0tfU0NN
SV9NU0k+LAo+Pgo+PiAtLSAKPj4gMi40My4wCj4+CgpCZXN0IHJlZ2FyZHMsCkdhdGllbgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
