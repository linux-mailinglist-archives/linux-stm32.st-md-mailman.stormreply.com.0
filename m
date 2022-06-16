Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D81C954E081
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jun 2022 14:04:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 877DAC03FE0;
	Thu, 16 Jun 2022 12:04:08 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BCE3C03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jun 2022 12:04:07 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id g4so1572343wrh.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jun 2022 05:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:from:to:cc:subject:references:mime-version
 :content-disposition:in-reply-to;
 bh=NvTotWv8XnzVZu+pHQebgM4bWsTTZKNeIdjOwDoju7E=;
 b=FW7I1cA/aAcawnoclOF3N/CI0+ENH8qb6obcOzoQ6ODb2/OGq0INjFy8zF8ZxnNa20
 XLceFXJ3I08a7I7hyt26nZjN+3I4pehoxfIVgpkM11DhEh3oef7rnCC5X0ile71OJtCN
 xaBtR2bmdVgf8LreqXb4Ahr+9eqK6QePgB1O6OxUudDYvuk7EZASerj/LCDO9nJJvLBb
 7Hju6O1R+SHO/mTFJ4/V3GxBq2l1IZzF6EDusy63YRAMNLbhyRLIpa4/yDWq9PuCnMa2
 AEvKYYTowKDUBPWQCc8VlqIyLVWBINn/5sxWbrFJssiHVtuC7/AW6NidGcJcuk1zLBnT
 /SXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:from:to:cc:subject:references
 :mime-version:content-disposition:in-reply-to;
 bh=NvTotWv8XnzVZu+pHQebgM4bWsTTZKNeIdjOwDoju7E=;
 b=VvXvInuWv88rMWmXKRiliakvvCmVqWEJgSp5OCahXbSOK7zrjaby7yrvz5NPA4GHU8
 5H4GS98/VqxB/794wB4dSbfGfA9byDT4J/2c0uzuJykJL2MWNgDqjyJJDkd9Bfd9oXnU
 s0XwMASILErn5DWH6vt26DJSt/4hvlb/wyGg38ONmsFmv5x1Xp/qfEisk0u8ca5MjzU1
 pm5CO+P9pxlVj+FmtVINfZ6/yQIaSHS7itV9DG/7QAq0HyMB2FNOyCCk6lxLSlxM5jMM
 v5hRbZSyiRiEsUzNV9g1TdLJteQHRkmqjEc4G6VF536ZeTetkj2/6sKK3+qZ3xynpAvR
 bpSQ==
X-Gm-Message-State: AJIora/6KexHeK3tKQIvpEinQNoZMaokYhRPi0PXTWkPNJhXy6gKu/Z/
 a/ClwG7y9KE8A32kfIEtZ7A=
X-Google-Smtp-Source: AGRyM1vGe0hqTNQlFi19vRGu0VDlfq55drHnbDnjclViV5t5NFO8MwRfAtbD0ugYV3SFtgr/4mg+fw==
X-Received: by 2002:a5d:6a0e:0:b0:213:1f7f:e1cc with SMTP id
 m14-20020a5d6a0e000000b002131f7fe1ccmr4373123wru.31.1655381046289; 
 Thu, 16 Jun 2022 05:04:06 -0700 (PDT)
Received: from Ansuel-xps. (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
 by smtp.gmail.com with ESMTPSA id
 f3-20020adff583000000b002100316b126sm1700890wro.6.2022.06.16.05.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 05:04:05 -0700 (PDT)
Message-ID: <62ab1c35.1c69fb81.9ea8e.2cb0@mx.google.com>
X-Google-Original-Message-ID: <YqscMzlPDIT0mbTQ@Ansuel-xps.>
Date: Thu, 16 Jun 2022 14:04:03 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
References: <20220614224141.23576-1-ansuelsmth@gmail.com>
 <20220615195507.52ee19df@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220615195507.52ee19df@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next PATCH] net: ethernet: stmicro: stmmac:
 permit MTU change with interface up
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

On Wed, Jun 15, 2022 at 07:55:07PM -0700, Jakub Kicinski wrote:
> On Wed, 15 Jun 2022 00:41:41 +0200 Christian 'Ansuel' Marangi wrote:
> > +	if (netif_running(dev)) {
> > +		netdev_dbg(priv->dev, "restarting interface to change its MTU\n");
> > +		stmmac_release(dev);
> > +
> > +		stmmac_open(dev);
> > +		stmmac_set_filter(priv, priv->hw, dev);
> 
> What if stmmac_open() fails because the memory is low or is fragmented?
> 
> You'd need to invest more effort into this change and try to allocate
> all the resources before shutting the device down.

Well what I'm doing here is following what is done with other similar
function in stmmac. For example the reinit_queues and reinit_ringparam
doesn't do such check.

But ok you are right, will see a good solution to change stmmac_open to
preallocate the buffers.

-- 
	Ansuel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
