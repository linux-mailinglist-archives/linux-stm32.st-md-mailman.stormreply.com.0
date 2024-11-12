Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4879C524A
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Nov 2024 10:44:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FCDBC78F7D;
	Tue, 12 Nov 2024 09:44:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26B0BC78F7C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 09:43:56 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC82ftV031759;
 Tue, 12 Nov 2024 10:43:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 7Cfl6mwKTgaiiqEteeXeyTmeKooLQUTHnluak0d1CIg=; b=OhC+T+Vcu/72fiQ5
 MYlsLkqqvCCcEJnNHpbZhNCVoT4PCLKBSTVi9UE25xsoGAYBOuDsM5xOTdlupKbx
 6GO8xDfV4qrhW1CNtZk/bz3e40ZN7KKh6CQvPSdqDwvtB1/HNtUQg2SUifn9tauh
 KBDBx0ilYtuouqcmqMNpxuGF9NX+0zEcuDz3PMJ/AQpKpgDkzIwztEodauBUu0jZ
 n783w2JhWcieWTvQkse7LuAe/MvoNL6FlK3mI4WvYqdc7U8Er6VairG4h8CcdaUX
 UyvoLRsGcBVDmf54hz7UCts1sQHyoXeWuKg/4xIhHd5RHU8T2um7ECp8yOpxPIgu
 Q4peWg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42sx1kkh1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2024 10:43:44 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2B9A54008F;
 Tue, 12 Nov 2024 10:42:20 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DF5302912BF;
 Tue, 12 Nov 2024 10:40:50 +0100 (CET)
Received: from [10.48.87.175] (10.48.87.175) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 12 Nov
 2024 10:40:50 +0100
Message-ID: <1179b3a6-e430-4d9a-8f86-470e8cbe5738@foss.st.com>
Date: Tue, 12 Nov 2024 10:40:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, guanjing
 <guanjing@cmss.chinamobile.com>, <mcoquelin.stm32@gmail.com>
References: <20241109055049.269163-1-guanjing@cmss.chinamobile.com>
 <cfb1caed-9402-4148-831d-57c50bdf6a27@foss.st.com>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <cfb1caed-9402-4148-831d-57c50bdf6a27@foss.st.com>
X-Originating-IP: [10.48.87.175]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] firewall: remove misplaced semicolon
 from stm32_firewall_get_firewall
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

T24gMTEvMTIvMjQgMTA6MjUsIEFsZXhhbmRyZSBUT1JHVUUgd3JvdGU6Cj4gSGkKPiAKPiBPbiAx
MS85LzI0IDA2OjUwLCBndWFuamluZyB3cm90ZToKPj4gUmVtb3ZlIG1pc3BsYWNlZCBjb2xvbiBp
biBzdG0zMl9maXJld2FsbF9nZXRfZmlyZXdhbGwoKQo+PiB3aGljaCByZXN1bHRzIGluIGEgc3lu
dGF4IGVycm9yIHdoZW4gdGhlIGNvZGUgaXMgY29tcGlsZWQKPj4gd2l0aG91dCBDT05GSUdfU1RN
MzJfRklSRVdBTEwuCj4+Cj4+IEZpeGVzOiA1Yzk2NjhjZmM2ZDcgKCJmaXJld2FsbDogaW50cm9k
dWNlIHN0bTMyX2ZpcmV3YWxsIGZyYW1ld29yayIpCj4+IFNpZ25lZC1vZmYtYnk6IGd1YW5qaW5n
IDxndWFuamluZ0BjbXNzLmNoaW5hbW9iaWxlLmNvbT4KPj4gLS0tCj4+IMKgIGluY2x1ZGUvbGlu
dXgvYnVzL3N0bTMyX2ZpcmV3YWxsX2RldmljZS5oIHwgMiArLQo+PiDCoCAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvYnVzL3N0bTMyX2ZpcmV3YWxsX2RldmljZS5oIAo+PiBiL2luY2x1ZGUvbGludXgv
YnVzL3N0bTMyX2ZpcmV3YWxsX2RldmljZS5oCj4+IGluZGV4IDE4ZTBhMmZjMzgxNi4uNTE3OGI3
MmJjOTIwIDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L2J1cy9zdG0zMl9maXJld2FsbF9k
ZXZpY2UuaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L2J1cy9zdG0zMl9maXJld2FsbF9kZXZpY2Uu
aAo+PiBAQCAtMTE1LDcgKzExNSw3IEBAIHZvaWQgc3RtMzJfZmlyZXdhbGxfcmVsZWFzZV9hY2Nl
c3NfYnlfaWQoc3RydWN0IAo+PiBzdG0zMl9maXJld2FsbCAqZmlyZXdhbGwsIHUzMiBzdQo+PiDC
oCAjZWxzZSAvKiBDT05GSUdfU1RNMzJfRklSRVdBTEwgKi8KPj4gwqAgaW50IHN0bTMyX2ZpcmV3
YWxsX2dldF9maXJld2FsbChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCBzdHJ1Y3QgCj4+IHN0bTMy
X2ZpcmV3YWxsICpmaXJld2FsbCwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1
bnNpZ25lZCBpbnQgbmJfZmlyZXdhbGwpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHVuc2lnbmVkIGludCBuYl9maXJld2FsbCkKPj4gwqAgewo+PiDCoMKgwqDCoMKgIHJldHVy
biAtRU5PREVWOwo+PiDCoCB9Cj4gCj4gQWNrZWQtYnk6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhh
bmRyZS50b3JndWVAZm9zcy5zdC5jb20+Cj4gCj4gVGhhbmtzCj4gQWxleAoKSGksIHBsZWFzZSB1
c2UgZ2V0X21haW50YWluZXJzLnBsIHNjcmlwdCBuZXh0IHRpbWUgc28gdGhhdAphZGVxdWF0ZSBw
ZW9wbGUgYXJlIHB1dCBpbiBUby9DQy4KTmV2ZXJ0aGVsZXNzLCB0aGFua3MgZm9yIHRoZSBwYXRj
aCEKClJldmlld2VkLWJ5OiBHYXRpZW4gQ2hldmFsbGllciA8Z2F0aWVuLmNoZXZhbGxpZXJAZm9z
cy5zdC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
