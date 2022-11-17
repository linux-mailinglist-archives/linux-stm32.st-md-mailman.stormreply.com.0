Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FFE62D526
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Nov 2022 09:39:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B74BC65067;
	Thu, 17 Nov 2022 08:39:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44985C6504A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Nov 2022 08:39:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AH3t39G012367; Thu, 17 Nov 2022 09:39:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Qq3kXihqfEk1AIbvKZAImcsB1VgZAEaIMZ7JwZWPYJc=;
 b=oJ/i4ZLEOnxBgb3yKj8+Mc1Uzcw/tSTF5EjuEIuzDhtiQ7JEIsJJqoZ56aJAoYEDoIev
 ey1oaTRxGb4a4Sc1iaKmiSo8nUaMrA3aAMAjuR+vhPFRqUFWtLUzzwirQEtp3GCcLMtc
 bTAvBDX23geApSfhLH010rllAZcWOTKTtT0dVuB03G7g4d7OXTBP92dn3Pv7Wk4N25qu
 HaeW0VuDKt8LQ4W1I4eZq5g0jjch+1z5Uoa/2aE6y/wenFtTE/fAmq1F4A8RoKqQ+eL7
 7KbxwTYlAJLv0Y9F4cEuPmOK8sIpDYtSuNLztXE2wLUW3WWKJEAEHypYm2QL2Hvrveuv qQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kv9ydnc4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Nov 2022 09:39:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6E62F10003A;
 Thu, 17 Nov 2022 09:39:07 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 68605216ED8;
 Thu, 17 Nov 2022 09:39:07 +0100 (CET)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Thu, 17 Nov
 2022 09:39:06 +0100
Message-ID: <04c725a0-1382-10e7-8404-992aad007f78@foss.st.com>
Date: Thu, 17 Nov 2022 09:39:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Amelie Delaunay <amelie.delaunay@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
References: <20221024094648.145251-2-amelie.delaunay@foss.st.com>
 <20221024094648.145251-3-amelie.delaunay@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20221024094648.145251-3-amelie.delaunay@foss.st.com>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_04,2022-11-16_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/2] ARM: dts: stm32: add mcp23017 IO
 expander on I2C1 on stm32mp135f-dk
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

SGkgQW3DqWxpZQoKT24gMTAvMjQvMjIgMTE6NDYsIEFtZWxpZSBEZWxhdW5heSB3cm90ZToKPiBN
Q1AyMzAxNyBpcyBhbiBJTyBleHBhbmRlciBvZmZlcmluZyAxNiBpbnB1dC9vdXRwdXQgcG9ydCBl
eHBhbmRlciB3aXRoCj4gaW50ZXJydXB0IG91dHB1dC4KPiBPbiBzdG0zMm1wMTM1Zi1kaywgb25s
eSBJTlRBIGlzIHJvdXRlZCAob24gUEcxMiksIGJ1dCBNQ1AyMzAxNyBjYW4gbWlycm9yCj4gdGhl
IGJhbmsgQiBpbnRlcnJ1cHRzIG9uIElOVEEsIHRoYXQncyB3aHkgdGhlIHByb3BlcnR5IG1pY3Jv
Y2hpcCxpcnEtbWlycm9yCj4gaXMgdXNlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbWVsaWUgRGVs
YXVuYXkgPGFtZWxpZS5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAtLS0KPiAgIGFyY2gvYXJtL2Jv
b3QvZHRzL3N0bTMybXAxMzVmLWRrLmR0cyB8IDE0ICsrKysrKysrKysrKysrCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290
L2R0cy9zdG0zMm1wMTM1Zi1kay5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTM1Zi1k
ay5kdHMKPiBpbmRleCBhODdhYjA2N2M5NTUuLmQ1ZmM2NDYyYmEzMyAxMDA2NDQKPiAtLS0gYS9h
cmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTM1Zi1kay5kdHMKPiArKysgYi9hcmNoL2FybS9ib290
L2R0cy9zdG0zMm1wMTM1Zi1kay5kdHMKPiBAQCAtMTEyLDYgKzExMiwyMCBAQCAmaTJjMSB7Cj4g
ICAJLyogc3BhcmUgZG1hcyBmb3Igb3RoZXIgdXNhZ2UgKi8KPiAgIAkvZGVsZXRlLXByb3BlcnR5
L2RtYXM7Cj4gICAJL2RlbGV0ZS1wcm9wZXJ0eS9kbWEtbmFtZXM7Cj4gKwo+ICsJbWNwMjMwMTc6
IHBpbmN0cmxAMjEgewo+ICsJCWNvbXBhdGlibGUgPSAibWljcm9jaGlwLG1jcDIzMDE3IjsKPiAr
CQlyZWcgPSA8MHgyMT47Cj4gKwkJZ3Bpby1jb250cm9sbGVyOwo+ICsJCSNncGlvLWNlbGxzID0g
PDI+Owo+ICsJCWludGVycnVwdHMgPSA8MTIgSVJRX1RZUEVfTEVWRUxfTE9XPjsKPiArCQlpbnRl
cnJ1cHQtcGFyZW50ID0gPCZncGlvZz47Cj4gKwkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsK
PiArCQlwaW5jdHJsLTAgPSA8Jm1jcDIzMDE3X3BpbnNfYT47Cj4gKwkJaW50ZXJydXB0LWNvbnRy
b2xsZXI7Cj4gKwkJI2ludGVycnVwdC1jZWxscyA9IDwyPjsKPiArCQltaWNyb2NoaXAsaXJxLW1p
cnJvcjsKPiArCX07Cj4gICB9Owo+ICAgCj4gICAmaTJjNSB7CgpCb3RoIHBhdGNoZXMgYXBwbGll
ZCBvbiBzdG0zMi1uZXh0LgoKdGhhbmtzCkFsZXgKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
