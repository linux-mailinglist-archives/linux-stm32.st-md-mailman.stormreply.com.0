Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA795223E
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jun 2019 06:44:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BA87CDB429
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jun 2019 04:44:59 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29C58CDB428
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2019 04:44:58 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 43so11097452otf.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2019 21:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Wp4HQypqw0rNbItr1Xs0WBR6fHG0G9gjAl5KxurVdE=;
 b=ICNF3PTZ1ZfG+bAeY8F8Pp7sQzesnEsLfQyVK4xXEW0fE9JbdoeEwICCri9MhuwgDe
 bm/0ejdD98vhkuaDReGiErs7EaKJphiOdNIOX5OTwKFKRbuUyOxVIAk4bHBff8k+v4sW
 T7OmIR81tdf3Fy8cR5DX0+mQ0tZ/Wu4tdvEcn1ySqLThg5Z+Cqiyv07RISHe3YwpWKkU
 mNX0GQfIvmuXGqm24S4OcATnGcJC5dp2nIjKXJ/eVlclscTS4ifWJKJt3gXQIn8V6JDV
 mBBDQVVDx+ijpZkFkPqRJLSkoToQRF0nF2/Dh+zYJ2NvIUQ+MXj1dcWGXJ7WX+IKrAi0
 Ackw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Wp4HQypqw0rNbItr1Xs0WBR6fHG0G9gjAl5KxurVdE=;
 b=NSO+skTpNEFjO/JvK4QUVZeG+vRCY1b+j9PWh6ReD6lJpEAa98rNwy9px8uI5BX0Sb
 vcn4S+Agb2YmZndxAenxNwk/3kdQRN7oLKWILJVXPE+oriMIpspdvaVAkIdWSk+We7yX
 1de1COz3Ad7cTsTkZRJZuoiD0uQmjjDod1xPAEuNGT+PkJxiWt6yu5DK99jG7ZCBhlhI
 YPKcpmrDICW/upyjMT7qqIIMKY0IKS3X7xJadje3ZAkMHQ4uxMJccl+aszMGAMKbmzB4
 5tJslGhcd+DHZT/do6jYSHcbtC2lC4tBBje9IqeLdboa0TVahklQUAP3FyrHOcY/uj8Q
 2pYQ==
X-Gm-Message-State: APjAAAXx13ediFUFl/KZeFE9FXJA2HoZdTG94jxNU7smqblHAp2GGbXE
 OuakG8Bh/LRFgC9xoo+DpKhWd0JbWrqpbwiCU94=
X-Google-Smtp-Source: APXvYqxsOdEMaHKmim8mpE6aFtY/5w9wT+CBAa2iQ2fftmNQo7l1oux8418VMI5kU7usdjz86T8c871EA6XxIf+xwSc=
X-Received: by 2002:a9d:14a:: with SMTP id 68mr70034647otu.96.1561437896776;
 Mon, 24 Jun 2019 21:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190617165836.4673-1-colin.king@canonical.com>
 <20190619051308.23582-1-martin.blumenstingl@googlemail.com>
 <92f9e5a6-d2a2-6bf2-ff8a-2430fe977f93@canonical.com>
 <CAFBinCDmYVPDMcwAAYhMfxxuTsG=xunduN58_8e20zE_Mhmb7Q@mail.gmail.com>
In-Reply-To: <CAFBinCDmYVPDMcwAAYhMfxxuTsG=xunduN58_8e20zE_Mhmb7Q@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 25 Jun 2019 06:44:45 +0200
Message-ID: <CAFBinCC-LLpfXQRFcKBbUpCfKc0S9Xtt60QrhEThsOFV-T7vFw@mail.gmail.com>
To: Colin Ian King <colin.king@canonical.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: add sanity check to
 device_property_read_u32_array call
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

Hi Colin,

On Thu, Jun 20, 2019 at 3:34 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Colin,
>
> On Wed, Jun 19, 2019 at 8:55 AM Colin Ian King <colin.king@canonical.com> wrote:
> >
> > On 19/06/2019 06:13, Martin Blumenstingl wrote:
> > > Hi Colin,
> > >
> > >> Currently the call to device_property_read_u32_array is not error checked
> > >> leading to potential garbage values in the delays array that are then used
> > >> in msleep delays.  Add a sanity check to the property fetching.
> > >>
> > >> Addresses-Coverity: ("Uninitialized scalar variable")
> > >> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > > I have also sent a patch [0] to fix initialize the array.
> > > can you please look at my patch so we can work out which one to use?
> > >
> > > my concern is that the "snps,reset-delays-us" property is optional,
> > > the current dt-bindings documentation states that it's a required
> > > property. in reality it isn't, there are boards (two examples are
> > > mentioned in my patch: [0]) without it.
> > >
> > > so I believe that the resulting behavior has to be:
> > > 1. don't delay if this property is missing (instead of delaying for
> > >    <garbage value> ms)
> > > 2. don't error out if this property is missing
> > >
> > > your patch covers #1, can you please check whether #2 is also covered?
> > > I tested case #2 when submitting my patch and it worked fine (even
> > > though I could not reproduce the garbage values which are being read
> > > on some boards)
in the meantime I have tested your patch.
when I don't set the "snps,reset-delays-us" property then I get the
following error:
  invalid property snps,reset-delays-us

my patch has landed in the meantime: [0]
how should we proceed with your patch?


Martin


[0] https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git/commit/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c?id=84ce4d0f9f55b4f4ca4d4edcbb54a23d9dad1aae
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
