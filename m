Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5F6A4A593
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Feb 2025 23:03:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D5E4C7128F;
	Fri, 28 Feb 2025 22:03:58 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 768FDC71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Feb 2025 22:03:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D6DD96115D;
 Fri, 28 Feb 2025 22:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82329C4CED6;
 Fri, 28 Feb 2025 22:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740780236;
 bh=AJB89FzkhwSIbHXzs/7zaZZGPG1GIi2QRgI16BLxGOI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nPmoMjVplmDLnKgNTdpJMp/9BWvtz7PIMQNubFIwAKooZsBFcs95QFMcHEN3Gw4E4
 tQ9I9TkSCDYsmwxSTmFR47mVCJ2OxmjbRmQy35IxMG0mMlc4/+fyxRI/UdZtE5/vUM
 s/yTKfRDh3Pyt8I0Fjg1DAXB28K0qCpne2/RwUs352zf1hiN4VC5xdL1aSWedb0duq
 ZLnkRxRZCb868YrJcV98HI6Vmd8vrIOWk9nil4mtHZ4LoNfjy+xCGK4Ey3fC+lYpDw
 3Y7gmah0vMhqUxDcAnehiDwhVSb6Qi8CGoDkLnortrZ5WNgXXUB+WPqeYNyKN2dbsa
 +hUgvlML+AP1g==
Date: Fri, 28 Feb 2025 14:03:54 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Message-ID: <20250228140354.5efff3fd@kernel.org>
In-Reply-To: <a7720a091ea02a6bbaa88c7311d7a642f9c7fdff.camel@redhat.com>
References: <20250226085208.97891-1-phasta@kernel.org>
 <20250226085208.97891-2-phasta@kernel.org>
 <20250227183545.0848dd61@kernel.org>
 <a7720a091ea02a6bbaa88c7311d7a642f9c7fdff.camel@redhat.com>
MIME-Version: 1.0
Cc: Philipp Stanner <phasta@kernel.org>, Feiyang Chen <chenfeiyang@loongson.cn>,
 Yanteng Si <si.yanteng@linux.dev>, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 Yinggang Gu <guyinggang@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, stable@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Henry Chen <chenx97@aosc.io>,
 Qing Zhang <zhangqing@loongson.cn>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 1/4] stmmac: loongson: Pass
 correct arg to PCI function
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

T24gRnJpLCAyOCBGZWIgMjAyNSAxMDoyNjoyNCArMDEwMCBQaGlsaXBwIFN0YW5uZXIgd3JvdGU6
Cj4gPiBTaW5jZSB5b3Ugc2VudCB0aGlzIGFzIGEgZml4ICh3aGljaC4uIHllYS4uIEkgZ3Vlc3Mu
LiB3aHkgbm90Li4pCj4gPiBJJ2xsIGFwcGx5IGl0IHRvIHRoZSBmaXhlcyB0cmVlLiBCdXQgdGhl
biB0aGUgb3RoZXIgcGF0Y2hlcyBoYXZlIAo+ID4gdG8gd2FpdCBhbmQgYmUgcmVwb3N0ZWQgbmV4
dCBUaHUuIFRoZSBmaXhlcyBhcmUgbWVyZ2VkIHdpdGggbmV0LW5leHQKPiA+IGV2ZXJ5IFRodSwg
YnV0IHNpbmNlIHRoaXMgc2VyaWVzIHdhcyB0YWdnZWQgYXMgbmV0LW5leHQgSSBtaXNzZWQKPiA+
IGl0IGluIHRvZGF5J3MgY3Jvc3MgbWVyZ2UgOigKPiAKPiBPaCBPSywgSSBzZWUg4oCTIEknbSBu
b3QgdmVyeSBmYW1pbGlhciB3aXRoIHRoZSBuZXQgc3Vic3lzdGVtIHByb2Nlc3MuIFNvCj4gZmFy
IEkgYWx3YXlzIGhhZCBpdCBsaWtlIHRoaXM6IGZpcmUgZXZlcnl0aGluZyBpbnRvIExpbnVzJ3Mg
bWFzdGVyIGFuZAo+IEdyZWcgJiBTYXNoYSB0aGVuIHBpY2sgdGhvc2Ugd2l0aCBGaXhlcyB0YWdz
IGludG8gdGhlIHN0YWJsZSB0cmVlcwo+IGF1dG9tYXRpY2FsbHkgOikKCkFkbWl0dGVkbHkgdGhl
IGZpeGVzIHZzIGxpbnV4LW5leHQgbWF0ZXJpYWwgcm91dGluZyBpcyBhIGxpdHRsZSB0cmlja3ku
Cgo+IEFueXdheXMsIEkgaW50ZXJwcmV0IHlvdXIgbWVzc2FnZSBzbyB0aGF0IHRoaXMgc2VyaWVz
IGlzIGRvbmUgYW5kIEkKPiBkb24ndCBoYXZlIHRvIGRvIGFueXRoaW5nIGFib3V0IGl0IGFueW1v
cmUuIENvcnJlY3QgbWUgaWYgSSdtIHdyb25nLgoKWW91IG5lZWQgdG8gcmVwb3N0IHBhdGNoZXMg
MiwzLDQgb25jZSB0aGUgZmlyc3QgcGF0Y2ggYXBwZWFycyBpbjoKaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV0ZGV2L25ldC1uZXh0LmdpdC8KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
