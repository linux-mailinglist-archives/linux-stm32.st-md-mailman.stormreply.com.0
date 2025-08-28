Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 546DCB3AA9B
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Aug 2025 21:09:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95E70C3F95F;
	Thu, 28 Aug 2025 19:09:46 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31FFEC3F95E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Aug 2025 19:09:45 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SHMa4r004299;
 Thu, 28 Aug 2025 21:09:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 DLM5AUfns2hb2my8bJBgZg9LR+O4etaj8IVbPYQY7Rc=; b=RhFTCNalC7NV3IWu
 xQpiT6P0FVLKeJXQW9GiLN0GG7LUh43kdqmlK4HiSLD9Ae0g/UkOuYn4cJ1KfzjX
 tJKXsbZtvrENSZV839CiopyHlwa3oekKuRBQYKlN+u+Kjik9ozXO08L97ESHwP+N
 4Q81SSH3sn7Aksh95UvJhGhPY0TVjHiuf2nAuONNPigFPhasS1vMFR/0HSX5cLLp
 SIQkooY9sAOgWTHTkkct52TZ25OLklFDZauAL8wZ0+xrOEzCktEHHidqR5XSLkZd
 dTXpT/3vXdRw4wJNFWHGFvaxDYglybIxKSZT87+JNZQ2UBMV2LL8OEC2oa1M1OZa
 svWbAw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48qrkmuggq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Aug 2025 21:09:17 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1ADA04002D;
 Thu, 28 Aug 2025 21:07:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9DE2276BE64;
 Thu, 28 Aug 2025 21:06:37 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 21:06:35 +0200
Message-ID: <0fbf4be0-af6e-4119-a838-e3fc9ab1fc9d@foss.st.com>
Date: Thu, 28 Aug 2025 21:06:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20250828172253.GA949714@bhelgaas>
From: Christian Bruel <christian.bruel@foss.st.com>
Content-Language: en-US
In-Reply-To: <20250828172253.GA949714@bhelgaas>
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
Cc: linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, lpieralisi@kernel.org,
 quic_schintav@quicinc.com, linux-stm32@st-md-mailman.stormreply.com,
 kwilczynski@kernel.org, namcao@linutronix.de, robh@kernel.org, corbet@lwn.net,
 linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org,
 mayank.rana@oss.qualcomm.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, mani@kernel.org, qiang.yu@oss.qualcomm.com,
 linux-gpio@vger.kernel.org, bhelgaas@google.com, johan+linaro@kernel.org,
 shradha.t@samsung.com, thippeswamy.havalige@amd.com, inochiama@gmail.com,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, krzk+dt@kernel.org
Subject: Re: [Linux-stm32] [PATCH v13 06/11] PCI: stm32: Add PCIe Endpoint
 support for STM32MP25
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

