Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5B88D1B03
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2024 14:22:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A468C6B47E;
	Tue, 28 May 2024 12:22:18 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF2A6CFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 12:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=yW/FU7UpcM+jJM7bEDl1D2hvUGQXB3YbQSi0AdGiRPI=; b=SNRCXPQOce3q69sRwG/yFHSyl+
 lbYw4S9Iu8RWmJ1MCSjYOyfChAQYmlaM07R3zJN4DW0QlEiT/Fik0RzUtklYuEHpw8OsGrb37HVI6
 kr5EXnQcSp0GEIlxeZQ75b85fSk6ke4/owGEGO4XrVFtEqKYgdS9Mkea7Z/4kTEDDFFk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sBvpr-00G9Tx-76; Tue, 28 May 2024 14:21:47 +0200
Date: Tue, 28 May 2024 14:21:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Ng, Boon Khai" <boon.khai.ng@intel.com>
Message-ID: <cf5ad64e-c9c3-426f-a262-3f03964b90fe@lunn.ch>
References: <20240527093339.30883-1-boon.khai.ng@intel.com>
 <20240527093339.30883-2-boon.khai.ng@intel.com>
 <BY3PR18MB47372537A64134BCE2A4F589C6F02@BY3PR18MB4737.namprd18.prod.outlook.com>
 <DM8PR11MB5751CE01703FFF7CB62DAF9BC1F02@DM8PR11MB5751.namprd11.prod.outlook.com>
 <BY3PR18MB4737DAE0AD482B9660676F6BC6F02@BY3PR18MB4737.namprd18.prod.outlook.com>
 <DM8PR11MB5751118297FB966DA95F55DFC1F12@DM8PR11MB5751.namprd11.prod.outlook.com>
 <BY3PR18MB4737D071F3F747B6ECB15BF2C6F12@BY3PR18MB4737.namprd18.prod.outlook.com>
 <DM8PR11MB57515E89D10F06644155DA11C1F12@DM8PR11MB5751.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM8PR11MB57515E89D10F06644155DA11C1F12@DM8PR11MB5751.namprd11.prod.outlook.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Ang,
 Tien Sung" <tien.sung.ang@intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
 Jakub Kicinski <kuba@kernel.org>, "G Thomas, Rohan" <rohan.g.thomas@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 Sunil Kovvuri Goutham <sgoutham@marvell.com>, "Looi,
 Hong Aun" <hong.aun.looi@intel.com>
Subject: Re: [Linux-stm32] [Enable Designware XGMAC VLAN Stripping Feature
 v2 1/1] net: stmmac: dwxgmac2: Add support for HW-accelerated VLAN
 Stripping
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

> > > Checked the link it is just a photo saying "come in we're open" is
> > > that mean the net-next is currently open now?
> > >
> > >
> > >
> > Yes, it's open now.
> 
> Hi Sunil, thanks for confirming, should I straight away submit another change,
> with the correct subject prefix on "net-next"? Or I should wait for others to
> comments, and fix them all in v3?
>

Please trim replies to what it just relevant.

You probably should read:

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

You might also want to read out to other Intel developers in Jesse
Brandeburg group and ask them to do an internal review before you post
to the list.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
