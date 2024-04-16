Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 759B38A64AE
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 09:16:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 204E7C6B45B;
	Tue, 16 Apr 2024 07:16:03 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D9FEC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 07:16:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 27B82CE0E35;
 Tue, 16 Apr 2024 07:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34BB3C113CE;
 Tue, 16 Apr 2024 07:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1713251757;
 bh=fUF2u2LQ3yYejHYR20qqNgEGI+K7DgTOWHNB8ygVkHk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GM0HpOKvvu3P9UCy4cNIuJYRWvPq5BYD+56S81mhe9N1R9IceqdpHoryxgbw1kGhY
 +JxBBgH51if0tF9gFdKZ10CJHe/4KxL0pZvEaarQ/+kXVYQlIYT+qamLhpoqug094G
 KERgownT5RTB7lAp9I7wg+v4Q+AsaMKUMMeXjVMY=
Date: Tue, 16 Apr 2024 09:15:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Message-ID: <2024041643-unshaven-happiest-1405@gregkh>
References: <20240415-fix-cocci-v1-3-477afb23728b@chromium.org>
 <e0377059-4073-4779-8385-506b9b39301e@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e0377059-4073-4779-8385-506b9b39301e@web.de>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>, kernel-janitors@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Dmitry Osipenko <digetx@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
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
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Bjorn Andersson <andersson@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>
Subject: Re: [Linux-stm32] [PATCH 03/35] media: uvcvideo: Refactor iterators
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

T24gVHVlLCBBcHIgMTYsIDIwMjQgYXQgMDk6MDM6MzZBTSArMDIwMCwgTWFya3VzIEVsZnJpbmcg
d3JvdGU6Cj4gSSB3b3VsZCBmaW5kIGEgaGludCBmb3IgYSB2YXJpYWJsZSBjaGFuZ2UgbW9yZSBh
cHByb3ByaWF0ZSBpbiB0aGUgcGF0Y2ggc3ViamVjdAo+IGluc3RlYWQgb2YgdGhlIHdvcmQg4oCc
aXRlcmF0b3Jz4oCdLgo+IAo+IAo+IOKApgo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS91c2IvdXZj
L3V2Y19jdHJsLmMKPiDigKYKPiA+IEBAIC0yMTc1LDE2ICsyMTc3LDE2IEBAIGludCB1dmNfeHVf
Y3RybF9xdWVyeShzdHJ1Y3QgdXZjX3ZpZGVvX2NoYWluICpjaGFpbiwKPiA+ICAJaW50IHJldDsK
PiA+Cj4gPiAgCS8qIEZpbmQgdGhlIGV4dGVuc2lvbiB1bml0LiAqLwo+IOKApgo+ID4gKwllbnRp
dHkgPSBOVUxMOwo+ID4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KGl0ZXIsICZjaGFpbi0+ZW50aXRp
ZXMsIGNoYWluKSB7Cj4g4oCmCj4gCj4gSSBzdWdnZXN0IHRvIG1vdmUgdGhpcyBhc3NpZ25tZW50
IGludG8gdGhlIGRlZmluaXRpb24gZm9yIHRoZSBhZmZlY3RlZCBsb2NhbCB2YXJpYWJsZS4KPiAK
PiAKPiBCeSB0aGUgd2F5Ogo+IEkgc2VlIGFub3RoZXIgc291cmNlIGNvZGUgYWRqdXN0bWVudCBv
cHBvcnR1bml0eSBpbiB0aGlzIGZ1bmN0aW9uIGltcGxlbWVudGF0aW9uLgo+IGh0dHBzOi8vZWxp
eGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjktcmM0L3NvdXJjZS9kcml2ZXJzL21lZGlhL3VzYi91
dmMvdXZjX2N0cmwuYyNMMjE2NQo+IAo+IENhbiBpdCBiZSBuaWNlciB0byB1c2UgbGFiZWxzIOKA
nGZyZWVfZGF0YeKAnSBhbmQg4oCcdW5sb2Nr4oCdIChpbnN0ZWFkIG9mIOKAnGRvbmXigJ0pPwo+
IEhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gaW5jcmVhc2UgdGhlIGFwcGxpY2F0aW9uIG9mIHNj
b3BlLWJhc2VkIHJlc291cmNlIG1hbmFnZW1lbnQgaGVyZT8KCkhpLAoKVGhpcyBpcyB0aGUgc2Vt
aS1mcmllbmRseSBwYXRjaC1ib3Qgb2YgR3JlZyBLcm9haC1IYXJ0bWFuLgoKTWFya3VzLCB5b3Ug
c2VlbSB0byBoYXZlIHNlbnQgYSBub25zZW5zaWNhbCBvciBvdGhlcndpc2UgcG9pbnRsZXNzCnJl
dmlldyBjb21tZW50IHRvIGEgcGF0Y2ggc3VibWlzc2lvbiBvbiBhIExpbnV4IGtlcm5lbCBkZXZl
bG9wZXIgbWFpbGluZwpsaXN0LiAgSSBzdHJvbmdseSBzdWdnZXN0IHRoYXQgeW91IG5vdCBkbyB0
aGlzIGFueW1vcmUuICBQbGVhc2UgZG8gbm90CmJvdGhlciBkZXZlbG9wZXJzIHdobyBhcmUgYWN0
aXZlbHkgd29ya2luZyB0byBwcm9kdWNlIHBhdGNoZXMgYW5kCmZlYXR1cmVzIHdpdGggY29tbWVu
dHMgdGhhdCwgaW4gdGhlIGVuZCwgYXJlIGEgd2FzdGUgb2YgdGltZS4KClBhdGNoIHN1Ym1pdHRl
ciwgcGxlYXNlIGlnbm9yZSBNYXJrdXMncyBzdWdnZXN0aW9uOyB5b3UgZG8gbm90IG5lZWQgdG8K
Zm9sbG93IGl0IGF0IGFsbC4gIFRoZSBwZXJzb24vYm90L0FJIHRoYXQgc2VudCBpdCBpcyBiZWlu
ZyBpZ25vcmVkIGJ5CmFsbW9zdCBhbGwgTGludXgga2VybmVsIG1haW50YWluZXJzIGZvciBoYXZp
bmcgYSBwZXJzaXN0ZW50IHBhdHRlcm4gb2YKYmVoYXZpb3Igb2YgcHJvZHVjaW5nIGRpc3RyYWN0
aW5nIGFuZCBwb2ludGxlc3MgY29tbWVudGFyeSwgYW5kCmluYWJpbGl0eSB0byBhZGFwdCB0byBm
ZWVkYmFjay4gIFBsZWFzZSBmZWVsIGZyZWUgdG8gYWxzbyBpZ25vcmUgZW1haWxzCmZyb20gdGhl
bS4KCnRoYW5rcywKCmdyZWcgay1oJ3MgcGF0Y2ggZW1haWwgYm90Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
