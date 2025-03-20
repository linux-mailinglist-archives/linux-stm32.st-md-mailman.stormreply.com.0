Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 953A6A6A2CE
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Mar 2025 10:40:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B503C78F64;
	Thu, 20 Mar 2025 09:40:04 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 160A1C78F60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Mar 2025 09:40:02 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K8rIOx025746;
 Thu, 20 Mar 2025 10:39:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 20q7a2xxFrdIQirIJS+Dwfid39JttP9IZBfIWTznNdo=; b=LPBc6CieKwit8O/y
 R3I9ufssXRDSwEOS8S1oSZIoTBa/vOxiHu/7kvnSsCb3eL1j3cKvMGUgaARi+qax
 fHD8FRlKwg2uBhkv2kScO/nn9NUdqecxDxqQHNwVOe39yTNW1fmiReyhmGHIKnlJ
 Y5x58LHPPPVTs9RmcMKue/MLSsWzyI14JbRnmGWHcJhVx0KO7nN0a8dvNeyGkGQO
 l7m5+Bgwgv87wT947Bwd9+X7F61gKGAyJLEIUIhv8OMjdM/DsQj1ucYqu0n+LDMg
 wbKtdfRZSw2ijUtvVJ4t22eOU6fstQIyQpQXtLRe2fWdGeDzsWiEOYjb7u3UN6xl
 bSvh2g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45fuc8mxdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Mar 2025 10:39:45 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2C44140059;
 Thu, 20 Mar 2025 10:38:20 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5EAF07CB7B1;
 Thu, 20 Mar 2025 10:37:15 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Mar
 2025 10:37:15 +0100
Received: from [10.252.18.22] (10.252.18.22) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Mar
 2025 10:37:14 +0100
Message-ID: <05adb008-c4f0-4003-aef4-6ce6dbbfd392@foss.st.com>
Date: Thu, 20 Mar 2025 10:37:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
To: Rob Herring <robh@kernel.org>
References: <20250317232426.952188-1-robh@kernel.org>
 <20250317232426.952188-4-robh@kernel.org>
 <26e72cb2-c355-4c40-bb98-fc0ff267bf4f@foss.st.com>
 <CAL_Jsq+7ZhMWgbFDvPB+3BG7YfiS9PweybOGNY3r=d40RbGHJA@mail.gmail.com>
 <130d61a8-6f03-46dc-94ca-f098bc09babc@foss.st.com>
