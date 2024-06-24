Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EEE914EEB
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2024 15:41:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2CCBC71282;
	Mon, 24 Jun 2024 13:41:01 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2A75C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2024 13:40:54 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52cd80e55efso4902363e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2024 06:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719236454; x=1719841254;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VoBxgHYr9hPN4v84jRXzL+PKOC6QxUGVIN3I0v8h3zk=;
 b=aa20Jzy9k7AwamC5ZNl4gFpuzRcJbORftKfnq0B5Cakj1s5zL2wWQX3zK2Xlx/Gqwd
 Z/6XcccIU+ihXuX9nUH24iXzIUfXPLkZqaqf2bz5niB5xOyiIFNPUqglFYNDA4GChZIs
 e3WYlGVwBB5N3j2CLRNRhzePDbeQBTQ+en89ew8HE38wX4QrFzWq+ea4+pRONCyVpFSQ
 1nXhoUHC/ZQgZeyQBRADFA5FXqqdGoTL1aFzm37xoVdX/atJLApzdTvZbF5zPX+hlhJ0
 yjjqZRR0VMgqYbkT8PMf9B2fIxrc7FDeRkBhW1KhB0xb27grFmGRaPcwjt+fgB5BTLYz
 R0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719236454; x=1719841254;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VoBxgHYr9hPN4v84jRXzL+PKOC6QxUGVIN3I0v8h3zk=;
 b=pMOLpzAK4YD6fJhQT1+BmdwV0Q4MljF4Ja3nxT+KD8J9WG+sK3wXSbGpdp3cpML8+y
 m6yUCGFfR2XhUU91bhwyuSxRJ2J9e9Cn823MufTUvr44jH1NLiGCuVpNEqGPOnuhWuOv
 nr7YRwRtbHDKJrKkbCt3qUQ1Lxc/QWl+HYpPupfLYHmNLYX0J/5gzXQAo8ccavUieZ3n
 W50DigEtQWk81l2W9KJIzsHpYBG28N3NBC+46Ax6M5RTztkJGeY25JnnLpij/Aw0O9jI
 ULVJeIyP2HFqtm22Hx45eBwL/S5Eq+3bu18jfThXmXmXhJVrywHumQUmXJ/cCkgnEzY/
 tVUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLiIXbYMC7DX67ecpkueU5iJKuvA2CfrBA+jUPVp0zeNJeRvR8d1VPERIxGJYHb8WQPgEzj+uyq2V8DueBKLJSTSAJhH3QfsPLgIi3zMHwh/i2/mkyzP8P
X-Gm-Message-State: AOJu0YwMW+j3SeTQDy+Ee2ggV1D3l51ZYkbchz0Bo2v+OS2Nj4iddEy6
 bPT7yTXoecd8cAmAs0wbHBJXhuZxNPv/dLyVxrdKgJ9D/tNiZ1d6
X-Google-Smtp-Source: AGHT+IEdFIuVzHJx5tXMOcS83RsKvbg4yJlnEnxjqXwl6RkKT2rP50LyfzeGnwSYYNBY8IgX1ijYTw==
X-Received: by 2002:ac2:47e1:0:b0:52c:df8e:a367 with SMTP id
 2adb3069b0e04-52ce18526e1mr3454710e87.53.1719236453753; 
 Mon, 24 Jun 2024 06:40:53 -0700 (PDT)
