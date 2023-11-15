Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 419EF7EBEFB
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Nov 2023 10:02:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB7D8C6B47B;
	Wed, 15 Nov 2023 09:02:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50A17C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Nov 2023 09:02:42 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AF60kvO030368; Wed, 15 Nov 2023 10:02:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=jTZBldcCzRDJ/o8lXUBW/3C7mfzdAv5i1O3ggFoUvFI=; b=tL
 5FgaC0lzWW6JxZeMpzYkqXEhUG34Ha88Wb/2Y3+e2cfcP3Gr5Tfwmz3yoDL/HOkV
 YVf+fdPOy2AoWaz7MkjOcUiNh+zCIc4FZPyxB5fdIvcDts5xWizMds12VxxJFVMm
 n5pBUOaBp062FpyH+9G7ewIsVj5qHyVC4T55rncpInU5waK6KaIZlMRzeYECJSYJ
 dGYTUxB3R85KAEJGfzk1OxavZltJ6+zrxaiZ2bkmc4etB2sICpyO4VeC0ic6x+Rh
 uHts/PP2oNzqRpBY4ykWdubF8qVLFyGuj+oyT7GUin69ATaWKv5+e7t4cQ8hQv4f
 S1uAGjg5nv8Z9/oKiL9g==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ua1u1yr32-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Nov 2023 10:02:23 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 456FC100053;
 Wed, 15 Nov 2023 10:02:22 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3BA6521B536;
 Wed, 15 Nov 2023 10:02:22 +0100 (CET)
Received: from [10.201.20.59] (10.201.20.59) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 15 Nov
 2023 10:02:21 +0100
Message-ID: <e7034e83-7c1a-4706-8382-536b260284eb@foss.st.com>
Date: Wed, 15 Nov 2023 10:02:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
References: <20231019200658.1754190-7-u.kleine-koenig@pengutronix.de>
 <20231019200658.1754190-12-u.kleine-koenig@pengutronix.de>
 <c2da3f60-595c-4938-809a-c5640388c13c@foss.st.com>
 <20231114212009.44r742f3xqosswod@pengutronix.de>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20231114212009.44r742f3xqosswod@pengutronix.de>
X-Originating-IP: [10.201.20.59]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_07,2023-11-14_01,2023-05-22_02
Cc: linux-pwm@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 5/5] pwm: stm32: Fix enable count for clk
	in .probe()
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

