Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC088D2607
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2024 22:38:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C695AC6B47E;
	Tue, 28 May 2024 20:38:48 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06F40C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 20:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716928720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BRpdUwI14UmmdacQK91qakAY0dMDTYZAAunQ0UfHrdw=;
 b=O+psRxxKnijnreA8kr2u9uAFzTELanHKfkSvVzGwuncT1Sw0EPWhOh8btZSSsd+cvpOeOW
 X0rYWu2y4EWVK1ONdz2LyndENqNWLmY62ONBPSREWq68V8tXNqRkRoMKy8D+7NTnaOistr
 kFQstXrTT+31W6MfdmML6kBK4VKsdtQ=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-baMqHlTEMRK8bhrK8adz_w-1; Tue, 28 May 2024 16:38:37 -0400
X-MC-Unique: baMqHlTEMRK8bhrK8adz_w-1
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-6f8eeaeb4b2so1528588a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 13:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716928716; x=1717533516;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BRpdUwI14UmmdacQK91qakAY0dMDTYZAAunQ0UfHrdw=;
 b=jdp+lYKpLZ26gto9QIOV0DDHmnwZ9tpxoWVGDKgdweB5RiSjX4Xl8LaM74b2jFd5z4
 74mVsGdtrcBHZp03WwAfa74JhIUJQc1z0EolsA+/3yG1S+hu2FJoWFJM9V51fQ3DZeJr
 0Mhm2YsN+4ig6p1ShQM1yYcJoGB4nDiR6VBwmN2fg/Dp4ukNJd/E57BAGxK3GcARYizp
 au3E/lelyZd3E7xOmyhYLd+L6V8sdqV48mSMP/aN6MDLJ0JpG+XTQqEqhJp/OCJTouMD
 iqosnoijjSy5p+RrTxFQlzmBUHaqfF3TV1coQSU9c5gM1jFdplQRAG4+7aTzad7w+0QE
 hbOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmoB/zeKHw/AWs1OTfP5jlWPyBs1TdS4khTATReLT6iz46hb5NWR7zP1ml2d404jWoNmxw37/OBcIG37NJV6BLPswEj25VKhGm+xNqB78/z5/RQLWyMqDz
X-Gm-Message-State: AOJu0YzoICcBKIHsVx+pPkOslmeb7H/Au+h6c9ne8COgzbMCGSPGoW1g
 E1cvCZAXsvKw/TdWMoh+JUwPXllYZM3AtPUwKT4qyKxGCBBNCAfVq3lIimsV2C6AeVSeGpQIff5
 VyzHtTet7WN3oOFd6tRabj2SIv/YKuTt73drhgf70CgcO5FgZuuvCYfXtqPsGel4NgNYAvENwHg
 rYAQ==
X-Received: by 2002:a05:6808:2394:b0:3c9:b61d:cda3 with SMTP id
 5614622812f47-3d1a538ea6amr15900090b6e.11.1716928715892; 
 Tue, 28 May 2024 13:38:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4PTdgzrcNLVwwDKxpgg+x0hKSTH22FDtXIL9zq/DZ6Whmcg5TtRy4tYteh6CDwKTiBC06/w==
X-Received: by 2002:a05:6808:2394:b0:3c9:b61d:cda3 with SMTP id
 5614622812f47-3d1a538ea6amr15900065b6e.11.1716928715324; 
 Tue, 28 May 2024 13:38:35 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ad976e5b2esm7083876d6.105.2024.05.28.13.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 13:38:34 -0700 (PDT)
Date: Tue, 28 May 2024 15:38:32 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <7albilhaebncfbd4olt2czod75buywv3d6bepm7sjrxaetxrve@45pmtkjtip2r>
References: <ZlXEgl7tgdWMNvoB@shell.armlinux.org.uk>
 <E1sBvJl-00EHyQ-QG@rmk-PC.armlinux.org.uk>
 <66lbyxnuhqhng2j2bmnw4ke6bqeknpeb476b2wjhr3xdstr5jw@vlgbxf3ni7nt>
 <ZlXaGye/39hk4iuw@shell.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <ZlXaGye/39hk4iuw@shell.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/5] net: stmmac: Drop TBI/RTBI
	PCS flags
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

On Tue, May 28, 2024 at 02:20:27PM GMT, Russell King (Oracle) wrote:
> On Tue, May 28, 2024 at 03:26:10PM +0300, Serge Semin wrote:
> > On Tue, May 28, 2024 at 12:48:37PM +0100, Russell King wrote:
> > > From: Serge Semin <fancer.lancer@gmail.com>
> > > 
> > > First of all the flags are never set by any of the driver parts. If nobody
> > > have them set then the respective statements will always have the same
> > > result. Thus the statements can be simplified or even dropped with no risk
> > > to break things.
> > > 
> > > Secondly shall any of the TBI or RTBI flag is set the MDIO-bus
> > > registration will be bypassed. Why? It really seems weird. It's perfectly
> > > fine to have a TBI/RTBI-capable PHY configured over the MDIO bus
> > > interface.
> > > 
> > > Based on the notes above the TBI/RTBI PCS flags can be freely dropped thus
> > > simplifying the driver code.
> > 
> > Likely by mistake the vast majority of the original patch content has
> > been missing here:
> > https://lore.kernel.org/netdev/20240524210304.9164-3-fancer.lancer@gmail.com/
> 
> I really can't explain this, other than git doing something weird. There
> is no reason that just one hunk that conflicted from a patch would've
> appeared. Should've been as per the below, which it will be when I post
> v2. Thanks for spotting!
> 
> 8<===
> From: Serge Semin <fancer.lancer@gmail.com>
> Subject: [PATCH net-next] net: stmmac: Drop TBI/RTBI PCS flags
> 
> First of all the flags are never set by any of the driver parts. If nobody
> have them set then the respective statements will always have the same
> result. Thus the statements can be simplified or even dropped with no risk
> to break things.
> 
> Secondly shall any of the TBI or RTBI flag is set the MDIO-bus
> registration will be bypassed. Why? It really seems weird. It's perfectly
> fine to have a TBI/RTBI-capable PHY configured over the MDIO bus
> interface.
> 
> Based on the notes above the TBI/RTBI PCS flags can be freely dropped thus
> simplifying the driver code.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
