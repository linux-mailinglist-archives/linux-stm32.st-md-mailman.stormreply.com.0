Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D64F59D35C6
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 09:45:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84358C78F87;
	Wed, 20 Nov 2024 08:45:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 403DCC78015
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2024 08:45:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 147F45C4E71;
 Wed, 20 Nov 2024 08:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B2CC4CECD;
 Wed, 20 Nov 2024 08:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732092338;
 bh=o708dW0zpekdr4qHK55sfqdl8wG5Nu/+g3DIktqbevs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ENQOLDc9QlSnqdhpi5D3zXCMMfPjp+W242ba0E8V20RP4FD0uAEbL1XjgeTcXw5rR
 ZMp+mkKdTDwaJb+uuhLbkI46ajEPAR0PxWOa1Y9DBLiZwYLDxmgm3aVHjRuUJgJ6cZ
 HH0Y146jPZ/3JXkBZq00o7riCQaKfAlKMv/kealJDq7YwCkng/jvMRZwe00H5ALxcy
 q4XVXfT7XYRXqF7hWjeRbsKFRWXxNAxv1eQduNpqx7Qv2G0DjLSEMSEDUoXKvGrKNo
 ob7Yi6O+uC6vp4o+QggxaLzv+gAUjuy8A39xd2Ji1AdUisDBgDv/9cnXcugH6FL4bH
 bw3j4mq4W04WA==
Date: Wed, 20 Nov 2024 09:45:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Message-ID: <4t2tmuntv24lffk3ikgbsz7tbvkqosmd2xwurnzvk346daah22@wegcc3wreqpr>
References: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
 <20241119-lxa-tac-gen3-v1-4-e0ab0a369372@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241119-lxa-tac-gen3-v1-4-e0ab0a369372@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Leonard =?utf-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/6] dt-bindings: arm: stm32: add
 compatible strings for Linux Automation LXA TAC gen 3
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

T24gVHVlLCBOb3YgMTksIDIwMjQgYXQgMTI6MzU6MDFQTSArMDEwMCwgTWFyYyBLbGVpbmUtQnVk
ZGUgd3JvdGU6Cj4gRnJvbTogTGVvbmFyZCBHw7ZocnMgPGwuZ29laHJzQHBlbmd1dHJvbml4LmRl
Pgo+IAo+IFRoZSBMaW51eCBBdXRvbWF0aW9uIExYQSBUQUMgZ2VuZXJhdGlvbiAzIGlzIGJ1aWx0
IGFyb3VuZCBhbgo+IE9TRDMyTVAxNTN4IFNpUCB3aXRoIENQVSwgUkFNLCBQTUlDLCBPc2NpbGxh
dG9yIGFuZCBFRVBST00uCj4gCj4gTFhBIFRBQ3MgYXJlIGEgZGV2ZWxvcG1lbnQgdG9vbCBmb3Ig
ZW1iZWRkZWQgZGV2aWNlcyB3aXRoIGEgZm9jdXMgb24KPiBlbWJlZGRlZCBMaW51eCBkZXZpY2Vz
Lgo+IAo+IEFkZCBjb21wYXRpYmxlIGZvciB0aGUgZ2VuZXJhdGlvbiAzIGJhc2VkIG9uIHRoZSBT
VE0zMk1QMTUzYy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMZW9uYXJkIEfDtmhycyA8bC5nb2VocnNA
cGVuZ3V0cm9uaXguZGU+Cj4gU2lnbmVkLW9mZi1ieTogTWFyYyBLbGVpbmUtQnVkZGUgPG1rbEBw
ZW5ndXRyb25peC5kZT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2FybS9zdG0zMi9zdG0zMi55YW1sIHwgNyArKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKykKCkFja2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296
bG93c2tpQGxpbmFyby5vcmc+CgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
