Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 491E3547635
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Jun 2022 17:41:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08A9DC0D2BB;
	Sat, 11 Jun 2022 15:41:42 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A97DAC03FFF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Jun 2022 15:41:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8C43661138;
 Sat, 11 Jun 2022 15:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3327C34116;
 Sat, 11 Jun 2022 15:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654962099;
 bh=WarFohc9AefJgaCIQlkHm40D8Wfs78SeRMzjeAKfx4M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kEAxk8HVupWHd5I6Rj3KedDoeCuYF35epsuBXMhaICxi8INQwZtjIZMawVF8FvqtL
 JPcIuigeGH61rUyJFpIQ1APrwxcyg8DSF3EgKwOxHckL1YXY7xOVDHIdeOu5tzXVgq
 DkivCQ5HeT/G1bmC2YkjnLQeQ0BkJ1l5mnty48UCr5Tm0t3mxhiMb6yEOioh5dcz33
 caK4CH3CSp1ReI734M0SGWDo4Q37NAu1Qq3WDwqs6+W9WhI3FwIshlZ9sSmhctKfxt
 My8E4nxFNF+Ywe8ZGhtM8D6WeWRNRXgT+gplAgEQAtHoXXgPawUVc8mFYOo9J7E/Ie
 Bi1QYaLlMhxLA==
Date: Sat, 11 Jun 2022 16:50:38 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-ID: <20220611165038.669dd8e4@jic23-huawei>
In-Reply-To: <CAHp75VevzkT-WYz=BiWhDAETx==Sswe-rYCo_qxy7vyL2qRwVA@mail.gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <CAHp75VfhRoDupB2rFS+hg1zFN3=8RhnBcXrg0O72bKJYQz+8Kg@mail.gmail.com>
 <CAHp75VevzkT-WYz=BiWhDAETx==Sswe-rYCo_qxy7vyL2qRwVA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: chrome-platform@lists.linux.dev,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
	Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	moderated@stm-ict-prod-mailman-01.stormreply.prv,
	"list:ARM/Mediatek"@stm-ict-prod-mailman-01.stormreply.prv,
	SoC@stm-ict-prod-mailman-01.stormreply.prv,
	support@stm-ict-prod-mailman-01.stormreply.prv,
	"         <linux-mediatek@lists.infradead.org>,  linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm  <linux-arm-msm@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>,  OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cai Huoqing  <cai.huoqing@linux.dev>, Benjamin Fair <benjaminfair@google.com>, Jishnu  Prakash <quic_jprakash@quicinc.com>, Linus Walleij  <linus.walleij@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, Alexandre  Torgue <alexandre.torgue@foss.st.com>, Amit Kucheria <amitk@kernel.org>,  Andy Gross <agross@kernel.org>, Michael Hennerich  <Michael.Hennerich@analog.com>, Haibo Chen <haibo.chen@nxp.com>, Benson  Leung <bleung@chromium.org>, ,  linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>"@stm-ict-prod-mailman-01.stormreply.prv
Subject: Re: [Linux-stm32] [PATCH 00/34] make iio inkern interface firmware
	agnostic
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

T24gRnJpLCAxMCBKdW4gMjAyMiAxNzoyODoyNCArMDIwMApBbmR5IFNoZXZjaGVua28gPGFuZHku
c2hldmNoZW5rb0BnbWFpbC5jb20+IHdyb3RlOgoKPiBPbiBGcmksIEp1biAxMCwgMjAyMiBhdCA0
OjQ4IFBNIEFuZHkgU2hldmNoZW5rbwo+IDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPiB3cm90
ZToKPiA+IE9uIEZyaSwgSnVuIDEwLCAyMDIyIGF0IDEwOjQ1IEFNIE51bm8gU8OhIDxudW5vLnNh
QGFuYWxvZy5jb20+IHdyb3RlOiAgCj4gCj4gPiBSZXZpZXdlZC1ieTogQW5keSBTaGV2Y2hlbmtv
IDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPiAgCj4gCj4gRGl0dG8gZm9yIHBhdGNoZXMgMjYt
MzQuCj4gCgpJJ20gZmluZSB3aXRoIGFsbCB0aGUgcGF0Y2hlcyBJIGhhdmVuJ3QgY29tbWVudGVk
IG9uLCBidXQgc29tZQpvZiB0aGUgZ2VuZXJpYyBmd25vZGUgY29udmVyc2lvbnMgYXJlIGNvbXBs
ZXggYXMgc3VjaCB0aGluZ3MgZ28sIHNvCm1vcmUgZXllcyBvbiB0aGVtIGFuZCB0aGUgY29yZSBj
aGFuZ2VzIHdvdWxkIGJlIGdyZWF0LgoKVGhhbmtzLAoKSm9uYXRoYW4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
