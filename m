Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C835D30273D
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Jan 2021 16:52:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86DE5C5717F;
	Mon, 25 Jan 2021 15:52:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B82A1C3FADA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jan 2021 15:07:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10PF1nsP014912; Mon, 25 Jan 2021 16:07:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=3VIEwfh4J+Aj6CJv0TrmsmAtwTi75eM4BtqDdVbEjj8=;
 b=iBXzOLmt6SupTx+Z7Tp00QpW0109EYuNksc20sH5qnW1q27pi0Qv5t/+2ICQp22DYqOE
 TmfycOLGFzorlInotkpHTLIdCvuAgdG00yxU7xbe7+rmJKOcjYgqVEIhp+cnqpAeSFfD
 7sY1hUGkxCVfIUu3T9NCwgmT/OMov4bcx7b5TC1uBSyTW0uemztnJVp1/CBd3JuHGtrT
 40kRBxl23KpKvplnMOzzFNFrGJBogi2gx1lAjS1h+ixghVhPuySKsa0OoEqOB+f1HOKa
 mrmW++5E1i2o47ZZcB6onUnyigvuReSHAv8vmzFZR1PM2rq+gI/uZ5qN1X/eSFSu9C54 Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 368bjn3hwr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 16:07:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A685A100034;
 Mon, 25 Jan 2021 16:07:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8B5592288CE;
 Mon, 25 Jan 2021 16:07:15 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Jan
 2021 16:07:14 +0100
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
References: <20201223191402.378560-1-jagan@amarulasolutions.com>
 <20201223191402.378560-3-jagan@amarulasolutions.com>
 <21398844-c334-f753-0fac-144a0cdc29dc@foss.st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <f7f84fc7-9e45-9a0e-0dc3-90fdd3ca87b5@st.com>
Date: Mon, 25 Jan 2021 16:07:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <21398844-c334-f753-0fac-144a0cdc29dc@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-25_05:2021-01-25,
 2021-01-25 signatures=0
X-Mailman-Approved-At: Mon, 25 Jan 2021 15:52:28 +0000
Cc: devicetree@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 Francesco Utel <francesco.utel@engicam.com>, linux-kernel@vger.kernel.org,
 Mirko Ardinghi <mirko.ardinghi@engicam.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/5] ARM: dts: stm32: Add Engicam MicroGEA
	STM32MP1 SoM
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

