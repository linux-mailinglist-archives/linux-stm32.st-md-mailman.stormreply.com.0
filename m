Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01451731ACA
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 16:06:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA2A3C65E58;
	Thu, 15 Jun 2023 14:06:05 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 715EDC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 14:06:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5C1CB62B57;
 Thu, 15 Jun 2023 14:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5466C433C0;
 Thu, 15 Jun 2023 14:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686837962;
 bh=2M6qrF4ORzCFN2c/lRhl6bHd4E8kwP4xtKpvVV/KLPQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SZ2j3/pqpnU3o0tWYY25t99Y4mtVRiNp4oN92bIm4SGfe5/v0MZI4RdQ1BuSrNUyI
 LKqNNYvYRHa7W62924yI+Oam42zxLrno6NgnmKv0xBem/Q2Z7XfSQHNh5GggpRLoVq
 euBJj5ihapWfib7GEbcoSVn7VELv/pYcEhsoz79HLG1baXAG7sI4tkas7UTSameS0K
 V4qRtM1xMt7234aPLA09cm3wLgpx/S6Z1c52XWvtsd7+r2orcPSpJa5u1Wq1Tu6UdC
 4xZUpScsLiwj0zxdz8/tuR26Y4Mcan6RHALDjjbprZqXGkz5zDtPVzihNxBc+AAIxG
 D122hUsy/SxuA==
Date: Thu, 15 Jun 2023 15:05:57 +0100
From: Lee Jones <lee@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <20230615140557.GG3635807@google.com>
References: <20230609092804.793100-1-amelie.delaunay@foss.st.com>
 <20230609092804.793100-2-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230609092804.793100-2-amelie.delaunay@foss.st.com>
Cc: Amelie Delaunay <amelie.delaunay@st.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH 2/2] mfd: stmfx: Nullify stmfx->vdd
 in case of error
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

T24gRnJpLCAwOSBKdW4gMjAyMywgQW1lbGllIERlbGF1bmF5IHdyb3RlOgoKPiBOdWxsaWZ5IHN0
bWZ4LT52ZGQgaW4gY2FzZSBkZXZtX3JlZ3VsYXRvcl9nZXRfb3B0aW9uYWwoKSByZXR1cm5zIGFu
IGVycm9yLgo+IEFuZCBzaW1wbGlmeSBjb2RlIGJ5IHJldHVybmluZyBhbiBlcnJvciBvbmx5IGlm
IHJldHVybiBjb2RlIGlzIG5vdCAtRU5PREVWLAo+IHdoaWNoIG1lYW5zIHRoZXJlIGlzIG5vIHZk
ZCByZWd1bGF0b3IgYW5kIGl0IGlzIG5vdCBhbiBpc3N1ZS4KPiAKPiBGaXhlczogZDc1ODQ2ZWQw
OGU2ICgibWZkOiBzdG1meDogRml4IGRldl9lcnJfcHJvYmUoKSBjYWxsIGluIHN0bWZ4X2NoaXBf
aW5pdCgpIikKPiBTaWduZWQtb2ZmLWJ5OiBBbWVsaWUgRGVsYXVuYXkgPGFtZWxpZS5kZWxhdW5h
eUBmb3NzLnN0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tZmQvc3RtZnguYyB8IDUgKystLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCkFwcGxpZWQs
IHRoYW5rcwoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
