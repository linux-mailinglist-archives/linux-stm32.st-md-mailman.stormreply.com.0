Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2B98C728E
	for <lists+linux-stm32@lfdr.de>; Thu, 16 May 2024 10:14:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B462C6C83A;
	Thu, 16 May 2024 08:14:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE36EC69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 May 2024 08:14:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44G7mxDh002240;
 Thu, 16 May 2024 10:13:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=zsebgqL7ME1csjyfoz1MEw6bVhUR+QtHfWqn47Yy6Es=; b=Zv
 Foatxbf8NVvCbuOSQfGXHE1SkqeW9cluSq3uZxNTrpQU/9cAAxkiz0etBZzNTJdt
 ZB5RzL5nUDpIoelVVCx6DwBGMaO2HiWPcHbclL/niBQzTAKnDBXQj5mnrAbYaocX
 Q+1aUeL0npOqrQTYpNL70K/TI9VA7j+7kUxmnyMVgukUPr2tnU2jb/6kkoPO1dEB
 8T06x96m8xaluiS0oN6NU0kQYw93FS24DuerDIPrAPh6KEEfitSYpLtGW2iMwcuT
 LWHn2/2mGU6yAC8huIJvlr6gTSTKNiLk9kgVY8EbG2Wky03Lc1pKAsz+cHmyXqmO
 8XLdqVjDHkicnZSub0/w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y4sxvmacv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 May 2024 10:13:49 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C96DE4002D;
 Thu, 16 May 2024 10:13:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F1C53210582;
 Thu, 16 May 2024 10:12:56 +0200 (CEST)
Received: from [10.48.87.204] (10.48.87.204) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 10:12:56 +0200
Message-ID: <e4650db9-569f-417d-b559-bf6854c6e32a@foss.st.com>
Date: Thu, 16 May 2024 10:12:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <linux-crypto@vger.kernel.org>
References: <20240516012210.128307-1-marex@denx.de>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20240516012210.128307-1-marex@denx.de>
X-Originating-IP: [10.48.87.204]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_03,2024-05-15_01,2023-05-22_02
Cc: Rob Herring <robh@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Yang Yingliang <yangyingliang@huawei.com>, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Olivia Mackall <olivia@selenic.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] hwrng: stm32 - use
	pm_runtime_resume_and_get()
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

