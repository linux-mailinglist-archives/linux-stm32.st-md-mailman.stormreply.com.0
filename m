Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45000360A8D
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Apr 2021 15:34:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA399C57B79;
	Thu, 15 Apr 2021 13:34:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2460C57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 13:34:23 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13FDWUHr008109; Thu, 15 Apr 2021 15:34:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=6uz0c1465Mr7NrQ4wXFaQunuUDFud5BrXBAfEglYGI4=;
 b=YljTdmTY1jCQQxC6XiUHCWeCqSwsT1ERsMTzeB6dIsfHQdUvXvLqVdKK4lliMKNm1I9B
 5Qjddswt0KWyIvS+4+bQ5AU+5iWkH1gfLgTmimtLv27ECqhCJRDc0m61FYU6tDWtRg5x
 O6sBtgKW4JzBe0ZWk7U1+GlGseTcNG3K8t2vyc5wgT60rVNAQg41y9Y//ZbzHQxsvedZ
 EBebJTGc5PLDC/5QeyPMdhJBd576nwwfwW+ibxK1be9jGdlvcn7oxPY9rfK6HKdCo43g
 FECNpdHpeiCDFAsCPNQ+StlQbWrgsP0YucOeu8+BW2V+Ig9mRJ4uEO6OOLRgv76uOpGY Xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37xg6w2wat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 15:34:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BABE610002A;
 Thu, 15 Apr 2021 15:34:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3FF97237049;
 Thu, 15 Apr 2021 15:34:08 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 15 Apr
 2021 15:34:07 +0200
To: Marek Vasut <marex@denx.de>, <arnd@arndb.de>, <robh+dt@kernel.org>,
 <jagan@amarulasolutions.com>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Marcin Sloniewski
 <marcin.sloniewski@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <20210415101037.1465-1-alexandre.torgue@foss.st.com>
 <20210415101037.1465-12-alexandre.torgue@foss.st.com>
 <3b39908b-a263-a5d4-f6ac-ac30ffb06269@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <36e9f0df-dfdb-e2f5-3d6e-ac32a1b8156e@foss.st.com>
Date: Thu, 15 Apr 2021 15:34:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3b39908b-a263-a5d4-f6ac-ac30ffb06269@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_05:2021-04-15,
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

