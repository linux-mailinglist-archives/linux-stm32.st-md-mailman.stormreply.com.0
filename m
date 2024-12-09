Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 970359E9AF9
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Dec 2024 16:56:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF5D4C78014;
	Mon,  9 Dec 2024 15:56:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E45B4C01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Dec 2024 15:56:47 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9E3IDX013783;
 Mon, 9 Dec 2024 16:56:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 6q/GQ8e/5AdWnp2sT3tKqIF8BpsMpOI2KwP+899KLBQ=; b=KMjxD+Gr23lmaDkx
 rxl8Eb/Gr+eMbb6QYtDzJgYhY1oeHFkm1S2UzRgUT9nIwlGldeLVi+PYMgXkBKNn
 AvmJHJHDlWQUX5+K/iY6G3NtYLFqUvKP+HKCeqfGWS5CqiIX73wb1+kluthGzjwt
 XNrR/Vzw+uhrnzFqaZjySTFLPNJOT+x3iR7acZhprr5tRo6JAu8PmGkCjhXTuuzx
 XaMwIxR7uJ5RFQzBJgiedmNXqvcz0V9KfpnnDFH2n2sRdf2gKvKtpHaMYhVSxoYo
 6rCqcdZ7bvfNmSS6DOeMGuHs86grpt3LaALNmfKEGQXglirqMt9BPmGD2RPrfGgq
 vHqoeg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ccnm0w6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2024 16:56:34 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 68A0D4004B;
 Mon,  9 Dec 2024 16:55:25 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 074CA28D444;
 Mon,  9 Dec 2024 16:54:39 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 9 Dec
 2024 16:54:38 +0100
Message-ID: <feca2ea8-38f9-41c8-b4c4-1a6cbeec73a4@foss.st.com>
Date: Mon, 9 Dec 2024 16:54:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
 <20241209-magenta-boobook-of-respect-14ec68-mkl@pengutronix.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20241209-magenta-boobook-of-respect-14ec68-mkl@pengutronix.de>
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

SGkgTWFyYwoKT24gMTIvOS8yNCAxNTozMCwgTWFyYyBLbGVpbmUtQnVkZGUgd3JvdGU6Cj4gSGVs
bG8gQWxleGFuZHJlLAo+IAo+IE9uIDE5LjExLjIwMjQgMTI6MzQ6NTcsIE1hcmMgS2xlaW5lLUJ1
ZGRlIHdyb3RlOgo+PiBIZWxsbywKPj4KPj4gdGhpcyBzZXJpZXMgZml4ZXMgc29tZSBwcm9ibGVt
cyBmb3VuZCBpbiB0aGUgbHhhLXRhYyBnZW5lcmF0aW9uIDEgYW5kCj4+IDIgYm9hcmRzIGFuZCBh
ZGQgc3VwcG9ydCBmb3IgdGhlIGdlbmVyYXRpb24gMyBib2FyZC4gSXQncyBiYXNlZCBvbiBhbgo+
PiBTVE0zMk1QMTUzYywgd2hpbGUgdGhlIGdlbmVyYXRpb24gMSBhbmQgMiBhcmUgYmFzZWQgb24g
dGhlCj4+IFNUTTMyTVAxNTdjLgo+Pgo+PiByZWdhcmRzLAo+PiBNYXJjCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IE1hcmMgS2xlaW5lLUJ1ZGRlIDxta2xAcGVuZ3V0cm9uaXguZGU+Cj4+IC0tLQo+PiBM
ZW9uYXJkIEfDtmhycyAoNik6Cj4+ICAgICAgICBBUk06IGR0czogc3RtMzI6IGx4YS10YWM6IGRp
c2FibGUgdGhlIHJlYWwgdGltZSBjbG9jawo+PiAgICAgICAgQVJNOiBkdHM6IHN0bTMyOiBseGEt
dGFjOiBleHRlbmQgdGhlIGFsaWFzIHRhYmxlCj4+ICAgICAgICBBUk06IGR0czogc3RtMzI6IGx4
YS10YWM6IGFkanVzdCBVU0IgZ2FkZ2V0IGZpZm8gc2l6ZXMgZm9yIG11bHRpIGZ1bmN0aW9uCj4+
ICAgICAgICBkdC1iaW5kaW5nczogYXJtOiBzdG0zMjogYWRkIGNvbXBhdGlibGUgc3RyaW5ncyBm
b3IgTGludXggQXV0b21hdGlvbiBMWEEgVEFDIGdlbiAzCj4+ICAgICAgICBBUk06IGR0czogc3Rt
MzI6IGx4YS10YWM6IG1vdmUgYWRjIGFuZCBncGlve2UsZ30gdG8gZ2VuezEsMn0gYm9hcmRzCj4+
ICAgICAgICBBUk06IGR0czogc3RtMzI6IGx4YS10YWM6IEFkZCBzdXBwb3J0IGZvciBnZW5lcmF0
aW9uIDMgZGV2aWNlcwo+Pgo+PiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9z
dG0zMi55YW1sICAgICAgIHwgICA3ICsKPj4gICBhcmNoL2FybS9ib290L2R0cy9zdC9NYWtlZmls
ZSAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4+ICAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qv
c3RtMzJtcDE1M2MtbHhhLXRhYy1nZW4zLmR0cyAgfCAyNjcgKysrKysrKysrKysrKysrKysrKysr
Cj4+ICAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1N2MtbHhhLXRhYy1nZW4xLmR0cyAg
fCAgODQgKysrKysrKwo+PiAgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTdjLWx4YS10
YWMtZ2VuMi5kdHMgIHwgIDg0ICsrKysrKysKPj4gICBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0z
Mm1wMTV4Yy1seGEtdGFjLmR0c2kgICAgICB8IDEwMCArLS0tLS0tLQo+PiAgIDYgZmlsZXMgY2hh
bmdlZCwgNDU1IGluc2VydGlvbnMoKyksIDg4IGRlbGV0aW9ucygtKQo+IAo+IHNpbmNlIHRoZSBt
ZXJnZSB3aW5kb3cgaXMgb3BlbiwgY2FuIHlvdSBtZXJnZSB0aGlzIHNlcmllcyBwbGVhc2UuCgpZ
ZXMgc3VyZS4gSXQgd2lsbCBiZSBpbiBteSBQUiBmb3IgdjYuMTQuCgpyZWdhcmRzCkFsZXgKCgoK
PiByZWdhcmRzLAo+IE1hcmMKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
