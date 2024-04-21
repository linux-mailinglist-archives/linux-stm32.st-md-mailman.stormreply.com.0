Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B48CB8ABF54
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Apr 2024 15:48:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D56FC6DD67;
	Sun, 21 Apr 2024 13:48:24 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB748C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Apr 2024 13:48:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 33EB6601BA;
 Sun, 21 Apr 2024 13:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D77EC113CE;
 Sun, 21 Apr 2024 13:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1713707300;
 bh=LlUgqYs3MCsI8tfMXyODmqS8Vxzo+bhP7dqc9s6OIOs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E2HQZsOpXkpKHudpdluczuDQnp4aiFdqJ82dLDH1II7kBwQkMvcWNiCIkeSoP5rWm
 m9nZ2jQglkE44ukF7sxlCBCK/PQXihvUDzufJomZBn2n9OqRQMJ6Ud/dSxNSDJpwTv
 Lg9wQiO5BEJ/8jDnKp9G7q+/3ehh9dAKnAX9ycsg=
Date: Sun, 21 Apr 2024 15:48:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Message-ID: <2024042112-deferred-fantastic-5b4b@gregkh>
References: <20240419-fix-cocci-v2-24-2119e692309c@chromium.org>
 <0ab13de0-0fde-40e2-958f-6a0818911009@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0ab13de0-0fde-40e2-958f-6a0818911009@web.de>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>, kernel-janitors@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sergey Kozlov <serjk@netup.ru>, Samuel Holland <samuel@sholland.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-staging@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev,
 linux-media@vger.kernel.org, Abylay Ospan <aospan@netup.ru>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>
Subject: Re: [Linux-stm32] [PATCH v2 24/26] media: venus: venc: Make
 explicit the range of us_per_frame
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

T24gU3VuLCBBcHIgMjEsIDIwMjQgYXQgMDM6MjU6MzFQTSArMDIwMCwgTWFya3VzIEVsZnJpbmcg
d3JvdGU6Cj4gPiBVbmxlc3MgdGhlIGZwcyBpcyBzbWFsbGVyIHRoYW4gMC4wMDAyMzI4MjkgZnBz
LCB0aGlzIGZpdHMgaW4gYSAzMiBiaXQgbnVtYmVyLgo+ID4gTWFrZSB0aGF0IGV4cGxpY2l0Lgo+
IAo+IFdvdWxkIGl0IGJlIG1vcmUgYXBwcm9wcmlhdGUgdG8gbW92ZSB0aGUgd29yZCDigJxleHBs
aWNpdOKAnSB0byB0aGUgZW5kCj4gb2YgdGhlIHN1bW1hcnkgcGhyYXNlPwo+IAo+IFJlZ2FyZHMs
Cj4gTWFya3VzCj4gCgpIaSwKClRoaXMgaXMgdGhlIHNlbWktZnJpZW5kbHkgcGF0Y2gtYm90IG9m
IEdyZWcgS3JvYWgtSGFydG1hbi4KCk1hcmt1cywgeW91IHNlZW0gdG8gaGF2ZSBzZW50IGEgbm9u
c2Vuc2ljYWwgb3Igb3RoZXJ3aXNlIHBvaW50bGVzcwpyZXZpZXcgY29tbWVudCB0byBhIHBhdGNo
IHN1Ym1pc3Npb24gb24gYSBMaW51eCBrZXJuZWwgZGV2ZWxvcGVyIG1haWxpbmcKbGlzdC4gIEkg
c3Ryb25nbHkgc3VnZ2VzdCB0aGF0IHlvdSBub3QgZG8gdGhpcyBhbnltb3JlLiAgUGxlYXNlIGRv
IG5vdApib3RoZXIgZGV2ZWxvcGVycyB3aG8gYXJlIGFjdGl2ZWx5IHdvcmtpbmcgdG8gcHJvZHVj
ZSBwYXRjaGVzIGFuZApmZWF0dXJlcyB3aXRoIGNvbW1lbnRzIHRoYXQsIGluIHRoZSBlbmQsIGFy
ZSBhIHdhc3RlIG9mIHRpbWUuCgpQYXRjaCBzdWJtaXR0ZXIsIHBsZWFzZSBpZ25vcmUgTWFya3Vz
J3Mgc3VnZ2VzdGlvbjsgeW91IGRvIG5vdCBuZWVkIHRvCmZvbGxvdyBpdCBhdCBhbGwuICBUaGUg
cGVyc29uL2JvdC9BSSB0aGF0IHNlbnQgaXQgaXMgYmVpbmcgaWdub3JlZCBieQphbG1vc3QgYWxs
IExpbnV4IGtlcm5lbCBtYWludGFpbmVycyBmb3IgaGF2aW5nIGEgcGVyc2lzdGVudCBwYXR0ZXJu
IG9mCmJlaGF2aW9yIG9mIHByb2R1Y2luZyBkaXN0cmFjdGluZyBhbmQgcG9pbnRsZXNzIGNvbW1l
bnRhcnksIGFuZAppbmFiaWxpdHkgdG8gYWRhcHQgdG8gZmVlZGJhY2suICBQbGVhc2UgZmVlbCBm
cmVlIHRvIGFsc28gaWdub3JlIGVtYWlscwpmcm9tIHRoZW0uCgp0aGFua3MsCgpncmVnIGstaCdz
IHBhdGNoIGVtYWlsIGJvdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
