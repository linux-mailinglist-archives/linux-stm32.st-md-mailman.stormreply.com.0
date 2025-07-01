Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60257AEEF86
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Jul 2025 09:11:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41F71C3F930;
	Tue,  1 Jul 2025 07:11:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6761EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Jul 2025 07:11:56 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5612IZfh012666;
 Tue, 1 Jul 2025 09:11:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 pjEU9ubolXq6bNyzBdOl3AlCHglaTXh8+re7Vdnli3k=; b=Jn7H8vOcNMzX2slj
 XzBW1YVZpqYxreG+phG/EWQUK5cjaSMAFvyr4ircFjTLgeyKt/K/GVEr9JmSJ7H+
 sZ0DgzlhQ2WFAoKx1IXs9k4bktUtqGc18MBGdoNiEzPCWWQp4BZ/g7/rgiwwOVqT
 XzRf3NYqKYM60MspwnJpyyBGLV1eyk04Aa0O7UFWXEjt+mnlXnUHfHsZLqUPPS3v
 SHd2IL+MfukystmnC4Od8EGySAYy0Hv8ItD5EstgTqqcfEfG/0emb5z2TjW8nI1q
 dtQzGNLKNIXjV7wTNqjZ2nbXLW7YGFK62EuOBrnheoU3cLfAoh7QBK09MaokwTFI
 xRoIhg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j7r637m7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jul 2025 09:11:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5F4CC40058;
 Tue,  1 Jul 2025 09:10:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8B1A5B83746;
 Tue,  1 Jul 2025 09:09:33 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 09:09:32 +0200
Message-ID: <cd2f6752-6d3a-4fca-93c5-70ad7529617f@foss.st.com>
Date: Tue, 1 Jul 2025 09:09:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <2033b9fa-7b0f-4617-b94e-7b0a51c5c4b1@sabinyo.mountain>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <2033b9fa-7b0f-4617-b94e-7b0a51c5c4b1@sabinyo.mountain>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: delete stray tabs in
 stm32h7_spi_data_idleness()
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

SGkgRGFuLAoKVGhhbmsgeW91LgoKCk9uIDYvMzAvMjUgMjE6MzUsIERhbiBDYXJwZW50ZXIgd3Jv
dGU6Cj4gVGhlc2UgbGluZXMgd2VyZSBpbmRlbnRlZCBvbmUgdGFiIG1vcmUgdGhhbiB0aGV5IHNo
b3VsZCBiZS4gIERlbGV0ZQo+IHRoZSBzdHJheSB0YWJzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERh
biBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAbGluYXJvLm9yZz4KPiAtLS0KPiAgIGRyaXZlcnMv
c3BpL3NwaS1zdG0zMi5jIHwgNCArKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktc3Rt
MzIuYyBiL2RyaXZlcnMvc3BpL3NwaS1zdG0zMi5jCj4gaW5kZXggM2QyMGYwOWYxYWU3Li5hZmI1
NDE5OGJkZTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zcGkvc3BpLXN0bTMyLmMKPiArKysgYi9k
cml2ZXJzL3NwaS9zcGktc3RtMzIuYwo+IEBAIC0xODk1LDggKzE4OTUsOCBAQCBzdGF0aWMgdm9p
ZCBzdG0zMmg3X3NwaV9kYXRhX2lkbGVuZXNzKHN0cnVjdCBzdG0zMl9zcGkgKnNwaSwgc3RydWN0
IHNwaV90cmFuc2Zlcgo+ICAgCQlpZiAoc3BpX2RlbGF5X25zKSB7Cj4gICAJCQlkZXZfd2Fybihz
cGktPmRldiwgIk92ZXJyaWRpbmcgc3Qsc3BpLW1pZGktbnMgd2l0aCB3b3JkX2RlbGF5X25zICVk
XG4iLAo+ICAgCQkJCSBzcGlfZGVsYXlfbnMpOwo+IC0JCQkJc3BpLT5jdXJfbWlkaSA9IHNwaV9k
ZWxheV9uczsKPiAtCQkJfQo+ICsJCQlzcGktPmN1cl9taWRpID0gc3BpX2RlbGF5X25zOwo+ICsJ
CX0KPiAgIAl9IGVsc2Ugewo+ICAgCQlzcGktPmN1cl9taWRpID0gc3BpX2RlbGF5X25zOwo+ICAg
CX0KClJldmlld2VkLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9z
cy5zdC5jb20+CgpCZXN0IHJlZ2FyZHMsCkNsw6ltZW50Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
