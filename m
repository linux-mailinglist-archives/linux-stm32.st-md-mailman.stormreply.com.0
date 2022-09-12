Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7B65B5B5E
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Sep 2022 15:39:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E73DC04004;
	Mon, 12 Sep 2022 13:39:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A93AC035BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Sep 2022 13:39:00 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C9kNVq018084;
 Mon, 12 Sep 2022 15:38:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=selector1;
 bh=ZRNYOM3L9daSnBMooPao8KQaKxsm/IoB+3vNwvGXBes=;
 b=QE8cI09lNQzmNSSThVSuhmJ0hMQ6JPT9FVpWn3NqB+g8kcgr9GdsjuuRjI7W4fiijzAW
 MtHq0o8AC/la1JKHKxYcF0k/Znc2iTDECnxWcm0H8cHObFIls5s7zKCtvKnKRGypFvDn
 GVq1If0yL09eM5Sr2rKVEhjewkyqbJQ7oBXYj+mbh8TWiAgt1rry0f99VuHO8ALTdyW2
 1UWq44WqoQ7YHwq4gAY0pj1xfKEdnbqg+g8xaokW8Xy7Gj5f6kSIbhPbwSuwHJz9fh4l
 8RqoGn13XjClFVL4iuciYLwGaQEfxCZMiz7tM1nRrQUV6+vJgfNFtWGfk+GzwfDmm9Yc Dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jgjvjtxe1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 15:38:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 40D5110002A;
 Mon, 12 Sep 2022 15:38:45 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 036182309E8;
 Mon, 12 Sep 2022 15:38:45 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.122) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 12 Sep
 2022 15:38:44 +0200
Message-ID: <d80afc20-2745-24a2-ab70-a5a03439bd50@foss.st.com>
Date: Mon, 12 Sep 2022 15:38:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin
 Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>, arm-soc
 <arm@kernel.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
