Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EDB9D418D
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 18:49:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FF3BC7A85C;
	Wed, 20 Nov 2024 17:49:45 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F33C7C7A833
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Nov 2024 13:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=finest.io;
 s=s1-ionos; t=1731937445; x=1732542245; i=parker@finest.io;
 bh=b3Pjbz/GSF9pG8ylznqiAUCGfHFGePVPHSwvADAHbxk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=LDtCKeg5wmY7z7+byYxayTnqiqxY2Epv7MVOaeNtyVDq4hA9O0zT0rGpg2y0pv22
 gz1tojq8lw3o9L7N75ACpihm7vJnakUc36MJUYZbv9z75xEn9KUNbvdYZmbTxODU9
 xd6EBqEJlXZH41t7ejCOOO/Uo9spLhzNg/bsx6BbyApR8ng9zTLkLY56VvVbL0cvE
 8qnMzXbQqWQYVcUL6iSx6r2zxrEDYYxNQEYcJJcuDSl8cGTVsjMLoze6StA5cA2lv
 Lgwnuqv8QAdQL5uN3BmLM9hUuqYosM+2U1jvs6Okx02dI15GMDI+BrYokmWso871f
 eKHEs9kikoXNAei0QQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from SWDEV2.connecttech.local ([98.159.241.229]) by
 mrelay.perfora.net (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id
 1MScQ1-1tJKeL40Eb-00QdK2; Mon, 18 Nov 2024 14:44:05 +0100
Date: Mon, 18 Nov 2024 08:44:00 -0500
From: Parker Newman <parker@finest.io>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20241118084400.35f4697a.parker@finest.io>
In-Reply-To: <bb52bdc1-df2e-493d-a58f-df3143715150@lunn.ch>
References: <cover.1731685185.git.pnewman@connecttech.com>
 <f2a14edb5761d372ec939ccbea4fb8dfd1fdab91.1731685185.git.pnewman@connecttech.com>
 <ed2ec1c2-65c7-4768-99f1-987e5fa39a54@redhat.com>
 <20241115135940.5f898781.parker@finest.io>
 <bb52bdc1-df2e-493d-a58f-df3143715150@lunn.ch>
Organization: Connect Tech Inc.
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:b2G6KXDe8gzQmPCDojvaXK5OwJiaOjeUL/OAy4fEaNFv4Q5aKIo
 mhL09ZNLedzJODU2GzkC/HWh8N2RTb2nLPUMCzmhJgss4K/Rn1ATnAGlRZIpQ6t3Dd3tWvt
 e4yt8/6oFRnYqO1E3AWr2Rd3FeQRRHYtCEjJgHx2X8fyIgPB1brbQSfZMZ5rzk1F7gYxdWQ
 paVLM7vpd5yCSvHVAay5g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fEdC3lWj9d4=;eCkKdOMs3P4uhxnIbRuuZzVpZb2
 8fxMT0QBWUmbIn8SkJjvEzpox+A385aWoPiVO5tQ34PZsoizYVAXRYE/+wMVLyDYu9uy7xVqk
 RsalDsW6zr7pSsOyC1cNiJIT1YYJsMnBFKHLeuyHRlOiVbiwrz0D3RCoRxxL3PIzTl5v4pn98
 YYtRJ2zNdrWSvzIEGhgflxJMF1LXQbT0cU8oNNEA7tL2bEI6o4bBFTr2DcPgxZtLFR/6Ypi0U
 YG3SM6E7HQnlCYVrCw3rHBwXsqjmiR0ZNMRzOa6IqBI9NjYXQJmNCvj7Z6rK7z55/yjDUFkxZ
 6XyaKyqA5iozqTLUhk1xc4Wm/o7fT/0luKeIKKTKP498JIXP7aPTKE16xo+ANMNBbggKPKkXW
 q4yMDeETufkavR6dMFlz3x254HgTLen9c7UIcEUlCuDp2i0YWcgl3J1GQ7xLysagyhBVCT+Mi
 x6/+ZzlehFm5Xyy+koCmspAm7f/QqdDa0Wm1NJGuOf9/x9Z4uEtvIof8lZUyhrAagmzDe6AIw
 cg5oSj7IZ/W2/c6oYo1w/BJmj7qPHFlvPFXqCTM0J7mMrA7fNY+8yXCT+JEDl4aQghVnJWbTy
 IboJzDp1ObFgsu7yxtK6jMzCIOMLMD/0O5UF7fIuC39CG7Md5McqiZULKBrISpO2cjEd5l5rK
 WmWC55ivc8aRq76Nc6p3BLO79CTGzZ5kuFERb8u1nl0XBZkV/sCQsp4sb70tipqyFCUPKif9R
 Va4t3uiUZGI4D9ZwldjIt8S7ib+b7XrC8OZ4kQpMWxVnPLmAO18XFchMDSMPxjkyoGHUZEgd/
 5f7/EMNghuvxh27cObtaW1xUmHGSFoRfhwo66O7rLape+fHyP54mmvLctK7QqbVCdg
X-Mailman-Approved-At: Wed, 20 Nov 2024 17:49:43 +0000
Cc: Parker Newman <pnewman@connecttech.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Hunter <jonathanh@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 1/1] net: stmmac: dwmac-tegra: Read
 iommu stream id from device tree
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

