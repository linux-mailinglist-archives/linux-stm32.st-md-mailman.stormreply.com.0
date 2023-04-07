Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 311C06DAADA
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Apr 2023 11:27:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE0C9C6B447;
	Fri,  7 Apr 2023 09:27:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2200DC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Apr 2023 09:27:24 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3377g9kT031387; Fri, 7 Apr 2023 11:27:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : from : subject : to : cc : content-type :
 content-transfer-encoding; s=selector1;
 bh=cr6EllTPJ92Jd1uAjJpevUxenxxEQk5TY+o9OiGzZBs=;
 b=MkSuyC0O1voLWVaJeiEbj805SOhPCESzxZcKKq4TKC18ll7LhRdUgPKBLhF5xlrEbnAT
 URJQ5t1BRrUZToaipQc0HQ3AOsYvOJ6Tv18JD8aqO90VBXiowuCpcuypJ26I0oi6le5o
 CyeSXTTr2jBt6GilNtvvM31+7H8zjgU6/bazyhzIGvJNm1+VOXf86l3nGwpTpNFjQvge
 9C+Gy8lN9nOpP4U6i0r8VHaFP7k6DyfYv7LdsYQDrqr5CshBWUNDA4xCi3mMbC9uHeiZ
 /miiiqzCRSruUvc2E/aq0TBVKF8WO8pR9atcvB1LU2QlGI6Mjt4V9aT9n9OkdT+VkLJN LQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ptf110m2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Apr 2023 11:27:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3008D10002A;
 Fri,  7 Apr 2023 11:27:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E8637222C90;
 Fri,  7 Apr 2023 11:27:01 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Fri, 7 Apr
 2023 11:27:01 +0200
