Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C61987834A8
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Aug 2023 23:09:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66435C6B44B;
	Mon, 21 Aug 2023 21:09:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 856BDC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 21:09:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4F82964BC3;
 Mon, 21 Aug 2023 21:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCB4C433C8;
 Mon, 21 Aug 2023 21:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692652162;
 bh=RSs/K1RGWpTDgXycVMeH8t5ATjuA68n/VvoYZujJIvA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Ki8vk72TwrLCcwVhG+lbpfRg0WxFA1e5JjT1cR8co7mZ6W2GW+X2fSorlHJz8mH+S
 +50lStVFCI7OXNDtLvBkLUSB/3zGhBGRFh9gDBmOe5k3vzGBCSUH6dwCzuUKEWaBpL
 gUPeuyOegSeLw89Avmy61Cuxt1wo8CaljtqFEow+lpjheu2QsksQ9OoQTDst6ByQrC
 ZCZb98g3XGXqpYBttg8rm/OFlyNmyV0mRAUpqtfzXhlqgFyEPjmRC+si3DhHOmJXsi
 qnjufIvTyYKnqnzosicM+k2kmv3D7VaJbQ5zJlAB7BkLR+BgJrH85UP8poYp9+syax
 H1Txzg2HNqy7g==
From: Mark Brown <broonie@kernel.org>
To: valentin.caron@foss.st.com, Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>
In-Reply-To: <20230816145237.3159817-1-l.goehrs@pengutronix.de>
References: <20230816145237.3159817-1-l.goehrs@pengutronix.de>
Message-Id: <169265215965.467713.8072981996743958072.b4-ty@kernel.org>
Date: Mon, 21 Aug 2023 22:09:19 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-034f2
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: fix accidential revert to
 byte-sized transfer splitting
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

T24gV2VkLCAxNiBBdWcgMjAyMyAxNjo1MjozNyArMDIwMCwgTGVvbmFyZCBHw7ZocnMgd3JvdGU6
Cj4gQ29tbWl0IDZmNDg2NTU2YWJlMzUgKCJzcGk6IHN0bTMyOiByZW5hbWluZyBvZiBzcGlfbWFz
dGVyIGludG8KPiBzcGlfY29udHJvbGxlciIpIGluY2x1ZGVkIGFuIGFjY2lkZW50aWFsIHJldmVy
dGVkIG9mIGEgY2hhbmdlIGFkZGVkIGluCj4gY29tbWl0IDFlNDkyOTExMjUwN2YgKCJzcGk6IHN0
bTMyOiBzcGxpdCBsYXJnZSB0cmFuc2ZlcnMgYmFzZWQgb24gd29yZAo+IHNpemUgaW5zdGVhZCBv
ZiBieXRlcyIpLgo+IAo+IFRoaXMgYnJlYWtzIGxhcmdlIFNQSSB0cmFuc2ZlcnMgd2l0aCB3b3Jk
IHNpemVzID4gOCBiaXRzLCB3aGljaCBhcmUKPiBlLmcuIGNvbW1vbiB3aGVuIGRyaXZpbmcgTUlQ
SSBEQkkgZGlzcGxheXMuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8KCiAgIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Jyb29uaWUvc3BpLmdpdCBmb3ItbmV4
dAoKVGhhbmtzIQoKWzEvMV0gc3BpOiBzdG0zMjogZml4IGFjY2lkZW50aWFsIHJldmVydCB0byBi
eXRlLXNpemVkIHRyYW5zZmVyIHNwbGl0dGluZwogICAgICBjb21taXQ6IDcxNWRjOWExZjBjOGFl
MGJiZDRlNWIzN2Y5YTE2NWVhMzllNDdmZTkKCkFsbCBiZWluZyB3ZWxsIHRoaXMgbWVhbnMgdGhh
dCBpdCB3aWxsIGJlIGludGVncmF0ZWQgaW50byB0aGUgbGludXgtbmV4dAp0cmVlICh1c3VhbGx5
IHNvbWV0aW1lIGluIHRoZSBuZXh0IDI0IGhvdXJzKSBhbmQgc2VudCB0byBMaW51cyBkdXJpbmcK
dGhlIG5leHQgbWVyZ2Ugd2luZG93IChvciBzb29uZXIgaWYgaXQgaXMgYSBidWcgZml4KSwgaG93
ZXZlciBpZgpwcm9ibGVtcyBhcmUgZGlzY292ZXJlZCB0aGVuIHRoZSBwYXRjaCBtYXkgYmUgZHJv
cHBlZCBvciByZXZlcnRlZC4KCllvdSBtYXkgZ2V0IGZ1cnRoZXIgZS1tYWlscyByZXN1bHRpbmcg
ZnJvbSBhdXRvbWF0ZWQgb3IgbWFudWFsIHRlc3RpbmcKYW5kIHJldmlldyBvZiB0aGUgdHJlZSwg
cGxlYXNlIGVuZ2FnZSB3aXRoIHBlb3BsZSByZXBvcnRpbmcgcHJvYmxlbXMgYW5kCnNlbmQgZm9s
bG93dXAgcGF0Y2hlcyBhZGRyZXNzaW5nIGFueSBpc3N1ZXMgdGhhdCBhcmUgcmVwb3J0ZWQgaWYg
bmVlZGVkLgoKSWYgYW55IHVwZGF0ZXMgYXJlIHJlcXVpcmVkIG9yIHlvdSBhcmUgc3VibWl0dGlu
ZyBmdXJ0aGVyIGNoYW5nZXMgdGhleQpzaG91bGQgYmUgc2VudCBhcyBpbmNyZW1lbnRhbCB1cGRh
dGVzIGFnYWluc3QgY3VycmVudCBnaXQsIGV4aXN0aW5nCnBhdGNoZXMgd2lsbCBub3QgYmUgcmVw
bGFjZWQuCgpQbGVhc2UgYWRkIGFueSByZWxldmFudCBsaXN0cyBhbmQgbWFpbnRhaW5lcnMgdG8g
dGhlIENDcyB3aGVuIHJlcGx5aW5nCnRvIHRoaXMgbWFpbC4KClRoYW5rcywKTWFyawoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
