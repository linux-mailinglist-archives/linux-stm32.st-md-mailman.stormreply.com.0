Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C6578573E
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Aug 2023 13:53:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21E66C6B44C;
	Wed, 23 Aug 2023 11:53:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C40A6C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Aug 2023 11:53:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7EFC0660D8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Aug 2023 11:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CDA8C43395
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Aug 2023 11:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692791620;
 bh=9ozTPMOCGjgHLaJa54zNz+3htX4e52MyhqXdip941jo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=l24jGUE83dTC5LIpesTj/6es0p1WS7ylU3MUON3FJiuoWQxxRCjlR5z3wIFk4K+oU
 K2AWIcTPkmDsluBNADDyBlpMDLA8Rp+uKKqJoCHs0avzOBmXGyOqYqn+BCh16bjUI2
 hvhq9h51Ry+gIiCJSOxxraYuuki2GsBa0J1eiiJ7gXumwLCguGvREwpTyW9YV+YEk7
 dNwAKeoP3UDdpi+bdNOnHPI9JPaBhU60YEN1dK+7znlOZ/CRo/Tve9mIsDAErxAZ59
 jKyyPyla2DIuaYkyUmtM5hqQ6DDKwQ7Gc/a1lvWnat8Yxav7r0p1B08W1yk1QFolNU
 SsschzuYYGj6A==
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2b9a2033978so85419751fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Aug 2023 04:53:39 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw4xPj3kfT94wg+pAXyge9kiMx6JmfYMR0pFKxjBSU+vNqqMjtQ
 8hCV11XSgvXP5hYOvRtZjRM1mS0CcmjX7keweQ==
X-Google-Smtp-Source: AGHT+IG6AYWn2ZBtqiggebw0M0LEoLpjEjEkmAuyxGb6SqXHXb0v7iaIhaSPWuqzMe7IxI9zjdhMNEvmSNHymSTc/JA=
X-Received: by 2002:a2e:7008:0:b0:2bc:d8fd:13df with SMTP id
 l8-20020a2e7008000000b002bcd8fd13dfmr2086615ljc.41.1692791617967; Wed, 23 Aug
 2023 04:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174702.4059100-1-robh@kernel.org>
 <CABb+yY0ZEkU2fEoFcihDM0GPuNBkCJHYXfkq-+bLJY1xtbf5Jw@mail.gmail.com>
In-Reply-To: <CABb+yY0ZEkU2fEoFcihDM0GPuNBkCJHYXfkq-+bLJY1xtbf5Jw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 23 Aug 2023 06:53:25 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+EbxHkdXEJsgAETrQj8Ps30umOMcArt1fCaNumxBem5A@mail.gmail.com>
Message-ID: <CAL_Jsq+EbxHkdXEJsgAETrQj8Ps30umOMcArt1fCaNumxBem5A@mail.gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-tegra@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Chunyan Zhang <zhang.lyra@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Orson Zhai <orsonzhai@gmail.com>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] mailbox: Explicitly include correct DT
	includes
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

T24gVHVlLCBBdWcgMjIsIDIwMjMgYXQgNjowNeKAr1BNIEphc3NpIEJyYXIgPGphc3Npc2luZ2hi
cmFyQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1bCAxNCwgMjAyMyBhdCAxMjo0N+KA
r1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IFRoZSBEVCBv
Zl9kZXZpY2UuaCBhbmQgb2ZfcGxhdGZvcm0uaCBkYXRlIGJhY2sgdG8gdGhlIHNlcGFyYXRlCj4g
PiBvZl9wbGF0Zm9ybV9idXNfdHlwZSBiZWZvcmUgaXQgYXMgbWVyZ2VkIGludG8gdGhlIHJlZ3Vs
YXIgcGxhdGZvcm0gYnVzLgo+ID4gQXMgcGFydCBvZiB0aGF0IG1lcmdlIHByZXBwaW5nIEFybSBE
VCBzdXBwb3J0IDEzIHllYXJzIGFnbywgdGhleQo+ID4gInRlbXBvcmFyaWx5IiBpbmNsdWRlIGVh
Y2ggb3RoZXIuIFRoZXkgYWxzbyBpbmNsdWRlIHBsYXRmb3JtX2RldmljZS5oCj4gPiBhbmQgb2Yu
aC4gQXMgYSByZXN1bHQsIHRoZXJlJ3MgYSBwcmV0dHkgbXVjaCByYW5kb20gbWl4IG9mIHRob3Nl
IGluY2x1ZGUKPiA+IGZpbGVzIHVzZWQgdGhyb3VnaG91dCB0aGUgdHJlZS4gSW4gb3JkZXIgdG8g
ZGV0YW5nbGUgdGhlc2UgaGVhZGVycyBhbmQKPiA+IHJlcGxhY2UgdGhlIGltcGxpY2l0IGluY2x1
ZGVzIHdpdGggc3RydWN0IGRlY2xhcmF0aW9ucywgdXNlcnMgbmVlZCB0bwo+ID4gZXhwbGljaXRs
eSBpbmNsdWRlIHRoZSBjb3JyZWN0IGluY2x1ZGVzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFJv
YiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPgo+IEkgdGhvdWdodCBJIHdhcyB0byBwaWNr
IHRoZSBwYXRjaC4gQnV0IEkgc2VlIHlvdSBpbnRlbmQgdG8gZG8gaXQuIE5wLgoKTm8sIHBsZWFz
ZSBhcHBseSBpdC4KClRoYW5rcywKUm9iCgo+Cj4gQWNrZWQtYnk6IEphc3NpIEJyYXIgPGphc3Np
c2luZ2hicmFyQGdtYWlsLmNvbT4KPgo+IHRoYW5rcwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
