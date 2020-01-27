Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4E214A568
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jan 2020 14:50:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CC33C36B0B;
	Mon, 27 Jan 2020 13:50:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 872C6C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2020 13:50:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00RDmTkX028171; Mon, 27 Jan 2020 14:50:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=oVMu/aYe8poIVG/cV7ynwO9nXyfdyRvPhcSDKSxQctA=;
 b=Q3bSE2TOtY5znfF/Jp9rhIVBx2jBb07bvgiWU226WE3gRRElotRNZ7/pvPXzcUr/LPvE
 dCheMlSPWnAUJAq6NWg/Qk4K4GDGqzYw67hgacKdYDpjrCW9UaQkMCbQ+3ZwHIGaRL0Y
 G/vuWmdYB7HCGO8UYA+KPA8dK/axBC+jk3EHlxHHI6u4rnyCdBwJg1D/xrI2p0mawWjC
 uz9LmjOEgfah/FhOjjt6ESEBPNtop+j7TQqmW9eHQMo4lJyTF/decPHWcGaiLUTVfylY
 LbBE6QiPpH+9NUPwW3LHnrPG3neC6iB7Cweb95+EsjU9YuUTuVg21xqJuxe3L9PwRjDX Wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrdek90ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2020 14:50:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A79F100038;
 Mon, 27 Jan 2020 14:50:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 290492B2F1F;
 Mon, 27 Jan 2020 14:50:09 +0100 (CET)
Received: from lmecxl0923.lme.st.com (10.75.127.51) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jan
 2020 14:50:08 +0100
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <20200110134823.14882-1-ludovic.barre@st.com>
 <20200110134823.14882-9-ludovic.barre@st.com>
 <CAPDyKFp1Qsb3yCoTJevHF+SEt5thVVriLfL-4UZSYsNTc0rdMQ@mail.gmail.com>
From: Ludovic BARRE <ludovic.barre@st.com>
Message-ID: <fd005f72-aa74-5650-e8b4-66cf3ff625dd@st.com>
Date: Mon, 27 Jan 2020 14:50:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFp1Qsb3yCoTJevHF+SEt5thVVriLfL-4UZSYsNTc0rdMQ@mail.gmail.com>
Content-Language: fr
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-27_02:2020-01-24,
 2020-01-27 signatures=0
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 8/9] mmc: mmci: sdmmc: add voltage switch
	functions
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