Received: from mobilestation ([213.79.110.82])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cea4b432dsm135604e87.130.2024.06.24.06.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 06:40:53 -0700 (PDT)
Date: Mon, 24 Jun 2024 16:40:51 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <kyvqil6vcpyew3he37uy6tdseqtcvutmd5h4chltwy37ddnnvz@lsvjhfynq5pw>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
 <E1sD0Ov-00EzBu-BC@rmk-PC.armlinux.org.uk>
 <6n4xvu6b43aptstdevdkzx2uqblwabaqndle2omqx5tcxk4lnz@wm3zqdrcr6m5>
 <ZmbFK2SYyHcqzSeK@shell.armlinux.org.uk>
 <dz34gg4atjyha5dc7tfgbnmsfku63r7faicyzo3odkllq3bqin@hho3kj5wmaat>
 <ZmobWwS5UapbhdmT@shell.armlinux.org.uk>
 <doeizqmec22tqez5zwhysppmm2vg2rhzp2siy5ogdncitbtx5b@mycxnahybvlp>
 <v5apa7efqvhh4yu5jnfkgtgp2ozhqyafhm7nddvdtls5toduas@7bynm2cts2ec>
 <d527jazwnhsflzqilxf2rpe363jty3srrad2b6j3imadq2xmq3@w2nk4zogxwsb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d527jazwnhsflzqilxf2rpe363jty3srrad2b6j3imadq2xmq3@w2nk4zogxwsb>
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

Hi Russel

On Mon, Jun 24, 2024 at 04:32:53AM +0300, Serge Semin wrote:
> Hi Russell
> 
> On Tue, Jun 18, 2024 at 01:26:52PM +0300, Serge Semin wrote:
> > On Fri, Jun 14, 2024 at 12:14:21AM +0300, Serge Semin wrote:
> > > On Wed, Jun 12, 2024 at 11:04:11PM +0100, Russell King (Oracle) wrote:
> > > > On Tue, Jun 11, 2024 at 03:25:14PM +0300, Serge Semin wrote:
> > > > > Hi Russell, Andrew
> > > > >
> > > > > Should we have a DW IP-core-specific getter like
> > > > > stmmac_ops::pcs_get_config_reg() which would return the
> > > > > tx_config_reg[15:0] field then we could have cleared the IRQ by just
> > > > > calling it, we could have had the fields generically
> > > > > parsed in the dwmac_pcs_isr() handler and in the
> > > > > phylink_pcs_ops::pcs_get_state().
> > > > 
> > > 
> > > [...]
> > > 
> > > > 
> > > > There's a good reason for this - dealing with latched-low link failed
> > > > indications, it's necessary that pcs_get_state() reports that the link
> > > > failed if _sometime_ between the last time it was called and the next
> > > > time the link has failed.
> > > > 
> > > > So, I'm afraid your idea of simplifying it doesn't sound to me like a
> > > > good idea.
> > > 
> > > No caching or latched link state indications. Both the GMAC_RGSMIIIS
> > > and GMAC_PHYIF_CONTROL_STATUS registers contain the actual link state
> > > retrieved the PHY. stmmac_pcs_get_config_reg() will just return the
> > > current link state.
> > > 
> > > Perhaps my suggestion might haven't been well described. Providing the
> > > patches with the respective changes shall better describe what was
> > > meant. So in a few days I'll submit an incremental patch(es) with the
> > > proposed modifications for your series
> > 
> 
> > The incremental patchset is ready. I need to give it some more
> > tests, then rebase onto the kernel 6.10. It'll be done in one-two
> > days.
> 
> It turned out I has created my series on top of your v1 series. I just
> finished rebasing it onto v2. The only thing left is to test it out.
> I'll do that today and then submit the series in-reply to your v2
> email thread. Sorry for making you wait once again.

Finally I've done that.
https://lore.kernel.org/netdev/20240624132802.14238-1-fancer.lancer@gmail.com

The update has turned to be a bit more bulky than I intended, but the
resultant code looks neat and small consolidated in the
stmmac_pcs.c/stmmac_pcs.h files with just three DW *MAC HW-abstraction
callbacks defined in the DW GMAC and DW QoS Eth core modules.

I did my best to provide the changes in the incremental manner with no
driver breakage. Hopefully I didn't fail that.) As before you can
re-shuffle the patches and the change they content whatever you think
would be better in the final series.

-Serge(y)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
