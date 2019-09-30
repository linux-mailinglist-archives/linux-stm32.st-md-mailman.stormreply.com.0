Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A01C2183
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Sep 2019 15:11:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB636C36B0B;
	Mon, 30 Sep 2019 13:11:34 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DD21C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2019 13:11:33 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id u186so7660579qkc.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2019 06:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yvTBruD6zaxn4sjv75YBQD/wvJnGfoapWmbizXNwOe4=;
 b=R55EL2Er4xnrCJUO8s5IV5PQXuEs69gZed+UtnERvq3jR1x4PMkt7xZB7lrCIgrKOM
 /WC7E5O1cawMnHBDHLPhwsVLwxbdKRcLD4HZq5ieSzg7UPurghcFk16zGtHYyi8uSfNb
 cpwdf/eAypeIzBbQ8Kmxdy549mZutvnf2wk22Wjbf6/usVAVREsB4RnWnhPm+4hx1Id3
 7SHkcQ021QJVi7w9ETe4VNpH9gvyghmZpdE6Nwi6Npt9+oI4Kx49Bfcj6m6FzCvjdoYC
 44Wh0ltCkadaDFTLZMeZgwq1USeVCT1hWNW589KxuBLTG6jnXovkAvGAunSmrWKxpehj
 lEcQ==
X-Gm-Message-State: APjAAAUKAhmo2j42nPOafxtdjrxzOdT4Lyu8ZNzpZ/HCnU5zs30nt9E4
 W9XQ3lM1z3WooLOPQYEZqKBSDnLDXbkJBKJT8CM=
X-Google-Smtp-Source: APXvYqxTTAYfkhCHkzMgXzRRscqOu03R0zgUehRs/wbuLHGGTGki2kNYI5vG0oUjtCDGe/Os6ctHOkQ9bUK6AsOCYAI=
X-Received: by 2002:ae9:ef8c:: with SMTP id
 d134mr18891406qkg.286.1569849091986; 
 Mon, 30 Sep 2019 06:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1569831228.git.Jose.Abreu@synopsys.com>
 <8879f74a8cc5dffdb14d553c321d64c63ea9fe2d.1569831229.git.Jose.Abreu@synopsys.com>
In-Reply-To: <8879f74a8cc5dffdb14d553c321d64c63ea9fe2d.1569831229.git.Jose.Abreu@synopsys.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 30 Sep 2019 15:11:15 +0200
Message-ID: <CAK8P3a0Fzvy=PGDKf-K_xSCpuboSJTVY5voYMFJTNhWHkTw-DA@mail.gmail.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, Networking <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 net 9/9] net: stmmac: xgmac: Fix RSS
	writing wrong keys
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

On Mon, Sep 30, 2019 at 10:19 AM Jose Abreu <Jose.Abreu@synopsys.com> wrote:
>
> Commit b6b6cc9acd7b, changed the call to dwxgmac2_rss_write_reg()
> passing it the variable cfg->key[i].
>
> As key is an u8 but we write 32 bits at a time we need to cast it into
> an u32 so that the correct key values are written. Notice that the for
> loop already takes this into account so we don't try to write past the
> keys size.

Right, sorry about my mistake.

> Fixes: b6b6cc9acd7b ("net: stmmac: selftest: avoid large stack usage")
> Signed-off-by: Jose Abreu <Jose.Abreu@synopsys.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
