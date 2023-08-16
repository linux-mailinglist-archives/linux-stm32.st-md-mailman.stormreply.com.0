Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE75777E5A8
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Aug 2023 17:52:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B45BC6B45F;
	Wed, 16 Aug 2023 15:52:15 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8471FC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 15:52:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4FAD061057;
 Wed, 16 Aug 2023 15:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891AEC433C8;
 Wed, 16 Aug 2023 15:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692201131;
 bh=TIjmNB9p3Z/mYIestCCsQETqQqkBVHq59rkmx1l98tA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NmQqVHOpb7712AfKgM+B5SW3Twh3u+wfuMdaMR2kdraPNtxc51ZTVcveQS/KsnlI7
 z5d8o/ARnKgq2cHsoOamkNT7PcIXW/dfBNvMYNyE17sOZpCv6JH9zLXj+iR1RzH6sN
 +10ByFqwsvqIalj7HygKCrPScZ1NhSqy9RBtaYuTNq4Ne4eaw7lf3qy2TR+8Xwdh7q
 oVzdbYk5sIhqrwe7MxDX8MuALkWgLbeVCqO/RWvXIJpuvPF6YHTuq2MJQE22mCN4LB
 j7y0XTEuhaZd+4mqnlR5YrS3t/2aTcEC+Wfu0Q2OvoL/FuzYabSBlIEIH4Jsbc0/qn
 EverZ1UpwQCnw==
Date: Wed, 16 Aug 2023 23:40:25 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: "G Thomas, Rohan" <rohan.g.thomas@intel.com>
Message-ID: <ZNzt6cP9fVnGZe9d@xhacker>
References: <DM3PR11MB871491A357B9A12BF1B0CC82DE16A@DM3PR11MB8714.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM3PR11MB871491A357B9A12BF1B0CC82DE16A@DM3PR11MB8714.namprd11.prod.outlook.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "edumazet@google.com" <edumazet@google.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next v3 03/10] net: stmmac: mdio:
 enlarge the max XGMAC C22 ADDR to 31
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

On Sun, Aug 13, 2023 at 02:18:27PM +0000, G Thomas, Rohan wrote:
> 
> On 8/9/23 18:50, Jisheng Zhang wrote:
> > The IP can support up to 31 xgmac c22 addresses now.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >   drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> > index 3db1cb0fd160..e6d8e34fafef 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> > @@ -40,7 +40,7 @@
> >   #define MII_XGMAC_WRITE			(1 << MII_XGMAC_CMD_SHIFT)
> >   #define MII_XGMAC_READ			(3 << MII_XGMAC_CMD_SHIFT)
> >   #define MII_XGMAC_BUSY			BIT(22)
> > -#define MII_XGMAC_MAX_C22ADDR		3
> > +#define MII_XGMAC_MAX_C22ADDR		31
> >   #define MII_XGMAC_C22P_MASK		GENMASK(MII_XGMAC_MAX_C22ADDR, 0)
> >   #define MII_XGMAC_PA_SHIFT		16
> >   #define MII_XGMAC_DA_SHIFT		21
> 
> Recent commit 10857e677905 ("net: stmmac: XGMAC support for mdio C22
> addr > 3") already addressed this in a different way. As per Synopsis
> IP team until version 2.2, XGMAC supports only MDIO devices 0 - 3. An

I didn't find your patch in mailist when I submit the v1 on 23 July, in
fact my series was earlier than yours.

> XGMAC IP version check is newly added for the same reason. I think this
> covers your commit also. Please have a look and if so you can drop this
> commit.

Dropped in new version.

> 
> BR,
> Rohan
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
