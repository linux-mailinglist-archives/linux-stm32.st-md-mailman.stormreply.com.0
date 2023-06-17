Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F9E73445A
	for <lists+linux-stm32@lfdr.de>; Sun, 18 Jun 2023 00:26:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84FA6C6A610;
	Sat, 17 Jun 2023 22:26:05 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D47F0C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Jun 2023 22:26:04 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DD8BD8474B;
 Sun, 18 Jun 2023 00:26:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1687040763;
 bh=sdG9ayzJa/8nhspUIwUpTDa4ZjlD+rL44Ygoe/d95IE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jtTPMHYoC6af7TZHE9e4xxi2RmCaB+89ZJsxITeyHyBvPkV7ja5je74zAwSpvhsGC
 WcQJjrDgejVdEE5btUaz7oG3+CNmhCm8TZNcXZW1Uey3KrS5j4EUIkw82snFq8ItG4
 gq0QBRrGE1qzo7zgg05K8+H7C54sDvkmvulmHtXm9BMr2QYrOxlSxxVUNlGJ0PlkZh
 deUZMdXTFaW4mkCUHkxXH1HF6PwKAtSjBY6e9fmOuBIwfyLqfKUHYRUgq8PkPBUDAH
 SB3oD2AHCy72y83ZxMsFO5g68f/NM3zYoVoVUWoUW5GL2fZLEOYvPbLtQpItfaxipl
 /AXxdqLAQXZ7Q==
Message-ID: <63a9cb7a-0fbf-233f-ec25-03f4415c349e@denx.de>
Date: Sat, 17 Jun 2023 16:34:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
 Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230518011246.438097-1-marex@denx.de>
 <PAXPR10MB471850924065C987981634C1F14B9@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
 <133c8b4a-8680-f613-807a-2d7931d0a186@denx.de>
 <PAXPR10MB4718D37242FF00D47DF0CEF1F1499@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
 <81f4574d-38c2-21f2-b947-d13e5fc99c60@denx.de>
 <PAXPR10MB471825B145645894D626F070F152A@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
 <0d304968-74c8-47ce-f87a-127449f36f4b@denx.de>
 <PAXPR10MB4718E8CE58A881DAE3983A27F153A@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
 <b65288f6-1d3d-424f-5df5-98e86cc51dec@denx.de>
 <c944123c-bcd8-89cf-c2cd-8d5742931f68@foss.st.com>
 <26cfd848-a29d-2b38-3c15-fdcda532bcef@denx.de>
 <5c3bbeb8-f0c1-46e4-009e-1cc3de64c06e@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <5c3bbeb8-f0c1-46e4-009e-1cc3de64c06e@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "kernel@dh-electronics.com" <kernel@dh-electronics.com>
Subject: Re: [Linux-stm32] [PATCH 1/5] ARM: dts: stm32: Add missing detach
 mailbox for emtrion emSBC-Argon
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

