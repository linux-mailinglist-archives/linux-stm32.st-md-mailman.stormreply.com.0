Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6975A7F6130
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Nov 2023 15:13:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C58CC6B476;
	Thu, 23 Nov 2023 14:13:52 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42CF1C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 14:13:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 8DD36B82CDF;
 Thu, 23 Nov 2023 14:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D3AC433CA;
 Thu, 23 Nov 2023 14:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700748828;
 bh=AGcHXRfH/rMMp6hJ33VbDXNVCM278y+An/5lGPmz0s0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZyD0Tn94bo2vGeCq3N2ptlQvcAkslri04FYrRMwqbePwZ+mrHfj44rJe0x8L7Fwce
 nM70shIvtFAyssZZAbSm2yjkuolfpX77ONc+iFzORXqg6uf2+diIauo4Dp2dpWdFxM
 ZsFDThS7tkHIQHJaEDHKac4rgQkJbk8zm2KknhNQIMt0dk7iTD4FpPyFr4fcGnvYoq
 X10nmPcEwialBwZ3BDmP2Rt3cXsLBgf17igT9eEH9QEmw2wx4BRe5epvm4wuSoUyQu
 MxupRq4LoE4MP56WgzXG1SgKmztvRgpQgIi2+nTIqHFDsXcGurZph1gmaFL2siUG7X
 0R8Dzf1MUawjA==
From: Lee Jones <lee@kernel.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231106171708.3892347-1-u.kleine-koenig@pengutronix.de>
References: <20231106171708.3892347-1-u.kleine-koenig@pengutronix.de>
Message-Id: <170074882434.1350828.3000645128153974049.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 14:13:44 +0000
MIME-Version: 1.0
X-Mailer: b4 0.12.3
Cc: Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Guenter Roeck <groeck@chromium.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-omap@vger.kernel.org,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 00/18] mfd: Convert to platform remove
 callback returning void
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

T24gTW9uLCAwNiBOb3YgMjAyMyAxODoxNzowOSArMDEwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6Cj4gdGhpcyBzZXJpZXMgY29udmVydHMgYWxsIHBsYXRmb3JtIGRyaXZlcnMgYmVsb3cgZHJp
dmVycy9tZmQgdG8gdXNlCj4gLnJlbW92ZV9uZXcoKS4gQ29tcGFyZWQgdG8gdGhlIHRyYWRpdGlv
bmFsIC5yZW1vdmUoKSBjYWxsYmFjawo+IC5yZW1vdmVfbmV3KCkgcmV0dXJucyBubyB2YWx1ZS4g
VGhpcyBpcyBhIGdvb2QgdGhpbmcgYmVjYXVzZSB0aGUgZHJpdmVyCj4gY29yZSBkb2Vzbid0IChh
bmQgY2Fubm90KSBjb3BlIGZvciBlcnJvcnMgZHVyaW5nIHJlbW92ZS4gVGhlIG9ubHkgZWZmZWN0
Cj4gb2YgYSBub24temVybyByZXR1cm4gdmFsdWUgaW4gLnJlbW92ZSgpIGlzIHRoYXQgdGhlIGRy
aXZlciBjb3JlIGVtaXRzIGEKPiB3YXJuaW5nLiBUaGUgZGV2aWNlIGlzIHJlbW92ZWQgYW55aG93
IGFuZCBhbiBlYXJseSByZXR1cm4gZnJvbSAucmVtb3ZlKCkKPiB1c3VhbGx5IHlpZWxkcyByZXNv
dXJjZSBsZWFrcyBhbmQvb3IgdXNlLWFmdGVyLWZyZWUgYnVncy4KPiAKPiBbLi4uXQoKQXBwbGll
ZCwgdGhhbmtzIQoKWzAxLzE4XSBtZmQ6IGFiODUwMC1zeXNjdHJsOiBDb252ZXJ0IHRvIHBsYXRm
b3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogICAgICAgIGNvbW1pdDogMzVjZjM0
NmY5ZmE5MmNlYjE5YzVkMmVkYzQ0MDlhN2QzODRkYThlZQpbMDIvMThdIG1mZDogY3Jvc19lY19k
ZXY6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAg
ICAgICAgY29tbWl0OiA5ODFjOTJhMWQ2NWE3Y2NjZTJkODE0YzY2ZmYyZGVlY2NhMzA0NjcyClsw
My8xOF0gbWZkOiBleHlub3MtbHBhc3M6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxi
YWNrIHJldHVybmluZyB2b2lkCiAgICAgICAgY29tbWl0OiAyZDg1OWFhOGUwODE4ODRjMGMwMmQ3
Mzg5MjVjYmEyM2E4Y2ZiMWI4ClswNC8xOF0gbWZkOiBmc2wtaW14MjUtdHNhZGM6IENvbnZlcnQg
dG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgICAgICAgY29tbWl0
OiBmMjE1Yjc1YWNjODUyNTRhMjk0MDRiMzJjODcxYjdmZjJlYThkYTJhClswOS8xOF0gbWZkOiBt
eHMtbHJhZGM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2
b2lkCiAgICAgICAgY29tbWl0OiBiZWIxZjllNjM4MmY1OTMzOWUxMTg1OTRjOTRlZTZiNWFjOTZm
M2VjClsxMC8xOF0gbWZkOiBvbWFwLXVzYi1ob3N0OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92
ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogICAgICAgIGNvbW1pdDogMjMxOTI3ODk4YWU5MTA0
OWFhMzVkMjM3YzU1NmNjMjE2ZDgwZThmNwpbMTEvMThdIG1mZDogb21hcC11c2ItdGxsOiBDb252
ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogICAgICAgIGNv
bW1pdDogODNkNGUzNTUyNDAxNDdkYjc1OTdlYTFjZTY0NjI0ZmNkYWFlZTZhZQpbMTMvMThdIG1m
ZDogcWNvbS1wbTh4eHg6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVy
bmluZyB2b2lkCiAgICAgICAgY29tbWl0OiBhZTNiY2Q1YjA5ZTM1ZjM2M2FhMTc0NGQzOGY5MGZk
YTJiNDBlOWNhClsxNS8xOF0gbWZkOiBzdG0zMi10aW1lcnM6IENvbnZlcnQgdG8gcGxhdGZvcm0g
cmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgICAgICAgY29tbWl0OiBhZWViYzQ3Zjhk
NDc5YzM2M2UyNGZiYTAyMDFlZjhkY2E0MTdmZTZlClsxOC8xOF0gbWZkOiB0d2w0MDMwLWF1ZGlv
OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogICAg
ICAgIGNvbW1pdDogMzcxNjk3OGI1ODRhOGJhYWJhMTZkNjRjOTNlYjBmZWQwZWRjYmMzYgoKLS0K
TGVlIEpvbmVzIFvmnY7nkLzmlq9dCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
