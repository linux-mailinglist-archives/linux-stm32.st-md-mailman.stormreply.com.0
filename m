Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 346196B6118
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Mar 2023 22:45:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED8AFC6A60C;
	Sat, 11 Mar 2023 21:45:58 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88223C6A608
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Mar 2023 21:45:57 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id i6so8437837ybu.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Mar 2023 13:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678571156;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xIO3rO4aGCtwUEkB8d2zjOpDq8nsRdAWUmtEv8HqUxo=;
 b=tcydFMereuu6QiVey96AVlVmSth/WTgNtXhO9Ex+Fvikha6efmOWzBJk6/nlCNnDDx
 QMNI0FigegqadxnzYIGjfGHURM0kNb6Mny+7st4f867ym/B9npZBSZWLoG80BScSKtBS
 DQnflxWRufkNTJf3mCTWRnlc2Lw+NhDHX97JB+rtzrVhWnGh9o3s7AOjrUSaeBqXKE7O
 HT94zNppNjMfYW3lHuA61ZHYfLxYlkqhEWFaAP5F6vkdTgdcPYq3dPid771R2OuomXoY
 IKypPMFuNgvFqT3oX4T8XRkOPkPLOInUZrEM/Wmkxk0ZEkjZrAq1B3weXd9zSB/rYSH8
 XpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678571156;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xIO3rO4aGCtwUEkB8d2zjOpDq8nsRdAWUmtEv8HqUxo=;
 b=6ZPL5MzKHW7r0voO3QkKbLxqVDadUfhd3K40mUzBPR4gaAR79C3vGyy/o6+xe5V6Rp
 N8fkY86N/RzkX6nAx/zf6doY6/6liRSBNj0PHc9AEPLerpk3KH++mNSniZY2KgmvEUZ4
 0zCuFROpspAEAh854xGPyJkRhs1whnw03gSYy7i5OgGaAmwIYrCHnLuE9PKbqEWL9CNz
 qutYcw+ieecabc5mwDdbX6ARz9Q3D+DBeVDZyMU/wnzasTBQ607rOT046Jk7paYjLA+a
 HRJvWsAUWzPBtDmOCo5MsLogaBZj3xasVwJVCeom/wp1fVnX2UyZh6iIiiLEUoaAjM95
 kxrg==
X-Gm-Message-State: AO0yUKWZbs0DIdZjJ5SA7C/OSZqGJsyxgjUEh6kjH8OzyEhj1wSg5JMW
 85aYF8VnEjwDF5EC6rGwhIYoAswZIUgoPZEHKZY84w==
X-Google-Smtp-Source: AK7set97TRRn5zro0f1CokXy1dp6GtRXg6jzkXUSAR5uBUJ6eQKiMW5l+rX3fqvk3vDUcvlZRQ+1eNhDn+TE93s9NLg=
X-Received: by 2002:a25:e201:0:b0:b2e:f387:b428 with SMTP id
 h1-20020a25e201000000b00b2ef387b428mr4074930ybe.5.1678571156557; Sat, 11 Mar
 2023 13:45:56 -0800 (PST)
MIME-Version: 1.0
References: <ZAxFBR3TdA7jUAgJ@gondor.apana.org.au>
 <E1pavED-002xbf-LL@formenos.hmeau.com>
In-Reply-To: <E1pavED-002xbf-LL@formenos.hmeau.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 11 Mar 2023 22:45:44 +0100
Message-ID: <CACRpkdav9u1_YR7mc9iz2OR=6itHhgGBFobZdtniZ7TttLY0Tw@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Li kunyu <kunyu@nfschina.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [v7 PATCH 8/8] crypto: stm32 - Save and restore
	between each request
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

T24gU2F0LCBNYXIgMTEsIDIwMjMgYXQgMTA6MDnigK9BTSBIZXJiZXJ0IFh1IDxoZXJiZXJ0QGdv
bmRvci5hcGFuYS5vcmcuYXU+IHdyb3RlOgoKPiBUaGUgQ3J5cHRvIEFQSSBoYXNoaW5nIHBhcmFk
aWdtIHJlcXVpcmVzIHRoZSBoYXJkd2FyZSBzdGF0ZSB0bwo+IGJlIGV4cG9ydGVkIGJldHdlZW4g
KmVhY2gqIHJlcXVlc3QgYmVjYXVzZSBtdWx0aXBsZSB1bnJlbGF0ZWQKPiBoYXNoZXMgbWF5IGJl
IHByb2Nlc3NlZCBjb25jdXJyZW50bHkuCj4KPiBUaGUgc3RtMzIgaGFyZHdhcmUgaXMgY2FwYWJs
ZSBvZiBwcm9kdWNpbmcgdGhlIGhhcmR3YXJlIGhhc2hpbmcKPiBzdGF0ZSBidXQgaXQgd2FzIG9u
bHkgZG9pbmcgaXQgaW4gdGhlIGV4cG9ydCBmdW5jdGlvbi4gIFRoaXMgaXMKPiBub3Qgb25seSBi
cm9rZW4gZm9yIGV4cG9ydCBhcyB5b3UgY2FuJ3QgZXhwb3J0IGEga2VybmVsIHBvaW50ZXIKPiBh
bmQgcmVpbXBvcnQgaXQsIGJ1dCBpdCBhbHNvIG1lYW5zIHRoYXQgY29uY3VycmVudCBoYXNoaW5n
IHdhcwo+IGZ1bmRhbWVudGFsbHkgYnJva2VuLgo+Cj4gRml4IHRoaXMgYnkgbW92aW5nIHRoZSBz
YXZpbmcgYW5kIHJlc3RvcmluZyBvZiBoYXJkd2FyZSBoYXNoCj4gc3RhdGUgYmV0d2VlbiBlYWNo
IGFuZCBldmVyeSBoYXNoaW5nIHJlcXVlc3QuCj4KPiBGaXhlczogOGExMDEyZDNmMmFiICgiY3J5
cHRvOiBzdG0zMiAtIFN1cHBvcnQgZm9yIFNUTTMyIEhBU0ggbW9kdWxlIikKPiBSZXBvcnRlZC1i
eTogTGkga3VueXUgPGt1bnl1QG5mc2NoaW5hLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBIZXJiZXJ0
IFh1IDxoZXJiZXJ0QGdvbmRvci5hcGFuYS5vcmcuYXU+CgpSZXZpZXdlZC1ieTogTGludXMgV2Fs
bGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgpUZXN0ZWQtYnk6IExpbnVzIFdhbGxlaWog
PGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
