Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B4FB0D367
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jul 2025 09:38:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4678EC3F93B;
	Tue, 22 Jul 2025 07:38:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F06EC3F93A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 07:38:10 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7YcI1017113;
 Tue, 22 Jul 2025 09:37:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 0zlU1QEnD+GWl8jLtn5YK4PZ5fpcfWzBw9uHGSBFh90=; b=6eOnM2juSbRcr0EU
 IFyVZkojXeQ6Q+YR1EBl3sKBCrityklC8iGDAreH+nVxIlQpGGJ1de2LWFwc4l+l
 GHdzI1aEcjrUG02EEdibktt04EsuROdoHalxZc6A/VFGiV2d32zsW/LP3ZkEoX8L
 ed7/sijJ7vkE5DhE2qQgYCwZk7ehjOBdHFYiVBGxRKng/BGeMgMSFprH5ze62kZr
 rdI9euM21E3mDHLQTqM0HE2BU2fY7b1L1YSL/0CRLPYRX5Nqjz+RIPRaUovQk6Au
 arroznHHnk0RY1lQ6URTxAejKDuzunNFX2iACfiTmpBsv3BZltL9HBZqRv3WTZUo
 DVCk5Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 480mx4hq09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jul 2025 09:37:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 571CB4005B;
 Tue, 22 Jul 2025 09:36:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1132476DC2F;
 Tue, 22 Jul 2025 09:35:09 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 09:35:07 +0200
Message-ID: <ed0efd83-8471-4fce-9745-54d85d6268f9@foss.st.com>
Date: Tue, 22 Jul 2025 09:35:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
 <20250711-ddrperfm-upstream-v2-5-cdece720348f@foss.st.com>
 <20250721200926.GA1179079-robh@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250721200926.GA1179079-robh@kernel.org>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-doc@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-perf-users@vger.kernel.org, Le Goffic <legoffic.clement@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 05/16] dt-bindings: memory: add jedec,
 ddr[3-4]-channel binding
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

