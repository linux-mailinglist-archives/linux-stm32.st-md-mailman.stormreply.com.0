Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCBA9D2607
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Nov 2024 13:41:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BFC9C78F99;
	Tue, 19 Nov 2024 12:41:26 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D569BC78F97
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 12:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732020078;
 bh=cPzqU9OqmO7u8YLVierk+4DHkUIpDJShKogyzpU9sr8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mdH2S+g9iIIUkwu6OK9t+P634eEtcTQhCLBRCd7DJ99o+FskSqjtk4SX+Zs6Ut0OT
 67iPCFaxYUm+RX1DVCFGNhd1V3IAszwkm2jr68z06mTU7vYh5pVneieDjI5UpV9mZS
 SfHIOVpCGCjLkuzOA35zzLcqisX2oOdyg0KNXavPyuh+DCf96343SovzFzxEZRq336
 z8wZHzFYlMNi2L0tq99t0XAK8v0Nqo044pOxyvBzG+uDkh2OxalxW1bAkwJgGpFgbh
 jvgE7HOTRye0az+pgV3rCOtmvGQpRdZdoCT9vlA3VwQSGuUHr9Gk7zpBKpBfA4YbV2
 HEHme4PqsCZMg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6E90117E365E;
 Tue, 19 Nov 2024 13:41:17 +0100 (CET)
Message-ID: <0dc25339-8806-4a59-8350-75eea5e826ab@collabora.com>
Date: Tue, 19 Nov 2024 13:41:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
References: <6f0297ba884c670d604232c2861347940082c8e6.1732004078.git.u.kleine-koenig@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <6f0297ba884c670d604232c2861347940082c8e6.1732004078.git.u.kleine-koenig@baylibre.com>
Cc: imx@lists.linux.dev, Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] mailbox: Switch back to struct
	platform_driver::remove()
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SWwgMTkvMTEvMjQgMDk6MTYsIFV3ZSBLbGVpbmUtS8O2bmlnIGhhIHNjcml0dG86Cj4gQWZ0ZXIg
Y29tbWl0IDBlZGI1NTVhNjVkMSAoInBsYXRmb3JtOiBNYWtlIHBsYXRmb3JtX2RyaXZlcjo6cmVt
b3ZlKCkKPiByZXR1cm4gdm9pZCIpIC5yZW1vdmUoKSBpcyAoYWdhaW4pIHRoZSByaWdodCBjYWxs
YmFjayB0byBpbXBsZW1lbnQgZm9yCj4gcGxhdGZvcm0gZHJpdmVycy4KPiAKPiBDb252ZXJ0IGFs
bCBwbGF0Zm9ybSBkcml2ZXJzIGJlbG93IGRyaXZlcnMvbWFpbGJveCB0byB1c2UgLnJlbW92ZSgp
LAo+IHdpdGggdGhlIGV2ZW50dWFsIGdvYWwgdG8gZHJvcCBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVy
OjpyZW1vdmVfbmV3KCkuIEFzCj4gLnJlbW92ZSgpIGFuZCAucmVtb3ZlX25ldygpIGhhdmUgdGhl
IHNhbWUgcHJvdG90eXBlcywgY29udmVyc2lvbiBpcyBkb25lCj4gYnkganVzdCBjaGFuZ2luZyB0
aGUgc3RydWN0dXJlIG1lbWJlciBuYW1lIGluIHRoZSBkcml2ZXIgaW5pdGlhbGl6ZXIuCj4gCj4g
TWFrZSBhIGZldyBpbmRlbnRpb25zIGNvbnNpc3RlbnQgd2hpbGUgdG91Y2hpbmcgdGhlc2Ugc3Ry
dWN0Cj4gaW5pdGlhbGl6ZXJzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmln
IDx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPgoKTWVkaWFUZWs6CgpSZXZpZXdlZC1ieTog
QW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29s
bGFib3JhLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
