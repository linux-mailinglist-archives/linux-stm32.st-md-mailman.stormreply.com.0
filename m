Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 390B7AC994E
	for <lists+linux-stm32@lfdr.de>; Sat, 31 May 2025 07:10:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2C37C3F938;
	Sat, 31 May 2025 05:10:16 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07204C3F933
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 May 2025 05:10:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 93D884A465;
 Sat, 31 May 2025 05:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70119C4CEE3;
 Sat, 31 May 2025 05:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748668213;
 bh=uL+BKZu6kDrl8m5sy72o33sP2MBjksLZumY0/hHgMps=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ChbudPE6kmY4/3YOEolvt7DlvOHxpw6Tt6E9jnB8i0Lb7bhRG15EJiN9qjaVSskzh
 rshvnh2rjKhodkAhJKN7McTm5buTU9yh+2JzQoP0AaNwzR+cyp4BcUF+hH9PQJC2a+
 kO7iXg21mW+k/4NQ364m2fi+lZr9qUg9ExlnC5PeFnnlSptnqS91d8Yzs9pt/YktAG
 zd71IWbc5keU8SImNDd0am3g4HwepyowevzjB7W05wj0b0qfvC5Wxvih8myur58VGy
 IZWtD2ZPSg+FdSAr9RtB33SyX/KUVXXMKm4kGmjgyEvzBZ1z81ecVgK/CH/DMYqAh5
 9ACVpTobtCgdg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB09D39F1DF3; Sat, 31 May 2025 05:10:47 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174866824674.44670.9404709509125224265.git-patchwork-notify@kernel.org>
Date: Sat, 31 May 2025 05:10:46 +0000
References: <20250529-stmmac_tstamp_div-v4-0-d73340a794d5@bootlin.com>
In-Reply-To: <20250529-stmmac_tstamp_div-v4-0-d73340a794d5@bootlin.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9_=3Calexis=2Elothore=40bootlin=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: Jose.Abreu@synopsys.com, preid@electromag.com.au,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 netdev@vger.kernel.org, richardcochran@gmail.com, si.yanteng@linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 0/2] net: stmmac: prevent div by 0
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

SGVsbG86CgpUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byBuZXRkZXYvbmV0LmdpdCAobWFpbikK
YnkgSmFrdWIgS2ljaW5za2kgPGt1YmFAa2VybmVsLm9yZz46CgpPbiBUaHUsIDI5IE1heSAyMDI1
IDExOjA3OjIyICswMjAwIHlvdSB3cm90ZToKPiBIZWxsbywKPiB0aGlzIHNtYWxsIHNlcmllcyBh
aW1zIHRvIGZpeCBhIHNtYWxsIHNwbGF0IEkgYW0gb2JzZXJ2aW5nIG9uIGEgU1RNMzJNUDE1Nwo+
IHBsYXRmb3JtIGF0IGJvb3QgKHNlZSBjb21taXQgMSkgZHVlIHRvIGEgZGl2aXNpb24gYnkgMC4K
PiBUaGVyZSBpcyBubyBmdW5jdGlvbmFsIGNoYW5nZSBpbiB0aGlzIHJldmlzaW9uLCB0aGlzIGhh
cyBqdXN0IGJlZW4KPiByZWJhc2VkIG9uIHRvcCBvZiBuZXQvbWFpbi4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgo+IAo+IFsu
Li5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAgLSBbdjQsMS8yXSBuZXQ6IHN0
bW1hYzogbWFrZSBzdXJlIHRoYXQgcHRwX3JhdGUgaXMgbm90IDAgYmVmb3JlIGNvbmZpZ3VyaW5n
IHRpbWVzdGFtcGluZwogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9uZXRkZXYvbmV0L2MvMDMw
Y2U5MTllMTE0CiAgLSBbdjQsMi8yXSBuZXQ6IHN0bW1hYzogbWFrZSBzdXJlIHRoYXQgcHRwX3Jh
dGUgaXMgbm90IDAgYmVmb3JlIGNvbmZpZ3VyaW5nIEVTVAogICAgaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9uZXRkZXYvbmV0L2MvY2JlZmUyZmZhNzc4CgpZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlv
dSEKLS0gCkRlZXQtZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy5kb2NzLmtlcm5l
bC5vcmcvcGF0Y2h3b3JrL3B3Ym90Lmh0bWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
