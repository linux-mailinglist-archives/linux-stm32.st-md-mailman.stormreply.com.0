Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE28FB0C7F6
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jul 2025 17:47:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6913CC32E8F;
	Mon, 21 Jul 2025 15:47:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A352EC349C7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 15:47:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LDt62k020590;
 Mon, 21 Jul 2025 17:47:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 P1ZuzEzRREiwLydWZlhzK+dlWBAxlIhEYuf20M8l1eU=; b=3xbpjXFnyMs0SC5A
 i2NSTVksJj+qckbzFNDpYbQCrsNAuBlK574aC/pSgp9d95ovb31I7jR/KuivJ7Z7
 vrlAF+Tjwygg8on9g8Nk5p0sTilTUvoy9mumnLwxZBwjmm5NG/irpmq9NNUmkiFu
 0wrn5CM/J1V4wrupgXWM38kPE8qB0Av7ZcgyJMY415Yd2dEUQK7cZuJkMRI5BKp/
 DW2K9XPdF4dI97k5wGLSQiynVfnweB2tJ1SZhLZSWwfrcbbY7ZWOHj3Oq1ycURsO
 5wh+4Djrh+l9cQH6KWUDkkJClULDqjLBmk0Ufn2f8W5yGH6gc1qtD7k05Ef/cmMt
 a3Wd6g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4800g8hn2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jul 2025 17:47:23 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 822DF4007D;
 Mon, 21 Jul 2025 17:46:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 36E51768F09;
 Mon, 21 Jul 2025 17:44:23 +0200 (CEST)
Received: from [10.252.5.249] (10.252.5.249) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 17:44:21 +0200
Message-ID: <162aa05f-69df-4607-bf47-fbec60589f95@foss.st.com>
Date: Mon, 21 Jul 2025 17:44:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
 <20250711-ddrperfm-upstream-v2-6-cdece720348f@foss.st.com>
 <20250715032020.GB4144523-robh@kernel.org>
 <ae960a16-65ad-4b22-b9fb-89efbffacd3e@foss.st.com>
 <20250715150224.GA1319886-robh@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250715150224.GA1319886-robh@kernel.org>
X-Originating-IP: [10.252.5.249]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_02,2025-03-28_01
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
Subject: Re: [Linux-stm32] [PATCH v2 06/16] arm64: dts: st: add LPDDR
 channel to stm32mp257f-dk board
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

SGkgUm9iCgpPbiA3LzE1LzI1IDE3OjAyLCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBUdWUsIEp1
bCAxNSwgMjAyNSBhdCAxMDozMjowOUFNICswMjAwLCBDbGVtZW50IExFIEdPRkZJQyB3cm90ZToK
Pj4gSGkgUm9iLAo+Pgo+PiBUaGFua3MgZm9yIHRoZSByZXZpZXcgIQo+Pgo+PiBPbiA3LzE1LzI1
IDA1OjIwLCBSb2IgSGVycmluZyB3cm90ZToKPj4+IE9uIEZyaSwgSnVsIDExLCAyMDI1IGF0IDA0
OjQ4OjU4UE0gKzAyMDAsIENsw6ltZW50IExlIEdvZmZpYyB3cm90ZToKPj4+PiBBZGQgMzJiaXRz
IExQRERSNCBjaGFubmVsIHRvIHRoZSBzdG0zMm1wMjU3Zi1kayBib2FyZC4KPj4+Pgo+Pj4+IFNp
Z25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0
LmNvbT4KPj4+PiAtLS0KPj4+PiAgICBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdm
LWRrLmR0cyB8IDcgKysrKysrKwo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAy
NTdmLWRrLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZGsuZHRzCj4+
Pj4gaW5kZXggYTI3OGExZTNjZTAzLi5hOTdiNDFmMTRlY2MgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJj
aC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU3Zi1kay5kdHMKPj4+PiArKysgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdmLWRrLmR0cwo+Pj4+IEBAIC01NCw2ICs1NCwxMyBA
QCBsZWQtYmx1ZSB7Cj4+Pj4gICAgCQl9Owo+Pj4+ICAgIAl9Owo+Pj4+ICsJbHBkZHJfY2hhbm5l
bDogbHBkZHI0LWNoYW5uZWwgewo+Pj4+ICsJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+Pj4+ICsJ
CSNzaXplLWNlbGxzID0gPDA+Owo+Pj4+ICsJCWNvbXBhdGlibGUgPSAiamVkZWMsbHBkZHI0LWNo
YW5uZWwiOwo+Pj4KPj4+IE5vdCB0ZXN0ZWQgYmVjYXVzZSB0aGlzIGRvZXNuJ3QgbWF0Y2ggdGhl
IGJpbmRpbmcuCj4+Cj4+IEhtbSwgSSd2ZSB0ZXN0ZWQgd2l0aCBtYWtlIGR0YnNfY2hlY2sgYW5k
IGR0X2JpbmRpbmdfY2hlY2sgYW5kIGl0IGRpZG4ndAo+PiBjb21wbGFpbiBvbiBteSBzaWRlLgo+
PiBXaGF0IEkgaGF2ZSBtaXNzID8KPiAKPiBPaCB3YWl0LCB3ZSBhbHJlYWR5IGhhdmUgYSBiaW5k
aW5nIGZvciB0aGF0LiBJIHdhcyBjb25mdXNlZCB3aXRoIHlvdXIKPiBhZGRpbmcgImplZGVjLGRk
cjQtY2hhbm5lbCIuIFNvcnJ5IGZvciB0aGUgbm9pc2UuCgpJdCdzIGZpbmUgbm8gd29ycmllcy4K
SG93ZXZlciwgaW4gdGhlIHBhdGNoIDgsIEkgYWRkIHRoZSBwcm9wZXJ0eSAibWVtb3J5LWNoYW5u
ZWwiIHRoYXQgaXMgbm90IAppbiB0aGUgZHRzY2hlbWEgcmVwbyBhbmQgSSBkaWRuJ3QgZ2V0IGFu
eSByZXZpZXdzIG9uIGl0LgpJcyBpdCBvayBmb3IgeW91ID8gb3IgbWF5YmUgc2hvdWxkIHdlIGRp
c2N1c3MgaXQgb3ZlciB0aGVyZSA/CkkgY2FuIHRyeSB0byBkbyBhIFBSIG9uIHRoZSBkdHNjaGVt
YSB0aG91Z2h0LCBpZiBpdCBpcyBvay4KCkJlc3QgcmVnYXJkcywKQ2zDqW1lbnQKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
