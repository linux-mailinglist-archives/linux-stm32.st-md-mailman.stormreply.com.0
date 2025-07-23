Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03758B0ECDF
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 10:13:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A482CC36B36;
	Wed, 23 Jul 2025 08:13:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10470C36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 08:13:05 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N6doax017391;
 Wed, 23 Jul 2025 10:12:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 QK/sgu4bbRdODvf5tGfCdDwOR/bbwmheF/bQDBgiURc=; b=c2BAurjQoIkZx3qZ
 U2f+PzALTuiatgf01cQJZ+5YLfNH9gWPig4oRGmgheOtBV6Fysjg3Dbjnyq3At1K
 C06RPHgeUh3BDvg17/h+P/+vsRdODvB4gkDo6OOZFuKie0KGvhlXbXFBb3/SXuYq
 hRkN/TQBnhr+e8cye3LN3PH5MUR+3JqDcMblh1k+fCMjX13S64aaHHjRCoPXakVq
 ui2IgS0L9Jb9e+sxtSOl6kjyrnZP+pLaop77Dt5U0vAbHXFPodnoh06RmDssgYUO
 qsuGOrFmw/0G6jp3XDY/ZThhXSJ2KPAst6jbzuklVuJBOuMO5+1bZw9V6jLMl2l4
 pqpznw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 480mx4qpqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jul 2025 10:12:48 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2CEBC40046;
 Wed, 23 Jul 2025 10:11:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CB65D76C471;
 Wed, 23 Jul 2025 10:10:01 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 10:10:00 +0200
Message-ID: <e9e33fc7-4705-4e6d-bd33-ce9dc1a9b94e@foss.st.com>
Date: Wed, 23 Jul 2025 10:10:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
 <20250722-ddrperfm-upstream-v3-7-7b7a4f3dc8a0@foss.st.com>
 <20250723-zealous-turtle-of-perfection-e67aee@kuoka>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250723-zealous-turtle-of-perfection-e67aee@kuoka>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Will Deacon <will@kernel.org>, linux-clk@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Le Goffic <legoffic.clement@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Julius Werner <jwerner@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 07/19] dt-bindings: memory: factorise
 LPDDR channel binding into memory channel
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