Message-ID: <63987ed6-2813-15ff-e058-73312a730d61@foss.st.com>
Date: Fri, 7 Apr 2023 11:27:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin
 Hilman <khilman@baylibre.com>, arm-soc <arm@kernel.org>, SoC Team
 <soc@kernel.org>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_05,2023-04-06_03,2023-02-09_01
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [Linux-stm32] [GIT PULL] STM32 DT changes for v6.4 #1
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
IG9mIFNUTTMyIERUIGZvciB2Ni40IGN5Y2xlLiBNYWluIApjaGFuZ2VzIGNvbmNlcm4gcGVyaXBo
ZXJhbCBzdXBwb3J0IG9uIFNUTTMyTVAxMyBhbmQgeWFtbCBmaXhlcy4KCk5vdGUgdGhhdCBJIGFk
ZGVkIGRvY3VtZW50YXRpb24gYW5kIG1hY2hpbmUgU1RNMzIgcGF0Y2hlcyBpbnNpZGUuIExldCBt
ZSAKa25vdyBpZiB5b3UgcHJlZmVyIGEgc2VwYXJhdGUgUFIuCgpUaGFua3MKQWxleAoKVGhlIGZv
bGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBmZTE1YzI2ZWUyNmVmYTExNzQxYTdiNjMyZTlm
MjNiMDFhY2E0Y2M2OgoKICAgTGludXggNi4zLXJjMSAoMjAyMy0wMy0wNSAxNDo1MjowMyAtMDgw
MCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICAgZ2l0Oi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2F0b3JndWUvc3RtMzIuZ2l0IAp0
YWdzL3N0bTMyLWR0LWZvci12Ni40LTEKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA0
OWYxZDBiNjVmODc2OTJhMTEzODZhOGI4Y2QzYTRhYTNhMWQwZGFhOgoKICAgQVJNOiBzdG0zMjog
YWRkIGluaXRpYWwgZG9jdW1lbnRhdGlvbiBmb3IgU1RNMzJNUDE1MSAoMjAyMy0wNC0wNyAKMDk6
NDA6NDcgKzAyMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tClNUTTMyIERUIGZvciB2Ni40LCByb3VuZCAxCgpIaWdobGln
aHRzOgotLS0tLS0tLS0tCi0gTVBVOgogICAtIFNUTTMyTVAxMzoKICAgICAtIEFkZCBGTUMgc3Vw
cG9ydC4KICAgICAtIEFkZCBRU1BJIHN1cHBvcnQuCiAgICAgLSBBZGQgOCBVQVJUIGluc3RhbmNl
cyBub2Rlcy4KICAgICAtIEVuYWJsZSBVQVJUIG9uIFNUTTMyTVAxMzVGLURLOgogICAgICAgLVVB
UlQxL1VBUlQ4IHVzZWQgb24gZXhwYW5zaW9uIGNvbm5lY3Rvci4KICAgICAgIC1VQVJUMiB1c2Vk
IGZvciBCVC4KICAgICAgIC1VQVJUNCB1c2VkIGZvciBjb25zb2xlLgogICAtIFNUTVAzMk1QMTU6
CiAgICAgLSBBZGQgU1RNMzJNUDE1MSBzdXBwb3J0ICggZG9jdW1lbnRhdGlvbiArIG1hY2hpbmUp
LgogICAgIC0gVWFydCBmaXhlcyAoc2xldyByYXRlLCBhbGlhc2VzIGNsZWFuLXVwKS4KICAgICAt
IEZpeCBHUFUgWUFNbCBpc3N1ZS4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQWxleGFuZHJlIFRvcmd1ZSAoMSk6CiAgICAg
ICBBUk06IGR0czogc3RtMzI6IGZpeCBzcGkxIHBpbiBhc3NpZ25tZW50IG9uIHN0bTMybXAxNQoK
Q2hyaXN0b3BoZSBLZXJlbGxvICgxKToKICAgICAgIEFSTTogZHRzOiBzdG0zMjogYWRkIEZNQyBz
dXBwb3J0IG9uIFNUTTMyTVAxM3ggU29DIGZhbWlseQoKS3J6eXN6dG9mIEtvemxvd3NraSAoMSk6
CiAgICAgICBBUk06IGR0czogc3RtMzI6IGRyb3AgaW52YWxpZCBzaW1wbGUtcGFuZWwgY29tcGF0
aWJsZSBvbiAKc3RtMzJtcDE1N2MtbHhhCgpMZW9uYXJkIEfDtmhycyAoMSk6CiAgICAgICBBUk06
IGR0czogc3RtMzI6IEFkZCBjb3Byb2Nlc3NvciBkZXRhY2ggbWJveCBvbiBzdG0zMm1wMTV4eC1v
c2QzMiBTb00KClBhdHJpY2UgQ2hvdGFyZCAoMSk6CiAgICAgICBBUk06IGR0czogc3RtMzI6IEFk
ZCBRU1BJIHN1cHBvcnQgb24gU1RNMzJNUDEzeCBTb0MgZmFtaWx5CgpQaWVycmUtWXZlcyBNT1JE
UkVUICgzKToKICAgICAgIEFSTTogZHRzOiBzdG0zMjogWUFNTCB2YWxpZGF0aW9uIGZhaWxzIGZv
ciBTVE0zMk1QMTUgU1QgQm9hcmRzCiAgICAgICBBUk06IGR0czogc3RtMzI6IFlBTUwgdmFsaWRh
dGlvbiBmYWlscyBmb3IgT2R5c3NleSBCb2FyZHMKICAgICAgIEFSTTogZHRzOiBzdG0zMjogWUFN
TCB2YWxpZGF0aW9uIGZhaWxzIGZvciBBcmdvbiBCb2FyZHMKClJvYW4gdmFuIERpamsgKDIpOgog
ICAgICAgQVJNOiBzdG0zMjogYWRkIHN1cHBvcnQgZm9yIFNUTTMyTVAxNTEKICAgICAgIEFSTTog
c3RtMzI6IGFkZCBpbml0aWFsIGRvY3VtZW50YXRpb24gZm9yIFNUTTMyTVAxNTEKClZhbGVudGlu
IENhcm9uICg2KToKICAgICAgIEFSTTogZHRzOiBzdG0zMjogZml4IHNsZXctcmF0ZSBvZiBVU0FS
VDIgb24gc3RtMzJtcDE1eHgtZGt4CiAgICAgICBBUk06IGR0czogc3RtMzI6IGNsZWFuIHVhcnQg
YWxpYXNlcyBvbiBzdG0zMm1wMTV4eC1ka3ggYm9hcmRzCiAgICAgICBBUk06IGR0czogc3RtMzI6
IGNsZWFuIHVhcnQgYWxpYXNlcyBvbiBzdG0zMm1wMTV4eC1leHggYm9hcmRzCiAgICAgICBBUk06
IGR0czogc3RtMzI6IGFkZCB1YXJ0IG5vZGVzIG9uIHN0bTMybXAxMwogICAgICAgQVJNOiBkdHM6
IHN0bTMyOiBhZGQgcGlucyBmb3IgdXNhcnQyLzEvNC84IGluIHN0bTMybXAxMy1waW5jdHJsCiAg
ICAgICBBUk06IGR0czogc3RtMzI6IGFkZCB1YXJ0IG5vZGVzIGFuZCB1YXJ0IGFsaWFzZXMgb24g
c3RtMzJtcDEzNWYtZGsKCiAgRG9jdW1lbnRhdGlvbi9hcm0vaW5kZXgucnN0ICAgICAgICAgICAg
ICAgICAgICAgIHwgICAxICsKICBEb2N1bWVudGF0aW9uL2FybS9zdG0zMi9zdG0zMm1wMTUxLW92
ZXJ2aWV3LnJzdCAgfCAgMzYgKysrKysrCiAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDEzLXBp
bmN0cmwuZHRzaSAgICAgICAgIHwgMTI5IAorKysrKysrKysrKysrKysrKysrKwogIGFyY2gvYXJt
L2Jvb3QvZHRzL3N0bTMybXAxMzEuZHRzaSAgICAgICAgICAgICAgICB8IDE0NSAKKysrKysrKysr
KysrKysrKysrKysrKy0KICBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTM1Zi1kay5kdHMgICAg
ICAgICAgICAgfCAgNDIgKysrKysrLQogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNS1waW5j
dHJsLmR0c2kgICAgICAgICB8ICAzNCArKystLS0KICBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1w
MTU3YS1kazEuZHRzICAgICAgICAgICAgfCAgIDMgLQogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMy
bXAxNTdjLWRrMi5kdHMgICAgICAgICAgICB8ICAgMyAtCiAgYXJjaC9hcm0vYm9vdC9kdHMvc3Rt
MzJtcDE1N2MtZWQxLmR0cyAgICAgICAgICAgIHwgIDE3ICstLQogIGFyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMybXAxNTdjLWVtc3RhbXAtYXJnb24uZHRzaSB8ICAgOSAtLQogIGFyY2gvYXJtL2Jvb3Qv
ZHRzL3N0bTMybXAxNTdjLWV2MS5kdHMgICAgICAgICAgICB8ICAgOSArLQogIGFyY2gvYXJtL2Jv
b3QvZHRzL3N0bTMybXAxNTdjLWx4YS1tYzEuZHRzICAgICAgICB8ICAgMiArLQogIGFyY2gvYXJt
L2Jvb3QvZHRzL3N0bTMybXAxNTdjLW9keXNzZXktc29tLmR0c2kgICB8ICAxMCAtLQogIGFyY2gv
YXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRreC5kdHNpICAgICAgICAgICB8ICAxNSArLS0KICBh
cmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1vc2QzMi5kdHNpICAgICAgICAgfCAgIDQgKy0K
ICBhcmNoL2FybS9tYWNoLXN0bTMyL2JvYXJkLWR0LmMgICAgICAgICAgICAgICAgICAgfCAgIDEg
KwogIDE2IGZpbGVzIGNoYW5nZWQsIDM4NiBpbnNlcnRpb25zKCspLCA3NCBkZWxldGlvbnMoLSkK
ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9hcm0vc3RtMzIvc3RtMzJtcDE1MS1v
dmVydmlldy5yc3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
