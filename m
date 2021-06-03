Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F27A39A274
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jun 2021 15:47:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C201C57B69;
	Thu,  3 Jun 2021 13:47:57 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D913C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jun 2021 13:47:55 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id i13so7184033edb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 03 Jun 2021 06:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QlhaCMUqZtCg3qakQldsporL1nDLMTcjY1NaDx201K8=;
 b=Vh0oF+HindfSV0XGe82AFy+QuEUOKjyVL8LmuvHXkOndpkGG7jgtSkNwhRT5Sj+uuL
 z3ETKB8rQHlI1ECmP6Ec5BcJzcKGp6SCJgx9JfBxu3flGhC/yB6evq2pzE3kWAWdDp2y
 1KOX8S8Tbo6hZVl0Cb4o3VQ4KY6mLjWDMGbiHnZnKa4mkaCyyPVeEKVUliA8u8IDJu6g
 FYqx36yQu0MMI1pjHWufYQc7n8xxt53MsTo7HCMjB4YlQvk/cEUHD0592Yng6zmUDG9M
 MTaCI3xP8OytO7s4X9xQQPAOGc2xfmFH/LGeHM+PlND0rCB3UoxoHjxF6x4Hw5yt2HAr
 Bbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QlhaCMUqZtCg3qakQldsporL1nDLMTcjY1NaDx201K8=;
 b=N8VEx4+gxAKImr529g9BhnwFflUmSJPbO558GnuPZ9QZQMxZkk3hQl+Wdn8xqWYEn1
 gdrOIqUmXB/e01ooYpDMaasJfIDmX1klnffhxkNkYgGQV5dIZOkyIJOaChHipTarq0ck
 WzJVbuOI6jhvZAkQ4DiWZuWn/a7KteBIJuDajE3j63bIeSva9ApCRNe7OXNpTcqUG5rq
 IFDYC+BUc9b9vGOXTFVdCXvvDZf4zmHIQxjgAD0hPQlyCBd8YkU0CpPhVd6GUE6R5hMK
 XwC/pyMj5Dp9kW1VZUEESaFsyxtOLF8A8vBMAutYFw8HTv2OB9H7NmPcXoFg6OoHX4gl
 YCdw==
X-Gm-Message-State: AOAM531E62+xfQpaMk0LufB1cjInDignERYLkfaQXDWqAzM0pxli4RHL
 oMc3hAPHHh2Op55T5kA/HRQ=
X-Google-Smtp-Source: ABdhPJzi7ErweKz24Kf330r66hHGcoUHaSoZBM3vcqvXgmfhYEoPaPrbAizYpEnVRy4LaNZ5bYF3mw==
X-Received: by 2002:a50:fd0d:: with SMTP id i13mr44463701eds.163.1622728075107; 
 Thu, 03 Jun 2021 06:47:55 -0700 (PDT)
Received: from skbuf ([188.26.52.84])
 by smtp.gmail.com with ESMTPSA id cw10sm1103773ejb.62.2021.06.03.06.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 06:47:54 -0700 (PDT)
Date: Thu, 3 Jun 2021 16:47:52 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
Message-ID: <20210603134752.6kjkhzbxmhz3nfyu@skbuf>
References: <20210603115032.2470-1-michael.wei.hong.sit@intel.com>
 <20210603130851.GS30436@shell.armlinux.org.uk>
 <20210603132809.2z3jhpuxaryaql6v@skbuf>
 <SA2PR11MB505112FA44105D2F3DDB113E9D3C9@SA2PR11MB5051.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SA2PR11MB505112FA44105D2F3DDB113E9D3C9@SA2PR11MB5051.namprd11.prod.outlook.com>
Cc: "Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>,
 "andrew@lunn.ch" <andrew@lunn.ch>,
 "vee.khee.wong@linux.intel.com" <vee.khee.wong@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Voon,
 Weifeng" <weifeng.voon@intel.com>, "Wong, Vee Khee" <vee.khee.wong@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Tan,
 Tee Min" <tee.min.tan@intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>, "Ong,
 Boon Leong" <boon.leong.ong@intel.com>, "kuba@kernel.org" <kuba@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [RESEND PATCH net-next v4 0/3] Enable 2.5Gbps
	speed for stmmac
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

On Thu, Jun 03, 2021 at 01:43:09PM +0000, Sit, Michael Wei Hong wrote:
> Vladimir,
> 
> > -----Original Message-----
> > From: Vladimir Oltean <olteanv@gmail.com>
> > Sent: Thursday, June 3, 2021 9:28 PM
> > To: Russell King (Oracle) <linux@armlinux.org.uk>
> > Cc: Sit, Michael Wei Hong <michael.wei.hong.sit@intel.com>;
> > Jose.Abreu@synopsys.com; andrew@lunn.ch;
> > hkallweit1@gmail.com; kuba@kernel.org;
> > netdev@vger.kernel.org; peppe.cavallaro@st.com;
> > alexandre.torgue@foss.st.com; davem@davemloft.net;
> > mcoquelin.stm32@gmail.com; Voon, Weifeng
> > <weifeng.voon@intel.com>; Ong, Boon Leong
> > <boon.leong.ong@intel.com>; Tan, Tee Min
> > <tee.min.tan@intel.com>; vee.khee.wong@linux.intel.com;
> > Wong, Vee Khee <vee.khee.wong@intel.com>; linux-stm32@st-
> > md-mailman.stormreply.com; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> > Subject: Re: [RESEND PATCH net-next v4 0/3] Enable 2.5Gbps
> > speed for stmmac
> > 
> > Michael,
> > 
> > On Thu, Jun 03, 2021 at 02:08:51PM +0100, Russell King (Oracle)
> > wrote:
> > > Hi,
> > >
> > > On Thu, Jun 03, 2021 at 07:50:29PM +0800, Michael Sit Wei Hong
> > wrote:
> > > > Intel mGbE supports 2.5Gbps link speed by overclocking the
> > clock
> > > > rate by 2.5 times to support 2.5Gbps link speed. In this mode,
> > the
> > > > serdes/PHY operates at a serial baud rate of 3.125 Gbps and
> > the PCS
> > > > data path and GMII interface of the MAC operate at 312.5
> > MHz instead of 125 MHz.
> > > > This is configured in the BIOS during boot up. The kernel
> > driver is
> > > > not able access to modify the clock rate for 1Gbps/2.5G mode
> > on the
> > > > fly. The way to determine the current 1G/2.5G mode is by
> > reading a
> > > > dedicated adhoc register through mdio bus.
> > >
> > > How does this interact with Vladimir's "Convert xpcs to
> > phylink_pcs_ops"
> > > series? Is there an inter-dependency between these, or a
> > preferred
> > > order that they should be applied?
> > >
> > > Thanks.
> > 
> > My preferred order would be for my series to go in first, if
> > possible, because I don't have hardware readily available to test,
> > and VK already has tested my patches a few times until they
> > reached a stable state.
> > 
> > I went through your patches and I think rebasing on top of my
> > phylink_pcs_ops conversion should be easy.
> > 
> > Thanks.
> Sure! I am okay to let you merge your codes and rebase my changes later on
> Do let me know when I can start rebasing and send in the next revision

Well, you are already copied to my patches, so you should get the
notification email at the same time as I would.
https://patchwork.kernel.org/project/netdevbpf/cover/20210602162019.2201925-1-olteanv@gmail.com/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
