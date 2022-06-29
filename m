Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BA555F4A4
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jun 2022 05:58:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 107D3C5F1EF;
	Wed, 29 Jun 2022 03:58:10 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3463DC5F1D5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jun 2022 03:58:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D0CB9B81E05;
 Wed, 29 Jun 2022 03:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB26C341C8;
 Wed, 29 Jun 2022 03:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656475086;
 bh=xlGxS8eUt1OwTO8mhrcABYeSBWBaRvP4l//S4lU2bl4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hrDTwX6hYGWX/wgcmW07d4J74gC6BeBtRFns102uUolRM4RhY87XGIMtBDXnwSuZo
 zgikn6BHii6BDtqCWa0ZAt2uCIsUoUVUy5VcmPHP2qEWinJShYe25rpOQkjWM8Ta/f
 Bid2Cycq6yAiVf5ydN0IE5ySyzVO3by6Y8asE2RMkpC/sIPc1qdysigyK8Lshr6sNj
 vHlEA2nrTCPpzoKy8HGNgbVzca98fMuzeJIh5FhgYMdeIesIiYpfJqjbgutyJmy2KL
 enCqF25Nsy6URxQ0hBhdpCtauUDvSEd3QhMUlEkuBT5xwET31rK+vYjrJmP1ZbvrqH
 YZLBkpUxllcUg==
Date: Tue, 28 Jun 2022 20:58:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Message-ID: <20220628205805.2e105b5a@kernel.org>
In-Reply-To: <20220628013342.13581-1-ansuelsmth@gmail.com>
References: <20220628013342.13581-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next PATCH RFC 0/5] Add MTU change with
 stmmac interface running
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

T24gVHVlLCAyOCBKdW4gMjAyMiAwMzozMzozNyArMDIwMCBDaHJpc3RpYW4gTWFyYW5naSB3cm90
ZToKPiBUaGlzIHNlcmllcyBpcyB0byBwZXJtaXQgTVRVIGNoYW5nZSB3aGlsZSB0aGUgaW50ZXJm
YWNlIGlzIHJ1bm5pbmcuCj4gTWFqb3IgcmV3b3JrIGFyZSBuZWVkZWQgdG8gcGVybWl0IHRvIGFs
bG9jYXRlIGEgbmV3IGRtYSBjb25mIGJhc2VkIG9uCj4gdGhlIG5ldyBNVFUgYmVmb3JlIGFwcGx5
aW5nIGl0LiBUaGlzIGlzIHRvIG1ha2Ugc3VyZSB0aGVyZSBpcyBlbm91Z2gKPiBzcGFjZSB0byBh
bGxvY2F0ZSBhbGwgdGhlIERNQSBxdWV1ZSBiZWZvcmUgcmVsZWFzaW5nIHRoZSBzdG1tYWMgZHJp
dmVyLgoK8J+RjSBMb29rcyBnb29kLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
