Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C9886C6C6
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Feb 2024 11:24:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7D5DC6C838;
	Thu, 29 Feb 2024 10:24:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED3DEC6B46B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Feb 2024 10:24:03 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41TAJL6H020919; Thu, 29 Feb 2024 11:23:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:to:cc:from:subject:content-type
 :content-transfer-encoding; s=selector1; bh=5LPraC5Ke1QUuqM3uvuf
 8Y0t7zNfl01i7GhOtXZ5qT8=; b=mfDs2187i5erCavAqGCMKlMS98Dv6rFr+scv
 qP1hpGC6IrWWiaLMx9+eiKu8ZUSeMvebp8CjIxVLRj8EdCmTBrvz4IIeH+vSwxpm
 Nofd6OxkMhqXXf/7YxJ3kbzjDqeFWDX2Xmi+1lCQecWQAf+aX+nIuFh1+cIFVTez
 j2Ig8Mxsu2ityt7jdBfBS7pHagKZFf37Zb9h50BUO4XNV1eZ01iSl/WmxCPrGEFT
 gaW5OBg1cRIHXWNxSdMMe35ULcHuEIWvnGjD9hEmZiVacWU+ZNBWIZ7yiubwybjc
 3Tw1uKwSZtnD+LUpyeXhs6IzWfNe3U9jLaSO0Rujc68FPYyb1w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3whf4d1kgw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Feb 2024 11:23:47 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A51C640050;
 Thu, 29 Feb 2024 11:23:40 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D542C25AB96;
 Thu, 29 Feb 2024 11:23:13 +0100 (CET)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 29 Feb
 2024 11:23:13 +0100
Message-ID: <a7ae1058-e24d-4a6b-900f-401f0e3ae17c@foss.st.com>
Date: Thu, 29 Feb 2024 11:23:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin
 Hilman <khilman@baylibre.com>, <arm@kernel.org>, <soc@kernel.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-29_02,2024-02-27_01,2023-05-22_02
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [GIT PULL] STM32 DT changes for v6.9#1
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

