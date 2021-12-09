Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E8346E083
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Dec 2021 02:55:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA61BC5F1EA;
	Thu,  9 Dec 2021 01:55:04 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA77DC5F1E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Dec 2021 01:55:02 +0000 (UTC)
X-UUID: 976cb222604948b6b6e4e47fc25af019-20211209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=WIV75YWZapc7GJoPTfjsaqgrja4fRL9eKNuW62oS71w=; 
 b=ZZ8ZvMmlCr8vWKjA5sifCtDeR/aJWGNcK5jWlU6ckU3/NGwlMmbeHzY9eT47F4NFiTmU361PmD19Fqv2qw7OgI37PfyXrLAlVyuCs1gK+udEnCHS7k3ZcWcaRrw5Vk0ziU9xwDYiowBbNW8d7JUScFJb98dYtFyNp7dCnKZvOI8=;
X-UUID: 976cb222604948b6b6e4e47fc25af019-20211209
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1238356704; Thu, 09 Dec 2021 09:54:56 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 9 Dec 2021 09:54:54 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 9 Dec 2021 09:54:53 +0800
Message-ID: <6deeba8396a72d3d0bb3cb6630bc0c36f652de80.camel@mediatek.com>
From: Biao Huang <biao.huang@mediatek.com>
To: Jakub Kicinski <kuba@kernel.org>
Date: Thu, 9 Dec 2021 09:54:53 +0800
In-Reply-To: <20211208175142.1b63afea@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20211208054716.603-1-biao.huang@mediatek.com>
 <20211208054716.603-6-biao.huang@mediatek.com>
 <20211208063820.264df62d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <39aa23e1a48bc36a631b3074af2abfd5d1e2256d.camel@mediatek.com>
 <20211208175142.1b63afea@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Cc: Jose Abreu <joabreu@synopsys.com>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 dkirjanov@suse.de, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH net-next v7 5/6] stmmac: dwmac-mediatek:
 add support for mt8195
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

On Wed, 2021-12-08 at 17:51 -0800, Jakub Kicinski wrote:
> On Thu, 9 Dec 2021 09:48:25 +0800 Biao Huang wrote:
> > Sorry for some typo in previous reply, fix it here.
> > 
> > All these warning lines share a similar semantics:
> > delay_val |= FIELD_PREP(xxx, !!val);
> > 
> > and, should come from the expansion of FIELD_PREP in
> > include/linux/bitfiled.h:
> > 
> >   FIELD _PREP --> __BF_FILED_CHECK --> "~((_mask) >>
> > __bf_shf(_mask)) &
> > (_val) : 0,"
> > 
> > ===============================================================
> > __BF_FILED_CHECK {
> > ...
> >   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
> >                    ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
> >                    _pfx "value too large for the field"); \ ...
> > ===============================================================
> > 
> > Should I fix it by converting
> >   delay_val |= FIELD_PREP(ETH_DLY_TXC_ENABLE, !!mac_delay-
> > >tx_delay);
> > to
> >   en_val = !!mac_delay->tx_delay;
> >   delay_val |= FIELD_PREP(ETH_DLY_TXC_ENABLE, en_val);
> > 
> > or other suggestions for these warnings?
> 
> I see, thanks for explaining. The code is fine, we can simply ignore
> this warning IMHO.
OK, thanks for your comments~
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
