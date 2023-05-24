Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 262F270FA8D
	for <lists+linux-stm32@lfdr.de>; Wed, 24 May 2023 17:40:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3844C6B442;
	Wed, 24 May 2023 15:40:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05782C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 May 2023 15:39:58 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34OCHa9r031503; Wed, 24 May 2023 17:39:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=pFQA71vTmXlhs+z5x4AEKVl+aBjRGHsJvL9B84qGPfQ=;
 b=AiNiFLBZ/K+BBZpvJ1QyxuxUstPKLo8KBB80A3y+ObcuDc3A4q4itJjc5LZ3wq9dJ6yb
 S1lPA1RoFlOd6gAazPh07r1wnl3KzJZYQMP9WiUx0zb3HczZ8QUnPhmRPilTRxC2jK7U
 FfaxnrALsPdcqeCgdtujOkllkCZIZCaY8xuKBIbQ3UiuzS+oFA8sgm7XtoV+02eUi+4e
 2vO1I4BEAOpkBb9D7saYaKWKKt2FI1O0hJaCdKPHpzAKuAiXIGznNbJX0u01nF7OSwQ+
 mh1o++Jo1VM+5r2SDaNWpI+i7l9ULoNaU1kUtbVIYicqUVbQWomCN34uVxn2BlZi9Btw pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qrtgv1xa9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 May 2023 17:39:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C7CA710002A;
 Wed, 24 May 2023 17:39:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B9B2A23150D;
 Wed, 24 May 2023 17:39:33 +0200 (CEST)
Received: from [10.252.20.36] (10.252.20.36) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 24 May
 2023 17:39:33 +0200
Message-ID: <5bb496d0-6dc1-6ba3-6126-6429037ecf5a@foss.st.com>
Date: Wed, 24 May 2023 17:39:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230524133918.1439516-1-olivier.moysan@foss.st.com>
 <20230524133918.1439516-8-olivier.moysan@foss.st.com>
 <cc7a0a1a-31bb-92f4-6365-5e0c4a4bc85c@denx.de>
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <cc7a0a1a-31bb-92f4-6365-5e0c4a4bc85c@denx.de>
X-Originating-IP: [10.252.20.36]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_11,2023-05-24_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 7/8] ARM: dts: stm32: adopt generic iio
 bindings for adc channels on dhcor-drc
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

