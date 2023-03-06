Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A51D76AB842
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Mar 2023 09:28:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50E12C65048;
	Mon,  6 Mar 2023 08:28:56 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DB56C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 08:28:54 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-536b7ffdd34so169872767b3.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Mar 2023 00:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=519NpLUqxOKWPBwAuOC9bU9ZvrYJvgJKHiIp383stmI=;
 b=W3sGp9tNOLk4oOb1TbBhmTVgOkfoc3jNvYh/DHNAvPgy67bZMPKLQWxrpJ0zDdcp+m
 S3wh1xHQnwUyPdXvJ2fnkADVNJh2ucQuqk4rR7iDOAB1VWSAMBZ3P5S2esv8D81mx3FE
 ySbGrtbzeZbdtXEo3ZG24oQN8iTy8LnSxuKH8dw90uG1ciqhzoJCBWUZhZsfgiv2IoPf
 aMVk4WiNShz8IChoW/yMstyhaBVYtGJ+MTlDC2Yv/xDdfulCssgz4JYckicGNUKxZrb+
 YrQT7vimpOgsn4RLRyxeyCJ1YxtNjprHA6SvcTTjvdn0BOvpVeUsEtY2+pqoxK1Svzc/
 TgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=519NpLUqxOKWPBwAuOC9bU9ZvrYJvgJKHiIp383stmI=;
 b=EpGwNUY0B479lSMOAXqXf9kWJjTy9l6BG7dA9XGgWoVcnyWhNse1+euZjzcUo4QrwF
 TsSqDczpwqULjiROkukvRuuIcuHSrqUP4bdummI4KJkJbNnF/7YNcPRbrJhHodJgR+zy
 lR+ZxMS6spL5aFqwl795Uej1i6+lBb4Q4J4WxK8JVQqrwo3xCMim7YJcZiQwxfRyyqNf
 iMXlB7qxuDbxgy9T1uMkJYBt5tlWdP2lvr7UiEkwrOXY24Njc2VrxpJP3AK+O3vex0to
 /tQaRaRdloYZITJ9bw8sd9QTHzPyRiXRnPCKRWz4BQMtcZl9vrwQ83Tkaug0IC60q4C3
 Yk9g==
X-Gm-Message-State: AO0yUKW+BVQqKdmJxwpnxOaCl3xYtJe6Hy+7bmL+2I8tlZ5JzaDaVw3f
 eRaPMjL6CI43+lQUE15E/zgPuKTTbXSyvK+j37Gp7g==
X-Google-Smtp-Source: AK7set8qJpcrUyUWuXm2GtgPYfVJIrTfSr7hyswBMwx4xoG28NxTC5y13Rie+RRDGbzHFSPGeKUBnzA9auOnDQ4Aey0=
X-Received: by 2002:a81:b624:0:b0:52e:f77c:315d with SMTP id
 u36-20020a81b624000000b0052ef77c315dmr6476228ywh.3.1678091333277; Mon, 06 Mar
 2023 00:28:53 -0800 (PST)
MIME-Version: 1.0
References: <ZAVu/XHbL9IR5D3h@gondor.apana.org.au>
 <E1pZ2fj-000e1B-Kg@formenos.hmeau.com>
In-Reply-To: <E1pZ2fj-000e1B-Kg@formenos.hmeau.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Mar 2023 09:28:41 +0100
Message-ID: <CACRpkdbfttwCoMPQATNkj1_sbhs1H_s7vfXRQbW_dDf4d_dUBw@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Li kunyu <kunyu@nfschina.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [v5 PATCH 3/7] crypto: stm32 - Simplify finup
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

T24gTW9uLCBNYXIgNiwgMjAyMyBhdCA1OjQy4oCvQU0gSGVyYmVydCBYdSA8aGVyYmVydEBnb25k
b3IuYXBhbmEub3JnLmF1PiB3cm90ZToKCj4gVGhlIGN1cnJlbnQgZmludXAgY29kZSBpcyB1bm5l
Y2Vzc2FyaWx5IGNvbnZvbHV0ZWQuICBUaGVyZSBpcyBubwo+IG5lZWQgdG8gY2FsbCB1cGRhdGUg
YW5kIGZpbmFsIHNlcGFyYXRlbHkgYXMgdXBkYXRlIGFscmVhZHkgZG9lcwo+IGFsbCB0aGUgbmVj
ZXNzYXJ5IHdvcmsgb24gaXRzIG93bi4KPgo+IFNpbXBsaWZ5IHRoaXMgYnkgdXRpbGlzaW5nIHRo
ZSBIQVNIX0ZMQUdTX0ZJTlVQIGJpdCBpbiByY3R4IHRvCj4gaW5kaWNhdGUgb25seSBmaW51cCBh
bmQgdXNlIHRoZSBIQVNIX0ZMQUdTX0ZJTkFMIGJpdCBpbnN0ZWFkIHRvCj4gc2lnbmlmeSBwcm9j
ZXNzaW5nIGNvbW1vbiB0byBib3RoIGZpbmFsIGFuZCBmaW51cC4KPgo+IFNpZ25lZC1vZmYtYnk6
IEhlcmJlcnQgWHUgPGhlcmJlcnRAZ29uZG9yLmFwYW5hLm9yZy5hdT4KClRoaXMgInY1LjUgdmVy
c2lvbiIgaW5kZWVkIHdvcmtzIQpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPgpUZXN0ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpA
bGluYXJvLm9yZz4KCkkgaGFkIHRvIHBpY2sgdGhlIHBhdGNoIG1hbnVhbGx5IGJlY2F1c2UgS29u
c3RhbnRpbidzIGI0IHRvb2wKZ290IGNvbXBsZXRlbHkgY29uZnVzZWQgYnkgdGhlIHZlcnNpb24g
bnVtYmVyaW5nIGFuZCBwaWNrZWQKdGhlIG9sZCB2NSwgYnV0IG9uY2UgSSBnb3QgdGhlIHJpZ2h0
IG9uZSwgYWxsIHdvcmtlZCBmaW5lIQoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
