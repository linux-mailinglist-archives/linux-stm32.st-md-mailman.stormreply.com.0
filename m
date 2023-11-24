Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 868657F7156
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Nov 2023 11:25:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C9CCC6B47C;
	Fri, 24 Nov 2023 10:25:02 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0F73C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Nov 2023 10:25:00 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-5cbcfdeaff3so17698717b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Nov 2023 02:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700821500; x=1701426300;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YSRwymbbTF0gzuOjYP7v4xf2W/UwQLRj17AdLnzK6Yk=;
 b=djJ2YYK45BLQs2ksGYNhY9FyEUuZW6xI2wG226GpWRi29TQY+QAj5CUDO4yXAXDXCD
 vIZOakNEu+y3DaewvZazakgXam/gpSZpaVczYflwTgfeJ6tgZjqbt6/nUQchkqCc87Ib
 JC828i5qNxZKfwgpew0iogKVStfmNUf3to51D9u0kqRPQ/k3DgjXfk7kZPjwRqP9olaL
 WMdQLAXa+E5yXd8Jbp92K+Cpiihr6qZcf3LkVABIEu8DmM91Ym54OSValPYuH8BDQ48O
 gldKAQ8uYOfuOXjJ3u+dIe2+JQcX6r7b7g2ozu1h+Npsndj0dE8Of4p5bXrm4erG7eqE
 F2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700821500; x=1701426300;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YSRwymbbTF0gzuOjYP7v4xf2W/UwQLRj17AdLnzK6Yk=;
 b=oI9l6Qv3EzMiuqAg+myBnEis/OpXW50idWf/JqIS83nSHZQQ+IrQ4p2PdYqq6NCoat
 O0zrpuY6ToTQPiXWHlfTgvNhGhLnLvHXA/6XFezdw54cveE+BysIJYXOHzRLfGkkIi+V
 tPyjuLIMMSiaVYuFhiNE0Ko5Ap0nKmCiTOikmM/CJvPui+UGajeS34Eu0C1IOJzPubzT
 YYUwn8BoKEJEEmZgfdn3GH/WfGQN8/ZJGzQOIeoMoInBCST0nn4/9R7fC7soYtX79Ryu
 QjORKaX6uObFnMEKoH/E4znq3Er+TsXu1etpWkEV/+oIZ7NTucoRzN4Mdf0R9jGCrG0g
 HaoQ==
X-Gm-Message-State: AOJu0YzbnmOx3UgdCyrgkY/VuofUsqCsN6AJkmGOWLOyigubXPR/eq7h
 VMitat6xcGvKyMFBnfiIv5PBNnNLA5N+pAziKgLvjg==
X-Google-Smtp-Source: AGHT+IHna5orXZBaFh71s5HEqAg5V2fQBcSodGOiIyRvx+fRsKxIrd8IvGfSuHAdM0CGYXYpGN0cGWpVu58CnfTDUts=
X-Received: by 2002:a81:49c1:0:b0:5a9:27c8:edbc with SMTP id
 w184-20020a8149c1000000b005a927c8edbcmr2136208ywa.28.1700821499637; Fri, 24
 Nov 2023 02:24:59 -0800 (PST)
MIME-Version: 1.0
References: <20231124094905.58425-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231124094905.58425-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 Nov 2023 11:24:48 +0100
Message-ID: <CACRpkdaE-Gejf3YXxAEGV9aJakqK77ZvYYFAtUHmVFMxaPDE1Q@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: st: minor whitespace cleanup
	around '='
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

T24gRnJpLCBOb3YgMjQsIDIwMjMgYXQgMTA6NDnigK9BTSBLcnp5c3p0b2YgS296bG93c2tpCjxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBUaGUgRFRTIGNvZGUgY29k
aW5nIHN0eWxlIGV4cGVjdHMgZXhhY3RseSBvbmUgc3BhY2UgYmVmb3JlIGFuZCBhZnRlciAnPScK
PiBzaWduLgo+Cj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9m
Lmtvemxvd3NraUBsaW5hcm8ub3JnPgoKVGhpcyBzaG93cyBhIHByb2JsZW0gd2l0aCBob3cgdGhl
IFNULUVyaWNzc29uIHBsYXRmb3JtcyB3ZXJlIGdyb3VwZWQKdG9nZXRoZXIgd2l0aCB0aGUgU1Qg
cGxhdGZvcm1zLCBsZWFkaW5nIHBlb3BsZSB0byBiZWxpZXZlIHRoZXkgYXJlIG1haW50YWluZWQK
dG9nZXRoZXIgYnkgdGhlIHNhbWUgbWFpbnRhaW5lcnMsIHdoaWxlIHRoZXkgYXJlIG5vdC4KCkkg
bWlnaHQgaGF2ZSB0byBzcGxpdCBvdXQgdGhlIFNURSBwbGF0Zm9ybXMgc28gd2UgZG9uJ3QgZ2V0
IHRoaXMga2luZCBvZgpwcm9ibGVtcy4KCkNhbiB5b3Ugc3BsaXQgdGhlIHN0ZS0qIHByZWZpeGVk
IGZpbGVzIGNoYW5nZXMgaW50byBhIHNlcGFyYXRlIHBhdGNoIHRoYXQKSSBjYW4gYXBwbHk/CgpZ
b3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
