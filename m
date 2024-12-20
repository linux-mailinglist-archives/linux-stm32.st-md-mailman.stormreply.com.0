Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FB59F97B2
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Dec 2024 18:19:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB2D8C7801F;
	Fri, 20 Dec 2024 17:19:34 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 709ECC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Dec 2024 17:19:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1FDD0A42516;
 Fri, 20 Dec 2024 17:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7491CC4CECD;
 Fri, 20 Dec 2024 17:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734715166;
 bh=FUIqa+Gitn30dawnqBvseQbi6wEPRxT9Aw0rFXxUhzs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ptLZbOdk4hkPS7sLJGgNDzID6wVCo/WUmov2dWeJwFeW1b54vCS8XTfK3IUCres8I
 vC21u/08rQ0XHBDtkzTHB7pAZoI14szwxeY+hq2ypcVwcxUnEdpKmc6mFD0zdTg+yv
 ViEkipvCrPkIy+w89dQFFR6HVAJHjuvr4EjuudrUazMFNEir+Dz8iXhthtISGTLxGO
 qd0gjTFmgibNOVSUldAo/SeEcasfylKAR+DEP2gZATvyqz6Jm7Xqbp5WtsnN57WlMG
 3pxfl4/Aa1Qh3DgqWxHze/kBTsLDgw6o3q5TLObYWB5IdlZ0qFwXyVTXkHAQuCoDA6
 zai2Huh/QaVgw==
Date: Fri, 20 Dec 2024 09:19:24 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "=?UTF-8?B?TsOtY29sYXM=?= F. R. A. Prado" <nfraprado@collabora.com>
Message-ID: <20241220091924.6be11286@kernel.org>
In-Reply-To: <876cf020-e2ba-46a7-b9b2-82dcd47f7a04@notapiano>
References: <20241109-mediatek-mac-wol-noninverted-v2-0-0e264e213878@collabora.com>
 <173155682775.1476954.16636894744432122406.git-patchwork-notify@kernel.org>
 <876cf020-e2ba-46a7-b9b2-82dcd47f7a04@notapiano>
MIME-Version: 1.0
Cc: , edumazet@google.com, patchwork-bot+netdevbpf@kernel.org,
	kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
	robh@kernel.org, bartosz.golaszewski@linaro.org,
	joabreu@synopsys.com, pabeni@redhat.com, ahalaney@redhat.com,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	"=?UTF-8?B?TsOtY29sYXM=?= F. R. A.  Prado" <nfraprado@collabora.com>,
	biao.huang@mediatek.com, linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org@stm-ict-prod-mailman-01.stormreply.prv,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	""@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	andrew+netdev@lunn.ch, horms@kernel.org, krzk+dt@kernel.org,
	davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v2 0/2] net: stmmac: dwmac-mediatek: Fix
 inverted logic for mediatek, mac-wol
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

T24gRnJpLCAyMCBEZWMgMjAyNCAxMzowOTo0NSAtMDMwMCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToKPiBUaGlzIG1lc3NhZ2UgaW1wbGllcyBwYXRjaCAyIHdhcyBhbHNvIGFwcGxpZWQs
IGJ1dCBJIG9ubHkgc2VlIHBhdGNoIDEsIG5vdCBwYXRjaAo+IDIgdGhlcmU6Cj4gaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV0ZGV2L25ldC5naXQvbG9n
Lz9xdD1ncmVwJnE9bWFjLXdvbAo+IAo+IFNvIEkganVzdCB3YW50ZWQgdG8gY29uZmlybSB3aGV0
aGVyIGl0IHdhcyBhcHBsaWVkIG9yIG5vdC4gSXQgd291bGQgYmUgZmluZSBmb3IKPiBwYXRjaCAy
IHRvIGJlIG1lcmdlZCB0aHJvdWdoIHRoZSBtZWRpYXRlayB0cmVlIGFzIGlzIHVzdWFsIGlmIHlv
dSBoYXZlbid0Cj4gYWxyZWFkeSB0YWtlbiBpdC4KClllcywgdGhlIERUUyBwYXRjaCBuZWVkcyB0
byBnbyB2aWEgdGhlIGFwcHJvcHJpYXRlIHBsYXRmb3JtIHRyZWUuClNvcnJ5IGZvciBub3QgY2Fs
bGluZyBpdCBvdXQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
