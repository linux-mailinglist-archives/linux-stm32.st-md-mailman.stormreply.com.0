Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2096093C
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2019 17:24:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C94BC35E01
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2019 15:24:59 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA45CC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2019 15:24:57 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a15so9447077wmj.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jul 2019 08:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=776FeSmsIvO9BAuOMfeYFd0GoNy4MOugdcwM/WuTqsg=;
 b=PBgHa7BQApvEk3m/50z6wziaw2Yv01CO3uBItHINnz4ARhdSYZX/h/XULODQ7roknM
 NqXltRZuqAO6z2id1WpdesjpwtCY04gypErUOUmV5gKFajMA67bCIZ3vA1AB5OqhuK3N
 HgCHq9gQwesyRZ3Ov/OjAyMct5QUJeHySzX6dhh+f/WPco6uM/3JWEehGRyry/l/1TLL
 wqS2IauQSempUSqAoOw4K9yN+wepHNjVmxhAka9uBfUfOlpSSoqYEFb7Z1CASVzNAc8h
 XPIdkNm2jMJplehxOjzNqY4i4WKqYPR6DDfU3Aj1paFwNKVSAGg8xVdf6eEw3uKDSMOs
 CjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=776FeSmsIvO9BAuOMfeYFd0GoNy4MOugdcwM/WuTqsg=;
 b=VD6jwDrcOMqjP4RmQdz/uBePljWt/r8I3W7AfM8ASurcZP2ZOXwU3h5pzywmMNufgU
 WDxj8dwk6A2KBCzpR1+MZd7hIxz4qRqr/LSVhWd8p0rO3cb2/UO99DAteprrlvhWocS7
 VeUnWxp9jWtVmaeAqA1wzfyUraxdeWtn8in+j0piTzgpRlogK2NGLIfeHdbX62Anw3iS
 t/4BpSVDE0TpQOpGbxKZIr2MrMnA2uJjNJ1tFsEoyFhU1u1QGPlnCMb1YYzXk1CistuZ
 0uA2Z0jVt01cQ28GO9BlBVjZa/zLdDYDDD7mN58XED2oz5+/bDtYNwuTp3dgkUJVLlcW
 gzng==
X-Gm-Message-State: APjAAAXmGfkynDOL6kgEl08ypRJ+avHUS46ItGJIRgoY4lkzVfMvqgBC
 oLPhjDsn44Z9CJ5LlqZ7KYsxoA==
X-Google-Smtp-Source: APXvYqwIn+CAMTXhiaR2OhdbdPqYr3i7rcxaiDbB1iTdnKqBy7Yo87Yv81S7nEiWLwHuACvpF1sKxA==
X-Received: by 2002:a7b:c84c:: with SMTP id c12mr3851618wml.70.1562340297200; 
 Fri, 05 Jul 2019 08:24:57 -0700 (PDT)
Received: from apalos (athedsl-428434.home.otenet.gr. [79.131.225.144])
 by smtp.gmail.com with ESMTPSA id c30sm789893wrb.15.2019.07.05.08.24.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jul 2019 08:24:56 -0700 (PDT)
Date: Fri, 5 Jul 2019 18:24:53 +0300
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20190705152453.GA24683@apalos>
References: <cover.1562311299.git.joabreu@synopsys.com>
 <384dab52828c4b65596ef4202562a574eed93b91.1562311299.git.joabreu@synopsys.com>
 <20190705132905.GA15433@apalos>
 <BN8PR12MB32666359FABD7D7E55FE4761D3F50@BN8PR12MB3266.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BN8PR12MB32666359FABD7D7E55FE4761D3F50@BN8PR12MB3266.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, Arnd Bergmann <arnd@arndb.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Jesper Dangaard Brouer <brouer@redhat.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac: Introducing
 support for Page Pool
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

Hi Jose, 

On Fri, Jul 05, 2019 at 03:21:16PM +0000, Jose Abreu wrote:
> From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> 
> > I think this look ok for now. One request though, on page_pool_free 
> 
> Thanks for the review!
> 
> > A patch currently under review will slightly change that [1] and [2]
> > Can you defer this a bit till that one gets merged?
> > The only thing you'll have to do is respin this and replace page_pool_free()
> > with page_pool_destroy()
> 
> As we are in end of release cycle net-next may close soon so maybe this 
> can be merged and I can send a follow-up patch later if that's okay by 
> you and David ?
Well ideally we'd like to get the change in before the merge window ourselves,
since we dont want to remove->re-add the same function in stable kernels. If
that doesn't go in i am fine fixing it in the next merge window i guess, since
it offers substantial speedups


Thanks
/Ilias
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
