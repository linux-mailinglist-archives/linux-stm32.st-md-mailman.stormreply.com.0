Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D9BA45C01
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2025 11:39:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B602C7A830;
	Wed, 26 Feb 2025 10:39:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D50B8C78F8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2025 10:39:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q8p0Zu015440;
 Wed, 26 Feb 2025 11:39:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 r6EeS/1e2mk1YAgnjgtBzqRGy/8kMpjtGs49piq0D0c=; b=L5QE9qAHsY8p2q2y
 GK0BVRIAOPU8OoNVa7s5NOyCOPheqBGKtNDvftIP7T4ipdE0mnTg65cidM8ReFuk
 7C2yUAr/qqFd/1fLzL7KL39sGOn9EyWyOWNy5qoSfWkvJ+0wbQUlHGWxK869loTx
 rya5AyDXShceg/vx3gmE6B83sZWoB79G0jqZhHpXDInQAs+qCR4E5W8AxT66XVYv
 xduJw6vKpU5l1vGHMuTqTnrprUQ194zHSEUIZsVe5OHVosFYp3kCa0iTgOGLIKeD
 h5yvghK+Mnn5oGDguugDLCkyI5X78jOsNq88slAI+GFPE7Dx9vtIU9uTuDyr32Wl
 gqgxBw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 451psubfhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2025 11:39:10 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4A22A4004C;
 Wed, 26 Feb 2025 11:38:01 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 252624E1E64;
 Wed, 26 Feb 2025 10:33:37 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 10:33:36 +0100
Message-ID: <988667a4-4bc0-4594-8dfd-a7b652b149b2@foss.st.com>
Date: Wed, 26 Feb 2025 10:33:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Clement LE GOFFIC
 <clement.legoffic@foss.st.com>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
 <20250225-hdp-upstream-v1-7-9d049c65330a@foss.st.com>
 <418a80a9-8c08-4dd1-bf49-1bd7378321aa@kernel.org>
 <b257aa79-6ca9-4f57-988a-ec00225992ab@foss.st.com>
 <b57e3c9e-244e-435b-8a7b-cf90f3a973b3@kernel.org>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <b57e3c9e-244e-435b-8a7b-cf90f3a973b3@kernel.org>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_02,2025-02-26_01,2024-11-22_01
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 7/9] ARM: dts: stm32: add Hardware debug
 port (HDP) on stm32mp25
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

