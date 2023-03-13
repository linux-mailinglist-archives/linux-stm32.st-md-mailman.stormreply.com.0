Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF476B8418
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 22:40:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 625CAC65E5A;
	Mon, 13 Mar 2023 21:40:21 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C0AFC035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 21:40:20 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-5416b0ab0ecso138376227b3.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 14:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678743619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ecgxfHAz/UBXIjhNVQyUFhEfo+f44kweGIvOpc2a+8o=;
 b=K2pXxPF4Q5NEb4aJh/ZtgOcay4z11aGdPJNGxoAyPpo5KHia65JmMJB5d/8Zuyw+mk
 tdCZvErxJ2+Ov6F3uwE0QJROGtFxcgLs87rRt5F0kxCCgObLtL179NI1TBOK9gGgGNJF
 Eh1qJPWmBakRFt6FaPcxyZurn1mCFc0uppN0BduNDbYkQ+cupOSDrFYHqqBB3+fKZKrd
 MbQHQFxJIAhFilhE19dQAn6Hs0OfHLcEq+ul1IX3tDPWqnP0oSGLzgbn7d3SK+ZP02oo
 r6ydpI+oGA5J1HikH4j8Apu5N/h8d3h2Vnb/H9bp2xjP5xBYwfX+xhPNTLVqo8zyv8em
 5+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678743619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ecgxfHAz/UBXIjhNVQyUFhEfo+f44kweGIvOpc2a+8o=;
 b=ILL+CuFhf+TAaHlQiF6dH36JnfijggtpvL2L+lHoBbIWvpcD3mZAiJAX6alMgvaOVn
 LlIMg+VxUOQ/xaI1LurZRJRwBiipZa3ERYRlg462OaDPAro9NLTrVo1F61LZa+tR+ms1
 MX2ZMT3hLb7akD9+qpS9bd+fq8YIH59lQ5LXNku8gDioO80q5QiHprhkZSBkD8XvLAf8
 sm5QXhDoqOfuECP4qocMLkHX8Fh6saacnvn/82P8V6DRdFmqM274uMaTPaknO75ZqndH
 Ie/SbELSeBjxfc0HioeAOBNJ1RScZAze1o8mrdP7V1znOlax5MbVoGJ7ovEqKiYS0Krf
 C6aw==
X-Gm-Message-State: AO0yUKUlosLVjZq8FMZeTA+3VIYRlMyFr5Y9Zl2H1z/wvRRYqkvVtSU4
 d+9Iv0d6gWsZzhcBSk9IC5t2iTWfoUQNjRCm7Qg1tw==
X-Google-Smtp-Source: AK7set8MXe6q7JAQYwdFRB8ZhsrrhbkSYB8JcvLg20wPqKZq56TZe41RwUBKjK5hxxwd+ByFitU1csO05sXE3FhMJro=
X-Received: by 2002:a81:af1f:0:b0:536:4ad1:f71 with SMTP id
 n31-20020a81af1f000000b005364ad10f71mr22810681ywh.9.1678743619469; Mon, 13
 Mar 2023 14:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230313155138.20584-1-tzimmermann@suse.de>
 <20230313155138.20584-25-tzimmermann@suse.de>
In-Reply-To: <20230313155138.20584-25-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Mar 2023 22:40:07 +0100
Message-ID: <CACRpkdZLFuGdSqnDYXnoWEjnVmumT23Rz4Y9QT9-9=Uoj5PUpQ@mail.gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-aspeed@lists.ozlabs.org, maarten.lankhorst@linux.intel.com,
 javierm@redhat.com, mripard@kernel.org, linux-sunxi@lists.linux.dev,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 linux-amlogic@lists.infradead.org, airlied@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 24/25] drm/mcde: Use GEM DMA fbdev
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
aWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KVGVzdGVkLWJ5OiBMaW51cyBXYWxsZWlqIDxs
aW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
