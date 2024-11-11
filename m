Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7969D417F
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 18:49:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFBAFC7A840;
	Wed, 20 Nov 2024 17:49:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E3BDC78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 14:27:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A6DEE5C5A59;
 Mon, 11 Nov 2024 14:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70BCC4CECF;
 Mon, 11 Nov 2024 14:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731335259;
 bh=0HBp91eFMMg3rKBeBDysVTX9mLxQIHz9phYBimdndCc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sbqA4CXwcNwBw8gvLUFLeNBaL48iTGzehpPg5Yhv0GwvduUO+nKVZahYoI2wdEQwi
 4BNpw+B4xRdHlzD8ZyUoZWhF5lpd4KL6Favdt3REZqqZPEs1OiVJEOyZi0zSAtx6Cs
 x98lCeuqTAtNNPvzPEejZyU7/45eOlFzcPYAGfmBltgfjVMo53DDBzpnarihw20/GQ
 Qx//WwmaP/HOa/mfOyQ8KAIi4S8s4d9/0eHgLGOyZngJWGH7ScMg5NMrS3NVTOY8kK
 r1Q0pjJW9N/UYlHS5ULw6XjL59ERlJ3eskvHZN2pzq/AD9x/6G5ScRAspOKKfeKuFJ
 I1AzT8XdOb8vg==
Message-ID: <0c2f2274-4487-4d7e-a558-cb9608f59118@kernel.org>
Date: Mon, 11 Nov 2024 16:27:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <1a44c5fc95616d64157d2f4a55f460476d382554.1730987047.git.ukleinek@kernel.org>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <1a44c5fc95616d64157d2f4a55f460476d382554.1730987047.git.ukleinek@kernel.org>
X-Mailman-Approved-At: Wed, 20 Nov 2024 17:49:43 +0000
Cc: Tony Lindgren <tony@atomide.com>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Yong Wu <yong.wu@mediatek.com>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Markus Mayer <mmayer@broadcom.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Georgi Djakov <djakov@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32] [PATCH] memory: Switch back to struct
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiAwNy8xMS8yMDI0IDE2OjU3LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBBZnRlciBj
b21taXQgMGVkYjU1NWE2NWQxICgicGxhdGZvcm06IE1ha2UgcGxhdGZvcm1fZHJpdmVyOjpyZW1v
dmUoKQo+IHJldHVybiB2b2lkIikgLnJlbW92ZSgpIGlzIChhZ2FpbikgdGhlIHJpZ2h0IGNhbGxi
YWNrIHRvIGltcGxlbWVudCBmb3IKPiBwbGF0Zm9ybSBkcml2ZXJzLgo+IAo+IENvbnZlcnQgYWxs
IHBsYXRmb3JtIGRyaXZlcnMgYmVsb3cgZHJpdmVycy9tZW1vcnkgdG8gdXNlIC5yZW1vdmUoKSwg
d2l0aAo+IHRoZSBldmVudHVhbCBnb2FsIHRvIGRyb3Agc3RydWN0IHBsYXRmb3JtX2RyaXZlcjo6
cmVtb3ZlX25ldygpLiBBcwo+IC5yZW1vdmUoKSBhbmQgLnJlbW92ZV9uZXcoKSBoYXZlIHRoZSBz
YW1lIHByb3RvdHlwZXMsIGNvbnZlcnNpb24gaXMgZG9uZQo+IGJ5IGp1c3QgY2hhbmdpbmcgdGhl
IHN0cnVjdHVyZSBtZW1iZXIgbmFtZSBpbiB0aGUgZHJpdmVyIGluaXRpYWxpemVyLgo+IAo+IEEg
ZmV3IHdoaXRlIHNwYWNlIGNoYW5nZXMgYXJlIGluY2x1ZGVkIHRvIG1ha2UgaW5kZW50aW9uIGNv
bnNpc3RlbnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5l
LWtvZW5pZ0BiYXlsaWJyZS5jb20+Cgpmb3IgZHJpdmVycy9tZW1vcnkvb21hcC1ncG1jLmMgCgpS
ZXZpZXdlZC1ieTogUm9nZXIgUXVhZHJvcyA8cm9nZXJxQGtlcm5lbC5vcmc+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
