Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2376918644
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2024 17:53:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C0A2C71282;
	Wed, 26 Jun 2024 15:53:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57F70C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 15:53:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2994361B4E;
 Wed, 26 Jun 2024 15:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48260C32782;
 Wed, 26 Jun 2024 15:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719417212;
 bh=r772ve6fEKb5xT9xB+p3eyAPvGiazB97zwy8oaMSQu4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kjrD7A0BZQbRq2yWERkKrHNh7DxbHZSrxtEB2u2iuusIq2gX1oum5APB0WMfxKQIw
 nahw/1R4mSnNdJeenb9HlOefZ0mwCvdSUQ10l1+OU4MlLGPgJ78qT62Kd6eFcMPQmh
 ocuZIy7yQQrPzNc+o0dL7JtACdSMsaEXplIWZEsgp3+0WLe7+BkolI42pvL/E/dQqN
 76THtNDDc3SHEwe0yjxczntC2/MvFXNZEK2jPyk8Ls5FegpNHwcke73cQ6kpAYq+6Y
 1oisBZHO92E8uReExnYSMlchhnhLSB/lZytvf5wD1dd9phov+5bIMqxzmHef2dQW21
 eb7ij9oQPKm0w==
From: Lee Jones <lee@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Etienne Carriere <etienne.carriere@foss.st.com>
In-Reply-To: <20240617092016.2958046-1-etienne.carriere@foss.st.com>
References: <20240617092016.2958046-1-etienne.carriere@foss.st.com>
Message-Id: <171941721004.2530174.778562710266249921.b4-ty@kernel.org>
Date: Wed, 26 Jun 2024 16:53:30 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Lee Jones <lee@kernel.org>,
 Pascal Paillet <p.paillet@st.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] (subset) [PATCH v2] dt-bindings: mfd: dual
 licensing for st, stpmic1 bindings
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

T24gTW9uLCAxNyBKdW4gMjAyNCAxMToyMDoxNiArMDIwMCwgRXRpZW5uZSBDYXJyaWVyZSB3cm90
ZToKPiBDaGFuZ2UgaW5jbHVkZS9kdC1iaW5kaW5ncy9tZmQvc3Qsc3RwbWljMS5oIGxpY2Vuc2Ug
bW9kZWwgZnJvbSBHUEx2Mi4wCj4gb25seSB0byBkdWFsIEdQTHYyLjAgb3IgQlNELTItQ2xhdXNl
LiBJIGhhdmUgZXZlcnkgbGVnaXRpbWFjeSB0byByZXF1ZXN0Cj4gdGhpcyBjaGFuZ2Ugb24gYmVo
YWxmIG9mIFNUTWljcm9lbGVjdHJvbmljcy4gVGhpcyBjaGFuZ2UgY2xhcmlmaWVzIHRoYXQKPiB0
aGlzIERUIGJpbmRpbmcgaGVhZGVyIGZpbGUgY2FuIGJlIHNoYXJlZCB3aXRoIHNvZnR3YXJlIGNv
bXBvbmVudHMgYXMKPiBib290bG9hZGVycyBhbmQgT1NlcyB0aGF0IGFyZSBub3QgcHVibGlzaGVk
IHVuZGVyIEdQTHYyIHRlcm1zLgo+IAo+IEluIENDIGFyZSBhbGwgdGhlIGNvbnRyaWJ1dG9ycyB0
byB0aGlzIGhlYWRlciBmaWxlLgo+IAo+IFsuLi5dCgpBcHBsaWVkLCB0aGFua3MhCgpbMS8xXSBk
dC1iaW5kaW5nczogbWZkOiBkdWFsIGxpY2Vuc2luZyBmb3Igc3Qsc3RwbWljMSBiaW5kaW5ncwog
ICAgICBjb21taXQ6IGZjZDg2NDZjYTZiMjM5YWEzNzUyYzBiYTgxOGE0Y2RhMjllZTI2ODYKCi0t
CkxlZSBKb25lcyBb5p2O55C85pavXQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
