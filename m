Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5DD360BEA
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Apr 2021 16:35:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56AFAC57B79;
	Thu, 15 Apr 2021 14:35:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BE5FC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 14:35:43 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13FEWU1M032290; Thu, 15 Apr 2021 16:35:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=dd8MLNMxo70LEUwacsNT/EmSpkArncu11OuNGUbGgZ8=;
 b=L5XlhZ7sGVykh0fltQSnNx98qVaWO+8yPJ1HYHKsoRJfeoBammc9QL+aaLp15Gim21FD
 BTDDZ2Pc0TLJdDE8SA4fTtEqngMKj747ePu3OCJ+wcB2O9JDHbWw03CjQHBWrW3CgqJ1
 waxl6GL1kGib5XTiwmeRny6h7v9VF/PPkz63jjyhaccVyR34nk53D4iEZAIaaAD30nm3
 NwU7fgjjoqLBCP7ny+SvBnDP/nU4p5Je+nxn2m3q9VfY40I71dVOdlKKT41c1nRwjeNP
 +2ygpHdVuDdTvcge82wNYTj582BxWNYVYTp/F/fNgMCdQfMeKIXSoU/fDYepJle2R+ai ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37xg6w3854-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 16:35:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 72EC010002A;
 Thu, 15 Apr 2021 16:35:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 36130241571;
 Thu, 15 Apr 2021 16:35:27 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 15 Apr
 2021 16:35:26 +0200
To: Marek Vasut <marex@denx.de>, <arnd@arndb.de>, <robh+dt@kernel.org>,
 <jagan@amarulasolutions.com>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Marcin Sloniewski
 <marcin.sloniewski@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <20210415101037.1465-1-alexandre.torgue@foss.st.com>
 <20210415101037.1465-12-alexandre.torgue@foss.st.com>
 <3b39908b-a263-a5d4-f6ac-ac30ffb06269@denx.de>
 <36e9f0df-dfdb-e2f5-3d6e-ac32a1b8156e@foss.st.com>
 <fa3885df-8977-9540-f2af-d4095f519483@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <3961c9ae-41cc-5a15-2704-ffc0832f0fe8@foss.st.com>
Date: Thu, 15 Apr 2021 16:35:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fa3885df-8977-9540-f2af-d4095f519483@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_06:2021-04-15,
 2021-04-15 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 11/13] ARM: dts: stm32: fix LTDC port node
 on STM32 MCU ad MPU
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

