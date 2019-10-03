Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF143C9B75
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Oct 2019 12:05:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D847C36B0B;
	Thu,  3 Oct 2019 10:05:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CC39C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Oct 2019 10:05:22 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x93A1PHE005807; Thu, 3 Oct 2019 12:05:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : references
 : from : message-id : date : mime-version : in-reply-to : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=LPPmd2u13qwBFxFZ5Y56WE+4sPe3u6X86PcYngdfDX0=;
 b=reenwcBxoQPpkmY1pA2l5GXAWD6wX6QABVWRP6AZbzehaCOwGQWNRg3TNPyQ2HBqa4iN
 4lP91nRfYDdrRcKISF+27TSklO7eoNKx1F2AweOFMliNsarLcGR9avkoY3GY2FBerfLf
 odSlvWi7BHuIr0qQinoPj7vHuUAXtR8sVTV+NUAg03e42M4eatQF4C2zjm1uQz21o8OV
 0xxagjVns0XSelirU5Xu1Bz60hgpforasWGSkuKNrqW4F8mJ3ZuB/JMC8Ln/xC4bkO54
 9ZIIpO8q/RtkAaLJQro0VC90fyce40blu31a5YH+COzk43oRp+U4avifIFEEVpCRD+t8 sA== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2v9w9w3x74-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 03 Oct 2019 12:05:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1E0434E;
 Thu,  3 Oct 2019 10:05:09 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0EC1D2B5CAC;
 Thu,  3 Oct 2019 12:05:09 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 3 Oct
 2019 12:05:08 +0200
To: =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, Fabrice Gasnier
 <fabrice.gasnier@st.com>
References: <1564754931-13861-1-git-send-email-yannick.fertre@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <05cc08f2-36c8-af75-39f3-7b7f4ac4e671@st.com>
Date: Thu, 3 Oct 2019 12:05:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564754931-13861-1-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-03_04:2019-10-01,2019-10-03 signatures=0
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: move ltdc pinctrl on
 stm32mp157a dk1 board
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

SGkgWWFubmljawoKT24gOC8yLzE5IDQ6MDggUE0sIFlhbm5pY2sgRmVydHLDqSB3cm90ZToKPiBU
aGUgbHRkYyBwaW5jdHJsIG11c3QgYmUgaW4gdGhlIGRpc3BsYXkgY29udHJvbGxlciBub2RlIGFu
ZAo+IG5vdCBpbiB0aGUgcGVyaXBoZXJhbCBub2RlIChoZG1pIGJyaWRnZSkuCj4gCj4gU2lnbmVk
LW9mZi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+Cj4gLS0tCj4g
ICBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3YS1kazEuZHRzIHwgNiArKystLS0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdhLWRrMS5kdHMgYi9hcmNoL2FybS9i
b290L2R0cy9zdG0zMm1wMTU3YS1kazEuZHRzCj4gaW5kZXggZjNmMGUzNy4uMTI4NWNmYyAxMDA2
NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3YS1kazEuZHRzCj4gKysrIGIv
YXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2EtZGsxLmR0cwo+IEBAIC05OSw5ICs5OSw2IEBA
Cj4gICAJCXJlc2V0LWdwaW9zID0gPCZncGlvYSAxMCBHUElPX0FDVElWRV9MT1c+Owo+ICAgCQlp
bnRlcnJ1cHRzID0gPDEgSVJRX1RZUEVfRURHRV9GQUxMSU5HPjsKPiAgIAkJaW50ZXJydXB0LXBh
cmVudCA9IDwmZ3Bpb2c+Owo+IC0JCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJzbGVlcCI7
Cj4gLQkJcGluY3RybC0wID0gPCZsdGRjX3BpbnNfYT47Cj4gLQkJcGluY3RybC0xID0gPCZsdGRj
X3BpbnNfc2xlZXBfYT47Cj4gICAJCXN0YXR1cyA9ICJva2F5IjsKPiAgIAo+ICAgCQlwb3J0cyB7
Cj4gQEAgLTI3Niw2ICsyNzMsOSBAQAo+ICAgfTsKPiAgIAo+ICAgJmx0ZGMgewo+ICsJcGluY3Ry
bC1uYW1lcyA9ICJkZWZhdWx0IiwgInNsZWVwIjsKPiArCXBpbmN0cmwtMCA9IDwmbHRkY19waW5z
X2E+Owo+ICsJcGluY3RybC0xID0gPCZsdGRjX3BpbnNfc2xlZXBfYT47Cj4gICAJc3RhdHVzID0g
Im9rYXkiOwo+ICAgCj4gICAJcG9ydCB7Cj4gCgpBcHBsaWVkIG9uIHN0bTMyLW5leHQuCgpUaGFu
a3MuCkFsZXgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