On Sat, 16 Nov 2024 20:22:53 +0100
Andrew Lunn <andrew@lunn.ch> wrote:

> On Fri, Nov 15, 2024 at 01:59:40PM -0500, Parker Newman wrote:
> > On Fri, 15 Nov 2024 18:17:07 +0100
> > Paolo Abeni <pabeni@redhat.com> wrote:
> >
> > > On 11/15/24 17:31, Parker Newman wrote:
> > > > From: Parker Newman <pnewman@connecttech.com>
> > > >
> > > > Read the iommu stream id from device tree rather than hard coding to mgbe0.
> > > > Fixes kernel panics when using mgbe controllers other than mgbe0.
> > >
> > > It's better to include the full Oops backtrace, possibly decoded.
> > >
> >
> > Will do, there are many different ones but I can add the most common.
> >
> > > > Tested with Orin AGX 64GB module on Connect Tech Forge carrier board.
> > >
> > > Since this looks like a fix, you should include a suitable 'Fixes' tag
> > > here, and specify the 'net' target tree in the subj prefix.
> > >
> >
> > Sorry I missed the "net" tag.
> >
> > The bug has existed since dwmac-tegra.c was added. I can add a Fixes tag but
> > in the past I was told they aren't needed in that situation?
> >
> > > > @@ -241,6 +243,12 @@ static int tegra_mgbe_probe(struct platform_device *pdev)
> > > >  	if (IS_ERR(mgbe->xpcs))
> > > >  		return PTR_ERR(mgbe->xpcs);
> > > >
> > > > +	/* get controller's stream id from iommu property in device tree */
> > > > +	if (!tegra_dev_iommu_get_stream_id(mgbe->dev, &mgbe->iommu_sid)) {
> > > > +		dev_err(mgbe->dev, "failed to get iommu stream id\n");
> > > > +		return -EINVAL;
> > > > +	}
> > >
> > > I *think* it would be better to fallback (possibly with a warning or
> > > notice) to the previous default value when the device tree property is
> > > not available, to avoid regressions.
> > >
> >
> > I debated this as well... In theory the iommu must be setup for the
> > mgbe controller to work anyways. Doing it this way means the worst case is
> > probe() fails and you lose an ethernet port.
>
> New DT properties are always optional. Take the example of a board
> only using a single controller. It should happily work. It probably
> does not have this property because it is not needed. Your change is
> likely to cause a regression on such a board.
>
> Also, is a binding patch needed?
>
> 	Andrew

This is not a new dt property, the "iommus" property is an existing property
that is parsed by the Nvidia implementation of the arm-smmu driver.

Here is a snippet from the device tree:

smmu_niso0: iommu@12000000 {
        compatible = "nvidia,tegra234-smmu", "nvidia,smmu-500";
...
}

/* MGBE0 */
ethernet@6800000 {
	compatible = "nvidia,tegra234-mgbe";
...
	iommus = <&smmu_niso0 TEGRA234_SID_MGBE>;
...
}

/* MGBE1 */
ethernet@6900000 {
	compatible = "nvidia,tegra234-mgbe";
...
	iommus = <&smmu_niso0 TEGRA234_SID_MGBE_VF1>;
...
}

The 2nd field of the iommus propert is the "Stream ID" which arm-smmu stores
in the device's struct iommu_fwspec *fwspec. This is what the existing
tegra_dev_iommu_get_stream_id() function uses to get the SID.

If the iommus property is missing completely from the MGBE's device tree node it
causes secure read/write errors which spam the kernel log and can cause crashes.

I can add the fallback in V2 with a warning if that is preferred.

Thanks,
Parker




_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