CgpPbiA0LzE1LzIxIDQ6MzAgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDQvMTUvMjEgMzoz
NCBQTSwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPj4gSGkgTWFyZWsKPiAKPiBIZWxsbyBBbGV4
YW5kcmUsCj4gCj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdj
LWRrMi5kdHMgCj4+Pj4gYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1kazIuZHRzCj4+
Pj4gaW5kZXggMmJjOTJlZjNhZWI5Li4xOWVmNDc1YTQ4ZmMgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJj
aC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZGsyLmR0cwo+Pj4+ICsrKyBiL2FyY2gvYXJtL2Jv
b3QvZHRzL3N0bTMybXAxNTdjLWRrMi5kdHMKPj4+PiBAQCAtODIsOSArODIsMTUgQEAKPj4+PiDC
oCB9Owo+Pj4+IMKgICZsdGRjIHsKPj4+PiAtwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsKPj4+PiAt
Cj4+Pj4gwqDCoMKgwqDCoCBwb3J0IHsKPj4+PiArwqDCoMKgwqDCoMKgwqAgI2FkZHJlc3MtY2Vs
bHMgPSA8MT47Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgICNzaXplLWNlbGxzID0gPDA+Owo+Pj4+ICsK
Pj4+PiArwqDCoMKgwqDCoMKgwqAgbHRkY19lcDBfb3V0OiBlbmRwb2ludEAwIHsKPj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MD47Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmVtb3RlLWVuZHBvaW50ID0gPCZzaWk5MDIyX2luPjsKPj4+PiArwqDCoMKgwqDCoMKgwqAg
fTsKPj4+PiArCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGx0ZGNfZXAxX291dDogZW5kcG9pbnRA
MSB7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDE+Owo+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlbW90ZS1lbmRwb2ludCA9IDwmZHNpX2luPjsKPj4+Cj4+
PiBbLi4uXQo+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1
eHgtZGhjb3ItYXZlbmdlcjk2LmR0c2kgCj4+Pj4gYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1w
MTV4eC1kaGNvci1hdmVuZ2VyOTYuZHRzaQo+Pj4+IGluZGV4IDY0ZGNhNWI3Zjc0OC4uZTdmMTA5
NzVjYWNmIDEwMDY0NAo+Pj4+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRo
Y29yLWF2ZW5nZXI5Ni5kdHNpCj4+Pj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1
eHgtZGhjb3ItYXZlbmdlcjk2LmR0c2kKPj4+PiBAQCAtMjc3LDExICsyNzcsNyBAQAo+Pj4+IMKg
wqDCoMKgwqAgc3RhdHVzID0gIm9rYXkiOwo+Pj4+IMKgwqDCoMKgwqAgcG9ydCB7Cj4+Pj4gLcKg
wqDCoMKgwqDCoMKgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+Pj4+IC3CoMKgwqDCoMKgwqDCoCAj
c2l6ZS1jZWxscyA9IDwwPjsKPj4+PiAtCj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGx0ZGNfZXAwX291
dDogZW5kcG9pbnRAMCB7Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDA+Owo+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBsdGRjX2VwMF9vdXQ6IGVuZHBvaW50IHsKPj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZW1vdGUtZW5kcG9pbnQgPSA8JmFkdjc1MTNfaW4+Owo+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+Pj4+IMKgwqDCoMKgwqAgfTsKPj4+Cj4+PiBJIHRoaW5r
IHRoaXMgaXMgd3JvbmcsIHRoZSBBVjk2IGNhbiBoYXZlIHR3byBkaXNwbGF5cyBjb25uZWN0ZWQg
dG8gCj4+PiB0d28gcG9ydHMgb2YgdGhlIExUREMsIGp1c3QgbGlrZSBESzIgZm9yIGV4YW1wbGUu
Cj4+Cj4+IEFzIGZvciBkazIgYWRkcmVzcy9zaXplIGNlbGxzIGFyZSBhZGRlZCBvbmx5IGlmIHRo
ZXJlIGFyZSAyIGVuZHBvaW50cy4gCj4+IEl0IGlzIGZvciB0aGlzIHJlYXNvbiBJIG1vdmVkIGVu
ZHBvaW50MCBkZWZpbml0aW9uIGZyb20gCj4+IHN0bTMybXAxNXh4LWRreCB0byBzdG0zMm1wMTUx
YS1kazEuZHRzIChkazEgaGFzIG9ubHkgb25lIGVuZHBvaW50KS4KPj4KPj4gSGVyZSBpdCdzIHRo
ZSBzYW1lLCBpZiB5b3UgaGF2ZSBzZWNvbmQgZW5kcG9pbnQgdGhlbiBhZHJlc3Mvc2l6ZSB3aWxs
IAo+PiBoYXZlIHRvIGJlIGFkZGVkLgo+IAo+IFRoYXQncyBhIGJpdCBwcm9ibGVtYXRpYy4gQ29u
c2lkZXIgZWl0aGVyIHRoZSB1c2UgY2FzZSBvZiBEVE8gd2hpY2ggYWRkcyAKPiB0aGUgb3RoZXIg
ZGlzcGxheSwgb3IgZXZlbiBhIGN1c3RvbSBib2FyZCBEVFMuIFdpdGhvdXQgeW91ciBwYXRjaCwg
dGhpcyAKPiB3b3JrczoKPiAKPiBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNvci1h
dmVuZ2VyOTYuZHRzaQo+ICZsdGRjIHsKPiAgwqAgLi4uCj4gIMKgIHBvcnRzIHsKPiAgwqDCoMKg
IGx0ZGNfZXAwX291dDogZW5kcG9pbnRAMCB7Cj4gIMKgwqDCoMKgwqAgcmVtb3RlLWVuZHBvaW50
ID0gPCZhZHY3NTEzX2luPjsKPiAgwqDCoMKgIH07Cj4gIMKgIH07Cj4gfTsKPiAKPiBib2FyZC13
aXRoLWRpc3BsYXkuZHRzIG9yIGJvYXJkLW92ZXJsYXkuZHRzCj4gJmx0ZGMgewo+ICDCoCBwb3J0
cyB7Cj4gIMKgwqDCoCBlbmRwb2ludEAxIHsgLy8ganVzdCBhZGQgYW5vdGhlciBlbmRwb2ludEAx
LCBubyBwcm9ibGVtCj4gIMKgwqDCoMKgwqAgcmVtb3RlLWVuZHBvaW50ID0gPCZkaXNwbGF5PjsK
PiAgwqDCoMKgIH07Cj4gIMKgIH07Cj4gfTsKPiAKPiBXaXRoIHlvdXIgcGF0Y2gsIHRoZSBEVFMg
d291bGQgaGF2ZSB0byBtb2RpZnkgdGhlICJlbmRwb2ludCIgbm9kZSB0byBiZSAKPiAiZW5kcG9p
bnRAMCIgcHJvYmFibHkgd2l0aCBhIHdob2xlIGxvdCBvZiAvZGV0ZWxlLW5vZGUvIGV0Yy4gbWFn
aWMgKERUTyAKPiBjYW5ub3QgZG8gdGhhdCwgc28gdGhhdCdzIGEgcHJvYmxlbSwgYW5kIEkgZG8g
dXNlIERUT3Mgb24gQVY5NiAKPiBleHRlbnNpdmVseSBmb3IgdGhlIHZhcmlvdXMgZXhwYW5zaW9u
IGNhcmRzKSBhbmQgdGhlbiBhZGQgdGhlIAo+IGVuZHBvaW50QDEuIFRoYXQgYmVjb21lcyByZWFs
IGNvbXBsaWNhdGVkIGluIGN1c3RvbSBib2FyZCBEVCwgYW5kIAo+IGltcG9zc2libGUgd2l0aCBE
VE8uCgpZZXMgSSBhZ3JlZSB0aGF0IGl0J2xsIGJlIHByb2JsZW1hdGljLiBTbyBtYXliZSBzbyBz
b2x1dGlvbiB3b3VsZCBiZSB0byAKbm90IGRldGVjdCBhIHdhcm5pbmcgZm9yIHRoZSBpbml0aWFs
IGNhc2UgKG9ubHkgb25lIGVuZHBvaW50IHdpdGggYSByZWcpCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
