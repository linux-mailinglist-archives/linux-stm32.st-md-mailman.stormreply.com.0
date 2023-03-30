Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BE86D0782
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Mar 2023 16:01:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA570C69069;
	Thu, 30 Mar 2023 14:01:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48521C64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Mar 2023 14:01:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFE5F12FC;
 Thu, 30 Mar 2023 07:01:53 -0700 (PDT)
Received: from [10.57.54.53] (unknown [10.57.54.53])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A35533F663;
 Thu, 30 Mar 2023 07:01:07 -0700 (PDT)
Message-ID: <bd5bbc22-4e5e-df1c-fcd1-bef0e55b6db8@arm.com>
Date: Thu, 30 Mar 2023 15:01:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: James Clark <james.clark@arm.com>, coresight@lists.linaro.org,
 quic_jinlmao@quicinc.com, mike.leach@linaro.org
References: <20230329115329.2747724-1-james.clark@arm.com>
 <20230329115329.2747724-7-james.clark@arm.com>
 <d398a5c4-90f1-e717-fb73-d621f5ea845b@arm.com>
In-Reply-To: <d398a5c4-90f1-e717-fb73-d621f5ea845b@arm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Leo Yan <leo.yan@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 06/13] coresight: Fix loss of
 connection info when a module is unloaded
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

