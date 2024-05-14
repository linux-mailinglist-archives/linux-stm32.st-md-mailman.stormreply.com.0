Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEBC8C4A83
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2024 02:40:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8B73C6B476;
	Tue, 14 May 2024 00:40:43 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3D8AC640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2024 00:40:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B8940CE10C8;
 Tue, 14 May 2024 00:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E908AC32781;
 Tue, 14 May 2024 00:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715647231;
 bh=93n0YB5LyuStAJQCV97FzZlYnXBJBJnFNuQFhpwqgUg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Y3R/oS7CelvSJjiGRbUYW0K3tTmD6WxGxsVSkpWnpXYoAOjcKZl4btM0HUThza2le
 hcwU2XonmUY5W5XsN4x0lYg50gj5wBh8Q3NxemDvgrn/6Gp/3F3NSuHdCNPAdbU2Ot
 YXCeFiZSRhqzxXa4kfQAEQEL0pAHY0fT/fNXlq/0TOpwLUqOHRDGFj08xaBYrZ2eBc
 yJgAWLD6nztNlG2kGwIF1MjF36GE5cMmYVGdTVdfuHy6KQ+lRNimUYmjv/mbygHnWO
 T4xQ2Gl5nP/coZ9Ys/E8UDB6eRhFN0nksAP7aNr6uwYjr8CF8wLkRK3zSU2YYI9rf9
 reY0tk1AOa/+g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D5F95C43443; Tue, 14 May 2024 00:40:30 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171564723087.24946.4336582223559029417.git-patchwork-notify@kernel.org>
Date: Tue, 14 May 2024 00:40:30 +0000
References: <20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com>
In-Reply-To: <20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: krzysztof.kozlowski+dt@linaro.org, geert+renesas@glider.be,
 edumazet@google.com, thomas.petazzoni@bootlin.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 magnus.damm@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 kuba@kernel.org, pabeni@redhat.com, clement.leger@bootlin.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, rmk+kernel@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, fancer.lancer@gmail.com,
 linux-renesas-soc@vger.kernel.org, mcoquelin.stm32@gmail.com,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v7 0/7] net: stmmac: Add support
 for RZN1 GMAC devices
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

SGVsbG86CgpUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byBuZXRkZXYvbmV0LW5leHQuZ2l0ICht
YWluKQpieSBKYWt1YiBLaWNpbnNraSA8a3ViYUBrZXJuZWwub3JnPjoKCk9uIE1vbiwgMTMgTWF5
IDIwMjQgMDk6MjU6MTEgKzAyMDAgeW91IHdyb3RlOgo+IEhlbGxvIGV2ZXJ5b25lLAo+IAo+IFRo
aXMgaXMgdmVyc2lvbiBzZXZlbiBvZiBteSBzZXJpZXMgdGhhdCBhZGRzIHN1cHBvcnQgZm9yIGEg
R2lnYWJpdCBFdGhlcm5ldAo+IGNvbnRyb2xsZXIgZmVhdHVyZWQgaW4gdGhlIFJlbmVzYXMgcjlh
MDZnMDMyIFNvQywgb2YgdGhlIFJaL04xIGZhbWlseS4gVGhpcwo+IEdNQUMgZGV2aWNlIGlzIGJh
c2VkIG9uIGEgU3lub3BzeXMgSVAgYW5kIGlzIGNvbXBhdGlibGUgd2l0aCB0aGUgc3RtbWFjIGRy
aXZlci4KPiAKPiBNeSBmb3JtZXIgY29sbGVhZ3VlIENsw6ltZW50IEzDqWdlciBvcmlnaW5hbGx5
IHNlbnQgYSBzZXJpZXMgZm9yIHRoaXMgZHJpdmVyLAo+IGJ1dCBhbiBpc3N1ZSBpbiBicmluZ2lu
ZyB1cCB0aGUgUENTIGNsb2NrIGhhZCBibG9ja2VkIHRoZSB1cHN0cmVhbWluZwo+IHByb2Nlc3Mu
IFRoaXMgaXNzdWUgaGFzIHNpbmNlIGJlZW4gcmVzb2x2ZWQgYnkgdGhlIGZvbGxvd2luZyBzZXJp
ZXM6Cj4gCj4gWy4uLl0KCkhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKICAtIFtuZXQt
bmV4dCx2NywxLzddIGR0LWJpbmRpbmdzOiBuZXQ6IHJlbmVzYXMscnpuMS1nbWFjOiBEb2N1bWVu
dCBSWi9OMSBHTUFDIHN1cHBvcnQKICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvbmV0ZGV2L25l
dC1uZXh0L2MvYWI1NTg4NzAzOTgxCiAgLSBbbmV0LW5leHQsdjcsMi83XSBuZXQ6IHN0bW1hYzog
QWRkIGRlZGljYXRlZCBYUENTIGNsZWFudXAgbWV0aG9kCiAgICBodHRwczovL2dpdC5rZXJuZWwu
b3JnL25ldGRldi9uZXQtbmV4dC9jL2Q1YzUwOTM3ZDUwZgogIC0gW25ldC1uZXh0LHY3LDMvN10g
bmV0OiBzdG1tYWM6IE1ha2Ugc3RtbWFjX3hwY3Nfc2V0dXAoKSBnZW5lcmljIHRvIGFsbCBQQ1Mg
ZGV2aWNlcwogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9uZXRkZXYvbmV0LW5leHQvYy9mOWNk
ZmYxYmRhY2MKICAtIFtuZXQtbmV4dCx2Nyw0LzddIG5ldDogc3RtbWFjOiBpbnRyb2R1Y2UgcGNz
X2luaXQvcGNzX2V4aXQgc3RtbWFjIG9wZXJhdGlvbnMKICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvbmV0ZGV2L25ldC1uZXh0L2MvZjBlZjQzM2ZjMjY0CiAgLSBbbmV0LW5leHQsdjcsNS83XSBu
ZXQ6IHN0bW1hYzogZHdtYWMtc29jZnBnYTogdXNlIHBjc19pbml0L3Bjc19leGl0CiAgICBodHRw
czovL2dpdC5rZXJuZWwub3JnL25ldGRldi9uZXQtbmV4dC9jLzgxYjQxOGE2NTY1NwogIC0gW25l
dC1uZXh0LHY3LDYvN10gbmV0OiBzdG1tYWM6IGFkZCBzdXBwb3J0IGZvciBSWi9OMSBHTUFDCiAg
ICBodHRwczovL2dpdC5rZXJuZWwub3JnL25ldGRldi9uZXQtbmV4dC9jL2YzNjA0NDZlYzFkMAog
IC0gW25ldC1uZXh0LHY3LDcvN10gQVJNOiBkdHM6IHI5YTA2ZzAzMjogZGVzY3JpYmUgR01BQzEK
ICAgIChubyBtYXRjaGluZyBjb21taXQpCgpZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEKLS0g
CkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy5kb2NzLmtlcm5lbC5vcmcv
cGF0Y2h3b3JrL3B3Ym90Lmh0bWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
