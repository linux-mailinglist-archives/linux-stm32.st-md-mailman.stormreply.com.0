Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 847A1A6A278
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Mar 2025 10:24:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39814C78F64;
	Thu, 20 Mar 2025 09:24:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69CB6C78F62
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Mar 2025 09:24:02 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K9HKHq023149;
 Thu, 20 Mar 2025 10:23:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 crexQWu4l57R3sbdMnceBIPuj5iuismgQR90iwJhOlw=; b=SAdDYbMG9niyLueX
 EmzCVR2UEw3l/kOQ0MwvxKZXvC+VsrRFslJFtNFw82j4ojfMLQ7c/92hs5wpdQZb
 4pJLqvivmJP1npces5+rUxcaO0ZP3VD7BMgzU3HKp7ROvOQKo3UhrvVAfger3DYR
 MG4YNVl28gSKPE6+LEulzoavrtjdTEz9mK/8Xpw48mBVW8GV8FKYTRiUbYxeNa85
 aS+uag6Ka/MqzZ/37uKVx+RJDvG+1NW9JzBYrDDai9hCSaHR8ixkozxXbtNJmNXv
 a1O013eA5hu5sFUBAG+IpUImoCNXg5hKNSAnPQLtGsak+EYIMDBetGbOgE+tP5m6
 uCZcUw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45d1u84m7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Mar 2025 10:23:39 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BAD0D4005D;
 Thu, 20 Mar 2025 10:22:13 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CEE927C1EF4;
 Thu, 20 Mar 2025 10:21:28 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Mar
 2025 10:21:28 +0100
Received: from [10.252.18.22] (10.252.18.22) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Mar
 2025 10:21:27 +0100
Message-ID: <130d61a8-6f03-46dc-94ca-f098bc09babc@foss.st.com>
Date: Thu, 20 Mar 2025 10:21:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20250317232426.952188-1-robh@kernel.org>
 <20250317232426.952188-4-robh@kernel.org>
 <26e72cb2-c355-4c40-bb98-fc0ff267bf4f@foss.st.com>
 <CAL_Jsq+7ZhMWgbFDvPB+3BG7YfiS9PweybOGNY3r=d40RbGHJA@mail.gmail.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <CAL_Jsq+7ZhMWgbFDvPB+3BG7YfiS9PweybOGNY3r=d40RbGHJA@mail.gmail.com>
X-Originating-IP: [10.252.18.22]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-19_01,2024-11-22_01
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, imx@lists.linux.dev,
 Saravana Kannan <saravanak@google.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org
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