aGkgVWxmCgpMZSAxLzI0LzIwIMOgIDI6MTYgUE0sIFVsZiBIYW5zc29uIGEgw6ljcml0wqA6Cj4g
T24gRnJpLCAxMCBKYW4gMjAyMCBhdCAxNDo0OSwgTHVkb3ZpYyBCYXJyZSA8bHVkb3ZpYy5iYXJy
ZUBzdC5jb20+IHdyb3RlOgo+Pgo+PiBUbyBwcmVwYXJlIHRoZSB2b2x0YWdlIHN3aXRjaCBwcm9j
ZWR1cmUsIHRoZSBWU1dJVENIRU4gYml0IG11c3QgYmUKPj4gc2V0IGJlZm9yZSBzZW5kaW5nIHRo
ZSBjbWQxMS4KPj4gVG8gY29uZmlybSBjb21wbGV0aW9uIG9mIHZvbHRhZ2Ugc3dpdGNoLCB0aGUg
VlNXRU5EIGZsYWcgbXVzdCBiZQo+PiBjaGVja2VkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBMdWRv
dmljIEJhcnJlIDxsdWRvdmljLmJhcnJlQHN0LmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9tbWMv
aG9zdC9tbWNpLmggICAgICAgICAgICAgfCAgNCArKysKPj4gICBkcml2ZXJzL21tYy9ob3N0L21t
Y2lfc3RtMzJfc2RtbWMuYyB8IDQwICsrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4+ICAg
MiBmaWxlcyBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L21tY2kuaCBiL2RyaXZlcnMvbW1jL2hvc3QvbW1j
aS5oCj4+IGluZGV4IGMwNGExNDQyNTlhMi4uMzYzNGY5OGFkMmQ4IDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL21tYy9ob3N0L21tY2kuaAo+PiArKysgYi9kcml2ZXJzL21tYy9ob3N0L21tY2kuaAo+
PiBAQCAtMTY1LDYgKzE2NSw3IEBACj4+ICAgLyogRXh0ZW5kZWQgc3RhdHVzIGJpdHMgZm9yIHRo
ZSBTVE0zMiB2YXJpYW50cyAqLwo+PiAgICNkZWZpbmUgTUNJX1NUTTMyX0JVU1lEMCAgICAgICBC
SVQoMjApCj4+ICAgI2RlZmluZSBNQ0lfU1RNMzJfQlVTWUQwRU5EICAgIEJJVCgyMSkKPj4gKyNk
ZWZpbmUgTUNJX1NUTTMyX1ZTV0VORCAgICAgICBCSVQoMjUpCj4+Cj4+ICAgI2RlZmluZSBNTUNJ
Q0xFQVIgICAgICAgICAgICAgIDB4MDM4Cj4+ICAgI2RlZmluZSBNQ0lfQ01EQ1JDRkFJTENMUiAg
ICAgICgxIDw8IDApCj4+IEBAIC0xODIsNiArMTgzLDkgQEAKPj4gICAjZGVmaW5lIE1DSV9TVF9T
RElPSVRDICAgICAgICAgKDEgPDwgMjIpCj4+ICAgI2RlZmluZSBNQ0lfU1RfQ0VBVEFFTkRDICAg
ICAgICgxIDw8IDIzKQo+PiAgICNkZWZpbmUgTUNJX1NUX0JVU1lFTkRDICAgICAgICAgICAgICAg
ICgxIDw8IDI0KQo+PiArLyogRXh0ZW5kZWQgY2xlYXIgYml0cyBmb3IgdGhlIFNUTTMyIHZhcmlh
bnRzICovCj4+ICsjZGVmaW5lIE1DSV9TVE0zMl9WU1dFTkRDICAgICAgQklUKDI1KQo+PiArI2Rl
ZmluZSBNQ0lfU1RNMzJfQ0tTVE9QQyAgICAgIEJJVCgyNikKPj4KPj4gICAjZGVmaW5lIE1NQ0lN
QVNLMCAgICAgICAgICAgICAgMHgwM2MKPj4gICAjZGVmaW5lIE1DSV9DTURDUkNGQUlMTUFTSyAg
ICAgKDEgPDwgMCkKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3QvbW1jaV9zdG0zMl9z
ZG1tYy5jIGIvZHJpdmVycy9tbWMvaG9zdC9tbWNpX3N0bTMyX3NkbW1jLmMKPj4gaW5kZXggMTAw
NTlmYTE5ZjRhLi45ZjQzY2Y5NDdjNWYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3Qv
bW1jaV9zdG0zMl9zZG1tYy5jCj4+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3QvbW1jaV9zdG0zMl9z
ZG1tYy5jCj4+IEBAIC0yNjMsNyArMjYzLDkgQEAgc3RhdGljIHZvaWQgbW1jaV9zZG1tY19zZXRf
cHdycmVnKHN0cnVjdCBtbWNpX2hvc3QgKmhvc3QsIHVuc2lnbmVkIGludCBwd3IpCj4+ICAgICAg
ICAgIHN0cnVjdCBtbWNfaW9zIGlvcyA9IGhvc3QtPm1tYy0+aW9zOwo+PiAgICAgICAgICBzdHJ1
Y3Qgc2RtbWNfZGx5YiAqZGx5YiA9IGhvc3QtPnZhcmlhbnRfcHJpdjsKPj4KPj4gLSAgICAgICBw
d3IgPSBob3N0LT5wd3JfcmVnX2FkZDsKPj4gKyAgICAgICAvKiBhZGRzIE9GIG9wdGlvbnMgYW5k
IHByZXNlcnZlcyB2b2x0YWdlIHN3aXRjaCBiaXRzICovCj4+ICsgICAgICAgcHdyID0gaG9zdC0+
cHdyX3JlZ19hZGQgfAo+PiArICAgICAgICAgICAgICAgKGhvc3QtPnB3cl9yZWcgJiAoTUNJX1NU
TTMyX1ZTV0lUQ0hFTiB8IE1DSV9TVE0zMl9WU1dJVENIKSk7Cj4+Cj4+ICAgICAgICAgIHNkbW1j
X2RseWJfaW5wdXRfY2soZGx5Yik7Cj4+Cj4+IEBAIC00NTQsNiArNDU2LDQwIEBAIHN0YXRpYyBp
bnQgc2RtbWNfZXhlY3V0ZV90dW5pbmcoc3RydWN0IG1tY19ob3N0ICptbWMsIHUzMiBvcGNvZGUp
Cj4+ICAgICAgICAgIHJldHVybiBzZG1tY19kbHliX3BoYXNlX3R1bmluZyhob3N0LCBvcGNvZGUp
Owo+PiAgIH0KPj4KPj4gK3N0YXRpYyB2b2lkIHNkbW1jX3ByZXBfdnN3aXRjaChzdHJ1Y3QgbW1j
aV9ob3N0ICpob3N0KQo+PiArewo+PiArICAgICAgIC8qIGNsZWFyIHRoZSB2b2x0YWdlIHN3aXRj
aCBjb21wbGV0aW9uIGZsYWcgKi8KPj4gKyAgICAgICB3cml0ZWxfcmVsYXhlZChNQ0lfU1RNMzJf
VlNXRU5EQywgaG9zdC0+YmFzZSArIE1NQ0lDTEVBUik7Cj4+ICsgICAgICAgLyogZW5hYmxlIFZv
bHRhZ2Ugc3dpdGNoIHByb2NlZHVyZSAqLwo+PiArICAgICAgIG1tY2lfd3JpdGVfcHdycmVnKGhv
c3QsIGhvc3QtPnB3cl9yZWcgfCBNQ0lfU1RNMzJfVlNXSVRDSEVOKTsKPj4gK30KPj4gKwo+PiAr
c3RhdGljIGludCBzZG1tY192c3dpdGNoKHN0cnVjdCBtbWNpX2hvc3QgKmhvc3QsIHN0cnVjdCBt
bWNfaW9zICppb3MpCj4+ICt7Cj4+ICsgICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPj4gKyAg
ICAgICB1MzIgc3RhdHVzOwo+PiArICAgICAgIGludCByZXQgPSAwOwo+PiArCj4+ICsgICAgICAg
aWYgKGlvcy0+c2lnbmFsX3ZvbHRhZ2UgPT0gTU1DX1NJR05BTF9WT0xUQUdFXzE4MCkgewo+PiAr
ICAgICAgICAgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmhvc3QtPmxvY2ssIGZsYWdzKTsKPj4g
KyAgICAgICAgICAgICAgIG1tY2lfd3JpdGVfcHdycmVnKGhvc3QsIGhvc3QtPnB3cl9yZWcgfCBN
Q0lfU1RNMzJfVlNXSVRDSCk7Cj4+ICsgICAgICAgICAgICAgICBzcGluX3VubG9ja19pcnFyZXN0
b3JlKCZob3N0LT5sb2NrLCBmbGFncyk7Cj4+ICsKPj4gKyAgICAgICAgICAgICAgIC8qIHdhaXQg
dm9sdGFnZSBzd2l0Y2ggY29tcGxldGlvbiB3aGlsZSAxMG1zICovCj4+ICsgICAgICAgICAgICAg
ICByZXQgPSByZWFkbF9yZWxheGVkX3BvbGxfdGltZW91dChob3N0LT5iYXNlICsgTU1DSVNUQVRV
UywKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
YXR1cywKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IChzdGF0dXMgJiBNQ0lfU1RNMzJfVlNXRU5EKSwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDEwLCAxMDAwMCk7Cj4+ICsKPj4gKyAgICAgICAgICAg
ICAgIHdyaXRlbF9yZWxheGVkKE1DSV9TVE0zMl9WU1dFTkRDIHwgTUNJX1NUTTMyX0NLU1RPUEMs
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBob3N0LT5iYXNlICsgTU1DSUNMRUFS
KTsKPj4gKyAgICAgICAgICAgICAgIG1tY2lfd3JpdGVfcHdycmVnKGhvc3QsIGhvc3QtPnB3cl9y
ZWcgJgo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfihNQ0lfU1RNMzJfVlNX
SVRDSEVOIHwgTUNJX1NUTTMyX1ZTV0lUQ0gpKTsKPj4gKyAgICAgICB9Cj4gCj4gRG9uJ3QgeW91
IG5lZWQgdG8gbWFuYWdlIHRoaW5ncyB3aGVuIHJlc2V0dGluZyB0bwo+IE1NQ19TSUdOQUxfVk9M
VEFHRV8zMzAsIHdoaWNoIGZvciBleGFtcGxlIGhhcHBlbnMgZHVyaW5nIGEgY2FyZAo+IHJlbW92
YWwgb3IgYXQgc3lzdGVtIHN1c3BlbmQvcmVzdW1lPwo+IAoKVGhlIFZTV0lUQ0ggc2VxdWVuY2Ug
aXMgdXNlZCBvbmx5IGZvciAzLjNWIHRvIDEuOFYuCklmIHRoZXJlIGFyZTogY2FyZCByZW1vdmUg
fCBzdXNwZW5kL3Jlc3VtZS4KVGhlIHBvd2VyIGN5Y2xlIG9mIHNkbW1jIG11c3QgYmUgcmVpbml0
aWFsaXNlZAphbmQgdGhlIHJlc2V0IGlzIG1hbmRhdG9yeS4KCj4+ICsKPj4gKyAgICAgICByZXR1
cm4gcmV0Owo+PiArfQo+PiArCj4+ICAgc3RhdGljIHN0cnVjdCBtbWNpX2hvc3Rfb3BzIHNkbW1j
X3ZhcmlhbnRfb3BzID0gewo+PiAgICAgICAgICAudmFsaWRhdGVfZGF0YSA9IHNkbW1jX2lkbWFf
dmFsaWRhdGVfZGF0YSwKPj4gICAgICAgICAgLnByZXBfZGF0YSA9IHNkbW1jX2lkbWFfcHJlcF9k
YXRhLAo+PiBAQCAtNDY1LDYgKzUwMSw4IEBAIHN0YXRpYyBzdHJ1Y3QgbW1jaV9ob3N0X29wcyBz
ZG1tY192YXJpYW50X29wcyA9IHsKPj4gICAgICAgICAgLnNldF9jbGtyZWcgPSBtbWNpX3NkbW1j
X3NldF9jbGtyZWcsCj4+ICAgICAgICAgIC5zZXRfcHdycmVnID0gbW1jaV9zZG1tY19zZXRfcHdy
cmVnLAo+PiAgICAgICAgICAuYnVzeV9jb21wbGV0ZSA9IHNkbW1jX2J1c3lfY29tcGxldGUsCj4+
ICsgICAgICAgLnByZXBfdm9sdF9zd2l0Y2ggPSBzZG1tY19wcmVwX3Zzd2l0Y2gsCj4+ICsgICAg
ICAgLnZvbHRfc3dpdGNoID0gc2RtbWNfdnN3aXRjaCwKPj4gICB9Owo+Pgo+PiAgIHZvaWQgc2Rt
bWNfdmFyaWFudF9pbml0KHN0cnVjdCBtbWNpX2hvc3QgKmhvc3QpCj4+IC0tCj4+IDIuMTcuMQo+
Pgo+IAo+IEtpbmQgcmVnYXJkcwo+IFVmZmUKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
