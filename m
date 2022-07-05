Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EEA5667A2
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Jul 2022 12:17:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCB56C640F4;
	Tue,  5 Jul 2022 10:17:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF685C640F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Jul 2022 10:17:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26593Bb3007813;
 Tue, 5 Jul 2022 12:17:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : from : subject : to : cc : content-type :
 content-transfer-encoding; s=selector1;
 bh=o6YsxP/OCipW+Jn/MvOSlmSg78huV5S6y373JluOE9M=;
 b=HkB/bqI2U+S8WG9fdiIlqYvsd+IZQZir3ZNJFo5+BIfoCGSelUXIl66UD+YVfKlXNCYV
 seGkQMjQbpniJ8zqCJZq0fo8WwXv6/MFWPlx7cuBpgB1NYAO4DVjsO8xuSHZhth+47wg
 Ks3D7fjNScQse257ok8EjDCd0MLCcUeU0PQILeJPD+B4ernkwzRHryufszcfK5Y+kA53
 ncDgZNMzLUBh4C/adgK3FqzC4dRp/DqCfy2GBH329GP8vfJUIX+hhk1DydFmHk97VnHP
 wVhLvo2WLbZwYHSwk+LZyE8uvsh2VYqNaHqLUXjJK1BGKd4we7XsauyQFFe4bTPGUy6m 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h2cwj01yk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jul 2022 12:17:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5131610002A;
 Tue,  5 Jul 2022 12:17:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3AFC421BF51;
 Tue,  5 Jul 2022 12:17:08 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 5 Jul
 2022 12:17:07 +0200
