Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76897814513
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Dec 2023 11:04:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 251E9C6B45B;
	Fri, 15 Dec 2023 10:04:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 875B2C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 10:04:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BF9ja84006661; Fri, 15 Dec 2023 11:03:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:to:cc:from:subject:content-type
 :content-transfer-encoding; s=selector1; bh=vmzap/0jhhsfYqLAC+8t
 IbS1RD1ONBwq5ngKQ6uk9Cw=; b=R0QrJQbd1Ls5fjH7cXo5Q+uWCeL/wueruPh2
 RUXOsbuYWiBLg9mbRQBjVVCKETEUvkuRmSAvq4RiVjPRioEs5NIztvcoDdEzPbGr
 77S0UhGgRdD/eC1d0jw+u0YQqTXWDjngHkuHuuaaerUbqW7iZCIMon7FvOwxFLaf
 YD1iRPKwl02dvOmTpP1eY9y4Z4kTAk+2q9t59uu+h/7DYWI0Jq2weucfDbijv7oN
 j+VVbLI9tR7qcOQ8+7uEb7TTh27Qtm13c5LTgJeSwYhkv0Cr6DCD1j11H2m93ISk
 pBI0dh+UExaAvzeMERa/NQiwoqaULvMVK42YNBSEM8U67Nk0Wg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uvg0h8w18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Dec 2023 11:03:49 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 31706100058;
 Fri, 15 Dec 2023 11:03:48 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1471020F2C2;
 Fri, 15 Dec 2023 11:03:48 +0100 (CET)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Dec
 2023 11:03:47 +0100
