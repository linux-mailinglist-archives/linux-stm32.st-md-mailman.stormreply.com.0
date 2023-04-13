Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD9D6E13AB
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Apr 2023 19:41:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18CD7C69063;
	Thu, 13 Apr 2023 17:41:34 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0FEDC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Apr 2023 17:41:32 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id si1so9207889ejb.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Apr 2023 10:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681407692; x=1683999692;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eIiirAaDA9eFVxHe7848A9thDVoy/Iisyo0XYKsmV0o=;
 b=HgLQzS6hpyE1ox3/UQZbfYrUg+fXCMocSiDRxSrIGBjrPBzPqXOJUbiMV8NCUVxh/B
 1ymadqD5jQ6I+DzdMmfxZ/1JSADwiCoWjOLc9jTx86dHwt7ABINegcDwoHOxFAzepYUx
 nt+Erld+cUwRDlzVbA1hjCpP/78cRv00dJ9th0mrTJOSsERaGQIejvqWPW+5iWjaCMdv
 Mkbew89xglCbWfDmOcgGVZzCUwVeFEA1mN0JQweGzgjZp0xe7TtWRm5ByRJbFKznJ289
 b13iy7mAKHNwbh8MdouO8Bk7Umt9DbFZF/B3gCjQOwhE5dJkMvpoWU51k4cWmX8Sv0vH
 loHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681407692; x=1683999692;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eIiirAaDA9eFVxHe7848A9thDVoy/Iisyo0XYKsmV0o=;
 b=QbWbGb0AO5IrqD+iIfSBf1hdBcGdJohlwD890ydxxFlD/arQjqGuZRLEJM2hBhnRKR
 4UPKpWec3eOiT+vAiXymIPhh2074Ct2cI7xcuWfO9qnr8qftEHdwKx0B8Iy+C5bBCNnm
 kFgQx1qbLHAdCrQ4qjhz2YAfBQd5BvFqMrbbSPRQ03OZqCIKMJwONTi8IDiSGMan6M41
 oSyRM1+0Vg4IIGHEjoAnkauicK2WRmqaIAjPFUcC+58yMvNeJcDAwmgkeoxMP4t5grxx
 F9liUL+MhCu2J+0S3F7tDA1G/ziH/OdXtLE1CZuLbKe8HfQ1omoVE4CVjaX9gjHeABaz
 JJiQ==
X-Gm-Message-State: AAQBX9eglR1dyImNkOeCmhEFjHI+4Mw8Q3dN1lDYx8VdiVP6zNWFr9v1
 4QZZEGTwLsKtUtl+UXeFmZM=
X-Google-Smtp-Source: AKy350ZE2BCCFRavI9mkoSpNE4Y8ZHG9SeqJOo39sTOdjgfl+1wMePHFAuxOqUolWX+bSNK8+peFVA==
X-Received: by 2002:a17:906:cf9c:b0:932:f88c:c2ff with SMTP id
 um28-20020a170906cf9c00b00932f88cc2ffmr6641850ejb.34.1681407692066; 
 Thu, 13 Apr 2023 10:41:32 -0700 (PDT)
Received: from skbuf ([188.27.184.189]) by smtp.gmail.com with ESMTPSA id
 mf12-20020a170906cb8c00b00947a40ded80sm1253991ejb.104.2023.04.13.10.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 10:41:31 -0700 (PDT)
Date: Thu, 13 Apr 2023 20:41:29 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20230413174129.dafmlq57a3pc2ppn@skbuf>
References: <KL1PR01MB5448C7BF5A7AAC1CBCD5C36AE6989@KL1PR01MB5448.apcprd01.prod.exchangelabs.com>
 <01ef9d4f-d2dc-d584-4733-798cffda49a1@intel.com>
 <298c045a-5438-6761-46d8-c46c57989812@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <298c045a-5438-6761-46d8-c46c57989812@gmail.com>
Cc: open list <linux-kernel@vger.kernel.org>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, edumazet@google.com,
 Jose Abreu <joabreu@synopsys.com>, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 Jacob Keller <jacob.e.keller@intel.com>, Yan Wang <rk.code@outlook.com>,
 pabeni@redhat.com, davem@davemloft.net,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next v4] net: stmmac:fix system hang
 when setting up tag_8021q VLAN for DSA ports
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

On Thu, Apr 13, 2023 at 10:15:55AM -0700, Florian Fainelli wrote:
> On 4/13/23 10:07, Jacob Keller wrote:
> > On 4/13/2023 8:06 AM, Yan Wang wrote:
> > > The system hang because of dsa_tag_8021q_port_setup()->
> > > 				stmmac_vlan_rx_add_vid().
> > > 
> > > I found in stmmac_drv_probe() that cailing pm_runtime_put()
> > > disabled the clock.
> > > 
> > > First, when the kernel is compiled with CONFIG_PM=y,The stmmac's
> > > resume/suspend is active.
> > > 
> > > Secondly,stmmac as DSA master,the dsa_tag_8021q_port_setup() function
> > > will callback stmmac_vlan_rx_add_vid when DSA dirver starts. However,
> > > The system is hanged for the stmmac_vlan_rx_add_vid() accesses its
> > > registers after stmmac's clock is closed.
> > > 
> > > I would suggest adding the pm_runtime_resume_and_get() to the
> > > stmmac_vlan_rx_add_vid().This guarantees that resuming clock output
> > > while in use.
> > > 
> > > Signed-off-by: Yan Wang <rk.code@outlook.com>
> > 
> > This looks identical to the net fix you posted at [1]. I don't think we
> > need both?
> > 
> > [1]:
> > https://lore.kernel.org/netdev/KL1PR01MB5448020DE191340AE64530B0E6989@KL1PR01MB5448.apcprd01.prod.exchangelabs.com/
> 
> Unfortunately both still lack a proper Fixes: tag, and this is bug fix.
> -- 
> Florian
> 

I guess that would be:

Fixes: 5ec55823438e ("net: stmmac: add clocks management for gmac driver")

although in this case, that would be only part of the story. That commit
split the runtime PM handling between stmmac_vlan_rx_add_vid() and
stmmac_vlan_rx_kill_vid() in a strange way, where an added VLAN RX
filter takes a refcount on the device, and a deleted filter one drops
the refcount.

That is... strange?! but it worked in a way, I guess.

Then commit b3dcb3127786 ("net: stmmac: correct clocks enabled in
stmmac_vlan_rx_kill_vid()") came a few months later and blamed that
oddity on a bad merge conflict resolution... ?! Basically, from what I
can tell, it's this later commit the one that broke things, for using
runtime PM only for stmmac_vlan_rx_kill_vid() but not for stmmac_vlan_rx_add_vid().
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
