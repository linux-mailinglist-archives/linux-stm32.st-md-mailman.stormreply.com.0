Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5D5B51983
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 16:36:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF21DC35E00;
	Wed, 10 Sep 2025 14:36:21 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83B4BC36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 14:36:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 14FDE40474;
 Wed, 10 Sep 2025 14:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3EC0C4CEEB;
 Wed, 10 Sep 2025 14:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757514978;
 bh=YzN2vCtNXOfPmEUy/QtzOmDZxzWZ2vYAup9vdx715rk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TcziRYTYjchVtxoB9c9jxPGdTtH8mRcmyM0KzU+MT9Wvq7cTN3ItuzY3bIARaBIQ0
 maLWUpobcoR0VBLEhkZQtzjsRyGo5BQrMjAvQU1kuWrgkrnQ2JOXsP1Rqcl0FyYFRZ
 MgY3Z1fV4VgFb8slQlwvM8aTQbqcrE4wiViC2hkhs3XXOcNBx/gH+aa24Byz2Bq9xH
 YDcQN6Mg00HsekKooHydArdlKbBPtw3EatWrexA5irgomMXn/0wjp/3cJQ3lFqXJ2t
 Er39O+Ouvu8cFbvN8cO71In7Sk+0MoLdX/YjJ/eB6on0oDpqYWfMIwBlI8co8JhIa3
 auGJTVRYZcT7A==
Date: Wed, 10 Sep 2025 09:36:18 -0500
From: Rob Herring <robh@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <20250910143618.GA4072335-robh@kernel.org>
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
 <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>
 <175751081352.3667912.274641295097354228.robh@kernel.org>
 <CAMRc=Mfom=QpqTrTSc_NEbKScOi1bLdVDO7kJ0+UQW9ydvdKjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRc=Mfom=QpqTrTSc_NEbKScOi1bLdVDO7kJ0+UQW9ydvdKjQ@mail.gmail.com>
Cc: Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 2/9] dt-bindings: net: qcom: document the
 ethqos device for SCMI-based systems
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

