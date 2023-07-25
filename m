Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7739761AF6
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jul 2023 16:08:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7242FC6A61A;
	Tue, 25 Jul 2023 14:08:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49BFAC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 14:08:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36PDXDMu010531; Tue, 25 Jul 2023 16:08:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=aKox1fifr/MD7CscnSNaYClzgh1MKEowYV/1CFbHY8Q=;
 b=4sFWeFLREgJioc9H+rODp72hj3AVdLAeXn//m7QoqBPjLcHM3h6ErPmn4WA399Y/aITY
 Es+zEl+7c1OuNWP/mY/sYFUWBgIrS0ZnwoA5voqLfap1MOnNtJ/zdQsJH70zP6mKb4It
 up4nrSg6m/QvGFbwtP1STGuEVZLJ00BGoK2EjvjlEjCcZJFyhQQwWBxUeAAPCbeV4q3h
 6aBJcowFMNfbDdrNiVfgGpJZ6jk6/MU4C0knjVH4EQXo3oCJXoEvofraY3JZmoYetI5I
 ZcYWT0tL9hA+ODD+fHxyfM0nlDUmDa3FOMio5gfyLhC4I0CiM1Tbi4NIEhA6R3rIQpjx iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3s2bkbhv00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jul 2023 16:08:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B9F8E100048;
 Tue, 25 Jul 2023 16:07:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5ACB4241EF6;
 Tue, 25 Jul 2023 16:07:56 +0200 (CEST)
Received: from [10.201.21.121] (10.201.21.121) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 25 Jul
 2023 16:07:54 +0200
Message-ID: <1faa5511-a341-9c17-5e2a-974f8139d1d6@foss.st.com>
Date: Tue, 25 Jul 2023 16:07:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
 <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>, <vkoul@kernel.org>, <jic23@kernel.org>,
 <olivier.moysan@foss.st.com>, <arnaud.pouliquen@foss.st.com>,
 <mchehab@kernel.org>, <fabrice.gasnier@foss.st.com>,
 <andi.shyti@kernel.org>, <ulf.hansson@linaro.org>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <hugues.fruchet@foss.st.com>, <lee@kernel.org>, <will@kernel.org>,
 <catalin.marinas@arm.com>, <arnd@kernel.org>, <richardcochran@gmail.com>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-8-gatien.chevallier@foss.st.com>
 <61d93738-4ffd-411d-d32c-912c14eea56d@foss.st.com>
 <997780a9-1cbc-46a2-2743-7fd493682278@foss.st.com>
In-Reply-To: <997780a9-1cbc-46a2-2743-7fd493682278@foss.st.com>
X-Originating-IP: [10.201.21.121]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_08,2023-07-25_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-serial@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 07/10] arm64: dts: st: add RIFSC as a
 domain controller for STM32MP25x boards
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

