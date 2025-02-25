Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3058A447F1
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 18:26:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99A12C78F9F;
	Tue, 25 Feb 2025 17:26:25 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF188C78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 17:26:24 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PFPIL9001949;
 Tue, 25 Feb 2025 18:26:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Q8I40M+53DR3Tk1rSGwdSEzVyqyWVWvkoMDFoF2R850=; b=2oSi2GojCU5+RwGJ
 Q+uzD70ryBhw0LlAMBITvSRLhKvcumfFP4tndQxCZmvAemA//R1WNnm/f8c6UZvJ
 kkCSGBwdrQ8ymB4zUaNgSyyAjgJquoFfAqP2iCt0Dxf48sPWusZs41rAx/xITrNT
 X89UACnAxkuDiSHLfvQ7gctCcRiAb8YM+kVOVJiW5jodhLXRcjxbWmGKEFoYhPso
 DwbU7TC+dOmE2DiPcvi+KSV8cUR8X9BcZezuwT0ei4A4xUhxglJb2eyMm5/1SC/x
 oG9KAp58UvLQsJ40sfc3/h1X8b2zMKHuL2Ri6pMZseR/X5pE7Nj5pWFGUOTjYh/y
 D3cqsg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512spctmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Feb 2025 18:26:12 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7277740044;
 Tue, 25 Feb 2025 18:25:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F0ED047B9CA;
 Tue, 25 Feb 2025 17:05:15 +0100 (CET)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 17:05:15 +0100
Message-ID: <b074941f-3c6a-4b98-a00e-d22d18280ef5@foss.st.com>
Date: Tue, 25 Feb 2025 17:05:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
 <20250225-hdp-upstream-v1-3-9d049c65330a@foss.st.com>
 <1990c649-668e-4ae9-82b5-ed9931f41ec4@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <1990c649-668e-4ae9-82b5-ed9931f41ec4@kernel.org>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_05,2025-02-25_03,2024-11-22_01
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 3/9] pinctrl: stm32: Introduce HDP driver
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