SGkgTWFyZWssCgpPbiA1LzI0LzIzIDE1OjU0LCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA1LzI0
LzIzIDE1OjM5LCBPbGl2aWVyIE1veXNhbiB3cm90ZToKPj4gVXNlIFNUTTMyIEFEQyBnZW5lcmlj
IGJpbmRpbmdzIGluc3RlYWQgb2YgbGVnYWN5IGJpbmRpbmdzIG9uCj4+IERIQ09SIERSQyBDb21w
YWN0IGJvYXJkLgo+Pgo+PiBUaGUgU1RNMzIgQURDIHNwZWNpZmljIGJpbmRpbmcgdG8gZGVjbGFy
ZSBjaGFubmVscyBoYXMgYmVlbiBkZXByZWNhdGVkLAo+PiBoZW5jZSBhZG9wdCB0aGUgZ2VuZXJp
YyBJSU8gY2hhbm5lbHMgYmluZGluZ3MsIGluc3RlYWQuCj4+IFRoZSBTVE0zMk1QMTUxIGRldmlj
ZSB0cmVlIG5vdyBleHBvc2VzIGludGVybmFsIGNoYW5uZWxzIHVzaW5nIHRoZQo+PiBnZW5lcmlj
IGJpbmRpbmcuIFRoaXMgbWFrZXMgdGhlIGNoYW5nZSBtYW5kYXRvcnkgaGVyZSB0byBhdm9pZCBh
IG1peGVkCj4+IHVzZSBvZiBsZWdhY3kgYW5kIGdlbmVyaWMgYmluZGluZywgd2hpY2ggaXMgbm90
IHN1cHBvcnRlZCBieSB0aGUgZHJpdmVyLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBPbGl2aWVyIE1v
eXNhbiA8b2xpdmllci5tb3lzYW5AZm9zcy5zdC5jb20+Cj4+IC0tLQo+PiDCoCAuLi4vZHRzL3N0
bTMybXAxNXh4LWRoY29yLWRyYy1jb21wYWN0LmR0c2nCoMKgwqAgfCAyOCArKysrKysrKysrKysr
KysrLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhj
b3ItZHJjLWNvbXBhY3QuZHRzaSAKPj4gYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1k
aGNvci1kcmMtY29tcGFjdC5kdHNpCj4+IGluZGV4IDM5YWY3OWRjNjU0Yy4uOTJkOTA2YmZkNWQ3
IDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNvci1kcmMt
Y29tcGFjdC5kdHNpCj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRoY29y
LWRyYy1jb21wYWN0LmR0c2kKPj4gQEAgLTU3LDE1ICs1NywzNSBAQCAmYWRjIHvCoMKgwqAgLyog
WDExIEFEQyBpbnB1dHMgKi8KPj4gwqDCoMKgwqDCoCBzdGF0dXMgPSAib2theSI7Cj4+IMKgwqDC
oMKgwqAgYWRjMTogYWRjQDAgewo+IAo+IAo+IEkgc2VudCBzaW1pbGFyIHBhdGNoIHJlY2VudGx5
IHRvbzoKPiAKPiBbUEFUQ0hdIEFSTTogZHRzOiBzdG0zMjogVXBkYXRlIHRvIGdlbmVyaWMgQURD
IGNoYW5uZWwgYmluZGluZyBvbiBESFNPTSAKPiBzeXN0ZW1zCj4gCj4gQnV0IEkgbmVlZGVkIHRv
IGFkZCAjYWRkcmVzcy1jZWxscy8jc2l6ZS1jZWxscyBoZXJlIGFuZCB0byBhZGNAMTAwLCAKPiBv
dGhlcndpc2UgRFRCIGNoZWNrZXIgd2FzIGNvbXBsYWluaW5nIC4gRGlkIHlvdSBydW4gRFRCIGNo
ZWNrIGFuZCB3YXMgaXQgCj4gT0sgb24geW91ciBzaWRlID8KClRoZSBmaXJzdCBwYXRjaCBpbiB0
aGlzIHNlcmllIGFkZHMgdGhlICNhZGRyZXNzLWNlbGxzLyNzaXplLWNlbGxzIHRvIHRoZSAKICBT
b0MgRFQuIFNvLCB0aGVyZSBpcyBubyBuZWVkIHRvIGFkZCB0aGVtIGxhdGVyIGluIHRoZSBib2Fy
ZCBEVC4KCkkgY2FuIHNlbmQgYSB2MiB3aXRoIHlvdXIgcGF0Y2ggKGFmdGVyIHJlbW92aW5nIHRo
ZSBjZWxscyBwcm9wZXJ0aWVzIApmcm9tIHRoZSBwYXRjaCkuIEhhdmluZyBhbGwgdGhlIHBhdGNo
ZXMgaW4gdGhlIHNhbWUgc2VyaWUsIHdpbGwgaGVscCAKYXZvaWRpbmcgc2VxdWVuY2luZyBwcm9i
bGVtcy4KCkRvIHlvdSBhZ3JlZSB3aXRoIHRoaXMgPwoKQlJzCk9saXZpZXIKCj4gCj4+IC3CoMKg
wqDCoMKgwqDCoCBzdCxhZGMtY2hhbm5lbHMgPSA8MCAxIDY+Owo+PiAtwqDCoMKgwqDCoMKgwqAg
c3QsbWluLXNhbXBsZS10aW1lLW5zZWNzID0gPDUwMDA+Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
c3RhdHVzID0gIm9rYXkiOwo+PiArwqDCoMKgwqDCoMKgwqAgY2hhbm5lbEAwIHsKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDA+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
dCxtaW4tc2FtcGxlLXRpbWUtbnMgPSA8NTAwMD47Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Owo+PiAr
wqDCoMKgwqDCoMKgwqAgY2hhbm5lbEAxIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVn
ID0gPDE+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdCxtaW4tc2FtcGxlLXRpbWUtbnMg
PSA8NTAwMD47Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Owo+PiArwqDCoMKgwqDCoMKgwqAgY2hhbm5l
bEA2IHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDY+Owo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzdCxtaW4tc2FtcGxlLXRpbWUtbnMgPSA8NTAwMD47Cj4+ICvCoMKgwqDC
oMKgwqDCoCB9Owo+PiDCoMKgwqDCoMKgIH07Cj4gCj4gWy4uLl0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
