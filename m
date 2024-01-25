Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5233383C174
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jan 2024 12:59:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F28AFC6B477;
	Thu, 25 Jan 2024 11:59:00 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AA24C6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jan 2024 11:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Type:MIME-Version:Message-ID:Date:References:
 In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=Hf6tipOHSadECgsUIyxzcnBsKwPZNts6tZDoPvTRG2c=; b=wg+onJv7knX2ZGhToWqlNLRkF5
 RIWOo89gho7iVAXbECltAjM2vUXLPMFwFn+2CgWvDqrxcPmmLQ+oo2Hzo9apD46BvH6qtd9MpMTHy
 h/rNj0wGZvoM/6FF0OO64NKQrE5vMrGZXa2AtfGyWsEfdsCupeyYsRL78NJX+Pq8WIDEp3fAXI7mC
 qYYC6034h+Eu6HuI3Z3TIt+xyuU0I57snSnPhe7rkZCz/OOSc/g4Gnc1ItJOsYwVvmdlOJRtColw5
 uG4P8lJV88alDM6NiFA0szTjOtaAjpeAtWAgb9qjyTk/KL+pyVh+UY2AlJz1VAoZ9mrYSUV+e0Me2
 vpiN5dCg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <esben@geanix.com>)
 id 1rSyNh-0000nH-18; Thu, 25 Jan 2024 12:58:53 +0100
Received: from [185.17.218.86] (helo=localhost)
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <esben@geanix.com>)
 id 1rSyNg-000K8S-Bp; Thu, 25 Jan 2024 12:58:52 +0100
From: esben@geanix.com
To: Kurt Kanzenbach <kurt.kanzenbach@linutronix.de>
In-Reply-To: <8734ulekuj.fsf@kurt.kurt.home> (Kurt Kanzenbach's message of
 "Thu, 25 Jan 2024 12:03:16 +0100")
References: <b365dc6f756a3fad4dfaa2675c98f4078aba8a55.1706105494.git.esben@geanix.com>
 <b807c2a70dba9711376b265b6da5fb5ff14589aa.1706105494.git.esben@geanix.com>
 <8734ulekuj.fsf@kurt.kurt.home>
Date: Thu, 25 Jan 2024 12:58:52 +0100
Message-ID: <8734ulhber.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27165/Thu Jan 25 10:51:15 2024)
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/3] net: stmmac: Time Based Scheduling
 support for OF platforms
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

Kurt Kanzenbach <kurt.kanzenbach@linutronix.de> writes:

> Hi,
>
> On Wed Jan 24 2024, Esben Haabendal wrote:
>> This allows enabling TBS for TX queues by adding the
>> snps,time-based-scheduling property. You should check for support for this
>> on your particular controller before enabling. Typically, TX queue 0 does
>> not support TBS.
>
> More a general question: Do i see that correctly that Launch Time does
> not work for OF platforms (such as an imx93) at the moment, because the
> tbs_en property is not configured? Or why are these patches necessary?

Correct.  You cannot use etf qdisc with "offload" on for OF platforms,
including imx93.
Doing that will end with "return -EINVAL" in tc_setup_etf().

I am working with imx98mp, but there should not be any difference for
imx93.

/Esben
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
