Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E480C729C8B
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Jun 2023 16:17:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A828C6A5FA;
	Fri,  9 Jun 2023 14:17:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42D4FC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jun 2023 14:17:54 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 359BNxqC021297; Fri, 9 Jun 2023 16:17:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=dL9ryM5Vt0DSVKlhlWXhvwgnM1YarL/LX0Jq8bjZ/2M=;
 b=rPKsbEPI86c5sgJMgfq2QTI89QIRpynTd3i6jZ8LVb4RSBPwon8o3tVewZHDZX2pQGV2
 P8L853y9Y5YHQ0Lvht6RXPUbjzY8DlqSG7NvUu/Mvij3yhzL89lJ7FdvY65eKO9aIEAW
 OZ+QbHIrCcRiAQDMJBBDSmGE/kzeyBfvO34d+XtEUyM2VS2tQxHWJFSHz2pr+alr1lkn
 oWnxK42UswT9cRgw8C4oZ/YqVDvGOUz6GFg9g0DvPdPQ18Z0KuaoXdvPDbSAasjNMYdz
 T8q7YT11oO2yV7BV422k573d+x+nkPAentptiTIGTNR5ggS4YMXUU0zhC/5Yti3+TC4g 3Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r4187hvnb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jun 2023 16:17:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0D4A910003B;
 Fri,  9 Jun 2023 16:17:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E6C2C236937;
 Fri,  9 Jun 2023 16:17:27 +0200 (CEST)
Received: from [10.129.178.187] (10.129.178.187) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 9 Jun
 2023 16:17:27 +0200
Message-ID: <2d13447a-bcdb-36d2-f988-b1f416244e1d@foss.st.com>
Date: Fri, 9 Jun 2023 16:17:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>,
 Philippe CORNU - foss <philippe.cornu@foss.st.com>, yannick Fertre
 <yannick.fertre@foss.st.com>
References: <20230531231044.574541-1-marex@denx.de>
 <b343ab21-2787-4602-57f8-4c2bf62db523@foss.st.com>
 <94a89ca7-bc29-5a2e-f99d-9b2577882c92@denx.de>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <94a89ca7-bc29-5a2e-f99d-9b2577882c92@denx.de>
X-Originating-IP: [10.129.178.187]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_10,2023-06-09_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Deduplicate DSI node
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

SGkgTWFyZWssCgpPbiA2LzEvMjMgMjI6MzIsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDYvMS8y
MyAxODo0NiwgUmFwaGFlbCBHYWxsYWlzLVBvdSB3cm90ZToKPj4gSGkgTWFyZWssCj4KPiBIaSwK
Pgo+PiBPbiA2LzEvMjMgMDE6MTAsIE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4gQWxsIGJvYXJkcyB1
c2luZyB0aGUgRFNJIG5vZGUgZHVwbGljYXRlIHRoZSBzYW1lIHBhdHRlcm4gY29tbW9uIHBhdHRl
cm4KPj4+IGluIGJvYXJkIERUcywgdGhhdCBwYXR0ZXJuIGlzIHBvcnRzIHdpdGggZW5kcG9pbnQg
bGFiZWxzIGFuZCB0aGUgc2FtZQo+Pj4gaW4tU29DIHJlZ3VsYXRvciBjb25uZWN0aW9uLiBNb3Zl
IHRoYXQgY29tbW9uIHBhdHRlcm4gaW50byBzdG0zMm1wMTU3LmR0c2kKPj4+IGluc3RlYWQuCj4+
Cj4+IEkgdGhpbmsgdGhhdCBpcyBhIGdvb2QgaWRlYSwgd2hpbGUgaXQgZGlkIG5vdCBjcm9zc2Vk
IG15IG1pbmQgaW1wbGVtZW50aW5nIGl0Cj4+IHRoaXMgd2F5IG9uIHRoZSBmaXJzdCB0aW1lLgo+
Pgo+PiBJJ2xsIGxldCBteSBwZWVycyBQaGlsaXBwZSBhbmQgWWFubmljayByZXZpZXcgYW5kIGFj
ayBpdCB0aGlzIHRpbWUuIEkgdGVzdGVkIGl0Cj4+IG9uIERLMiwgaXQgc2VlbXMgZmluZS4KPgo+
IFRoYW5rcyBmb3IgdGVzdGluZy4gVGhlcmUncyBubyBydXNoLCBzbyB0YWtlIHlvdXIgdGltZS4K
CgpBY2tlZC1ieTogUmFwaGHDq2wgR2FsbGFpcy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1wb3VAZm9z
cy5zdC5jb20+CgoKVGhhbmsgeW91LApSYXBoYcOrbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
