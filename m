Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D71C953857
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Aug 2024 18:35:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D03CC7129D;
	Thu, 15 Aug 2024 16:35:48 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6D79C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Aug 2024 16:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2YsIYBU4KdzLxYOq/DWZJaW8fsNmm7V/n/GVrhzx8fU=; b=OyXy+w3bleVZ7blXyZNiQ9LVCb
 bhzsyx0+QQMv/aBgZT9jtgM0Ws9Kkswdf6EMIbVOzYPIcIATpMTffVE98W5J2RC0NB/5JCK4UaHYa
 5Y+DqD5Y3IgQHovKo69Q0srhgBNUXKHJ2btWtuc1hlO2XJIHixiRm29zqDv+0sfPu44JFw1A1VRKC
 gHbNkBVlKal+PKZ8jl3HllTyWw9YIfVqGodkro07kCDtpNKPPH+55IDIr66B/N428V4pHw/faaZHQ
 K7cm8AeiJw2ogzoQ9WU25F/04tDZ5EvEYJqpsrHvvZ3goIJxny75LNbFDCXc2W1uWYyCOp+p707c4
 /igHZSFw==;
Received: from i53875a9f.versanet.de ([83.135.90.159] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1sedRb-0005Qb-Gy; Thu, 15 Aug 2024 18:35:23 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org, David Wu <david.wu@rock-chips.com>
Date: Thu, 15 Aug 2024 18:35:22 +0200
Message-ID: <2148922.heUyiRONoq@diego>
In-Reply-To: <a73ff2ab-7e68-4d6b-b38d-37e7303af40d@rock-chips.com>
References: <20240808170113.82775-1-detlev.casanova@collabora.com>
 <3304458.aeNJFYEL58@trenzalore>
 <a73ff2ab-7e68-4d6b-b38d-37e7303af40d@rock-chips.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@collabora.com, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Re: [PATCH v2 2/2] ethernet: stmmac: dwmac-rk: Add
	GMAC support for RK3576
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

SGkgRGF2aWQsCgpBbSBNb250YWcsIDEyLiBBdWd1c3QgMjAyNCwgMDQ6MjE6MjcgQ0VTVCBzY2hy
aWViIERhdmlkIFd1Ogo+IEhpIERldGxldiwgSGVpa286Cj4gCj4gSXQncyByZWFsbHkgYSBUUk0g
ZXJyb3IgaGVyZSwgUk1JSSBQSFkgaGFzIGJlZW4gdmVyaWZpZWQgZm9yIHRoaXMgcGF0Y2guCgp0
aGFua3MgZm9yIGRvdWJsZSBjaGVja2luZy4KCgpIZWlrbwoKPiDlnKggMjAyNC84LzkgMjI6Mzgs
IERldGxldiBDYXNhbm92YSDlhpnpgZM6Cj4gPiBDYW4ndCBiZSBzdXJlIGFib3V0IHRoYXQuIEFu
IGVycm9yIGluIHRoZSBUUk0gaXMgbm90IGltcG9zc2libGUgZWl0aGVyLCBhcyBmb3IKPiA+IHJr
MzU4OCwgaXQgaXMgYWxzbyBiaXRbNV09MDogRElWMjAgYW5kIGJpdFs1XT0xOiBESVYyLiBJIGNh
biBzd2l0Y2ggdGhlbSB0bwo+ID4gbWF0Y2ggdGhlIFRSTSB0aG91Z2gsIHdlIG1heSBuZXZlciBu
b3cuCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
