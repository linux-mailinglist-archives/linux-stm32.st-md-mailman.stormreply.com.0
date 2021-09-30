Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C432641DCF3
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Sep 2021 17:06:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63F5CC5A4CD;
	Thu, 30 Sep 2021 15:06:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7BB2C597AB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Sep 2021 15:06:02 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18UDUKPh006556; 
 Thu, 30 Sep 2021 17:05:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=sspGCg/P+hrJnTfsc1SrMwVnAR/3nxeD+gtuxpS5IiQ=;
 b=3N+iS++7Dx0oCCzhKcR+yKwrvwy+vQfuqhzBPj6pF11pCgtAcRPiDW9j3sYI6DnO+HDr
 X1nBnNqcM1hKNDqq/G8cCXSX5BPZTDraKSt955VkoK+Ot83dR74RyUmeAgBneitrqQdh
 Dt/oCso4n2EWHzziukyocysFbHvMhQCJcfFd5N30ihikO2dozrDoZXww3gHdQ8oJ4ybF
 V9psSspNagjdDkZGKs7Ib3ZYI5JuROUDQ4CYW5fGlyvxOaDAyd1IKBR7aaI1ZbuJpmez
 03HL/QyWBfgAGjaFkYGO7Y5vSkQuSlPqVF4dgdN5g4ROVh0ZGaob/vKm7qkNZ+ULus+Q 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bde69rh62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 17:05:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3F0A410002A;
 Thu, 30 Sep 2021 17:05:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2D0232A4D71;
 Thu, 30 Sep 2021 17:05:53 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 30 Sep
 2021 17:05:52 +0200
To: Marek Vasut <marex@denx.de>, Olivier Moysan <olivier.moysan@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
References: <20210927114553.21843-1-olivier.moysan@foss.st.com>
 <beb6e7c8-f3c8-fc4e-6017-fea5690b9f33@denx.de>
 <e8d40be8-045c-096a-f079-d9f6364254e9@foss.st.com>
 <cfbb8475-ad1e-9075-cd82-92a8b315efc9@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <9b278eb2-7ca9-0e4b-ecb1-5949ce3c5c10@foss.st.com>
Date: Thu, 30 Sep 2021 17:05:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <cfbb8475-ad1e-9075-cd82-92a8b315efc9@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_05,2021-09-30_01,2020-04-07_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/1] ARM: dts: stm32: fix AV96 board SAI2B
 pin muxing on stm32mp15
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

