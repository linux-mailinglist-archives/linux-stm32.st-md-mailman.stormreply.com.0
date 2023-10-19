Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9627CF520
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Oct 2023 12:25:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81267C6B44D;
	Thu, 19 Oct 2023 10:25:06 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E1D1C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Oct 2023 10:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697711104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2XntUvuhro1ALXornIv7c5rBfNf1FPsxFvHaqSzLuXQ=;
 b=TYM0CCuWNi9Lm5jqJynuUVpuGA6a3MJi4ZXAfe07N+0x/uBThG2d355Y/tv9bhDXdDIRHt
 2dfaiu2ZIjcqBWpJOaymobRWMXrT7r5yneErAS6kyGCnOTBB5FFn2urQVaRw/P509Vtxwt
 09iaSTN07/7Fc5chWGygUHJn1a7NJxU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-RPn4CnhONOKEvx6fgEYyoQ-1; Thu, 19 Oct 2023 06:25:03 -0400
X-MC-Unique: RPn4CnhONOKEvx6fgEYyoQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-53faa428157so20464a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Oct 2023 03:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697711102; x=1698315902;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2XntUvuhro1ALXornIv7c5rBfNf1FPsxFvHaqSzLuXQ=;
 b=kFNlYGV3nRZiRoqrZY+di9qM1WXlWvgAg3oteDwdufuzaiI0mnUN1C9qJ9JqWW1sII
 b7tXHdgEgBlLbs9WwGj0/XBgy+lKzcsEo/YhhQIPMCpZPkmvrXGnW7pIUuXOJTI6yzWl
 kXvQ/SsZWkyrLFL6E/wUsjajpekjfHTqKpDSVeEM52SGbMEqPzCYlu6YU8JLfT79bzGR
 ksvLv+HzXi9GbZ9fBwJ6moqGXNpspAlWE9g4L4Ed52RjImlzmAlqVqY4CtVk8F7RewU3
 kedGyvDYqy5hUsUeifscU8+3rdk2i2BXmx/917j3PS/9XR2/cZlW+sVv5H2Q1obsyyrG
 BTmg==
X-Gm-Message-State: AOJu0Yw+xC7y0DqypFgcWi9QKCmBO3vkyNjCv1uumzAaYfCzN4j+dfs4
 gAlbKq0QBUQqohcdxcqallc8xOtys03izj0rHX0yB2gIm56eLjNu8zyIUM75J7oRgPp7hiGZINN
 YnUXH8rgQlTwjJjwBMail//xdkfEF4bLkkdm2acIZ
X-Received: by 2002:a50:c359:0:b0:53f:1aff:4dc2 with SMTP id
 q25-20020a50c359000000b0053f1aff4dc2mr1251331edb.4.1697711102122; 
 Thu, 19 Oct 2023 03:25:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGF/kxTzU+9JHxinXDTjDZm13nI6jLL/SOYN5tFsvK+CZA1Q2UYBbHY6ENsgHZX0due/fqSyA==
X-Received: by 2002:a50:c359:0:b0:53f:1aff:4dc2 with SMTP id
 q25-20020a50c359000000b0053f1aff4dc2mr1251321edb.4.1697711101772; 
 Thu, 19 Oct 2023 03:25:01 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-237-142.dyn.eolo.it.
 [146.241.237.142]) by smtp.gmail.com with ESMTPSA id
 s10-20020a508dca000000b005340d9d042bsm4109287edh.40.2023.10.19.03.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 03:25:01 -0700 (PDT)
Message-ID: <84fbe8a5d47c81142c5eb07b77288711970051e1.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, "Gan, Yi Fang"
 <yi.fang.gan@intel.com>
Date: Thu, 19 Oct 2023 12:24:59 +0200
In-Reply-To: <ZS+IUo5q/AnYm1Gb@shell.armlinux.org.uk>
References: <20231018023137.652132-1-yi.fang.gan@intel.com>
 <ZS+IUo5q/AnYm1Gb@shell.armlinux.org.uk>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Song Yoong Siang <yoong.siang.song@intel.com>, linux-kernel@vger.kernel.org,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Looi Hong Aun <hong.aun.looi@intel.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: update MAC
 capabilities when tx queues are updated
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

On Wed, 2023-10-18 at 08:25 +0100, Russell King (Oracle) wrote:
> On Wed, Oct 18, 2023 at 10:31:36AM +0800, Gan, Yi Fang wrote:
> > From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> > 
> > Upon boot up, the driver will configure the MAC capabilities based on
> > the maximum number of tx and rx queues. When the user changes the
> > tx queues to single queue, the MAC should be capable of supporting Half
> > Duplex, but the driver does not update the MAC capabilities when it is
> > configured so.
> > 
> > Using the stmmac_reinit_queues() to check the number of tx queues
> > and set the MAC capabilities accordingly.
> 
> There is other setup elsewhere in the driver that fiddles with this in
> stmmac_phy_setup(). Maybe provide a helper function so that this
> decision making can be made in one function called from both these
> locations, so if the decision making for HD support changes, only one
> place needs changing?

Indeed that looks both straight-forward and more robust.

@Gan, Yi Fang: please send a v2 introducing and using such helper,
thanks!

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