X-Originating-IP: [10.75.127.122]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_09,2022-09-12_01,2022-06-22_01
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [Linux-stm32] [GIT PULL] STM32 DT changes for v6.1 #1
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
IG9mIFNUTTMyIERUIHVwZGF0ZXMgZm9yIHY2LjEuCgpUaGFua3MKQWxleAoKVGhlIGZvbGxvd2lu
ZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA1NjgwMzViMDFjZmIxMDdhZjhkMmU0YmQyZmI5YWVhMjJj
ZjViODY4OgoKICAgTGludXggNi4wLXJjMSAoMjAyMi0wOC0xNCAxNTo1MDoxOCAtMDcwMCkKCmFy
ZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICAgZ2l0Oi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2F0b3JndWUvc3RtMzIuZ2l0IAp0YWdzL3N0
bTMyLWR0LWZvci12Ni4xLTEKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAwNGMyNmM1
YTJkYTg1OTFmZTdlMzcxNDY1OTJkOTA3ZWYzNzQ5MmJkOgoKICAgQVJNOiBkdHM6IHN0bTMyOiBh
cmdvbjogcmVtb3ZlIHNwaWRldiBub2RlICgyMDIyLTA5LTEyIDE1OjE5OjEyICswMjAwKQoKLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpTVE0zMiBEVCBmb3IgdjYuMSwgcm91bmQgMQoKSGlnaGxpZ2h0czoKLS0tLS0tLS0tLQoK
LSBNUFU6CiAgIC0gR2VuZXJhbDoKICAgICAtIEFkZCBJMkMgc3VwcG9ydCAoNSBpbnN0YW5jZXMp
IG9uIFNUTTMyTVAxMy4KICAgICAtIEFkZCBTUEkgc3VwcG9ydCAoNSBpbnN0YWJjZXMpIG9uIFNU
TTMyTVAxMy4KICAgICAtIEFkZCB0aW1lciBpbnRlcnJ1cHRzIHN1cHBvcnQgb24gU1RNMzJNUDE1
LgoKICAgLSBTVCBib2FyZHM6CiAgICAgLSBFbmFibGUgSTJDMSBhbmQgSTJDNSBvbiBzdG0zMm1w
MTM1Zi1kayBib2FyZC4KICAgICAtIEFkZCBTUEk1IG9uIHN0bTMybXAxMzVmLWRrIGJvYXJkIGJ1
dCBkaXNhYmxlZCBhcyBvbmx5IGF2YWlsYWJsZSBvbgogICAgICAgdGhlIEdQSU8gZXhwYW5zaW9u
IGNvbm5lY3Rvci4KCiAgIC0gQVJHT046CiAgICAgLSBSZW1vdmUgc3BpZGV2IG5vZGUgYXMgbm90
IHVzZWQgYnkgdGhlIGNvZGUuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkFsYWluIFZvbG1hdCAoNCk6CiAgICAgICBBUk06
IGR0czogc3RtMzI6IGFkZCBpMmMgbm9kZXMgaW50byBzdG0zMm1wMTMxLmR0c2kKICAgICAgIEFS
TTogZHRzOiBzdG0zMjogZW5hYmxlIGkyYzEgYW5kIGkyYzUgb24gc3RtMzJtcDEzNWYtZGsuZHRz
CiAgICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBzcGkgbm9kZXMgaW50byBzdG0zMm1wMTMxLmR0
c2kKICAgICAgIEFSTTogZHRzOiBzdG0zMjogYWRkIHBpbmN0cmwgYW5kIGRpc2FibGVkIHNwaTUg
bm9kZSBpbiBzdG0zMm1wMTM1Zi1kawoKSmFnYW4gVGVraSAoMSk6CiAgICAgICBBUk06IGR0czog
c3RtMzI6IEZpeCB0eXBvIGluIGxpY2Vuc2UgdGV4dCBmb3IgRW5naWNhbSBib2FyZHMKClBhdHJp
Y2UgQ2hvdGFyZCAoMSk6CiAgICAgICBBUk06IGR0czogc3RtMzI6IENyZWF0ZSBzZXBhcmF0ZSBw
aW5tdXggZm9yIHFzcGkgY3MgcGluIGluIApzdG0zMm1wMTUtcGluY3RybC5kdHNpCgpVd2UgS2xl
aW5lLUvDtm5pZyAoMSk6CiAgICAgICBBUk06IGR0czogc3RtMzI6IEFkZCB0aW1lciBpbnRlcnJ1
cHRzIG9uIHN0bTMybXAxNQoKV29sZnJhbSBTYW5nICgxKToKICAgICAgIEFSTTogZHRzOiBzdG0z
MjogYXJnb246IHJlbW92ZSBzcGlkZXYgbm9kZQoKICBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1w
MTMtcGluY3RybC5kdHNpICAgICAgICAgICB8ICA1NyArKysrKysrKwogIGFyY2gvYXJtL2Jvb3Qv
ZHRzL3N0bTMybXAxMzEuZHRzaSAgICAgICAgICAgICAgICAgIHwgMTYwIAorKysrKysrKysrKysr
KysrKysrKysKICBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTM1Zi1kay5kdHMgICAgICAgICAg
ICAgICB8ICAzMyArKysrKwogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNS1waW5jdHJsLmR0
c2kgICAgICAgICAgIHwgIDUwICsrKystLS0KICBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTUx
LmR0c2kgICAgICAgICAgICAgICAgICB8ICAzNCArKysrKwogIC4uLi9zdG0zMm1wMTU3YS1pY29y
ZS1zdG0zMm1wMS1jdG91Y2gyLW9mMTAuZHRzICAgIHwgICAyICstCiAgLi4uL2R0cy9zdG0zMm1w
MTU3YS1pY29yZS1zdG0zMm1wMS1jdG91Y2gyLmR0cyAgICAgfCAgIDIgKy0KICAuLi4vZHRzL3N0
bTMybXAxNTdhLWljb3JlLXN0bTMybXAxLWVkaW1tMi4yLmR0cyAgICB8ICAgMiArLQogIGFyY2gv
YXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdhLWljb3JlLXN0bTMybXAxLmR0c2kgIHwgICAyICstCiAg
Li4ubTMybXAxNTdhLW1pY3JvZ2VhLXN0bTMybXAxLW1pY3JvZGV2Mi4wLW9mNy5kdHMgfCAgIDIg
Ky0KICAuLi4vc3RtMzJtcDE1N2EtbWljcm9nZWEtc3RtMzJtcDEtbWljcm9kZXYyLjAuZHRzICB8
ICAgMiArLQogIC4uLi9ib290L2R0cy9zdG0zMm1wMTU3YS1taWNyb2dlYS1zdG0zMm1wMS5kdHNp
ICAgIHwgICAyICstCiAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZW1zdGFtcC1hcmdv
bi5kdHNpICAgfCAgIDYgLQogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWV2MS5kdHMg
ICAgICAgICAgICAgIHwgIDEyICstCiAgMTQgZmlsZXMgY2hhbmdlZCwgMzM0IGluc2VydGlvbnMo
KyksIDMyIGRlbGV0aW9ucygtKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
