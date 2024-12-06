Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A719E6C7A
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Dec 2024 11:44:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30C74C6DD9A;
	Fri,  6 Dec 2024 10:44:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 721ECC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2024 10:44:33 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B679KBO002443;
 Fri, 6 Dec 2024 11:44:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 V0ATVLxAwL3Q7ZA1rnzrNFoT8PRJxtmErmUNHoBIPzo=; b=P32HqXmAgTYBVJLh
 0gjfN3691OwMW0nZ6+Yf0YCEADXGJlWbyZWNU7wAzocFS7Mgj4LBPJkhHzio/mAv
 7YKsQpnSJqdSr19sXhYFeoJptNRC1irzATMs9xK7QS2wwQLIgfakhp8WLA5hrOSU
 3u+ZK9t0CEH1l3MaObtrIb5lXcE/EeXAec9B3Qzx2fdYICtG61zOWFtxB5xAxP9t
 aNwMNgJlR9ZvkRkWuPzP9a0Me9+0wqWmgNo5EkVx3MDnE66TL/NqrOJKQpUg5M60
 aQo/ZVHWZSsrfsJSBb8XYURc6xgolXB4JC2q8cUDGj/mL4TCWJ6plNUAA2s8NKqZ
 Mx35Sg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43bby7cukm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2024 11:44:24 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AF93640054;
 Fri,  6 Dec 2024 11:43:09 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D5D4326B63A;
 Fri,  6 Dec 2024 11:42:00 +0100 (CET)
Received: from [10.48.87.77] (10.48.87.77) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 6 Dec
 2024 11:42:00 +0100
Message-ID: <9811a705-447a-4527-b3ca-be9d21059bf4@foss.st.com>
Date: Fri, 6 Dec 2024 11:41:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Alexandre Torgue
 <alexandre.torgue@st.com>
References: <e81f5b48-02e9-423c-984e-b7dfa7753f27@pengutronix.de>
Content-Language: en-US
From: Yann Gautier <yann.gautier@foss.st.com>
In-Reply-To: <e81f5b48-02e9-423c-984e-b7dfa7753f27@pengutronix.de>
X-Originating-IP: [10.48.87.77]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: "barebox@lists.infradead.org" <barebox@lists.infradead.org>, Oleksij
 Rempel <ore@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [Linux-stm32] AXI ID 0x5c8 on STM32MP13
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

