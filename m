Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B14F6D4102
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 11:45:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 098DDC65E70;
	Mon,  3 Apr 2023 09:45:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B753C64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 09:45:31 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3336pBnM028235; Mon, 3 Apr 2023 11:45:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=e4XR1GM3WaqqSzL3e4Hqmkz/4rQgM7STgd78EwWbfmc=;
 b=s9mrgNMBH3FtPn07pXDwKq3eC2O2G5CiDgnvmGnXUeApqn7zSNBITbaA7RmpOuo1gngz
 yYpkI4Km+RzdEfgeZ7tg/Nkw0OIYaBnauJQ6fJd+KFC/xZWbbwNiCl/ORPPQjKywM0Pt
 DMv6rupJvvlKegphVTzTXj2pum9Nqu6V98mmiMU+0fKAfarcFOAr2UtCB33ALd282ohK
 oLQUkWw7Nu0m5bQB2B+r3rhhTRLhypW0mhnFXNSoqWucFctkP9mFgQaVhMOF32ODHMrW
 FLKiqCVKKmG2lgub0sbsKLNYWZxXxmLrV19Rqk6RuhYTWZNF2v1LDzye2n7eMCthiuvK nQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ppa1m9pqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Apr 2023 11:45:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 42C4010002A;
 Mon,  3 Apr 2023 11:45:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3B60E215134;
 Mon,  3 Apr 2023 11:45:23 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 3 Apr
 2023 11:45:22 +0200
Message-ID: <9ac37755-1800-3a18-c2bb-43fb06449ceb@foss.st.com>
Date: Mon, 3 Apr 2023 11:45:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Steffen Trumtrar
 <s.trumtrar@pengutronix.de>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20230330050408.3806093-1-s.trumtrar@pengutronix.de>
 <20230330050408.3806093-11-s.trumtrar@pengutronix.de>
 <31b1300b-7dd9-9bdf-be01-a79b1ac6e8cd@foss.st.com>
 <a8cedf08-7b7d-712c-1c35-4da8d0542e72@pengutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <a8cedf08-7b7d-712c-1c35-4da8d0542e72@pengutronix.de>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_06,2023-04-03_01,2023-02-09_01
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 10/10] ARM: dts: stm32: add
 STM32MP1-based Phytec board
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

SGVsbG8gQWhtYWQKCk9uIDQvMy8yMyAxMToyOCwgQWhtYWQgRmF0b3VtIHdyb3RlOgo+IEhlbGxv
IEFsZXhhbmRyZSwKPiAKPiBPbiAwMy4wNC4yMyAxMToxNSwgQWxleGFuZHJlIFRPUkdVRSB3cm90
ZToKPj4gT24gMy8zMC8yMyAwNzowNCwgU3RlZmZlbiBUcnVtdHJhciB3cm90ZToKPj4+IEFkZCB0
aGUgUGh5dGVjIFNUTTMyTVAxLTMgRGV2IGJvYXJkLiBUaGUgZGV2Ym9hcmQgdXNlcyBhIFBoeXRl
Ywo+Pj4gc3RtMzJtMTU3Yy1zb20uCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogU3RlZmZlbiBUcnVt
dHJhciA8cy50cnVtdHJhckBwZW5ndXRyb25peC5kZT4KPj4+IC0tLQo+IAo+IFtzbmlwXQo+IAo+
Pj4gKy8gewo+Pj4gK8KgwqDCoCBtb2RlbCA9ICJQSFlURUMgcGh5Q09SRS1TVE0zMk1QMS0zIERl
diBCb2FyZCI7Cj4+PiArwqDCoMKgIGNvbXBhdGlibGUgPSAicGh5dGVjLHBoeWNvcmUtc3RtMzJt
cDEtMyIsCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJwaHl0ZWMscGh5Y29yZS1zdG0z
Mm1wMTU3Yy1zb20iLCAic3Qsc3RtMzJtcDE1NyI7Cj4+PiArCj4+PiArwqDCoMKgIGFsaWFzZXMg
ewo+Pj4gK8KgwqDCoMKgwqDCoMKgIG1tYzAgPSAmc2RtbWMxOwo+Pj4gK8KgwqDCoMKgwqDCoMKg
IG1tYzEgPSAmc2RtbWMyOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIG1tYzIgPSAmc2RtbWMzOwo+Pgo+
PiBtbWMgYWxpYXNlcyBhcmUgc3RpbGwgdXNlZCBpbiBsaW51eD8KPiAKPiBTaW5jZSBrZXJuZWwg
Y29tbWl0IGZhMmQwYWE5Njk0MSAoIm1tYzogY29yZTogQWxsb3cgc2V0dGluZyBzbG90Cj4gaW5k
ZXggdmlhIGRldmljZSB0cmVlIGFsaWFzIikgYWRkZWQgd2l0aCB2NS4xMC1yYzEsIGFsaWFzZXMK
PiBkaWN0YXRlIGtlcm5lbCBudW1iZXJpbmcgb2YgL2Rldi9tbWNibGsgZGV2aWNlcywgc28gaXQn
cyBnb29kCj4gdG8gaGF2ZSB0aGVzZSBhbGlhc2VzIGZvciBjb25zaXN0ZW5jeSBhcyB0aGUgYWx0
ZXJuYXRpdmUgb2YKPiB1c2luZyBQQVJUVVVJRCBicmVha3MgZG93biBvbmNlIHRoZSBzYW1lIGlt
YWdlIGlzIGZsYXNoZWQgdG8KPiBib3RoIFNEIGFuZCBlTU1DIGFuZCB1c2Ugb2YgYW4gaW5pdHJk
IGlzIG5vdCBhbHdheXMgcHJhY3RpY2FsLgoKT2ggb2suIEkgdGhvdWdodCB0aGUgb3Bwb3NpdGUu
IFNvcnJ5IGZvciB0aGlzIG1pc3Rha2UuCgpDaGVlcnMKQWxleAoKPj4+ICsmc2RtbWMxIHsKPj4+
ICvCoMKgwqAgc2VjdXJlLXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4+PiArfTsKPj4+ICsKPj4+ICsm
c2RtbWMyIHsKPj4+ICvCoMKgwqAgc3RhdHVzID0gIm9rYXkiOwo+Pj4gK8KgwqDCoCBzZWN1cmUt
c3RhdHVzID0gImRpc2FibGVkIjsKPj4+ICt9Owo+Pgo+PiBXaGF0IGlzIHRoZSBuZWVkIHRvIHB1
dCB0aGUgc2VjdXJlIHN0YXR1cyBkaXNhYmxlZCBmb3IgU0RNTUMgbm9kZXMgPwo+IAo+IFRGLUEg
cGFyc2VzIHRoZW0sIGJ1dCBmb3IgU0RNTUMsIGl0IHNob3VsZCBoYXZlIG5vIGVmZmVjdCwgc28g
SSBhZ3JlZQo+IHRoZXkgY2FuIGJlIHJlbW92ZWQuCj4gCj4gQ2hlZXJzLAo+IEFobWFkCj4gCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
