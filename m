Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB15966C30
	for <lists+linux-stm32@lfdr.de>; Sat, 31 Aug 2024 00:18:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B151C6C841;
	Fri, 30 Aug 2024 22:18:02 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9C1DCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 22:17:55 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e03caab48a2so1939910276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 15:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725056274; x=1725661074;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k5WO4QDBBlsQUtbcAzwg6NCzLWWJqOLIFTUVIpEZcoU=;
 b=gJKg0VUuvI5hx1/8htPSO02dsbtWgVGEpEkZEn+ddxdBiuC5yXhlI07WJ9PziveXwp
 OlNqxHghX/8gjBqrWeta9HQWEECn+y+OX6s/EJ3fjurBTTpfSjlWH4Z+AiZ+1zO8eOiw
 raWMOWQ8CKg6h8Mz5AogbsotyBAb2ifGUL8CAcLIviKZXPijyTf/X0Y+9nVOc9xv9vs9
 DRSVl2Hrh0sM9EtJCOeCl7J7Vq9DOjX6Zq15vUFlf15NQ0MPXay/q47gEA8s6l9jECjT
 TPPZS/my9X+Nxw9t/wpzqFpeQSmm738icPI/EH8eWKkE6DBf9Ld5+W1AgwECUinR+A47
 6jAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725056274; x=1725661074;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k5WO4QDBBlsQUtbcAzwg6NCzLWWJqOLIFTUVIpEZcoU=;
 b=NMA+zpOJ1HwrHYbwYX4W3W0G26m2hfpz99kK/XmIKtBXJB0HyW6sdGeSfuFtoCG/6n
 cjFkMUSpFOOknVIPxAfQjio+j/o2R7pIePQLNBtx/SSO9sxbXVTebyYYHv9Hd7OT7///
 tpmnA73eUwPV/Y1MKqi/GFseO18osZcqRm358Ma0RyTYOWj+kjrXtc6jmTSJujdeqeIK
 BQCcyFLhN8dq0N6eXwA1CMG7d7TkQVUP3ZsF7YIjzrXlE84iqwkLIBpmIjrl6cJSxdBv
 4/CvFh2iLfUvIYz0ZyAex8v+oL8wc4x5GIFvE1vqA1WUFI6AXrQaeHGRCN1Zv4Jjf3tK
 DtgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwuzgnDPoPuKm7xTuruZLddmHLb5qFKqwrwju6X4hxqobC09+uXEapN0o5PVtDveqPwEIHm9mUiNYxPw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwMEAaSfO5stsWUV4LAyaK8MZgPiVQZMxA9WxJNuWgnvVWsWD2E
 rYsUoEiQ9grLiOZZNLSb+gEBx8xXz6YwwtD/VXv3v/uawkiN/nfLcKOa0wO/zuO+ABIHI2GICFD
 ncVPlbz+fITkLaDp4bqrZ9EzbpRc+x3Gk4HQ77Q==
X-Google-Smtp-Source: AGHT+IEmUy2IA6mF/xZvxmao3unx9PJZHOnyHquLRhrCfhleDGsJQGbKCiuRac4ps36sc2viLuEP9uTKmgAJ4mvsDS0=
X-Received: by 2002:a05:6902:1ac5:b0:e1a:7033:73b2 with SMTP id
 3f1490d57ef6-e1a7a3d8163mr3422353276.24.1725056274315; Fri, 30 Aug 2024
 15:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240827075219.3793198-1-ruanjinjie@huawei.com>
 <20240827075219.3793198-3-ruanjinjie@huawei.com>
In-Reply-To: <20240827075219.3793198-3-ruanjinjie@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 31 Aug 2024 00:17:41 +0200
Message-ID: <CACRpkdayBQ6TrV0Nn9jWX45YaP6repY0FU6CP=FnubLbonpEbQ@mail.gmail.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: andrew@lunn.ch, justin.chen@broadcom.com, edumazet@google.com,
 krzk@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, samuel@sholland.org, linux@armlinux.org.uk,
 jernej.skrabec@gmail.com, wens@csie.org, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 ansuelsmth@gmail.com, sebastian.hesselbarth@gmail.com,
 woojung.huh@microchip.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, mcoquelin.stm32@gmail.com, alsi@bang-olufsen.dk,
 olteanv@gmail.com, linux-sunxi@lists.linux.dev, davem@davemloft.net,
 jic23@kernel.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH -next 2/7] net: dsa: realtek: Use
 for_each_child_of_node_scoped() and __free()
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

T24gVHVlLCBBdWcgMjcsIDIwMjQgYXQgOTo0NeKAr0FNIEppbmppZSBSdWFuIDxydWFuamluamll
QGh1YXdlaS5jb20+IHdyb3RlOgoKPiBBdm9pZCBuZWVkIHRvIG1hbnVhbGx5IGhhbmRsZSBvZl9u
b2RlX3B1dCgpIGJ5IHVzaW5nCj4gZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZV9zY29wZWQoKSBhbmQg
X19mcmVlKCksIHdoaWNoIGNhbiBzaW1wbGZ5IGNvZGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKaW5q
aWUgUnVhbiA8cnVhbmppbmppZUBodWF3ZWkuY29tPgoKTmVhdCEKUmV2aWV3ZWQtYnk6IExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlq
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
