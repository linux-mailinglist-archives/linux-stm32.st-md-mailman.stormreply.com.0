Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1E2AEAB6C
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Jun 2025 02:05:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3C98C36B38;
	Fri, 27 Jun 2025 00:05:47 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 029C1C36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Jun 2025 00:05:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AB07D458E0;
 Fri, 27 Jun 2025 00:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCEC7C4CEEB;
 Fri, 27 Jun 2025 00:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750982745;
 bh=Ck+DzOXAxdqOO+jxI+vUNr8Y2kNlJLXxkINzJ1YAIWw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GXOOh3NA9gmywj39wIs+aigKeNMeViNksWSk/5y28zohFx5WMCY1eLtcSzpdzXU87
 VX3w9Xk1/v3Oyt/q4VsNpOGuxQYZYFkaBuDSV+pQcMu0oOwVZZAAl0H/Jx2/hp78+Q
 4G7cybaPKiRznAIICJW+8KA38s8MPCywWbABM/BgXMHHikQ0I8mg+H0p0RiRLuo2ch
 vm7SeUCxCVzi61OIuPKt7oBnydhcGEx7lDXQ7GsmwPy04yjNnlv2NWJZtgeUNFjqCo
 cPSSlOVHksN5Kiqwb/wa/AXUQPbIzka2jCmLDz48p7Nl4hz3cr5m2s4BWC7P3rbHV1
 4alWUEk09msug==
Date: Thu, 26 Jun 2025 17:05:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <20250626170543.6696868d@kernel.org>
In-Reply-To: <20250626234119.GA1398428-robh@kernel.org>
References: <20250613225844.43148-1-matthew.gerlach@altera.com>
 <20250623111913.1b387b90@kernel.org>
 <20250626234119.GA1398428-robh@kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 Mun Yew Tham <mun.yew.tham@altera.com>, andrew+netdev@lunn.ch,
 edumazet@google.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, pabeni@redhat.com,
 Matthew Gerlach <matthew.gerlach@altera.com>, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v6] dt-bindings: net: Convert
 socfpga-dwmac bindings to yaml
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

T24gVGh1LCAyNiBKdW4gMjAyNSAxODo0MToxOSAtMDUwMCBSb2IgSGVycmluZyB3cm90ZToKPiBO
byBuZWVkIHRvIHBpbmcgdXMuIExpa2UgbmV0ZGV2LCB5b3UgY2FuIGNoZWNrIHRoZSBQVyBxdWV1
ZToKPiAKPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvZGV2aWNldHJlZS1i
aW5kaW5ncy9saXN0LwoKVGhhbmtzLCBub3RlZCEKCj4gSW4gYW55IGNhc2UsIHdlJ3JlIGEgYml0
IGJlaGluZCBBVE0uCj4gCj4gCj4gSXQgbG9va3MgbGlrZSB3ZSBoYXZlIDIgY29tcGV0aW5nIGNv
bnZlcnNpb25zIG9mIHRoaXMgYmluZGluZy4gVGhpcyBvbmUgCj4gYW5kIHRoaXMgb25lIHdoaWNo
IEkgcmV2aWV3ZWQ6Cj4gCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwNjI0MTkx
NTQ5LjQ3NDY4Ni0xLWRpbmd1eWVuQGtlcm5lbC5vcmcvCj4gCj4gTG9va3MgbGlrZSB0aGVyZSBh
cmUgc29tZSBkaWZmZXJlbmNlcyB3aGljaCBuZWVkIHJlc29sdmluZywgc28gSSByZXZva2UgCj4g
bXkgcmV2aWV3LiBXaWxsIGZvbGxvdy11cCBzZXBhcmF0ZWx5IG9uIGJvdGguCgrwn5GN77iPCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
