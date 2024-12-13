Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ECD9F0D98
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Dec 2024 14:45:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA538C78015;
	Fri, 13 Dec 2024 13:45:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A50EC78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2024 13:45:34 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDAwJxn007433;
 Fri, 13 Dec 2024 14:45:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Fwn8Lk/ttab1XUIk4P6AXTCr+1bXvJRipK2h+AOLyhY=; b=Y76ajKurx4fFzyX8
 mGfXG58Uz0SX5DBiuxE/ritxhAKXfjrTebRd3mFacDoLdlKNLM7vHUignbGci4q4
 CPRDjo9uuAtUvE2kEo3TEK0FiS8vPxx0cfbPdP3TXw7Sy8/8VG3MyKXqNqg2aQLU
 cC7nmN2OjotF41ZulTzUOkOpMTuKCUumZkz5SHh5vkqNaGFB3Aoy5beqgudEjlLE
 cowPCsgMjt5hhIRV1lyKll1yvBu5Joy0Luj36kKDX2shgv2UIPvL02aJ3GIaYdxs
 ldMNMtlCJZjeS4Bdb+UbmKfUzLDYs5g6UstbBHCc4Nw5sC2BtTc4QrY+c5/Vmhxf
 PPR+Hg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ffwc8mkr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 14:45:21 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E3D8140049;
 Fri, 13 Dec 2024 14:44:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AF55F27667B;
 Fri, 13 Dec 2024 14:43:21 +0100 (CET)
Received: from [192.168.8.15] (10.48.87.33) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 13 Dec
 2024 14:43:21 +0100
Message-ID: <05081f6ebe19ce3e0e989aebf415c9ff86a39e3d.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Marek Vasut <marex@denx.de>, Mingwei Zheng <zmw12306@gmail.com>
Date: Fri, 13 Dec 2024 14:43:18 +0100
In-Reply-To: <a47b567d-96a6-4a87-9f60-33a311c281ae@denx.de>
References: <20241213010948.2623382-1-zmw12306@gmail.com>
 <a47b567d-96a6-4a87-9f60-33a311c281ae@denx.de>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.48.87.33]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: peng.fan@nxp.com, make24@iscas.ac.cn, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>, fabien.dessenne@foss.st.com,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4] pinctrl: stm32: Add check for
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

T24gRnJpLCAyMDI0LTEyLTEzIGF0IDEyOjQ1ICswMTAwLCBNYXJlayBWYXN1dCB3cm90ZToKPiBP
biAxMi8xMy8yNCAyOjA5IEFNLCBNaW5nd2VpIFpoZW5nIHdyb3RlOgo+IAo+IFsuLi5dCj4gCj4g
PiBAQCAtMTM5Nyw3ICsxMzk3LDcgQEAgc3RhdGljIGludCBzdG0zMl9ncGlvbGliX3JlZ2lzdGVy
X2Jhbmsoc3RydWN0IHN0bTMyX3BpbmN0cmwgKnBjdGwsIHN0cnVjdCBmd25vZGUKPiA+IMKgwqDC
oMKgwqDCoMKgwqByZXR1cm4gMDsKPiA+IMKgIAo+ID4gwqAgZXJyX2NsazoKPiA+IC3CoMKgwqDC
oMKgwqDCoGNsa19kaXNhYmxlX3VucHJlcGFyZShiYW5rLT5jbGspOwo+ID4gK8KgwqDCoMKgwqDC
oMKgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHBjdGwtPmNsa3NbcGN0bC0+bmJhbmtzXS5jbGspOwo+
IAo+IAo+IFNob3VsZCB0aGlzIGJlCj4gCj4gLWNsa19kaXNhYmxlX3VucHJlcGFyZShwY3RsLT5j
bGtzW3BjdGwtPm5iYW5rc10uY2xrKTsKPiArY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHBjdGwtPmNs
a3NbYmFuay0+YmFua19ucl0uY2xrKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBeXl5eXl5eXl5eXl5eCj4gCgpO
byBNYXJlaywKcGN0bC0+bmJhbmtzIGlzIHRoZSBwcm9ncmVzc2l2ZSBpbmRleCBvZiB0aGUgYmFu
aydzIHN1Ym5vZGUsIHRoYXQgaXMgYWxzbyB0aGUgaW5kZXggZm9yIHBjdGwtPmNsa3NbXS4KSW5z
dGVhZCBiYW5rLT5iYW5rX25yIGNhbiBiZSBjb21wdXRlZCBmcm9tIGdwaW8tcmFuZ2VzLCBhbmQg
dGhlcmUgaXMgbm8gZ3VhcmFudGVlIGl0IHdvdWxkIG1hdGNoIHRoZSBpbmRleCBmb3IgcGN0bC0+
Y2xrc1tdLgoKQWN0dWFsbHkgdGhpcyBpcyBxdWl0ZSBjb25mdXNpbmc7IEkgdGhpbmsgaXQgd291
bGQgYmUgbXVjaCBjbGVhbmVyIGRyb3BwaW5nIHRoZSBjbG9jayBoYW5kbGluZyBmcm9tIHN0bTMy
X2dwaW9saWJfcmVnaXN0ZXJfYmFuaygpIGFuZCBtb3ZpbmcgaXQgdG8gaXRzIGNhbGxlci4KSW4g
c3RtMzJfcGN0bF9wcm9iZSgpIHdlIGNhbiBqdXN0IGNhbGwgY2xrX2J1bGtfcHJlcGFyZV9lbmFi
bGUoKSBhbmQsIGluIGNhc2Ugb2YgZXJyb3IsIGNsa19idWxrX2Rpc2FibGVfdW5wcmVwYXJlKCkK
CkFudG9uaW8KCj4gPwo+IAo+ID4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiBlcnI7Cj4gPiDCoCB9
Cj4gPiDCoCAKPiA+IEBAIC0xNjE3LDEwICsxNjE3LDE4IEBAIGludCBzdG0zMl9wY3RsX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHJldHVybiAtRUlOVkFMOwo+ID4gwqDCoMKgwqDCoMKgwqDCoH0KPiA+IMKgwqDC
oMKgwqDCoMKgwqBwY3RsLT5iYW5rcyA9IGRldm1fa2NhbGxvYyhkZXYsIGJhbmtzLCBzaXplb2Yo
KnBjdGwtPmJhbmtzKSwKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgR0ZQX0tFUk5FTCk7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdGUF9LRVJORUwpOwo+ID4gwqDC
oMKgwqDCoMKgwqDCoGlmICghcGN0bC0+YmFua3MpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHJldHVybiAtRU5PTUVNOwo+ID4gwqAgCj4gPiArwqDCoMKgwqDCoMKgwqBwY3Rs
LT5jbGtzID0gZGV2bV9rY2FsbG9jKGRldiwgYmFua3MsIHNpemVvZigqcGN0bC0+Y2xrcyksCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBHRlBfS0VSTkVMKTsKPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghcGN0bC0+Y2xr
cykKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVOT01FTTsKPiA+
ICsKPiA+ICvCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCBiYW5rczsgKytpKQo+IAo+IGkr
KwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
