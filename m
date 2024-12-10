Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FD69EAAFF
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Dec 2024 09:49:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C602BC78014;
	Tue, 10 Dec 2024 08:49:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74525C78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Dec 2024 08:49:01 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA4YK5t005427;
 Tue, 10 Dec 2024 09:48:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 wTMNPKp9Javw7QGcnqA0o3v+GDe3cl06vv45gRAkrrk=; b=3CNt1mlFNJBQQrSq
 8C+DRiW76FX6sGs18gKLWQF0izrAHU8JA7XbqwBgVOr4A9s1lss0r9KQNNNaHoqF
 3cA3EZaWfbg0mIx5AiRT1Nf/waVQB036t5GEehmkhv2vuBAxBAXG3y42fKMUMXHr
 jVKGcOvObJZlxPVHtdBZVl/1xZbWvun7OrPAOgnMgmlXWvNDWXt1T1d3L28Gxb9e
 WYXUSwls9B2BRrNjgYED3Nqy3t0hjSpkrTncD79xb0vwpJj6m4Sd4Hu//wNbNc3x
 r6ydB+pJgc6ifcjzUBMSEJeTHJzSGVlpYGhyQ5/Yes9IiJ8AmevTSAvz+9OLUwEB
 ySLEtQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ccc8uhgq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2024 09:48:51 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D0F0140090;
 Tue, 10 Dec 2024 09:47:42 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EE05C22E20A;
 Tue, 10 Dec 2024 09:46:34 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 10 Dec
 2024 09:46:34 +0100
Message-ID: <8cda7859-523c-4850-8b89-9d9c9bf07cb6@foss.st.com>
Date: Tue, 10 Dec 2024 09:46:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de,
 =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/6] ARM: dts: stm32: lxa-tac: fix gen{1,
 2} boards and add gen3 board
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

SGkgTWFyYwoKT24gMTEvMTkvMjQgMTI6MzQsIE1hcmMgS2xlaW5lLUJ1ZGRlIHdyb3RlOgo+IEhl
bGxvLAo+IAo+IHRoaXMgc2VyaWVzIGZpeGVzIHNvbWUgcHJvYmxlbXMgZm91bmQgaW4gdGhlIGx4
YS10YWMgZ2VuZXJhdGlvbiAxIGFuZAo+IDIgYm9hcmRzIGFuZCBhZGQgc3VwcG9ydCBmb3IgdGhl
IGdlbmVyYXRpb24gMyBib2FyZC4gSXQncyBiYXNlZCBvbiBhbgo+IFNUTTMyTVAxNTNjLCB3aGls
ZSB0aGUgZ2VuZXJhdGlvbiAxIGFuZCAyIGFyZSBiYXNlZCBvbiB0aGUKPiBTVE0zMk1QMTU3Yy4K
PiAKPiByZWdhcmRzLAo+IE1hcmMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJjIEtsZWluZS1CdWRk
ZSA8bWtsQHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+IExlb25hcmQgR8O2aHJzICg2KToKPiAgICAg
ICAgQVJNOiBkdHM6IHN0bTMyOiBseGEtdGFjOiBkaXNhYmxlIHRoZSByZWFsIHRpbWUgY2xvY2sK
PiAgICAgICAgQVJNOiBkdHM6IHN0bTMyOiBseGEtdGFjOiBleHRlbmQgdGhlIGFsaWFzIHRhYmxl
Cj4gICAgICAgIEFSTTogZHRzOiBzdG0zMjogbHhhLXRhYzogYWRqdXN0IFVTQiBnYWRnZXQgZmlm
byBzaXplcyBmb3IgbXVsdGkgZnVuY3Rpb24KPiAgICAgICAgZHQtYmluZGluZ3M6IGFybTogc3Rt
MzI6IGFkZCBjb21wYXRpYmxlIHN0cmluZ3MgZm9yIExpbnV4IEF1dG9tYXRpb24gTFhBIFRBQyBn
ZW4gMwo+ICAgICAgICBBUk06IGR0czogc3RtMzI6IGx4YS10YWM6IG1vdmUgYWRjIGFuZCBncGlv
e2UsZ30gdG8gZ2VuezEsMn0gYm9hcmRzCj4gICAgICAgIEFSTTogZHRzOiBzdG0zMjogbHhhLXRh
YzogQWRkIHN1cHBvcnQgZm9yIGdlbmVyYXRpb24gMyBkZXZpY2VzCj4gCj4gICAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbCAgICAgICB8ICAgNyArCj4gICBhcmNo
L2FybS9ib290L2R0cy9zdC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4g
ICBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTUzYy1seGEtdGFjLWdlbjMuZHRzICB8IDI2
NyArKysrKysrKysrKysrKysrKysrKysKPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAx
NTdjLWx4YS10YWMtZ2VuMS5kdHMgIHwgIDg0ICsrKysrKysKPiAgIGFyY2gvYXJtL2Jvb3QvZHRz
L3N0L3N0bTMybXAxNTdjLWx4YS10YWMtZ2VuMi5kdHMgIHwgIDg0ICsrKysrKysKPiAgIGFyY2gv
YXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXhjLWx4YS10YWMuZHRzaSAgICAgIHwgMTAwICstLS0t
LS0tCj4gICA2IGZpbGVzIGNoYW5nZWQsIDQ1NSBpbnNlcnRpb25zKCspLCA4OCBkZWxldGlvbnMo
LSkKPiAtLS0KPiBiYXNlLWNvbW1pdDogYjAxOTFhNWNiYzIyMmZjN2FmM2Y5NTExYjQ0ZDFmMzMw
ZWY5ODBlOQo+IGNoYW5nZS1pZDogMjAyNDExMTItbHhhLXRhYy1nZW4zLThkYmMzNDgxY2U3YQo+
IAo+IEJlc3QgcmVnYXJkcywKClNlcmllcyBhcHBsaWVkIG9uIHN0bTMyLW5leHQuCgpUaGFua3Mh
CkFsZXgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