T24gMzAvMDMvMjAyMyAxMzo0MiwgU3V6dWtpIEsgUG91bG9zZSB3cm90ZToKPiBIaSBKYW1lcwo+
IAo+IE9uIDI5LzAzLzIwMjMgMTI6NTMsIEphbWVzIENsYXJrIHdyb3RlOgo+PiBjaGlsZF9md25v
ZGUgc2hvdWxkIGJlIGEgcmVhZCBvbmx5IHByb3BlcnR5IGJhc2VkIG9uIHRoZSBEVC4gSWYgaXQn
cwo+PiBjbGVhcmVkIG9uIHRoZSBwYXJlbnQgZGV2aWNlIHdoZW4gYSBjaGlsZCBpcyB1bmxvYWRl
ZCwgdGhlbiB3aGVuIHRoZQo+PiBjaGlsZCBpcyBsb2FkZWQgYWdhaW4gdGhlIGNvbm5lY3Rpb24g
d29uJ3QgYmUgcmVtYWRlLgo+Pgo+PiBjaGlsZF9kZXYgc2hvdWxkIGJlIGNsZWFyZWQgaW5zdGVh
ZCB3aGljaCBzaWduaWZpZXMgdGhhdCB0aGUgY29ubmVjdGlvbgo+PiBzaG91bGQgYmUgcmVtYWRl
IHdoZW4gdGhlIGNoaWxkX2Z3bm9kZSByZWdpc3RlcnMgYSBuZXcgY29yZXNpZ2h0X2RldmljZS4K
Pj4KPj4gU2ltaWxhcmx5IHRoZSByZWZlcmVuY2UgY291bnQgc2hvdWxkbid0IGJlIGRlY3JlbWVu
dGVkIGFzIGxvbmcgYXMgdGhlCj4+IHBhcmVudCBkZXZpY2UgZXhpc3RzLiBUaGUgY29ycmVjdCBw
bGFjZSB0byBkcm9wIHRoZSByZWZlcmVuY2UgaXMgaW4KPj4gY29yZXNpZ2h0X3JlbGVhc2VfcGxh
dGZvcm1fZGF0YSgpIHdoaWNoIGlzIGFscmVhZHkgZG9uZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
SmFtZXMgQ2xhcmsgPGphbWVzLmNsYXJrQGFybS5jb20+Cj4gCj4gVGhpcyBsb29rcyBsaWtlIGEg
YnVnIGluIHRoZSBleGlzdGluZyBkcml2ZXIuIFBsZWFzZSBjb3VsZCB5b3Uga2VlcCB0aGlzCj4g
YXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgc2VyaWVzLCBzbyB0aGF0IGl0IGlzIGVhc2llciB0byBi
YWNrcG9ydCBmb3IKPiBzdGFibGUgPwo+IAo+IEFsc28sIHBsZWFzZSBhZGQgOgo+IAo+IEZpeGVz
OiAzN2VhMWZmZGRmZmEgKCJjb3Jlc2lnaHQ6IFVzZSBmd25vZGUgaGFuZGxlIGluc3RlYWQgb2Yg
ZGV2aWNlIAo+IG5hbWVzIikKPiBGaXhlczogMmFmODllYmFjZjI5ICgiY29yZXNpZ2h0OiBDbGVh
ciB0aGUgY29ubmVjdGlvbiBmaWVsZCBwcm9wZXJseSIpCj4gCj4gCj4+IC0tLQo+PiDCoCBkcml2
ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWNvcmUuYyB8IDEwICsrLS0tLS0tLS0K
Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY29y
ZS5jIAo+PiBiL2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY29yZS5jCj4+
IGluZGV4IGJmZTFiOTNhY2E0ZS4uMTJjYmI2OGU4ZTFjIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJz
L2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWNvcmUuYwo+PiArKysgYi9kcml2ZXJzL2h3
dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWNvcmUuYwo+PiBAQCAtMTQxNCwxMyArMTQxNCw4
IEBAIHN0YXRpYyBpbnQgY29yZXNpZ2h0X3JlbW92ZV9tYXRjaChzdHJ1Y3QgZGV2aWNlIAo+PiAq
ZGV2LCB2b2lkICpkYXRhKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGNzZGV2LT5kZXYuZndu
b2RlID09IGNvbm4tPmRlc3RfZndub2RlKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGl0ZXJhdG9yLT5vcnBoYW4gPSB0cnVlOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
b3Jlc2lnaHRfcmVtb3ZlX2xpbmtzKGl0ZXJhdG9yLCBjb25uKTsKPj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgLyoKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIERyb3AgdGhlIHJlZmVy
ZW5jZSB0byB0aGUgaGFuZGxlIGZvciB0aGUgcmVtb3RlCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgKiBkZXZpY2UgYWNxdWlyZWQgaW4gcGFyc2luZyB0aGUgY29ubmVjdGlvbnMgZnJvbQo+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogcGxhdGZvcm0gZGF0YS4KPj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAqLwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmd25vZGVfaGFu
ZGxlX3B1dChjb25uLT5kZXN0X2Z3bm9kZSk7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNv
bm4tPmRlc3RfZndub2RlID0gTlVMTDsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
b25uLT5kZXN0X2RldiA9IE5VTEw7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIE5v
IG5lZWQgdG8gY29udGludWUgKi8KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+IEBAIC0xNTUzLDcgKzE1NDgsNiBAQCB2b2lkIGNv
cmVzaWdodF9yZWxlYXNlX3BsYXRmb3JtX2RhdGEoc3RydWN0IAo+PiBjb3Jlc2lnaHRfZGV2aWNl
ICpjc2RldiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBpcyBnb2luZyBhd2F5Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgICovCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBmd25vZGVfaGFuZGxlX3B1
dChjb25uc1tpXS5kZXN0X2Z3bm9kZSk7Cj4+IC3CoMKgwqDCoMKgwqDCoCBwZGF0YS0+b3V0X2Nv
bm5zW2ldLmRlc3RfZndub2RlID0gTlVMTDsKPiAKPiBUaGlzIGNoYW5nZSBpcyBub3QgcmVxdWly
ZWQsIGFzIHdlIGFyZSBmcmVlaW5nIHRoZSBwZGF0YSBhbnl3YXkuCj4gS2VlcGluZyB0aGlzIG1p
Z2h0IGJlIGJlbmVmaWNpYWwgaWYgc29tZW9uZSBlbHNlIGNvbWVzIGxvb2tpbmcKPiBmb3IgcmVm
ZXJlbmNlcyB3aGlsZSB3ZSBhcmUgZ29pbmcgb3V0LiBJIGRvbid0IHNlZSBob3cgd2UgY291bGQK
PiBoaXQgdGhhdCwgYnV0IGp1c3QgdG8gYmUgc2FmZS4KCkZvciByZWZlcmVuY2UsIEkgY291bGQg
cmVwcm9kdWNlIHRoZSBwcm9ibGVtIGJ5IDoKCk9uIGp1bm8sIGxvYWQgYWxsIGNvcmVzaWdodCBt
b2R1bGVzLgoKJCBjZCAvc3lzL2J1cy9jb3Jlc2lnaHQvZGV2aWNlcy8KJCBlY2hvIDEgPiB0bWNf
ZXRyMC9lbmFibGVfc2luawokIGVjaG8gMSA+IGV0bTAvZW5hYmxlX3NvdXJjZQoKV29ya3MgZmlu
ZSBeCgokIGVjaG8gMCA+IGV0bTAvZW5hYmxlX3NvdXJjZQokIHJtbW9kIGNvcmVzaWdodC1mdW5u
ZWwKJCBtb2Rwcm9iZSBjb3Jlc2lnaHQtZnVubmVsCiQgZWNobyAxID4gZXRtMC9lbmFibGVfc291
cmNlCi1iYXNoOiBlY2hvOiB3cml0ZSBlcnJvcjogSW52YWxpZCBhcmd1bWVudAoKU3V6dWtpCgo+
IAo+IFN1enVraQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