SGkgQVJNIFNvQyBtYWludGFpbmVycywKClBsZWFzZSBjb25zaWRlciB0aGlzIGZpcnN0IHJvdW5k
IG9mIFNUTTMyIERUIGZvciB2Ni45IGN5Y2xlLgpTb3JyeSB0byBiZSBsYXRlLgoKVGhhbmtzCkFs
ZXgKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNjYxMzQ3NmUyMjVlMDkwY2M5
YWFkNDliZTdmYTUwNGUyOTBkZDMzZDoKCiAgIExpbnV4IDYuOC1yYzEgKDIwMjQtMDEtMjEgMTQ6
MTE6MzIgLTA4MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAg
IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9hdG9yZ3VlL3N0
bTMyLmdpdCAKdGFncy9zdG0zMi1kdC1mb3ItdjYuOS0xCgpmb3IgeW91IHRvIGZldGNoIGNoYW5n
ZXMgdXAgdG8gYTdiOWFiNmM4ODBkNGNlMmMyMTZmMTQ0ODJhNmQzZTI0ZmMwYzg3YToKCiAgIGFy
bTY0OiBkdHM6IHN0OiBhZGQgdmlkZW8gZW5jb2RlciBzdXBwb3J0IHRvIHN0bTMybXAyNTUgKDIw
MjQtMDItMjkgCjEwOjI4OjU0ICswMTAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpTVE0zMiBEVCBmb3IgdjYuOSwgcm91
bmQgMQoKSGlnaGxpZ2h0czoKLS0tLS0tLS0tLQoKLSBNQ1U6CiAgIC0gQWRkIERTSSBzdXBwb3J0
IG9uIHN0bTMyZjc2OS4KICAgLSBBZGQgZGlzcGxheSBzdXBwb3J0IG9uIHN0bTMyZjc2OS1kaXNj
by4KICAgLSBBZGQgc3RtMzJmNzY5LWRpc2NvLW1iMTE2Ni1yZXZhMDkgYm9hcmQgc3VwcG9ydCB3
aGljaCBiZWxvbmdzIHRvCiAgICAgdGhlIG5vdmF0ZWsgTlQzNTUxMCBwYW5lbC4KCi0gTVBVOgog
ICAtIFNUTTMyTVAxMzoKICAgICAtIEFkZCBDUkMgc3VwcG9ydCBhbiBlbmFibGUgaXQgb24gc3Rt
MzJtcDEzNWYtZGsuCiAgICAgLSBFbmFibGUgQ1JZUCBvbiBzdG0zMm1wMTM1Zi1kay4KCiAgIC0g
U1RNUDMyTVAxNToKICAgIC0gRml4IERTSSBwZXJpcGhlcmFsIGNsb2NrOiB1c2UgYnVzIGNsb2Nr
IGluc3RlYWQgb2Yga2VybmVsIGNsb2NrCiAgICAgIGZvciBwY2xrLgoKICAgIC0gTFhBOiBkcml2
ZXIgcG93ZXJib2FyZCBsaW5lcyBhcyBvcGVuIGRyYWluLgogICAgLSBMWEE6IHJlZHVjZSBSR01J
SSBkcml2ZSBzdHJlbmdodCB0byByZWR1Y2UgRU1JIGVtbWlzc2lvbnMuCgogICAtIFNUTTMyTVAy
NToKICAgICAtIEFkZCB2aWRlbyBlbmNvZGVyIC8gdmlkZW8gZGVjb2RlciBzdXBwb3J0LgoKLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpEYXJpbyBCaW5hY2NoaSAoNik6CiAgICAgICBkdC1iaW5kaW5nczogbnQzNTUxMDogZG9j
dW1lbnQgJ3BvcnQnIHByb3BlcnR5CiAgICAgICBkdC1iaW5kaW5nczogbWZkOiBzdG0zMmY3OiBB
ZGQgYmluZGluZyBkZWZpbml0aW9uIGZvciBEU0kKICAgICAgIEFSTTogZHRzOiBzdG0zMjogYWRk
IERTSSBzdXBwb3J0IG9uIHN0bTMyZjc2OQogICAgICAgQVJNOiBkdHM6IHN0bTMyOiByZW5hbWUg
bW1jX3ZjYXJkIHRvIHZjYy0zdjMgb24gc3RtMzJmNzY5LWRpc2NvCiAgICAgICBBUk06IGR0czog
c3RtMzI6IGFkZCBkaXNwbGF5IHN1cHBvcnQgb24gc3RtMzJmNzY5LWRpc2NvCiAgICAgICBBUk06
IGR0czogYWRkIHN0bTMyZjc2OS1kaXNjby1tYjExNjYtcmV2YTA5CgpIdWd1ZXMgRnJ1Y2hldCAo
Mik6CiAgICAgICBhcm02NDogZHRzOiBzdDogYWRkIHZpZGVvIGRlY29kZXIgc3VwcG9ydCB0byBz
dG0zMm1wMjU1CiAgICAgICBhcm02NDogZHRzOiBzdDogYWRkIHZpZGVvIGVuY29kZXIgc3VwcG9y
dCB0byBzdG0zMm1wMjU1CgpMZW9uYXJkIEfDtmhycyAoMik6CiAgICAgICBBUk06IGR0czogc3Rt
MzI6IGx4YS10YWM6IGRyaXZlIHBvd2VyYm9hcmQgbGluZXMgYXMgb3Blbi1kcmFpbgogICAgICAg
QVJNOiBkdHM6IHN0bTMyOiBseGEtdGFjOiByZWR1Y2UgUkdNSUkgaW50ZXJmYWNlIGRyaXZlIHN0
cmVuZ3RoCgpMaW9uZWwgRGViaWV2ZSAoMik6CiAgICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBD
UkMgb24gc3RtMzJtcDEzMQogICAgICAgQVJNOiBkdHM6IHN0bTMyOiBlbmFibGUgQ1JDIG9uIHN0
bTMybXAxMzVmLWRrCgpSYXBoYWVsIEdhbGxhaXMtUG91ICgxKToKICAgICAgIEFSTTogZHRzOiBz
dG0zMjogZml4IERTSSBwZXJpcGhlcmFsIGNsb2NrIG9uIHN0bTMybXAxNSBib2FyZHMKClRob21h
cyBCb3VyZ29pbiAoMSk6CiAgICAgICBBUk06IGR0czogc3RtMzI6IGVuYWJsZSBjcnlwdG8gYWNj
ZWxlcmF0b3Igb24gc3RtMzJtcDEzNWYtZGsKCiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvbm92YXRlayxudDM1NTEwLnlhbWwgfCAKICAxICsKICBhcmNo
L2FybS9ib290L2R0cy9zdC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IAogIDEgKwogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjc2OS1kaXNjby1t
YjExNjYtcmV2YTA5LmR0cyAgICAgICAgICAgICAgIHwgCjEzICsrKysrKysrKysrKysKICBhcmNo
L2FybS9ib290L2R0cy9zdC9zdG0zMmY3NjktZGlzY28uZHRzICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IAo3MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0tCiAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJm
NzY5LmR0c2kgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAKMjAgKysrKysrKysr
KysrKysrKysrKysKICBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMxLmR0c2kgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IAogIDcgKysrKysrKwogIGFyY2gvYXJtL2Jvb3Qv
ZHRzL3N0L3N0bTMybXAxMzVmLWRrLmR0cyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
CiAgOCArKysrKysrKwogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTcuZHRzaSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgCiAgMiArLQogIGFyY2gvYXJtL2Jvb3QvZHRz
L3N0L3N0bTMybXAxNTdhLWRrMS1zY21pLmR0cyAgICAgICAgICAgICAgICAgICAgICAgIHwgCiAg
MiArLQogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTdjLWRrMi1zY21pLmR0cyAgICAg
ICAgICAgICAgICAgICAgICAgIHwgCiAgMiArLQogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMy
bXAxNTdjLWVkMS1zY21pLmR0cyAgICAgICAgICAgICAgICAgICAgICAgIHwgCiAgMiArLQogIGFy
Y2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTdjLWV2MS1zY21pLmR0cyAgICAgICAgICAgICAg
ICAgICAgICAgIHwgCiAgMiArLQogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTdjLWx4
YS10YWMtZ2VuMi5kdHMgICAgICAgICAgICAgICAgICAgIHwgCiAgMiArLQogIGFyY2gvYXJtL2Jv
b3QvZHRzL3N0L3N0bTMybXAxNXhjLWx4YS10YWMuZHRzaSAgICAgICAgICAgICAgICAgICAgICAg
IHwgCiAgNiArKysrKy0KICBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IAoxMiArKysrKysrKysrKysKICBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTUuZHRzaSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8IAoxNyArKysrKysrKysrKysrKysrKwogIGluY2x1ZGUvZHQtYmluZGluZ3MvbWZkL3N0
bTMyZjctcmNjLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgCiAgMSArCiAgMTcg
ZmlsZXMgY2hhbmdlZCwgMTU3IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQogIGNyZWF0
ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMmY3NjktZGlzY28tbWIxMTY2
LXJldmEwOS5kdHMKICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3Rt
MzJmNzY5LmR0c2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
