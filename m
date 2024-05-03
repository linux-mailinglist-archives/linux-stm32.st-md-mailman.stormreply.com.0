Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 574FC8BAA6E
	for <lists+linux-stm32@lfdr.de>; Fri,  3 May 2024 12:01:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08CFDC712A2;
	Fri,  3 May 2024 10:01:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1915C712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 May 2024 10:01:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 821266143F;
 Fri,  3 May 2024 10:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E19C4AF14;
 Fri,  3 May 2024 10:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714730487;
 bh=Z81kJ5Jzse+D1tt/hKahWdZHLWz3jrL1TFiptgq6cIE=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=h7CECoV2zrBhycyFBBAhOXnFnpoEfarqglCNzR7GGa3PNe1gRF0kDuDQErO1Ajvy6
 8TFeGl2KayFG6TTYWdlT5GMS19wpQgS+hXmHk5DUeEH6nHjsiLA2N7gU+297+e6FJ1
 QrbvrMZVYv+4fi9KdUKHoB3W7WbiKdlAByb5lvgC935LJucFVRkUeqZpkYOMPiDO8D
 EEUd3kRKLaF0WcZ7qqy3GKhBT9k52HxcEdwW004rPZW4BA6zUkYstpWtk6E9ADWCnc
 BB30uzCGrgWrH6fne7nrKbvTnHd13e6TeDYEdUoPA7Y+MvWQ/bAN227MFV4RWHDV6z
 oi7Jj925Tr9Eg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240503072116.12430-1-krzysztof.kozlowski@linaro.org>
References: <20240503072116.12430-1-krzysztof.kozlowski@linaro.org>
Message-Id: <171473048435.1337417.17257640057136086841.b4-ty@kernel.org>
Date: Fri, 03 May 2024 11:01:24 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.4
Subject: Re: [Linux-stm32] (subset) [PATCH] dt-bindings: mfd: Use full path
 to other schemas
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

T24gRnJpLCAwMyBNYXkgMjAyNCAwOToyMToxNiArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3
cm90ZToKPiBXaGVuIHJlZmVyZW5jaW5nIG90aGVyIHNjaGVtYSwgaXQgaXMgcHJlZmVycmVkIHRv
IHVzZSBhbiBhYnNvbHV0ZSBwYXRoCj4gKC9zY2hlbWFzLy4uLi4pLCB3aGljaCBhbGxvd3MgYWxz
byBhbiBzZWFtbGVzcyBtb3ZlIG9mIHBhcnRpY3VsYXIgc2NoZW1hCj4gb3V0IG9mIExpbnV4IGtl
cm5lbCB0byBkdHNjaGVtYS4KPiAKPiAKCkFwcGxpZWQsIHRoYW5rcyEKClsxLzFdIGR0LWJpbmRp
bmdzOiBtZmQ6IFVzZSBmdWxsIHBhdGggdG8gb3RoZXIgc2NoZW1hcwogICAgICBjb21taXQ6IDU2
NDI3N2VmNjBiNWY1ZWMxNzUzNDg5YWQ2OWY0NTgzZGI1N2U2ZjAKCi0tCkxlZSBKb25lcyBb5p2O
55C85pavXQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