T24gMTEvMTQvMjMgMjI6MjAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IE9uIFR1ZSwgTm92
IDE0LCAyMDIzIGF0IDAyOjM1OjE5UE0gKzAxMDAsIEZhYnJpY2UgR2FzbmllciB3cm90ZToKPj4g
T24gMTAvMTkvMjMgMjI6MDcsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+Pj4gRnJvbTogUGhp
bGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPj4+Cj4+PiBNYWtlIHRoZSBkcml2
ZXIgdGFrZSBvdmVyIGhhcmR3YXJlIHN0YXRlIHdpdGhvdXQgZGlzYWJsaW5nIGluIC5wcm9iZSgp
Cj4+PiBhbmQgZW5hYmxlIHRoZSBjbG9jayBmb3IgZWFjaCBlbmFibGVkIGNoYW5uZWwuCj4+Pgo+
Pj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4K
Pj4+IFt1a2xlaW5lazogc3BsaXQgb2ZmIGZyb20gYSBwYXRjaCB0aGF0IGFsc28gaW1wbGVtZW50
ZWQgLmdldF9zdGF0ZSgpXQo+Pj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUu
a2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KPj4+IC0tLQo+Pj4gIGRyaXZlcnMvcHdtL3B3
bS1zdG0zMi5jIHwgMTggKysrKysrKysrKysrKystLS0tCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDE0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Cj4+Cj4+IEhpIFV3ZSwKPj4KPj4gSSdk
IG9ubHkgaGF2ZSBhIHN1Z2dlc3Rpb24gb24gdGhlIGNvbW1pdCB0aXRsZToKPj4gcHdtOiBzdG0z
MjogRml4IGVuYWJsZSBjb3VudCBmb3IgY2xrIGluIC5wcm9iZSgpCj4+ICAgICAgICAgICAgIF4K
Pj4gT24gZmlyc3Qgc2lnaHQsIHRoZSAiRml4IiBtYXkgc3VnZ2VzdCB0aGF0IHRoaXMgZml4ZXMg
c29tZXRoaW5nIG9sZGVyIGluCj4+IHRoZSB0cmVlLiBUaGlzIHdvdWxkIHN1Z2dlc3QgYSBGaXhl
cyB0YWcgd2hpY2ggaXNuJ3QgdGhlIGNhc2UgaW4gdGhpcwo+PiBzZXJpZXMsIGFzIHRoaXMgaXMg
YSBzcGxpdCBvZiB0aGUgLmdldF9zdGF0ZSgpIHBhdGNoLgo+PiBJcyBpdCBwb3NzaWJsZSB0byBy
ZXBocmFzZSA/Cj4gCj4gSU1ITyBpdCBpcyBhIGZpeCwgdGhlIGh3IHN0YXRlIHdhc24ndCBwcm9w
ZXJseSB0YWtlbiBvdmVyIGJlZm9yZS4KCkhpIFV3ZSwKCkluZGVlZCwgdGhlIEhXIHN0YXRlIHdh
c24ndCB0YWtlbi4gSW5zdGVhZCB0aGUgZHJpdmVyIHVzZWQgdG8gYmUKZm9yY2libHkgc3RvcCBl
YWNoIGNoYW5uZWw6IHJlZ21hcF9jbGVhcl9iaXRzKHByaXYtPnJlZ21hcCwgVElNX0NDRVIsClRJ
TV9DQ0VSX0NDWEUpOwpTbyB0aGUgY2xrIGVuYWJsZSBjb3VudCAob2YgMCkgcmVmbGVjdHMgdGhp
cy4gVGhhdCdzIGtpbmQgb2YgY29uc2lzdGVudApzdGF0ZS4KCj4gSWYgeW91IHdhbnQgYSBGaXhl
cyBsaW5lLCB0aGF0J3M6Cj4gCj4gRml4ZXM6IDdlZGY3MzY5MjA1YiAoInB3bTogQWRkIGRyaXZl
ciBmb3IgU1RNMzIgcGxhZnRvcm0iKQoKV2VsbCwgdGhlIG9yaWdpbmFsIGRyaXZlciBkaWRuJ3Qg
aW1wbGVtZW50IHRoZSAuZ2V0X3N0YXRlLgpCVVQsIG1vcmUgdGhpbmtpbmcgYWJvdXQgdGhpcywg
SSB0aGluayBpdCBsYWNrcyB0byByZWFkIHRoZSBnbG9iYWwKZW5hYmxlIHN0YXR1cyBvZiB0aGUg
dGltZXIsIGUuZy4gVElNX0NSMV9DRU4uCgpPcmlnaW5hbCBkcml2ZXIgc3RvcHMgZWFjaCBjaGFu
bmVsIChjbGVhciBDQ1hFKSwgYnV0IGFmdGVyIHByb2JpbmcsIHRoZQpnbG9iYWwgVElNX0NSMV9D
RU4gYml0IG1heSByZW1haW5zIDEgKGZyb20gYm9vdGxvYWRlciksIHdpdGhvdXQgYQpydW5uaW5n
IGNsb2NrLgoKSWYgd2UncmUgdGFsa2luZyBhYm91dCBmaXhpbmcgdGhlIG9yaWdpbmFsIGRyaXZl
ciAocHJvYmFibHkgdW5yZWxldmFudAp3aXRob3V0IGEgd29ya2luZyAuZ2V0X3N0YXRlKSwgdGhl
biBJIHRoaW5rIHRoaXMgcGFydCBpcyBtaXNzaW5nLgoKKHdpdGggb3Igd2l0aG91dCBhIEZpeGVz
IHRhZykgQ291bGQgeW91IGFkZCBhIGNoZWNrIG9uIGdsb2JhbCBjb3VudGVyCmVuYWJsZSBiaXQg
KFRJTV9DUjFfQ0VOKSBib3RoIGluIHRoZSAuZ2V0X3N0YXRlKCksIGFuZCBpbiB0aGUKc3RtMzJf
cHdtX2RldGVjdF9jaGFubmVscygpLCB0aGF0IGNvdW50cyB0aGUgbnVtX2VuYWJsZWQgY2hhbm5l
bHMgPwoKSW4gY2FzZSB0aGUgVElNX0NSMV9DRU4gaXNuJ3Qgc2V0IChidXQgc29tZSBvZiB0aGUg
VElNX0NDRVJfQ0NYRSBhcmUpLAp0aGUgZHJpdmVyIHdpbGwgcmVwb3J0IGVuYWJsZWQgY2hhbm5l
bHMuIEJ1dCBwaHlzaWNhbGx5LCB0aGUgcHdtIG91dHB1dAp3aWxsIGJlIGluYWN0aXZlLgpUaGF0
J3MgbW9yZSBhIHJvYnVzdG5lc3MgY2FzZS4uLiBkZXBlbmRpbmcgb24gd2hhdCdzIGJlZW4gZG9u
ZSBwb3NzaWJseQpieSBib290bG9hZGVyLiBXaGF0IHRvIHlvdSB0aGluayA/Cgo+IAo+PiBzb21l
dGhpbmcgbGlrZTogc2V0IGNsayBlbmFibGUgY291bnQgd2hlbiBwcm9iaW5nIGNoYW5uZWxzID8K
Pj4KPj4gQXBhcnQgZnJvbSB0aGF0LCB5b3UgY2FuIGFkZCBteToKPj4gUmV2aWV3ZWQtYnk6IEZh
YnJpY2UgR2FzbmllciA8ZmFicmljZS5nYXNuaWVyQGZvc3Muc3QuY29tPgo+Pgo+PiAtLS0KPj4g
SSd2ZSBhZGRpdGlvbmFsIHF1ZXN0aW9ucywgdW5yZWxhdGVkIHRvIHRoaXMgcGF0Y2guIEkgaGFk
IGEgbG9vayBhdAo+PiBwd20tc3RtMzItbHAuYywgdGhlIGNsb2NrIGVuYWJsaW5nIGlzIGRvbmUg
ZGlyZWN0bHkgaW4gdGhlIC5nZXRfc3RhdGUoKQo+PiByb3V0aW5lLiBJIHRoaW5rIHRoaXMgc2hv
dWxkIGJlIG1vdmVkIHRvIHRoZSAucHJvYmUoKSByb3V0aW5lIGFzIGRvbmUKPj4gaGVyZS4gVGhl
cmUncyBsaWtlbHkgYSByaXNrLCB0aGF0IGNsayBlbmFibGUgY291bnQgZ2V0cyBpbmNyZWFzZWQK
Pj4gYXJ0aWZpY2lhbGx5LCBhdCBsZWFzdCBzaW5jZSBjb21taXQgY2ZjNGMxODliYzcwICJwd206
IFJlYWQgaW5pdGlhbAo+PiBoYXJkd2FyZSBzdGF0ZSBhdCByZXF1ZXN0IHRpbWUiLgo+PiBTaGFs
bCBJIHNlbmQgYSBwYXRjaCBmb3IgcHdtLXN0bTMyLWxwLmMsIHNpbWlsYXIgYXMgdGhpcyBwYXRj
aCA/IE9yIGhhcwo+PiBpdCBiZWVuIHNwb3R0ZWQgYWxyZWFkeSA/Cj4gCj4gSSdtIG5vdCBhd2Fy
ZSBvZiBzb21lb25lIHdvcmtpbmcgb24gc3RtMzItbHAsIHNvIGZlZWwgZnJlZSB0byBwcmVwYXJl
IGEKPiBwYXRjaCEKCk9rIHRoYW5rcyEgV2lsbCBsb29rIGludG8gaXQuCkJlc3QgUmVnYXJkcywK
RmFicmljZQoKPiAKPiBCZXN0IHJlZ2FyZHMgYW5kIHRoYW5rcyBmb3IgeW91ciByZXZpZXcsCj4g
VXdlCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