T24gNS8xNi8yNCAwMzoyMCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gaW5jbHVkZS9saW51eC9wbV9y
dW50aW1lLmggcG1fcnVudGltZV9nZXRfc3luYygpIGRlc2NyaXB0aW9uIHN1Z2dlc3RzIHRvCj4g
Li4uIGNvbnNpZGVyIHVzaW5nIHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoKSBpbnN0ZWFkIG9m
IGl0LCBlc3BlY2lhbGx5Cj4gaWYgaXRzIHJldHVybiB2YWx1ZSBpcyBjaGVja2VkIGJ5IHRoZSBj
YWxsZXIsIGFzIHRoaXMgaXMgbGlrZWx5IHRvIHJlc3VsdAo+IGluIGNsZWFuZXIgY29kZS4KPiAK
PiBUaGlzIGlzIGluZGVlZCBiZXR0ZXIsIHN3aXRjaCB0byBwbV9ydW50aW1lX3Jlc3VtZV9hbmRf
Z2V0KCkgd2hpY2gKPiBjb3JyZWN0bHkgc3VzcGVuZHMgdGhlIGRldmljZSBhZ2FpbiBpbiBjYXNl
IG9mIGZhaWx1cmUuIEFsc28gYWRkIGVycm9yCj4gY2hlY2tpbmcgaW50byB0aGUgUk5HIGRyaXZl
ciBpbiBjYXNlIHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoKSBkb2VzCj4gZmFpbCwgd2hpY2gg
aXMgY3VycmVudGx5IG5vdCBkb25lLCBhbmQgaXQgZG9lcyBkZXRlY3Qgc3BvcmFkaWMgLUVBQ0NF
Uwo+IGVycm9yIHJldHVybiBhZnRlciByZXN1bWUsIHdoaWNoIHdvdWxkIG90aGVyd2lzZSBsZWFk
IHRvIGEgaGFuZyBkdWUgdG8KPiByZWdpc3RlciBhY2Nlc3Mgb24gdW4tcmVzdW1lZCBoYXJkd2Fy
ZS4gTm93IHRoZSByZWFkIHNpbXBseSBlcnJvcnMgb3V0Cj4gYW5kIHRoZSBzeXN0ZW0gZG9lcyBu
b3QgaGFuZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4K
PiAtLS0KPiBDYzogIlV3ZSBLbGVpbmUtS8O2bmlnIiA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJv
bml4LmRlPgo+IENjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3Qu
Y29tPgo+IENjOiBHYXRpZW4gQ2hldmFsbGllciA8Z2F0aWVuLmNoZXZhbGxpZXJAZm9zcy5zdC5j
b20+Cj4gQ2M6IEhlcmJlcnQgWHUgPGhlcmJlcnRAZ29uZG9yLmFwYW5hLm9yZy5hdT4KPiBDYzog
TWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4gQ2M6IE1heGltZSBDb3F1ZWxpbiA8bWNvcXVl
bGluLnN0bTMyQGdtYWlsLmNvbT4KPiBDYzogT2xpdmlhIE1hY2thbGwgPG9saXZpYUBzZWxlbmlj
LmNvbT4KPiBDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiBDYzogWWFuZyBZaW5n
bGlhbmcgPHlhbmd5aW5nbGlhbmdAaHVhd2VpLmNvbT4KPiBDYzoga2VybmVsQGRoLWVsZWN0cm9u
aWNzLmNvbQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzog
bGludXgtY3J5cHRvQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCj4gLS0tCj4gICBkcml2ZXJzL2NoYXIvaHdfcmFuZG9tL3N0bTMy
LXJuZy5jIHwgNCArKystCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2hhci9od19yYW5kb20vc3RtMzIt
cm5nLmMgYi9kcml2ZXJzL2NoYXIvaHdfcmFuZG9tL3N0bTMyLXJuZy5jCj4gaW5kZXggMGU5MDNk
NmUyMmUzMC4uNmRlYzRhZGM0OTg1MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2NoYXIvaHdfcmFu
ZG9tL3N0bTMyLXJuZy5jCj4gKysrIGIvZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9zdG0zMi1ybmcu
Ywo+IEBAIC0xODcsNyArMTg3LDkgQEAgc3RhdGljIGludCBzdG0zMl9ybmdfcmVhZChzdHJ1Y3Qg
aHdybmcgKnJuZywgdm9pZCAqZGF0YSwgc2l6ZV90IG1heCwgYm9vbCB3YWl0KQo+ICAgCWludCBy
ZXR2YWwgPSAwLCBlcnIgPSAwOwo+ICAgCXUzMiBzcjsKPiAgIAo+IC0JcG1fcnVudGltZV9nZXRf
c3luYygoc3RydWN0IGRldmljZSAqKSBwcml2LT5ybmcucHJpdik7Cj4gKwlyZXR2YWwgPSBwbV9y
dW50aW1lX3Jlc3VtZV9hbmRfZ2V0KChzdHJ1Y3QgZGV2aWNlICopcHJpdi0+cm5nLnByaXYpOwo+
ICsJaWYgKHJldHZhbCkKPiArCQlyZXR1cm4gcmV0dmFsOwo+ICAgCj4gICAJaWYgKHJlYWRsX3Jl
bGF4ZWQocHJpdi0+YmFzZSArIFJOR19TUikgJiBSTkdfU1JfU0VJUykKPiAgIAkJc3RtMzJfcm5n
X2NvbmNlYWxfc2VlZF9lcnJvcihybmcpOwoKSGkgTWFyZWssCgpJJ2xsIGNoZWNrIGluIG90aGVy
IHN0bTMyIGRyaXZlcnMgYXMgd2VsbC4KCkFja2VkLWJ5OiBHYXRpZW4gQ2hldmFsbGllciA8Z2F0
aWVuLmNoZXZhbGxpZXJAZm9zcy5zdC5jb20+CgpUaGFua3MsCkdhdGllbgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