SGkgUm9iLAoKT24gNy8yMS8yNSAyMjowOSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gRnJpLCBK
dWwgMTEsIDIwMjUgYXQgMDQ6NDg6NTdQTSArMDIwMCwgQ2zDqW1lbnQgTGUgR29mZmljIHdyb3Rl
Ogo+PiBJbnRyb2R1Y2UgYXMgcGVyIGplZGVjLGxwZGRyWC1jaGFubmVsIGJpbmRpbmcsIGpkZWMs
ZGRyWzMtNF0tY2hhbm5lbAo+PiBiaW5kaW5nLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVu
dCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Cj4+IC0tLQo+PiAgIC4u
Li9tZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLGRkci1jaGFubmVsLnlhbWwgIHwgNTMgKysr
KysrKysrKysrKysrKysrKysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCsp
Cj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVt
b3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxkZHItY2hhbm5lbC55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMsZGRyLWNo
YW5uZWwueWFtbAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAu
LjMxZGFhMjJiY2Q0YQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLGRkci1jaGFubmVs
LnlhbWwKPj4gQEAgLTAsMCArMSw1MyBAQAo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
KEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4+ICslWUFNTCAxLjIKPj4gKy0tLQo+PiAr
JGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZW1vcnktY29udHJvbGxlcnMvZGRy
L2plZGVjLGRkci1jaGFubmVsLnlhbWwjCj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPj4gKwo+PiArdGl0bGU6IEREUiBjaGFubmVsIHdp
dGggY2hpcC9yYW5rIHRvcG9sb2d5IGRlc2NyaXB0aW9uCj4+ICsKPj4gK2Rlc2NyaXB0aW9uOgo+
PiArICBBIEREUiBjaGFubmVsIGlzIGEgbG9naWNhbCBncm91cGluZyBvZiBtZW1vcnkgY2hpcHMg
dGhhdCBhcmUgY29ubmVjdGVkCj4+ICsgIHRvIGEgaG9zdCBzeXN0ZW0uIFRoZSBtYWluIHB1cnBv
c2Ugb2YgdGhpcyBub2RlIGlzIHRvIGRlc2NyaWJlIHRoZQo+PiArICBvdmVyYWxsIEREUiB0b3Bv
bG9neSBvZiB0aGUgc3lzdGVtLCBpbmNsdWRpbmcgdGhlIGFtb3VudCBvZiBpbmRpdmlkdWFsCj4+
ICsgIEREUiBjaGlwcy4KPj4gKwo+PiArbWFpbnRhaW5lcnM6Cj4+ICsgIC0gQ2zDqW1lbnQgTGUg
R29mZmljIDxsZWdvZmZpYy5jbGVtZW50QGdtYWlsLmNvbT4KPj4gKwo+PiArcHJvcGVydGllczoK
Pj4gKyAgY29tcGF0aWJsZToKPj4gKyAgICBlbnVtOgo+PiArICAgICAgLSBqZWRlYyxkZHIzLWNo
YW5uZWwKPj4gKyAgICAgIC0gamVkZWMsZGRyNC1jaGFubmVsCj4+ICsKPj4gKyAgaW8td2lkdGg6
Cj4+ICsgICAgZGVzY3JpcHRpb246Cj4+ICsgICAgICBUaGUgbnVtYmVyIG9mIERRIHBpbnMgaW4g
dGhlIGNoYW5uZWwuIElmIHRoaXMgbnVtYmVyIGlzIGRpZmZlcmVudAo+PiArICAgICAgZnJvbSAo
YSBtdWx0aXBsZSBvZikgdGhlIGlvLXdpZHRoIG9mIHRoZSBERFIgY2hpcCwgdGhhdCBtZWFucyB0
aGF0Cj4+ICsgICAgICBtdWx0aXBsZSBpbnN0YW5jZXMgb2YgdGhhdCB0eXBlIG9mIGNoaXAgYXJl
IHdpcmVkIGluIHBhcmFsbGVsIG9uIHRoaXMKPj4gKyAgICAgIGNoYW5uZWwgKHdpdGggdGhlIGNo
YW5uZWwncyBEUSBwaW5zIHNwbGl0IHVwIGJldHdlZW4gdGhlIGRpZmZlcmVudAo+PiArICAgICAg
Y2hpcHMsIGFuZCB0aGUgQ0EsIENTLCBldGMuIHBpbnMgb2YgdGhlIGRpZmZlcmVudCBjaGlwcyBh
bGwgc2hvcnRlZAo+PiArICAgICAgdG9nZXRoZXIpLiAgVGhpcyBtZWFucyB0aGF0IHRoZSB0b3Rh
bCBwaHlzaWNhbCBtZW1vcnkgY29udHJvbGxlZCBieSBhCj4+ICsgICAgICBjaGFubmVsIGlzIGVx
dWFsIHRvIHRoZSBzdW0gb2YgdGhlIGRlbnNpdGllcyBvZiBlYWNoIHJhbmsgb24gdGhlCj4+ICsg
ICAgICBjb25uZWN0ZWQgRERSIGNoaXAsIHRpbWVzIHRoZSBpby13aWR0aCBvZiB0aGUgY2hhbm5l
bCBkaXZpZGVkIGJ5Cj4+ICsgICAgICB0aGUgaW8td2lkdGggb2YgdGhlIEREUiBjaGlwLgo+PiAr
ICAgIGVudW06Cj4+ICsgICAgICAtIDgKPj4gKyAgICAgIC0gMTYKPj4gKyAgICAgIC0gMzIKPj4g
KyAgICAgIC0gNjQKPj4gKyAgICAgIC0gMTI4Cj4gCj4gVGhpcyBpcyBkdXBsaWNhdGluZyB3aGF0
J3MgaW4gamVkZWMsbHBkZHItY2hhbm5lbC55YW1sLiBSZWZhY3RvciBvciBhZGQKPiB0byBpdCBy
YXRoZXIgdGhhbiBkdXBsaWNhdGluZy4KClllcyBJIHdhbnRlZCBzb21ldGhpbmcgdW5pcXVlIGFz
ICJqZWRlYyxscGRkci1jaGFubmVsLnlhbWwiIGlzIApzcGVjaWZpY2FsbHkgZm9yIGxwZGRyLgpJ
IHRoaW5rIEknbGwgcmVmYWN0b3IgYW5kIHJlbmFtZSBpdCAiamVkZWMsbWVtb3J5LWNoYW5uZWwu
eWFtbCIgc28gaXQgaXMgCm1vcmUgZ2VuZXJpYy4KCj4gSXMgdGhlcmUgc29tZSByZWFzb24gcmVn
dWxhciBERFIzLzQgZG9lc24ndCBoYXZlIHJhbmtzPyBJJ20gcHJldHR5IHN1cmUKPiBpdCBjYW4u
Li4KClllcyBpdCBkb2VzIGJ1dCBJIHdhc24ndCBuZWVkaW5nIGl0IGFuZCB0aGV5IGFyZSBub3Qg
cmVxdWlyZWQgaW4gY2FzZSBvZiAKbHBkZHIuIEl0IHdpbGwgYmUgZml4ZWQgYnkgcmVmYWN0b3Jp
bmcgamVkZWMsbHBkZHItY2hhbm5lbC55YW1sIGJpbmRpbmcuCgpCZXN0IHJlZ2FyZHMsCkNsw6lt
ZW50CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
