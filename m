Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1402B00701
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jul 2025 17:36:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2F9BC349C2;
	Thu, 10 Jul 2025 15:36:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54B5BC349C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 15:36:36 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56AFPij1003754;
 Thu, 10 Jul 2025 17:36:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=KzAzOUNX3up9WMQCB7MqOT
 zOvJNFeyyub5F+P4jf5qM=; b=lsxCRHRbNjQ/9zQewQtP0wwHl9RzC2qQeY9/7Y
 EhODSKMa4ySHAbtwKLDOltmwzZHNBLs6dnrESG1atSpDh+RcHAfC8zGopS0eMgdW
 Jzt0L13iNu8MWFfZfotWAVJ3s+WR6nOr4d4zw4XI/2wDpi1F47tA0CcrEb3ITsTO
 U/rn01DbiAJgahsL9r2Axz3K72gxfXmyR0VcQioCRzpWkH92MMhI9Mx/e5/VynS+
 SEOXn7GXBW0PJsvhxyS1Iy92c+AEgrIoeuzn0cU8mb62dd/rphstUnV32PQEHRaD
 +Q0N0abltr1bbWWqbp4u5H7DTt+z3zogCuPg5X6IvyI43o6w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47pud3j4y1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jul 2025 17:36:22 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 542B04005B;
 Thu, 10 Jul 2025 17:35:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0C05BB1F9A8;
 Thu, 10 Jul 2025 17:33:08 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 17:33:07 +0200
Message-ID: <b3e3363b-1ea5-457c-b244-2cbe26f7d6e4@foss.st.com>
Date: Thu, 10 Jul 2025 17:33:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>,
 <arm@kernel.org>, <soc@kernel.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
