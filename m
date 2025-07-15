Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBE3B05500
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jul 2025 10:35:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 892C7C3F933;
	Tue, 15 Jul 2025 08:35:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C03B0C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 08:35:09 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F7msBA003670;
 Tue, 15 Jul 2025 10:34:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 FBjN96Vc9/YNSk2Vr1T4bmQLG/82VFC8eOZQTen3I6w=; b=6Kz8zsOss7e1leYL
 0yWjGq2eCmjxyopEMUGq5nLk/lVCP/5UuwaEGdk9eHB1lVOA14Y5v8e7v2604bDj
 9dOg4+XxUcy4mGdA849Vq7OwKKFV7ZLQHQTB+p/eKdHt2M+5IPYOA4d4i+X1PUGZ
 XEy/fzBIOvT/BlICLrxEkHQXkHWIGMcf1b4i2aDBkhx0i7rknVKNeiGM0syvgazC
 Im6F3srR/14ZUbNY+qlLPq/qN4Lln86FmW4SZslYjcNMM8HxZdKK9MTvAQEsn88e
 prIiVBPYZ9tXi8+eZrm+cwnqSWVVmpKf//bprensYcG5yp7g/iwgnuWZAeO20PrH
 uNtETQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47ud4mmg2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jul 2025 10:34:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A93E84002D;
 Tue, 15 Jul 2025 10:33:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C23DEB63555;
 Tue, 15 Jul 2025 10:32:10 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 10:32:09 +0200
Message-ID: <ae960a16-65ad-4b22-b9fb-89efbffacd3e@foss.st.com>
Date: Tue, 15 Jul 2025 10:32:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
 <20250711-ddrperfm-upstream-v2-6-cdece720348f@foss.st.com>
 <20250715032020.GB4144523-robh@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250715032020.GB4144523-robh@kernel.org>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
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

SGkgUm9iLAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3ICEKCk9uIDcvMTUvMjUgMDU6MjAsIFJvYiBI
ZXJyaW5nIHdyb3RlOgo+IE9uIEZyaSwgSnVsIDExLCAyMDI1IGF0IDA0OjQ4OjU4UE0gKzAyMDAs
IENsw6ltZW50IExlIEdvZmZpYyB3cm90ZToKPj4gQWRkIDMyYml0cyBMUEREUjQgY2hhbm5lbCB0
byB0aGUgc3RtMzJtcDI1N2YtZGsgYm9hcmQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50
IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KPj4gLS0tCj4+ICAgYXJj
aC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU3Zi1kay5kdHMgfCA3ICsrKysrKysKPj4gICAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdmLWRrLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
c3Qvc3RtMzJtcDI1N2YtZGsuZHRzCj4+IGluZGV4IGEyNzhhMWUzY2UwMy4uYTk3YjQxZjE0ZWNj
IDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdmLWRrLmR0
cwo+PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdmLWRrLmR0cwo+PiBA
QCAtNTQsNiArNTQsMTMgQEAgbGVkLWJsdWUgewo+PiAgIAkJfTsKPj4gICAJfTsKPj4gICAKPj4g
KwlscGRkcl9jaGFubmVsOiBscGRkcjQtY2hhbm5lbCB7Cj4+ICsJCSNhZGRyZXNzLWNlbGxzID0g
PDE+Owo+PiArCQkjc2l6ZS1jZWxscyA9IDwwPjsKPj4gKwkJY29tcGF0aWJsZSA9ICJqZWRlYyxs
cGRkcjQtY2hhbm5lbCI7Cj4gCj4gTm90IHRlc3RlZCBiZWNhdXNlIHRoaXMgZG9lc24ndCBtYXRj
aCB0aGUgYmluZGluZy4KCkhtbSwgSSd2ZSB0ZXN0ZWQgd2l0aCBtYWtlIGR0YnNfY2hlY2sgYW5k
IGR0X2JpbmRpbmdfY2hlY2sgYW5kIGl0IGRpZG4ndCAKY29tcGxhaW4gb24gbXkgc2lkZS4KV2hh
dCBJIGhhdmUgbWlzcyA/CgoKPiAKPj4gKwkJaW8td2lkdGggPSA8MzI+Owo+PiArCX07Cj4gCj4g
V2hhdCB3b3VsZCBtdWx0aXBsZSBjaGFubmVscyBsb29rIGxpa2U/IEkgdGhpbmsgdGhpcyBuZWVk
cyBzb21lIHdvcmsuCj4gTGlrZSBpdCBzaG91bGQgcGVyaGFwcyBiZSB3aXRoaW4gdGhlIG1lbW9y
eSBub2RlLiBJdCdzIGEgbG90IHRvIGp1c3Qgc2F5Cj4gMzItYml0IExQRERSNCB4MS4KCkkgZ3Vl
c3Mgc29tZXRoaW5nIGxpa2UgdHdvIGNoYW5uZWxzIG5vZGUgZm9sbG93aW5nIGVhY2ggb3RoZXIg
aW4gdGhlIERULgpJdCBjYW4gYmUgaW4gdGhlIG1lbW9yeSBub2RlIEkgZG9uJ3Qga25vdyB3aGF0
IGFyZSB0aGUgc3Rha2VzIGhlcmUuCkkgd2FzIGluc3BpcmVkIGJ5IHRoZSBscGRkciBub2RlIGhl
cmU6CmFyY2gvYXJtL2Jvb3QvZHRzL3NhbXN1bmcvZXh5bm9zNTQyMi1vZHJvaWQtY29yZS5kdHNp
OjMzNgoKQmVzdCByZWdhcmQsCkNsw6ltZW50Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