T24gMTIvNS8yNCAxNDo0MCwgQWhtYWQgRmF0b3VtIHdyb3RlOgo+IEhlbGxvLAo+IAo+IEFmdGVy
IGEga2VybmVsIHVwZGF0ZSB0byB2Ni4xMy1yYzEsIHdlIGhhdmUgYmVlbiBpbmNyZWFzaW5nbHkg
c2VlaW5nCj4gZm9sbG93aW5nIG9jY2FzaW9uYWwgT1AtVEVFICh2NC4yLjApIHBhbmljOgo+IAo+
ICAgIEUvVEM6MCAgIGR1bXBfZmFpbF9maWx0ZXI6NDI1IFZpb2xhdGlvbiBAMHhjZTAxYjAwMCwg
bm9uLXNlY3VyZSBwcml2aWxlZ2VkIHJlYWQsIEFYSSBJRCA1YzgKPiAgICBFL1RDOjAgICBQYW5p
YyBhdCBjb3JlL2FyY2gvYXJtL3BsYXQtc3RtMzJtcDEvcGxhdF90emM0MDAuYzozMCA8dHpjX2l0
X2hhbmRsZXI+Cj4gICAgRS9UQzowICAgVEVFIGxvYWQgYWRkcmVzcyBAIDB4Y2UwMDAwMDAKPiAK
PiBUaGlzIGhhcHBlbnMgYXQga2VybmVsIGJvb3QgdGltZSwgd2hlbiBsb2FkZWQgYnkgYmFyZWJv
eC4gVGhlIHByb2JhYmlsaXR5IHRoYXQKPiB0aGlzIGhhcHBlbnMsIHNlZW1zIHRvIGJlIGludmVy
c2VseSBwcm9wb3J0aW9uYWwgdG8gaG93IGxvbmcgdGhlIHN5c3RlbQo+IHdhcyBwb3dlcmVkIG9m
ZiBwcmlvciB0byBQb3dlci1vbiByZXNldC4uLgo+IAo+IFRoZSBrZXJuZWwgL3Jlc2VydmVkLW1l
bW9yeSBlbnRyeSBoYXMgYSBuby1tYXAgZW50cnkgZm9yIE9QLVRFRSwgc28gdGhpcwo+IGxvb2tz
IGNvcnJlY3QuCj4gCj4gYmFyZWJveCBtYXBzIHRoZSBPUC1URUUgcmFuZ2UgYXMgdW5jYWNoZWQg
YW5kIHdpdGggZVhlY3V0ZSBOZXZlciBzZXQuCj4gSW5kZWVkLCBpZiB3ZSBqdW1wIHRvIHRoZSBP
UC1URUUgbWVtb3J5IGRpcmVjdGx5LCB3ZSBnZXQgYSBwcmVmZXRjaCBlcnJvcgo+IGZyb20gd2l0
aGluIGJhcmVib3ggd2l0aG91dCBoaXR0aW5nIHRoZSBmaXJld2FsbCBhcyBleHBlY3RlZC4KPiAK
PiBJZiB0aGUgYmFyZWJveCBNTVUgaXMgZGlzYWJsZWQgYW5kIHdlIHRyeSB0byBleGVjdXRlIGZy
b20gMHhjZTAwMDAwMCwgd2UKPiBnZXQgYW4gZXhwZWN0ZWQgcGFuaWMgZnJvbSBPUC1URUU6Cj4g
Cj4gICAgRS9UQzowICAgdHpjX2l0X2hhbmRsZXI6MjYgVFpDIHBlcm1pc3Npb24gZmFpbHVyZQo+
ICAgIEUvVEM6MCAgIGR1bXBfZmFpbF9maWx0ZXI6NDIwIFBlcm1pc3Npb24gdmlvbGF0aW9uIG9u
IGZpbHRlciAwCj4gICAgRS9UQzowICAgZHVtcF9mYWlsX2ZpbHRlcjo0MjUgVmlvbGF0aW9uIEAw
eGNlMDAwMDAwLCBub24tc2VjdXJlIHByaXZpbGVnZWQgcmVhZCwgQVhJIElEIDRjMAo+ICAgIEUv
VEM6MCAgIFBhbmljIGF0IGNvcmUvYXJjaC9hcm0vcGxhdC1zdG0zMm1wMS9wbGF0X3R6YzQwMC5j
OjMwIDx0emNfaXRfaGFuZGxlcj4KPiAgICBFL1RDOjAgICBURUUgbG9hZCBhZGRyZXNzIEAgMHhj
ZTAwMDAwMAo+IAo+IE5vdGUgdGhhdCB0aGlzIGlzIGEgZGlmZmVyZW50IEFYSSBJRCAoMHg0YzAp
IHRoYW4gdGhlIG9uZSB3ZSBzZWUgcmVsYXRlZAo+IHRvIHRoZSBzcHVyaW91cyByZWFkICgweDVj
OCkuCj4gCj4gSW4gb3JkZXIgdG8gZnVydGhlciBkZWJ1ZyB0aGlzLCBpdCB3b3VsZCBiZSB1c2Vm
dWwgdG8ga25vdyB3aGljaCBBWEkgbWFzdGVyCj4gaGFzIElEIDB4NWM4LiBUaGUgcmVmZXJlbmNl
IG1hbnVhbCAoUk0wNDc1KSBoYXMgVGFibGUgMjAuICJOU0FJRCBhbmQgQVhJX0lECj4gbWFwcGlu
ZyIgaW4gUk0wNDc1IGJ1dCBpdCBjb250YWlucyBubyAweDVjOC4gMHg0YzAgaXMgZXhwZWN0ZWRs
eSB0aGUgQ0E3Cj4gaXRzZWxmLgo+IAo+IENhbiBzb21lb25lIGZyb20gU1QgcGxlYXNlIGNoaW1l
IGluIHdpdGggdGhlIGluZm9ybWF0aW9uIHdoYXQgQVhJIG1hc3Rlcgo+IElEIDB4NWM4IG1hcHMg
dG8/Cj4gCkhpIEFobWFkLAoKVGhlIHRhYmxlIHlvdSBtZW50aW9uIGdpdmVzIG1vc3Qgb2YgdGhl
IGV4cGxhbmF0aW9uIGJ1dCBJIGFncmVlIHRoaXMgaXMgCm5vdCBjb21wbGV0ZWx5IGNsZWFyLgog
RnJvbSB0aGUgdGFibGU6Ck1hc3RlciB8IE5TQUlEWzM6MF0gfCBJRF9XSURUSCAgfCBBWElfSURb
MTA6MF0KQ0E3ICAgIHwgMGIwMDAwICAgICB8IEFSOjYvQVc6NSB8IDEx4oCZYjEwWFhYWFhYMDAw
CgpUaGUgQklUWzEwXSAoMHg0MDApIGlzIHNldCBpbiAweDVjOCwgc28gaXQgaXMgdGhlIENvcnRl
eC1BNy4KVGhlbiB0aGUgMHgxYzggaXMgdGhlIEFSSUQgb3IgQVdJRCwgdGhhdCB5b3UgY2FuIGZp
bmQgaW4gQ29ydGV4LUE3IFRSTS4KU2VlIHRhYmxlcyA3LjQgb3IgNy41LgpBcyB0aGUgVFpDIGVy
cm9yIG1lbnRpb25zIGEgcmVhZCBlcnJvciwgdGhlbiBpdCB3aWxsIGJlIGFuIEFSSURNLgpBbmQg
MHgxYzggPj4gMyBjb3JyZXNwb25kIHRvOgowYjExMW1tbVtiXSBMMiBMaW5lLUZpbGwgQnVmZmVy
CmIuIFdoZXJlIG1tbSBpcyBMMiBlbmNvZGluZyBvZiB0aGUgTGluZS1GaWxsIEJ1ZmZlci4KCkFu
ZCAweDRjMCBpcyB0aGVuIHRoZSBDb3J0ZXgtQTcgUHJvY2Vzc29yIDAgSW5zdHJ1Y3Rpb24uCgoK
CkJlc3QgcmVnYXJkcywKWWFubgoKCj4gVGhhbmtzLAo+IEFobWFkCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
