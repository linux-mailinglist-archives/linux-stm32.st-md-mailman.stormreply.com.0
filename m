Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C1A83BFF0
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jan 2024 12:01:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CFF9C6B458;
	Thu, 25 Jan 2024 11:01:52 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D63DC6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jan 2024 11:01:51 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5100fd7f71dso2386957e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jan 2024 03:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706180510; x=1706785310;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=miuHCVwgH0ReGM1PaYlhcfq7/djqKFtBuYNwdTBB2rs=;
 b=d2p5NEDe516ytA27reJceCKqqvx1V74tE8CdArvaeXUJyVPlEzROdopgoOBHtoFeBh
 Uwq3AKoRPAU1eTu1AAzHaapq26uGXBNpkFdODr++WlSyYY3g7YKIjAYFOKxb5GViIKwg
 4BGTWzCS4iTd06UawKXAgT6SJRTXbrtrT+PYv/8ZmodJcQ5tQefa3iDD34rlbu6xqEgo
 5E1/VinnTddW4zCAwvm3K1CZu0dwVEZFTCF6A2ozV9oGO+1KHZWpF6az25kXfi8vV8le
 RKJBYcegqpOcTRv5j2ma5Ts0k2tvkCJQS1zFcWxmoZkvw67YmSa7PIQ9dliNQ7GKSCIP
 NXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706180510; x=1706785310;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=miuHCVwgH0ReGM1PaYlhcfq7/djqKFtBuYNwdTBB2rs=;
 b=IfIDC7LSd6bBec/eveHaVXDeBX06bcyRFYxjr0AM+L575abKlcPuZhyin7lvDBBdwt
 iDifmL2j1j7+DFEwBOfrusxqSm/j0hQYuo7UA9FSwPYqQsGEx4c84lczRM16MHcX2KAn
 NC695/U/YcRbyfE2FTuOdhtaotScxUL9NmOp/8ogMyppeXeoVPUtgJQMuNkr6zWr+uX7
 k2APAZEsFxWlQvlsh8msNTMT+tE9f9rQB8IU/DT2JkYVK3k5zGdZKQauBUSYg3ddWdzW
 tyQaJ5ch/SCyNIU51Qo7atzJDTr+n+Amtps/d2+nKNpztiHB/bp+KO6ueqWxUiXvwre3
 yCwA==
X-Gm-Message-State: AOJu0Yx0a5/B1jhj5jAv2AqniEbdCNmtKANruvoHnnpYdtzg98TZkLtd
 GwbshOsGIascEE1CQ0dPmQ+zhZX3sua6wfhJ5cvKH7fF9FfwNFE2
X-Google-Smtp-Source: AGHT+IFlB2MgGLnpQeRwCJpsgL6fLkk+sNLY3XK5121CEnUBfLxwPC5+nWSbyXBQ20M00lfQUDSEkQ==
X-Received: by 2002:ac2:57c5:0:b0:50e:6317:54ab with SMTP id
 k5-20020ac257c5000000b0050e631754abmr324729lfo.42.1706180509935; 
 Thu, 25 Jan 2024 03:01:49 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a194f0e000000b0051006813733sm766441lfb.86.2024.01.25.03.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 03:01:49 -0800 (PST)
Date: Thu, 25 Jan 2024 14:01:46 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Message-ID: <3aagjpld4v7u4cfj3lge5rg6v6ro3ehnstjz3jfculx3vdpbvd@4y3hw7v4idhp>
References: <20240123085037.939471-1-0x1207@gmail.com>
 <ii3muj3nmhuo6s5hm3g7wuiubtyzr632klrcesubtuaoyifogb@ohmunpxvdtsv>
 <20240125103454.0000312a@gmail.com>
 <c37feb621fa3f7867af8d97ffe36f577966ba3ec.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c37feb621fa3f7867af8d97ffe36f577966ba3ec.camel@redhat.com>
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Furong Xu <0x1207@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: xgmac: fix safety error
	descriptions
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

On Thu, Jan 25, 2024 at 11:09:06AM +0100, Paolo Abeni wrote:
> On Thu, 2024-01-25 at 10:34 +0800, Furong Xu wrote:
> > On Wed, 24 Jan 2024 17:25:27 +0300
> > Serge Semin <fancer.lancer@gmail.com> wrote:
> > 
> > > On Tue, Jan 23, 2024 at 04:50:37PM +0800, Furong Xu wrote:
> > > > Commit 56e58d6c8a56 ("net: stmmac: Implement Safety Features in
> > > > XGMAC core") prints safety error descriptions when safety error assert,
> > > > but missed some special errors, and mixed correctable errors and
> > > > uncorrectable errors together.
> > > > This patch complete the error code list and print the type of errors.  
> > > 
> > > The XGMAC ECC Safety code has likely been just copied from the DW GMAC
> > > v5 (DW QoS Eth) part. So this change is partly relevant to that code too. I
> > > can't confirm that the special errors support is relevant to the DW
> > > QoS Eth too (it likely is though), so what about splitting this patch
> > > up into two:
> > > 1. Elaborate the errors description for DW GMAC v5 and DW XGMAC.
> > > 2. Add new ECC safety errors support.
> > > ?
> > > 
> > > On the other hand if we were sure that both DW QoS Eth and XGMAC
> > > safety features implementation match the ideal solution would be to
> > > refactor out the common code into a dedicated module.
> > > 
> > > -Serge(y)
> > > 
> > 
> > Checked XGMAC Version 3.20a and DW QoS Eth Version 5.20a, the safety error
> > code definitions are not identical at all, they do have some differences,
> > about more than 20 bits of status register are different.
> > I think we should just leave them in individual implementations.
> 

> @Serge: given the above, would you still advice for splitting this
> patch into 2?

Preliminary I would still in insist on splitting up. I'll double check
the patch and the Safety feature implementations in both devices and
give more detailed response to Furong in an hour or so.

-Serge(y)

> 
> Thanks,
> 
> Paolo
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
