Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 315526E9068
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Apr 2023 12:37:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFF3DC65E4F;
	Thu, 20 Apr 2023 10:37:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCFB4C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Apr 2023 10:37:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B05A060C38;
 Thu, 20 Apr 2023 10:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F8F4C433EF;
 Thu, 20 Apr 2023 10:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681987061;
 bh=irIU68TcV1yMUBP/LKJhStaIl6jVDYhAMhhYqnF1eW8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=omLgnpysdHVrU2VELnr+Wq6EVXsIuE6bnDWe5Te9H5bYjA5MKKrcQtyZdYEhylgc0
 apTMvsMuV++GALQgMJa30CSJbCmATJOYMwdB9oa57KYsdg+Xy67IrdDwYhFQ8OReNA
 LoA+dnm+c/Y4ygXAvSdjzk964hU2WQX0+QG+8xVW6P/9QiOejsffd5vZrix524h7sJ
 gXh34cg6vIR0Cst31cCITkcwPAI5CG/zjdI6wNZNP8Iaf2zkh70jxXJhOkdL9dpLJA
 +TJd2gQt/6J8e7N/R6GK1WlTYW+uLEyJD5qFQntL3O9C/+bhUUpf0Aim0E5zxyvQ66
 WapKzR7cXu9XA==
Date: Thu, 20 Apr 2023 11:37:35 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20230420103735.GK9904@google.com>
References: <20230417181342.v2.1.I483a676579cc7e3ac07e1db649091553743fecc8@changeid>
 <fde49fb8-c337-3a6b-811e-b9d7c3620393@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fde49fb8-c337-3a6b-811e-b9d7c3620393@linaro.org>
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: mfd: stm32: Remove
 unnecessary blank lines
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

T24gVHVlLCAxOCBBcHIgMjAyMywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKCj4gT24gMTcv
MDQvMjAyMyAxODoxNCwgUGF0cmljayBEZWxhdW5heSB3cm90ZToKPiA+IFJlbW92ZSBkb3VibGUg
YmxhbmsgbGluZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0
cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiA+IC0tLQo+ID4gCj4gPiBDaGFuZ2VzIGluIHYy
Ogo+ID4gLSB1cGRhdGUgY29tbWl0IHRpdGxlIGFuZCBjb21taXQgbWVzc2FnZSB0byByZWZsZWN0
IHdoYXQgdGhlIGNoYW5nZSBpcwo+ID4gICBWMT0iZHQtYmluZGluZ3M6IG1mZDogc3RtMzI6IEZp
eCBTVE0zMkY0IERUIGluY2x1ZGUgZmlsCj4gCj4gTW9yZSB0aGFuIG9uZSBmaWxlIGhhcyB0aGUg
c2FtZSBpc3N1ZS4gVGhpcyBpcyBxdWl0ZSBhIGNodXJuIHRvIGhhbmRsZQo+IHN1Y2ggcGF0Y2gg
b25lIGJ5IG9uZS4gUGxlYXNlIGZpeCBhbGwgb2YgdGhlbSBvciBqdXN0IHNraXAsIGFzIGl0IGlz
Cj4gaGFybWxlc3MuCgpJdCB3YXMgZWFzaWVyIHRvIGp1c3QgYXBwbHkgaXQgdGhpcyB0aW1lLgoK
LS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
