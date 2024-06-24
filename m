Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F143E914015
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2024 03:33:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9ACEBC71287;
	Mon, 24 Jun 2024 01:33:01 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CBD2C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2024 01:32:54 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2ec1ac1aed2so46009861fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jun 2024 18:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719192773; x=1719797573;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=E2yJkKsQX045oB6naGAtEeUsYVMIvP8cElJkj48R2b4=;
 b=mhrR0SQB+f39LwFKGpEHRNeEbi4QTAEwSR6cyUs0m3x0J4+PbZfXXLMu0NNdIPWTSU
 9oK5idk7ch/hXWaSWo/VeF1z9ysONOoO/V1ISL35ytnbzauUVtMDI4z0CoiXPULkERX4
 NL7KKEFIaAeifN6iivNjzCSl4DuHV8ig87GdGsPxs87iRpfPYmEEMW2fGJFzIFgBmVEu
 dwrdEgxen42WHSouuampR+5DLPQxClXWDwZay/u3PeCObhW0INfE21kv4tHgemXWzlOR
 VKC8vzem+SModkTYYf/v9rovbTjJLDATxJxwjaBIeWQJj418EgCLypRL39nZGZt7dBRz
 DXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719192773; x=1719797573;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E2yJkKsQX045oB6naGAtEeUsYVMIvP8cElJkj48R2b4=;
 b=kw6gdBGj9eIWRcQgWdjwmEoNhALyySQJmFJjUIW7wcxVFNY3oWsB7TiO9tqo2lEUGS
 oT8gL5StPsrq/Xzqkq746+Afob1FnDVgSNAeY1tHnp0sZUv/bdoZ72dOymCcJvAUhQyp
 4hpJ8yqPBQDWJpP7J69ovxLqx1iRrJeUbwXu1PwC/Nv+U1W7xYmTvcoowzM+njDd1hYs
 9vM6DdcFms0HNpQiqYdmHthXsEigPyiYzg5Ma47LkIxb2zf1KVhkBQsn8QDzb0xkMaSM
 yVBDUHSdq0+7qUUbfsXc4BAnktxIbeAYQsCYU12YCXomL0/Dk7zJd0Bv+FX0qEx7snZ9
 xCyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy1MTPYKOESJ85kDL+zgK5xBa1xiDNqWj9wrJUZ8EX5uNmudsaGLQAIiijjp+ZfRUJLZw28lICr66nNbZayc9lARuuFBoJZCeuVABgZ95NY33QYpXlLurK
X-Gm-Message-State: AOJu0YyroovcCsdYZf/HITmNEb8NsZ46UviyKDNN7ks1tXn2VuCZmOgt
 2Cr2A6j85dqG6Km4H+nuBjOHnaU9uEOn0q85n4eVYRuwXCcc0lNl
X-Google-Smtp-Source: AGHT+IGRgAhQXDrU5szyHmGzHJgvUt+6gIwFu72BLDSRhOzFH7g5Uj5dtXHxvWEvtjNQtytWhNfb4Q==
X-Received: by 2002:a2e:9b0c:0:b0:2ec:54f3:7b65 with SMTP id
 38308e7fff4ca-2ec5b2f034fmr19299901fa.36.1719192772931; 
 Sun, 23 Jun 2024 18:32:52 -0700 (PDT)
Received: from mobilestation ([89.113.147.178])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec5fdee72asm2299251fa.102.2024.06.23.18.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 18:32:52 -0700 (PDT)
Date: Mon, 24 Jun 2024 04:32:49 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <d527jazwnhsflzqilxf2rpe363jty3srrad2b6j3imadq2xmq3@w2nk4zogxwsb>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
 <E1sD0Ov-00EzBu-BC@rmk-PC.armlinux.org.uk>
 <6n4xvu6b43aptstdevdkzx2uqblwabaqndle2omqx5tcxk4lnz@wm3zqdrcr6m5>
 <ZmbFK2SYyHcqzSeK@shell.armlinux.org.uk>
 <dz34gg4atjyha5dc7tfgbnmsfku63r7faicyzo3odkllq3bqin@hho3kj5wmaat>
 <ZmobWwS5UapbhdmT@shell.armlinux.org.uk>
 <doeizqmec22tqez5zwhysppmm2vg2rhzp2siy5ogdncitbtx5b@mycxnahybvlp>
 <v5apa7efqvhh4yu5jnfkgtgp2ozhqyafhm7nddvdtls5toduas@7bynm2cts2ec>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <v5apa7efqvhh4yu5jnfkgtgp2ozhqyafhm7nddvdtls5toduas@7bynm2cts2ec>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next v2 3/8] net: stmmac:
 dwmac1000: convert sgmii/rgmii "pcs" to phylink
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

Hi Russell

On Tue, Jun 18, 2024 at 01:26:52PM +0300, Serge Semin wrote:
> On Fri, Jun 14, 2024 at 12:14:21AM +0300, Serge Semin wrote:
> > On Wed, Jun 12, 2024 at 11:04:11PM +0100, Russell King (Oracle) wrote:
> > > On Tue, Jun 11, 2024 at 03:25:14PM +0300, Serge Semin wrote:
> > > > Hi Russell, Andrew
> > > >
> > > > Should we have a DW IP-core-specific getter like
> > > > stmmac_ops::pcs_get_config_reg() which would return the
> > > > tx_config_reg[15:0] field then we could have cleared the IRQ by just
> > > > calling it, we could have had the fields generically
> > > > parsed in the dwmac_pcs_isr() handler and in the
> > > > phylink_pcs_ops::pcs_get_state().
> > > 
> > 
> > [...]
> > 
> > > 
> > > There's a good reason for this - dealing with latched-low link failed
> > > indications, it's necessary that pcs_get_state() reports that the link
> > > failed if _sometime_ between the last time it was called and the next
> > > time the link has failed.
> > > 
> > > So, I'm afraid your idea of simplifying it doesn't sound to me like a
> > > good idea.
> > 
> > No caching or latched link state indications. Both the GMAC_RGSMIIIS
> > and GMAC_PHYIF_CONTROL_STATUS registers contain the actual link state
> > retrieved the PHY. stmmac_pcs_get_config_reg() will just return the
> > current link state.
> > 
> > Perhaps my suggestion might haven't been well described. Providing the
> > patches with the respective changes shall better describe what was
> > meant. So in a few days I'll submit an incremental patch(es) with the
> > proposed modifications for your series
> 

> The incremental patchset is ready. I need to give it some more
> tests, then rebase onto the kernel 6.10. It'll be done in one-two
> days.

It turned out I has created my series on top of your v1 series. I just
finished rebasing it onto v2. The only thing left is to test it out.
I'll do that today and then submit the series in-reply to your v2
email thread. Sorry for making you wait once again.

-Serge

> 
> Thanks
> -Serge(y)
> .
> > 
> > -Serge(y)
> > 
> > > 
> > > -- 
> > > RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> > > FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
