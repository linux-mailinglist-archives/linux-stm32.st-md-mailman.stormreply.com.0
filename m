Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1961FA445DF
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 17:22:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8F2AC7A83C;
	Tue, 25 Feb 2025 16:22:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA4DFC78F9C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 16:22:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PFCrWC016958;
 Tue, 25 Feb 2025 17:22:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 5gxQFyJw5oEPlJrNAKF6ERcGuSNk0FxInJ0AAbQCAlg=; b=OxOtEUAEemJ7xmT+
 SswcTnH0XnACl/+5vGnoJ91/aKrxA90SM9ZdHJqoMEaEudZ6bsOJwu3/FOree1r0
 u1sILtXwawuzUyOXgy6Jc9aDmZ6KlMF99ul6mlrxWrDoN70HPnZgGdpmLaTDtyUT
 Be5TL9/MWjIHuQwsgg36J5fqS1JNCfg55zZRsRzTEhA/o4B8OE9IauTObLlzdED/
 0abBmAfOzmyTgTLs0wV0WbBMFaaWYlHD2p/BGylTlISso2/VYqTLrALQ0iBLKg/H
 sNfysYZ7fk0TpBRr87LV27Iuy2hijSOzD07iIvkSIgSKxp3Ewg0n4p9dd3NKjTdB
 lNE8Og==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512sqvfhp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Feb 2025 17:22:30 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 88F5240046;
 Tue, 25 Feb 2025 17:21:13 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2597C5C0CD7;
 Tue, 25 Feb 2025 15:57:51 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 15:57:50 +0100
Received: from [10.48.86.222] (10.48.86.222) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 15:57:50 +0100
Message-ID: <2df7bdd9-5072-4a9a-b142-1e1e3f20130c@foss.st.com>
Date: Tue, 25 Feb 2025 15:57:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20250224180150.3689638-1-fabrice.gasnier@foss.st.com>
 <20250224180150.3689638-5-fabrice.gasnier@foss.st.com>
 <20250225-purring-herring-of-reputation-1aed2f@krzk-bin>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20250225-purring-herring-of-reputation-1aed2f@krzk-bin>
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_05,2025-02-25_03,2024-11-22_01
Cc: robh@kernel.org, conor+dt@kernel.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com, lee@kernel.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 ukleinek@kernel.org, linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org,
 will@kernel.org, tglx@linutronix.de, jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH 4/8] clocksource: stm32-lptimer: add
	stm32mp25 support
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMi8yNS8yNSAxMzowMiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiBNb24sIEZl
YiAyNCwgMjAyNSBhdCAwNzowMTo0NlBNICswMTAwLCBGYWJyaWNlIEdhc25pZXIgd3JvdGU6Cj4+
IEZyb206IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+
Cj4+IEFkZCB0aGUgc3VwcG9ydCBvZiB0aGUgbmV3IGNvbXBhdGlibGUgZm9yIFNUTTMyTVAyNSBT
b0MgaW4gZHJpdmVyLCBhcwo+PiBkZXNjcmliZWQgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21mZC9zdCxzdG0zMi1scHRpbWVyLnlhbWwKPj4gYW5kIHVzZWQgaW4gYXJjaC9h
cm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBh
dHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+IFNpZ25lZC1v
ZmYtYnk6IEZhYnJpY2UgR2FzbmllciA8ZmFicmljZS5nYXNuaWVyQGZvc3Muc3QuY29tPgo+PiAt
LS0KPj4gIGRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItc3RtMzItbHAuYyB8IDEgKwo+PiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Ns
b2Nrc291cmNlL3RpbWVyLXN0bTMyLWxwLmMgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXN0
bTMyLWxwLmMKPj4gaW5kZXggYTRjOTUxNjFjYjIyLi5kYjA1NTM0OGUyY2MgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItc3RtMzItbHAuYwo+PiArKysgYi9kcml2ZXJz
L2Nsb2Nrc291cmNlL3RpbWVyLXN0bTMyLWxwLmMKPj4gQEAgLTE5Nyw2ICsxOTcsNyBAQCBzdGF0
aWMgaW50IHN0bTMyX2Nsa2V2ZW50X2xwX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCj4+ICAKPj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHN0bTMyX2Nsa2V2
ZW50X2xwX29mX21hdGNoW10gPSB7Cj4+ICAJeyAuY29tcGF0aWJsZSA9ICJzdCxzdG0zMi1scHRp
bWVyLXRpbWVyIiwgfSwKPj4gKwl7IC5jb21wYXRpYmxlID0gInN0LHN0bTMybXAyNS1scHRpbWVy
LXRpbWVyIiwgfSwKPj4gIAl7fSwKPiAKPiBTYW1lIHF1ZXN0aW9uLgoKT29wcywgSSBqdXN0IGZp
Z3VyZWQgb3V0IEkgaGF2ZSBtaXNzZWQgYSBjaGFuZ2UgdG8gdGhpcyBkcml2ZXIsIHRvCmVuYWJs
ZSBpbnRlcnJ1cHRzLCBpbiBvcmRlciB0byBjb21wbHkgd2l0aCB0aGUgTFBUaW1lciBzcGVjLCBz
dGFydGluZwp3aXRoIFNUTTMyTVAyNS4KCkUuZy4gd2l0aCBlYXJsaWVyIFNUTTMyTVAxMywgU1RN
MzJNUDE1IG9yIGV2ZW4gU1RNMzJINzoKKiBUaGUgTFBUSU1fSUVSIHJlZ2lzdGVyIG11c3Qgb25s
eSBiZSBtb2RpZmllZCB3aGVuIHRoZSBMUFRJTSBpcwpkaXNhYmxlZCAoRU5BQkxFIGJpdCByZXNl
dCB0byDigJgw4oCZKQoKT24gU1RNMzJNUDI1OgoqIFRoZSBMUFRJTXhfRElFUiByZWdpc3RlciBt
dXN0IG9ubHkgYmUgbW9kaWZpZWQgd2hlbiB0aGUgTFBUSU0gaXMKZW5hYmxlZCAoRU5BQkxFIGJp
dCBzZXQgdG8gMSkKCkknbGwgYWRkIHRoaXMgYXMgY29tcGF0aWJsZSBkYXRhIGluIG5leHQgcmV2
aXNpb24uCgpCZXN0IHJlZ2FyZHMsCkZhYnJpY2UKCj4gCj4gQmVzdCByZWdhcmRzLAo+IEtyenlz
enRvZgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
