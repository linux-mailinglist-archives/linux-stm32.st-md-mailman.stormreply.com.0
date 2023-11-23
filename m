Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5DD7F64FC
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Nov 2023 18:14:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B1E1C6B476;
	Thu, 23 Nov 2023 17:14:32 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10FC1C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 17:14:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9482B62357;
 Thu, 23 Nov 2023 17:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B13C433CC;
 Thu, 23 Nov 2023 17:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700759669;
 bh=trQue5vt4vNug0lKdIifZG1U/sc0mMPLn521Cnxbi8A=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=NOdAwhwfhaybbj5HEJr6Qhi+fejV93baYjH8jDhcjY3Nh2+cG5MNdp+wOq8pG0A5k
 ZwOATpEZ3Wy4bBea/ZwdMcxFWdtfm3LRS923s+zCT8yQtAJyYDBc+hBuUhwv3H2P8e
 H9UBVlNTtcfEWppuxCz1hHHrZbY350a2m94KnF/QzWsNnQdvtcoueMnqd5a3nOebPc
 91RDbDBj47fJdqzt1CXk3pha1EJmoujk/gcj8buNYkCmtGGiAPe+8u2NnqwHoyn+0A
 fsb0dLmm42ew0AnhAvgXCvL3Ir82fNE/RItduAYxSOLm3jwSTy2XC4/H2ZvnyRXlAT
 8RkgBnCtoX2mg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231123165627.492259-1-u.kleine-koenig@pengutronix.de>
References: <20231123165627.492259-1-u.kleine-koenig@pengutronix.de>
Message-Id: <170075966425.1458093.5482638425880756985.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 17:14:24 +0000
MIME-Version: 1.0
X-Mailer: b4 0.12.3
Cc: Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Guenter Roeck <groeck@chromium.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-omap@vger.kernel.org,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 00/18] mfd: Convert to platform remove
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

T24gVGh1LCAyMyBOb3YgMjAyMyAxNzo1NjoyOCArMDEwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
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
b3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogICAgICAgIGNvbW1pdDogMDVjZTE2
YzEzMDNhY2FmMjA5NGY1NWVhMjQ4ZmQwZDE0MTE5ZWQ4ZgpbMDIvMThdIG1mZDogY3Jvc19lY19k
ZXY6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAg
ICAgICAgY29tbWl0OiBjODZlMDgxODE3NGY1MDZlNzdkY2I3Y2EwMjUxZjE4MjY5ZDc5MjE5Clsw
My8xOF0gbWZkOiBleHlub3MtbHBhc3M6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxi
YWNrIHJldHVybmluZyB2b2lkCiAgICAgICAgY29tbWl0OiBlMzQ2OGUwM2E2M2U4YzI0YThiMmY5
Zjg0ZWQ4NDQzMjY4ZGNjY2Y0ClswNC8xOF0gbWZkOiBmc2wtaW14MjUtdHNhZGM6IENvbnZlcnQg
dG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgICAgICAgY29tbWl0
OiAwNWQ3OGRhNTMyZWRlZGJjMTE4ODljYTVhMjJiMzAyYWFhOGI5ZTFlClswNS8xOF0gbWZkOiBo
aTY1NXgtcG1pYzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5n
IHZvaWQKICAgICAgICBjb21taXQ6IDMwNDQxYzQ1NjE3MTcyM2Q0ZDQwZWE4NmZkYzc2NzVhNjMw
Y2I1ZjgKWzA2LzE4XSBtZmQ6IGludGVsLWxwc3MtYWNwaTogQ29udmVydCB0byBwbGF0Zm9ybSBy
ZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICAgICAgICBjb21taXQ6IDhiN2ZmZTE4ZWIw
YmY4NmIyMWQ1NThjNzM5Mjc5YTljYjM0OWI3OGQKWzA3LzE4XSBtZmQ6IGtlbXBsZC1jb3JlOiBD
b252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogICAgICAg
IGNvbW1pdDogNWM5ZDUyMjIzOTIwYTcwYmVjYmJkZjY3Y2NlMTkyOTE3Zjk5NzMxOQpbMDgvMThd
IG1mZDogbWNwLXNhMTF4MDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0
dXJuaW5nIHZvaWQKICAgICAgICBjb21taXQ6IDAwODJlMTQ1MTYzODAxMDAyYTI1N2MyY2JhZjI5
ODIxOTJhYjc2MWUKWzA5LzE4XSBtZmQ6IG14cy1scmFkYzogQ29udmVydCB0byBwbGF0Zm9ybSBy
ZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICAgICAgICBjb21taXQ6IGY5NzE0YWQyMWI4
YzAxZTY5NjRlMDYzODg1OGQzN2Y5NDFkYzE5YmEKWzEwLzE4XSBtZmQ6IG9tYXAtdXNiLWhvc3Q6
IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgICAg
ICAgY29tbWl0OiA3ZTVlODI4ZTFmZWY2MDY3M2MyMGI0NzU3MzA1NGVhYTAzNmQxOTgwClsxMS8x
OF0gbWZkOiBvbWFwLXVzYi10bGw6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNr
IHJldHVybmluZyB2b2lkCiAgICAgICAgY29tbWl0OiA2ZWUwZTE4NDRjOTE3ZmI0ZTVmMzE0YWVj
MmI3ODBmMTY0MTM3NWYwClsxMi8xOF0gbWZkOiBwY2Y1MDYzMy1hZGM6IENvbnZlcnQgdG8gcGxh
dGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgICAgICAgY29tbWl0OiAzZTZl
Y2NhY2E2OTIzZThkMWFjNGEwOTEzYjMzNjdiNWFiOTRmOTVjClsxMy8xOF0gbWZkOiBxY29tLXBt
OHh4eDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQK
ICAgICAgICBjb21taXQ6IDMxYjg5NWYyNTI4YmRhNGRiNTI2ZGVlMTk0MmY5MTVmOGYzNDA5MWIK
WzE0LzE4XSBtZmQ6IHNtNTAxOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayBy
ZXR1cm5pbmcgdm9pZAogICAgICAgIGNvbW1pdDogNjlmYmFkMjIyYzVjYWFkMzRmNzc3ZGEzMzI3
MWNjZGFkM2Q5NTA0YwpbMTUvMThdIG1mZDogc3RtMzItdGltZXJzOiBDb252ZXJ0IHRvIHBsYXRm
b3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogICAgICAgIGNvbW1pdDogNTk1Njli
YzM2ZmNlYzFjZDYyYmQyZjYzOTc4NDEyNmM4N2M2ZmQxZQpbMTYvMThdIG1mZDogdGlfYW0zMzV4
X3RzY2FkYzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZv
aWQKICAgICAgICBjb21taXQ6IDFkYmUxM2JhY2EzMzg1MDJiZjc0MWJiZTNiMTk5YzA3YzdkMWM1
YmMKWzE3LzE4XSBtZmQ6IHRwczY1OTExLWNvbXBhcmF0b3I6IENvbnZlcnQgdG8gcGxhdGZvcm0g
cmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgICAgICAgY29tbWl0OiA0YWE3MmM4NTE1
NzM0YzJlZGY0YzZjMjY0YWVlNDkyNWVmZDk3MzY2ClsxOC8xOF0gbWZkOiB0d2w0MDMwLWF1ZGlv
OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogICAg
ICAgIGNvbW1pdDogZGIxZTBiMDcyZGExODlkYjk5ZjkwNWI3NTg2NzZhODFiYjc5NmExYQoKLS0K
TGVlIEpvbmVzIFvmnY7nkLzmlq9dCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