CgpPbiA4LzI4LzI1IDE5OjIyLCBCam9ybiBIZWxnYWFzIHdyb3RlOgo+IE9uIFdlZCwgQXVnIDIw
LCAyMDI1IGF0IDA5OjU0OjA2QU0gKzAyMDAsIENocmlzdGlhbiBCcnVlbCB3cm90ZToKPj4gQWRk
IGRyaXZlciB0byBjb25maWd1cmUgdGhlIFNUTTMyTVAyNSBTb0MgUENJZSBHZW4xIDIuNUdUL3Mg
b3IgR2VuMiA1R1Qvcwo+PiBjb250cm9sbGVyIGJhc2VkIG9uIHRoZSBEZXNpZ25XYXJlIFBDSWUg
Y29yZSBpbiBlbmRwb2ludCBtb2RlLgo+PiAuLi4KPiAKPj4gK3N0YXRpYyBpbnQgc3RtMzJfcGNp
ZV9zdGFydF9saW5rKHN0cnVjdCBkd19wY2llICpwY2kpCj4+ICt7Cj4+ICsJc3RydWN0IHN0bTMy
X3BjaWUgKnN0bTMyX3BjaWUgPSB0b19zdG0zMl9wY2llKHBjaSk7Cj4+ICsJaW50IHJldDsKPj4g
Kwo+PiArCWlmIChzdG0zMl9wY2llLT5saW5rX3N0YXR1cyA9PSBTVE0zMl9QQ0lFX0VQX0xJTktf
RU5BQkxFRCkgewo+PiArCQlkZXZfZGJnKHBjaS0+ZGV2LCAiTGluayBpcyBhbHJlYWR5IGVuYWJs
ZWRcbiIpOwo+PiArCQlyZXR1cm4gMDsKPj4gKwl9Cj4gCj4gV2hpbGUgbG9va2luZyBhdCB0aGUg
ImluY29ycmVjdGx5IHJlc2V0IiBjb21tZW50LCBJIG5vdGljZWQKPiBzdG0zMl9wY2llLT5saW5r
X3N0YXR1cyBhbmQgd29uZGVyZWQgd2h5IGl0IGV4aXN0cy4gIEl0IGxvb2tzIGxpa2UKPiBpdCdz
IG9ubHkgdXNlZCBpbiBzdG0zMl9wY2llX3N0YXJ0X2xpbmsoKSBhbmQgc3RtMzJfcGNpZV9zdG9w
X2xpbmsoKSwKPiBhbmQgSSBkb24ndCBzZWUgc2ltaWxhciB0cmFja2luZyBpbiBvdGhlciBkcml2
ZXJzLgo+IAo+IEl0IGZlZWxzIGEgbGl0dGxlIHJhY3kgYmVjYXVzZSB0aGUgbGluayBtaWdodCBn
byBkb3duIGZvciByZWFzb25zCj4gb3RoZXIgdGhhbiBjYWxsaW5nIHN0bTMyX3BjaWVfc3RvcF9s
aW5rKCkuCgpJIHRoaW5rIHRoYXQgYXMgYW4gZXhjZXNzIG9mIHBhcmFub2lkIHRoYXQgd2FzIG1l
YW50IHRvIHByb3RlY3QgYWdhaW5zdCAKYSBkcml2ZXIgdW5iaW5kIHdoZW4gdGhlIGxpbmsgaGFz
buKAmXQgc3RhcnRlZCB5ZXQuIEluIHRoYXQgY2FzZSwgCnN0bTMyX3BjaWVfcmVtb3ZlKCkgd291
bGQgZGlzYWJsZSBhIGxpbmsgdGhhdOKAmXMgYWxyZWFkeSBkaXNhYmxlZC4KCkJ1dCB0aGF0IHNo
b3VsZG7igJl0IGJlIGEgcHJvYmxlbSB0byBkaXNhYmxlIHR3aWNlIHRoZSBsdHNzbSBlbmFibGUg
Yml0LCAKYXMgd2VsbCBhcyB0aGUgcGVyc3QgaXJxLiBJ4oCZbGwgbG9vayBpbnRvIHJlbW92aW5n
IGl0LiBJcyBpdCBva2F5IGlmIEkgZG8gCnRoaXMgd2l0aCBhIGZpeHVwIHBhdGNoPwoKdGhhbmsg
eW91CkNocmlzdGlhbgoKCj4gCj4+ICsJZGV2X2RiZyhwY2ktPmRldiwgIkVuYWJsZSBsaW5rXG4i
KTsKPj4gKwo+PiArCXJldCA9IHN0bTMyX3BjaWVfZW5hYmxlX2xpbmsocGNpKTsKPj4gKwlpZiAo
cmV0KSB7Cj4+ICsJCWRldl9lcnIocGNpLT5kZXYsICJQQ0llIGNhbm5vdCBlc3RhYmxpc2ggbGlu
azogJWRcbiIsIHJldCk7Cj4+ICsJCXJldHVybiByZXQ7Cj4+ICsJfQo+PiArCj4+ICsJZW5hYmxl
X2lycShzdG0zMl9wY2llLT5wZXJzdF9pcnEpOwo+PiArCj4+ICsJc3RtMzJfcGNpZS0+bGlua19z
dGF0dXMgPSBTVE0zMl9QQ0lFX0VQX0xJTktfRU5BQkxFRDsKPj4gKwo+PiArCXJldHVybiAwOwo+
PiArfQo+PiArCj4+ICtzdGF0aWMgdm9pZCBzdG0zMl9wY2llX3N0b3BfbGluayhzdHJ1Y3QgZHdf
cGNpZSAqcGNpKQo+PiArewo+PiArCXN0cnVjdCBzdG0zMl9wY2llICpzdG0zMl9wY2llID0gdG9f
c3RtMzJfcGNpZShwY2kpOwo+PiArCj4+ICsJaWYgKHN0bTMyX3BjaWUtPmxpbmtfc3RhdHVzID09
IFNUTTMyX1BDSUVfRVBfTElOS19ESVNBQkxFRCkgewo+PiArCQlkZXZfZGJnKHBjaS0+ZGV2LCAi
TGluayBpcyBhbHJlYWR5IGRpc2FibGVkXG4iKTsKPj4gKwkJcmV0dXJuOwo+PiArCX0KPj4gKwo+
PiArCWRldl9kYmcocGNpLT5kZXYsICJEaXNhYmxlIGxpbmtcbiIpOwo+PiArCj4+ICsJZGlzYWJs
ZV9pcnEoc3RtMzJfcGNpZS0+cGVyc3RfaXJxKTsKPj4gKwo+PiArCXN0bTMyX3BjaWVfZGlzYWJs
ZV9saW5rKHBjaSk7Cj4+ICsKPj4gKwlzdG0zMl9wY2llLT5saW5rX3N0YXR1cyA9IFNUTTMyX1BD
SUVfRVBfTElOS19ESVNBQkxFRDsKPj4gK30KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
