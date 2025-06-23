Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7D6AE47C3
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jun 2025 17:03:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CED5BC36B2F;
	Mon, 23 Jun 2025 15:03:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38D73C36B2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jun 2025 15:03:24 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NAXGFF012023;
 Mon, 23 Jun 2025 17:03:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 +4Z6/tJa/UFNSN1pd77M3FYDzdgkVF+SixPAfedgsPY=; b=Nu6QCp8ytKHhSXKA
 QL5YZ8y8711G6aSBEZyto43QPpTPyx+hWUCox4qJzIbducnaI0nxBMq3KpnvYlKT
 WrmOYkT3BDOx/68i8YhPBfX97yfqlnOgBnXrbgo/tDClwz0hMj6YBKxnkfNbN6X3
 Dx61mJ+Uj0AT2Wh+QCz23oaHxPEHb7lmpdNGxbdFfQyCnRcGAy17DlsgVN+SqLH9
 OydUyEnwZTSc+doNJAd+xQzPeMk4YnO4xfzOr8f6ut8gkiuyFo4KwQg5Vo7tFBYc
 Oc0zfIxreugZ/MBmOEet/60dUCbp+m8Hf6vMJhqN0D4pKwQiND5vMgqTpuLAdLlk
 14lVdQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dkmjg0su-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jun 2025 17:03:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5E55540046;
 Mon, 23 Jun 2025 17:01:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C67EB4D1DE;
 Mon, 23 Jun 2025 17:00:04 +0200 (CEST)
Received: from [10.252.18.29] (10.252.18.29) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 17:00:03 +0200
Message-ID: <cd7cac7f-e78f-4457-9e42-6290632d9c1c@foss.st.com>
Date: Mon, 23 Jun 2025 17:00:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Gatien Chevallier
 <gatien.chevallier@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>
References: <20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com>
 <20250623-ddrperfm-upstream-v1-5-7dffff168090@foss.st.com>
 <868b20f0-c1ff-4cd7-91bc-e73069aafa95@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <868b20f0-c1ff-4cd7-91bc-e73069aafa95@kernel.org>
X-Originating-IP: [10.252.18.29]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 05/13] dt-bindings: perf: stm32: introduce
 DDRPERFM dt-bindings
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

