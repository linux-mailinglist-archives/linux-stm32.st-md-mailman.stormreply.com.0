Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B586706B59
	for <lists+linux-stm32@lfdr.de>; Wed, 17 May 2023 16:39:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5906DC6B444;
	Wed, 17 May 2023 14:39:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C2F5C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 May 2023 14:39:15 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34HEZPrH020544; Wed, 17 May 2023 16:38:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=GThgjJ8WeVYu7amHQKF0EfhYQvmzeVDT7JNsz08BwJA=;
 b=WSk/ncL9iKDHCBnAkNIy9JluwTU+rEYbjwuCSvNXXM1Gf1TxwV1thX5/wNYYyjcm4Q0G
 T96uLtAeK32uGyR2mOfLsHa/ANTCSUpKGlnnIU2kWTwSsS8BMDC7OEUwPLLUhlvUKxJ2
 kuf7pXd2KCA85QdPR0IkvKSrfVXU01OpRV90pOWyHo0BeFyX1+xB4m08w/T9sTvjL0cg
 WZWjGNoT55c6PiOtD4rknnnSPUFrPGBh2HJUd1w21xJPFWNVVBIpvnRM3s63lfYhNrcs
 n7PbaWSHQnS6hArRmefyZfGkt4xO+ewg0DgA8OZZ6cxlXp/+AoEWAsY2U0h/8ppxHPPd 1g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qmtefk6u9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 16:38:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E96A9100034;
 Wed, 17 May 2023 16:38:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E0FA723357D;
 Wed, 17 May 2023 16:38:55 +0200 (CEST)
Received: from [10.129.178.187] (10.129.178.187) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 17 May
 2023 16:38:55 +0200
Message-ID: <c617bb64-e7fd-c3de-6e29-6dd7c5896d16@foss.st.com>
Date: Wed, 17 May 2023 16:38:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Yannick Fertre <yannick.fertre@foss.st.com>
References: <20230517132214.254757-1-raphael.gallais-pou@foss.st.com>
 <56bcad63-a32e-63fc-1c20-15909f2788b5@denx.de>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <56bcad63-a32e-63fc-1c20-15909f2788b5@denx.de>
X-Originating-IP: [10.129.178.187]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_02,2023-05-17_02,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/3] STM32 warning cleanup
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

Ck9uIDUvMTcvMjMgMTY6MDYsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDUvMTcvMjMgMTU6MjIs
IFJhcGhhZWwgR2FsbGFpcy1Qb3Ugd3JvdGU6Cj4+IFRoaXMgc2VyaWUgYWltcyB0byByZWR1Y2Ug
dGhlIG51bWJlciBvZiBkZXZpY2UtdHJlZSB3YXJuaW5ncyBvZgo+PiBmb2xsb3dpbmcgYm9hcmRz
IDoKPj4KPj4gwqDCoCAtIFNUTTMyRjQyOS1ESVNDTwo+PiDCoMKgIC0gU1RNMzJNUDE1Kgo+Pgo+
PiBUaG9zZSB3YXJuaW5ncyB3ZXJlIGFwcGVhcmluZyBlaXRoZXIgZHVyaW5nIGJ1aWxkIG9yIHdo
ZW4gY2hlY2tpbmcKPj4gZHQtYmluZGluZ3MgYW5kIGNvbmNlcm4gbW9zdGx5IExUREMgYW5kIERT
SSBJUHMgYW5kIHdlcmUgZHVlIHRvIHRoZQo+PiBmb2xsb3dpbmcgY2FzZXM6Cj4+Cj4+IMKgwqAg
LSBwYW5lbC1kc2lAMCBub2RlcyB0aGF0IG5lZWRlZAo+PiDCoMKgIC0gdW5uZWNlc3NhcnkgI2Fk
ZHJlc3MtY2VsbHMgYW5kICNzaXplLWNlbGxzIHByb3BlcnRpZXMKPj4gwqDCoCAtIHJlc2lkdWFs
ICdyZWcnIGZpZWxkIG9uIHNpbmdsZSBlbmRwb2ludHMKPj4KPj4gUmFwaGFlbCBHYWxsYWlzLVBv
dSAoMyk6Cj4+IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBmaXggd2FybmluZ3Mgb24gc3RtMzJmNDY5
LWRpc2NvIGJvYXJkCj4+IMKgwqAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHN0LHN0bTMyLWRzaTog
UmVtb3ZlIHVubmVjZXNzYXJ5IGZpZWxkcwo+PiDCoMKgIEFSTTogZHRzOiBzdG0zMjogZml4IHNl
dmVyYWwgRFQgd2FybmluZ3Mgb24gc3RtMzJtcDE1Cj4+Cj4+IMKgIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItZHNpLnlhbWzCoMKgwqDCoMKgIHzCoCAyIC0tCj4+IMKg
IGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjQ2OS1kaXNjby5kdHPCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoCA0ICsrLS0KPj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJt
cDE1MS5kdHNpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA1
IC0tLS0tCj4+IMKgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTcuZHRzacKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNyAtLS0tLS0tCj4+IMKgIC4uLi9k
dHMvc3RtMzJtcDE1N2EtaWNvcmUtc3RtMzJtcDEtY3RvdWNoMi1vZjEwLmR0c8KgwqDCoCB8wqAg
NiArKysrLS0KPj4gwqAgLi4uL2Jvb3QvZHRzL3N0bTMybXAxNTdhLWljb3JlLXN0bTMybXAxLWVk
aW1tMi4yLmR0c8KgwqAgfMKgIDYgKysrKy0tCj4+IMKgIC4uLi9zdG0zMm1wMTU3YS1taWNyb2dl
YS1zdG0zMm1wMS1taWNyb2RldjIuMC1vZjcuZHRzwqAgfMKgIDMgKy0tCj4+IMKgIGFyY2gvYXJt
L2Jvb3QvZHRzL3N0bTMybXAxNTdjLWRrMi5kdHPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoCA4ICsrKysrKysrCj4+IMKgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdj
LWV2MS5kdHPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTAgKysrKysrKy0t
LQo+PiDCoCBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1seGEtbWMxLmR0c8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzICstLQo+PiDCoCBhcmNoL2FybS9ib290L2R0cy9zdG0z
Mm1wMTV4eC1kaGNvci1hdmVuZ2VyOTYuZHRzacKgwqDCoMKgIHzCoCA2ICstLS0tLQo+PiDCoCBh
cmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1ka3guZHRzacKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAzICstLQo+PiDCoCAxMiBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRp
b25zKCspLCAzNCBkZWxldGlvbnMoLSkKPj4KPgo+IElzIHRoaXMgYSBWMiBzZXJpZXMgPwoKSGkg
TWFyZWsKCgp5ZXMgaXQgd2FzLAoKVGhhbmtzIGZvciBoaWdobGlnaHRpbmcgaXQgdG8gbWUuCgpS
YXBoYcOrbAoKPgo+IElmIHNvLCBwbGVhc2UgZG8gaW5jbHVkZSBjaGFuZ2Vsb2cgLgo+Cj4gQWxz
bywgdXNlICJnaXQgc2VuZC1lbWFpbCAtdjIiIHRvIG1hcmsgdGhvc2UgcGF0Y2hlcyBhcyB2MiBh
dXRvbWF0aWNhbGx5IHdoZW4KPiBzZW5kaW5nIC4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
