Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C29E51B4663
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Apr 2020 15:40:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E545C36B0B;
	Wed, 22 Apr 2020 13:40:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F30A4C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 13:40:38 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03MDcOSJ007859; Wed, 22 Apr 2020 15:40:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=ZeG5MEBElFGxvDwVRDIezNZHBbeSXf35WjhoaaZsj6A=;
 b=jO+y+5a32gAoEFM1QqBzK5iYTjSmrs7P8SuFYvtFR+W3OnGhd/4Gp2BDA+qrlTFbFTsJ
 BMn/lRxiRcbFnqblJhnf66LRE9O5sRx/AVwyDw4vAR9QnnI8f45cuFdhMWDmbuTrSvve
 r/QZ4eDjlMGNpiKxrPC7aMnHM/XUFDgUpURhbDLJNeg8kMRXvtNWCChZlPVwjRhCPwLr
 KsSAgre6hLBCL0tCNVVJTIRtjNULSb8E/g+FBEyovrkI4Gbgb3I/NKjZJhC+/UFoC6pi
 x+VoUY4+cq/cYppqFIlXllWqSMXhqt1SgXCeVltwpvaV7u0MUR8TDZYQ3JqT1dXmpTRW og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fregpq4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 15:40:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 951D310002A;
 Wed, 22 Apr 2020 15:40:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8015C2B1889;
 Wed, 22 Apr 2020 15:40:07 +0200 (CEST)
Received: from lmecxl0923.lme.st.com (10.75.127.44) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 22 Apr
 2020 15:40:06 +0200
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <20200420161831.5043-1-ludovic.barre@st.com>
 <CAPDyKFqC3fdnQ9CMYhS-=5MiCET=r5Az2S5oFoA2v1gdDeGO3w@mail.gmail.com>
 <CAPDyKFrHcoVd=GKPB70gOFE8STOnTJrJbcZzE_DEgFWh1Vhszg@mail.gmail.com>
From: Ludovic BARRE <ludovic.barre@st.com>
Message-ID: <1d9cefd1-aaed-1eb5-92f2-b1f45b4da2ac@st.com>
Date: Wed, 22 Apr 2020 15:40:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFrHcoVd=GKPB70gOFE8STOnTJrJbcZzE_DEgFWh1Vhszg@mail.gmail.com>
Content-Language: fr
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-22_06:2020-04-22,
 2020-04-22 signatures=0
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] mmc: mmci_sdmmc: fix power on issue due
 to pwr_reg initialization
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

