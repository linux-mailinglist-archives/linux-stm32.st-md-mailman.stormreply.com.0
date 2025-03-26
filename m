Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C6AA7117E
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Mar 2025 08:41:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6641C78F7F;
	Wed, 26 Mar 2025 07:41:34 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22AAAC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Mar 2025 07:41:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5DF266112F;
 Wed, 26 Mar 2025 07:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B83CC4CEE2;
 Wed, 26 Mar 2025 07:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742974891;
 bh=rBYoJUxPomzvyzOlBrsF+JK7muFZEKCY181Mv+AYWD8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TpOOq0ygoWcU+9ocYUPGZPUHhxtn7eYhnGmPnuOuG3IwEkoYzdj2ti1l9Q75EpHxy
 yUs43wWCbgNJe8CEq/f4QX/EPR6V0R6ekwl9MrULXZjhvJc46Ha4SHKH9GjqwzV6+F
 yLBcG8p+aOpkShjnAE59Rv+C+YmEn1wXyS0HZhfUsOKmxmhADnQjmUHk15Az6lPVNe
 6oJoE9CX2q9QeCGQjR/Je8Qxz+zUnpjds4rFpuqSXmyiTfGE/bQXbQqsH4gr77eE9L
 qapP6teilkDoP/l14TnPT5PG0krFX0EQ2mB+RVg73PTFz6yt2Sy1eqpChp256KBk1M
 5R2rzlUd3poeA==
Date: Wed, 26 Mar 2025 08:41:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>
Message-ID: <20250326-cherubic-puzzling-jellyfish-872ae6@krzk-bin>
References: <20250325110409.2323611-1-goran.radni@gmail.com>
 <20250325110409.2323611-3-goran.radni@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250325110409.2323611-3-goran.radni@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <gradenovic@ultratronik.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 2/3] dt-bindings: arm: stm32: Document
 Ultratronik's Fly board DT binding
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

T24gVHVlLCBNYXIgMjUsIDIwMjUgYXQgMTI6MDQ6MDZQTSArMDEwMCwgR29yYW4gUmHEkWVub3Zp
xIcgd3JvdGU6Cj4gRnJvbTogR29yYW4gUmHEkWVub3ZpxIcgPGdyYWRlbm92aWNAdWx0cmF0cm9u
aWsuZGU+Cj4gCj4gVGhpcyBjb21taXQgZG9jdW1lbnRzIHVsdHJhLWZseS1zYmMgZGV2aWNldHJl
ZSBiaW5kaW5nIGJhc2VkIG9uCj4gU1RNMzJNUDE1NyBTb0MuCj4gCj4gU2lnbmVkLW9mZi1ieTog
R29yYW4gUmHEkWVub3ZpxIcgPGdvcmFuLnJhZG5pQGdtYWlsLmNvbT4KClNvQiBtaXNtYXRjaC4K
ClBsZWFzZSBydW4gY2hlY2twYXRjaC4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