CgpPbiAzLzIwLzI1IDAwOjA0LCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBXZWQsIE1hciAxOSwg
MjAyNSBhdCAxMDoyNuKAr0FNIEFybmF1ZCBQT1VMSVFVRU4KPiA8YXJuYXVkLnBvdWxpcXVlbkBm
b3NzLnN0LmNvbT4gd3JvdGU6Cj4+Cj4+IEhlbGxvIFJvYiwKPj4KPj4gT24gMy8xOC8yNSAwMDoy
NCwgUm9iIEhlcnJpbmcgKEFybSkgd3JvdGU6Cj4+PiBVc2UgdGhlIG5ld2x5IGFkZGVkIG9mX3Jl
c2VydmVkX21lbV9yZWdpb25fdG9fcmVzb3VyY2UoKSBhbmQKPj4+IG9mX3Jlc2VydmVkX21lbV9y
ZWdpb25fY291bnQoKSBmdW5jdGlvbnMgdG8gaGFuZGxlICJtZW1vcnktcmVnaW9uIgo+Pj4gcHJv
cGVydGllcy4KPj4+Cj4+PiBUaGUgZXJyb3IgaGFuZGxpbmcgaXMgYSBiaXQgZGlmZmVyZW50IGlu
IHNvbWUgY2FzZXMuIE9mdGVuCj4+PiAibWVtb3J5LXJlZ2lvbiIgaXMgb3B0aW9uYWwsIHNvIGZh
aWxlZCBsb29rdXAgaXMgbm90IGFuIGVycm9yLiBCdXQgdGhlbgo+Pj4gYW4gZXJyb3IgaW4gb2Zf
cmVzZXJ2ZWRfbWVtX2xvb2t1cCgpIGlzIHRyZWF0ZWQgYXMgYW4gZXJyb3IuIEhvd2V2ZXIsCj4+
PiB0aGF0IGRpc3RpbmN0aW9uIGlzIG5vdCByZWFsbHkgaW1wb3J0YW50LiBFaXRoZXIgdGhlIHJl
Z2lvbiBpcyBhdmFpbGFibGUKPj4+IGFuZCB1c2FibGUgb3IgaXQgaXMgbm90LiBTbyBub3csIGl0
IGlzIGp1c3QKPj4+IG9mX3Jlc2VydmVkX21lbV9yZWdpb25fdG9fcmVzb3VyY2UoKSB3aGljaCBp
cyBjaGVja2VkIGZvciBhbiBlcnJvci4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmlu
ZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPgo+Pj4gLS0tCj4+PiBGb3IgdjYuMTYKPj4+Cj4gCj4g
Wy4uLl0KPiAKPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3JlbW90ZXByb2Mvc3RtMzJfcnByb2Mu
YyBiL2RyaXZlcnMvcmVtb3RlcHJvYy9zdG0zMl9ycHJvYy5jCj4+PiBpbmRleCBiMDJiMzZhM2Y1
MTUuLjlkMmJkODkwNGM0OSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvcmVtb3RlcHJvYy9zdG0z
Ml9ycHJvYy5jCj4+PiArKysgYi9kcml2ZXJzL3JlbW90ZXByb2Mvc3RtMzJfcnByb2MuYwo+Pj4g
QEAgLTIxMyw1MiArMjEzLDQ2IEBAIHN0YXRpYyBpbnQgc3RtMzJfcnByb2NfcHJlcGFyZShzdHJ1
Y3QgcnByb2MgKnJwcm9jKQo+Pj4gIHsKPj4+ICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9IHJw
cm9jLT5kZXYucGFyZW50Owo+Pj4gICAgICAgc3RydWN0IGRldmljZV9ub2RlICpucCA9IGRldi0+
b2Zfbm9kZTsKPj4+IC0gICAgIHN0cnVjdCBvZl9waGFuZGxlX2l0ZXJhdG9yIGl0Owo+Pj4gICAg
ICAgc3RydWN0IHJwcm9jX21lbV9lbnRyeSAqbWVtOwo+Pj4gLSAgICAgc3RydWN0IHJlc2VydmVk
X21lbSAqcm1lbTsKPj4+ICAgICAgIHU2NCBkYTsKPj4+IC0gICAgIGludCBpbmRleCA9IDA7Cj4+
PiArICAgICBpbnQgaW5kZXggPSAwLCBtciA9IDA7Cj4+Pgo+Pj4gICAgICAgLyogUmVnaXN0ZXIg
YXNzb2NpYXRlZCByZXNlcnZlZCBtZW1vcnkgcmVnaW9ucyAqLwo+Pj4gLSAgICAgb2ZfcGhhbmRs
ZV9pdGVyYXRvcl9pbml0KCZpdCwgbnAsICJtZW1vcnktcmVnaW9uIiwgTlVMTCwgMCk7Cj4+PiAt
ICAgICB3aGlsZSAob2ZfcGhhbmRsZV9pdGVyYXRvcl9uZXh0KCZpdCkgPT0gMCkgewo+Pj4gLSAg
ICAgICAgICAgICBybWVtID0gb2ZfcmVzZXJ2ZWRfbWVtX2xvb2t1cChpdC5ub2RlKTsKPj4+IC0g
ICAgICAgICAgICAgaWYgKCFybWVtKSB7Cj4+PiAtICAgICAgICAgICAgICAgICAgICAgb2Zfbm9k
ZV9wdXQoaXQubm9kZSk7Cj4+PiAtICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJ1
bmFibGUgdG8gYWNxdWlyZSBtZW1vcnktcmVnaW9uXG4iKTsKPj4+IC0gICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVJTlZBTDsKPj4+IC0gICAgICAgICAgICAgfQo+Pj4gKyAgICAgd2hpbGUg
KDEpIHsKPj4+ICsgICAgICAgICAgICAgc3RydWN0IHJlc291cmNlIHJlczsKPj4+ICsgICAgICAg
ICAgICAgaW50IHJldDsKPj4+ICsKPj4+ICsgICAgICAgICAgICAgcmV0ID0gb2ZfcmVzZXJ2ZWRf
bWVtX3JlZ2lvbl90b19yZXNvdXJjZShucCwgbXIrKywgJnJlcyk7Cj4+PiArICAgICAgICAgICAg
IGlmIChyZXQpCj4+PiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4+Pgo+Pj4gLSAg
ICAgICAgICAgICBpZiAoc3RtMzJfcnByb2NfcGFfdG9fZGEocnByb2MsIHJtZW0tPmJhc2UsICZk
YSkgPCAwKSB7Cj4+PiAtICAgICAgICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQoaXQubm9kZSk7
Cj4+PiAtICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJtZW1vcnkgcmVnaW9uIG5v
dCB2YWxpZCAlcGFcbiIsCj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmcm1lbS0+
YmFzZSk7Cj4+PiArICAgICAgICAgICAgIGlmIChzdG0zMl9ycHJvY19wYV90b19kYShycHJvYywg
cmVzLnN0YXJ0LCAmZGEpIDwgMCkgewo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIo
ZGV2LCAibWVtb3J5IHJlZ2lvbiBub3QgdmFsaWQgJXBSXG4iLCAmcmVzKTsKPj4+ICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+ICAgICAgICAgICAgICAgfQo+Pj4KPj4+
ICAgICAgICAgICAgICAgLyogIE5vIG5lZWQgdG8gbWFwIHZkZXYgYnVmZmVyICovCj4+PiAtICAg
ICAgICAgICAgIGlmIChzdHJjbXAoaXQubm9kZS0+bmFtZSwgInZkZXYwYnVmZmVyIikpIHsKPj4+
ICsgICAgICAgICAgICAgaWYgKHN0cmNtcChyZXMubmFtZSwgInZkZXYwYnVmZmVyIikpIHsKPj4K
Pj4gSSB0ZXN0ZWQgeW91ciBwYXRjaGVzCj4gCj4gVGhhbmsgeW91Lgo+IAo+PiBUaGUgdXBkYXRl
IGludHJvZHVjZXMgYSByZWdyZXNzaW9uIGhlcmUuIFRoZSBzdHJjbXAgZnVuY3Rpb24gbmV2ZXIg
cmV0dXJucyAwLgo+PiBJbmRlZWQsIGl0Lm5vZGUtPm5hbWUgc3RvcmVzIHRoZSBtZW1vcnkgcmVn
aW9uIGxhYmVsICJ2ZGV2MGJ1ZmZlciwiIHdoaWxlCj4+IHJlcy5uYW1lIHN0b3JlcyB0aGUgbWVt
b3J5IHJlZ2lvbiBuYW1lICJ2ZGV2MGJ1ZmZlckAxMDA0MjAwMC4iCj4+Cj4+IFNldmVyYWwgcmVt
b3RlcHJvYyBkcml2ZXJzIG1heSBmYWNlIHRoZSBzYW1lIGlzc3VlIGFzIHRoZXkgZW1iZWQgc2lt
aWxhciBjb2RlLgo+IAo+IEluZGVlZC4gSSBjb25mdXNlZCBteXNlbGYgYmVjYXVzZSBub2RlICdu
YW1lJyBpcyB3aXRob3V0IHRoZQo+IHVuaXQtYWRkcmVzcywgYnV0IHRoaXMgaXMgdXNpbmcgdGhl
IGZ1bGwgbmFtZS4gSSd2ZSByZXBsYWNlZCB0aGUKPiBzdHJjbXAncyB3aXRoIHN0cnN0YXJ0cygp
IHRvIGFkZHJlc3MgdGhpcy4gSSd2ZSB1cGRhdGVkIG15IGJyYW5jaCB3aXRoCj4gdGhlIGNoYW5n
ZXMuCgpUaGlzIGlzIG5vdCBlbm91Z2ggYXMgdGhlIHJlbW90ZXByb2MgY29yZSBmdW5jdGlvbiBy
cHJvY19maW5kX2NhcnZlb3V0X2J5X25hbWUoKQphbHNvIGNvbXBhcmVzIHRoZSBtZW1vcnkgbmFt
ZXMuIFdpdGggdGhlIGZvbGxvd2luZyBhZGRpdGlvbmFsIGZpeCwgaXQgaXMgd29ya2luZwpvbiBt
eSBTVE0zMk1QMTUtREsgYm9hcmQuCgpAQCAtMzA5LDExICszMDksMTEgQEAgcnByb2NfZmluZF9j
YXJ2ZW91dF9ieV9uYW1lKHN0cnVjdCBycHJvYyAqcnByb2MsIGNvbnN0CmNoYXIgKm5hbWUsIC4u
LikKIAl2c25wcmludGYoX25hbWUsIHNpemVvZihfbmFtZSksIG5hbWUsIGFyZ3MpOwogCXZhX2Vu
ZChhcmdzKTsKCiAJbGlzdF9mb3JfZWFjaF9lbnRyeShjYXJ2ZW91dCwgJnJwcm9jLT5jYXJ2ZW91
dHMsIG5vZGUpIHsKIAkJLyogQ29tcGFyZSBjYXJ2ZW91dCBhbmQgcmVxdWVzdGVkIG5hbWVzICov
Ci0JCWlmICghc3RyY21wKGNhcnZlb3V0LT5uYW1lLCBfbmFtZSkpIHsKKwkJaWYgKHN0cnN0YXJ0
cyhjYXJ2ZW91dC0+bmFtZSwgX25hbWUpKSB7CiAJCQltZW0gPSBjYXJ2ZW91dDsKIAkJCWJyZWFr
OwogCQl9CiAJfQoKSSBqdXN0IHdvbmRlciBpZiB3b3VsZCBub3QgYmUgbW9yZSBzdWl0YWJsZSB0
byBhZGRyZXNzIHRoaXMgdXNpbmcgdGhlCiJtZW1vcnktcmVnaW9uLW5hbWVzIiBmaWVsZC4KClRo
ZSBkcmF3YmFjayBpcyB0aGF0IHdlIHdvdWxkIGJyZWFrIGNvbXBhdGliaWxpdHkgd2l0aCBsZWdh
Y3kgYm9hcmRzLi4uCgpJIGxldCBNYXRoaWV1IGFuZCBCam9ybiByZXZpZXcgYW5kIGNvbW1lbnQK
CgpFbHNlIHdpdGggdGhlIGZpeCBpbiBycHJvY19maW5kX2NhcnZlb3V0X2J5X25hbWUoKSwKCi1m
b3IgdGhlIHN0bTMyX3Jwcm9jOgpyZXZpZXdlZC1ieTogQXJuYXVkIFBvdWxpcXVlbiA8YXJuYXVk
LnBvdWxpcXVlbkBmb3NzLnN0LmNvbT4KdGVzdGVkLWJ5OiBBcm5hdWQgUG91bGlxdWVuIDxhcm5h
dWQucG91bGlxdWVuQGZvc3Muc3QuY29tPgoKLSBmb3IgdGhlIHN0X3JlbW90ZXByb2MKcmV2aWV3
ZWQtYnk6IEFybmF1ZCBQb3VsaXF1ZW4gPGFybmF1ZC5wb3VsaXF1ZW5AZm9zcy5zdC5jb20+CgpU
aGFua3MsCkFybmF1ZAoKCj4gCj4gUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
