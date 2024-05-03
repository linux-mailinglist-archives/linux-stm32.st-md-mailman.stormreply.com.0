Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8D38BA8A5
	for <lists+linux-stm32@lfdr.de>; Fri,  3 May 2024 10:25:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C736C712A2;
	Fri,  3 May 2024 08:25:01 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 017BCC712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 May 2024 08:24:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8CE3FCE188F;
 Fri,  3 May 2024 08:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7177C116B1;
 Fri,  3 May 2024 08:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714724690;
 bh=8krA6oPxNixCEtNeNzJAv63F5yfpATT0K9/1XWZCeGA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rtg4hZx0dy65+Q3VXMkenm1Z4XbllBwBQU1G2FH2aWOQA/whveWb+LPEE8q9oMiqv
 GJsAbw8RC2yAbObkT+EzxykcFeEGtq+jOZZSIB62WX51Wwq4xlKgyvvzKWBpQOcCvT
 fRYkQ+tuOSBUCM6XKm5p96ollDIJE9kIgAJ1136y+91fqsp98csZpqctDViKcQcmX3
 89JJYyVykEuTmthi6lRYKmiU8i2rPH/LkR54VUZda43brEyTwvyc1ayuTOFE40cDyJ
 Ba9MVPkLepzSDiWrmAEZWovdIOOwSQdJfS1PjTlETIJpvLYqn/tMO247hOH3+ClBlH
 Tp+ZV4MWejNhw==
Date: Fri, 3 May 2024 09:24:44 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20240503082444.GJ1227636@google.com>
References: <20240503072116.12430-1-krzysztof.kozlowski@linaro.org>
 <a2886f72-210e-41a1-aae0-c079a4d11396@linaro.org>
 <0af10387-ddfb-47b0-b59e-eeba1644be1c@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0af10387-ddfb-47b0-b59e-eeba1644be1c@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mfd: Use full path to other
	schemas
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

T24gRnJpLCAwMyBNYXkgMjAyNCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKCj4gT24gMDMv
MDUvMjAyNCAxMDowOCwgVHVkb3IgQW1iYXJ1cyB3cm90ZToKPiA+IAo+ID4gCj4gPiBPbiA1LzMv
MjQgMDg6MjEsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gPj4gIC4uLi9iaW5kaW5ncy9t
ZmQvc2Ftc3VuZyxzMm1wYTAxLnlhbWwgICAgICAgICB8ICAyICstCj4gPj4gIC4uLi9iaW5kaW5n
cy9tZmQvc2Ftc3VuZyxzMm1wczExLnlhbWwgICAgICAgICB8IDEyICsrLS0tCj4gPj4gIC4uLi9i
aW5kaW5ncy9tZmQvc2Ftc3VuZyxzNW04NzY3LnlhbWwgICAgICAgICB8ICA0ICstCj4gPiAKPiA+
IFJldmlld2VkLWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+Cj4g
Cj4gU28gdGhpcyBzaG91bGQgYmUgQWNrLiBZb3UgY2Fubm90IHJldmlldyBwYXJ0IG9mIHRoZSBw
YXRjaCAoIkkgaGF2ZQo+IGNhcnJpZWQgb3V0IGEgdGVjaG5pY2FsIHJldmlldyBvZiB0aGlzIHBh
dGNoLi4uIikuCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuOC1yYzUvc291
cmNlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0CgpSZXZpZXdl
ZC1ieSBpcyB0b3RhbGx5IGFwcHJvcHJpYXRlIGhlcmUuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzm
lq9dCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
