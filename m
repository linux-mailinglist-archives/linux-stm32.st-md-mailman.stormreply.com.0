Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B55DDA4AB05
	for <lists+linux-stm32@lfdr.de>; Sat,  1 Mar 2025 13:51:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59B18C6B47E;
	Sat,  1 Mar 2025 12:51:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A97FC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  1 Mar 2025 12:51:11 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 521AZo96011094;
 Sat, 1 Mar 2025 13:50:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 JG9TJ2L/zACNt5mQUh/jkFvy1Qa2TfFfH4f4dtsjYRI=; b=C5bnyU29jfv1dGHc
 Mkz6xW6Qc+ZTWsNX33wJs2piEgGT3bRtxBa+NLFA8vMm1puc1yZfthmUV+pK/sGr
 OwfCmEg1qgxrK1I95qlpaWBNxO/4APnsieL7nAgtZ1DDGRlahwWy7C5PZsZntx9+
 CDfp/OA96bMyZzSf9DeS55BImW3Oqv7VIyTFbEITQUBs8v1wnd67vmy7IXg6meCp
 Fu1CX+qDR2JtBIoPQd/NawJKSvPBh+8jPFiMDL76Gy79AeD6PQGsESRKKv46urmq
 9nTTuiPTKwNo4EGUHSzVGLKGZTe57+bdkqU2j/0VR9eZJlI9lZTMHd9LmJr+f9yr
 LDpakw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 453tc4avpb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 01 Mar 2025 13:50:48 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 875A6400B0;
 Sat,  1 Mar 2025 13:49:26 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3E5CE586DBE;
 Sat,  1 Mar 2025 13:45:13 +0100 (CET)
Received: from [192.168.8.15] (10.252.9.148) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 1 Mar
 2025 13:45:11 +0100
Message-ID: <1ae59b115cb2e4570c6e77a01bcdac11dff03ae1.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <linux-kernel@vger.kernel.org>
Date: Sat, 1 Mar 2025 13:45:08 +0100
In-Reply-To: <20250301115116.2862353-1-dario.binacchi@amarulasolutions.com>
References: <20250301115116.2862353-1-dario.binacchi@amarulasolutions.com>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.252.9.148]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-01_05,2025-02-28_01,2024-11-22_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: use
 IRQ_TYPE_EDGE_FALLING on stm32mp157c-dk2
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

T24gU2F0LCAyMDI1LTAzLTAxIGF0IDEyOjUxICswMTAwLCBEYXJpbyBCaW5hY2NoaSB3cm90ZToK
PiBSZXBsYWNlIHRoZSBudW1iZXIgMiB3aXRoIHRoZSBhcHByb3ByaWF0ZSBudW1lcmljYWwgY29u
c3RhbnQgZGVmaW5lZCBpbgo+IGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5o
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFy
dWxhc29sdXRpb25zLmNvbT4KPiAKPiAtLS0KPiAKPiDCoGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0
bTMybXAxNTdjLWRrMi5kdHMgfCAzICsrLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9z
dC9zdG0zMm1wMTU3Yy1kazIuZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1N2Mt
ZGsyLmR0cwo+IGluZGV4IDVmOWMwMTYwYTljNC4uZGNmMTdjNDkzMDIyIDEwMDY0NAo+IC0tLSBh
L2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTdjLWRrMi5kdHMKPiArKysgYi9hcmNoL2Fy
bS9ib290L2R0cy9zdC9zdG0zMm1wMTU3Yy1kazIuZHRzCj4gQEAgLTExLDYgKzExLDcgQEAKPiDC
oCNpbmNsdWRlICJzdG0zMm1wMTUtcGluY3RybC5kdHNpIgo+IMKgI2luY2x1ZGUgInN0bTMybXAx
NXh4YWMtcGluY3RybC5kdHNpIgo+IMKgI2luY2x1ZGUgInN0bTMybXAxNXh4LWRreC5kdHNpIgo+
ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+Cj4gwqAK
PiDCoC8gewo+IMKgwqDCoMKgwqDCoMKgwqBtb2RlbCA9ICJTVE1pY3JvZWxlY3Ryb25pY3MgU1RN
MzJNUDE1N0MtREsyIERpc2NvdmVyeSBCb2FyZCI7Cj4gQEAgLTY3LDcgKzY4LDcgQEAgJmkyYzEg
ewo+IMKgwqDCoMKgwqDCoMKgwqB0b3VjaHNjcmVlbkAzOCB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBjb21wYXRpYmxlID0gImZvY2FsdGVjaCxmdDYyMzYiOwo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnID0gPDB4Mzg+Owo+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBpbnRlcnJ1cHRzID0gPDIgMj47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGludGVycnVwdHMgPSA8MiBJUlFfVFlQRV9FREdFX0ZBTExJTkc+Owo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50ZXJydXB0LXBhcmVudCA9IDwmZ3Bpb2Y+Owo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdG91Y2hzY3JlZW4tc2l6ZS14ID0gPDQ4
MD47Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB0b3VjaHNjcmVlbi1zaXplLXkg
PSA8ODAwPjsKClRoYW5rcyEKClJldmlld2VkLWJ5OiBBbnRvbmlvIEJvcm5lbyA8YW50b25pby5i
b3JuZW9AZm9zcy5zdC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
