Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C79D6B0552D
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jul 2025 10:42:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 731F8C3F938;
	Tue, 15 Jul 2025 08:42:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F234CC3F933
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 08:42:34 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F8GPxQ012267;
 Tue, 15 Jul 2025 10:42:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Mr1pLyz9BvSAR5yjnoGZ7OEkVotMBP2RsFtH4ZIuR4Y=; b=frANLRL/vezuJ7nx
 79QOJfNg+ci9dQV7bhQZRltly51Ji+djlNm9feefndwEMHxSS/MTRwFlS9QEk2/S
 tgh6u5R+21UvSPexZZ3YiRvurVFs0EyJS5TSenfvPRNJ+IP4cUsjLIwlBIUVNIZK
 u2gsUnIfxE0NSHkgJY6fzw8Xz13cB2OTXl3XovGVdlg3I3w9BA+jolg9e9Pqb9dN
 J4IWgz0YA72zdYpO2g3XTzJB//awG26ubXFrhruQiZZt/aHu3Pg/BGxuIGqxchGr
 lCjn4sN1GFlYhBej+ruBwqZT+5iZgldLjZYOa7OpnWx1ysXDaZ8zF2lr2wv6qWRr
 O288iw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47ucu9c0wr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jul 2025 10:42:22 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5BED14004B;
 Tue, 15 Jul 2025 10:40:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 55B52AE6FCB;
 Tue, 15 Jul 2025 10:40:15 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 10:40:14 +0200
Message-ID: <a1d1970c-da5d-4b4a-a69a-bf9da7a07be2@foss.st.com>
Date: Tue, 15 Jul 2025 10:40:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
 <20250711-ddrperfm-upstream-v2-2-cdece720348f@foss.st.com>
 <20250715031717.GA4144523-robh@kernel.org>
 <765eccdc-7d51-42c6-bcba-07813077fc1d@foss.st.com>
 <20250715-belligerent-savvy-marten-fbd1a5@krzk-bin>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20250715-belligerent-savvy-marten-fbd1a5@krzk-bin>
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, linux-doc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-perf-users@vger.kernel.org, Le Goffic <legoffic.clement@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

CgpPbiA3LzE1LzI1IDEwOjE5LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IE9uIFR1ZSwg
SnVsIDE1LCAyMDI1IGF0IDA5OjM3OjAwQU0gKzAyMDAsIEdhdGllbiBDSEVWQUxMSUVSIHdyb3Rl
Ogo+PiBIZWxsbyBSb2IsCj4+Cj4+IE9uIDcvMTUvMjUgMDU6MTcsIFJvYiBIZXJyaW5nIHdyb3Rl
Ogo+Pj4gT24gRnJpLCBKdWwgMTEsIDIwMjUgYXQgMDQ6NDg6NTRQTSArMDIwMCwgQ2zDqW1lbnQg
TGUgR29mZmljIHdyb3RlOgo+Pj4+IFJDQyBpcyBhYmxlIHRvIGNoZWNrIHRoZSBhdmFpbGFiaWxp
dHkgb2YgYSBjbG9jay4KPj4+PiBBbGxvdyB0byBxdWVyeSB0aGUgUkNDIHdpdGggYSBmaXJld2Fs
bCBJRC4KPj4+Cj4+PiBJZiBpdCBpcyB0aWVkIHRvIGEgY2xvY2ssIGRvIHdlIG5lZWQgYW5vdGhl
ciBwcm92aWRlcj8gV2UgaGF2ZSB0aGUKPj4+ICJwcm90ZWN0ZWQgY2xvY2tzIiB0aGluZywgYnV0
IHRoYXQgbWlnaHQgYmUgYSBiaXQgZGlmZmVyZW50Lgo+Pj4KPj4KPj4gSSBjb3VsZG4ndCBmaW5k
IGFueSByZWZlcmVuY2UgdG8gInByb3RlY3RlZC1jbG9ja3MiIG91dHNpZGUgb2YgcWNvbQo+PiBy
ZWxhdGVkIGNvZGUsIGlzIHRoZXJlIGEgZG9jdW1lbnRhdGlvbj8gKENvdWxkbid0IGZpbmQgaXQg
aW4KPj4gY2xvY2tzLnlhbWwpLgo+IAo+IEh1aD8gcHJvdGVjdGVkLWNsb2NrcyBpcyBpbiBjbG9j
a3MueWFtbC4uLiBJdCBpcyB0aGVyZSB3aXRoIGFuIGV4cGxhbmF0aW9uLgo+IAo+IEJlc3QgcmVn
YXJkcywKPiBLcnp5c3p0b2YKPiAKCkFoLCBJIHdhcyBsb29raW5nIGF0IFJvYidzIHJlcG8sIG15
IGJhZC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