Cc: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [Linux-stm32] [GIT PULL] STM32 DT changes for v6.17#1
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
IG9mIFNUTTMyIERUIGNoYW5nZXMgZm9yIHY2LjE3IGN5Y2xlLgpJIGFkZGVkIGEgY29uZmlnIHBh
dGNoIGluc2lkZS4KClRoYW5rcwpBbGV4CgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNv
bW1pdCAxOTI3MmIzN2FhNGY4M2NhNTJiZGY5YzE2ZDVkODFiZGQxMzU0NDk0OgoKICAgTGludXgg
Ni4xNi1yYzEgKDIwMjUtMDYtMDggMTM6NDQ6NDMgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRo
ZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9hdG9yZ3VlL3N0bTMyLmdpdCAKdGFncy9zdG0zMi1kdC1mb3ItdjYuMTct
MQoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDFhMzJmNzQyN2ViM2QxMjQ4YmM2NGNk
NzQ1YjkzZjg4Y2M4Mzg5MzM6CgogICBhcm02NDogZHRzOiBzdDogcmVtb3ZlIGVtcHR5IGxpbmUg
aW4gc3RtMzJtcDI1MS5kdHNpICgyMDI1LTA3LTEwIAoxNzowNTo1NiArMDIwMCkKCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
U1RNMzIgRFQgZm9yIHY2LjE3LCByb3VuZCAxCgpIaWdobGlnaHRzOgotLS0tLS0tLS0tCgotIE1Q
VToKICAgLSBTVE0zMk1QMTM6CiAgICAgLUFkZCBFdGhlcm5ldCBNQUMgYWRyZXNzIGVmdXNlIHN1
cHBvcnQuCgogICAtIFNUTVAzMk1QMTU6CiAgICAgLSBBZGQgc3RtMzJtcDE1N2YtREsyIGJvYXJk
IHN1cHBvcnQuIFRoaXMgYm9hcmQgZW1iZWRkcyB0aGUgc2FtZQogICAgICAgY29uZWN0aXZpdHkg
ZGV2aWNlcywgRERSIC4uLiB0aGFuIHN0bTMybXAxNTdjLWRrMi4KICAgICAgIEhvd2V2ZXIgdGhl
cmUgYXJlIHR3byBkaWZmZXJlbmNlczogU1RNMzJNUDE1N0YgU29DIHdoaWNoIGFsbG93cwogICAg
ICAgb3ZlcmRyaXZlIE9QUCBhbmQgdGhlIFNDTUkgc3VwcG9ydCBmb3Igc3lzdGVtIGZlYXR1cmVz
IGxpa2UKICAgICAgIGNsb2NrcyBhbmQgcmVndWxhdG9ycy4KCiAgIC0gU1RNMzJNUDI1OgogICAg
IC0gRml4IHRpY2sgdGltZXIgZm9yIGxvdyBwb3dlciB1c2UgY2FzZXMuCiAgICAgLSBBZGQgdGlt
ZXIgc3VwcG9ydC4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KQWxleGFuZHJlIFRvcmd1ZSAoMSk6CiAgICAgICBBUk06IGR0
czogc3RtMzI6IGZ1bGxmaWxsIGRpdmVyc2l0eSB3aXRoIE9QUCBmb3IgU1RNMzJNMTV4RiBTT0Nz
CgpBbWVsaWUgRGVsYXVuYXkgKDMpOgogICAgICAgQVJNOiBkdHM6IHN0bTMyOiB1c2UgJ3R5cGVj
JyBnZW5lcmljIG5hbWUgZm9yIHN0dXNiMTYwMCBvbiAKc3RtMzJtcDE1eHgtZGt4CiAgICAgICBB
Uk06IGR0czogc3RtMzI6IHVzZSBpbnRlcm5hbCByZWd1bGF0b3JzIGJpbmRpbmdzIGZvciBNUDE1
IHNjbWkgCnZhcmlhbnRzCiAgICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBzdG0zMm1wMTU3Zi1k
azIgYm9hcmQgc3VwcG9ydAoKRXRpZW5uZSBDYXJyaWVyZSAoMik6CiAgICAgICBkdC1iaW5kaW5n
czogcmVndWxhdG9yOiBBZGQgU1RNMzJNUDE1IFNDTUkgcmVndWxhdG9yIGlkZW50aWZpZXJzCiAg
ICAgICBBUk06IGR0czogc3RtMzI6IG9wdGVlIGFzeW5jIG5vdGlmIGludGVycnVwdCBmb3IgTVAx
NSBzY21pIHZhcmlhbnRzCgpGYWJyaWNlIEdhc25pZXIgKDQpOgogICAgICAgYXJtNjQ6IGR0czog
c3Q6IGFkZCB0aW1lciBub2RlcyBvbiBzdG0zMm1wMjUxCiAgICAgICBhcm02NDogZHRzOiBzdDog
YWRkIHRpbWVyIHBpbnMgZm9yIHN0bTMybXAyNTdmLWV2MQogICAgICAgYXJtNjQ6IGR0czogc3Q6
IGFkZCB0aW1lciBub2RlcyBvbiBzdG0zMm1wMjU3Zi1ldjEKICAgICAgIGFybTY0OiBkZWZjb25m
aWc6IGVuYWJsZSBTVE0zMiB0aW1lcnMgZHJpdmVycwoKSGltYW5zaHUgQmhhdmFuaSAoMSk6CiAg
ICAgICBkdC1iaW5kaW5nczogYXJtOiBzdG0zMjogYWRkIFNUTTMyTVAxNTdGLURLMiBib2FyZCBj
b21wYXRpYmxlCgpPbGl2aWVyIE1veXNhbiAoMSk6CiAgICAgICBBUk06IGR0czogc3RtMzI6IGFk
ZCBzeXN0ZW0tY2xvY2stZGlyZWN0aW9uLW91dCBvbiBzdG0zMm1wMTV4eC1ka3gKClBhdHJpY2Ug
Q2hvdGFyZCAoMSk6CiAgICAgICBhcm02NDogZGVmY29uZmlnOiBFbmFibGUgU1RNMzIgT2N0byBN
ZW1vcnkgTWFuYWdlciBhbmQgT2NzdG9TUEkgCmRyaXZlcgoKUGF0cmljayBEZWxhdW5heSAoMik6
CiAgICAgICBhcm02NDogZHRzOiBzdDogZml4IHRpbWVyIHVzZWQgZm9yIHRpY2tzCiAgICAgICBh
cm02NDogZHRzOiBzdDogcmVtb3ZlIGVtcHR5IGxpbmUgaW4gc3RtMzJtcDI1MS5kdHNpCgpVd2Ug
S2xlaW5lLUvDtm5pZyAoMSk6CiAgICAgICBBUk06IGR0czogc3RtMzI6IEFkZCBudm1lbS1jZWxs
cyB0byBldGhlcm5ldCBub2RlcyBmb3IgY29uc3RhbnQgCm1hYy1hZGRyZXNzZXMKCiAgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55YW1sIHwgICAxICsK
ICBhcmNoL2FybS9ib290L2R0cy9zdC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDMgKy0KICBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMxLmR0c2kgICAgICAgICAg
ICAgICAgICAgfCAgIDIgKwogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzMuZHRzaSAg
ICAgICAgICAgICAgICAgICB8ICAgMiArCiAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1
LXNjbWkuZHRzaSAgICAgICAgICAgICAgIHwgIDEwICsrLQogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0
L3N0bTMybXAxNTdmLWRrMi1zY21pLmR0c2kgICAgICAgICB8IDE5NiAKKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogIGFyY2gvYXJtL2Jvb3Qv
ZHRzL3N0L3N0bTMybXAxNTdmLWRrMi5kdHMgICAgICAgICAgICAgICB8IDE3OSAKKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKICBhcmNoL2FybS9ib290
L2R0cy9zdC9zdG0zMm1wMTV4Zi5kdHNpICAgICAgICAgICAgICAgICAgfCAgMTcgKysrKysKICBh
cmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4eC1ka3guZHRzaSAgICAgICAgICAgICAgfCAg
IDMgKy0KICBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNS1waW5jdHJsLmR0c2kgICAg
ICAgICAgfCAgNjEgCisrKysrKysrKysrKysrKysrKwogIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qv
c3RtMzJtcDI1MS5kdHNpICAgICAgICAgICAgICAgICB8IDUyNyAKKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLQogIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYx
LmR0cyAgICAgICAgICAgICB8ICA1OCAKKysrKysrKysrKysrKysrKysKICBhcmNoL2FybTY0L2Nv
bmZpZ3MvZGVmY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKysKICBpbmNs
dWRlL2R0LWJpbmRpbmdzL3JlZ3VsYXRvci9zdCxzdG0zMm1wMTUtcmVndWxhdG9yLmggfCAgNDAg
KysrKysrKysrKysrCiAgMTQgZmlsZXMgY2hhbmdlZCwgMTA5OCBpbnNlcnRpb25zKCspLCA3IGRl
bGV0aW9ucygtKQogIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0z
Mm1wMTU3Zi1kazItc2NtaS5kdHNpCiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3Qv
ZHRzL3N0L3N0bTMybXAxNTdmLWRrMi5kdHMKICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0v
Ym9vdC9kdHMvc3Qvc3RtMzJtcDE1eGYuZHRzaQogIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRl
L2R0LWJpbmRpbmdzL3JlZ3VsYXRvci9zdCxzdG0zMm1wMTUtcmVndWxhdG9yLmgKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
