Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D354F752415
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jul 2023 15:41:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BBCDC6B452;
	Thu, 13 Jul 2023 13:41:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D3ECC6B44E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jul 2023 13:41:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0B3E4612BC;
 Thu, 13 Jul 2023 13:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2432C433C8;
 Thu, 13 Jul 2023 13:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689255715;
 bh=XQ7GI5seauSP1zdgzOW9xfeQzw1DgF5EQVEBjlhLDx8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PHgb01g71DiomiYZebiqegzv1Y1Yk77El/q56VCQHGRl9yPyKmrPtMwBcr51beDfZ
 2S6OntPipyVx6evbRLKBP4XyQv+ng2kO1wcKxWUDXj8vfYmqOH9/CzPUTbxk4zFsdz
 2yQbw9S5wzgqxCA7ZwrYUlZkCOAiutpNSuOhVm4oc6T42VnWcPeKEOtHrpO2ciXYsY
 yxaY5rllmTAMaAKgmRh8NE1qe5P0KwYMFyiGVb7UFzjRev+TwCwCGOmm4NclrMGDnR
 K43QKGic+7l0UJ+A8N5sxZ0AbW7nqQceqorA7fXAVBmGGfWMM1tRqjQdK9SWC7c5pg
 cR0C9QTGKuYiw==
Date: Thu, 13 Jul 2023 14:41:50 +0100
From: Lee Jones <lee@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <20230713134150.GB10768@google.com>
References: <20230706113939.1178-1-frank.li@vivo.com>
 <20230706113939.1178-6-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230706113939.1178-6-frank.li@vivo.com>
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 6/7] mfd: stm32-timers: Use
 devm_platform_get_and_ioremap_resource()
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

T24gVGh1LCAwNiBKdWwgMjAyMywgWWFuZ3RhbyBMaSB3cm90ZToKCj4gQ29udmVydCBwbGF0Zm9y
bV9nZXRfcmVzb3VyY2UoKSwgZGV2bV9pb3JlbWFwX3Jlc291cmNlKCkgdG8gYSBzaW5nbGUKPiBj
YWxsIHRvIGRldm1fcGxhdGZvcm1fZ2V0X2FuZF9pb3JlbWFwX3Jlc291cmNlKCksIGFzIHRoaXMg
aXMgZXhhY3RseQo+IHdoYXQgdGhpcyBmdW5jdGlvbiBkb2VzLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFlhbmd0YW8gTGkgPGZyYW5rLmxpQHZpdm8uY29tPgo+IC0tLQo+ICBkcml2ZXJzL21mZC9zdG0z
Mi10aW1lcnMuYyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBk
ZWxldGlvbnMoLSkKCkFwcGxpZWQsIHRoYW5rcwoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
