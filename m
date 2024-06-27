Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAED91A91F
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 16:23:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEC12C71280;
	Thu, 27 Jun 2024 14:23:58 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 365B5C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 14:23:54 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RB4x1x013769;
 Thu, 27 Jun 2024 16:23:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 sz4kv46cKOBt8+tdc/6ePG1HkA/ODePgbeH/iJ1pvwU=; b=CwKLFt/8tvvqoLkK
 4xy7rbGBo4o35L2ukA0Ia1tBIG6G7ASNXmlSWql2JFIZ8P8wsummFS3We/RTL7Y1
 SVc1PhLsvk5qNSueOQlsQNA6gW4Q0GYQS2bfSy5XGIYeF8QUguVs85SAVE39rlLf
 wnw+zU1HjR27gRCuwhQuvoe+axpnliInuUf8IOxQb5nMZPdAA3llR1FazB6dL8Vu
 tpLoEZR64PTMGB7/4MGmsX9x5gqdyZDYsmjdLRPn4XrrtvwT4PqFfF0WuUPFv0we
 INMjsPT/wTytgILYZZrap5WEmqiAqDlqXyDgK/P7UkN/gMRutjOx3vpRb7OMTjyH
 1PU/ww==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yx9jjkeqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2024 16:23:34 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 09FE74002D;
 Thu, 27 Jun 2024 16:23:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B888B220B57;
 Thu, 27 Jun 2024 16:22:42 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 27 Jun
 2024 16:22:42 +0200
Message-ID: <1139b106-1c05-44ba-9dac-649bcc8d9315@foss.st.com>
Date: Thu, 27 Jun 2024 16:22:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Amelie Delaunay <amelie.delaunay@foss.st.com>, Vinod Koul
 <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20240531150712.2503554-1-amelie.delaunay@foss.st.com>
 <20240531150712.2503554-13-amelie.delaunay@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240531150712.2503554-13-amelie.delaunay@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_11,2024-06-27_03,2024-05-17_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 12/12] arm64: dts: st: add HPDMA nodes
	on stm32mp251
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

SGkgQW3DqWxpZQoKT24gNS8zMS8yNCAxNzowNywgQW1lbGllIERlbGF1bmF5IHdyb3RlOgo+IFRo
ZSBIaWdoIFBlcmZvcm1hbmNlIERpcmVjdCBNZW1vcnkgQWNjZXNzIChIUERNQSkgY29udHJvbGxl
ciBpcyB1c2VkIHRvCj4gcGVyZm9ybSBwcm9ncmFtbWFibGUgZGF0YSB0cmFuc2ZlcnMgYmV0d2Vl
biBtZW1vcnktbWFwcGVkIHBlcmlwaGVyYWxzCj4gYW5kIG1lbW9yaWVzIChvciBiZXR3ZWVuIG1l
bW9yaWVzKSB2aWEgbGlua2VkLWxpc3RzLgo+IAo+IFRoZXJlIGFyZSAzIGluc3RhbmNlcyBvZiBI
UERNQSBvbiBzdG0zMm1wMjUxLCB1c2luZyBzdG0zMi1kbWEzIGRyaXZlciwgd2l0aAo+IDE2IGNo
YW5uZWxzIHBlciBpbnN0YW5jZSBhbmQgd2l0aCBvbmUgaW50ZXJydXB0IHBlciBjaGFubmVsLgo+
IENoYW5uZWxzIDAgdG8gNyBhcmUgaW1wbGVtZW50ZWQgd2l0aCBhIEZJRk8gb2YgOCBieXRlcy4K
PiBDaGFubmVscyA4IHRvIDExIGFyZSBpbXBsZW1lbnRlZCB3aXRoIGEgRklGTyBvZiAzMiBieXRl
cy4KPiBDaGFubmVscyAxMiB0byAxNSBhcmUgaW1wbGVtZW50ZWQgd2l0aCBhIEZJRk8gb2YgMTI4
IGJ5dGVzLgo+IFRoYW5rcyB0byBzdG0zMi1kbWEzIGJpbmRpbmdzLCB0aGUgdXNlciBjYW4gYXNr
IGZvciBhIGNoYW5uZWwgd2l0aCBzcGVjaWZpYwo+IEZJRk8gc2l6ZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBBbWVsaWUgRGVsYXVuYXkgPGFtZWxpZS5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAtLS0K
PiB2NDogdXNlIFNDTUkgY2xvY2tzIG5vdyB0aGF0IHRoZXkgYXJlIGF2YWlsYWJsZQo+IAo+IHYy
OiB1c2UgU29DIHNwZWNpZmljIGNvbXBhdGlibGUgc3Qsc3RtMzJtcDI1LWRtYTMKPiAtLS0KPiAg
IGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpIHwgNjkgKysrKysrKysrKysr
KysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA2OSBpbnNlcnRpb25zKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpIGIvYXJj
aC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kKPiBpbmRleCBkY2QwNjU2ZDY3YTgu
LmQwNTdkY2VlMjUzNCAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMy
bXAyNTEuZHRzaQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNp
Cj4gQEAgLTEwNyw2ICsxMDcsNzUgQEAgc29jQDAgewo+ICAgCQlpbnRlcnJ1cHQtcGFyZW50ID0g
PCZpbnRjPjsKCi4uLgoKQXBwbGllZCBvbiBzdG0zMi1uZXh0LgoKVGhhbmtzISEKQWxleApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
