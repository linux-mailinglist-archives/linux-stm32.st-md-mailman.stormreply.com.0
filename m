Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A943CACA
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2019 14:11:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D18BD26B73
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2019 12:11:53 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97227D26B72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2019 12:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S/GNdtIZlqbQbbL38vT+kS6/kr3nqJhQg5a+95Ts0Zw=; b=uBLQaosTUT4twouiByQQfxnH/
 X4qEfuUxiBPRXoeFU5qYMzHMNphYduVVAsuxWw/NhQ01M9JU6EtPKJLE/YFdiKyWkdUCYZppap59/
 AJgzd5EQP4i9m9P+pNdP4KD+eVD2nau7Ay6bXTNWXZCa2jucR8F/zSAIIpDKXz2c9Q5h2XumUCFsO
 6Mvh+sg/0QuRsKRhFtM5GE2PcncuJnHYSaqXrirLekSb6x5FXZVvSu0aUt/Vj8KK8BUqGJ/52e/4S
 z3pdpsFGxQ7fACVx7JV038BjTzSpeLpVKWuL8I7CmfWhXTrdwQrVEJktShc4lsFqvTUZuYADV/3XP
 burmnS+fQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52950)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hafct-0005EU-Lt; Tue, 11 Jun 2019 13:11:43 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hafcp-0007rK-A7; Tue, 11 Jun 2019 13:11:39 +0100
Date: Tue, 11 Jun 2019 13:11:39 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Message-ID: <20190611121139.tyoeaamhrslwhjzb@shell.armlinux.org.uk>
References: <20190214083145.15148-1-benjamin.gaignard@linaro.org>
 <e25b2626-231b-28d7-93b0-004a21a3685e@st.com>
 <CAOMZO5A6A2sYzfPgjsqQxWcc4Z0YW9-sENW21KumO_XkN3WBYQ@mail.gmail.com>
 <CA+M3ks7LPEpEfOEqiOZ4q2-We-8BjK0FZfeKts4hBzL7GRRHSw@mail.gmail.com>
 <CA+M3ks5UE8VSa1iHVHWw8NfQWU-v_MRYffVPBMLhy53PD9SJxA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+M3ks5UE8VSa1iHVHWw8NfQWU-v_MRYffVPBMLhy53PD9SJxA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel <linux-kernel@vger.kernel.org>,
 Hui Liu <jason.hui.liu@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 0/2] ARM errata 814220
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

On Tue, Jun 11, 2019 at 01:42:34PM +0200, Benjamin Gaignard wrote:
> Le mer. 24 avr. 2019 =E0 09:25, Benjamin Gaignard
> <benjamin.gaignard@linaro.org> a =E9crit :
> >
> > Le mar. 23 avr. 2019 =E0 19:46, Fabio Estevam <festevam@gmail.com> a =
=E9crit :
> > >
> > > On Wed, Feb 27, 2019 at 1:21 PM Alexandre Torgue
> > > <alexandre.torgue@st.com> wrote:
> > > >
> > > >
> > > > On 2/14/19 9:31 AM, Benjamin Gaignard wrote:
> > > > > Implement ARM errata 814220 for Cortex A7.
> > > > >
> > > > > This patch has been wroten by Jason Liu years ago but never send =
upstream.
> > > > > I have tried to contact the author on multiple email addresses bu=
t I haven't
> > > > > found any valid one...
> > > > > I have keep Jason's sign-off and just rebase the patch on to v5-r=
c6.
> > >
> > > Adding Jason's NXP e-mail address.
> > Thanks !
> >
> > Russell, can Alexandre push this series in stm32 tree or you prefer to
> > merge it yourself ?
> >
> =

> Hello Russell,
> =

> I have push this series in your patch system weeks ago, but nothing happe=
ns.
> Do I miss something in your process ?

I'm now running stuff on a shoe-string here, so I only process patches
once or twice a release cycle.  That's what happens when your funding
gets severely cut - we are now _really_ struggling as a business, and
so I don't see the current situation being able to be maintained much
further into the future (our income is no longer sufficient to sustain
us as a business.)

However, I'll get to it in the next couple of weeks.

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps =
up
According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