CgpPbiAxLzI1LzIxIDQ6MDUgUE0sIEFsZXhhbmRyZSBUT1JHVUUgd3JvdGU6Cj4gSGksCj4gCj4g
T24gMTIvMjMvMjAgODoxMyBQTSwgSmFnYW4gVGVraSB3cm90ZToKPj4gTWljcm9HRUEgU1RNMzJN
UDEgaXMgYW4gRURJTU0gU29NIGJhc2VkIG9uIFNUTTMyTVAxNTdBIGZyb20gRW5naWNhbS4KPj4K
Pj4gR2VuZXJhbCBmZWF0dXJlczoKPj4gLSBTVE0zMk1QMTU3QUFDCj4+IC0gVXAgdG8gMUdCIERE
UjNMLTgwMAo+PiAtIDUxMk1CIE5hbmQgZmxhc2gKPj4gLSBJMlMKPj4KPj4gTWljcm9HRUEgU1RN
MzJNUDEgbmVlZHMgdG8gbW91bnQgb24gdG9wIG9mIEVuZ2ljYW0gTWljcm9EZXYgY2Fycmllcgo+
PiBib2FyZHMgZm9yIGNyZWF0aW5nIGNvbXBsZXRlIHBsYXRmb3JtIHNvbHV0aW9ucy4KPj4KPj4g
QWRkIHN1cHBvcnQgZm9yIGl0Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNYXR0ZW8gTGlzaSA8bWF0
dGVvLmxpc2lAZW5naWNhbS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEZyYW5jZXNjbyBVdGVsIDxm
cmFuY2VzY28udXRlbEBlbmdpY2FtLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogTWlya28gQXJkaW5n
aGkgPG1pcmtvLmFyZGluZ2hpQGVuZ2ljYW0uY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBKYWdhbiBU
ZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4KPj4gLS0tCj4+IMKgIC4uLi9kdHMvc3Rt
MzJtcDE1N2EtbWljcm9nZWEtc3RtMzJtcDEuZHRzacKgwqDCoCB8IDE0NyArKysrKysrKysrKysr
KysrKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDE0NyBpbnNlcnRpb25zKCspCj4+IMKgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3YS1taWNyb2dlYS1zdG0z
Mm1wMS5kdHNpCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3
YS1taWNyb2dlYS1zdG0zMm1wMS5kdHNpIAo+PiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAx
NTdhLW1pY3JvZ2VhLXN0bTMybXAxLmR0c2kKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5k
ZXggMDAwMDAwMDAwMDAwLi45N2Q1NjkxMDdiZmUKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9h
cmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3YS1taWNyb2dlYS1zdG0zMm1wMS5kdHNpCj4+IEBA
IC0wLDAgKzEsMTQ3IEBACj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAr
IE9SIEJTRC0zLUNsYXVzZSkKPj4gKy8qCj4+ICsgKiBDb3B5cmlnaHQgKGMpIFNUTWljcm9lbGVj
dHJvbmljcyAyMDE5IC0gQWxsIFJpZ2h0cyBSZXNlcnZlZAo+PiArICogQ29weXJpZ2h0IChjKSAy
MDIwIEVuZ2ljYW0gc3JsCj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjAgQW1hcnVsYSBTb2x1dG9u
cyhJbmRpYSkKPj4gKyAqLwo+PiArCj4gCj4gSWYgU1RNMzJNUDE1N0FBQyBpcyBzb2xkZXJlZCBv
bnRvIHRoaXMgYm9hcmQsIHlvdSBzaG91bGQgaW5jbHVkZSBTb0MgCj4gZHRzaSBoZXJlIGFuZCBu
byBpbnRvIE1pY3JvRGV2IDIuMCBib2FyZC4gTm8gPwo+IAo+ICsjaW5jbHVkZSAic3RtMzJtcDE1
LXBpbmN0cmwuZHRzaSIKPiArI2luY2x1ZGUgInN0bTMybXAxNXh4YWEtcGluY3RybC5kdHNpIgoK
YW5kIHRoaXMgb25lOgorI2luY2x1ZGUgInN0bTMybXAxNTcuZHRzaSIKCj4gCj4gCj4gUmVnYXJk
cwo+IEFsZXgKPiAKPj4gKy8gewo+PiArwqDCoMKgIGNvbXBhdGlibGUgPSAiZW5naWNhbSxtaWNy
b2dlYS1zdG0zMm1wMSIsICJzdCxzdG0zMm1wMTU3IjsKPj4gKwo+PiArwqDCoMKgIG1lbW9yeUBj
MDAwMDAwMCB7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHhjMDAwMDAwMCAweDEwMDAwMDAw
PjsKPj4gK8KgwqDCoCB9Owo+PiArCj4+ICvCoMKgwqAgcmVzZXJ2ZWQtbWVtb3J5IHsKPj4gK8Kg
wqDCoMKgwqDCoMKgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+PiArwqDCoMKgwqDCoMKgwqAgI3Np
emUtY2VsbHMgPSA8MT47Cj4+ICvCoMKgwqDCoMKgwqDCoCByYW5nZXM7Cj4+ICsKPj4gK8KgwqDC
oMKgwqDCoMKgIG1jdXJhbTI6IG1jdXJhbTJAMTAwMDAwMDAgewo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBjb21wYXRpYmxlID0gInNoYXJlZC1kbWEtcG9vbCI7Cj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJlZyA9IDwweDEwMDAwMDAwIDB4NDAwMDA+Owo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBuby1tYXA7Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Owo+PiArCj4+ICvCoMKgwqDCoMKg
wqDCoCB2ZGV2MHZyaW5nMDogdmRldjB2cmluZzBAMTAwNDAwMDAgewo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInNoYXJlZC1kbWEtcG9vbCI7Cj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJlZyA9IDwweDEwMDQwMDAwIDB4MTAwMD47Cj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIG5vLW1hcDsKPj4gK8KgwqDCoMKgwqDCoMKgIH07Cj4+ICsKPj4gK8KgwqDCoMKg
wqDCoMKgIHZkZXYwdnJpbmcxOiB2ZGV2MHZyaW5nMUAxMDA0MTAwMCB7Cj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAic2hhcmVkLWRtYS1wb29sIjsKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MTAwNDEwMDAgMHgxMDAwPjsKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgbm8tbWFwOwo+PiArwqDCoMKgwqDCoMKgwqAgfTsKPj4gKwo+PiArwqDCoMKg
wqDCoMKgwqAgdmRldjBidWZmZXI6IHZkZXYwYnVmZmVyQDEwMDQyMDAwIHsKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJzaGFyZWQtZG1hLXBvb2wiOwo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgxMDA0MjAwMCAweDQwMDA+Owo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBuby1tYXA7Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Owo+PiArCj4+ICvCoMKg
wqDCoMKgwqDCoCBtY3VyYW06IG1jdXJhbUAzMDAwMDAwMCB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGNvbXBhdGlibGUgPSAic2hhcmVkLWRtYS1wb29sIjsKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmVnID0gPDB4MzAwMDAwMDAgMHg0MDAwMD47Cj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIG5vLW1hcDsKPj4gK8KgwqDCoMKgwqDCoMKgIH07Cj4+ICsKPj4gK8KgwqDCoMKgwqDC
oMKgIHJldHJhbTogcmV0cmFtQDM4MDAwMDAwIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y29tcGF0aWJsZSA9ICJzaGFyZWQtZG1hLXBvb2wiOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZWcgPSA8MHgzODAwMDAwMCAweDEwMDAwPjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
bm8tbWFwOwo+PiArwqDCoMKgwqDCoMKgwqAgfTsKPj4gK8KgwqDCoCB9Owo+PiArCj4+ICvCoMKg
wqAgdmluOiByZWd1bGF0b3ItdmluIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAi
cmVndWxhdG9yLWZpeGVkIjsKPj4gK8KgwqDCoMKgwqDCoMKgIHJlZ3VsYXRvci1uYW1lID0gInZp
biI7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDw1MDAwMDAw
PjsKPj4gK8KgwqDCoMKgwqDCoMKgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDUwMDAwMDA+
Owo+PiArwqDCoMKgwqDCoMKgwqAgcmVndWxhdG9yLWFsd2F5cy1vbjsKPj4gK8KgwqDCoCB9Owo+
PiArCj4+ICvCoMKgwqAgdmRkY29yZTogcmVndWxhdG9yLXZkZGNvcmUgewo+PiArwqDCoMKgwqDC
oMKgwqAgY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwo+PiArwqDCoMKgwqDCoMKgwqAg
cmVndWxhdG9yLW5hbWUgPSAidmRkY29yZSI7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZWd1bGF0b3It
bWluLW1pY3Jvdm9sdCA9IDwxMjAwMDAwPjsKPj4gK8KgwqDCoMKgwqDCoMKgIHJlZ3VsYXRvci1t
YXgtbWljcm92b2x0ID0gPDEyMDAwMDA+Owo+PiArwqDCoMKgwqDCoMKgwqAgcmVndWxhdG9yLWFs
d2F5cy1vbjsKPj4gK8KgwqDCoMKgwqDCoMKgIHZpbi1zdXBwbHkgPSA8JnZpbj47Cj4+ICvCoMKg
wqAgfTsKPj4gKwo+PiArwqDCoMKgIHZkZDogcmVndWxhdG9yLXZkZCB7Cj4+ICvCoMKgwqDCoMKg
wqDCoCBjb21wYXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7Cj4+ICvCoMKgwqDCoMKgwqDCoCBy
ZWd1bGF0b3ItbmFtZSA9ICJ2ZGQiOwo+PiArwqDCoMKgwqDCoMKgwqAgcmVndWxhdG9yLW1pbi1t
aWNyb3ZvbHQgPSA8MzMwMDAwMD47Cj4+ICvCoMKgwqDCoMKgwqDCoCByZWd1bGF0b3ItbWF4LW1p
Y3Jvdm9sdCA9IDwzMzAwMDAwPjsKPj4gK8KgwqDCoMKgwqDCoMKgIHJlZ3VsYXRvci1hbHdheXMt
b247Cj4+ICvCoMKgwqDCoMKgwqDCoCB2aW4tc3VwcGx5ID0gPCZ2aW4+Owo+PiArwqDCoMKgIH07
Cj4+ICsKPj4gK8KgwqDCoCB2ZGRxX2RkcjogcmVndWxhdG9yLXZkZHEtZGRyIHsKPj4gK8KgwqDC
oMKgwqDCoMKgIGNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsKPj4gK8KgwqDCoMKgwqDC
oMKgIHJlZ3VsYXRvci1uYW1lID0gInZkZHFfZGRyIjsKPj4gK8KgwqDCoMKgwqDCoMKgIHJlZ3Vs
YXRvci1taW4tbWljcm92b2x0ID0gPDEzNTAwMDA+Owo+PiArwqDCoMKgwqDCoMKgwqAgcmVndWxh
dG9yLW1heC1taWNyb3ZvbHQgPSA8MTM1MDAwMD47Cj4+ICvCoMKgwqDCoMKgwqDCoCByZWd1bGF0
b3ItYWx3YXlzLW9uOwo+PiArwqDCoMKgwqDCoMKgwqAgdmluLXN1cHBseSA9IDwmdmluPjsKPj4g
K8KgwqDCoCB9Owo+PiArfTsKPj4gKwo+PiArJmR0cyB7Cj4+ICvCoMKgwqAgc3RhdHVzID0gIm9r
YXkiOwo+PiArfTsKPj4gKwo+PiArJmZtYyB7Cj4+ICvCoMKgwqAgcGluY3RybC1uYW1lcyA9ICJk
ZWZhdWx0IiwgInNsZWVwIjsKPj4gK8KgwqDCoCBwaW5jdHJsLTAgPSA8JmZtY19waW5zX2E+Owo+
PiArwqDCoMKgIHBpbmN0cmwtMSA9IDwmZm1jX3NsZWVwX3BpbnNfYT47Cj4+ICvCoMKgwqAgc3Rh
dHVzID0gIm9rYXkiOwo+PiArCj4+ICvCoMKgwqAgbmFuZC1jb250cm9sbGVyQDQsMCB7Cj4+ICvC
oMKgwqDCoMKgwqDCoCBzdGF0dXMgPSAib2theSI7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIG5h
bmRAMCB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwwPjsKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbmFuZC1vbi1mbGFzaC1iYnQ7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjc2l6
ZS1jZWxscyA9IDwxPjsKPj4gK8KgwqDCoMKgwqDCoMKgIH07Cj4+ICvCoMKgwqAgfTsKPj4gK307
Cj4+ICsKPj4gKyZpcGNjIHsKPj4gK8KgwqDCoCBzdGF0dXMgPSAib2theSI7Cj4+ICt9Owo+PiAr
Cj4+ICsmaXdkZzJ7Cj4+ICvCoMKgwqAgdGltZW91dC1zZWMgPSA8MzI+Owo+PiArwqDCoMKgIHN0
YXR1cyA9ICJva2F5IjsKPj4gK307Cj4+ICsKPj4gKyZtNF9ycHJvY3sKPj4gK8KgwqDCoCBtZW1v
cnktcmVnaW9uID0gPCZyZXRyYW0+LCA8Jm1jdXJhbT4sIDwmbWN1cmFtMj4sIDwmdmRldjB2cmlu
ZzA+LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8JnZkZXYwdnJpbmcxPiwgPCZ2ZGV2MGJ1
ZmZlcj47Cj4+ICvCoMKgwqAgbWJveGVzID0gPCZpcGNjIDA+LCA8JmlwY2MgMT4sIDwmaXBjYyAy
PjsKPj4gK8KgwqDCoCBtYm94LW5hbWVzID0gInZxMCIsICJ2cTEiLCAic2h1dGRvd24iOwo+PiAr
wqDCoMKgIGludGVycnVwdC1wYXJlbnQgPSA8JmV4dGk+Owo+PiArwqDCoMKgIGludGVycnVwdHMg
PSA8NjggMT47Cj4+ICvCoMKgwqAgc3RhdHVzID0gIm9rYXkiOwo+PiArfTsKPj4gKwo+PiArJnJu
ZzEgewo+PiArwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsKPj4gK307Cj4+ICsKPj4gKyZydGN7Cj4+
ICvCoMKgwqAgc3RhdHVzID0gIm9rYXkiOwo+PiArfTsKPj4gKwo+PiArJnZyZWZidWYgewo+PiAr
wqDCoMKgIHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDI1MDAwMDA+Owo+PiArwqDCoMKgIHJl
Z3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDI1MDAwMDA+Owo+PiArwqDCoMKgIHZkZGEtc3VwcGx5
ID0gPCZ2ZGQ+Owo+PiArwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsKPj4gK307Cj4+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
