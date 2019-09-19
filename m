Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 434FBB798A
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Sep 2019 14:34:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DA15C35E01;
	Thu, 19 Sep 2019 12:34:42 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD8ECC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Sep 2019 12:34:40 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id f16so3135442qkl.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Sep 2019 05:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Uyhy6Uax8YQF7rWKudmdZRWa5YwRk9haOx429+okoM=;
 b=X1oLaOidMfhu3HbM9DFBS9XfOFFhV+KVev8Oia094s6AKBB+EPiEx79DPgHdhPFf/O
 9FAiBMWcthdaSnmmArloVSYrn7MNp5URk4yStdW89Olq5QFEA9D8VNC4icne2sqBjTuE
 CAfxmnFWJaCxp2gF4e8K8reBVGZNwNlqYxh0qy0257CMlvyAIItH43ZuVAeCSJlU/Bzz
 M9QwLdoLMwfFQfvTp3gbhvuyJ9vGX4METXpXJjcVyivEdwGvgd69KNaRTuaOzAAEklaa
 Lko++KIlUPlBPq31Y8ipNSi1gRyFqOhh3JUCkw3Xr1JIEpQE4MQXotRXFCIvf6Dre3PZ
 beOg==
X-Gm-Message-State: APjAAAU26r31LPM6LhD616HRu7HGvB6QepKk+SMqe2Wz7zVusTLWyOiG
 2i5SJ3D2aFqHrLN/YF+TDJ30UzICh03G7/XYIJw=
X-Google-Smtp-Source: APXvYqxsF0NeJ+J6q20ijNnid8HRUOX+T6xU0Euwl3Qp0xXUeXxuvP+eu08WL+MyzK8Ts+WBX7qXW2dB2Aa8EsOeWcU=
X-Received: by 2002:ae9:f503:: with SMTP id o3mr2579143qkg.3.1568896479756;
 Thu, 19 Sep 2019 05:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190918195454.2056139-1-arnd@arndb.de>
 <BN8PR12MB3266E044DDF00F227B9B191CD3890@BN8PR12MB3266.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB3266E044DDF00F227B9B191CD3890@BN8PR12MB3266.namprd12.prod.outlook.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 19 Sep 2019 14:34:23 +0200
Message-ID: <CAK8P3a2QXMSPdDSQTx_MrgOhg4XjMp=Qre1LNp7iX2uKzdwC1g@mail.gmail.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] stmmac: selftest: avoid large stack usage
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

On Thu, Sep 19, 2019 at 9:58 AM Jose Abreu <Jose.Abreu@synopsys.com> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
> Date: Sep/18/2019, 20:54:34 (UTC+00:00)
>
> > +     if (!cfg || !cfg->enable) {
> >               value &= ~XGMAC_RSSE;
> >               writel(value, ioaddr + XGMAC_RSS_CTRL);
> >               return 0;
> >       }
> >
> >       for (i = 0; i < (sizeof(cfg->key) / sizeof(u32)); i++) {
> > -             ret = dwxgmac2_rss_write_reg(ioaddr, true, i, *key++);
> > +             if (cfg)
> > +                     ret = dwxgmac2_rss_write_reg(ioaddr, true, i, cfg->key[i]);
> > +             else
> > +                     ret = dwxgmac2_rss_write_reg(ioaddr, true, i, 0);
> > +
> >               if (ret)
> >                       return ret;
> >       }
> >
> >       for (i = 0; i < ARRAY_SIZE(cfg->table); i++) {
> > -             ret = dwxgmac2_rss_write_reg(ioaddr, false, i, cfg->table[i]);
> > +             if (cfg)
> > +                     ret = dwxgmac2_rss_write_reg(ioaddr, false, i, cfg->table[i]);
> > +             else
> > +                     ret = dwxgmac2_rss_write_reg(ioaddr, false, i, 0);
> > +
>
> I don't get these "if (cfg)" checks. You already check earlier if cfg is
> NULL and return if so. I don't think you need these extra checks.

Ah, you are right, I missed the 'return 0', that makes it much easier.

> Also, your subject line should be something like: "net: stmmac:
> selftests: ..."

I think both styles is common for network drivers, though I think most
just leave out the 'net:'. I changed it in v2 now.

      Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
