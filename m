Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 976AD139291
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2020 14:55:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5658FC36B0B;
	Mon, 13 Jan 2020 13:55:56 +0000 (UTC)
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AF0EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 13:17:27 +0000 (UTC)
Received: (wp-smtpd smtp.wp.pl 467 invoked from network);
 13 Jan 2020 14:17:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
 t=1578921446; bh=fiL5feLAQg1wnn446GC+3zMpF7346AQGDCS3XeChSTA=;
 h=From:To:Cc:Subject;
 b=qzBDUTyY3N87LSG2hKt7ZSXgIJ4yQdIF3Os+2js59ftWgJBrd/cPmAI/+Hdwlnkg6
 Fyed6NcUYyiy55TmsPGH5Wenjb7lct8Nj6qQX3SY6YaR/ETLhN91iUyNG/C0oGr5Hi
 kCBZomcIlnMvzE7EYGBk9nRfqXBXXMu5T905jGjM=
Received: from c-73-93-4-247.hsd1.ca.comcast.net (HELO cakuba)
 (kubakici@wp.pl@[73.93.4.247]) (envelope-sender <kubakici@wp.pl>)
 by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
 for <boon.leong.ong@intel.com>; 13 Jan 2020 14:17:26 +0100
Date: Mon, 13 Jan 2020 05:17:12 -0800
From: Jakub Kicinski <kubakici@wp.pl>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Message-ID: <20200113051712.73442991@cakuba>
In-Reply-To: <1578967276-55956-4-git-send-email-boon.leong.ong@intel.com>
References: <1578967276-55956-1-git-send-email-boon.leong.ong@intel.com>
 <1578967276-55956-4-git-send-email-boon.leong.ong@intel.com>
MIME-Version: 1.0
X-WP-MailID: 9114ca6d95137af99c81d33196a332a9
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [YVNE]                               
X-Mailman-Approved-At: Mon, 13 Jan 2020 13:55:55 +0000
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Voon Weifeng <weifeng.voon@intel.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tan Tee Min <tee.min.tan@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 3/7] net: stmmac: fix missing
 netdev->features in stmmac_set_features
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

On Tue, 14 Jan 2020 10:01:12 +0800, Ong Boon Leong wrote:

Please fix the date on your system.

Please always provide a patch description. For bug fixes description of
how the bug manifest to the users is important to have.

> Fixes: d2afb5bdffde ("stmmac: fix the rx csum feature")
> 

Please remove the empty lines between the Fixes tag and the other tags
on all patches.

> Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index cd55d16..dc739cd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3911,6 +3911,8 @@ static int stmmac_set_features(struct net_device *netdev,
>  	for (chan = 0; chan < priv->plat->rx_queues_to_use; chan++)
>  		stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
>  
> +	netdev->features = features;
> +
>  	return 0;
>  }
>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
