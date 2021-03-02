Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6330329952
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Mar 2021 11:20:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62F8BC57189;
	Tue,  2 Mar 2021 10:20:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CC66C5660F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Mar 2021 10:20:23 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122AHmce015298; Tue, 2 Mar 2021 11:20:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=AHNRA07W/8XeOi1fcP+UwN+hE9l5HeWlAvjNP7Od2XQ=;
 b=K44Nf8dxpJTK46y0qHK1yIq2djKmoAPatyObmNxYQPiIHtUDRntpEEGxwmjemolYJOln
 TwbbG4a5qd9k9WdP1v6bqkilm8txSV4YWh2FMjdeyLo0GsgGF4KSKVWDkXaI3jzl75y+
 x84hXPiJBBmoociIaR/6Cv4F1QVmeyaMRocSFDuzJ7i0ljHCHU0VoSRtZyMIprqvkHEP
 Gsq7KBRJwOD0nOLLa0NZI6Q1MTY1hjGfS1xcN/CMXD4DTnGW0mdvpZNxSbwWD3l50Yfj
 r6gBbq9PjvdEQl60wr1Shi3WdX2iPAmaoNBZQ8kSJnLQpKWrnkDlvCnxz13uddjcsCbQ 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36yf9q1dun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 11:20:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 93F86100034;
 Tue,  2 Mar 2021 11:20:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 717022C38D2;
 Tue,  2 Mar 2021 11:20:09 +0100 (CET)
Received: from [10.211.13.170] (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Mar
 2021 11:20:08 +0100
To: Martin DEVERA <devik@eaxlabs.cz>, <linux-kernel@vger.kernel.org>
References: <CAL_JsqK8+M=Vg0PiDXP2f1LrEp4hSVea6piAASMGu1H=pxme6Q@mail.gmail.com>
 <20210227164157.30971-1-devik@eaxlabs.cz>
 <439a0d7a-cc0e-764b-7ed8-668b5a85f4a7@foss.st.com>
 <fbdce86c-a17f-7626-51e4-9e48ea25001e@eaxlabs.cz>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <019b62e9-ec9b-d366-ee77-59c980d66a07@foss.st.com>
Date: Tue, 2 Mar 2021 11:20:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fbdce86c-a17f-7626-51e4-9e48ea25001e@eaxlabs.cz>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_03:2021-03-01,
 2021-03-02 signatures=0
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Le Ray <erwan.leray@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-serial@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] tty/serial: Add rx-tx-swap OF
 option to stm32-usart
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

T24gMy8xLzIxIDExOjQwIFBNLCBNYXJ0aW4gREVWRVJBIHdyb3RlOgo+IE9uIDMvMS8yMSAxMToy
OCBBTSwgRmFicmljZSBHYXNuaWVyIHdyb3RlOgo+PiBPbiAyLzI3LzIxIDU6NDEgUE0sIE1hcnRp
biBEZXZlcmEgd3JvdGU6Cj4+PiBTVE0zMiBGNy9INyB1c2FydHMgc3VwcG9ydHMgUlggJiBUWCBw
aW4gc3dhcHBpbmcuCj4+PiBBZGQgb3B0aW9uIHRvIHR1cm4gaXQgb24uCj4+PiBUZXN0ZWQgb24g
U1RNMzJNUDE1Ny4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gRGV2ZXJhIDxkZXZpa0Bl
YXhsYWJzLmN6Pgo+Pj4gLS0tCj4+PiDCoCBkcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNhcnQu
YyB8IDMgKystCj4+PiDCoCBkcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuaCB8IDEgKwo+
Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+
Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmMKPj4+IGIv
ZHJpdmVycy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmMKPj4+IGluZGV4IGIzNjc1Y2YyNWE2OS4u
MzY1MGM4Nzk4MDYxIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL3N0bTMyLXVz
YXJ0LmMKPj4+ICsrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jCj4+PiBAQCAt
NzU4LDcgKzc1OCw3IEBAIHN0YXRpYyB2b2lkIHN0bTMyX3VzYXJ0X3NldF90ZXJtaW9zKHN0cnVj
dAo+Pj4gdWFydF9wb3J0ICpwb3J0LAo+Pj4gwqDCoMKgwqDCoCBjcjEgPSBVU0FSVF9DUjFfVEUg
fCBVU0FSVF9DUjFfUkU7Cj4+PiDCoMKgwqDCoMKgIGlmIChzdG0zMl9wb3J0LT5maWZvZW4pCj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgY3IxIHw9IFVTQVJUX0NSMV9GSUZPRU47Cj4+PiAtwqDCoMKg
IGNyMiA9IDA7Cj4+PiArwqDCoMKgIGNyMiA9IHN0bTMyX3BvcnQtPnN3YXAgPyBVU0FSVF9DUjJf
U1dBUCA6IDA7Cj4+IEhpIE1hcnRpbiwKPj4KPj4gU2FtZSBjb3VsZCBiZSBkb25lIGluIHRoZSBz
dGFydHVwIHJvdXRpbmUsIHRoYXQgZW5hYmxlcyB0aGUgcG9ydCBmb3IKPj4gcmVjZXB0aW9uIChh
cyBkZXNjcmliZWQgaW4gRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3NlcmlhbC9kcml2ZXIucnN0
KQo+IEhlbGxvIEZhYnJpY2UsCj4gCj4gSSBhbHJlYWR5IGluY29ycG9yYXRlZCBhbGwgeW91ciBj
b21tZW50cyBidXQgSSdtIHN0cnVnZ2xpbmcgd2l0aCB0aGUgb25lCj4gYWJvdmUuCj4gVGhlIGNv
ZGUgbXVzdCBiZSBpbiBzdG0zMl91c2FydF9zZXRfdGVybWlvcyB0b28sIGJlY2F1c2UgQ1IyIGlz
IG1vZGlmaWVkLgoKSGkgTWFydGluLAoKWWVzLCBzdXJlLAoKPiBXaGF0IGlzIHRoZSByZWFzb24g
dG8gaGF2ZSBpdCBpbiBzdGFydHVwKCkgPwoKUlggaXMgZW5hYmxlZCBhdCBib3RoIHBsYWNlcy4g
U28gdGhlIHN3YXAgc2V0dGluZyBzaG91bGQgYmUgdGhlcmUgdG9vLgoKPiBJcyBpdCBiZWNhdXNl
IFVTQVJUIGNhbiBiZSBzdGFydGVkIHdpdGhvdXQgY2FsbGluZyBzZXRfdGVybWlvcyBhdCBhbGwg
PwoKWWVzLCB0aGF0J3Mgd2hhdCB0aGUgZHJpdmVyIEFQSSBleHBlY3RzOiAic3RhcnR1cChwb3J0
KSIgLi4uICJFbmFibGUgdGhlCnBvcnQgZm9yIHJlY2VwdGlvbi4iCgpCZXN0IFJlZ2FyZHMsCkZh
YnJpY2UKCj4gTGlrZQo+IHRvIHJldXNlIGJvb3Rsb2FkZXIncyBsYXN0IHNldHRpbmdzID8KPiAK
PiBUaGFua3MsIE1hcnRpbgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