Content-Language: en-US
Organization: STMicroelectronics
In-Reply-To: <130d61a8-6f03-46dc-94ca-f098bc09babc@foss.st.com>
X-Originating-IP: [10.252.18.22]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-19_01,2024-11-22_01
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
 Sascha Hauer <s.hauer@pengutronix.de>, Saravana Kannan <saravanak@google.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/3] remoteproc: Use
 of_reserved_mem_region_* functions for "memory-region"
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiAzLzIwLzI1IDEwOjIxLCBBcm5hdWQgUE9VTElRVUVOIHdyb3RlOgo+IAo+IAo+IE9uIDMv
MjAvMjUgMDA6MDQsIFJvYiBIZXJyaW5nIHdyb3RlOgo+PiBPbiBXZWQsIE1hciAxOSwgMjAyNSBh
dCAxMDoyNuKAr0FNIEFybmF1ZCBQT1VMSVFVRU4KPj4gPGFybmF1ZC5wb3VsaXF1ZW5AZm9zcy5z
dC5jb20+IHdyb3RlOgo+Pj4KPj4+IEhlbGxvIFJvYiwKPj4+Cj4+PiBPbiAzLzE4LzI1IDAwOjI0
LCBSb2IgSGVycmluZyAoQXJtKSB3cm90ZToKPj4+PiBVc2UgdGhlIG5ld2x5IGFkZGVkIG9mX3Jl
c2VydmVkX21lbV9yZWdpb25fdG9fcmVzb3VyY2UoKSBhbmQKPj4+PiBvZl9yZXNlcnZlZF9tZW1f
cmVnaW9uX2NvdW50KCkgZnVuY3Rpb25zIHRvIGhhbmRsZSAibWVtb3J5LXJlZ2lvbiIKPj4+PiBw
cm9wZXJ0aWVzLgo+Pj4+Cj4+Pj4gVGhlIGVycm9yIGhhbmRsaW5nIGlzIGEgYml0IGRpZmZlcmVu
dCBpbiBzb21lIGNhc2VzLiBPZnRlbgo+Pj4+ICJtZW1vcnktcmVnaW9uIiBpcyBvcHRpb25hbCwg
c28gZmFpbGVkIGxvb2t1cCBpcyBub3QgYW4gZXJyb3IuIEJ1dCB0aGVuCj4+Pj4gYW4gZXJyb3Ig
aW4gb2ZfcmVzZXJ2ZWRfbWVtX2xvb2t1cCgpIGlzIHRyZWF0ZWQgYXMgYW4gZXJyb3IuIEhvd2V2
ZXIsCj4+Pj4gdGhhdCBkaXN0aW5jdGlvbiBpcyBub3QgcmVhbGx5IGltcG9ydGFudC4gRWl0aGVy
IHRoZSByZWdpb24gaXMgYXZhaWxhYmxlCj4+Pj4gYW5kIHVzYWJsZSBvciBpdCBpcyBub3QuIFNv
IG5vdywgaXQgaXMganVzdAo+Pj4+IG9mX3Jlc2VydmVkX21lbV9yZWdpb25fdG9fcmVzb3VyY2Uo
KSB3aGljaCBpcyBjaGVja2VkIGZvciBhbiBlcnJvci4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6
IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+Cj4+Pj4gLS0tCj4+Pj4gRm9yIHY2
LjE2Cj4+Pj4KPj4KPj4gWy4uLl0KPj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZW1vdGVw
cm9jL3N0bTMyX3Jwcm9jLmMgYi9kcml2ZXJzL3JlbW90ZXByb2Mvc3RtMzJfcnByb2MuYwo+Pj4+
IGluZGV4IGIwMmIzNmEzZjUxNS4uOWQyYmQ4OTA0YzQ5IDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZl
cnMvcmVtb3RlcHJvYy9zdG0zMl9ycHJvYy5jCj4+Pj4gKysrIGIvZHJpdmVycy9yZW1vdGVwcm9j
L3N0bTMyX3Jwcm9jLmMKPj4+PiBAQCAtMjEzLDUyICsyMTMsNDYgQEAgc3RhdGljIGludCBzdG0z
Ml9ycHJvY19wcmVwYXJlKHN0cnVjdCBycHJvYyAqcnByb2MpCj4+Pj4gIHsKPj4+PiAgICAgICBz
dHJ1Y3QgZGV2aWNlICpkZXYgPSBycHJvYy0+ZGV2LnBhcmVudDsKPj4+PiAgICAgICBzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5wID0gZGV2LT5vZl9ub2RlOwo+Pj4+IC0gICAgIHN0cnVjdCBvZl9waGFu
ZGxlX2l0ZXJhdG9yIGl0Owo+Pj4+ICAgICAgIHN0cnVjdCBycHJvY19tZW1fZW50cnkgKm1lbTsK
Pj4+PiAtICAgICBzdHJ1Y3QgcmVzZXJ2ZWRfbWVtICpybWVtOwo+Pj4+ICAgICAgIHU2NCBkYTsK
Pj4+PiAtICAgICBpbnQgaW5kZXggPSAwOwo+Pj4+ICsgICAgIGludCBpbmRleCA9IDAsIG1yID0g
MDsKPj4+Pgo+Pj4+ICAgICAgIC8qIFJlZ2lzdGVyIGFzc29jaWF0ZWQgcmVzZXJ2ZWQgbWVtb3J5
IHJlZ2lvbnMgKi8KPj4+PiAtICAgICBvZl9waGFuZGxlX2l0ZXJhdG9yX2luaXQoJml0LCBucCwg
Im1lbW9yeS1yZWdpb24iLCBOVUxMLCAwKTsKPj4+PiAtICAgICB3aGlsZSAob2ZfcGhhbmRsZV9p
dGVyYXRvcl9uZXh0KCZpdCkgPT0gMCkgewo+Pj4+IC0gICAgICAgICAgICAgcm1lbSA9IG9mX3Jl
c2VydmVkX21lbV9sb29rdXAoaXQubm9kZSk7Cj4+Pj4gLSAgICAgICAgICAgICBpZiAoIXJtZW0p
IHsKPj4+PiAtICAgICAgICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQoaXQubm9kZSk7Cj4+Pj4g
LSAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAidW5hYmxlIHRvIGFjcXVpcmUgbWVt
b3J5LXJlZ2lvblxuIik7Cj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
Owo+Pj4+IC0gICAgICAgICAgICAgfQo+Pj4+ICsgICAgIHdoaWxlICgxKSB7Cj4+Pj4gKyAgICAg
ICAgICAgICBzdHJ1Y3QgcmVzb3VyY2UgcmVzOwo+Pj4+ICsgICAgICAgICAgICAgaW50IHJldDsK
Pj4+PiArCj4+Pj4gKyAgICAgICAgICAgICByZXQgPSBvZl9yZXNlcnZlZF9tZW1fcmVnaW9uX3Rv
X3Jlc291cmNlKG5wLCBtcisrLCAmcmVzKTsKPj4+PiArICAgICAgICAgICAgIGlmIChyZXQpCj4+
Pj4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiAwOwo+Pj4+Cj4+Pj4gLSAgICAgICAgICAg
ICBpZiAoc3RtMzJfcnByb2NfcGFfdG9fZGEocnByb2MsIHJtZW0tPmJhc2UsICZkYSkgPCAwKSB7
Cj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgIG9mX25vZGVfcHV0KGl0Lm5vZGUpOwo+Pj4+IC0g
ICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIm1lbW9yeSByZWdpb24gbm90IHZhbGlk
ICVwYVxuIiwKPj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmcm1lbS0+YmFzZSk7
Cj4+Pj4gKyAgICAgICAgICAgICBpZiAoc3RtMzJfcnByb2NfcGFfdG9fZGEocnByb2MsIHJlcy5z
dGFydCwgJmRhKSA8IDApIHsKPj4+PiArICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYs
ICJtZW1vcnkgcmVnaW9uIG5vdCB2YWxpZCAlcFJcbiIsICZyZXMpOwo+Pj4+ICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+PiAgICAgICAgICAgICAgIH0KPj4+Pgo+Pj4+
ICAgICAgICAgICAgICAgLyogIE5vIG5lZWQgdG8gbWFwIHZkZXYgYnVmZmVyICovCj4+Pj4gLSAg
ICAgICAgICAgICBpZiAoc3RyY21wKGl0Lm5vZGUtPm5hbWUsICJ2ZGV2MGJ1ZmZlciIpKSB7Cj4+
Pj4gKyAgICAgICAgICAgICBpZiAoc3RyY21wKHJlcy5uYW1lLCAidmRldjBidWZmZXIiKSkgewo+
Pj4KPj4+IEkgdGVzdGVkIHlvdXIgcGF0Y2hlcwo+Pgo+PiBUaGFuayB5b3UuCj4+Cj4+PiBUaGUg
dXBkYXRlIGludHJvZHVjZXMgYSByZWdyZXNzaW9uIGhlcmUuIFRoZSBzdHJjbXAgZnVuY3Rpb24g
bmV2ZXIgcmV0dXJucyAwLgo+Pj4gSW5kZWVkLCBpdC5ub2RlLT5uYW1lIHN0b3JlcyB0aGUgbWVt
b3J5IHJlZ2lvbiBsYWJlbCAidmRldjBidWZmZXIsIiB3aGlsZQo+Pj4gcmVzLm5hbWUgc3RvcmVz
IHRoZSBtZW1vcnkgcmVnaW9uIG5hbWUgInZkZXYwYnVmZmVyQDEwMDQyMDAwLiIKPj4+Cj4+PiBT
ZXZlcmFsIHJlbW90ZXByb2MgZHJpdmVycyBtYXkgZmFjZSB0aGUgc2FtZSBpc3N1ZSBhcyB0aGV5
IGVtYmVkIHNpbWlsYXIgY29kZS4KPj4KPj4gSW5kZWVkLiBJIGNvbmZ1c2VkIG15c2VsZiBiZWNh
dXNlIG5vZGUgJ25hbWUnIGlzIHdpdGhvdXQgdGhlCj4+IHVuaXQtYWRkcmVzcywgYnV0IHRoaXMg
aXMgdXNpbmcgdGhlIGZ1bGwgbmFtZS4gSSd2ZSByZXBsYWNlZCB0aGUKPj4gc3RyY21wJ3Mgd2l0
aCBzdHJzdGFydHMoKSB0byBhZGRyZXNzIHRoaXMuIEkndmUgdXBkYXRlZCBteSBicmFuY2ggd2l0
aAo+PiB0aGUgY2hhbmdlcy4KPiAKPiBUaGlzIGlzIG5vdCBlbm91Z2ggYXMgdGhlIHJlbW90ZXBy
b2MgY29yZSBmdW5jdGlvbiBycHJvY19maW5kX2NhcnZlb3V0X2J5X25hbWUoKQo+IGFsc28gY29t
cGFyZXMgdGhlIG1lbW9yeSBuYW1lcy4gV2l0aCB0aGUgZm9sbG93aW5nIGFkZGl0aW9uYWwgZml4
LCBpdCBpcyB3b3JraW5nCj4gb24gbXkgU1RNMzJNUDE1LURLIGJvYXJkLgo+IAo+IEBAIC0zMDks
MTEgKzMwOSwxMSBAQCBycHJvY19maW5kX2NhcnZlb3V0X2J5X25hbWUoc3RydWN0IHJwcm9jICpy
cHJvYywgY29uc3QKPiBjaGFyICpuYW1lLCAuLi4pCj4gIAl2c25wcmludGYoX25hbWUsIHNpemVv
ZihfbmFtZSksIG5hbWUsIGFyZ3MpOwo+ICAJdmFfZW5kKGFyZ3MpOwo+IAo+ICAJbGlzdF9mb3Jf
ZWFjaF9lbnRyeShjYXJ2ZW91dCwgJnJwcm9jLT5jYXJ2ZW91dHMsIG5vZGUpIHsKPiAgCQkvKiBD
b21wYXJlIGNhcnZlb3V0IGFuZCByZXF1ZXN0ZWQgbmFtZXMgKi8KPiAtCQlpZiAoIXN0cmNtcChj
YXJ2ZW91dC0+bmFtZSwgX25hbWUpKSB7Cj4gKwkJaWYgKHN0cnN0YXJ0cyhjYXJ2ZW91dC0+bmFt
ZSwgX25hbWUpKSB7Cj4gIAkJCW1lbSA9IGNhcnZlb3V0Owo+ICAJCQlicmVhazsKPiAgCQl9Cj4g
IAl9Cj4gCj4gSSBqdXN0IHdvbmRlciBpZiB3b3VsZCBub3QgYmUgbW9yZSBzdWl0YWJsZSB0byBh
ZGRyZXNzIHRoaXMgdXNpbmcgdGhlCj4gIm1lbW9yeS1yZWdpb24tbmFtZXMiIGZpZWxkLgo+IAo+
IFRoZSBkcmF3YmFjayBpcyB0aGF0IHdlIHdvdWxkIGJyZWFrIGNvbXBhdGliaWxpdHkgd2l0aCBs
ZWdhY3kgYm9hcmRzLi4uCgpFcnJhdGE6ClRoZSBkcmF3YmFjayBpcyB0aGF0IHdlIHdvdWxkIGJy
ZWFrIGNvbXBhdGliaWxpdHkgd2l0aCBsZWdhY3kgRFRzLi4uCgo+IAo+IEkgbGV0IE1hdGhpZXUg
YW5kIEJqb3JuIHJldmlldyBhbmQgY29tbWVudAo+IAo+IAo+IEVsc2Ugd2l0aCB0aGUgZml4IGlu
IHJwcm9jX2ZpbmRfY2FydmVvdXRfYnlfbmFtZSgpLAo+IAo+IC1mb3IgdGhlIHN0bTMyX3Jwcm9j
Ogo+IHJldmlld2VkLWJ5OiBBcm5hdWQgUG91bGlxdWVuIDxhcm5hdWQucG91bGlxdWVuQGZvc3Mu
c3QuY29tPgo+IHRlc3RlZC1ieTogQXJuYXVkIFBvdWxpcXVlbiA8YXJuYXVkLnBvdWxpcXVlbkBm
b3NzLnN0LmNvbT4KPiAKPiAtIGZvciB0aGUgc3RfcmVtb3RlcHJvYwo+IHJldmlld2VkLWJ5OiBB
cm5hdWQgUG91bGlxdWVuIDxhcm5hdWQucG91bGlxdWVuQGZvc3Muc3QuY29tPgo+IAo+IFRoYW5r
cywKPiBBcm5hdWQKPiAKPiAKPj4KPj4gUm9iCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKPiBMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4gaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