Message-ID: <a250f32b-f67c-2922-0748-e39dc791e95c@foss.st.com>
Date: Tue, 5 Jul 2022 12:17:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin
 Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>, arm-soc
 <arm@kernel.org>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-05_08,2022-06-28_01,2022-06-22_01
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [Linux-stm32] [GIT PULL] STM32 DT changes for v5.20 #1
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
IG9mIFNUTTMyIERUIHVwZGF0ZXMgZm9yIHY1LjIwLiBJdCAKbWFpbmx5IGFkZHMgYSBuZXcgREgg
Ym9hcmQgYW5kIGVuYWJsZXMgU0NNSSAvIE9QVEVFIGZvciBTVE0zMk1QMTMuClRoaXMgUFIgaXMg
YmFzZWQgb24gdGhlIFBSIHNlbnQgZm9yIGZpeGVzICh0YWc6IHN0bTMyLWR0LWZvci12NS4xOS1m
aXhlcy0yKS4KClRoYW5rcwpBbGV4CgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0
IDFkMGMxYWFkZjFmZDlmM2RlOTVkMTUzMmIzNjUxZTg2MzQ1NDZlNzE6CgogICBBUk06IGR0czog
c3RtMzI6IGFkZCBtaXNzaW5nIHVzYmggY2xvY2sgYW5kIGZpeCBjbGsgb3JkZXIgb24gCnN0bTMy
bXAxNSAoMjAyMi0wNy0wNCAwOToxMDoyNCArMDIwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdp
dCByZXBvc2l0b3J5IGF0OgoKICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L2F0b3JndWUvc3RtMzIuZ2l0IAp0YWdzL3N0bTMyLWR0LWZvci12NS4yMC0xCgpm
b3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gY2M2MjgwY2Y4ODVjZTlhYjkyM2I5Zjk3Nzlh
YThmYmUxMDk4M2QyMDoKCiAgIEFSTTogZHRzOiBzdG0zMjogQWRkIFNUIE1JUElEMDIgYmluZGlu
Z3MgdG8gQVY5NiAoMjAyMi0wNy0wNSAxMTo0MjoxMSAKKzAyMDApCgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClNUTTMyIERU
IGZvciB2NS4yMCwgcm91bmQgMQoKSGlnaGxpZ2h0czoKLS0tLS0tLS0tLQoKLSBNQ1U6CiAgIC1G
aXggd2hpdGVzcGFjZSBjb2Rpbmcgc3R5bGUuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KCi0gTVBV
OgogICAtIEdlbmVyYWw6CiAgICAgLSBSZW1vdmUgc3BlY2lmaWMgSVBDQyB3YWtldXAgaW50ZXJy
dXB0IG9uIFNUTTMyTVAxNS4KICAgICAtIEVuYWJsZSBPUFRFRSBmaXJtd2FyZSBhbmQgc2NtaSBz
dXBwb3J0IChjbG9jay9yZXNldCkgb24KICAgICAgIFNUTTMyTVAxMy4gSXQgYWxsb3dzIHRvIGVu
YWJsZSBSQ0MgY2xvY2sgZHJpdmVyLgogICAgIC0gQWRkIG5ldyBwaW5zIGNvbmZpZ3VyYXRpb25z
IGdyb3Vwcy4KCiAgIC0gREggYm9hcmRzOgogICAgIC0gQWRkIERIQ09SIGJhc2VkIERSQyBDb21w
YWN0IGJvYXJkLiBJdCBlbWJlZHM6IDJ4RVRILCAxeENBTiwKICAgICAgIHVTRCwgVVNCLCBlTU1D
IGFuZCBTRElPIHdpZmkuCiAgICAgLSBBZGQgU1QgTUlQSUQwMiBiaW5kaW5ncyB0byBBVjk2IChu
b3QgZW5hYmxlZCBieSBkZWZhdWx0KQoKICAgLSBPU0QzMjoKICAgICAtIENvcnJlY3QgdmNjLXN1
cHBseSBmb3IgZWVwcm9tLgogICAgIC0gZml4IG1pc3NpbmcgaW50ZXJuYWxseSBjb25uZWN0ZWQg
dm9sdGFnZSByZWd1bGF0b3IgKGxkbzMKICAgICAgIHN1cHBsaWVkIGJ5IHZkZF9kZHIpLgoKLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpBbGV4YW5kcmUgVG9yZ3VlICgxKToKICAgICAgIGR0LWJpbmRpbmdzOiByY2M6IHN0bTMy
OiBzZWxlY3QgdGhlICJzZWN1cmUiIHBhdGggZm9yIHN0bTMybXAxMwoKRmFiaWVuIERlc3Nlbm5l
ICgxKToKICAgICAgIEFSTTogZHRzOiBzdG0zMjogcmVtb3ZlIHRoZSBJUENDICJ3YWtldXAiIElS
USBvbiBzdG0zMm1wMTUxCgpHYWJyaWVsIEZlcm5hbmRleiAoMyk6CiAgICAgICBBUk06IGR0czog
c3RtMzI6IGVuYWJsZSBvcHRlZSBmaXJtd2FyZSBhbmQgU0NNSSBzdXBwb3J0IG9uIFNUTTMyTVAx
MwogICAgICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQgUkNDIG9uIFNUTTMyTVAxM3ggU29DIGZhbWls
eQogICAgICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQgb3B0ZWUgcmVzZXJ2ZWQgbWVtb3J5IG9uIHN0
bTMybXAxMzVmLWRrCgpLcnp5c3p0b2YgS296bG93c2tpICgxKToKICAgICAgIEFSTTogZHRzOiBz
dG0zMjogYWRqdXN0IHdoaXRlc3BhY2UgYXJvdW5kICc9JyBvbiBNQ1UgYm9hcmRzCgpMZW9uYXJk
IEfDtmhycyAoMik6CiAgICAgICBBUk06IGR0czogc3RtMzI6IGZpeCBtaXNzaW5nIGludGVybmFs
bHkgY29ubmVjdGVkIHZvbHRhZ2UgCnJlZ3VsYXRvciBmb3IgT1NEMzJNUDEKICAgICAgIEFSTTog
ZHRzOiBzdG0zMjogY29ycmVjdCB2Y2Mtc3VwcGx5IGZvciBlZXByb20gb24gc3RtMzJtcDE1eHgt
b3NkMzIKCk1hcmVrIFZhc3V0ICgxMik6CiAgICAgICBBUk06IGR0czogc3RtMzI6IE1vdmUgREhD
T1IgQlVDSzMgVkREIDJWOSBhZGp1c3RtZW50IHRvIDFWOCBEVFNJCiAgICAgICBBUk06IGR0czog
c3RtMzI6IEZpeCBTUEkyIHBpbm11eCBwaW4gY29tbWVudHMgb24gc3RtMzJtcDE1CiAgICAgICBk
dC1iaW5kaW5nczogYXJtOiBzdG0zMjogQWRkIGNvbXBhdGlibGUgc3RyaW5nIGZvciBESCBlbGVj
dHJvbmljcyAKREhDT1IgRFJDIENvbXBhY3QKICAgICAgIEFSTTogZHRzOiBzdG0zMjogQWRkIGFs
dGVybmF0ZSBwaW5tdXggZm9yIENBTjEgcGlucwogICAgICAgQVJNOiBkdHM6IHN0bTMyOiBBZGQg
YWx0ZXJuYXRlIHBpbm11eCBmb3IgU1BJMiBwaW5zCiAgICAgICBBUk06IGR0czogc3RtMzI6IEFk
ZCBhbHRlcm5hdGUgcGlubXV4IGZvciBVQVJUMyBwaW5zCiAgICAgICBBUk06IGR0czogc3RtMzI6
IEFkZCBhbHRlcm5hdGUgcGlubXV4IGZvciBVQVJUNCBwaW5zCiAgICAgICBBUk06IGR0czogc3Rt
MzI6IEFkZCBhbHRlcm5hdGUgcGlubXV4IGZvciBVQVJUNSBwaW5zCiAgICAgICBBUk06IGR0czog
c3RtMzI6IEFkZCBESENPUiBiYXNlZCBEUkMgQ29tcGFjdCBib2FyZAogICAgICAgQVJNOiBkdHM6
IHN0bTMyOiBBZGQgYWx0ZXJuYXRlIHBpbm11eCBmb3IgRENNSSBwaW5zCiAgICAgICBBUk06IGR0
czogc3RtMzI6IEFkZCBhbHRlcm5hdGUgcGlubXV4IGZvciBSQ0MgcGluCiAgICAgICBBUk06IGR0
czogc3RtMzI6IEFkZCBTVCBNSVBJRDAyIGJpbmRpbmdzIHRvIEFWOTYKCiAgLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlhbWwgICAgICAgfCAgIDggKy0KICAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9jbG9jay9zdCxzdG0zMm1wMS1yY2MueWFtbCB8ICAgMSArCiAgYXJj
aC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwog
IGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyNDI5aS1ldmFsLmR0cyAgICAgICAgICAgICAgIHwgICA4
ICstCiAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJoNzQzLmR0c2kgICAgICAgICAgICAgICAgICAg
fCAgIDQgKy0KICBhcmNoL2FybS9ib290L2R0cy9zdG0zMmg3NDNpLWRpc2NvLmR0cyAgICAgICAg
ICAgICB8ICAgOCArLQogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyaDc0M2ktZXZhbC5kdHMgICAg
ICAgICAgICAgIHwgICA4ICstCiAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJoNzUwaS1hcnQtcGku
ZHRzICAgICAgICAgICAgfCAgIDggKy0KICBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTMxLmR0
c2kgICAgICAgICAgICAgICAgICB8IDE0MCArKysrLS0tLS0KICBhcmNoL2FybS9ib290L2R0cy9z
dG0zMm1wMTMzLmR0c2kgICAgICAgICAgICAgICAgICB8ICAgNCArLQogIGFyY2gvYXJtL2Jvb3Qv
ZHRzL3N0bTMybXAxMzVmLWRrLmR0cyAgICAgICAgICAgICAgIHwgIDExICsKICBhcmNoL2FybS9i
b290L2R0cy9zdG0zMm1wMTN4Yy5kdHNpICAgICAgICAgICAgICAgICB8ICAgMyArLQogIGFyY2gv
YXJtL2Jvb3QvZHRzL3N0bTMybXAxM3hmLmR0c2kgICAgICAgICAgICAgICAgIHwgICAzICstCiAg
YXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1LXBpbmN0cmwuZHRzaSAgICAgICAgICAgfCAxNzcg
KysrKysrKysrKy0KICBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTUxLmR0c2kgICAgICAgICAg
ICAgICAgICB8ICAgNyArLQogIC4uLi9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1M2MtZGhjb3ItZHJj
LWNvbXBhY3QuZHRzIHwgIDMwICsrCiAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhj
b3ItYXZlbmdlcjk2LmR0c2kgfCAgNTUgKysrKwogIC4uLi9ib290L2R0cy9zdG0zMm1wMTV4eC1k
aGNvci1kcmMtY29tcGFjdC5kdHNpICAgIHwgMzIyIAorKysrKysrKysrKysrKysrKysrKysKICBh
cmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNvci1pbzF2OC5kdHNpICAgICB8ICAgNSAr
CiAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb3Itc29tLmR0c2kgICAgICAgfCAg
IDQgKy0KICBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1vc2QzMi5kdHNpICAgICAgICAg
ICB8ICAgOSArLQogIDIxIGZpbGVzIGNoYW5nZWQsIDcwOSBpbnNlcnRpb25zKCspLCAxMDcgZGVs
ZXRpb25zKC0pCiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAx
NTNjLWRoY29yLWRyYy1jb21wYWN0LmR0cwogIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9i
b290L2R0cy9zdG0zMm1wMTV4eC1kaGNvci1kcmMtY29tcGFjdC5kdHNpCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
