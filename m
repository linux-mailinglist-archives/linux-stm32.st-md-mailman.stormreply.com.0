Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BF77F378F
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Nov 2023 21:36:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 029AAC6B475;
	Tue, 21 Nov 2023 20:36:25 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB874C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Nov 2023 20:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=n8r2YqwbMhKNr3zlZBjNkqkvBYIoxIi/cLEUD7ZrfpY=; b=Je
 820PRYE5x9xa1o3S3OwSouTO6IrOYeBsmC0/5QgogyteWoaB2iBC72/UoneRMqEXqhc17vPoMXuIw
 YJ3kqZUd6rBSL//QQ1Xxgq3l8+rRYhnaOdYeZ7ToVSUvjEEckN9WU5Tqy/jfg4GZb87Ymz5Z1n8m3
 heOg3FKx2mS3r+8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1r5XTh-000nIi-Ha; Tue, 21 Nov 2023 21:36:13 +0100
Date: Tue, 21 Nov 2023 21:36:13 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ray Zhang <sgzhang@google.com>
Message-ID: <ebbdf786-54d4-491c-ab81-de03006ec727@lunn.ch>
References: <20231121184543.3433940-1-sgzhang@google.com>
 <84be10f3-0880-4ccd-b6d3-b5feecea75ef@lunn.ch>
 <CAPqVEODWZ5suy7MEc_QXz_mx5uryypz1zAi9M9re-xqhs3urSA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPqVEODWZ5suy7MEc_QXz_mx5uryypz1zAi9M9re-xqhs3urSA@mail.gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix out-of-bounds read via
 memcpy detected by KASAN
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

>     >=A0 =A0 =A0 q0_tx_irq_n: 4
>     >=A0 =A0 =A0 q0_rx_pkt_n: 64
>     >=A0 =A0 =A0 q0_rx_irq_n: 58
> =

>     What useful information does this list of statistics bring in the
>     commit message?
> =

> Each output line of "ethtool -S" is from the modified code: It shows the
> command still yields normal output results as expected.

Does it? Can you actually say that looking at it?

> No, since strscpy=A0does the job already. Also I could not find ethtool_p=
uts:
> where is it defined? Or do you mean ethtool_put_stat, which is inappropri=
ate to
> use here since it requires a skb parameter?

https://patchwork.kernel.org/project/netdevbpf/patch/20231102-ethtool_puts_=
impl-v4-3-14e1e9278496@google.com/

Maybe check with Justin when we will resend that patch.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
