Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9741C6955FD
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Feb 2023 02:36:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40BBEC6A5F6;
	Tue, 14 Feb 2023 01:36:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BFECC69069
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Feb 2023 01:36:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AA3B660C09;
 Tue, 14 Feb 2023 01:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A20C433D2;
 Tue, 14 Feb 2023 01:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676338575;
 bh=FFy3lBM5uwSNctUSfNnw4D9KRyYy9ynrHfsioBN+Vbg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=t+rzlY+kCjtd4mn1aybZotX4qyDWKo653us8eXPu5k3nlUVZlesuC8t294fxkZLdG
 zODm2RgQ4om91rrYXRRrqQombri4duB3UzPwFUIvV6F0M/4qJxDD9AZr1PzJSdfJr3
 Cj+P3AjKP/24HkhRz1ZxBrXYYILQa//7P+1gkDpr4iRIASDAsgDI2YDfi6GT6PPHI1
 kQ2HA2dVUAHc2DPDUe4xhIEfF5OgHf8ohlnwX+sKjGGz4ngFvvgE9UajAmPl2Z5ppo
 3zWkyBDogBzTrB4JtV3dNBI1DUelhs0cunGwrAjGyBwxoNkcuc1ChSieCKxfO1Rx23
 pYlUDzYmg5yAQ==
Date: Mon, 13 Feb 2023 17:36:13 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20230213173613.67512a1e@kernel.org>
In-Reply-To: <20230213162333.iqjlwa2ladkxfooy@pengutronix.de>
References: <20230211112431.214252-1-u.kleine-koenig@pengutronix.de>
 <Y+pHZ75Ynp5xkgQy@lincoln>
 <20230213162333.iqjlwa2ladkxfooy@pengutronix.de>
MIME-Version: 1.0
Cc: Larysa Zaremba <larysa.zaremba@intel.com>, netdev@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, kernel@pengutronix.de,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] net: stmmac: Make stmmac_dvr_remove()
	return void
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

T24gTW9uLCAxMyBGZWIgMjAyMyAxNzoyMzozMyArMDEwMCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90
ZToKPiA+IENvZGUgaW4gYm90aCBwYXRjaGVzIGxvb2tzIE9LLiAgCj4gCj4gSXMgdGhpcyBhbiBB
Y2s/CgpGV0lXIHdlIGVuY291cmFnZSBmb2xrcyBvbiBuZXRkZXYgd2hvIHJldmlld2VkIGEgcGF0
Y2ggdG8gc3BlYWsgdXAsCmV2ZW4gaWYgdGhleSBkb24ndCBmZWVsIGNvbmZpZGVudCBlbm91Z2gg
dG8gc2VuZCBhIHBlcnNpc3RlbnQgdGFnLgoKPiA+IEFsc28sIG11bHRpcGxlIHBhdGNoZXMgdXN1
YWxseSByZXF1aXJlIGEgY292ZXIgbGV0dGVyLiBUaGUgY29kZSBjaGFuZ2VzIGFyZSAKPiA+IHRy
aXZpYWwsIHNvIG1heWJlIHRoZSBiZXN0IHNvbHV0aW9uIHdvdWxkIGJlIHRvIGp1c3QgdG8gc3F1
YXNoIHRob3NlIHBhdGNoZXMgCj4gPiB0b2dldGhlci4gIAo+IAo+IE15IGNvbmNsdXNpb24gd2Fz
IGEgYml0IGRpZmZlcmVudDogVGhlIGNvZGUgY2hhbmdlcyBhcmUgdHJpdmlhbCwgc28gdGhleQo+
IGRvbid0IHJlcXVpcmUgYSBjb3ZlciBsZXR0ZXIgOi0pCj4gCj4gSSBkb24ndCBjYXJlIG11Y2gg
YWJvdXQgc3F1YXNoaW5nIHRoZSB0d28gcGF0Y2hlcyB0b2dldGhlci4gSSBzbGlnaHRseQo+IHBy
ZWZlciB0byBrZWVwIHRoZSBjaGFuZ2VzIGFzIHR3byBjaGFuZ2VzIGFzIHRoZSBjaGFuZ2VzIGFy
ZSBvcnRob2dvbmFsCj4gYW5kIG9uZSBwYXRjaCBwZXIgdGhpbmcgaXMgdGhlIHVzdWFsIGFjdGlv
bi4KCkZhaXIgZW5vdWdoLCAyIHBhdGNoZXMgYXJlIGZpbmUgdy9vIGEgY292ZXIgbGV0dGVyLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
