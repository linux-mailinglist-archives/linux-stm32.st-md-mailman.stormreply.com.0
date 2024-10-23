Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 124289AC27E
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Oct 2024 11:00:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE5A8C71290;
	Wed, 23 Oct 2024 09:00:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C4ECC71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 08:59:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N81V6Z032518;
 Wed, 23 Oct 2024 10:59:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 u4oK+ppGTcU7dSjV7y+6H5nQdcyYAsUQKkYiXnnfEy8=; b=Ts5wCi4Us1LuKr7x
 FkhxMlBejRiyra2bjKbcFaK2my+Zey3E/JKpZ3atkMlSgXh2EQe63v157zg5bBTp
 dfaJGvqueS7uZmhDxmD4rd+KQNI+9vwR9HOmuYcmQ7+/gEtEup9UUf/gQijF+Yn7
 SpXznbRHmfbviY4XW0YZg2uZr0DWZYhZHAwqLhtl0HFbztYaqwae3b9T4/hpiVsj
 O9+rklX+4/6JxFB9CwtW7RIoDJ4G+YOFp9kfUke5JceL3eIF0V+tNIjb0E2xVKa8
 MIXD6lG5mj1+I2WrjtFEivHGEkACFhMNw5fRtMwKhaIAcrX3OAbUL4/qA4TIJp9R
 RU/Jgw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42em4a2abc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2024 10:59:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 355724002D;
 Wed, 23 Oct 2024 10:58:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 29FBE265534;
 Wed, 23 Oct 2024 10:57:00 +0200 (CEST)
Received: from [192.168.8.15] (10.48.87.33) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 23 Oct
 2024 10:56:59 +0200
Message-ID: <680f3e0b7458015d5b909200342a623eb55f907d.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 23 Oct 2024 10:56:57 +0200
In-Reply-To: <swbppwzpavktjpyb6piayzzht6ta75w3g36oyndmim54oztar5@svb4452yob7g>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
 <20241022155658.1647350-5-antonio.borneo@foss.st.com>
 <swbppwzpavktjpyb6piayzzht6ta75w3g36oyndmim54oztar5@svb4452yob7g>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.48.87.33]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 04/14] dt-bindings: pinctrl: stm32: add
	RSVD mux function
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

T24gV2VkLCAyMDI0LTEwLTIzIGF0IDEwOjQ3ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+IE9uIFR1ZSwgT2N0IDIyLCAyMDI0IGF0IDA1OjU2OjQ4UE0gKzAyMDAsIEFudG9uaW8g
Qm9ybmVvIHdyb3RlOgo+ID4gRnJvbTogRmFiaWVuIERlc3Nlbm5lIDxmYWJpZW4uZGVzc2VubmVA
Zm9zcy5zdC5jb20+Cj4gPiAKPiA+IERvY3VtZW50IHRoZSBSU1ZEIChSZXNlcnZlZCkgbXV4IGZ1
bmN0aW9uLCB1c2VkIHRvIHJlc2VydmUgcGlucwo+ID4gZm9yIGEgY29wcm9jZXNzb3Igbm90IHJ1
bm5pbmcgTGludXguCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEZhYmllbiBEZXNzZW5uZSA8ZmFi
aWVuLmRlc3Nlbm5lQGZvc3Muc3QuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogQW50b25pbyBCb3Ju
ZW8gPGFudG9uaW8uYm9ybmVvQGZvc3Muc3QuY29tPgo+ID4gLS0tCj4gPiDCoC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BpbmN0cmwvc3Qsc3RtMzItcGluY3RybC55YW1swqDCoMKgwqAgfCA4ICsr
KysrKysrCj4gPiDCoGluY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9zdG0zMi1waW5mdW5jLmjC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSArCj4gPiDCoDIgZmlsZXMgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspCj4gPiAKPiAKPiBCVFcsIHdoaWNoICpleGlzdGluZyogU29DcyB1c2Ug
aXQ/IEFyZW4ndCB5b3UgYWRkaW5nIGl0IGZvciB0aGUgbmV3Cj4gcGxhdGZvcm0/Cj4gCgpUaGlz
IGlzIGFscmVhZHkgdXNlZCBpbiBTVCBkb3duc3RyZWFtIGtlcm5lbCBmb3IgU1RNMzJNUDE1eApJ
biB0aGlzIGV4YW1wbGUKaHR0cHM6Ly9naXRodWIuY29tL1NUTWljcm9lbGVjdHJvbmljcy9saW51
eC9ibG9iL3Y2LjEtc3RtMzJtcC9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Zi1kazItbTQt
ZXhhbXBsZXMuZHRzI0wxMTIKCnRoZSBHUElPcyBmb3IgTEVEIGFuZCBmb3IgUFdNIGFyZSBhc3Np
Z25lZCB0byB0aGUgQ29ydGV4LU00IGFuZCBMaW51eCAob24gQ29ydGV4LUE3KSBpcyBub3Qgc3Vw
cG9zZWQgdG8gdG91Y2ggdGhlbS4KClJlZ2FyZHMsCkFudG9uaW8KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
