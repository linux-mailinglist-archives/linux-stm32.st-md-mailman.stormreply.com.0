Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD3AA33960
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Feb 2025 08:57:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04C8BC78039;
	Thu, 13 Feb 2025 07:57:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56A21C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2025 07:57:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D0C445C4D0E;
 Thu, 13 Feb 2025 07:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563A1C4CEE6;
 Thu, 13 Feb 2025 07:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739433457;
 bh=zAmZ9xhiq8AXtyaFiGG3zq+eLh9vDaybujcV5FJePmU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YuCe6YmMraQeOLhCTzFKEp7FsiwxtYMnMqqqQczqDqPoZfQIIGYw4rWgT0XHnefHM
 uJzMxTRF7rAdEDhsQhWUbnHzUfwhexTt1bQ6gI5sQc4FBDcS9znLTeOlbpNP6mo/qv
 HGb5lJI4iw3u/dplus1e1lwAb103VFGxntzBF08kjwymvR+NLO4Vv7OCuIbGdObrYH
 kArN1GuZWIP20JbAanqGNj13PEcqHyMs/NWgKXTZ+JKiMSx9fvm5KBbuTiDE4Gx871
 4yJNcxl8388GkxH5MCTOJiW1ouB4Sg57ojJIfHQZUsUfvv9KYzLFFYYFuxf3A30i2s
 85XLrVRZt02lw==
Date: Thu, 13 Feb 2025 08:57:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: patrice.chotard@foss.st.com
Message-ID: <20250213-tuscan-coot-of-enrichment-5ae952@krzk-bin>
References: <20250210131826.220318-1-patrice.chotard@foss.st.com>
 <20250210131826.220318-2-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250210131826.220318-2-patrice.chotard@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/8] dt-bindings: spi: Add STM32 OSPI
	controller
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

T24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgMDI6MTg6MTlQTSArMDEwMCwgcGF0cmljZS5jaG90YXJk
QGZvc3Muc3QuY29tIHdyb3RlOgo+IEZyb206IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90
YXJkQGZvc3Muc3QuY29tPgo+IAo+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhlIFNU
TTMyIE9TUEkgY29udHJvbGxlci4KPiAKPiBNYWluIGZlYXR1cmVzIG9mIHRoZSBPY3RvLVNQSSBj
b250cm9sbGVyIDoKPiAgIC0gc3VwcG9ydCBzTk9SIC8gc05BTkQgLyBIeXBlclJBTeKEoiBhbmQg
SHlwZXJGbGFzaOKEoiBkZXZpY2VzLgo+ICAgLSBUaHJlZSBmdW5jdGlvbmFsIG1vZGVzOiBpbmRp
cmVjdCwgYXV0b21hdGljLXN0YXR1cyBwb2xsaW5nLAoKUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBL
b3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KCkJlc3QgcmVnYXJkcywK
S3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