T24gMi8yNS8yNSAxMzo1OSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAyNS8wMi8y
MDI1IDA5OjQ4LCBDbMOpbWVudCBMZSBHb2ZmaWMgd3JvdGU6Cj4+IFRoaXMgcGF0Y2ggaW50cm9k
dWNlIHRoZSBkcml2ZXIgZm9yIHRoZSBIYXJkd2FyZSBEZWJ1ZyBQb3J0IGF2YWlsYWJsZSBvbgo+
IAo+IFBsZWFzZSBkbyBub3QgdXNlICJUaGlzIGNvbW1pdC9wYXRjaC9jaGFuZ2UiLCBidXQgaW1w
ZXJhdGl2ZSBtb29kLiBTZWUKPiBsb25nZXIgZXhwbGFuYXRpb24gaGVyZToKPiBodHRwczovL2Vs
aXhpci5ib290bGluLmNvbS9saW51eC92NS4xNy4xL3NvdXJjZS9Eb2N1bWVudGF0aW9uL3Byb2Nl
c3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdCNMOTUKCk9rCgo+IAo+PiBTVE0zMk1QIHBsYXRmb3Jt
cy4gVGhlIEhEUCBhbGxvd3MgdGhlIG9ic2VydmF0aW9uIG9mIGludGVybmFsIFNvQwo+PiBzaWdu
YWxzIGJ5IHVzaW5nIG11bHRpcGxleGVycy4gRWFjaCBIRFAgcG9ydCBjYW4gcHJvdmlkZSB1cCB0
byAxNgo+PiBpbnRlcm5hbCBzaWduYWxzIChvbmUgb2YgdGhlbSBjYW4gYmUgc29mdHdhcmUgY29u
dHJvbGxlZCBhcyBhIEdQTykKPiAKPiAKPiAKPiAuLi4uCj4gCj4+ICsKPj4gK3N0YXRpYyBpbnQg
c3RtMzJfaGRwX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+PiArewo+PiArCXN0cnVjdCBz
dG0zMl9oZHAgKmhkcCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+PiArCj4+ICsJaGRwLT5ncG9z
ZXRfY29uZiA9IHJlYWRsX3JlbGF4ZWQoaGRwLT5iYXNlICsgSERQX0dQT1NFVCk7Cj4+ICsKPj4g
KwlwaW5jdHJsX3BtX3NlbGVjdF9zbGVlcF9zdGF0ZShkZXYpOwo+PiArCj4+ICsJY2xrX2Rpc2Fi
bGVfdW5wcmVwYXJlKGhkcC0+Y2xrKTsKPj4gKwo+PiArCXJldHVybiAwOwo+PiArfQo+PiArCj4+
ICtzdGF0aWMgaW50IHN0bTMyX2hkcF9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQo+PiArewo+
PiArCXN0cnVjdCBzdG0zMl9oZHAgKmhkcCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+PiArCWlu
dCBlcnI7Cj4+ICsKPj4gKwllcnIgPSBjbGtfcHJlcGFyZV9lbmFibGUoaGRwLT5jbGspOwo+PiAr
CWlmIChlcnIpCj4+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGhkcC0+ZGV2LCBlcnIsICJGYWls
ZWQgdG8gcHJlcGFyZV9lbmFibGUgY2xrIik7Cj4gCj4gCj4gVGhhdCdzIHdyb25nLCBpdCBpcyBu
b3QgYSBwcm9iZSBwYXRoLgoKSW5kZWVkCgo+IAo+PiArCj4+ICsJd3JpdGVsX3JlbGF4ZWQoSERQ
X0NUUkxfRU5BQkxFLCBoZHAtPmJhc2UgKyBIRFBfQ1RSTCk7Cj4+ICsJd3JpdGVsX3JlbGF4ZWQo
aGRwLT5ncG9zZXRfY29uZiwgaGRwLT5iYXNlICsgSERQX0dQT1NFVCk7Cj4+ICsJd3JpdGVsX3Jl
bGF4ZWQoaGRwLT5tdXhfY29uZiwgaGRwLT5iYXNlICsgSERQX01VWCk7Cj4+ICsKPj4gKwlwaW5j
dHJsX3BtX3NlbGVjdF9kZWZhdWx0X3N0YXRlKGRldik7Cj4+ICsKPj4gKwlyZXR1cm4gMDsKPj4g
K30KPj4gKwo+PiArREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTKHN0bTMyX2hkcF9wbV9vcHMsIHN0
bTMyX2hkcF9zdXNwZW5kLCBzdG0zMl9oZHBfcmVzdW1lKTsKPj4gKwo+PiArc3RhdGljIHN0cnVj
dCBwbGF0Zm9ybV9kcml2ZXIgc3RtMzJfaGRwX2RyaXZlciA9IHsKPj4gKwkucHJvYmUgPSBzdG0z
Ml9oZHBfcHJvYmUsCj4+ICsJLnJlbW92ZSA9IHN0bTMyX2hkcF9yZW1vdmUsCj4+ICsJLmRyaXZl
ciA9IHsKPj4gKwkJLm5hbWUgPSBEUklWRVJfTkFNRSwKPj4gKwkJLnBtID0gcG1fc2xlZXBfcHRy
KCZzdG0zMl9oZHBfcG1fb3BzKSwKPj4gKwkJLm9mX21hdGNoX3RhYmxlID0gc3RtMzJfaGRwX29m
X21hdGNoLAo+PiArCX0KPj4gK307Cj4+ICsKPj4gK21vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoc3Rt
MzJfaGRwX2RyaXZlcik7Cj4+ICsKPj4gK01PRFVMRV9BTElBUygicGxhdGZvcm06IiBEUklWRVJf
TkFNRSk7Cj4gCj4gCj4gWW91IHNob3VsZCBub3QgbmVlZCBNT0RVTEVfQUxJQVMoKSBpbiBub3Jt
YWwgY2FzZXMuIElmIHlvdSBuZWVkIGl0LAo+IHVzdWFsbHkgaXQgbWVhbnMgeW91ciBkZXZpY2Ug
SUQgdGFibGUgaXMgd3JvbmcgKGUuZy4gbWlzc2VzIGVpdGhlcgo+IGVudHJpZXMgb3IgTU9EVUxF
X0RFVklDRV9UQUJMRSgpKS4gTU9EVUxFX0FMSUFTKCkgaXMgbm90IGEgc3Vic3RpdHV0ZQo+IGZv
ciBpbmNvbXBsZXRlIElEIHRhYmxlLgo+IAoKT2sKCj4gCj4gCj4gQmVzdCByZWdhcmRzLAo+IEty
enlzenRvZgoKQmVzdCByZWdhcmRzLAoKQ2zDqW1lbnQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
