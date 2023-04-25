Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7456D6EE514
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Apr 2023 17:58:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11151C69066;
	Tue, 25 Apr 2023 15:58:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85BE8C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Apr 2023 15:58:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2BF1462825
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Apr 2023 15:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9C5C433A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Apr 2023 15:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682438290;
 bh=itrfj1uL7ULKhIO/qSGGwopdMhHtcuGv7fowY1MDPYk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EgTh2lVlpMtQ5px5R+jV+EfXPM/vMd0vZZcesoDR/dZgys7DryqsRrWS2pdpS9uas
 OYd9yTEmElOVrIZbn0OqVscAcdbafdiKbG9xGY95F+dXOVKPpAW5UFqkaPFQaikMgo
 aWZCYgp15j+P/IiGD62g++flweL1qEmmRIyA46J9ZxdgcgQr67x7Q3TlACfNIAqEWA
 ybnHZqICC3N6Bh2h/8vZ/QwOp/oM5lTZZiMl9J1LI5jXGxCqVcLQ5wSHavpOM+9lzJ
 GcWe9oPB1zz3J6OXPcR6ftsIf9jN3vnmyzPm8qTrcAX6jvM8Z/Yhdc9tzdb3LHV6hX
 cc5h5IH4H4Nww==
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-b99dae893c0so2516705276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Apr 2023 08:58:10 -0700 (PDT)
X-Gm-Message-State: AAQBX9eZqkTqmKXKAJ9BN1Ui/P0c4gSDKH3gzvfdqm3ysAfJoQ3w1CCr
 aW/XBLG9LVlUpO+5mqAdatOFIoWkYy1FjXuqeg==
X-Google-Smtp-Source: AKy350bpts/PPga3+dzd9vak+rbAaLdXpa4DHHS4UXvr1kLSlKfqR897O6l7AESMOVdvAuhJNuLkwu1gSc/085IiOR0=
X-Received: by 2002:a25:b097:0:b0:b97:f46:a2b8 with SMTP id
 f23-20020a25b097000000b00b970f46a2b8mr12284894ybj.17.1682438288965; Tue, 25
 Apr 2023 08:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
In-Reply-To: <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 25 Apr 2023 10:57:57 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
Message-ID: <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ansuel Smith <ansuelsmth@gmail.com>,
 linux-renesas-soc@vger.kernel.org, kernel@dh-electronics.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-oxnas@groups.io
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

