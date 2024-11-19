Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3859D1F0E
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Nov 2024 05:01:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 663D5C78F91;
	Tue, 19 Nov 2024 04:01:29 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B1E4C78F90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 04:01:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 88A5F5C51B6;
 Tue, 19 Nov 2024 04:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7FA4C4AF10;
 Tue, 19 Nov 2024 04:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731988830;
 bh=JrpMfsKiDZUzM7MMCPOjRLPifcbKsuTDdbLhPJ/UQv4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=CilEPpN08lK6k+DFDXsB/MI1uxKH0CVI2IPgWbB/mvx+lBXHxuzrocohGPlPTsLGl
 OvRWB1vlcvTq5cF+6kB/NGA2PAXS2TEUf1sVwDeN6Vy92L+n9Ii3K/z5W0vwReRWip
 upXlXRl9SvzdJIJEVO5n5TwFDpjZ059BGeYEjQ83TBuhO8HiEBfevse91Bb0xAL/4i
 G8CTQs2+uTPkm05oOshvU1i7wq3wHEW3yFDGqKtx9GToUWnmW4OT29TlNIdu+JKkhm
 +Y7lUe2AIj+xpc40DLRa7Fw7gqGc+JzD1q4XHVeFhHi8hhLF+sabk7F5QXFw2enIW3
 dSo5Ap89rDG7A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 7167C3809A80; Tue, 19 Nov 2024 04:00:43 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173198884200.97799.10181079932395577855.git-patchwork-notify@kernel.org>
Date: Tue, 19 Nov 2024 04:00:42 +0000
References: <20241115132632.599188-1-mordan@ispras.ru>
In-Reply-To: <20241115132632.599188-1-mordan@ispras.ru>
To: Vitalii Mordan <mordan@ispras.ru>
Cc: andrew@lunn.ch, linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 netdev@vger.kernel.org, pchelkin@ispras.ru,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mutilin@ispras.ru, khoroshilov@ispras.ru,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3] stmmac: dwmac-intel-plat:
 remove redundant dwmac->data check in probe
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIG5ldGRldi9uZXQtbmV4dC5naXQgKG1h
aW4pCmJ5IEpha3ViIEtpY2luc2tpIDxrdWJhQGtlcm5lbC5vcmc+OgoKT24gRnJpLCAxNSBOb3Yg
MjAyNCAxNjoyNjozMiArMDMwMCB5b3Ugd3JvdGU6Cj4gVGhlIGRyaXZlcuKAmXMgY29tcGF0aWJp
bGl0eSB3aXRoIGRldmljZXMgaXMgY29uZmlybWVkIGVhcmxpZXIgaW4KPiBwbGF0Zm9ybV9tYXRj
aCgpLiBTaW5jZSByZWFjaGluZyBwcm9iZSBtZWFucyB0aGUgZGV2aWNlIGlzIHZhbGlkLAo+IHRo
ZSBleHRyYSBjaGVjayBjYW4gYmUgcmVtb3ZlZCB0byBzaW1wbGlmeSB0aGUgY29kZS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBWaXRhbGlpIE1vcmRhbiA8bW9yZGFuQGlzcHJhcy5ydT4KPiBSZXZpZXdl
ZC1ieTogQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPgo+IAo+IFsuLi5dCgpIZXJlIGlzIHRo
ZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAgLSBbbmV0LW5leHQsdjNdIHN0bW1hYzogZHdtYWMtaW50
ZWwtcGxhdDogcmVtb3ZlIHJlZHVuZGFudCBkd21hYy0+ZGF0YSBjaGVjayBpbiBwcm9iZQogICAg
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9uZXRkZXYvbmV0LW5leHQvYy9jYzg0ZDg5YWQ4ZDQKCllv
dSBhcmUgYXdlc29tZSwgdGhhbmsgeW91IQotLSAKRGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4K
aHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVsLm9yZy9wYXRjaHdvcmsvcHdib3QuaHRtbAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
