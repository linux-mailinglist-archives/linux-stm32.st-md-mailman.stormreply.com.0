Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A3F95EDBA
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Aug 2024 11:53:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0E30C7801B;
	Mon, 26 Aug 2024 09:53:17 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2F8AC7801C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 09:53:15 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-6c91f9fb0acso14279947b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 02:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724665994; x=1725270794;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xIxHgySimhudfjPoZi8j1w/98XwT2TmQjMhDhWg7BtU=;
 b=qsQfaMrmBK2B5ckvGk+HZWZeg4iPcC3gsDTYJPC7rBF9P0aVKKHPmPNJtpfOPTIfOj
 j4xfKcFXzcgBTRu9MqkYolmFANUFnSCtlG4J1NSEjlrT8Nvrpa48bObDD05gz6l/wC3H
 1yg9f2A/TE/spTwHxp/RRo58/yFSETcy0Ff1s7OLXjXs1xBUaKsPhiUA2/mF1Wx8ISHc
 LvOOSuXRVu5IXH82fKPENWZTqjqpHe9+8maa6A3SS5M1on5GNYFz9cWuXdNiuUXzYa8W
 LXyJQBsyNHrnn7//MoNZXYvjBeI0jgURrwXusYFvpllUYoO/lh8AP+tTVLwjb8WvDcDV
 zQzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh5501k/Nsz8OoPlcrIUq9tgM8F1jgDvBtEmPzeIsl0jPy6fbxw6qjiKyQhB8ujfeYqu7N+MavFiM0tw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzorfoDP2GyePzxYijUR0RHXHgDBA4kc1QNqq7IJX7lxMsEOd6G
 ghZSWH5KEZIOMeJpS2LBf2+YUsO8IKVoTO/t8q09Kbv0c7LtQlPQtn92JMsu
X-Google-Smtp-Source: AGHT+IFJbFj3HFMIfsj9MgQWYtLoMDhGMKF11AK5qTphx4c4xYOsldTnj59zZN3EVCth3DTF3LZ7oQ==
X-Received: by 2002:a05:690c:2fc7:b0:6ad:219a:b687 with SMTP id
 00721157ae682-6c629065811mr82694277b3.39.1724665994572; 
 Mon, 26 Aug 2024 02:53:14 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com.
 [209.85.128.173]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6c399cb5693sm14625827b3.25.2024.08.26.02.53.14
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Aug 2024 02:53:14 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6b4412fac76so36858527b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 02:53:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV96QSgyeZeO6n9EdN7CTJwIkXiSyxDhbU5nIpvAmye9cxdPsLM3tlwlh1T+qShjLPse9ualCOlm+O1vA==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:690c:4246:b0:6b2:4154:e598 with SMTP id
 00721157ae682-6c6262f43e4mr95411167b3.26.1724665994139; Mon, 26 Aug 2024
 02:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240826094328.2991664-1-ruanjinjie@huawei.com>
 <20240826094328.2991664-9-ruanjinjie@huawei.com>
In-Reply-To: <20240826094328.2991664-9-ruanjinjie@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2024 11:53:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWhfDmRONWLjqgeCa4ZPKKXxXDv6T60OVSmEdvdm1RvvQ@mail.gmail.com>
Message-ID: <CAMuHMdWhfDmRONWLjqgeCa4ZPKKXxXDv6T60OVSmEdvdm1RvvQ@mail.gmail.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: val@packett.cool, vigneshr@ti.com, kees@kernel.org,
 linux-kernel@vger.kernel.org, erick.archer@gmx.com, liang.yang@amlogic.com,
 linux-mtd@lists.infradead.org, krzk@kernel.org, miquel.raynal@bootlin.com,
 linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, robh@kernel.org,
 samuel@sholland.org, richard@nod.at, jernej.skrabec@gmail.com,
 linux-rockchip@lists.infradead.org, wens@csie.org,
 u.kleine-koenig@pengutronix.de, jbrunet@baylibre.com, linux@treblig.org,
 martin.blumenstingl@googlemail.com, christophe.jaillet@wanadoo.fr,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
 gustavoars@kernel.org, linux-renesas-soc@vger.kernel.org,
 mcoquelin.stm32@gmail.com, khilman@baylibre.com,
 linux-mediatek@lists.infradead.org, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH -next RESEND 08/10] mtd: rawnand: renesas:
	Use for_each_child_of_node_scoped()
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

T24gTW9uLCBBdWcgMjYsIDIwMjQgYXQgMTE6MzfigK9BTSBKaW5qaWUgUnVhbiA8cnVhbmppbmpp
ZUBodWF3ZWkuY29tPiB3cm90ZToKPiBBdm9pZHMgdGhlIG5lZWQgZm9yIG1hbnVhbCBjbGVhbnVw
IG9mX25vZGVfcHV0KCkgaW4gZWFybHkgZXhpdHMKPiBmcm9tIHRoZSBsb29wLgo+Cj4gU2lnbmVk
LW9mZi1ieTogSmluamllIFJ1YW4gPHJ1YW5qaW5qaWVAaHVhd2VpLmNvbT4KClJldmlld2VkLWJ5
OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgoKR3J7b2V0amUs
ZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRl
cmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGlu
dXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVv
cGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3Vy
bmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lgog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
