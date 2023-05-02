Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C996F4C2E
	for <lists+linux-stm32@lfdr.de>; Tue,  2 May 2023 23:27:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1DC8C6A5FD;
	Tue,  2 May 2023 21:27:56 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7E08C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 May 2023 21:27:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E8F0621D8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 May 2023 21:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4775C433EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 May 2023 21:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683062873;
 bh=jCPU9c2wabBAGUXBx0w4fzzWZn23Up45NdgJcoiuHoA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eCASTzM/iGukkSyOO1xmCKX08vb0J66EvmpJ3xPcKf4ZlD3wmx88HpXfuZPMMpFFT
 H9nbfyXLMAntej1+qO5mzf7D25AoWOYyo6F3Qs0gfY00G9VLPKiubPZCjXFz2PHHu0
 wV8rmFhh5MSb3R7uSp6vG/c1qEBLQ9Fyrti1+7MxiKPdWLVeaGThAwZ/3ZmkF1uhYp
 qxVCOztSnaupk/q8zkDhByFTTFDb/NaSjx22lihvXD/qaKs+w/Io65hRZu8dPnpfCR
 sSC+8Nr7DAdWBvwUebIO1ei86iSlHb0a83rhNweDpi64ARuvWXMUKmRSkeQgdY93NN
 Da8zc0cMqvOVQ==
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2a8db10a5d4so44498671fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 May 2023 14:27:53 -0700 (PDT)
X-Gm-Message-State: AC+VfDzbU5Tz59IRf0yslgSwrjdiPzbkT2ZhdP6/2CAN+py7hR6CPq37
 ULkFb/XZ2ZwV6YwTQ5AQyOeWYdlsXjSfJhV9Og==
X-Google-Smtp-Source: ACHHUZ4VmzJ58Blp8vkFEMpnZTP3rUtg0aygjDIMYeTMpSWAwJvPoANOd1LtrOl749GRPWYY5WO4jHHB7hvvVyp4ngc=
X-Received: by 2002:a2e:860b:0:b0:2a8:bb99:250d with SMTP id
 a11-20020a2e860b000000b002a8bb99250dmr5156347lji.6.1683062871907; Tue, 02 May
 2023 14:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <CACRpkdZx6vEVnxVt0tW4nYtnbv8g=Dc11sa_3myB3GW4jXk1oA@mail.gmail.com>
In-Reply-To: <CACRpkdZx6vEVnxVt0tW4nYtnbv8g=Dc11sa_3myB3GW4jXk1oA@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 2 May 2023 16:27:39 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKzof_mYRw9Dd0YAVWr1AFoO8gwkVUR22AJX_RF2xv0aA@mail.gmail.com>
Message-ID: <CAL_JsqKzof_mYRw9Dd0YAVWr1AFoO8gwkVUR22AJX_RF2xv0aA@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com,
 Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>
Subject: Re: [Linux-stm32] [RFC PATCH 0/1] Categorize ARM dts directory
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

T24gVHVlLCBNYXkgMiwgMjAyMyBhdCA0OjE54oCvUE0gTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWF5IDIsIDIwMjMgYXQgOTo0MOKA
r1BNIFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gPiBJJ3ZlIGR1
c3RlZCBvZmYgbXkgc2NyaXB0IGFuZCBtYWRlIGEgYnJhbmNoWzFdIHdpdGggdGhlIHJlc3VsdC4K
PiA+IFRoZXJlJ3MganVzdCBhIGNvdXBsZSBvZiBmaXhlcyBuZWVkZWQgYWZ0ZXIgdGhlIHNjcmlw
dCBpcyBydW4gKHNlZSB0aGUKPiA+IHRvcCBjb21taXQpLiBUaGUgY3Jvc3MgYXJjaCBpbmNsdWRl
cyBhcmUgYWxsIGZpeGVkIHVwIGJ5IHRoZSBzY3JpcHQuCj4gPiBkdGJzX2luc3RhbGwgbWFpbnRh
aW5zIGEgZmxhdCBpbnN0YWxsLiBJIGNvbXBhcmVkIHRoZSBudW1iZXIgb2YgLmR0YnMKPiA+IGJl
Zm9yZSBhbmQgYWZ0ZXIgdG8gY2hlY2sgdGhlIHNjcmlwdC4KPiA+Cj4gPiBJIHRoaW5rIHRoZSBv
bmx5IGlzc3VlIHJlbWFpbmluZyBpcyBmaW5hbGl6aW5nIHRoZSBtYXBwaW5nIG9mCj4gPiBwbGF0
Zm9ybXMgdG8gc3ViZGlycy4gV2hhdCBJIGhhdmUgY3VycmVudGx5IGlzIGEgbWl4dHVyZSBvZiBT
b0MKPiA+IGZhbWlsaWVzIGFuZCB2ZW5kb3JzLiBUaGUgbW9zdCBub3RhYmxlIGFyZSBhbGwgdGhl
IEZyZWVzY2FsZS9OWFAKPiA+IHBsYXRmb3JtcywgcHhhLCBzb2NmcGdhLCBhbmQgc3RtMzIuIEl0
J3Mgbm90IGNvbnNpc3RlbnQgd2l0aCBhcm02NAo+ID4gZWl0aGVyLiBPbmNlIHRoYXQncyBmaW5h
bGl6ZWQsIEkgc3RpbGwgbmVlZCB0byBnbyB1cGRhdGUgTUFJTlRBSU5FUlMuCj4KPiBJIHNlZSBt
eSBuaXRzIHdlcmUgZml4ZWQgbGlrZSBJIHdhbnRlZCB0aGVtLCBhbmQgaXQncyBub3cgbW9zdGx5
IGEKPiBtaXggb2Ygc29jIGFuZCB2ZW5kb3IgbmFtZXMgdGhhdCBtYWtlIHNlbnNlIHNvIGZyb20g
bXkgcG9pbnQgb2YgdmlldzoKPiBBY2tlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVp
akBsaW5hcm8ub3JnPgo+Cj4gTkI6Cj4gYXJjaC9hcm02NC9ib290L2R0cy9hcm0kCj4gdmV4cHJl
c3MtdjJtLXJzMS5kdHNpIC0+IC4uLy4uLy4uLy4uL2FybS9ib290L2R0cy92ZXhwcmVzcy12Mm0t
cnMxLmR0c2kKPgo+IFRoaXMgc3RpbGwgd29ya3MgYWZ0ZXIgdGhlIHNjcmlwdCwgeWVzPwoKWWVz
LCBiZWNhdXNlIGluIHRoZSBzY3JpcHQgSSBkbzoKCmdpdCBncmVwIC1sIC1GICJ2ZXhwcmVzcy12
Mm0tcnMxIiBhcmNoL2FybTY0L2Jvb3QvZHRzIHwgeGFyZ3MgcGVybCAtcAotaSAtZSAicy92ZXhw
cmVzcy12Mm0tcnMxL2FybVwvYXJtXC92ZXhwcmVzcy12Mm0tcnMxLyIKClJvYgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