T24gVHVlLCBBcHIgMjUsIDIwMjMgYXQgMjoyOOKAr0FNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+Cj4gSGkgUm9iLAo+Cj4gT24gVHVlLCBBcHIgMjUs
IDIwMjMgYXQgMTI6MTbigK9BTSBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPiB3cm90
ZToKPiA+IEkgaGF2ZSBhIHNjcmlwdFsxXSB0aGF0IGRvZXMgdGhlIGNvbnZlcnNpb24gd3JpdHRl
biB0aGUgbGFzdCB0aW1lIHRoaXMKPiA+IGNhbWUgdXAuIEp1c3QgaGF2ZSB0byBhZ3JlZSBvbiBk
aXJlY3RvcnkgbmFtZXMuIEkgdGhpbmsgdGhlIGVhc2llc3QKPiA+IHdvdWxkIGJlIGZvciBBcm5k
L09sb2YgdG8gcnVuIGl0IGF0IHRoZSBlbmQgb2YgYSBtZXJnZSB3aW5kb3cgYmVmb3JlCj4gPiBy
YzEuCj4KPiAiZW1ldjIiIGFuZCAic2g3IiBhcmUgbWlzc2luZyBmb3IgcmVuZXNhcy4KCk5vIGRv
dWJ0IGl0J3MgYmVlbiBiaXRyb3R0aW5nIChvciBJIG1heSBoYXZlIG1pc3NlZCBzb21lKS4KCj4g
RG9lcyB5b3VyIHNjcmlwdCBhbHNvIGNhdGVyIGZvciAuZHRzIGZpbGVzIG5vdCBtYXRjaGluZyBh
bnkgcGF0dGVybiwKPiBidXQgaW5jbHVkaW5nIGEgLmR0c2kgZmlsZSB0aGF0IGRvZXMgbWF0Y2gg
YSBwYXR0ZXJuPwoKSSBhc3N1bWUgSSBidWlsdCBldmVyeXRoaW5nIGFmdGVyIG1vdmluZywgYnV0
IG1heWJlIG5vdC4uLgoKVGhhdCdzIGFsbCBqdXN0ICJkZXRhaWxzIi4gRmlyc3QsIHdlIG5lZWQg
YWdyZWVtZW50IG9uIGEpIG1vdmluZwp0aGluZ3MgdG8gc3ViZGlycyBhbmQgYikgZG9pbmcgaXQg
MS1ieS0xIG9yIGFsbCBhdCBvbmNlLiBTbyBmYXIgd2UndmUKYmVlbiBzdHVjayBvbiBhKSBmb3Ig
YmVpbmcgJ3RvbyBtdWNoIGNodXJuJy4KCk9uZSBuaWNlIHRoaW5nIHdpdGggc3ViZGlycyBpcyAn
bWFrZSBDSEVDS19EVEJTPXkKYXJjaC9hcm0vYm9vdC9kdHMvZm9vLycgY2FuIGJ1aWxkIGV2ZXJ5
dGhpbmcgZm9yIGEgcGxhdGZvcm0gZmFtaWx5CndpdGhvdXQgaGF2aW5nIHRvIG1lc3Mgd2l0aCB0
aGUga2NvbmZpZy4gTWF5YmUgbW9zdCBmb2xrcyBkb24ndCBjYXJlLApidXQgSSBkby4gTXkgQ0kg
am9iIHJ1bm5pbmcgc2NoZW1hIGNoZWNrcyBsb29rcyBsaWtlIHRoaXMgdG8gZGVhbCB3aXRoCmdy
b3VwaW5nIHRoZSBhcm0gZHRzIGZpbGVzICh0aGlzIGxpc3QgaXMgcHJvYmFibHkgb3V0IG9mIGRh
dGUgdG9vLCBidXQKbGVzcyBzbyk6CgogICAgICAgIGlmIFsgIiRBUkNIIiA9ICJhcm0iIF07IHRo
ZW4KICAgICAgICAgICAgVkVORE9SX0xJU1Q9ImFscGhhc2NhbGUgYWxwaW5lIGFydHBlYyBhc3Bl
ZWQgYXhtIGJjbSBjeDkKKGVjeHxoaWdoYmFuaykgXAogICAgICAgICAgICAgIGVmbSBlcDcgaW14
MSBpbXgyMyBpbXgyOCBpbXgyNyBpbXg1IGlteDYgaW14NyBscyB2ZiBxY29tIFwKICAgICAgICAg
ICAgICAoYW0zfGFtNHxhbTV8ZHJhfGtleXN0b25lfG9tYXB8Y29tcHVsYWJ8bG9naWNwZHxlbHBp
ZGF8bW90b3JvbGEtY3BjYXB8ZGF8ZG0pClwKICAgICAgICAgICAgICBuc3BpcmUgYXJtYWRhIGRv
dmUga2lya3dvb2Qgb3Jpb24gbXZlYnUgbW1wMiBiZXJsaW4gcHhhCihhcm0tfGludGVnfG1wc3x2
ZSkgXAogICAgICAgICAgICAgIChhdDkxfHNhbWF8dXNiX3x0bnlffG1wYTE2MDB8YW5pbWVvX2lw
fGFrcy1jZHV8ZXRoZXJudXQ1fGV2ay1wcm8zfHBtOWc0NXxnZTg2KQpcCiAgICAgICAgICAgICAg
ZXh5bm9zIHMzYyBzNXAgZ2VtaW5pIChoaXNpfGhpM3xoaXApIG10IG1lc29uIG1veGEgbnV2bwps
cGMgb3dsIG94OCBcCiAgICAgICAgICAgICAgKHI3fHI4fHI5fGVtZXYyfHNoNzNhfGdyLXxpd2cp
IChya3xydjExKSBzb2NmcGdhIHN0bQooc3RpfHN0LXBpbikgc3RlIFwKICAgICAgICAgICAgICBz
cGVhciAoc3VufGF4cCkgdGVncmEgdW5pcGggKHZ0ODUwMHx3bTgpIHhlbiB6eW5xIgogICAgICAg
IGVsc2UKICAgICAgICAgICAgVkVORE9SX0xJU1Q9JChscyBhcmNoLyRBUkNIL2Jvb3QvZHRzLyB8
IHhhcmdzKQogICAgICAgIGZpCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