SGkgS3J6eXN6dG9mCgpPbiAyLzI2LzI1IDA4OjIzLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3Rl
Ogo+IE9uIDI1LzAyLzIwMjUgMTc6MDksIENsZW1lbnQgTEUgR09GRklDIHdyb3RlOgo+PiBPbiAy
LzI1LzI1IDE0OjA1LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+Pj4gT24gMjUvMDIvMjAy
NSAwOTo0OCwgQ2zDqW1lbnQgTGUgR29mZmljIHdyb3RlOgo+Pj4+IEFkZCB0aGUgaGRwIGRldmlj
ZXRyZWUgbm9kZSBmb3Igc3RtMzJtcDI1IFNvQyBmYW1pbHkKPj4+Pgo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KPj4+
PiAtLS0KPj4+PiAgICBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaSB8IDcg
KysrKysrKwo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+
IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaSBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpCj4+Pj4gaW5kZXggZjNjNmNkZmQ3
MDA4Li40M2FhZWQ0ZmNmMTAgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9z
dC9zdG0zMm1wMjUxLmR0c2kKPj4+PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMy
bXAyNTEuZHRzaQo+Pj4+IEBAIC05MTgsNiArOTE4LDEzIEBAIHBhY2thZ2Vfb3RwQDFlOCB7Cj4+
Pj4gICAgCQkJfTsKPj4+PiAgICAJCX07Cj4+Pj4gICAgCj4+Pj4gKwkJaGRwOiBwaW5jdHJsQDQ0
MDkwMDAwIHsKPj4+PiArCQkJY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wLWhkcCI7Cj4+Pgo+Pj4g
U28gaGVyZSBhZ2FpbiAtIHlvdSBoYXZlIHN0bTMybXAyNTEgU29DLCBidXQgdXNlIGVudGlyZWx5
IGRpZmZlcmVudAo+Pj4gY29tcGF0aWJsZS4KPj4KPj4gT2sgc28gSSB3aWxsIHVzZSAic3Qsc3Rt
MzJtcDE1LWhkcCIKPiAKPiAKPiBUaGlzIG1lYW5zIHRoaXMgaXMgc3RtMzJtcDE1IFNvQy4gSSBk
byBub3Qgc2VlIHN1Y2ggU29DIG9uIGxpc3Qgb2YgeW91cgo+IFNvQ3MgaW4gYmluZGluZ3MuIFdo
YXQncyBtb3JlLCB0aGVyZSBhcmUgbm8gYmluZGluZ3MgZm9yIG90aGVyIFNvQwo+IGNvbXBvbmVu
dHMgZm9yIHN0bTMybXAxNSEKClllcyBzdG0zMm1wMTUgaXMgbm90IGEgInJlYWwgU29DIi4gSSBh
Z3JlZSB0aGF0IGF0IHRoZSBiZWdpbm5pbmcgb2YgdGhlIApTVE0zMiBzdG9yeSB3ZSBkaWRuJ3Qg
aGF2ZSBhIGNsZWFyIHJ1bGUvdmlldyB0byBjb3JyZWN0bHkgbmFtaW5nIG91ciAKY29tcGF0aWJs
ZS4gV2UgdHJpZWQgdG8gaW1wcm92ZSB0aGUgc2l0dWF0aW9uIHRvIGF2b2lkIGNvbXBhdGlibGUg
bGlrZSAKInN0LHN0bTMyIiwgInN0LHN0bTMybXAiIG9yICJzdCxzdG0zMm1wMSIuIFNvIHdlIGlu
dHJvZHVjZWQgCiJzdCxzdG0zMm1wMTMiLCAic3Qsc3RtMzJtcDE1IiBvciAic3Qsc3RtMzJtcDI1
IiBmb3IgbmV3IGRyaXZlcnMuIFNvIHllcyAKaXQgcmVwcmVzZW50cyBhIFNvQyBmYW1pbHkgYW5k
IG5vdCBhIHJlYWwgU29DLiBXZSBoYXZlbid0IGhhZCBtdWNoIApuZWdhdGl2ZSBmZWVkYmFjayBp
dC4KCkJ1dCwgaWYgaXQncyBub3QgY2xlYW4gdG8gZG8gaXQgaW4gdGhpcyB3YXksIGxldHMgZGVm
aW5lIFNvQyBjb21wYXRpYmxlIApmb3IgYW55IG5ldyBkcml2ZXIuCkZvciB0aGUgSERQIGNhc2Ug
aXQgaXM6ICJzdCxzdG0zMm1wMTU3IiBhbmQgdXNlZCBmb3IgU1RNMzJNUDEzLCAKU1RNMzJNUDE1
IGVuZCBTVE0zMk1QMjUgU29DIGZhbWlsaWVzIChpZiBkcml2ZXIgaXMgdGhlIHNhbWUgZm9yIGFs
bCAKdGhvc2UgU29DcykuCgpyZWdhcmRzCkFsZXgKCgo+IFNvbWV0aGluZyBpcyBoZXJlIG5vdCBt
YXRjaGluZyAtIHRoaXMgY2hhbmdlLCB0aGlzIERUU0ksIHRvcCBsZXZlbAo+IGJpbmRpbmdzIG9y
IGFsbCBvZiB5b3VyIFNvQyBkZXZpY2UvYmxvY2tzIGJpbmRpbmdzLgo+IAo+IAo+IAo+IEJlc3Qg
cmVnYXJkcywKPiBLcnp5c3p0b2YKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