SGkgS3J6eXN6dG9mLAoKT24gNy8yMy8yNSAwODo1NywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90
ZToKPiBPbiBUdWUsIEp1bCAyMiwgMjAyNSBhdCAwNDowMzoyNFBNICswMjAwLCBDbMOpbWVudCBM
ZSBHb2ZmaWMgd3JvdGU6Cj4+IExQRERSIGFuZCBERFIgY2hhbm5lbHMgZXhpc3QgYW5kIHNoYXJl
IHRoZSBzYW1lIHByb3BlcnRpZXMsIHRoZXkgaGF2ZSBhCj4+IGNvbXBhdGlibGUsIHJhbmtzLCBh
bmQgYW4gaW8td2lkdGguCj4gCj4gTWF5YmUgaXQgaXMgdHJ1ZSBmb3IgYWxsIHR5cGVzIG9mIFNE
UkFNLCBsaWtlIFJEUkFNIGFuZCBlRFJBTSwgYnV0IEkKPiBkb24ndCB0aGluayBhbGwgbWVtb3J5
IHR5cGVzIGRvLgo+IAo+IEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgcmVuYW1lZCB0byBzZHJhbS1j
aGFubmVsLgoKT2ssIGRvIHlvdSB3YW50IG1lIHRvIGFsc28gdGhlIG1lbW9yeS1wcm9wcyBwYXRj
aCBpbnRvIHNkcmFtLXByb3BzID8KCj4gCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExl
IEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KPj4gLS0tCj4+ICAgLi4ucGRk
ci1jaGFubmVsLnlhbWwgPT4gamVkZWMsbWVtb3J5LWNoYW5uZWwueWFtbH0gfCAyNiArKysrKysr
KysrKy0tLS0tLS0tLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEz
IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMsbHBkZHItY2hhbm5lbC55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9k
ZHIvamVkZWMsbWVtb3J5LWNoYW5uZWwueWFtbAo+PiBzaW1pbGFyaXR5IGluZGV4IDgyJQo+PiBy
ZW5hbWUgZnJvbSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRy
b2xsZXJzL2Rkci9qZWRlYyxscGRkci1jaGFubmVsLnlhbWwKPj4gcmVuYW1lIHRvIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLG1l
bW9yeS1jaGFubmVsLnlhbWwKPj4gaW5kZXggMzRiNWJkMTUzZjYzLi4zYmYzYTYzNDY2ZWIgMTAw
NjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29u
dHJvbGxlcnMvZGRyL2plZGVjLGxwZGRyLWNoYW5uZWwueWFtbAo+PiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxtZW1v
cnktY2hhbm5lbC55YW1sCj4+IEBAIC0xLDE2ICsxLDE2IEBACj4+ICAgIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4+ICAgJVlBTUwgMS4y
Cj4+ICAgLS0tCj4+IC0kaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21lbW9yeS1j
b250cm9sbGVycy9kZHIvamVkZWMsbHBkZHItY2hhbm5lbC55YW1sIwo+PiArJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLG1lbW9y
eS1jaGFubmVsLnlhbWwjCj4+ICAgJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEt
c2NoZW1hcy9jb3JlLnlhbWwjCj4+ICAgCj4+IC10aXRsZTogTFBERFIgY2hhbm5lbCB3aXRoIGNo
aXAvcmFuayB0b3BvbG9neSBkZXNjcmlwdGlvbgo+PiArdGl0bGU6IE1lbW9yeSBjaGFubmVsIHdp
dGggY2hpcC9yYW5rIHRvcG9sb2d5IGRlc2NyaXB0aW9uCj4+ICAgCj4+ICAgZGVzY3JpcHRpb246
Cj4+IC0gIEFuIExQRERSIGNoYW5uZWwgaXMgYSBjb21wbGV0ZWx5IGluZGVwZW5kZW50IHNldCBv
ZiBMUEREUiBwaW5zIChEUSwgQ0EsIENTLAo+PiAtICBDSywgZXRjLikgdGhhdCBjb25uZWN0IG9u
ZSBvciBtb3JlIExQRERSIGNoaXBzIHRvIGEgaG9zdCBzeXN0ZW0uIFRoZSBtYWluCj4+IC0gIHB1
cnBvc2Ugb2YgdGhpcyBub2RlIGlzIHRvIG92ZXJhbGwgTFBERFIgdG9wb2xvZ3kgb2YgdGhlIHN5
c3RlbSwgaW5jbHVkaW5nIHRoZQo+PiAtICBhbW91bnQgb2YgaW5kaXZpZHVhbCBMUEREUiBjaGlw
cyBhbmQgdGhlIHJhbmtzIHBlciBjaGlwLgo+PiArICBBIG1lbW9yeSBjaGFubmVsIGlzIGEgY29t
cGxldGVseSBpbmRlcGVuZGVudCBzZXQgb2YgcGlucyAoRFEsIENBLCBDUywKPiAKPiBBIG1lbW9y
eSBjaGFubmVsIG9mIFNEUkFNIG1lbW9yeSBsaWtlIEREUiBTRFJBTSBvciBMUEREUiBTRFJBTSBp
cyAuLi4KCkFjawoKPiAKPj4gKyAgQ0ssIGV0Yy4pIHRoYXQgY29ubmVjdCBvbmUgb3IgbW9yZSBt
ZW1vcnkgY2hpcHMgdG8gYSBob3N0IHN5c3RlbS4gVGhlIG1haW4KPj4gKyAgcHVycG9zZSBvZiB0
aGlzIG5vZGUgaXMgdG8gb3ZlcmFsbCBtZW1vcnkgdG9wb2xvZ3kgb2YgdGhlIHN5c3RlbSwgaW5j
bHVkaW5nIHRoZQo+PiArICBhbW91bnQgb2YgaW5kaXZpZHVhbCBtZW1vcnkgY2hpcHMgYW5kIHRo
ZSByYW5rcyBwZXIgY2hpcC4KPj4gICAKPj4gICBtYWludGFpbmVyczoKPj4gICAgIC0gSnVsaXVz
IFdlcm5lciA8andlcm5lckBjaHJvbWl1bS5vcmc+Cj4+IEBAIC0yNiwxNCArMjYsMTQgQEAgcHJv
cGVydGllczoKPj4gICAgIGlvLXdpZHRoOgo+PiAgICAgICBkZXNjcmlwdGlvbjoKPj4gICAgICAg
ICBUaGUgbnVtYmVyIG9mIERRIHBpbnMgaW4gdGhlIGNoYW5uZWwuIElmIHRoaXMgbnVtYmVyIGlz
IGRpZmZlcmVudAo+PiAtICAgICAgZnJvbSAoYSBtdWx0aXBsZSBvZikgdGhlIGlvLXdpZHRoIG9m
IHRoZSBMUEREUiBjaGlwLCB0aGF0IG1lYW5zIHRoYXQKPj4gKyAgICAgIGZyb20gKGEgbXVsdGlw
bGUgb2YpIHRoZSBpby13aWR0aCBvZiB0aGUgbWVtb3J5IGNoaXAsIHRoYXQgbWVhbnMgdGhhdAo+
PiAgICAgICAgIG11bHRpcGxlIGluc3RhbmNlcyBvZiB0aGF0IHR5cGUgb2YgY2hpcCBhcmUgd2ly
ZWQgaW4gcGFyYWxsZWwgb24gdGhpcwo+PiAgICAgICAgIGNoYW5uZWwgKHdpdGggdGhlIGNoYW5u
ZWwncyBEUSBwaW5zIHNwbGl0IHVwIGJldHdlZW4gdGhlIGRpZmZlcmVudAo+PiAgICAgICAgIGNo
aXBzLCBhbmQgdGhlIENBLCBDUywgZXRjLiBwaW5zIG9mIHRoZSBkaWZmZXJlbnQgY2hpcHMgYWxs
IHNob3J0ZWQKPj4gICAgICAgICB0b2dldGhlcikuICBUaGlzIG1lYW5zIHRoYXQgdGhlIHRvdGFs
IHBoeXNpY2FsIG1lbW9yeSBjb250cm9sbGVkIGJ5IGEKPj4gICAgICAgICBjaGFubmVsIGlzIGVx
dWFsIHRvIHRoZSBzdW0gb2YgdGhlIGRlbnNpdGllcyBvZiBlYWNoIHJhbmsgb24gdGhlCj4+IC0g
ICAgICBjb25uZWN0ZWQgTFBERFIgY2hpcCwgdGltZXMgdGhlIGlvLXdpZHRoIG9mIHRoZSBjaGFu
bmVsIGRpdmlkZWQgYnkKPj4gLSAgICAgIHRoZSBpby13aWR0aCBvZiB0aGUgTFBERFIgY2hpcC4K
Pj4gKyAgICAgIGNvbm5lY3RlZCBtZW1vcnkgY2hpcCwgdGltZXMgdGhlIGlvLXdpZHRoIG9mIHRo
ZSBjaGFubmVsIGRpdmlkZWQgYnkKPj4gKyAgICAgIHRoZSBpby13aWR0aCBvZiB0aGUgbWVtb3J5
IGNoaXAuCj4+ICAgICAgIGVudW06Cj4+ICAgICAgICAgLSA4Cj4+ICAgICAgICAgLSAxNgo+PiBA
QCAtNTEsOCArNTEsOCBAQCBwYXR0ZXJuUHJvcGVydGllczoKPj4gICAgICJecmFua0BbMC05XSsk
IjoKPj4gICAgICAgdHlwZTogb2JqZWN0Cj4+ICAgICAgIGRlc2NyaXB0aW9uOgo+PiAtICAgICAg
RWFjaCBwaHlzaWNhbCBMUEREUiBjaGlwIG1heSBoYXZlIG9uZSBvciBtb3JlIHJhbmtzLiBSYW5r
cyBhcmUKPj4gLSAgICAgIGludGVybmFsIGJ1dCBmdWxseSBpbmRlcGVuZGVudCBzdWItdW5pdHMg
b2YgdGhlIGNoaXAuIEVhY2ggTFBERFIgYnVzCj4+ICsgICAgICBFYWNoIHBoeXNpY2FsIG1lbW9y
eSBjaGlwIG1heSBoYXZlIG9uZSBvciBtb3JlIHJhbmtzLiBSYW5rcyBhcmUKPj4gKyAgICAgIGlu
dGVybmFsIGJ1dCBmdWxseSBpbmRlcGVuZGVudCBzdWItdW5pdHMgb2YgdGhlIGNoaXAuIEVhY2gg
bWVtb3J5IGJ1cwo+PiAgICAgICAgIHRyYW5zYWN0aW9uIG9uIHRoZSBjaGFubmVsIHRhcmdldHMg
ZXhhY3RseSBvbmUgcmFuaywgYmFzZWQgb24gdGhlCj4+ICAgICAgICAgc3RhdGUgb2YgdGhlIENT
IHBpbnMuIERpZmZlcmVudCByYW5rcyBtYXkgaGF2ZSBkaWZmZXJlbnQgZGVuc2l0aWVzIGFuZAo+
PiAgICAgICAgIHRpbWluZyByZXF1aXJlbWVudHMuCj4+IEBAIC0xMDcsNyArMTA3LDcgQEAgYWRk
aXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4+ICAgCj4+ICAgZXhhbXBsZXM6Cj4+ICAgICAtIHwK
Pj4gLSAgICBscGRkci1jaGFubmVsMCB7Cj4+ICsgICAgbWVtb3J5LWNoYW5uZWwwIHsKPiAKPiBJ
ZiBkb2luZyB0aGlzLCB0aGVuIHNlcGFyYXRlIGNvbW1pdCBiYXNlZCBvbiBnZW5lcmljIG5vZGUg
bmFtZQo+IGNvbnZlbnRpb24uIEJ1dCB0aGVuIHdlIG5lZWQgdG8gY29tZSB3aXRoIGdlbmVyaWMg
bm9kZSBuYW1lIGZpcnN0LAo+IHNkcmFtLWNoYW5uZWw/CgpJIGRvbid0IHdhbnQgYW55dGhpbmcg
c3BlY2lmaWMgc28geWVzIGl0IGNvdWxkIGJlIGNvb2wgdG8gaGF2ZSBhIGdlbmVyaWMgCm5vZGUg
bmFtZS4KInNkcmFtLWNoYW5uZWwiIGlzIGZpbmUgZm9yIG1lLgpASnVsaXVzIHdoYXQgZG8geW91
IHRoaW5rIGFib3V0IGl0ID8KSXMgeW91ciBleGlzdGluZyBzb2Z0d2FyZSBnZW5lcmF0aW5nIGl0
IGluIHRoZSBrZXJuZWwgPwpJJ20gY3VyaW91cyBhYm91dCBkeW5hbWljIG5vZGUgbmFtZSBnZW5l
cmF0aW9uLgoKPiAKPiBBbmQgYWxzbyAnLTAnLCBub3QgJzAnIHN1ZmZpeC4KCkFjawoKPiBCZXN0
IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
