Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAF5A6DF49
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Mar 2025 17:10:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52670C7801E;
	Mon, 24 Mar 2025 16:10:18 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D24FC71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 16:10:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2970AA4A352;
 Mon, 24 Mar 2025 16:04:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42D5C4CEDD;
 Mon, 24 Mar 2025 16:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742832615;
 bh=VRNuMZ46YoefRymfk92bpusxS2YiPpYOHdDtSJvUv28=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ihDM1LzcyF7ntp/L6yv553qVXhlfA2d21lvEo2ba33p7z5XZxNhVG6BXieL8rA0rf
 hHLHAn1CFEkTehALove7hl1eijCG/cuefvE6IIEkdGJhIyS+RTSk0GYtnrsl6Kct3U
 mCNRwfIym40mhLadEy6sXjEUdJAEPY3+bKQSpIx0VHlikBVxrVnguI5PNp5cL54NWi
 QzIu9/OYTN3o74c3AxAxILmJ1QhagtOTQKTMVgljsQ6SM4TLwwaztInWEbgS5hL2A1
 A2jEUCr3mRkcx6mhlPcKEUuF0FIc8iu1iM4UdFPPPlY6WRM+jJeJfYDg253Jp8JA43
 Op41GcNd0aiMQ==
Date: Mon, 24 Mar 2025 11:10:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>
Message-ID: <174283261429.162935.4991717491782236222.robh@kernel.org>
References: <20250321111821.361419-1-goran.radni@gmail.com>
 <20250321111821.361419-4-goran.radni@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250321111821.361419-4-goran.radni@gmail.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <gradenovic@ultratronik.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/4] dt-bindings: arm: stm32: Document
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

Ck9uIEZyaSwgMjEgTWFyIDIwMjUgMTI6MTg6MTggKzAxMDAsIEdvcmFuIFJhxJFlbm92acSHIHdy
b3RlOgo+IEZyb206IEdvcmFuIFJhxJFlbm92acSHIDxncmFkZW5vdmljQHVsdHJhdHJvbmlrLmRl
Pgo+IAo+IFRoaXMgY29tbWl0IGRvY3VtZW50cyB1bHRyYS1mbHktc2JjIGRldmljZXRyZWUgYmlu
ZGluZyBiYXNlZCBvbgo+IFNUTTMyTVAxNTcgU29DLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdvcmFu
IFJhxJFlbm92acSHIDxncmFkZW5vdmljQHVsdHJhdHJvbmlrLmRlPgo+IC0tLQo+ICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlhbWwgfCA1ICsrKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiAKCkFja2VkLWJ5OiBSb2IgSGVy
cmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
