Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFDA777266
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 10:12:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D6A0C6B471;
	Thu, 10 Aug 2023 08:12:07 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF0FEC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 08:12:05 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-d44c2ca78ceso2568397276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 01:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691655125; x=1692259925;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rJweoK4ZYh3U0EvsINRayOsJfCNCoK9vxMyHK6WCgXs=;
 b=LcwdTX8nZkjNj/CVOGtPCbvxah5Lql762lWfXfseERVa+o6rFXoXicEPW8YXNlMEqw
 mqFA+fI64vyDDq/DwvebY6OX9ZhPNZPMnyju8/8QphoezsAXVrs8BLXu+xlBOFrBKcUy
 ONSSJUUsCoW3u4Ug0GPx67JDBsSoLVZQ0X1Prs0XcHAAQjN21TNCQszYzFjldajFJ5WS
 rgBWf7MLe2EYDtMn0zHj7GbobRsFnvgH2madNqUbsewJmAssJ6MTfqAc1XrbHC86WnSM
 0aRj+ZjFBbLYOpaHfbMOCCndvNWjek7paQiiTd7e06zer2Dkr3Pwqxie5dop/KFOluK6
 f3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691655125; x=1692259925;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rJweoK4ZYh3U0EvsINRayOsJfCNCoK9vxMyHK6WCgXs=;
 b=McltgyXuXG782UFyqvyh4NN94ict0IYZxLZyXzxE0OjQsV0UH7JfKuz1M1SK2L7TOk
 Uafl5W/0UnDxbmSD/fcY1sHF5YaVAErS81+CKmk6ye3PwLHX/DFsZdHsajwSeO1Jl+8+
 Yvey5g1onNLepoApvmysA99isIBgWdT4PjIMYSmaMjNScHgbDbRyAtgjjOiVsbyMvgRa
 6kuWI8HvCVWBC78tHtU/CrwepRo521rkRqqyZXvy+1Zv2KVnyLveNh0/iUMDw5aq/aYL
 K+zyzF5W5F7/lDJUxv001/hoo7rbqvBL1mqQddsU9FA8D0wgEPW1U1ccENvB9hakC+Aw
 LJ+A==
X-Gm-Message-State: AOJu0YxMXJJUNQWffz3gxUTt0yme+8SAa5TlncilJzeaAryJ7XftBKT5
 IyNOSBwkEMGiYAqB49dKzeolByh1COoLfrFFrgkoWA==
X-Google-Smtp-Source: AGHT+IGp/pwFGRTx2GDrN3NxoG2LUHFk0uLZVSTDxjslx62nVq5L8Wm7J8yxmeeRJkzI1rYPb/eLGitnwrG7KissxHk=
X-Received: by 2002:a25:ad9a:0:b0:d62:d067:d489 with SMTP id
 z26-20020a25ad9a000000b00d62d067d489mr1607078ybi.25.1691655124704; Thu, 10
 Aug 2023 01:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230803094304.733371-1-ruanjinjie@huawei.com>
In-Reply-To: <20230803094304.733371-1-ruanjinjie@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Aug 2023 10:11:53 +0200
Message-ID: <CACRpkdZ6p-y0w9kL0Z+vLEPBwTzAWMgk7yhtKGXP7rU2b9v4WQ@mail.gmail.com>
To: Ruan Jinjie <ruanjinjie@huawei.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH -next] pinctrl: stmfx: Do not check for 0
 return after calling platform_get_irq()
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

T24gVGh1LCBBdWcgMywgMjAyMyBhdCAxMTo0NOKAr0FNIFJ1YW4gSmluamllIDxydWFuamluamll
QGh1YXdlaS5jb20+IHdyb3RlOgoKPiBTaW5jZSBjb21taXQgY2U3NTNhZDE1NDljICgicGxhdGZv
cm06IGZpbmFsbHkgZGlzYWxsb3cgSVJRMCBpbgo+IHBsYXRmb3JtX2dldF9pcnEoKSBhbmQgaXRz
IGlsayIpLCB0aGVyZSBpcyBubyBwb3NzaWJsZSBmb3IKPiBwbGF0Zm9ybV9nZXRfaXJxKCkgdG8g
cmV0dXJuIDAuIFVzZSB0aGUgcmV0dXJuIHZhbHVlCj4gZnJvbSBwbGF0Zm9ybV9nZXRfaXJxKCku
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBSdWFuIEppbmppZSA8cnVhbmppbmppZUBodWF3ZWkuY29tPgoK
UGF0Y2ggYXBwbGllZC4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
