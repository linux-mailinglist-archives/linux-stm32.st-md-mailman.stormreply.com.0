Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4F124B0D0
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Aug 2020 10:13:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6824FC3FAD8;
	Thu, 20 Aug 2020 08:13:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26B17C3FAD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Aug 2020 08:13:28 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07K86vFO007077; Thu, 20 Aug 2020 10:13:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=bypIudVjLD+BMgyLulgj0MddZ/EB2P+mWgfGr0rQwJo=;
 b=jc6mPT2/HmRJzmahbN2wVAYpofs2aGC3NhG3DJOgHC4DwUiBnL2fjYxjHgbqSLufFwcP
 OrPggsxjgfvK8Y285ICq5seBT/Eav0tWbnXhuHxZOcumnzFZkjhhz9JHtB3+wfPl+Z4+
 NQdji+vwQ/7/GPkrx6Yi0Q3j0pu5JpQ+LxjcVFRXsIQ1kUORBMyP8u7YsIn2wVRdOKmD
 wh3uznktpBVaxOKHseChr7unax3u+ypPEnICHS38gbD1KqvVydEwlLZDBCsKcE1BMqaW
 9ZdWmS4U0opvOoZgNPNVJs1byZZNTkZ0MvzpQxIj+CidlnIAHNzLNhQTR6gY/j1KTGbb ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 330jek8k2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Aug 2020 10:13:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9FF2010002A;
 Thu, 20 Aug 2020 10:13:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 331E921299C;
 Thu, 20 Aug 2020 10:13:14 +0200 (CEST)
Received: from [10.48.1.149] (10.75.127.47) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 20 Aug
 2020 10:13:13 +0200
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Support Opensource
 <support.opensource@diasemi.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Icenowy Zheng <icenowy@aosc.io>
References: <20200820152926.42c48840@xhacker.debian>
 <20200820154626.79d83157@xhacker.debian>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20fc45ab-4daf-3855-5817-1898d50c9efc@st.com>
Date: Thu, 20 Aug 2020 10:13:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200820154626.79d83157@xhacker.debian>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-20_01:2020-08-19,
 2020-08-20 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 11/12] regulator: stm32-vrefbuf: Fix W=1
 build warning when CONFIG_OF=n
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

T24gOC8yMC8yMCA5OjQ2IEFNLCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+IEZpeCBiZWxvdyB3YXJu
aW5nIHdoZW4gQ09ORklHX09GPW46Cj4gCj4gZHJpdmVycy9yZWd1bGF0b3Ivc3RtMzItdnJlZmJ1
Zi5jOjI4NzozNDogd2FybmluZzog4oCYc3RtMzJfdnJlZmJ1Zl9vZl9tYXRjaOKAmSBkZWZpbmVk
IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+ICAgMjg3IHwgc3RhdGlj
IGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc3RtMzJfdnJlZmJ1Zl9vZl9tYXRjaFtdID0gewo+
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+
fn5+fn5+fgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPEppc2hlbmcuWmhhbmdA
c3luYXB0aWNzLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9yZWd1bGF0b3Ivc3RtMzItdnJlZmJ1Zi5j
IHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcmVndWxhdG9yL3N0bTMyLXZyZWZidWYuYyBiL2RyaXZlcnMvcmVndWxhdG9y
L3N0bTMyLXZyZWZidWYuYwo+IGluZGV4IDk5MmJjMTgxMDFlZi4uNWE1YzEyZDllYTIyIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvcmVndWxhdG9yL3N0bTMyLXZyZWZidWYuYwo+ICsrKyBiL2RyaXZl
cnMvcmVndWxhdG9yL3N0bTMyLXZyZWZidWYuYwo+IEBAIC0yODQsMTEgKzI4NCwxMyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgc3RtMzJfdnJlZmJ1Zl9wbV9vcHMgPSB7Cj4gIAkJ
CSAgIE5VTEwpCj4gIH07Cj4gIAo+ICsjaWZkZWYgQ09ORklHX09GCgpIaSBKaXNoZW5nLAoKWW91
IGNvdWxkIHByb2JhYmx5IGFkb3B0ICJfX21heWJlX3VudXNlZCIgaGVyZSA/IEUuZy4gbGlrZToK
CnN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIF9fbWF5YmVfdW51c2VkIHN0bTMyX3Zy
ZWZidWZfb2ZfbWF0Y2hbXSA9IHsKCkkgY2FuIHNlZSBvdGhlciBkcml2ZXJzIHVzZSB0aGlzIGFs
cmVhZHkgZm9yIHRoZSBzYW1lLgoKVGhhbmtzLApCZXN0IHJlZ2FyZHMsCkZhYnJpY2UKCj4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHN0bTMyX3ZyZWZidWZfb2ZfbWF0Y2hbXSA9
IHsKPiAgCXsgLmNvbXBhdGlibGUgPSAic3Qsc3RtMzItdnJlZmJ1ZiIsIH0sCj4gIAl7fSwKPiAg
fTsKPiAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgc3RtMzJfdnJlZmJ1Zl9vZl9tYXRjaCk7Cj4g
KyNlbmRpZgo+ICAKPiAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3RtMzJfdnJlZmJ1
Zl9kcml2ZXIgPSB7Cj4gIAkucHJvYmUgPSBzdG0zMl92cmVmYnVmX3Byb2JlLAo+IApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
