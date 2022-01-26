Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A8049C84A
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jan 2022 12:09:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FEBCC5F1D5;
	Wed, 26 Jan 2022 11:09:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4A6AC5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jan 2022 11:09:05 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20Q9nERc012928;
 Wed, 26 Jan 2022 12:08:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=QFR2dN8dkibpF8B0/9wAubqoFJzjHR76hN1qSB1UNQc=;
 b=CJQz9enHEakzEJDRo8gWXXxkHkaYq1wEEHzQA2WpFfqlt5TKNpSdTQAsGdNvYswfkbP6
 o+X6HLUvphRs6/HC+gmlqmPtPHJosL6IG3z+EOuBzhB2pBfiXhQnMpACtRT2RM2oyuND
 jVuawcLFB6TgxcImxKZxSNhdOBY4IlxQgP+kXyko9UGyHJ7vRNxKlM8vMQYqw3jR+ss+
 Wo9pfAlGzYNVja5DSfZNyGfoibXeHlhYIYL2bhBODXaM341XCHHQmJPMBgiUGe3zbg+d
 tntyCPb9aE9taxvPJe7Sw+fRR5h3DaIS1WrTpUd0C74I3dfrbC6lUkggL7QwCDlbw5yx jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3du40ngeb2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 12:08:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CCA4410002A;
 Wed, 26 Jan 2022 12:08:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B5D70216EE0;
 Wed, 26 Jan 2022 12:08:39 +0100 (CET)
Received: from [10.48.0.175] (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 26 Jan
 2022 12:08:39 +0100
Message-ID: <9662651a-12d9-4893-95c2-aa1a3a10302d@foss.st.com>
Date: Wed, 26 Jan 2022 12:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh+dt@kernel.org>
References: <20220105135734.271313-1-christophe.kerello@foss.st.com>
 <20220105135734.271313-4-christophe.kerello@foss.st.com>
 <3f9a9731-c096-bc9b-63df-bd1dff032737@linaro.org>
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <3f9a9731-c096-bc9b-63df-bd1dff032737@linaro.org>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-26_02,2022-01-26_01,2021-12-02_01
Cc: devicetree@vger.kernel.org, chenshumin86@sina.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 3/3] nvmem: core: Fix a conflict between
 MTD and NVMEM on wp-gpios property
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

SGkgU3Jpbml2YXMsIE1pcXVlbCwKCk9uIDEvMjUvMjIgMTE6NDQsIFNyaW5pdmFzIEthbmRhZ2F0
bGEgd3JvdGU6Cj4gCj4gCj4gT24gMDUvMDEvMjAyMiAxMzo1NywgQ2hyaXN0b3BoZSBLZXJlbGxv
IHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9udm1lbS9jb3JlLmMgYi9kcml2ZXJzL252
bWVtL2NvcmUuYwo+PiBpbmRleCBlNzY1ZDNkMDU0MmUuLmUxMWM3NGRiNjRmOSAxMDA2NDQKPj4g
LS0tIGEvZHJpdmVycy9udm1lbS9jb3JlLmMKPj4gKysrIGIvZHJpdmVycy9udm1lbS9jb3JlLmMK
Pj4gQEAgLTc2OSw3ICs3NjksNyBAQCBzdHJ1Y3QgbnZtZW1fZGV2aWNlICpudm1lbV9yZWdpc3Rl
cihjb25zdCBzdHJ1Y3QgCj4+IG52bWVtX2NvbmZpZyAqY29uZmlnKQo+PiDCoMKgwqDCoMKgIGlm
IChjb25maWctPndwX2dwaW8pCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBudm1lbS0+d3BfZ3BpbyA9
IGNvbmZpZy0+d3BfZ3BpbzsKPj4gLcKgwqDCoCBlbHNlCj4+ICvCoMKgwqAgZWxzZSBpZiAoY29u
ZmlnLT5yZWdfd3JpdGUpCj4gVGhpcyBpcyBjbGVhcmx5IG5vdCBnb2luZyB0byB3b3JrIGZvciBl
dmVyeW9uZS4KPiAKPiBBIGZsYWcgaW4gbnZtZW1fY29uZmlnIHRvIGluZGljYXRlIHRoYXQgd3Ag
Z3BpbyBpcyBtYW5hZ2VkIGJ5IHByb3ZpZGVyIAo+IGRyaXZlciB3b3VsZCBiZSB0aGUgcmlnaHQg
dGhpbmcgdG8gZG8gaGVyZS4KCkJhc2VkIG9uIHlvdXIgaW5wdXRzLCBJIHdpbGwgYWRkIGEgbmV3
IGJvb2xlYW4gZmxhZyBpbiBudm1lbl9jb25maWcgCihwcm9wb3NhbCBuYW1lOiBza2lwX3dwX2dw
aW8pIGFuZCBJIHdpbGwgc2V0IGl0IHRvIHRydWUgaW4gbXRkY29yZS5jIAp3aGVuIG52bWVuX2Nv
bmZpZyBzdHJ1Y3R1cmUgaXMgaW5pdGlhbGl6ZWQuIEl0IHdpbGwgYmUgcGFydCBvZiB0aGUgVjIu
CgpSZWdhcmRzLApDaHJpc3RvcGhlIEtlcmVsbG8uCgo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgbnZt
ZW0tPndwX2dwaW8gPSBncGlvZF9nZXRfb3B0aW9uYWwoY29uZmlnLT5kZXYsICJ3cCIsCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
R1BJT0RfT1VUX0hJR0gpOwo+IAo+IC0tc3JpbmkKPiAKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