T24gOS8zMC8yMSAxMjoyNiBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gOS8zMC8yMSAxMDo0
NyBBTSwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPj4gSGkgTWFyZWsKPj4KPj4gT24gOS8yOS8y
MSAxOjE4IFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPj4+IE9uIDkvMjcvMjEgMTo0NSBQTSwgT2xp
dmllciBNb3lzYW4gd3JvdGU6Cj4+Pj4gRml4IFNBSTJCIHBpbiBtdXhpbmcgZm9yIEFWOTYgYm9h
cmQgb24gU1RNMzJNUDE1Lgo+Pj4+IFRoZSBsYWJlbCAic2FpMmEtNCIgaXMgZGVmaW5lZCB0d2lj
ZS4gQ2hhbmdlIHJlZHVuZGFudCBsYWJlbCB0byAKPj4+PiAic2FpMmItNCIuCj4+Pj4KPj4+PiBG
aXhlczogZGNmMTg1Y2E4MTc1ICgiQVJNOiBkdHM6IHN0bTMyOiBBZGQgYWx0ZXJuYXRlIHBpbm11
eCBmb3IgU0FJMiAKPj4+PiBwaW5zIG9uIHN0bTMybXAxNSIpCj4+Pj4KPj4+PiBTaWduZWQtb2Zm
LWJ5OiBPbGl2aWVyIE1veXNhbiA8b2xpdmllci5tb3lzYW5AZm9zcy5zdC5jb20+Cj4+Pj4gLS0t
Cj4+Pj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1LXBpbmN0cmwuZHRzaSB8IDIgKy0K
Pj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+
Pgo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTUtcGluY3RybC5k
dHNpIAo+Pj4+IGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1LXBpbmN0cmwuZHRzaQo+Pj4+
IGluZGV4IDViNjBlY2JkNzE4Zi4uYjljYzllMGRkNGZjIDEwMDY0NAo+Pj4+IC0tLSBhL2FyY2gv
YXJtL2Jvb3QvZHRzL3N0bTMybXAxNS1waW5jdHJsLmR0c2kKPj4+PiArKysgYi9hcmNoL2FybS9i
b290L2R0cy9zdG0zMm1wMTUtcGluY3RybC5kdHNpCj4+Pj4gQEAgLTEyMzUsNyArMTIzNSw3IEBA
Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+Pj4gwqDCoMKgwqDCoCB9Owo+Pj4+IC3CoMKg
wqAgc2FpMmJfcGluc19jOiBzYWkyYS00IHsKPj4+PiArwqDCoMKgIHNhaTJiX3BpbnNfYzogc2Fp
MmItNCB7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHBpbnMxIHsKPj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBwaW5tdXggPSA8U1RNMzJfUElOTVVYKCdGJywgMTEsIEFGMTApPjsgLyog
U0FJMl9TRF9CICovCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmlhcy1kaXNhYmxl
Owo+Pj4KPj4+IFRoaXMgbXAxIHBpbm11eGluZyBpcyBhIHRvdGFsIG1lc3MsIHNpZ2guCj4+Cj4+
IFdoYXQgaXMgdGhlIGlzc3VlIGhlcmUgPwo+IAo+IFRoZSBzYW1lLW9sZCBkaXNjdXNzaW9uIGFi
b3V0IHdoZXJlIHRvIHBsYWNlIHRoZSBwaW5tdXggbm9kZXMsIHdoZXRoZXIgCj4gd2Ugc2hvdWxk
IGhhdmUgdGhlc2UgY2x1c3RlcnMgb2YgcHJlLWRlZmluZWQgb3B0aW9ucyBpbiAuLi5waW5jdHJs
LmR0c2ksIAo+IG9yIHdoZXRoZXIgd2Ugc2hvdWxkIGRvIG1vcmUgbnhwLWxpa2UgcGVyLWJvYXJk
IGNvbmZpZ3VyYXRpb24uCgpvayBpdCdzIGEgYml0IG1vcmUgcHJlY2lzZS4gSG9uZXN0bHkgSSBk
b24ndCB1bmRlcnN0YW5kIHdoeSB0aGUgY3VycmVudCAKdG9wb2xvZ3kgaXMgYW4gaXNzdWUgaGVy
ZS4gTWF5YmUgcGluY3RybCBTQUkgbm9kZXMgbmFtZXMgYXJlIG5vdCB3ZWxsIApjaG9zZW4gb3Ig
YXJlIG5vdCBlbm91Z2ggZXhwbGljaXQuIENvbmNlcm5pbmcgb3VyIHRvcG9sb2d5IGFuZCB0aGUg
TlhQIApvbmVzIGJvdGggZXhpc3RzIGFuZCBib3RoIGhhdmUgYWR2YW50YWdlcyBhbmQgZHJhd2Jh
Y2tzLiBGb3IgU1QgYm9hcmRzIAooREsvRVYpIHdlIHdhbnQgdG8ga2VlcCBhbGwgY29uZmlncyBp
biB0aGUgc2FtZSBwbGFjZS4KCkFzIEkgcHJlZmVyIHRvIG5vdCByZSBvcGVuIHRoaXMgdG9waWMg
YWdhaW4gYW5kIGFnYWluLCBmZWVsIGZyZWUgdG8gYWRkIAp5b3VyIHBpbiBjb25maWcgaW4geW91
ciBkdHMgYm9hcmQgZmlsZSwgSSdsbCBhY2NlcHQgaXQuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
