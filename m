Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A7C3CA199
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jul 2021 17:43:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88604C59781;
	Thu, 15 Jul 2021 15:43:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 811FAC57B6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 15:43:10 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16FFg5Q9009297; Thu, 15 Jul 2021 17:43:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=xBizReg6daLGwSxvepKRoKIgIOM99jAHNMLr9VWW678=;
 b=0qxzQnke84It6S8A+mKPRvxVrwpgaPuE0efs1VXalIXz8/aY1GRUGt4PndLibZ8omjQY
 I8nIvHHdywlMsvDUTzqpz31gmZOagfCKfzC4JTjPQdPDCcX6B0nkWDl4kgb6m35tAjpC
 6CPpTFPLSFl4vjHDmMTPq3255LXknIE4ZkV1kDTVFmkuH64vcEcy8DHFssJw2FsiP/0E
 4iWIeFPxpDOHQRJlfF6FfVJjtneyc+JMRHNlyrlZpLafuqZUG4Z33mloTX8muFcpCy9Q
 Mr2iYn1JnWM7OxZJkG4sY2A75g0TNa5i1XLlF8HQ78wCdnUyGCJu5JHsmX3Y9DJOeT8U IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39thrst9re-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jul 2021 17:43:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CB9FB10002A;
 Thu, 15 Jul 2021 17:43:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BC90C231DE2;
 Thu, 15 Jul 2021 17:43:04 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 15 Jul
 2021 17:43:04 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20210610150306.30072-1-marex@denx.de>
 <a393eb0b-a8d6-e29a-62c8-8988429c9139@foss.st.com>
 <8ab267d3-3b89-878c-861d-c53a672f213a@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <091a126a-bd57-8f3d-9f36-821715441fcd@foss.st.com>
Date: Thu, 15 Jul 2021 17:43:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8ab267d3-3b89-878c-861d-c53a672f213a@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-15_10:2021-07-14,
 2021-07-15 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Set {bitclock,
 frame}-master phandles on ST DKx
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

T24gNy8xNS8yMSA1OjM4IFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA3LzE1LzIxIDU6Mjcg
UE0sIEFsZXhhbmRyZSBUT1JHVUUgd3JvdGU6Cj4+IEhpIE1hcmVrCj4gCj4gSGksCj4gCj4gWy4u
Ll0KPiAKPj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1ka3gu
ZHRzaSAKPj4+IGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGt4LmR0c2kKPj4+IGlu
ZGV4IDU5ZjE4ODQ2Y2Y1ZC4uNTg2YWFjOGE5OThjIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9hcm0v
Ym9vdC9kdHMvc3RtMzJtcDE1eHgtZGt4LmR0c2kKPj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMybXAxNXh4LWRreC5kdHNpCj4+PiBAQCAtMjIwLDE1ICsyMjAsMTUgQEAgY3M0Mmw1MV9w
b3J0OiBwb3J0IHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNzNDJsNTFfdHhfZW5k
cG9pbnQ6IGVuZHBvaW50QDAgewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZWcgPSA8MD47Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlbW90
ZS1lbmRwb2ludCA9IDwmc2FpMmFfZW5kcG9pbnQ+Owo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBmcmFtZS1tYXN0ZXI7Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGJpdGNsb2NrLW1hc3RlcjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ZnJhbWUtbWFzdGVyID0gPCZjczQybDUxX3R4X2VuZHBvaW50PjsKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYml0Y2xvY2stbWFzdGVyID0gPCZjczQybDUxX3R4X2VuZHBvaW50
PjsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjczQybDUxX3J4X2VuZHBvaW50OiBlbmRwb2ludEAxIHsKPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDE+Owo+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZW1vdGUtZW5kcG9pbnQgPSA8JnNhaTJiX2VuZHBvaW50PjsK
Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJhbWUtbWFzdGVyOwo+Pj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiaXRjbG9jay1tYXN0ZXI7Cj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyYW1lLW1hc3RlciA9IDwmY3M0Mmw1MV9yeF9lbmRw
b2ludD47Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJpdGNsb2NrLW1hc3Rl
ciA9IDwmY3M0Mmw1MV9yeF9lbmRwb2ludD47Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB9Owo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+PiDCoMKgwqDCoMKgIH07Cj4+Pgo+Pgo+
PiBBcHBsaWVkIG9uIHN0bTMyLW5leHQuIFRoYW5rcyB0byB1cGRhdGUgdGhlIERLeCBib2FyZC4g
Tm90ZSB0aGF0IAo+PiAiY2lycnVzLGNzNDJsNTEueWFtbCIgaGFzIHRvIGJlIGFsc28gdXBkYXRl
ZC4gRGlkIHlvdSBhbHNvIHNlbnQgeWFtbCAKPj4gdXBkYXRlIGFzaWRlIHRoaXMgcGF0Y2ggPwo+
IAo+IE5vcGUsIHNvcnJ5LgoKTm8gcGIsIHdlJ2xsIGRvLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
