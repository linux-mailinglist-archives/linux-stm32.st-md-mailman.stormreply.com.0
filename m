Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0C6662828
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Jan 2023 15:13:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1435CC69049;
	Mon,  9 Jan 2023 14:13:51 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3717CC65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jan 2023 14:13:49 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-4b6255ce5baso113664047b3.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Jan 2023 06:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TBh4l+oOox7qqr2Os5BHCfwojNKX4LdoqbYoYYXSeWc=;
 b=g9oVhOi6NBeZ3c6t9S7kMzfafGBNT0c7U1ze1kmYSwKckb8wiQ9yZgQyi9zNzLX7UD
 pcp8JjxfjfmayoO0N3t7l2yLR98E/M+BGbgbmv1/dv9dvyteUIgoyhSsjOQwkuIVZipF
 iM85F56uXm/GDIjajFGZSvafT7Xkz9R1u3fcvQ2lRMLgOyXTpxb9TDhhHzPS8Nlk6jZi
 dUkAW2oSKRZtNNV5ELOTuApP/hQxAXdk0eFrXb6U9f7lPEGR3y4/RjB8tCtLHAB4cR2D
 Ywjbo50cEh4/xJ3u80W5o5VRcnPiciACu/a2Mc2bTA6WQ1EPhD8iN+5U+b0l7QFtMDgF
 6nBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TBh4l+oOox7qqr2Os5BHCfwojNKX4LdoqbYoYYXSeWc=;
 b=RRj8qF6LVl/GdN6MdBus9ldPgcn4D3qntu+GkjUZpAhYqgZIQgLGFNY2YcsT9bB/B1
 wQ8bzZc9J7d/4dcqKELLsuxAed3KLAtWSbyCIwvcXAwwgKQUwWn9xufA0sgDRmjId/Cn
 y+jkLTKdgAVX4zf2wITdaOokQmmxaSJkqNkbl+4bcfw/pSotxv9K7FW9JXoWB2kUgREt
 8yHtvpnAdEQL0l5E8NbGYZd581iT+tNE1RajI0PHZDE7C3MXUnvEyBvrbKKJ54BDvDft
 DLFwKNugKHDMXrTkRpFu6XKGO6V7tPGYjluRPBJhhnVsxvcgK8AurQJiFENEAok0t6wY
 81Dw==
X-Gm-Message-State: AFqh2krU/ldCNII8tsoqHifurwSqT3cjRKZh4Z7RFECgD0EbQSVRz4aC
 7t56IMgz5fNaQVda6fEcE2tUON9wUk8w0YvY0wzjjZZo5AIQFg==
X-Google-Smtp-Source: AMrXdXsw0ubbH8l+6/r7hKop25zdf/vJOzVMIkw2j/c/BgZ9zCt0dd1QSbGBnDTXpVpzXmn73j5yvhWe6YM5iiIyBx0=
X-Received: by 2002:a81:7784:0:b0:461:49a3:db6a with SMTP id
 s126-20020a817784000000b0046149a3db6amr1433928ywc.185.1673273628147; Mon, 09
 Jan 2023 06:13:48 -0800 (PST)
MIME-Version: 1.0
References: <20230102082503.3944927-1-linmq006@gmail.com>
In-Reply-To: <20230102082503.3944927-1-linmq006@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 9 Jan 2023 15:13:36 +0100
Message-ID: <CACRpkdYreh-iG+Ao9VxY34si8HyxObyUG6zBHqxR=QziXx6Zyw@mail.gmail.com>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Marek Vasut <marex@denx.de>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: Fix refcount leak in
	stm32_pctrl_get_irq_domain
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, Jan 2, 2023 at 9:25 AM Miaoqian Lin <linmq006@gmail.com> wrote:

> of_irq_find_parent() returns a node pointer with refcount incremented,
> We should use of_node_put() on it when not needed anymore.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: d86f4d71e42a ("pinctrl: stm32: check irq controller availability at probe")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Patch applied!

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