aGkgVWxmCgpMZSA0LzIxLzIwIMOgIDExOjM4IEFNLCBVbGYgSGFuc3NvbiBhIMOpY3JpdMKgOgo+
IE9uIFR1ZSwgMjEgQXByIDIwMjAgYXQgMTE6MjUsIFVsZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBs
aW5hcm8ub3JnPiB3cm90ZToKPj4KPj4gT24gTW9uLCAyMCBBcHIgMjAyMCBhdCAxODoxOCwgTHVk
b3ZpYyBCYXJyZSA8bHVkb3ZpYy5iYXJyZUBzdC5jb20+IHdyb3RlOgo+Pj4KPj4+IFRoaXMgcGF0
Y2ggZml4IGEgcG93ZXItb24gaXNzdWUsIGFuZCBhdm9pZCB0byByZXRyeSB0aGUgcG93ZXIgc2Vx
dWVuY2UuCj4+Pgo+Pj4gSW4gcG93ZXIgb2ZmIHNlcXVlbmNlOiBzZG1tYyBtdXN0IHNldCBwd3Jf
cmVnIGluICJwb3dlci1jeWNsZSIgc3RhdGUKPj4+ICh2YWx1ZSAweDIpLCB0byBwcmV2ZW50IHRo
ZSBjYXJkIGZyb20gYmVpbmcgc3VwcGxpZWQgdGhyb3VnaCB0aGUgc2lnbmFsCj4+PiBsaW5lcyAo
YWxsIHRoZSBsaW5lcyBhcmUgZHJpdmVuIGxvdykuCj4+Pgo+Pj4gSW4gcG93ZXIgb24gc2VxdWVu
Y2U6IHdoZW4gdGhlIHBvd2VyIGlzIHN0YWJsZSwgc2RtbWMgbXVzdCBzZXQgcHdyX3JlZwo+Pj4g
aW4gInBvd2VyLW9mZiIgc3RhdGUgKHZhbHVlIDB4MCkgdG8gZHJpdmUgYWxsIHNpZ25hbCB0byBo
aWdoIGJlZm9yZSB0bwo+Pj4gc2V0ICJwb3dlci1vbiIuCj4+Cj4+IEp1c3QgYSBxdWVzdGlvbiB0
byBnYWluIGZ1cnRoZXIgdW5kZXJzdGFuZGluZy4KPj4KPj4gTGV0J3MgYXNzdW1lIHRoYXQgdGhl
IGNvbnRyb2xsZXIgaXMgYSBwb3dlci1vbiBzdGF0ZSwgYmVjYXVzZSBpdCdzCj4+IGJlZW4gaW5p
dGlhbGl6ZWQgYnkgdGhlIGJvb3QgbG9hZGVyLiBXaGVuIHRoZSBtbWMgY29yZSB0aGVuIHN0YXJ0
cyB0aGUKPj4gcG93ZXItb24gc2VxdWVuY2UgKG5vdCBkb2luZyBhIHBvd2VyLW9mZiBmaXJzdCks
IHdvdWxkICRzdWJqZWN0IHBhdGNoCj4+IHRoZW4gY2F1c2UgdGhlCj4+IE1NQ0lQT1dFUiB0byBy
ZW1haW4gYXMgaXMsIG9yIGlzIGl0IGdvaW5nIHRvIGJlIG92ZXJ3cml0dGVuPwoKT24gc2RtbWMg
Y29udHJvbGxlciwgdGhlIFBXUkNUUkxbMTowXSBmaWVsZCBvZiBNTUNJUE9XRVIgcmVnaXN0ZXIg
YWxsb3cKdG8gbWFuYWdlIHNkIGxpbmVzIGFuZCBoYXMgYSBzcGVjaWZpYyBiYWhhdmlvci4KClBX
UkNUUkwgdmFsdWU6CiAgLSAweDA6IEFmdGVyIHJlc2V0LCBSZXNldDogdGhlIFNETU1DIGlzIGRp
c2FibGVkIGFuZCB0aGUgY2xvY2sgdG8gdGhlCiAgICAgICAgIENhcmQgaXMgc3RvcHBlZCwgU0RN
TUNfRFs3OjBdLCBhbmQgU0RNTUNfQ01EIGFyZSBIaVogYW5kCiAgICAgICAgIFNETU1DX0NLIGlz
IGRyaXZlbiBsb3cuCiAgICAgICAgIFdoZW4gd3JpdHRlbiAwMCwgcG93ZXItb2ZmOiB0aGUgU0RN
TUMgaXMgZGlzYWJsZWQgYW5kIHRoZSBjbG9jawogICAgICAgICB0byB0aGUgY2FyZCBpcyBzdG9w
cGVkLCBTRE1NQ19EWzc6MF0sIFNETU1DX0NNRCBhbmQgU0RNTUNfQ0sKICAgICAgICAgYXJlIGRy
aXZlbiBoaWdoLgoKICAtIDB4MjogUG93ZXItY3ljbGUsIHRoZSBTRE1NQyBpcyBkaXNhYmxlZCBh
bmQgdGhlIGNsb2NrIHRvIHRoZSBjYXJkIGlzCiAgICAgICAgIHN0b3BwZWQsIFNETU1DX0RbNzow
XSwgU0RNTUNfQ01EIGFuZCBTRE1NQ19DSyBhcmUgZHJpdmVuIGxvdy4KCiAgLSAweDM6IFBvd2Vy
LW9uOiB0aGUgY2FyZCBpcyBjbG9ja2VkLCBUaGUgZmlyc3QgNzQgU0RNTUNfQ0sgY3ljbGVzIHRo
ZQogICAgICAgICBTRE1NQyBpcyBzdGlsbCBkaXNhYmxlZC4gQWZ0ZXIgdGhlIDc0IGN5Y2xlcyB0
aGUgU0RNTUMgaXMKICAgICAgICAgZW5hYmxlZCBhbmQgdGhlIFNETU1DX0RbNzowXSwgU0RNTUNf
Q01EIGFuZCBTRE1NQ19DSyBhcmUKICAgICAgICAgY29udHJvbGxlZCBhY2NvcmRpbmcgdGhlIFNE
TU1DIG9wZXJhdGlvbi4KICAgICAgICAgKipBbnkgZnVydGhlciB3cml0ZSB3aWxsIGJlIGlnbm9y
ZWQsIFBXUkNUUkwgdmFsdWUKICAgICAgICAgd2lsbCBrZWVwIDB4MyoqLiB3aGVuIHRoZSBTRE1N
QyBpcyBPTiAoMHgzKSBvbmx5IGEgcmVzZXQgY291bGQKICAgICAgICAgY2hhbmdlIHB3cmN0cmwg
dmFsdWUgYW5kIHRoZSBzdGF0ZSBvZiBzZG1tYyBsaW5lcy4KClNvIGlmIHRoZSBsaW5lcyBhcmUg
YWxyZWFkeSAiT04iLCB0aGUgcG93ZXItb24gc2VxdWVuY2UgKGRlY3JpYmVkIGluCmNvbW1pdCBt
ZXNzYWdlKSBub3Qgb3ZlcndyaXRlIHRoZSBwd2N0cmwgZmllbGQgYW5kIG5vdCBkaXN0dXJiIHRo
ZSBzZG1tYyAKbGluZXMuCgo+Pgo+PiBJIGFtIGEgbGl0dGxlIHdvcnJpZWQgdGhhdCB3ZSBtYXkg
c3RhcnQgdG8gcmVseSBvbiBib290IGxvYWRlcgo+PiBjb25kaXRpb25zLCB3aGljaCBpc24ndCBy
ZWFsbHkgd2hhdCB3ZSB3YW50IGVpdGhlci4uLgo+PgoKV2Ugbm90IGRlcGVuZCBvZiBib290IGxv
YWRlciBjb25kaXRpb25zLgoKVGhpcyBwYXRjaCBzaW1wbHkgYWxsb3dzIHRvIGRyaXZlIGhpZ2gg
dGhlIHNkIGxpbmVzIGJlZm9yZSB0byBzZXQKInBvd2VyLW9uIiB2YWx1ZSAobm8gZWZmZWN0IGlm
IGFscmVhZHkgcG93ZXIgT04pLgoKPj4+Cj4+PiBUbyBhdm9pZCB3cml0aW5nIHRoZSBzYW1lIHZh
bHVlIHRvIHRoZSBwb3dlciByZWdpc3RlciBzZXZlcmFsIHRpbWVzLCB0aGlzCj4+PiByZWdpc3Rl
ciBpcyBjYWNoZWQgYnkgdGhlIHB3cl9yZWcgdmFyaWFibGUuIEF0IHByb2JlIHB3cl9yZWcgaXMg
aW5pdGlhbGl6ZWQKPj4+IHRvIDAgYnkga3phbGxvYyBvZiBtbWNfYWxsb2NfaG9zdC4KPj4+Cj4+
PiBMaWtlIHB3cl9yZWcgdmFsdWUgaXMgMCBhdCBwcm9iaW5nLCB0aGUgcG93ZXIgb24gc2VxdWVu
Y2UgZmFpbCBiZWNhdXNlCj4+PiB0aGUgInBvd2VyLW9mZiIgc3RhdGUgaXMgbm90IHdyaXRlcyAo
dmFsdWUgMHgwKSBhbmQgdGhlIGxpbmVzCj4+PiByZW1haW4gZHJpdmUgdG8gbG93Lgo+Pj4KPj4+
IFRoaXMgcGF0Y2ggaW5pdGlhbGl6ZXMgInB3cl9yZWciIHZhcmlhYmxlIHdpdGggcG93ZXIgcmVn
aXN0ZXIgdmFsdWUuCj4+PiBUaGlzIGl0IGRvbmUgaW4gc2RtbWMgdmFyaWFudCBpbml0IHRvIG5v
dCBkaXN0dXJiIGRlZmF1bHQgbW1jaSBiZWhhdmlvci4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBM
dWRvdmljIEJhcnJlIDxsdWRvdmljLmJhcnJlQHN0LmNvbT4KPj4KPj4gQmVzaWRlcyB0aGUgY29t
bWVudCwgdGhlIGNvZGUgYW5kIHRoZSBhcHByb2FjaCBzZWVtcyByZWFzb25hYmxlIHRvIG1lLgo+
IAo+IEFub3RoZXIgcmVsYXRlZCBxdWVzdGlvbi4gSSBqdXN0IHJlYWxpemVkIHdoeSB5b3UgcHJv
YmFibHkgaGF2ZW4ndCBzZXQKPiAucHdycmVnX25vcG93ZXIgZm9yIHRoZSB2YXJpYW50X3N0bTMy
X3NkbW1jIGFuZCB2YXJpYW50X3N0bTMyX3NkbW1jdjIuCj4gCj4gSSBndWVzcyBpdCdzIGJlY2F1
c2UgeW91IG5lZWQgYSBzbGlnaHRseSBkaWZmZXJlbnQgd2F5IHRvIHJlc3RvcmUgdGhlCj4gY29u
dGV4dCBvZiBNTUNJUE9XRVIgcmVnaXN0ZXIgYXQgLT5ydW50aW1lX3Jlc3VtZSgpLCByYXRoZXIg
dGhhbiBqdXN0Cj4gcmUtd3JpdGluZyBpdCB3aXRoIHRoZSBzYXZlZCByZWdpc3RlciB2YWx1ZXMu
IElzIHRoaXMgc29tZXRoaW5nIHRoYXQKPiB5b3UgYXJlIGxvb2tpbmcgaW50byBhcyB3ZWxsPwoK
WWVzIGV4YWN0bHksIHRoZSBzZXF1ZW5jZSBpcyBzbGlnaHRseSBkaWZmZXJlbnQuIEkgY2FuJ3Qg
d3JpdGUgMCBvbiAKbW1jaV9ydW50aW1lX3N1c3BlbmQsIGFuZCBjYW4ndCBqdXN0IHJlLXdyaXRp
bmcgdGhlIHNhdmVkIHJlZ2lzdGVyLgoKUmVnYXJkcwpMdWRvCgo+IAo+IFsuLi5dCj4gCj4gS2lu
ZCByZWdhcmRzCj4gVWZmZQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
