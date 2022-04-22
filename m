Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DAC50B827
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Apr 2022 15:16:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCA41C6049A;
	Fri, 22 Apr 2022 13:16:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45EA1C6047D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 13:16:26 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23M9OBxR028996;
 Fri, 22 Apr 2022 15:16:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=HKrOnxEaSGOfdkC3CfqMbJmY69fcKr8J+pM8Xhq9o2k=;
 b=YhMwq6LFh+zd1r5ZRUnqrf5yp9R0/AnPP1s3+MLZK21EdCoFsFJbzpWQo/Ld9NzZX2WC
 w0MHeC8lt8e0PHpMcg7Wy6S68G/3g+7B2o22ij/ajXYN/vRKvhEA7y9EIpVW35N4Sx0y
 ytoW9Gl7l32HtFn95iQJS8J3WMNbAOwXNcj4fVIqVgNmcbdJYulgdPj97DANmlvQn3ys
 11kXgCM8fMXccbQRmQZmOIRIAGOD8aG5WYtDXFvrg6bCBRE0GOMvH3+WtVCilvAWTbcL
 O3by7a6J0nbjvWpXoT+7TXe4m771Gvac2D3xDhjBsXTjCFPgYHOy2Eu+II/uK4slJApm 6g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fk4fvf1r2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Apr 2022 15:16:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 880AD100034;
 Fri, 22 Apr 2022 15:16:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 80D9721E663;
 Fri, 22 Apr 2022 15:16:03 +0200 (CEST)
Received: from [10.201.21.16] (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 22 Apr
 2022 15:16:02 +0200
Message-ID: <3a48ae9b-b8d9-138e-ec19-3512164bfc80@foss.st.com>
Date: Fri, 22 Apr 2022 15:15:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20220316131000.9874-1-gabriel.fernandez@foss.st.com>
 <20220316131000.9874-13-gabriel.fernandez@foss.st.com>
 <31f5d4af-5a4f-e683-c50e-d59b63135a99@foss.st.com>
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <31f5d4af-5a4f-e683-c50e-d59b63135a99@foss.st.com>
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_03,2022-04-22_01,2022-02-23_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH RESEND v3 12/13] ARM: dts: stm32: enable
 optee firmware and SCMI support on STM32MP13
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

Ck9uIDQvMjEvMjIgMTc6MjMsIEFsZXhhbmRyZSBUT1JHVUUgd3JvdGU6Cj4gSGkgR2FicmllbAo+
Cj4gT24gMy8xNi8yMiAxNDowOSwgZ2FicmllbC5mZXJuYW5kZXpAZm9zcy5zdC5jb20gd3JvdGU6
Cj4+IEZyb206IEdhYnJpZWwgRmVybmFuZGV6IDxnYWJyaWVsLmZlcm5hbmRlekBmb3NzLnN0LmNv
bT4KPj4KPj4gRW5hYmxlIG9wdGVlIGFuZCBTQ01JIGNsb2NrcyBzdXBwb3J0Lgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBHYWJyaWVsIEZlcm5hbmRleiA8Z2FicmllbC5mZXJuYW5kZXpAZm9zcy5zdC5j
b20+Cj4+IC0tLQo+PiDCoCBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTMxLmR0c2kgfCAzNyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzNyBp
bnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1w
MTMxLmR0c2kgCj4+IGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDEzMS5kdHNpCj4+IGluZGV4
IDI2MmRlNGVlYjRlZC4uNzhlYWM1MzIyNGQ0IDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybS9ib290
L2R0cy9zdG0zMm1wMTMxLmR0c2kKPj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDEz
MS5kdHNpCj4+IEBAIC0yNyw2ICsyNyw0MyBAQCBhcm0tcG11IHsKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIGludGVycnVwdC1wYXJlbnQgPSA8JmludGM+Owo+PiDCoMKgwqDCoMKgIH07Cj4+IMKgICvC
oMKgwqAgc2NtaV9zcmFtOiBzcmFtQDJmZmZmMDAwIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGNvbXBh
dGlibGUgPSAibW1pby1zcmFtIjsKPj4gK8KgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDJmZmZmMDAw
IDB4MTAwMD47Cj4+ICvCoMKgwqDCoMKgwqDCoCAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPj4gK8Kg
wqDCoMKgwqDCoMKgICNzaXplLWNlbGxzID0gPDE+Owo+PiArwqDCoMKgwqDCoMKgwqAgcmFuZ2Vz
ID0gPDAgMHgyZmZmZjAwMCAweDEwMDA+Owo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCBzY21pX3No
bTogc2NtaV9zaG1AMCB7Cj4KPiByZW5hbWUgdG8gc2NtaS1zcmFtQDAgdG8gbWF0Y2ggd2l0aCB5
YW1sIGRlc2NyaXB0aW9uCgpvawoKCj4KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0
aWJsZSA9ICJhcm0sc2NtaS1zaG1lbSI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9
IDwwIDB4ODA+Owo+PiArwqDCoMKgwqDCoMKgwqAgfTsKPj4gK8KgwqDCoCB9Owo+Cj4gQ2FuIHlv
dSBtb3ZlIHRoaXMgc3JhbSBub2RlIGluIFNvY3sgcGxlYXNlPwoKb2sKClRoYW5rJ3MgQWxleAoK
Cj4KPj4gKwo+PiArwqDCoMKgIGZpcm13YXJlIHsKPj4gK8KgwqDCoMKgwqDCoMKgIG9wdGVlIHsK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWV0aG9kID0gInNtYyI7Cj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAibGluYXJvLG9wdGVlLXR6IjsKPj4gK8KgwqDCoMKg
wqDCoMKgIH07Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIHNjbWk6IHNjbWkgewo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gImxpbmFybyxzY21pLW9wdGVlIjsKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICNzaXplLWNlbGxzID0gPDA+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBsaW5hcm8sb3B0ZWUtY2hhbm5lbC1pZCA9IDwwPjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc2htZW0gPSA8JnNjbWlfc2htPjsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
Y21pX2NsazogcHJvdG9jb2xAMTQgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJlZyA9IDwweDE0PjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjY2xvY2st
Y2VsbHMgPSA8MT47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+ICsKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc2NtaV9yZXNldDogcHJvdG9jb2xAMTYgewo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDE2PjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAjcmVzZXQtY2VsbHMgPSA8MT47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIH07Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Owo+PiArwqDCoMKgIH07Cj4+IMKgwqDCoMKgwqAg
Y2xvY2tzIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNsa19heGk6IGNsay1heGkgewo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjY2xvY2stY2VsbHMgPSA8MD47Cj4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
