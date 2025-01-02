Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5319FF8A1
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Jan 2025 12:17:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6805C7801F;
	Thu,  2 Jan 2025 11:17:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A09CC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jan 2025 11:17:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 502A1PJ6028659;
 Thu, 2 Jan 2025 12:17:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 0xItSIxShYGLizEiPeNAw2E0IXnl6XenbDcDTP5neiw=; b=qAgP656flRQouaIy
 0guIhoP9E0Yyyue5L0iYG8n4UuLuxjanolFg/wSdO26j4SsjxLTMlK9ogzVvvcmv
 83n7ThZ02ljMPZUA4PgDL9axSQJN0ZYt4u6iJAhh/I2IrnEa4QB8zp34yzZEEzWb
 Bp5NggKq2nUNSPwRIEwbUomKdhI1WWe6l5qVAw/6nuvXPRIrj6sO8etAI9nqagI7
 IoUiKbTX5QJZKKQnr4dUL+xzM7A68ldBT34As8vH9366pjOd+v5UOCZVktj88Zhh
 iAYJt5yJbio0PrXb2y020wSITZhhk2E6bLUZN+AQHGtT7T7eyA9ur0YTtzCoeHr6
 n1M8PA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43vuwmbx6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jan 2025 12:17:18 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4DCB540048;
 Thu,  2 Jan 2025 12:16:04 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7FA0627607A;
 Thu,  2 Jan 2025 12:15:18 +0100 (CET)
Received: from [192.168.8.15] (10.252.9.169) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 2 Jan
 2025 12:15:17 +0100
Message-ID: <01c0ce6be637669ed07cfaf0aa6ef27fed7b8b16.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Marek Vasut <marex@denx.de>, Mingwei Zheng <zmw12306@gmail.com>
Date: Thu, 2 Jan 2025 12:15:15 +0100
In-Reply-To: <9745b3ee-ae89-4edb-8ff7-b20096dbe1de@denx.de>
References: <20241215204014.4076659-1-zmw12306@gmail.com>
 <9745b3ee-ae89-4edb-8ff7-b20096dbe1de@denx.de>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.252.9.169]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: peng.fan@nxp.com, make24@iscas.ac.cn, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>, fabien.dessenne@foss.st.com,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5] pinctrl: stm32: Add check for
	clk_enable()
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

T24gTW9uLCAyMDI0LTEyLTE2IGF0IDAwOjQxICswMTAwLCBNYXJlayBWYXN1dCB3cm90ZToKPiBP
biAxMi8xNS8yNCA5OjQwIFBNLCBNaW5nd2VpIFpoZW5nIHdyb3RlOgo+IAo+IFsuLi5dCj4gCj4g
PiBAQCAtMTYxNywxMCArMTYwMiwxOCBAQCBpbnQgc3RtMzJfcGN0bF9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBy
ZXR1cm4gLUVJTlZBTDsKPiA+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gPiDCoMKgwqDCoMKgwqDCoMKg
cGN0bC0+YmFua3MgPSBkZXZtX2tjYWxsb2MoZGV2LCBiYW5rcywgc2l6ZW9mKCpwY3RsLT5iYW5r
cyksCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEdG
UF9LRVJORUwpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBfS0VSTkVMKTsKPiAKPiBQbGVhc2UgZHJvcCB0
aGlzIG9uZSBjaGFuZ2UuCj4gCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKCFwY3RsLT5iYW5rcykK
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FTk9NRU07Cj4gPiDC
oCAKPiA+ICvCoMKgwqDCoMKgwqDCoHBjdGwtPmNsa3MgPSBkZXZtX2tjYWxsb2MoZGV2LCBiYW5r
cywgc2l6ZW9mKCpwY3RsLT5jbGtzKSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdGUF9LRVJORUwpOwo+ID4gK8Kg
wqDCoMKgwqDCoMKgaWYgKCFwY3RsLT5jbGtzKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJldHVybiAtRU5PTUVNOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgZm9yIChpID0g
MDsgaSA8IGJhbmtzOyArK2kpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGN0
bC0+Y2xrc1tpXS5pZCA9ICIiOwo+IAo+IElzIHRoaXMgXiBhc3NpZ25tZW50IG5lY2Vzc2FyeSA/
IElmIHNvLCB3aHkgPwoKVGhlIGV4aXN0aW5nIERUcyBkb24ndCBoYXZlIHRoZSAnY2xvY2stbmFt
ZXMnIHByb3BlcnR5LCB3aG9zZSB2YWx1ZSBpcyB1c2VkIHRvIHNldCB0aGlzIHN0cnVjdCBjbGtf
YnVsa19kYXRhOjppZC4KV2l0aCB0aGlzIGZpZWxkIGtlcHQgYXQgTlVMTCwgdGhlIGVycm9yIG1l
c3NhZ2VzIGluIGNsa19idWxrX2VuYWJsZSgpIGFuZCBzaW1pbGFyIHNob3VsZCBwcmludCAnKG51
bGwpJy4KVGhpcyBsaW5lIHNldHMgaXQgdG8gZW1wdHkgc3RyaW5nLgpJIHdvdWxkIHNheSBpdCdz
IG5vdCBuZWNlc3NhcnksIGJ1dCBJIGRvbid0IGtub3cgaWYgaXQncyBiZXR0ZXIgdG8gaGF2ZToK
IkZhaWxlZCB0byBlbmFibGUgY2xrICcnOiAlZCIKb3IKIkZhaWxlZCB0byBlbmFibGUgY2xrICco
bnVsbCknOiAlZCIKCkFudG9uaW8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
