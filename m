Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 459F3AE3F73
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jun 2025 14:15:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08AA5C32E8E;
	Mon, 23 Jun 2025 12:15:36 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2959DC32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jun 2025 12:15:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 526E86112D;
 Mon, 23 Jun 2025 12:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB84C4CEEA;
 Mon, 23 Jun 2025 12:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750680933;
 bh=pr2/No/guItEEsZxzpUA7Zdi/FU0THWZwck2JGVadcM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FfP7CoTyA8fu1qCwlWVPh5R8i5EG5GKmtcq50mO0Txd7ASAKCgT7eI5eLmmW4JRCD
 bT2rk641NFiTtFeOu4W2WwvmiuTe5RvfdJPMiGkB0iGPunuNBVKnKXiSzYFzuwEUmy
 Y3ATCjQJcuWGHBBP3JgbuaGB1TAqvg/Z2rDwEUkXRclqscxwUgb0gq9qUk8++07THf
 z4g7+5C0syh+uUqEuOnWnD+NiPOG72Zjl1xrMfOwPPNLdfWmCJTUK7RrnNhylGJWQQ
 o/hpBLdgYSVSDm1wyfKRXs4mNNU/8yi+GWV6tvk0v8xC71ViUdvIZntzgzEHjJCe8U
 4KN6vgL3PYNSA==
Date: Mon, 23 Jun 2025 06:15:31 -0600
From: Manivannan Sadhasivam <mani@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <vhzu4e233bulwq3jwozctvxzg2ib5j7n6axfneltznnqi453np@npbx44uvccdd>
References: <20250610090714.3321129-1-christian.bruel@foss.st.com>
 <20250610090714.3321129-8-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250610090714.3321129-8-christian.bruel@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 shradha.t@samsung.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org,
 thippeswamy.havalige@amd.com, linux-kernel@vger.kernel.org, cassel@kernel.org,
 devicetree@vger.kernel.org, quic_schintav@quicinc.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 bhelgaas@google.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, johan+linaro@kernel.org,
 kwilczynski@kernel.org
Subject: Re: [Linux-stm32] [PATCH v12 7/9] arm64: dts: st: Add PCIe Root
 Complex mode on stm32mp251
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

