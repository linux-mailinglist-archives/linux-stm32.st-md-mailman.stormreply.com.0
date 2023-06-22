Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD3D7397CF
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jun 2023 09:07:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB50CC65E4F;
	Thu, 22 Jun 2023 07:07:28 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC082C65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jun 2023 07:07:27 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-440b69847bfso1619705137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jun 2023 00:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687417646; x=1690009646;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=17q09EU5IzKoL+3uRvcJRVxW9WzlvX1kABapaCMfUac=;
 b=0+Y6V7m9AwJTXt46LgUkmYfim0kFMAgmEx1WMAnwXRm9h0dDSj503PWiVpc80KV24O
 KTY8IXnHqev0sM8Wb5C+Cl0yjpi/6y19OHSQMukXaniD2YHOOOVUOTvKYtXhPZVMbcpM
 ulOevy0MmWgkN2XDTVz7bDCuntnRsnSDLmlbJi3KPdwPaQYvuClYduSlqeaikjIct1gi
 nGZZui1U3Hb8LmO4j9X0yqNFX1575QQuY9mOWj4iwYVZEbvHZNK5qc/og9iqmwvh5Dfo
 ASu0KGaBHmPs30hpp3a/u77l10PYqSUOZbg60pLMKAsdHShEZ5PMbtIS1OZfJZpaQ2oW
 HOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687417646; x=1690009646;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=17q09EU5IzKoL+3uRvcJRVxW9WzlvX1kABapaCMfUac=;
 b=HTLecgZJ1y5n3nK/8oAv25j9A+l9JhA1tos5E8tYTM28thdZXKmQHZL6m1etvamOZk
 XjzPGiiGLuTPH3T1KDivl4eYlizTYXAOROP3dna2VM1oaKOeu91VsEHCoeFZMvrUNtB0
 GTu9w68/vGtRb4ncxvcQlOeR6l1BFA8D3qD51ToADEqZz7Gg5bMhfGur+ap4169JbjbE
 Mze3BjH8IU6CaRRiXE+TeSxQRpJULMpNmWx2EJU1D9co/tOmumZMH3DzlCA0VsuCNEsK
 mO8WybuJVwBsHPANWifkFsWPo0k5zDNreYBhfMjBT2clpfXB0TBQT5OCVTGtnKikVfqD
 XcWQ==
X-Gm-Message-State: AC+VfDwK2oLwKuXTeFRI5GOVuLeoZiik9A0Xu7iuJgpdldOTPt+exEYo
 R7IlhvamXpmUzitj9Az5EyY4YA9IsqkXrABFVTApJA==
X-Google-Smtp-Source: ACHHUZ7kZNJcPPkpnbMNtbJXqOpZWeAzoHNc+qihd4tsRK7miMwwfvPuvxGMJdu+kyR+2dT9AG50FXasvP9ps+v0mWc=
X-Received: by 2002:a67:f256:0:b0:43f:5036:677e with SMTP id
 y22-20020a67f256000000b0043f5036677emr7745188vsm.6.1687417646581; Thu, 22 Jun
 2023 00:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230621182558.544417-1-brgl@bgdev.pl>
 <20230621131222.071b9fc3@kernel.org>
In-Reply-To: <20230621131222.071b9fc3@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 22 Jun 2023 09:07:15 +0200
Message-ID: <CAMRc=MddPhRq9aR3ebeEqWs6O_G50TZqBMtCtpDxo8KcRMoiww@mail.gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-tegra@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Jose Abreu <joabreu@synopsys.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Richard Cochran <richardcochran@gmail.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 00/12] net: stmmac: replace
 boolean fields in plat_stmmacenet_data with flags
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

T24gV2VkLCBKdW4gMjEsIDIwMjMgYXQgMTA6MTLigK9QTSBKYWt1YiBLaWNpbnNraSA8a3ViYUBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgMjEgSnVuIDIwMjMgMjA6MjU6NDYgKzAyMDAg
QmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiA+IEFzIHN1Z2dlc3RlZCBieSBKb3NlIEFicmV1
OiBsZXQncyBkcm9wIGFsbCAxMiBib29sZWFuIGZpZWxkcyBpbgo+ID4gcGxhdF9zdG1tYWNlbmV0
X2RhdGEgYW5kIHJlcGxhY2UgdGhlbSB3aXRoIGEgY29tbW9uIGJpdGZpZWxkLgo+Cj4gSXMgdGhh
dCB3aGF0IEpvc2UgbWVhbnQsIG9yOgo+Cj4gLSAgICAgICBib29sIGhhc19pbnRlZ3JhdGVkX3Bj
czsKPiArICAgICAgIHUzMiBoYXNfaW50ZWdyYXRlZF9wY3M6MTsKPgo+ID8KCkZvciB0aGF0IHRv
IHdvcmsgYWxsIGZpZWxkcyB3b3VsZCBuZWVkIHRvIGJlIGdhdGhlcmVkIHRvZ2V0aGVyICh1bmxl
c3MKdGhlIHN0cnVjdHVyZSBpcyBfX3BhY2tlZCAtIG5vdCBhIGdvb2QgaWRlYSkgYW5kIGFsbCBm
dXR1cmUgZmllbGRzCndvdWxkIG5lZWQgdG8gYmUgYWRkZWQgaW4gYSBzcGVjaWZpYyBwbGFjZSBp
biB0aGUgc3RydWN0dXJlIGRlZmluaXRpb24KYXMgd2VsbC4gSSB0aGluayBhIGJpdCBmaWVsZCBp
cyBjbGVhcmVyIGFuZCBoYXJkZXIgdG8gZ2V0IHdyb25nIGhlcmUuCgpCYXJ0Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
