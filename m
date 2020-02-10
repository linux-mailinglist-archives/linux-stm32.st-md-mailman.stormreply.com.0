Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82035157FFE
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Feb 2020 17:44:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA509C36B0B;
	Mon, 10 Feb 2020 16:44:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C98FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2020 16:44:20 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01AGiBFt014873; Mon, 10 Feb 2020 17:44:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=zcYt6Y+x2k8OY2/GRYD67Vq+aFgoKerUJwHCwYSMUxY=;
 b=MRuo5P1sITtDXkr8HnjEZLFOT8qP9EWImTXRa2Rb/xZDP5na0Ig416XQ5Jef0YDDvoL4
 6bs9jsgbbftU03E2AIMOTwcCgmiq5OyYDBWvTiquc2nqWrtnBo1btOap97eyRqDsQwvA
 E1ZyWHaXlQ0J8Xj9RKGelnylVBl32hol4GlFutYfPHS5f54BZ0HRtmG7cFB2HrB2H6V+
 eJk9TAOxAsKffQnrC/dg4RCETgtUVSH1j5dmvFEhSVVUwUAPUlTbhsnVfjZH7IwXOUGB
 QRWJSUy2QUwYN5F+VxO/E38cVejgx+XbIgpuGjYRRquFAnfcH/E0Z7FjlN4sZ1j+JgMo +w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1ud9c61f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2020 17:44:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AA47310002A;
 Mon, 10 Feb 2020 17:44:12 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 973A12AE223;
 Mon, 10 Feb 2020 17:44:12 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 10 Feb
 2020 17:44:11 +0100
To: Amelie Delaunay <amelie.delaunay@st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
References: <20200204132606.20222-1-amelie.delaunay@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <3211481b-896f-1b25-b275-f2670fae7234@st.com>
Date: Mon, 10 Feb 2020 17:44:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200204132606.20222-1-amelie.delaunay@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-10_06:2020-02-10,
 2020-02-10 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/3] USB OTG Dual Role on STM32MP15
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

SGkgQW3DqWxpZQoKT24gMi80LzIwIDI6MjYgUE0sIEFtZWxpZSBEZWxhdW5heSB3cm90ZToKPiBU
aGlzIHBhdGNoc2V0IGFkZHMgc3VwcG9ydCBmb3IgVVNCIE9URyBEdWFsIFJvbGUgb24gc3RtMzJt
cDE1Lgo+IFVTQiBPVEcgSFMgaXMgY29uZmlndXJlZCBpbiBEdWFsIFJvbGUgbW9kZSBvbiBzdG0z
Mm1wMTU3Yy1ldjEsIHJvbGUgZGV0ZWN0aW9uCj4gdXNlcyBJRCBwaW4uCj4gCj4gQW1lbGllIERl
bGF1bmF5ICgzKToKPiAgICBBUk06IGR0czogc3RtMzI6IGFkZCBVU0IgT1RHIGZ1bGwgc3VwcG9y
dCBvbiBzdG0zMm1wMTUxCj4gICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQgVVNCIE9URyBwaW5jdHJs
IHRvIHN0bTMybXAxNQo+ICAgIEFSTTogZHRzOiBzdG0zMjogZW5hYmxlIFVTQiBPVEcgRHVhbCBS
b2xlIG9uIHN0bTMybXAxNTdjLWV2MQo+IAo+ICAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1
LXBpbmN0cmwuZHRzaSB8IDEzICsrKysrKysrKysrKysKPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0
bTMybXAxNTEuZHRzaSAgICAgICAgfCAgMyArKy0KPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMy
bXAxNTdjLWVkMS5kdHMgICAgfCAgNCArKysrCj4gICBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1w
MTU3Yy1ldjEuZHRzICAgIHwgIDMgKystCj4gICA0IGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCgpTZXJpZXMgYXBwbGllZCBvbiBzdG0zMi1uZXh0LgoK
VGhhbmtzCkFsZXgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