T24gVHVlLCBKdW4gMTAsIDIwMjUgYXQgMTE6MDc6MTJBTSArMDIwMCwgQ2hyaXN0aWFuIEJydWVs
IHdyb3RlOgo+IEFkZCBwY2llX3JjIG5vZGUgdG8gc3VwcG9ydCBTVE0zMiBNUDI1IFBDSWUgZHJp
dmVyIGJhc2VkIG9uIHRoZQo+IERlc2lnbldhcmUgUENJZSBjb3JlIGNvbmZpZ3VyZWQgYXMgUm9v
dCBDb21wbGV4IG1vZGUKPiAKPiBTdXBwb3J0cyBHZW4xL0dlbjIsIHNpbmdsZSBsYW5lLCBNU0kg
aW50ZXJydXB0cyB1c2luZyB0aGUgQVJNIEdJQ3YybQo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlz
dGlhbiBCcnVlbCA8Y2hyaXN0aWFuLmJydWVsQGZvc3Muc3QuY29tPgoKQWNrZWQtYnk6IE1hbml2
YW5uYW4gU2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPgoKLSBNYW5pCgo+IC0tLQo+ICBhcmNo
L2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaSB8IDQ0ICsrKysrKysrKysrKysrKysr
KysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpIGIvYXJjaC9hcm02
NC9ib290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kKPiBpbmRleCA4ZDg3ODY1ODUwYTcuLjc4MWQw
ZTQzYWI1OSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEu
ZHRzaQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpCj4gQEAg
LTEyMiw2ICsxMjIsMTUgQEAgaW50YzogaW50ZXJydXB0LWNvbnRyb2xsZXJANGFjMDAwMDAgewo+
ICAJCSAgICAgIDwweDAgMHg0YWMyMDAwMCAweDAgMHgyMDAwMD4sCj4gIAkJICAgICAgPDB4MCAw
eDRhYzQwMDAwIDB4MCAweDIwMDAwPiwKPiAgCQkgICAgICA8MHgwIDB4NGFjNjAwMDAgMHgwIDB4
MjAwMDA+Owo+ICsJCSNhZGRyZXNzLWNlbGxzID0gPDI+Owo+ICsJCSNzaXplLWNlbGxzID0gPDI+
Owo+ICsJCXJhbmdlczsKPiArCj4gKwkJdjJtMDogdjJtQDQ4MDkwMDAwIHsKPiArCQkJY29tcGF0
aWJsZSA9ICJhcm0sZ2ljLXYybS1mcmFtZSI7Cj4gKwkJCXJlZyA9IDwweDAgMHg0ODA5MDAwMCAw
eDAgMHgxMDAwPjsKPiArCQkJbXNpLWNvbnRyb2xsZXI7Cj4gKwkJfTsKPiAgCX07Cj4gIAo+ICAJ
cHNjaSB7Cj4gQEAgLTExMzAsNiArMTEzOSw0MSBAQCBzdG1tYWNfYXhpX2NvbmZpZ18xOiBzdG1t
YWMtYXhpLWNvbmZpZyB7Cj4gIAkJCQkJc25wcyx3cl9vc3JfbG10ID0gPDB4Nz47Cj4gIAkJCQl9
Owo+ICAJCQl9Owo+ICsKPiArCQkJcGNpZV9yYzogcGNpZUA0ODQwMDAwMCB7Cj4gKwkJCQljb21w
YXRpYmxlID0gInN0LHN0bTMybXAyNS1wY2llLXJjIjsKPiArCQkJCWRldmljZV90eXBlID0gInBj
aSI7Cj4gKwkJCQlyZWcgPSA8MHg0ODQwMDAwMCAweDQwMDAwMD4sCj4gKwkJCQkgICAgICA8MHgx
MDAwMDAwMCAweDEwMDAwPjsKPiArCQkJCXJlZy1uYW1lcyA9ICJkYmkiLCAiY29uZmlnIjsKPiAr
CQkJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8MT47Cj4gKwkJCQlpbnRlcnJ1cHQtbWFwLW1hc2sgPSA8
MCAwIDAgNz47Cj4gKwkJCQlpbnRlcnJ1cHQtbWFwID0gPDAgMCAwIDEgJmludGMgMCAwIEdJQ19T
UEkgMjY0IElSUV9UWVBFX0xFVkVMX0hJR0g+LAo+ICsJCQkJCQk8MCAwIDAgMiAmaW50YyAwIDAg
R0lDX1NQSSAyNjUgSVJRX1RZUEVfTEVWRUxfSElHSD4sCj4gKwkJCQkJCTwwIDAgMCAzICZpbnRj
IDAgMCBHSUNfU1BJIDI2NiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKPiArCQkJCQkJPDAgMCAwIDQg
JmludGMgMCAwIEdJQ19TUEkgMjY3IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+ICsJCQkJI2FkZHJl
c3MtY2VsbHMgPSA8Mz47Cj4gKwkJCQkjc2l6ZS1jZWxscyA9IDwyPjsKPiArCQkJCXJhbmdlcyA9
IDwweDAxMDAwMDAwIDB4MCAweDAwMDAwMDAwIDB4MTAwMTAwMDAgMHgwIDB4MTAwMDA+LAo+ICsJ
CQkJCSA8MHgwMjAwMDAwMCAweDAgMHgxMDAyMDAwMCAweDEwMDIwMDAwIDB4MCAweDdmZTAwMDA+
LAo+ICsJCQkJCSA8MHg0MjAwMDAwMCAweDAgMHgxODAwMDAwMCAweDE4MDAwMDAwIDB4MCAweDgw
MDAwMDA+Owo+ICsJCQkJZG1hLXJhbmdlcyA9IDwweDQyMDAwMDAwIDB4MCAweDgwMDAwMDAwIDB4
ODAwMDAwMDAgMHgwIDB4ODAwMDAwMDA+Owo+ICsJCQkJY2xvY2tzID0gPCZyY2MgQ0tfQlVTX1BD
SUU+Owo+ICsJCQkJcmVzZXRzID0gPCZyY2MgUENJRV9SPjsKPiArCQkJCW1zaS1wYXJlbnQgPSA8
JnYybTA+Owo+ICsJCQkJYWNjZXNzLWNvbnRyb2xsZXJzID0gPCZyaWZzYyA2OD47Cj4gKwkJCQlw
b3dlci1kb21haW5zID0gPCZDTFVTVEVSX1BEPjsKPiArCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7
Cj4gKwo+ICsJCQkJcGNpZUAwLDAgewo+ICsJCQkJCWRldmljZV90eXBlID0gInBjaSI7Cj4gKwkJ
CQkJcmVnID0gPDB4MCAweDAgMHgwIDB4MCAweDA+Owo+ICsJCQkJCXBoeXMgPSA8JmNvbWJvcGh5
IFBIWV9UWVBFX1BDSUU+Owo+ICsJCQkJCSNhZGRyZXNzLWNlbGxzID0gPDM+Owo+ICsJCQkJCSNz
aXplLWNlbGxzID0gPDI+Owo+ICsJCQkJCXJhbmdlczsKPiArCQkJCX07Cj4gKwkJCX07Cj4gIAkJ
fTsKPiAgCj4gIAkJYnNlYzogZWZ1c2VANDQwMDAwMDAgewo+IC0tIAo+IDIuMzQuMQo+IAoKLS0g
CuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