T24gV2VkLCBTZXAgMTAsIDIwMjUgYXQgMDM6NDM6MzhQTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBPbiBXZWQsIFNlcCAxMCwgMjAyNSBhdCAzOjM44oCvUE0gUm9iIEhlcnJp
bmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4KPiA+IE9uIFdlZCwgMTAg
U2VwIDIwMjUgMTA6MDc6MzkgKzAyMDAsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gPiA+
IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9y
Zz4KPiA+ID4KPiA+ID4gRGVzY3JpYmUgdGhlIGZpcm13YXJlLW1hbmFnZWQgdmFyaWFudCBvZiB0
aGUgUUNvbSBEZXNpZ25XYXJlIE1BQy4gQXMgdGhlCj4gPiA+IHByb3BlcnRpZXMgaGVyZSBkaWZm
ZXIgYSBsb3QgZnJvbSB0aGUgSExPUy1tYW5hZ2VkIHZhcmlhbnQsIGxldHMgcHV0IGl0Cj4gPiA+
IGluIGEgc2VwYXJhdGUgZmlsZS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBH
b2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4gPiAtLS0KPiA+
ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9xY29tLGV0aHFvcy1zY21pLnlhbWwgIHwg
MTAxICsrKysrKysrKysrKysrKysrKysrKwo+ID4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
bmV0L3NucHMsZHdtYWMueWFtbCAgICAgICAgfCAgIDQgKy0KPiA+ID4gIE1BSU5UQUlORVJTICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPiA+ID4gIDMgZmls
ZXMgY2hhbmdlZCwgMTA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4KPiA+Cj4g
PiBNeSBib3QgZm91bmQgZXJyb3JzIHJ1bm5pbmcgJ21ha2UgZHRfYmluZGluZ19jaGVjaycgb24g
eW91ciBwYXRjaDoKPiA+Cj4gPiB5YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6Cj4gPgo+ID4gZHRz
Y2hlbWEvZHRjIHdhcm5pbmdzL2Vycm9yczoKPiA+IC9idWlsZHMvcm9iaGVycmluZy9kdC1yZXZp
ZXctY2kvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9yZW5lc2Fz
LHJ6bjEtZ21hYy5leGFtcGxlLmR0YjogZXRoZXJuZXRANDQwMDAwMDAgKHJlbmVzYXMscjlhMDZn
MDMyLWdtYWMpOiBwb3dlci1kb21haW5zOiBbWzQyOTQ5NjcyOTVdXSBpcyB0b28gc2hvcnQKPiA+
ICAgICAgICAgZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9u
ZXQvcmVuZXNhcyxyem4xLWdtYWMueWFtbCMKPiA+IC9idWlsZHMvcm9iaGVycmluZy9kdC1yZXZp
ZXctY2kvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9yZW5lc2Fz
LHJ6bjEtZ21hYy5leGFtcGxlLmR0YjogZXRoZXJuZXRANDQwMDAwMDAgKHJlbmVzYXMscjlhMDZn
MDMyLWdtYWMpOiBVbmV2YWx1YXRlZCBwcm9wZXJ0aWVzIGFyZSBub3QgYWxsb3dlZCAoJ2Nsb2Nr
LW5hbWVzJywgJ2Nsb2NrcycsICdpbnRlcnJ1cHQtbmFtZXMnLCAnaW50ZXJydXB0cycsICdwaHkt
bW9kZScsICdwb3dlci1kb21haW5zJywgJ3JlZycsICdyeC1maWZvLWRlcHRoJywgJ3NucHMsbXVs
dGljYXN0LWZpbHRlci1iaW5zJywgJ3NucHMscGVyZmVjdC1maWx0ZXItZW50cmllcycsICd0eC1m
aWZvLWRlcHRoJyB3ZXJlIHVuZXhwZWN0ZWQpCj4gPiAgICAgICAgIGZyb20gc2NoZW1hICRpZDog
aHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbmV0L3JlbmVzYXMscnpuMS1nbWFjLnlhbWwj
Cj4gPiAvYnVpbGRzL3JvYmhlcnJpbmcvZHQtcmV2aWV3LWNpL2xpbnV4L0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvcmVuZXNhcyxyem4xLWdtYWMuZXhhbXBsZS5kdGI6IGV0
aGVybmV0QDQ0MDAwMDAwIChyZW5lc2FzLHI5YTA2ZzAzMi1nbWFjKTogcG93ZXItZG9tYWluczog
W1s0Mjk0OTY3Mjk1XV0gaXMgdG9vIHNob3J0Cj4gPiAgICAgICAgIGZyb20gc2NoZW1hICRpZDog
aHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbmV0L3NucHMsZHdtYWMueWFtbCMKPiA+IC9i
dWlsZHMvcm9iaGVycmluZy9kdC1yZXZpZXctY2kvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL25ldC9tZWRpYXRlay1kd21hYy5leGFtcGxlLmR0YjogZXRoZXJuZXRAMTEw
MWMwMDAgKG1lZGlhdGVrLG10MjcxMi1nbWFjKTogcG93ZXItZG9tYWluczogW1s0Mjk0OTY3Mjk1
LCA0XV0gaXMgdG9vIHNob3J0Cj4gPiAgICAgICAgIGZyb20gc2NoZW1hICRpZDogaHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvbmV0L21lZGlhdGVrLWR3bWFjLnlhbWwjCj4gPiAvYnVpbGRz
L3JvYmhlcnJpbmcvZHQtcmV2aWV3LWNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9uZXQvbWVkaWF0ZWstZHdtYWMuZXhhbXBsZS5kdGI6IGV0aGVybmV0QDExMDFjMDAw
IChtZWRpYXRlayxtdDI3MTItZ21hYyk6IFVuZXZhbHVhdGVkIHByb3BlcnRpZXMgYXJlIG5vdCBh
bGxvd2VkICgnbWFjLWFkZHJlc3MnLCAncGh5LW1vZGUnLCAncmVnJywgJ3NucHMscmVzZXQtZGVs
YXlzLXVzJywgJ3NucHMscmVzZXQtZ3BpbycsICdzbnBzLHJ4cGJsJywgJ3NucHMsdHhwYmwnIHdl
cmUgdW5leHBlY3RlZCkKPiA+ICAgICAgICAgZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvc2NoZW1hcy9uZXQvbWVkaWF0ZWstZHdtYWMueWFtbCMKPiA+IC9idWlsZHMvcm9i
aGVycmluZy9kdC1yZXZpZXctY2kvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL25ldC9tZWRpYXRlay1kd21hYy5leGFtcGxlLmR0YjogZXRoZXJuZXRAMTEwMWMwMDAgKG1l
ZGlhdGVrLG10MjcxMi1nbWFjKTogcG93ZXItZG9tYWluczogW1s0Mjk0OTY3Mjk1LCA0XV0gaXMg
dG9vIHNob3J0Cj4gPiAgICAgICAgIGZyb20gc2NoZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUu
b3JnL3NjaGVtYXMvbmV0L3NucHMsZHdtYWMueWFtbCMKPiA+Cj4gCj4gVGhlc2Ugc2VlbSB0byBi
ZSBhIGZhbHNlLXBvc2l0aXZlcyB0cmlnZ2VyZWQgYnkgbW9kaWZ5aW5nIHRoZQo+IGhpZ2gtbGV2
ZWwgc25wcy5kd21hYy55YW1sIGZpbGU/CgpOby4gWW91IGp1c3QgbWFkZSAzIHBvd2VyLWRvbWFp
bnMgcmVxdWlyZWQgZm9yIGV2ZXJ5b25lLgoKWW91IGhhdmUgdG8gdGVzdCB3aXRob3V0IERUX1ND
SEVNQV9GSUxFUyBzZXQgc28gdGhhdCBldmVyeSBleGFtcGxlIGlzIAp0ZXN0ZWQgd2l0aCBldmVy
eSBwb3NzaWJsZSBzY2hlbWEuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