SGkgQWxleCwKCk9uIDcvNi8yMyAxMTozMCwgR2F0aWVuIENIRVZBTExJRVIgd3JvdGU6Cj4gSGkg
QWxleCwKPiAKPiBPbiA3LzYvMjMgMTE6MjUsIEFsZXhhbmRyZSBUT1JHVUUgd3JvdGU6Cj4+IEhp
IEdhdGllbgo+Pgo+PiBPbiA3LzUvMjMgMTk6MjcsIEdhdGllbiBDaGV2YWxsaWVyIHdyb3RlOgo+
Pj4gUklGU0MgaXMgYSBmaXJld2FsbCBjb250cm9sbGVyLiBDaGFuZ2UgaXRzIGNvbXBhdGlibGUg
c28gdGhhdCBpcyBtYXRjaGVzCj4+PiB0aGUgZG9jdW1lbnRhdGlvbiBhbmQgcmVmZXJlbmNlIFJJ
RlNDIGFzIGEgZmVhdHVyZS1kb21haW4tY29udHJvbGxlci4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBHYXRpZW4gQ2hldmFsbGllciA8Z2F0aWVuLmNoZXZhbGxpZXJAZm9zcy5zdC5jb20+Cj4+PiAt
LS0KPj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpIHwgNSArKysr
LQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRz
aSAKPj4+IGIvYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kKPj4+IGluZGV4
IDUyNjhhNDMyMTg0MS4uNjIxMDEwODRjYWI4IDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9hcm02NC9i
b290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kKPj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
c3Qvc3RtMzJtcDI1MS5kdHNpCj4+PiBAQCAtMTA2LDE3ICsxMDYsMjAgQEAgc29jQDAgewo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgIHJhbmdlcyA9IDwweDAgMHgwIDB4MCAweDgwMDAwMDAwPjsKPj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCByaWZzYzogcmlmc2MtYnVzQDQyMDgwMDAwIHsKPj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAic2ltcGxlLWJ1cyI7Cj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInN0LHN0bTMybXAyNS1yaWZzYyI7Cj4+Cj4+
IFlvdSBjb3VsZCBrZWVwICJzaW1wbGUtYnVzIiBjb21wYXRpYmxlIChpbiBzZWNvbmQgcG9zaXRp
b24pLiBJbiBjYXNlIAo+PiBvZiB0aGUgUklGU0MgaXMgbm90IHByb2JlZCwgdGhlIHBsYXRmb3Jt
IHdpbGwgYmUgYWJsZSB0byBib290LiBJZiB5b3UgCj4+IGFncmVlIHlvdSBjYW4gdXNlIHRoZSBz
YW1lIGZvciBFVFpQQy4KPj4KPj4gQ2hlZXJzCj4+IEFsZXgKPiAKPiBTdXJlLCBnb29kIHBvaW50
Lgo+IAo+IEknbGwgY2hhbmdlIHRoYXQgaW4gVjIKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gR2F0aWVu
CgpBY3R1YWxseSwgaXQgd291bGQgYmUgYSBiYWQgaWRlYSB0byBrZWVwICJzaW1wbGUtYnVzIiBh
cyBhIGNvbXBhdGlibGUuCgpQcmFjdGljYWwgZXhhbXBsZToKMSkgRmlyZXdhbGwgY29udHJvbGxl
ciBmb3JiaWRzIGEgZGV2aWNlIHByb2JlIGJ5IG1hcmtpbmcgdGhlIGRldmljZSdzCm5vZGUgYXMg
cG9wdWxhdGVkIChPRl9QT1BVTEFURUQgZmxhZykuCjIpIFRoZSBzaW1wbGUtYnVzLCB3aGljaCBp
cyBzaW1wbGUsIHBvcHVsYXRlcyBhbGwgdGhlIGRldmljZXMKZnJvbSB0aGUgZGV2aWNlIHRyZWUg
ZGF0YSwgb3ZlcnJpZGluZyB3aGF0IHRoZSBmaXJld2FsbCBidXMgaGFzIGRvbmUuCjMpPT5Gb3Ji
aWRkZW4gZGV2aWNlJ3MgZHJpdmVyIHdpbGwgYmUgcHJvYmVkLgoKSSB0aGluayBpdCdzIGJlc3Qg
dG8ga2VlcCBvbmUgY29tcGF0aWJsZS4gSWYgc29tZW9uZSB3YW50cyB0aGVzZSBkcml2ZXJzCmFz
IGV4dGVybmFsIG1vZHVsZXMsIHRoZW4gaXQnbGwgYmUgYmVzdCB0byBoYW5kbGUgdGhpcyBkaWZm
ZXJlbnRseS4KSSdsbCByZXN1Ym1pdCB3aXRoIGEgc2luZ2xlIGNvbXBhdGlibGUgZm9yIFYyLCBw
bGVhc2UgZG8gbm90Cmhlc2l0YXRlIHRvIGNvbW1lbnQgb24gdGhlIFYyIGlmIHlvdSdyZSBub3Qg
b2theSB3aXRoIHRoaXMuCgpCZXN0IHJlZ2FyZHMsCkdhdGllbgoKPj4KPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDQyMDgwMDAwIDB4MTAwMD47Cj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICNzaXplLWNlbGxzID0gPDE+Owo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmFuZ2VzOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmVhdHVyZS1kb21haW4t
Y29udHJvbGxlcjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICNmZWF0dXJlLWRvbWFpbi1j
ZWxscyA9IDwxPjsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVzYXJ0Mjogc2VyaWFs
QDQwMGUwMDAwIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0
aWJsZSA9ICJzdCxzdG0zMmg3LXVhcnQiOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZWcgPSA8MHg0MDBlMDAwMCAweDQwMD47Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGludGVycnVwdHMgPSA8R0lDX1NQSSAxMTUgSVJRX1RZUEVfTEVWRUxf
SElHSD47Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2NrcyA9IDwm
Y2tfZmxleGdlbl8wOD47Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZlYXR1
cmUtZG9tYWlucyA9IDwmcmlmc2MgMzI+Owo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfTsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+PgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
