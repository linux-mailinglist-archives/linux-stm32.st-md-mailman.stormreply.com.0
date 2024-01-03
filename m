Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B075F8237EC
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jan 2024 23:25:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 616BDC6B476;
	Wed,  3 Jan 2024 22:25:43 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07237C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jan 2024 22:25:42 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dae7cc31151so7074587276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Jan 2024 14:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704320741; x=1704925541;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9kmcqsMX8fQ3sLYeMRmJosc8oLB5bZGg3REIDOYybdk=;
 b=LZXr/Sl5zm9iLWqgnfbYaR8X3uMlUeqRJLN96jy+FypoQW2J6ij5ghaTXl7xnhC4t+
 Pk2uluK7xa+djYCA3jmIpambXPO8gueu7S5xewtlGqHt4S8/JCBLQHs7OS+dMDHBEndN
 msm/ugBz/icRq8pDlKquJoSDP2Ac4aJPmYSMEQw6Pk5cxK+Rks1pyNSBpAeKt9zyLQE7
 00x5Kb1RhsrvSAdBfvTTFEdx2wx+RLoHs1M3kGYbz6jgjtbUAJUg2NaG/ahNxbuFOdfV
 FGbaq58ZSZFH9idxur8U0STdXppJy0PAq10TTP9I7w7l9Ryu7joKP+BOGPQrZc9AhUvy
 fo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704320741; x=1704925541;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9kmcqsMX8fQ3sLYeMRmJosc8oLB5bZGg3REIDOYybdk=;
 b=DN0c7NZqhP5crPxTmpJ464MrqCfgZc3dkQaPaLqRTavBiHSEJZOkZjT5DkS3Fw2ZJJ
 432wsaHr5IynL7T5UmAholGv9eeKe6B6ux9wMJWIRD9carluED94YplnazfTG+Bi5nE/
 Hdb3CVDVHql6EO6cyk0pWHO2p6gghssDD0TSWq1K/N/TkNHkyRuiLuxng8Wt8aK0SIqw
 C1REVz4MGzfVnX++l2ppAbWKLfszVV1If/zaMvCVZNRQq2EnRLTpcshJD+iQwXGQRE+0
 YOh9TGJ5vHsA3auxxRylNcDzo/Ki4Ln7r+eWrOS9aKqdXw8oooaa2VeA2Xlvc/SdFRnW
 UCzw==
X-Gm-Message-State: AOJu0YyeCx27C7DwnB0Q8Cl1/W2BwPzzzLNA2Am9VWNHVaQowsQF0LHD
 Iu9yghkCMxSnXrrOw8A1Q1CohCNtlv75sWvHdOdmSLGgibQmSg==
X-Google-Smtp-Source: AGHT+IH3lN5EReu2g0Mi+oxqq6LxDhkZAcXvUANpBIfR+d/23nY/29IleV2lLkmHHtEwUYWNJ3aNAjkw6NRWH1Vyk6A=
X-Received: by 2002:a5b:ed0:0:b0:dbe:9fe3:9d24 with SMTP id
 a16-20020a5b0ed0000000b00dbe9fe39d24mr1147230ybs.111.1704320740768; Wed, 03
 Jan 2024 14:25:40 -0800 (PST)
MIME-Version: 1.0
References: <20240102162718.268271-1-romain.gantois@bootlin.com>
 <20240102162718.268271-2-romain.gantois@bootlin.com>
 <20240103201021.2ixxndfqe622afnf@skbuf>
In-Reply-To: <20240103201021.2ixxndfqe622afnf@skbuf>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Jan 2024 23:25:29 +0100
Message-ID: <CACRpkdYAOReqhoXVc_D6eeW-MvWym3eL2T3KTePqZSx3WWsGEQ@mail.gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Richard Tresidder <rtresidd@electromag.com.au>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 1/1] net: stmmac: Prevent DSA tags
 from breaking COE on stmmac
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

T24gV2VkLCBKYW4gMywgMjAyNCBhdCA5OjEw4oCvUE0gVmxhZGltaXIgT2x0ZWFuIDxvbHRlYW52
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gVHVlLCBKYW4gMDIsIDIwMjQgYXQgMDU6Mjc6MTVQTSAr
MDEwMCwgUm9tYWluIEdhbnRvaXMgd3JvdGU6Cj4gPiArLyogQ2hlY2sgaWYgZXRoZXJ0eXBlIHdp
bGwgdHJpZ2dlciBJUAo+ID4gKyAqIGhlYWRlciBjaGVja3MvQ09FIGluIGhhcmR3YXJlCj4gPiAr
ICovCj4gPiArc3RhdGljIGlubGluZSBib29sIHN0bW1hY19oYXNfaXBfZXRoZXJ0eXBlKHN0cnVj
dCBza19idWZmICpza2IpCj4gPiArewo+ID4gKyAgICAgX19iZTE2IHByb3RvID0gZXRoX2hlYWRl
cl9wYXJzZV9wcm90b2NvbChza2IpOwo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIChwcm90byA9PSBo
dG9ucyhFVEhfUF9JUCkpIHx8IChwcm90byA9PSBodG9ucyhFVEhfUF9JUFY2KSkgfHwKPiA+ICsg
ICAgICAgICAgICAgKHByb3RvID09IGh0b25zKEVUSF9QXzgwMjFRKSk7Cj4KPiBwcm90byA9PSBo
dG9ucyhFVEhfUF84MDIxUSkgbWVhbnMgdGhhdCB0aGUgc2tiIGhhcyBhbiBJUCBFdGhlclR5cGU/
Cj4gV2hhdCBpZiBhbiBJUCBoZWFkZXIgZG9lcyBub3QgZm9sbG93IGFmdGVyIHRoZSBWTEFOIGhl
YWRlcj8KCkl0J3MgcHJvYmFibHkgYmVzdCB0byBkbyBsaWtlIEkgZG8gaGVyZToKaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbmV0ZGV2LzIwMjQwMTAyLW5ldy1nZW1pbmktZXRoZXJuZXQtcmVncmVz
c2lvbi12NS0yLWNmNjFhYjNhYThjZEBsaW5hcm8ub3JnLwoKKyBpZiAoZXRoZXJ0eXBlID09IEVU
SF9QXzgwMjFRKQorICAgZXRoZXJ0eXBlID0gbnRvaHMoX192bGFuX2dldF9wcm90b2NvbChza2Is
IGh0b25zKGV0aGVydHlwZSksIE5VTEwpKTsKCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