Message-ID: <9363227b-1c44-4a20-b245-efbbbf9ab1dd@foss.st.com>
Date: Fri, 15 Dec 2023 11:03:47 +0100
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
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-15_05,2023-12-14_01,2023-05-22_02
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [GIT PULL] STM32 DT changes for v6.8 #1
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
IG9mIFNUTTMyIERUIGZvciB2Ni44IGN5Y2xlLgoKVGhhbmtzCkFsZXgKCgpUaGUgZm9sbG93aW5n
IGNoYW5nZXMgc2luY2UgY29tbWl0IGI4NWVhOTVkMDg2NDcxYWZiNGFkMDYyMDEyYTRkNzNjZDMy
OGZhODY6CgogICBMaW51eCA2LjctcmMxICgyMDIzLTExLTEyIDE2OjE5OjA3IC0wODAwKQoKYXJl
IGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogICBnaXQ6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYXRvcmd1ZS9zdG0zMi5naXQgCnRhZ3Mvc3Rt
MzItZHQtZm9yLXY2LjgtMQoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDJkZTFiYjE4
M2E2OTk5NTIxYTExNGQzZWQwYjE3ZDE1YjhlNzVlMDQ6CgogICBBUk06IGR0czogc3RtMzI6IGFk
ZCBkY21pcHAgc3VwcG9ydCB0byBzdG0zMm1wMTM1ICgyMDIzLTEyLTE1IAowOToyODowNiArMDEw
MCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KU1RNMzIgRFQgZm9yIHY2LjgsIHJvdW5kIDEKCkhpZ2hsaWdodHM6Ci0tLS0t
LS0tLS0KCi0gTUNVOgogICAtICBBZGQgU1BJIHN1cHBvcnQgb24gU1RNMzJGNzQ2LgogICAtICBC
ZXR0ZXIgZGVzY3JpYmUgdmNjXzN2MyBmb3IgU0QgYW5kIERTSSBvbiBzdG0zMmY0NjktZGlzY28u
CgotIE1QVToKICAgLSBTVE0zMk1QMTM6CiAgICAgLSBBZGQgRENNSVBQIChEaWdpdGFsIENhbWVy
YSBNZW1vcnkgSW50ZXJmYWNlIFBpd2VsIFByb2Nlc3NvcikgIG9uIApTVE0zMk1QMTM1LgoKICAg
LSBTVE1QMzJNUDE1OgogICAgIC0gQ2hhbmdlICJwaHlzIiBhZmZlY3RhdGlvbiBmcm9tIGJvYXJk
IHRvIFNvYyBkdHNpIGZpbGUgZm9yIFVTQiAKaG9zdCBhcyBpdCBpcyBoYXJkICBsaW5rZWQKICAg
ICAgIHRvIHRoZSBwb3J0IDAgb2YgdXNicGh5Yy4KICAgICAtIEZpeCBTQ01JIGFuZCBOby1TQ01J
IGNvbXBhdGlibGUgaW4gYm9hcmRzLgoKICAgLSBTVE0zMk1QMjU6CiAgICAgLSBBZGQgQlNFQyBz
dXBwb3J0IHRvIHJlYWQgdGhlIGRldmljZSBwYXJ0IG51bWJlciBPVFAgYW5kIHRoZSAKcGFja2Fn
ZSBkYXRhIHJlZ2lzdGVyIE9UUC4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQWhtYWQgRmF0b3VtICgyKToKICAgICAgIGR0
LWJpbmRpbmdzOiBhcm06IHN0bTMyOiBkb24ndCBtaXggU0NNSSBhbmQgbm9uLVNDTUkgYm9hcmQg
CmNvbXBhdGlibGVzCiAgICAgICBBUk06IGR0czogc3RtMzI6IGRvbid0IG1peCBTQ01JIGFuZCBu
b24tU0NNSSBib2FyZCBjb21wYXRpYmxlcwoKQmVuIFdvbHNpZWZmZXIgKDIpOgogICAgICAgQVJN
OiBkdHM6IHN0bTMyOiBhZGQgU1RNMzJGNzQ2IHN5c2NmZyBjbG9jawogICAgICAgQVJNOiBkdHM6
IHN0bTMyOiBhZGQgU1BJIHN1cHBvcnQgb24gU1RNMzJGNzQ2CgpEYXJpbyBCaW5hY2NoaSAoMSk6
CiAgICAgICBBUk06IGR0czogc3RtMzI6IHVzZSB0aGUgc2FtZSAzdjMgZm9yIFNEIGFuZCBEU0kg
bm9kZXMgb24gCnN0bTMyZjQ2OS1kaXNjbwoKSHVndWVzIEZydWNoZXQgKDEpOgogICAgICAgQVJN
OiBkdHM6IHN0bTMyOiBhZGQgZGNtaXBwIHN1cHBvcnQgdG8gc3RtMzJtcDEzNQoKS3J6eXN6dG9m
IEtvemxvd3NraSAoMSk6CiAgICAgICBBUk06IGR0czogc3RtMzI6IG1pbm9yIHdoaXRlc3BhY2Ug
Y2xlYW51cCBhcm91bmQgJz0nCgpQYXRyaWNrIERlbGF1bmF5ICgxKToKICAgICAgIGFybTY0OiBk
dHM6IHN0OiBhZGQgYnNlYyBzdXBwb3J0IHRvIHN0bTMybXAyNQoKVXdlIEtsZWluZS1Lw7ZuaWcg
KDEpOgogICAgICAgQVJNOiBkdHM6IHN0bTMyOiBDb25zb2xpZGF0ZSB1c2JoX1tlb11oY2kgcGh5
IHByb3BlcnRpZXMgb24gc3RtMzJtcDE1CgogIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbCAgICAgIHwgMTYgCisrKy0tLS0tLS0tLS0tLS0KICBh
cmNoL2FybS9ib290L2R0cy9zdC9zdG0zMmY0NjktZGlzY28uZHRzICAgICAgICAgICAgICAgICAg
ICB8IDE1IAorKysrLS0tLS0tLS0tLS0KICBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMmY3NDYu
ZHRzaSAgICAgICAgICAgICAgICAgICAgICAgICB8IDYxIAorKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAgYXJjaC9hcm0vYm9vdC9k
dHMvc3Qvc3RtMzJtcDEzNS5kdHNpICAgICAgICAgICAgICAgICAgICAgICAgfCAxMSAKKysrKysr
KysrKysKICBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTUxLmR0c2kgICAgICAgICAgICAg
ICAgICAgICAgICB8ICA0ICsrKysKICBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTUxYS1w
cnR0MWwuZHRzaSAgICAgICAgICAgICAgICB8ICAyIC0tCiAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qv
c3RtMzJtcDE1N2EtZGsxLXNjbWkuZHRzICAgICAgICAgICAgICAgfCAgNCArKy0tCiAgYXJjaC9h
cm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1N2Etc3Rpbmdlcjk2LmR0c2kgICAgICAgICAgICAgfCAg
MiAtLQogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTdjLWRrMi1zY21pLmR0cyAgICAg
ICAgICAgICAgIHwgIDQgKystLQogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTdjLWVk
MS1zY21pLmR0cyAgICAgICAgICAgICAgIHwgIDQgKystLQogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0
L3N0bTMybXAxNTdjLWVtc3RhbXAtYXJnb24uZHRzaSAgICAgICAgIHwgIDQgLS0tLQogIGFyY2gv
YXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTdjLWV2MS1zY21pLmR0cyAgICAgICAgICAgICAgIHwg
IDUgKystLS0KICBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTU3Yy1ldjEuZHRzICAgICAg
ICAgICAgICAgICAgICB8ICAxIC0KICBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTU3Yy1v
c2QzMm1wMS1yZWQuZHRzICAgICAgICAgICB8ICA0IC0tLS0KICBhcmNoL2FybS9ib290L2R0cy9z
dC9zdG0zMm1wMTU3Yy1waHljb3JlLXN0bTMybXAxNS1zb20uZHRzaSB8ICA0IC0tLS0KICBhcmNo
L2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4Yy1seGEtdGFjLmR0c2kgICAgICAgICAgICAgICB8
ICAzIC0tLQogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXh4LWRoY29tLWRyYzAyLmR0
c2kgICAgICAgICAgIHwgIDEgLQogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXh4LWRo
Y29tLXBkazIuZHRzaSAgICAgICAgICAgIHwgIDEgLQogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0
bTMybXAxNXh4LWRoY29tLXBpY29pdHguZHRzaSAgICAgICAgIHwgIDIgLS0KICBhcmNoL2FybS9i
b290L2R0cy9zdC9zdG0zMm1wMTV4eC1kaGNvci1hdmVuZ2VyOTYuZHRzaSAgICAgICB8ICAyIC0t
CiAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1eHgtZGhjb3ItZHJjLWNvbXBhY3QuZHRz
aSAgICAgfCAgMiAtLQogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXh4LWRoY29yLXRl
c3RiZW5jaC5kdHNpICAgICAgIHwgIDIgLS0KICBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1w
MTV4eC1ka3guZHRzaSAgICAgICAgICAgICAgICAgICB8ICAxIC0KICBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL3N0L3N0bTMybXAyNTEuZHRzaSAgICAgICAgICAgICAgICAgICAgICB8IDE2IAorKysrKysr
KysrKysrKysrCiAgMjQgZmlsZXMgY2hhbmdlZCwgMTA3IGluc2VydGlvbnMoKyksIDY0IGRlbGV0
aW9ucygtKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
