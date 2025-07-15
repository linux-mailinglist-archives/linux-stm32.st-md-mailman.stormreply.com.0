Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67759B05933
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jul 2025 13:50:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16B1FC3F938;
	Tue, 15 Jul 2025 11:50:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06C5FC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 11:50:17 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FAMQbh029486;
 Tue, 15 Jul 2025 13:50:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 hHReatZjTtUpe1C3asy2R8IM8Kcv0kDyXvZK9XlQ+lk=; b=fh1rHRZFK1nk6lOl
 QbM6QkNeuozHJiMlDadg5eg4wTOYpYUEAqkTUs/wyIKHs5Zgzpg+pLlxiN8MgaKm
 bYyrWD2O1fcy3KvdQuvn5Fg9A1fZapLlwseM31NycwEJBo0KtooSCux9wrY5uz80
 BV/lSVKPFfmiz2MtxFR0I7C5E/ywPZsJm+KsXnT0xFjJUl4dx8mGSpBEBlN/ME4n
 FrIgVucwo7SYOMDj9zZBZ7Af9SlkxNRHYeEeKLjFZacUSW4Zl2w5Rh/jWbdEyof4
 5q5IF/tl04yy90VT9LKnTtqbHEjaicGs8F5dMrjP1vooB4JeAOeTs1reIt+9hneq
 2MmeQA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47uf22n5c4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jul 2025 13:50:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BF21B4002D;
 Tue, 15 Jul 2025 13:48:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0025EB23763;
 Tue, 15 Jul 2025 13:47:39 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 13:47:38 +0200
Message-ID: <cfeaa4b0-6894-4363-ba43-25eee31ed497@foss.st.com>
Date: Tue, 15 Jul 2025 13:47:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
 <20250711-ddrperfm-upstream-v2-2-cdece720348f@foss.st.com>
 <20250715031717.GA4144523-robh@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250715031717.GA4144523-robh@kernel.org>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
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

SGkgUm9iLAoKT24gNy8xNS8yNSAwNToxNywgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gRnJpLCBK
dWwgMTEsIDIwMjUgYXQgMDQ6NDg6NTRQTSArMDIwMCwgQ2zDqW1lbnQgTGUgR29mZmljIHdyb3Rl
Ogo+PiBSQ0MgaXMgYWJsZSB0byBjaGVjayB0aGUgYXZhaWxhYmlsaXR5IG9mIGEgY2xvY2suCj4+
IEFsbG93IHRvIHF1ZXJ5IHRoZSBSQ0Mgd2l0aCBhIGZpcmV3YWxsIElELgo+IAo+IElmIGl0IGlz
IHRpZWQgdG8gYSBjbG9jaywgZG8gd2UgbmVlZCBhbm90aGVyIHByb3ZpZGVyPyBXZSBoYXZlIHRo
ZQo+ICJwcm90ZWN0ZWQgY2xvY2tzIiB0aGluZywgYnV0IHRoYXQgbWlnaHQgYmUgYSBiaXQgZGlm
ZmVyZW50LgoKV2hhdCBJIHVuZGVyc3RhbmQgaXMgdGhhdCB0aGUgInByb3RlY3RlZC1jbG9ja3Mi
IGxpc3QgaXMgaGVyZSB0byBmbGFnIApjbG9ja3MgYXMgcHJvdGVjdGVkIGFuZCB0aGUgYWNjZXNz
IHRvIGl0IGFuZCBpdHMgcmVnaXN0ZXIgYnkgdGhlIGtlcm5lbCAKbWF5IGNhdXNlIHRoZSByZWJv
b3Qgb2YgdGhlIHBsYXRmb3JtLgpUaGUgY3VycmVudCBxY29tIGltcGxlbWVudGF0aW9uIGp1c3Qg
ZHJvcCBjbG9ja3Mgc28gbm8gb25lIGNhbiBhY2Nlc3MgdG8gCml0IGFmdGVyIHRoZXkgYXJlIHJl
Z2lzdGVyZWQuCkZvciBteSB1bmRlcnN0YW5kaW5nIGlmIHlvdSBrbm93IHdoeSB0aGUga2VybmVs
IG5lZWRzIHRoZSBpbmZvcm1hdGlvbiAKInRoaXMgY2xvY2sgY2FuJ3QgYmUgYWNjZXNzZWQiLCBJ
IHdvdWxkIGJlIGludGVyZXN0ZWQvCgpXaXRob3V0IHRoZSBTVE0zMiBSQ0MgZHJpdmVyIG1vZGlm
aWNhdGlvbiwgaWYgd2UgYWNjZXNzIHRvIHRoZSBERFJQRVJGTSAKcGVyaXBoZXJhbCByZWdpc3Rl
ciB3aGVuIHRoZSBjbG9jayBpcyBzZWN1cmVkIHdlIGZhY2UgdGhlIHNhbWUgaXNzdWUsIHdlIApl
bmQgdXAgcmVib290aW5nIHRoZSBwbGF0Zm9ybS4KCk91ciBSQ0MgcGVyaXBoZXJhbCBpcyBhYmxl
IHRvIGtub3cgaWYgb3VyIEREUiBzdWJzeXN0ZW0gY2xvY2sgKHRoYXQgaXMgCnNoYXJlZCBiZXR3
ZWVuIG91ciBERFIgY29udHJvbGxlciBhbmQgRERSUEVSRk0gcGVyaXBoZXJhbCkgaXMgc2VjdXJl
ZCBvciAKbm90LCBzbyB3ZSBjYW4gYWNjZXNzIG9yIG5vdCB0byBERFJQRVJGTSByZWdpc3Rlci4K
SXQgaXMgdGhlIGFpbSBvZiB0aGUgImFjY2Vzcy1jb250cm9sbGVyIiByZWxhdGVkIGNvZGUuCgpD
b3JyZWN0IG1lIGlmIEknbSB3cm9uZyBidXQgdG8gbWUgdGhlIGRpZmZlcmVuY2UgbWlnaHQgYmUg
dGhhdCB0aGUgCiJwcm90ZWN0ZWQtY2xvY2tzIiBwcm9wZXJ0eSBpcyBoZXJlIHRvIGxpc3QgaW4g
dGhlIERUIGNsb2NrcyB0aGF0IGNhbid0IApiZSBhY2Nlc3NlZCBhbmQgdGhhdCB0aGlzIGluZm9y
bWF0aW9uIGlzIG5vdCBpbiB0aGUgaGFyZHdhcmUuCgpJbiB0aGUgU1RNMzJNUDI1IHdlIGFyZSBh
YmxlIHRvIGdldCB0aGlzIGluZm9ybWF0aW9uIHRocm91Z2ggUkNDIApkZWRpY2F0ZWQgcmVnaXN0
ZXIuIFlvdSBjYW4gbG9vayBhdCB0aGUgYHN0bTMyX3JjY19nZXRfYWNjZXNzKClgIApmdW5jdGlv
biBpbiBkcml2ZXJzL2Nsay9zdG0zMi9jbGstc3RtMzJtcDI1LmMgaWYgbmVlZGVkLgoKQmVzdCBy
ZWdhcmRzLApDbMOpbWVudApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