T24gNi8xMi8yMyAxNDozNCwgQXJuYXVkIFBPVUxJUVVFTiB3cm90ZToKCkhpLAoKWy4uLl0KCj4+
Pj4+IEkgd291bGQgcHJlZmVyIHRvIHJlbW92ZSBpdCBpbiBTVCBib2FyZCBEVCB0aGFuIGFkZCBp
dCBpbiB0aGUgRFRTSS4KPj4+Pj4gVGhhdCBzYWlkIGFzIG1lbnRpb25lZCBmb3IgbGVnYWN5IHN1
cHBvcnQsIGJldHRlciB0byBrZWVwIGZvciBTVCBib2FyZC4KPj4+Pgo+Pj4+IFdoeSBub3QgcmVt
b3ZlIGl0IGZyb20gU1QgYm9hcmRzIGlmIHRoaXMgd2FzIGxlZ2FjeSB0ZXN0IGZlYXR1cmUgYW5k
IGlzIG5vCj4+Pj4gbG9uZ2VyIG5lZWRlZCA/Cj4+Pgo+Pj4gSWYgeW91IGNhbiBndWFyYW50eSB0
aGF0IHRoaXMgd2lsbCBub3QgaW50cm9kdWNlIHJlZ3Jlc3Npb24gb24gbGVnYWN5LCB5ZXMgd2UK
Pj4+IGNhbi4KPj4KPj4gVGhlbiBjbGVhcmx5IHRoZSBvbmx5IHdheSB0byBhdm9pZCB0aGlzIGZy
YWdtZW50YXRpb24gaXMgdG8gYWRkIGl0IG9uIGFsbCBib2FyZHMuCj4gCj4gWW91IGNhbiBub3Qg
YXZvaWQgZnJhZ21lbnRhdGlvbiBoZXJlLCB0aGUgRFQgYW5kIHRoZSBDb3J0ZXgtTTQgZmlybXdh
cmUgYXJlCj4gZGVwZW5kZW50LCB0aGUgTTQgZmlybXdhcmUgaXMgYm9hcmQgZGVwZW5kZW50Lgo+
IEZvciBpbnN0YW5jZSwgaWYgd2UgaW50cm9kdWNlIHNvbWUgbmV3IG1haWxib3ggY2hhbm5lbHMg
dG8gc3VwcG9ydCBzb21lIHZpcnRpbwo+IHNlcnZpY2VzIHNob3VsZCB3ZSBhbHNvIGFkZCBpdCBv
biBhbGwgYm9hcmRzIHRoYXQgZW1iZWRkIHN0bTMybXAxNSBjaGlwLi4/CgpZZXMsIEkgYmVsaWV2
ZSBzbywgYXMgbG9uZyBhcyBvbmUgY2FuIHVzZSBjdWJlbXggdG8gZ2VuZXJhdGUgYnNwIGZvciAK
bm9uLVNUIGJvYXJkIHdoaWNoIHVzZXMgdGhhdCBmdW5jdGlvbmFsaXR5LgoKPiBGb3IgbWUgbm8s
IGFzIHRoZSBNNCBGaXJtd2FyZSBpcyBib2FyZCBkZXBlbmRlbnQuCgpbLi4uXQoKPj4+Pj4+IEkg
YmVsaWV2ZSBvbmNlIGNhbiBidWlsZCBkZW1vcyB1c2luZyB0aGUgZGV0YWNoIG1haWxib3ggZm9y
IGJvYXJkcyB3aXRoCj4+Pj4+PiBzdG0zMm1wMTV4eCBub3QgbWFudWZhY3R1cmVkIGJ5IFNULCBj
b3JyZWN0ID9bXQo+Pj4+Pgo+Pj4+PiBFdmVyeXRoaW5nIGNvdWxkIGJlIHBvc3NpYmxlLi4uCj4+
Pj4+IE9uY2UgY2FuIHdhbnQgdG8gcmVwbGFjZSB0aGUgc2h1dGRvd24gbWFpbGJveCBieSB0aGUg
ZGV0YWNoLgo+Pj4+PiBPbmNlIGNhbiBhbHNvIGJ1aWxkIGRlbW8gdXNpbmcgdGhlIGRldGFjaCBt
YWlsYm94IGNoYW5uZWwgZm9yIGFub3RoZXIgcHVycG9zZS4KPj4+Pj4KPj4+Pj4gSSBxdWl0ZSBj
b25mdXNlIHdoeSB5b3UgaW5zaXN0IHRvIGRlY2xhcmUgdGhpcyBkZXRhY2ggbWFpbGJveCBpbiB0
aGUgRFRTST8KPj4+Pj4gSXMgdGhlcmUgYSBzdHJvbmcgY29uc3RyYWludCBvbiB5b3VyIHNpZGU/
Cj4+Pj4KPj4+PiBJIGp1c3QgZG9uJ3Qgc2VlIGFueSBleHBsYW5hdGlvbiB3aHkgU1QgYm9hcmQo
cykgc2hvdWxkIGJlIHNvbWVob3cgc3BlY2lhbCBhbmQKPj4+PiBoYXZlIHRoZSBkZXRhY2ggbWFp
bGJveCBkZXNjcmliZWQgaW4gRFQgYnkgZGVmYXVsdCwgd2hpbGUgb3RoZXIgYm9hcmRzIHdvdWxk
Cj4+Pj4gcmVxdWlyZSBzZXBhcmF0ZSBEVCBwYXRjaCB0byB1c2UgdGhlIGRldGFjaCBtYWlsYm94
IGZpcnN0LiBUaGF0IGp1c3QgcmVkdWNlcwo+Pj4+IHVzYWJpbGl0eSBvZiBub24tU1QtbWFudWZh
Y3R1cmVkIGJvYXJkcyBhbmQgaW5jcmVhc2VzIGZyYWdtZW50YXRpb24uIEkgZG8gbm90Cj4+Pj4g
bGlrZSB0aGF0Lgo+Pj4KPj4+IFRoZSAic29tZWhvdyBzcGVjaWFsIiBzaG91bGQgb25seSBiZSBh
biBpbnRlcm5hbCBNNCBmaXJtd2FyZcKgIGFsbG93aW5nIHRvIHRlc3QKPj4+IHRoZSBmZWF0dXJl
IHRvIGhlbHAgcmVtb3RlcHJvYyBtYWludGFpbmVycyB0byB2ZXJpZnkgaXQgb24gZGVtYW5kLgo+
Pj4gQnV0IEkgY2FuIG5vdCBrbm93IGlmIHNvbWVvbmUgaW4gdGhlIGNvbW11bml0eSBoYXZlIGFu
b3RoZXIgZmlybXdhcmUgdXNpbmcKPj4+IGRldGFjaCBvbiB0aGUgU1QgYm9hcmRzLgo+Pj4gQW55
d2F5IHdoYXQgeW91IHByb3Bvc2UgaGVyZSBpcyB0aGF0IHdlIGltcG9zZSBpdCBmb3IgYWxsIGJv
YXJkcy4gU29tZSBib2FyZHMKPj4+IHdvdWxkIHJlcXVpcmUgc2VwYXJhdGUgRFQgcGF0Y2ggdG8g
bm90IHVzZSBpdC4gV2UganVzdCBpbnZlcnNlIHRoZSB0aGluZ3MuLi4KPj4+IFRoZSBkaWZmZXJl
bmNlIGlzIHRoYXQgSSB3b3VsZCBub3QgaW1wb3NlIHNvbWV0aGluZyBvcHRpb25hbC4KPj4KPj4g
SSBiZWxpZXZlIGl0IGlzIGJldHRlciB0byBoYXZlIHNpbmdsZSBjYXBhYmxlIGNvbnNpc3RlbnQg
ZGVmYXVsdCBhbmQgbGV0IHVzZXJzCj4+IHJlbW92ZSB0aGUgY2FwYWJpbGl0aWVzIGZvciBzcGVj
aWZpYyBhcHBsaWNhdGlvbiBpZiBuZWVkZWQsIHRoYW4gdG8gaGF2ZQo+PiBmcmFnbWVudGVkIGlu
Y29uc2lzdGVudCBib2FyZC1zcGVjaWZpYyBjb25maWd1cmF0aW9ucyB3aGVyZSB1c2VycyBoYXZl
IHRvIGZpcnN0Cj4+IGRldGVybWluZSB3aGV0aGVyIHRoZXkgbmVlZCB0byBwYXRjaCB0aGVtIHRv
IGFkZCBtaXNzaW5nIGNhcGFiaWxpdGllcywgYW5kIHRoZW4KPj4gcG9zc2libHkgcGF0Y2ggdGhl
bSwgdGhhdCdzIGp1c3QgYSBtZXNzLgo+IAo+IAo+IEJlIGF3YXJlIHRoYXQgdG8gbWFuYWdlIGEg
Y29wcm9jZXNzb3IgZmlybXdhcmUgdGhpcyBub3Qgc3VmZmljaWVudCBzbyBpbiBhbnkKPiBjYXNl
IHVzZXIgd2lsbCBoYXZlIHRvIHBhdGNoIHRoZSBEVCB0byBhc3NpZ24gcGVyaXBoZXJhbHMgdG8g
dGhlIENvcnRleC1NNCwKPiB1cGRhdGUgaGUgbWVtb3J5IHJlZ2lvbnMsLi4uCgpOb3QgbmVjZXNz
YXJpbHksIGEgbG90IG9mIHRoZSBjdWJlbXggZXhhbXBsZXMgZG8gdXNlIHRoZSBzYW1lIG1lbW9y
eSAKbGF5b3V0LiBTbyBtYWtpbmcgaXQgZWFzeSBmb3IgdXNlciB0byBldmFsdWF0ZSB0aGUgQ000
IHVzYWdlIGlzIHRoZSBnb2FsIApoZXJlLiBBbmQgdGhhdCBpbmNsdWRlcyBub24tU1QgcHJvZHVj
ZWQgYm9hcmRzLgoKPiBJdCBpcyBhIHN5c3RlbSB1c2VjYXNlLCBub3Qgb25seSB0aGUgZW5hYmxl
IG9mIGEgcGVyaXBoZXJhbC5UaGF0J3Mgd2h5IHdlIGhhdmUKPiBzcGVjaWZpYyBEVCBpbiBkb3du
c3RyZWFtIGZvciBNNCBleGFtcGxlcywgdG8gYmUgYWJsZSB0byBzdXBwb3J0IG1vcmUgZXhhbXBs
ZXMKPiBhbmQgZGVtb3MuCj4gCj4+Cj4+IEl0IGFsc28gcHV0cyBub24tU1QtbWFudWZhY3R1cmVk
IGJvYXJkcyBpbnRvIHdvcnNlIHBvc2l0aW9uLgo+IAo+IFdoYXQgd291bGQgeW91IG1lYW4gYnkg
d29yc3QgcG9zaXRpb24/IEFzIHRoZXJlIGlzIG5vIGV4YW1wbGUgcHJvdmlkZWQgdGhhdAo+IHdv
dWxkIHRha2UgYWR2YW50YWdlIG9mIHRoZSAiZGV0YWNoIiwgSSBkb24ndCB1bmRlcnN0YW5kIHlv
dXIgcG9pbnQuCj4gCj4gVGhlIG9ubHkgYXJndW1lbnQgSSBjYW4gc2VlIGZvciBnZW5lcmljIGlz
IHRoYXQgdGhlICBwcm9wb3NlZCBzZXR0aW5ncyBhbGxvdwo+IHRvIHJ1biBhIFplcGh5ciBJUEMg
c2FtcGxlLCB0aGF0IGNvdWxkIGJlIGNyb3NzLXBsYXRmb3JtLgo+IFNvIEkgd291bGQgc2F5IHdl
IHNob3VsZCBmaXJzdCBleHRlbmQgdGhlIE00IHplcGh5ciBzYW1wbGUgdG8gaW1wbGVtZW50IHRo
ZQo+IGRldGFjaCBhbmQgdGhlbiB0aGF0IG1pZ2h0IG1ha2Ugc2Vuc2UuCj4gCj4gSGF2aW5nIHNh
aWQgdGhhdCwgSSdkIHJhdGhlciBub3Qgc3BlbmQgYW55IG1vcmUgdGltZSBvbiB0aGlzIHN1Ympl
Y3QuCj4gSSd2ZSBnaXZlbiBzb21lIGFyZ3VtZW50cywgeW91J3ZlIGdpdmVuIG90aGVycy4KPiBJ
IG5vdyBwcm9wb3NlIHRvIGxldCBBbGV4LCBhcyBtYWludGFpbmVyIG9mIHN0bTMyIERULCBkZWNp
ZGUuLi4KCkkgYWdyZWUsIGxldCdzIHdhaXQgZm9yIEFsZXguCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
