Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0989A731AC8
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 16:05:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7A03C65E58;
	Thu, 15 Jun 2023 14:05:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72CF6C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 14:05:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3ED3F60FD7;
 Thu, 15 Jun 2023 14:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10069C433C0;
 Thu, 15 Jun 2023 14:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686837942;
 bh=pEsBk/1CX2xgWRPlvMgLiWhEWL+m3P52hV5LCf6LOGQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eTEsYhfYEOcld0j8WfzIP4utqRbNs8yDiqyY5dj0hSSaUKQ1JOVEisxVY5FZmXHVo
 3/tk4SZiAyV09edh7aXGlsovR0qSEQx6hbUswl0b8iYxxM/vEobIAg3BoUkGRI1eDP
 zazO+hlPBqfRE5oFrkjRrazvlRcT87jLwBO8K2+B108+vCEy0n1s/Whns08skUaExG
 djWWBaH/UDFv4WahFWutmssy1MZsxFYXM2+YaNQz3uyXNH2taN97D6DBUJ4RUVuLZ1
 ZZNgCrs78wy59OiDp43ZCCTbYMpfi3SvWFQy+hePGJ2F/4WoBd9ddBonjK7Ex60MrS
 m1SG7IcSg1ecA==
Date: Thu, 15 Jun 2023 15:05:37 +0100
From: Lee Jones <lee@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <20230615140537.GF3635807@google.com>
References: <20230609092804.793100-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230609092804.793100-1-amelie.delaunay@foss.st.com>
Cc: Amelie Delaunay <amelie.delaunay@st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH 1/2] mfd: stmfx: Fix error path in
	stmfx_chip_init
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

T24gRnJpLCAwOSBKdW4gMjAyMywgQW1lbGllIERlbGF1bmF5IHdyb3RlOgoKPiBJbiBlcnJvciBw
YXRoLCBkaXNhYmxlIHZkZCByZWd1bGF0b3IgaWYgaXQgZXhpc3RzLCBidXQgZG9uJ3Qgb3Zlcmxv
YWQgcmV0Lgo+IEJlY2F1c2UgaWYgcmVndWxhdG9yX2Rpc2FibGUoKSBpcyBzdWNjZXNzZnVsLCBz
dG1meF9jaGlwX2luaXQgd2lsbCBleGl0Cj4gc3VjY2Vzc2Z1bGx5IHdoaWxlIGNoaXAgaW5pdCBm
YWlsZWQuCj4gCj4gRml4ZXM6IDA2MjUyYWRlOTE1NiAoIm1mZDogQWRkIFNUIE11bHRpLUZ1bmN0
aW9uIGVYcGFuZGVyIChTVE1GWCkgY29yZSBkcml2ZXIiKQo+IFNpZ25lZC1vZmYtYnk6IEFtZWxp
ZSBEZWxhdW5heSA8YW1lbGllLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IC0tLQo+ICBkcml2ZXJz
L21mZC9zdG1meC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCkFwcGxpZWQsIHRoYW5rcwoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
