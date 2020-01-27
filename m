Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBA614A25E
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jan 2020 11:57:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68A79C36B0B;
	Mon, 27 Jan 2020 10:57:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DF4CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2020 10:57:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00RAqVVc027061; Mon, 27 Jan 2020 11:57:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=q3IUqnq8uZOdoSYHGb0y6kLnvH+Tx0j/V7+lgKc4Nzo=;
 b=rpRfr6Dn/ZCXCve9TZDosVDdDszaMeVTTOoOJYbAPp/PZv4DEMWyjyNU9gDF+6fmIL9z
 mAxF7enBIwaeI2O8kbzEpnebCqQ32gFUXMIBrDre5X7ALOTnD7UB3TJQmAtAxt/RkuCk
 kzUCqVthoVzIjkPbRsw8t7LrRZ6Nicr2+iwtX/lm++8cB/KNL86BbGQrykT3LZNIAGeo
 AcohO9zoPTJ+GTIJfvHZeT/ZfwFptKWjp5EzPqka9nPlUJPxfvoj2vI+VLCkW2nd6jvO
 HG5j2MKCEwClLfKew0nb0D3g9iWTz8LX1osKBlil9o/3BgodOMmMi48x/IWvuEQ0vpHu Ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrdek8c0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2020 11:57:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5903B10002A;
 Mon, 27 Jan 2020 11:57:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4846B2A5B8E;
 Mon, 27 Jan 2020 11:57:40 +0100 (CET)
Received: from lmecxl0923.lme.st.com (10.75.127.51) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jan
 2020 11:57:39 +0100
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <20200110134823.14882-1-ludovic.barre@st.com>
 <20200110134823.14882-4-ludovic.barre@st.com>
 <CAPDyKFpBgRGbRjOKHygknUMvGt9AKke+svoSG+So4B7hdZ8AMw@mail.gmail.com>
From: Ludovic BARRE <ludovic.barre@st.com>
Message-ID: <075935e7-6c26-9baa-72a5-8dbdecef1e8e@st.com>
Date: Mon, 27 Jan 2020 11:57:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFpBgRGbRjOKHygknUMvGt9AKke+svoSG+So4B7hdZ8AMw@mail.gmail.com>
Content-Language: fr
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-27_02:2020-01-24,
 2020-01-27 signatures=0
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 3/9] mmc: mmci: add a reference at
 mmc_host_ops in mmci struct
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

CgpMZSAxLzI0LzIwIMOgIDI6MDkgUE0sIFVsZiBIYW5zc29uIGEgw6ljcml0wqA6Cj4gT24gRnJp
LCAxMCBKYW4gMjAyMCBhdCAxNDo0OSwgTHVkb3ZpYyBCYXJyZSA8bHVkb3ZpYy5iYXJyZUBzdC5j
b20+IHdyb3RlOgo+Pgo+PiBUaGlzIHBhdGNoIGFkZHMgbW1jX2hvc3Rfb3BzIHBvaW50ZXIgaW4g
bW1jaSBzdHJ1Y3QuCj4+IFRoZSB2YXJpYW50IGluaXQgZnVuY3Rpb24gbWF5IG5lZWQgdG8gYWRk
IGEgbW1jX2hvc3Rfb3BzLAo+PiBmb3IgZXhhbXBsZSB0byBhZGQgdGhlIGV4ZWN1dGVfdHVuaW5n
IHN1cHBvcnQgaWYgdGhpcyBmZWF0dXJlCj4+IGlzIGF2YWlsYWJsZS4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogTHVkb3ZpYyBCYXJyZSA8bHVkb3ZpYy5iYXJyZUBzdC5jb20+Cj4+IC0tLQo+PiAgIGRy
aXZlcnMvbW1jL2hvc3QvbW1jaS5jIHwgMSArCj4+ICAgZHJpdmVycy9tbWMvaG9zdC9tbWNpLmgg
fCAxICsKPj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tbWMvaG9zdC9tbWNpLmMgYi9kcml2ZXJzL21tYy9ob3N0L21tY2kuYwo+
PiBpbmRleCA3YjEzZDY2Y2JiMjEuLjAwYjQ3M2Y1NzA0NyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9tbWMvaG9zdC9tbWNpLmMKPj4gKysrIGIvZHJpdmVycy9tbWMvaG9zdC9tbWNpLmMKPj4gQEAg
LTE5MjMsNiArMTkyMyw3IEBAIHN0YXRpYyBpbnQgbW1jaV9wcm9iZShzdHJ1Y3QgYW1iYV9kZXZp
Y2UgKmRldiwKPj4KPj4gICAgICAgICAgaG9zdCA9IG1tY19wcml2KG1tYyk7Cj4+ICAgICAgICAg
IGhvc3QtPm1tYyA9IG1tYzsKPj4gKyAgICAgICBob3N0LT5tbWNfb3BzID0gJm1tY2lfb3BzOwo+
IAo+IE5pdHBpY2s6Cj4gCj4gQ2FuIHlvdSBwbGVhc2UgYWxzbyBtb3ZlIHRoZSBhc3NpZ25tZW50
ICJtbWMtPm9wcyA9ICZtbWNpX29wczsiIHRvCj4gdGhpcyBwbGFjZSBhcyB3ZWxsLCBhcyBJIHRo
aW5rIHRoZXNlIGJlbG9uZ3MgdG9nZXRoZXIuCgpPSwoKPiAKPj4KPj4gICAgICAgICAgLyoKPj4g
ICAgICAgICAgICogU29tZSB2YXJpYW50IChTVE0zMikgZG9lc24ndCBoYXZlIG9wZW5kcmFpbiBi
aXQsIG5ldmVydGhlbGVzcwo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9tbWNpLmgg
Yi9kcml2ZXJzL21tYy9ob3N0L21tY2kuaAo+PiBpbmRleCBlYTZhMGI1Nzc5ZDQuLjU1YWNjMDk3
MWE0NCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9tbWNpLmgKPj4gKysrIGIvZHJp
dmVycy9tbWMvaG9zdC9tbWNpLmgKPj4gQEAgLTQwNyw2ICs0MDcsNyBAQCBzdHJ1Y3QgbW1jaV9o
b3N0IHsKPj4gICAgICAgICAgdTMyICAgICAgICAgICAgICAgICAgICAgbWFzazFfcmVnOwo+PiAg
ICAgICAgICB1OCAgICAgICAgICAgICAgICAgICAgICB2cW1tY19lbmFibGVkOjE7Cj4+ICAgICAg
ICAgIHN0cnVjdCBtbWNpX3BsYXRmb3JtX2RhdGEgKnBsYXQ7Cj4+ICsgICAgICAgc3RydWN0IG1t
Y19ob3N0X29wcyAgICAgKm1tY19vcHM7Cj4+ICAgICAgICAgIHN0cnVjdCBtbWNpX2hvc3Rfb3Bz
ICAgICpvcHM7Cj4+ICAgICAgICAgIHN0cnVjdCB2YXJpYW50X2RhdGEgICAgICp2YXJpYW50Owo+
PiAgICAgICAgICBzdHJ1Y3QgcGluY3RybCAgICAgICAgICAqcGluY3RybDsKPj4gLS0KPj4gMi4x
Ny4xCj4+Cj4gCj4gS2luZCByZWdhcmRzCj4gVWZmZQo+IApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
