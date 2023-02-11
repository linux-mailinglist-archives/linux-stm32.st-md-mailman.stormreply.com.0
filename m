Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFDC693255
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Feb 2023 17:11:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D4BDC6A5EF;
	Sat, 11 Feb 2023 16:11:56 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B053C6A5ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Feb 2023 16:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=QIsGxB3foIcUzmrB1itBt2fP/mbnt75It4usqWhNhqE=; b=P7
 vtKGwpGWflFG3N+B1RRIjxiM27gprx3GRBS7un6JwuWk8/FV4d9LEQ4CwLk+IFnSxLF22ydIkzt32
 X9aBWQyuop1jYaVXEqsxufkvQT5F3P3eUtKeDSavDF2GGB9RX3+B35o5Hygx+fQ2daJPJiXTvnERk
 aEASDZm9A+FlUko=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1pQsTP-004iBC-Gy; Sat, 11 Feb 2023 17:11:35 +0100
Date: Sat, 11 Feb 2023 17:11:35 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Message-ID: <Y+e+N/aiqCctIp6e@lunn.ch>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-9-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230211031821.976408-9-cristian.ciocaltea@collabora.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Yanhong Wang <yanhong.wang@starfivetech.com>, Lee Jones <lee@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 08/12] net: stmmac: Add glue layer for
	StarFive JH7100 SoC
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

PiArCj4gKyNkZWZpbmUgSkg3MTAwX1NZU01BSU5fUkVHSVNURVIyOCAweDcwCj4gKy8qIFRoZSB2
YWx1ZSBiZWxvdyBpcyBub3QgYSB0eXBvLCBqdXN0IHJlYWxseSBiYWQgbmFtaW5nIGJ5IFN0YXJG
aXZlIMKvXF8o44OEKV8vwq8gKi8KPiArI2RlZmluZSBKSDcxMDBfU1lTTUFJTl9SRUdJU1RFUjQ5
IDB4YzgKClNlZW1zIGxpa2UgdGhlIGNvbW1lbnQgc2hvdWxkIGJlIG9uZSBsaW5lIGVhcmxpZXI/
CgpUaGVyZSBpcyB2YWx1ZSBpbiBiYXNpbmcgdGhlIG5hbWVzIG9uIHRoZSBkYXRhc2hlZXQsIGJ1
dCB5b3UgY291bGQKYXBwZW5kIHNvbWV0aGluZyBtZWFuaW5nZnVsIG9uIHRoZSBlbmQ6CgojZGVm
aW5lIEpINzEwMF9TWVNNQUlOX1JFR0lTVEVSNDlfRExZQ0hBSU4gMHhjOAoKPz8/Cgo+ICsJaWYg
KCFvZl9wcm9wZXJ0eV9yZWFkX3UzMihucCwgInN0YXJmaXZlLGd0eGNsay1kbHljaGFpbiIsICZn
dHhjbGtfZGx5Y2hhaW4pKSB7Cj4gKwkJcmV0ID0gcmVnbWFwX3dyaXRlKHN5c21haW4sIEpINzEw
MF9TWVNNQUlOX1JFR0lTVEVSNDksIGd0eGNsa19kbHljaGFpbik7Cj4gKwkJaWYgKHJldCkKPiAr
CQkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJlcnJvciBzZWxlY3RpbmcgZ3R4Y2xr
IGRlbGF5IGNoYWluXG4iKTsKPiArCX0KCllvdSBzaG91bGQgcHJvYmFibHkgZG9jdW1lbnQgdGhh
dCBpZiBzdGFyZml2ZSxndHhjbGstZGx5Y2hhaW4gaXMgbm90CmZvdW5kIGluIHRoZSBEVCBibG9i
LCB0aGUgdmFsdWUgZm9yIHRoZSBkZWxheSBjaGFpbiBpcyB1bmRlZmluZWQuICBJdAp3b3VsZCBh
Y3R1YWxseSBiZSBiZXR0ZXIgdG8gZGVmaW5lIGl0LCBzZXQgaXQgdG8gMCBmb3IgZXhhbXBsZS4g
VGhhdAp3YXksIHlvdSBrbm93IHlvdSBkb24ndCBoYXZlIGFueSBkZXBlbmRlbmN5IG9uIHRoZSBi
b290bG9hZGVyIGZvcgpleGFtcGxlLgoKCUFuZHJldwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