T24gNi8yMy8yNSAxMTo0OCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAyMy8wNi8y
MDI1IDExOjI3LCBDbMOpbWVudCBMZSBHb2ZmaWMgd3JvdGU6Cj4+IEREUlBFUkZNIGlzIHRoZSBE
RFIgUGVyZm9ybWFuY2UgTW9uaXRvciBlbWJlZGRlZCBpbiBTVE0zMk1QVSBTb0MuCj4+IEl0IGFs
bG93cyB0byBtb25pdG9yIEREUiBldmVudHMgdGhhdCBjb21lIGZyb20gdGhlIEREUiBDb250cm9s
bGVyCj4+IHN1Y2ggYXMgcmVhZCBvciB3cml0ZSBldmVudHMuCj4+Cj4gCj4gQSBuaXQsIHN1Ympl
Y3Q6IGRyb3Agc2Vjb25kL2xhc3QsIHJlZHVuZGFudCAiYmluZGluZ3MiLiBUaGUKPiAiZHQtYmlu
ZGluZ3MiIHByZWZpeCBpcyBhbHJlYWR5IHN0YXRpbmcgdGhhdCB0aGVzZSBhcmUgYmluZGluZ3Mu
Cj4gU2VlIGFsc286Cj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuNy1yYzgv
c291cmNlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zdWJtaXR0aW5nLXBhdGNo
ZXMucnN0I0wxOApPb3BzLCB5b3UncmUgcmlnaHQgdGhhbmsgeW91Cgo+PiBTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Cj4+IC0t
LQo+PiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlcmYvc3Qsc3RtMzItZGRyLXBtdS55YW1s
IHwgOTMgKysrKysrKysrKysrKysrKysrKysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA5MyBpbnNl
cnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGVyZi9zdCxzdG0zMi1kZHItcG11LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGVyZi9zdCxzdG0zMi1kZHItcG11LnlhbWwKPj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi4zNWQzNDc4Mjg2NWIKPj4gLS0tIC9kZXYvbnVs
bAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGVyZi9zdCxzdG0z
Mi1kZHItcG11LnlhbWwKPj4gQEAgLTAsMCArMSw5MyBAQAo+PiArIyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4+ICslWUFNTCAxLjIKPj4g
Ky0tLQo+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9wZXJmL3N0LHN0bTMy
LWRkci1wbXUueWFtbCMKPj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNj
aGVtYXMvY29yZS55YW1sIwo+PiArCj4+ICttYWludGFpbmVyczoKPj4gKyAgLSBDbMOpbWVudCBM
ZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Cj4+ICsKPj4gK3RpdGxlOiBT
VE1pY3JvZWxlY3Ryb25pY3MgU1RNMzIgRERSIFBlcmZvcm1hbmNlIE1vbml0b3IgKEREUlBFUkZN
KQo+PiArCj4+ICtwcm9wZXJ0aWVzOgo+PiArICBjb21wYXRpYmxlOgo+PiArICAgIGVudW06Cj4+
ICsgICAgICAtIHN0LHN0bTMybXAxMzEtZGRyLXBtdQo+PiArICAgICAgLSBzdCxzdG0zMm1wMTUx
LWRkci1wbXUKPiAKPiBUaGVzZSBhcmUgY29tcGF0aWJsZSwgYXJlbid0IHRoZXk/CgpZZXMgdGhl
eSBhcmUKCj4+ICsgICAgICAtIHN0LHN0bTMybXAyNTEtZGRyLXBtdQo+PiArCj4+ICsgIHJlZzoK
Pj4gKyAgICBtYXhJdGVtczogMQo+PiArCj4+ICsgIGNsb2NrczoKPj4gKyAgICBkZXNjcmlwdGlv
bjogUmVmZXJlbmNlIGNsb2NrIGZvciB0aGUgRERSIFBlcmZvcm1hbmNlIE1vbml0b3IKPiAKPiBE
cm9wIGRlc2NyaXB0aW9uLCBvYnZpb3VzLgoKT2sKCj4gCj4+ICsgICAgbWF4SXRlbXM6IDEKPj4g
Kwo+PiArICByZXNldHM6Cj4+ICsgICAgZGVzY3JpcHRpb246IFJlc2V0IGNvbnRyb2wgZm9yIHRo
ZSBERFIgUGVyZm9ybWFuY2UgTW9uaXRvcgo+IAo+IERyb3AgZGVzY3JpcHRpb24sIG9idmlvdXMu
CgpPawoKPiAKPiAKPj4gKyAgICBtYXhJdGVtczogMQo+PiArCj4+ICsgIGFjY2Vzcy1jb250cm9s
bGVyczoKPj4gKyAgICBtaW5JdGVtczogMQo+PiArICAgIG1heEl0ZW1zOiAyCj4+ICsKPj4gKyAg
c3QsZHJhbS10eXBlOgo+PiArICAgIGRlc2NyaXB0aW9uOiB8Cj4+ICsgICAgICBUaGlzIHByb3Bl
cnR5IGlzIHVzZWQgdG8gc3BlY2lmeSB0aGUgdHlwZSBvZiBEUkFNIG1lbW9yeSBjb25uZWN0ZWQg
dG8gdGhlCj4+ICsgICAgICBhc3NvY2lhdGVkIG1lbW9yeSBjb250cm9sbGVyLiBJdCBpcyByZXF1
aXJlZCBmb3IgdGhlIEREUiBQZXJmb3JtYW5jZSBNb25pdG9yCj4+ICsgICAgICB0byBjb3JyZWN0
bHkgaW50ZXJwcmV0IHRoZSBwZXJmb3JtYW5jZSBkYXRhLgo+PiArICAgICAgMCA9IExQRERSNCwK
Pj4gKyAgICAgIDEgPSBMUEREUjMsCj4+ICsgICAgICAyID0gRERSNCwKPj4gKyAgICAgIDMgPSBE
RFIzCj4+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMy
Cj4gCj4gTm8sIHVzZSBzdGFuZGFyZCBKRURFQyBtZW1vcnkgYmluZGluZ3MgKG1lbW9yeSBjb250
cm9sbGVycykgaWYgeW91IG5lZWQKPiB0byBkZXNjcmliZSB0aGUgbWVtb3J5LCBvdGhlcndpc2Ug
eW91IGR1cGxpY2F0ZSB0aGF0IGJpbmRpbmcgYW5kCj4gZHVwbGljYXRlIHRoZSBtZW1vcnkgaW5m
b3JtYXRpb24uCgpPayBkaWRuJ3Qga25vdyBhYm91dCBpdCwgSSdsbCB0YWtlIGEgbG9vawoKQmVz
dCByZWdhcmQsCkNsw6ltZW50Cgo+PiArICAgIGVudW06IFswLCAxLCAyLCAzXQo+PiArCj4+ICty
ZXF1aXJlZDoKPj4gKyAgLSBjb21wYXRpYmxlCj4+ICsgIC0gcmVnCj4+ICsKPj4gK2FsbE9mOgo+
PiArICAtIGlmOgo+PiArICAgICAgcHJvcGVydGllczoKPj4gKyAgICAgICAgY29tcGF0aWJsZToK
Pj4gKyAgICAgICAgICBjb250YWluczoKPj4gKyAgICAgICAgICAgIGVudW06Cj4+ICsgICAgICAg
ICAgICAgIC0gc3Qsc3RtMzJtcDEzMS1kZHItcG11Cj4+ICsgICAgICAgICAgICAgIC0gc3Qsc3Rt
MzJtcDE1MS1kZHItcG11Cj4+ICsgICAgdGhlbjoKPj4gKyAgICAgIHJlcXVpcmVkOgo+PiArICAg
ICAgICAtIGNsb2Nrcwo+PiArICAgICAgICAtIHJlc2V0cwo+PiArCj4+ICsgIC0gaWY6Cj4+ICsg
ICAgICBwcm9wZXJ0aWVzOgo+PiArICAgICAgICBjb21wYXRpYmxlOgo+PiArICAgICAgICAgIGNv
bnRhaW5zOgo+PiArICAgICAgICAgICAgY29uc3Q6IHN0LHN0bTMybXAyNTEtZGRyLXBtdQo+PiAr
ICAgIHRoZW46Cj4+ICsgICAgICByZXF1aXJlZDoKPj4gKyAgICAgICAgLSBhY2Nlc3MtY29udHJv
bGxlcnMKPj4gKyAgICAgICAgLSBzdCxkcmFtLXR5cGUKPj4gKwo+PiArYWRkaXRpb25hbFByb3Bl
cnRpZXM6IGZhbHNlCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