SGkgTWFyZWsKCk9uIDQvMTUvMjEgMzoyMSBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gNC8x
NS8yMSAxMjoxMCBQTSwgQWxleGFuZHJlIFRvcmd1ZSB3cm90ZToKPj4gUnVubmluZyAibWFrZSBk
dGJzX2NoZWNrIFc9MSIsIHNvbWUgd2FybmluZ3MgYXJlIHJlcG9ydGVkIGNvbmNlcm5pbmcKPj4g
TFREQyBwb3J0IHN1Ym5vZGU6Cj4+Cj4+IC9zb2MvZGlzcGxheS1jb250cm9sbGVyQDVhMDAxMDAw
L3BvcnQ6Cj4+IHVubmVjZXNzYXJ5ICNhZGRyZXNzLWNlbGxzLyNzaXplLWNlbGxzIHdpdGhvdXQg
InJhbmdlcyIgb3IgY2hpbGQgInJlZyIKPj4gcHJvcGVydHkKPj4gL3NvYy9kaXNwbGF5LWNvbnRy
b2xsZXJANWEwMDEwMDAvcG9ydDogZ3JhcGggbm9kZSBoYXMgc2luZ2xlIGNoaWxkIG5vZGUKPj4g
J2VuZHBvaW50JywgI2FkZHJlc3MtY2VsbHMvI3NpemUtY2VsbHMgYXJlIG5vdCBuZWNlc3NhcnkK
PiAKPiBidHcgY291bGQgeW91IHJldGFpbiBkaWZmc3RhdCBvbiB5b3VyIHBhdGNoZXMgPyBJdCdz
IHVzZWZ1bCB0byBzZWUgd2hpY2ggCj4gZmlsZXMgY2hhbmdlZCByaWdodCBhd2F5Lgo+IFsuLi5d
Cj4gCj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1kazIuZHRz
IAo+PiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWRrMi5kdHMKPj4gaW5kZXggMmJj
OTJlZjNhZWI5Li4xOWVmNDc1YTQ4ZmMgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMybXAxNTdjLWRrMi5kdHMKPj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1
N2MtZGsyLmR0cwo+PiBAQCAtODIsOSArODIsMTUgQEAKPj4gwqAgfTsKPj4gwqAgJmx0ZGMgewo+
PiAtwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsKPj4gLQo+PiDCoMKgwqDCoMKgIHBvcnQgewo+PiAr
wqDCoMKgwqDCoMKgwqAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4+ICvCoMKgwqDCoMKgwqDCoCAj
c2l6ZS1jZWxscyA9IDwwPjsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgbHRkY19lcDBfb3V0OiBl
bmRwb2ludEAwIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDA+Owo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZW1vdGUtZW5kcG9pbnQgPSA8JnNpaTkwMjJfaW4+Owo+PiAr
wqDCoMKgwqDCoMKgwqAgfTsKPj4gKwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgbHRkY19lcDFfb3V0
OiBlbmRwb2ludEAxIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDE+Owo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZW1vdGUtZW5kcG9pbnQgPSA8JmRzaV9pbj47
Cj4gCj4gWy4uLl0KPiAKPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAx
NXh4LWRoY29yLWF2ZW5nZXI5Ni5kdHNpIAo+PiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAx
NXh4LWRoY29yLWF2ZW5nZXI5Ni5kdHNpCj4+IGluZGV4IDY0ZGNhNWI3Zjc0OC4uZTdmMTA5NzVj
YWNmIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNvci1h
dmVuZ2VyOTYuZHRzaQo+PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNv
ci1hdmVuZ2VyOTYuZHRzaQo+PiBAQCAtMjc3LDExICsyNzcsNyBAQAo+PiDCoMKgwqDCoMKgIHN0
YXR1cyA9ICJva2F5IjsKPj4gwqDCoMKgwqDCoCBwb3J0IHsKPj4gLcKgwqDCoMKgwqDCoMKgICNh
ZGRyZXNzLWNlbGxzID0gPDE+Owo+PiAtwqDCoMKgwqDCoMKgwqAgI3NpemUtY2VsbHMgPSA8MD47
Cj4+IC0KPj4gLcKgwqDCoMKgwqDCoMKgIGx0ZGNfZXAwX291dDogZW5kcG9pbnRAMCB7Cj4+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwwPjsKPj4gK8KgwqDCoMKgwqDCoMKgIGx0ZGNf
ZXAwX291dDogZW5kcG9pbnQgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZW1vdGUt
ZW5kcG9pbnQgPSA8JmFkdjc1MTNfaW4+Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4gwqDC
oMKgwqDCoCB9Owo+IAo+IEkgdGhpbmsgdGhpcyBpcyB3cm9uZywgdGhlIEFWOTYgY2FuIGhhdmUg
dHdvIGRpc3BsYXlzIGNvbm5lY3RlZCB0byB0d28gCj4gcG9ydHMgb2YgdGhlIExUREMsIGp1c3Qg
bGlrZSBESzIgZm9yIGV4YW1wbGUuCgpBcyBmb3IgZGsyIGFkZHJlc3Mvc2l6ZSBjZWxscyBhcmUg
YWRkZWQgb25seSBpZiB0aGVyZSBhcmUgMiBlbmRwb2ludHMuIApJdCBpcyBmb3IgdGhpcyByZWFz
b24gSSBtb3ZlZCBlbmRwb2ludDAgZGVmaW5pdGlvbiBmcm9tIHN0bTMybXAxNXh4LWRreCAKdG8g
c3RtMzJtcDE1MWEtZGsxLmR0cyAoZGsxIGhhcyBvbmx5IG9uZSBlbmRwb2ludCkuCgpIZXJlIGl0
J3MgdGhlIHNhbWUsIGlmIHlvdSBoYXZlIHNlY29uZCBlbmRwb2ludCB0aGVuIGFkcmVzcy9zaXpl
IHdpbGwgCmhhdmUgdG8gYmUgYWRkZWQuCgphbGV4CgoKCgoKCgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
