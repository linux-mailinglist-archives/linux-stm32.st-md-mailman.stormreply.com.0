Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D04AEA9F2
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Jun 2025 00:48:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7F48C30883;
	Thu, 26 Jun 2025 22:48:11 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60143C36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Jun 2025 22:48:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7D3E8A5202C;
 Thu, 26 Jun 2025 22:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B8ECC4CEF3;
 Thu, 26 Jun 2025 22:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750978090;
 bh=nUQQ+LnpVtcSiEKYNyLJQYQ3qpwW8j9at1ttj37bRoE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AZrsg3vdrJ0h/iRGea67V1Kjd16l35Zwmo76Qa+vj2q6zwKi6v1Ah9wl5WBNB2lWA
 462gKoTgs4izGfLnhp01Ost894ecgtMAompg3rOGHh9oemcMIwy0PMbxuwbusSQVKY
 fw6S23NxOWG9YyYiQzNL+cZtIgSPGh1ng98fu7XWyg8Lv2s/5/8WvWaCQsFMyrs57q
 u4h98kx8k8VqrMM4LWU1NznJl/nfN3t9HfmaPB7MUNbSpaSI78hvBQHfpx4j1oqp17
 Q1mIL9Fqi48UYRj4WZN9oDtSMDX/U6NaI3pfNJqSRaB2pESV6QiMM6OYGOb3NP/7/E
 oSYMevKyeDRGQ==
From: Vinod Koul <vkoul@kernel.org>
To: =?utf-8?q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
In-Reply-To: <20250618-restricted-pointers-dma-v2-1-bc39dafc201d@linutronix.de>
References: <20250618-restricted-pointers-dma-v2-1-bc39dafc201d@linutronix.de>
Message-Id: <175097809000.79884.3200943794194377896.b4-ty@kernel.org>
Date: Thu, 26 Jun 2025 15:48:10 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13.0
Cc: dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] dmaengine: stm32: Don't use %pK
	through printk
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

Ck9uIFdlZCwgMTggSnVuIDIwMjUgMDk6NDM6MzQgKzAyMDAsIFRob21hcyBXZWnDn3NjaHVoIHdy
b3RlOgo+IEluIHRoZSBwYXN0ICVwSyB3YXMgcHJlZmVyYWJsZSB0byAlcCBhcyBpdCB3b3VsZCBu
b3QgbGVhayByYXcgcG9pbnRlcgo+IHZhbHVlcyBpbnRvIHRoZSBrZXJuZWwgbG9nLgo+IFNpbmNl
IGNvbW1pdCBhZDY3Yjc0ZDI0NjkgKCJwcmludGs6IGhhc2ggYWRkcmVzc2VzIHByaW50ZWQgd2l0
aCAlcCIpCj4gdGhlIHJlZ3VsYXIgJXAgaGFzIGJlZW4gaW1wcm92ZWQgdG8gYXZvaWQgdGhpcyBp
c3N1ZS4KPiBGdXJ0aGVybW9yZSwgcmVzdHJpY3RlZCBwb2ludGVycyAoIiVwSyIpIHdlcmUgbmV2
ZXIgbWVhbnQgdG8gYmUgdXNlZAo+IHRocm91Z2ggcHJpbnRrKCkuIFRoZXkgY2FuIHN0aWxsIHVu
aW50ZW50aW9uYWxseSBsZWFrIHJhdyBwb2ludGVycyBvcgo+IGFjcXVpcmUgc2xlZXBpbmcgbG9j
a3MgaW4gYXRvbWljIGNvbnRleHRzLgo+IAo+IFsuLi5dCgpBcHBsaWVkLCB0aGFua3MhCgpbMS8x
XSBkbWFlbmdpbmU6IHN0bTMyOiBEb24ndCB1c2UgJXBLIHRocm91Z2ggcHJpbnRrCiAgICAgIGNv
bW1pdDogNmU2ZDNjNmYwZWYyMzVhOTVjMjUzODViMmRhZDk4ZThhZDYyMjNlYgoKQmVzdCByZWdh
cmRzLAotLSAKflZpbm9kCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
