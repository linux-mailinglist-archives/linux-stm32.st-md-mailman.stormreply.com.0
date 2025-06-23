Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A16AE3F6D
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jun 2025 14:15:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E957FC32E8D;
	Mon, 23 Jun 2025 12:15:16 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E434C36B2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jun 2025 12:15:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C32735C5660;
 Mon, 23 Jun 2025 12:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14247C4CEEA;
 Mon, 23 Jun 2025 12:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750680914;
 bh=e99veYZUy79gCMXBdhcBd8vV/Ca+YIYh9vr/jO7tfPk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oDPRAB8x+L31MY/qA3EPZ/FsPe6E2LBHxsMfdHLpdaY9n1XFZRtyJBHYiW9RbRkcw
 kt3nTgv4WTwMg1LQZ/wVpsbsRM1V4C1ibRrLhIlyVypVleKAhgYbakE6NzYT8cVJ9h
 NB9TkI45eC+fxRHLIME/Sca94oRKSxuADXO0z8yIITHsWcjikKJuk/SOq1texRQtU8
 QnNLBieQM7tKdYlhuNSkdJ0zDF4/5emPgaGe4u144tzUTGoPQAqpnsekIuauSEMaTa
 hrWALF12f9AiP6XJKNMGeGzb2Bj8r7fr6QicvBJmFsA7wWRS6SUCGVORSsjyODlhve
 B+h6cu+xb/sLA==
Date: Mon, 23 Jun 2025 06:15:12 -0600
From: Manivannan Sadhasivam <mani@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <de275zjaafymohqbcao5tvk2bul5f3fvqgsla4yjfvvueg75yz@dpqh2vs3t6kg>
References: <20250610090714.3321129-1-christian.bruel@foss.st.com>
 <20250610090714.3321129-9-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250610090714.3321129-9-christian.bruel@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 shradha.t@samsung.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org,
 thippeswamy.havalige@amd.com, linux-kernel@vger.kernel.org, cassel@kernel.org,
 devicetree@vger.kernel.org, quic_schintav@quicinc.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 bhelgaas@google.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, johan+linaro@kernel.org,
 kwilczynski@kernel.org
Subject: Re: [Linux-stm32] [PATCH v12 8/9] arm64: dts: st: Add PCIe Endpoint
 mode on stm32mp251
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

T24gVHVlLCBKdW4gMTAsIDIwMjUgYXQgMTE6MDc6MTNBTSArMDIwMCwgQ2hyaXN0aWFuIEJydWVs
IHdyb3RlOgo+IEFkZCBwY2llX2VwIG5vZGUgdG8gc3VwcG9ydCBTVE0zMiBNUDI1IFBDSWUgZHJp
dmVyIGJhc2VkIG9uIHRoZQo+IERlc2lnbldhcmUgUENJZSBjb3JlIGNvbmZpZ3VyZWQgYXMgRW5k
cG9pbnQgbW9kZQo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBCcnVlbCA8Y2hyaXN0aWFu
LmJydWVsQGZvc3Muc3QuY29tPgoKQWNrZWQtYnk6IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFu
aUBrZXJuZWwub3JnPgoKLSBNYW5pCgo+IC0tLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0
bTMybXAyNTEuZHRzaSB8IDE1ICsrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTUg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0
bTMybXAyNTEuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpCj4g
aW5kZXggNzgxZDBlNDNhYjU5Li4yM2RjYzg4OWMzZTggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02
NC9ib290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L3N0L3N0bTMybXAyNTEuZHRzaQo+IEBAIC0xMTQwLDYgKzExNDAsMjEgQEAgc3RtbWFjX2F4aV9j
b25maWdfMTogc3RtbWFjLWF4aS1jb25maWcgewo+ICAJCQkJfTsKPiAgCQkJfTsKPiAgCj4gKwkJ
CXBjaWVfZXA6IHBjaWUtZXBANDg0MDAwMDAgewo+ICsJCQkJY29tcGF0aWJsZSA9ICJzdCxzdG0z
Mm1wMjUtcGNpZS1lcCI7Cj4gKwkJCQlyZWcgPSA8MHg0ODQwMDAwMCAweDEwMDAwMD4sCj4gKwkJ
CQkgICAgICA8MHg0ODUwMDAwMCAweDEwMDAwMD4sCj4gKwkJCQkgICAgICA8MHg0ODcwMDAwMCAw
eDgwMDAwPiwKPiArCQkJCSAgICAgIDwweDEwMDAwMDAwIDB4MTAwMDAwMDA+Owo+ICsJCQkJcmVn
LW5hbWVzID0gImRiaSIsICJkYmkyIiwgImF0dSIsICJhZGRyX3NwYWNlIjsKPiArCQkJCWNsb2Nr
cyA9IDwmcmNjIENLX0JVU19QQ0lFPjsKPiArCQkJCXJlc2V0cyA9IDwmcmNjIFBDSUVfUj47Cj4g
KwkJCQlwaHlzID0gPCZjb21ib3BoeSBQSFlfVFlQRV9QQ0lFPjsKPiArCQkJCWFjY2Vzcy1jb250
cm9sbGVycyA9IDwmcmlmc2MgNjg+Owo+ICsJCQkJcG93ZXItZG9tYWlucyA9IDwmQ0xVU1RFUl9Q
RD47Cj4gKwkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICsJCQl9Owo+ICsKPiAgCQkJcGNpZV9y
YzogcGNpZUA0ODQwMDAwMCB7Cj4gIAkJCQljb21wYXRpYmxlID0gInN0LHN0bTMybXAyNS1wY2ll
LXJjIjsKPiAgCQkJCWRldmljZV90eXBlID0gInBjaSI7Cj4gLS0gCj4gMi4zNC4xCj4gCgotLSAK
4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
