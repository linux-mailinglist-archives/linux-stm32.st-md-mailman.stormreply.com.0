Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDDC6EC840
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Apr 2023 11:02:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 924D7C69065;
	Mon, 24 Apr 2023 09:02:46 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02FAAC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Apr 2023 09:02:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 90AE7611E9;
 Mon, 24 Apr 2023 09:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A3AEC4339B;
 Mon, 24 Apr 2023 09:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682326964;
 bh=7PMDGeXSIA4xpQ4z12bcfa13T7cz2MOCf+dV/Dvx/t4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=meA08bwNKARH7U+9bvRTo4znk7kSyMU2jNQcpFYqK+NH2V4lJIA/QoFttVdl2HpSc
 /n3QUCwr9CQgJJAZ01SG8xsGndvZODzb5TGLBRcJUmh6P5dJfm0CFhtc3Q/oBMA58V
 KxdbGLmTcc0nBUSYxOUmCdSGkwHKTmPqzotr254d/F+4UzNykSCa5fDNqNLwcVSH3e
 /Ucbf8N39gXjzetLHcwSR7DlFDhUbZVB0g14WGjcRABemcm6xAaQ4EzVsWW8kZWuID
 ghaWIYn4iY5WNW8QO+tKysTi2q6kDXs+j51vQnGi25kdBXvrua5752JD0RrNyEYEal
 0nPT0fkDXmhVA==
Date: Mon, 24 Apr 2023 10:02:29 +0100
From: Lee Jones <lee@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230424090229.GB8035@google.com>
References: <20230423172528.1398158-1-dario.binacchi@amarulasolutions.com>
 <20230423172528.1398158-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230423172528.1398158-2-dario.binacchi@amarulasolutions.com>
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: mfd: stm32f7: add
 binding definition for CAN3
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

T24gU3VuLCAyMyBBcHIgMjAyMywgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cgo+IEFkZCBiaW5kaW5n
IGRlZmluaXRpb24gZm9yIENBTjMgcGVyaXBoZXJhbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXJp
byBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gLS0tCj4g
Cj4gIGluY2x1ZGUvZHQtYmluZGluZ3MvbWZkL3N0bTMyZjctcmNjLmggfCAxICsKPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpBcHBsaWVkLCB0aGFua3MKCi0tIApMZWUgSm9uZXMg
W+adjueQvOaWr10KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
