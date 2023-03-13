Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C08F06B841B
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 22:41:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AAA0C65E5A;
	Mon, 13 Mar 2023 21:41:48 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA58FC035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 21:41:47 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id u5so5022910ybm.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 14:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678743706;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aln1hEdgcCcgANtA4QqHK4LEQZjmm0gs9rDgqPgUYnk=;
 b=obeFtHVsVUapqop3MZKJozH3FqvKkagKehW9wH8Kk5Z2q53GUYuOTYQwDJfe0rD8GW
 VpTxDa9EKaUb3LWfiQoMqGQSCyEpNI4+b7GzmK3XkQWXoUv7H4WEm+kgX282GUGaLcRR
 oGw49ywWS7ZvrQu5Q27+vM/J3wsgjMJyc2aw94wUqS/O+xhj7nfPqMcBIzeH6DX+m0Tu
 U9ONMmuiYC1sfpAyBk/IEs7gHez697aQhir78i9oLtd/P/vN7M2cqeAND8s7hBro5uge
 sz8dQISn4LMWOjeQoS+p40Jax/AQFpfz+RS+w4EF14NUdwHYe3NrEHORt1Qkv0DcvvHm
 AErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678743706;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aln1hEdgcCcgANtA4QqHK4LEQZjmm0gs9rDgqPgUYnk=;
 b=ZHVGDFebdw+cbdOyWNU6WiLAEPxKhcpkHOgb6PlkdcL4wg4xFktNHPVQhVKTrjXmxQ
 8ynZkrYyDrwDr9eX1mGdOCjLyxcRJv8qInuVLOT14ngVAUN9XXH3mxi04mgI3Qys8X08
 XlUFdHPEWqFx7SjXs5v+6Xm0v1d6pRPnAkYq61hiAclOkj/GUZay7KqosN+n7H8fDZX+
 cFozhxNiLYEl6V7Y/6nnQobl8NorQqyss+Ijy60iXY+7jDMLgsrQ3bGKCWvexl8GBXv9
 uV2DsItdGBPx4rND9VIEWsNc1p0+J0+FR+k/vZS1253f2oiI57z+RgI5Xm4n9agwQLL1
 osig==
X-Gm-Message-State: AO0yUKVY1fLxVb6apGiOQI5esAs3xPEhPq0WgbPGQy7n3snHBXbWvL4s
 rffOi9b8HednrxwfmSXuHyd/50aQLx8svtUoz1i3PQ==
X-Google-Smtp-Source: AK7set+R+YI9Nnas+5qiv6+jEi0Hs0zRL5Bqz75GQxapnR9lrv+JhLm/gXYEZWElQkVJe81BR8KBAxDNduDAH7eUSZY=
X-Received: by 2002:a5b:c48:0:b0:b1a:64ba:9cac with SMTP id
 d8-20020a5b0c48000000b00b1a64ba9cacmr3361726ybr.4.1678743706748; Mon, 13 Mar
 2023 14:41:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230313155138.20584-1-tzimmermann@suse.de>
 <20230313155138.20584-26-tzimmermann@suse.de>
In-Reply-To: <20230313155138.20584-26-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Mar 2023 22:41:34 +0100
Message-ID: <CACRpkdYDpvpvURPCsdAMEd6s4_uU3UCpWoVLYkM8jh+wBM0ACg@mail.gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-aspeed@lists.ozlabs.org, maarten.lankhorst@linux.intel.com,
 javierm@redhat.com, mripard@kernel.org, linux-sunxi@lists.linux.dev,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 linux-amlogic@lists.infradead.org, airlied@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 25/25] drm/pl111: Use GEM DMA fbdev
	emulation
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

T24gTW9uLCBNYXIgMTMsIDIwMjMgYXQgNDo1MeKAr1BNIFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPiB3cm90ZToKCj4gVXNlIHRoZSBmYmRldiBlbXVsYXRpb24gdGhhdCBp
cyBvcHRpbWl6ZWQgZm9yIERNQSBoZWxwZXJzLiBBdm9pZHMKPiBwb3NzaWJsZSBzaGFkb3cgYnVm
ZmVyaW5nIGFuZCBtYWtlcyB0aGUgY29kZSBzaW1wbGVyLgo+Cj4gUmVwb3J0ZWQtYnk6IExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiBMaW5rOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9kcmktZGV2ZWwvQ0FDUnBrZGF3U1FzTnFLSmtTU29TdzNIbU1IeU5YRlV5d3hr
ZHN6cFRDLWFfdVpBK3RRQG1haWwuZ21haWwuY29tLwo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxl
aWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
