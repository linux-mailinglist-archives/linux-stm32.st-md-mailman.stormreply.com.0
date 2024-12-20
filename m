Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 924DF9F9A70
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Dec 2024 20:28:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E2E8C69063;
	Fri, 20 Dec 2024 19:28:01 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C964CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Dec 2024 19:27:53 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-21634338cfdso30610015ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Dec 2024 11:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20230601.gappssmtp.com; s=20230601; t=1734722871; x=1735327671;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=olddjwhjXo1DqV4GopOeuanmM4eDV0mXoyDwwruYnUU=;
 b=UWtd3fhax9V/icMgnp4gVQIXkyrUMVyVk74pSLW7n/FSLXtIXKf4RFMUHo8ys0XB9s
 jRw5azk5fS3aFBtXsSDYn5GzVS9Oa/E1LaaN1BHfPssXSsQhzILL0sVGEno9docujc/7
 TKZ5gu7H/i4PKjj/7I8dz0whKqsfuZIo5JGMftcyclrP7yoRi3QWD5H3SMjxqKaRBG6O
 Pf61E+8ZBrTqlNQe6pSjEduzjJ2bwtLZmUauXgzmx86PC6pCh5ixvvUgkY4pVGj6w34Y
 BTwLWl8UMWKXtUz2SqDGVMJzA+E/ftM/C9UvjAq9CYSuR/A3xIiqozbhS6H2+afZPBZR
 miPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734722871; x=1735327671;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=olddjwhjXo1DqV4GopOeuanmM4eDV0mXoyDwwruYnUU=;
 b=Hp/jAfy5pirTp7fltaGohvHwCCVNKPGttcGU4Ck9CtOxaIovANOosESG7Fk8Ry/NHn
 kEM191W2Ynfbyt7KppyGNpuYzb0X5fZ1fzV4QK8XpmOeM6Vii84/AnNxR+E3ux+rnosc
 orS0mlhMMPoz8vPkKuj9aRHcUvd5ATDe/nNiU8p32olvQdas8soQp9y4ZVVmaRlRdhMh
 UCTRX40mUZBtMcfO9ofo89/vJp0MlovWGjeoTLppAdkcfwwt1k4aj5nu3C4NheGyeo4v
 Q7jbiOkFNRgVetenpTwauYbO9currqLUcshfaR2KrRIZSecM457NLtllnYsEMn1GH3lR
 NlqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlJpdHiL7SB+1vS2vHdA0oTOR4emLhirAV5yRv1UxbM0v2/iiYIlWK3nhR7haUKHlUX8ijwKxj7OPlXQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxFoTPywGAJw6xBLSZyp4silv6k++piDLu+RvXeWP1IMCg+pxXP
 DXLICfyOl69RU34iucwUR6PmKLY0ckr0wKoOURG/MYfY+7yaoYoQtBpGl1/sWrc=
X-Gm-Gg: ASbGncvSGGOy/8CN3nk/EBbtW+ShU25biMp6s/fUGB4IcRKCrTv6DDn4LPVnLOV/IJn
 NjsEu8X55QTm2imYnhrfgfF/B7Er8j1IvQkc8P9V1Pr3H1ilUYErh1iL3/epXu2e1OkH3ZkURz9
 pI0VcJB1LgZSZXjMcKN/A9I/xjksaguuF7vArm8bGQ+OJCV01WLxaITpy2HVogITa9MEgXipJs4
 XcK7oGePs6P3E/sajt8pDojjQ0B9yvjjWzf3oOvvnoj0kll4QmLHCh4Gq/kRGDmb7AXBavCfcDy
 9/AG/cbII2eNMffgB/51YA==
X-Google-Smtp-Source: AGHT+IE5WE5VjVzI8McvBS1EPUk/D6S0aLKI1p8PJ/8RcVaqoOiUvLB51cQP6j5D7CMD/aylGcndww==
X-Received: by 2002:a17:903:120e:b0:215:6816:6345 with SMTP id
 d9443c01a7336-219e6ea278cmr54424305ad.16.1734722871527; 
 Fri, 20 Dec 2024 11:27:51 -0800 (PST)
Received: from localhost (99-152-116-91.lightspeed.sntcca.sbcglobal.net.
 [99.152.116.91]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc9cde37sm32680745ad.131.2024.12.20.11.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 11:27:50 -0800 (PST)
Date: Fri, 20 Dec 2024 11:27:33 -0800
From: Olof Johansson <olof@lixom.net>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <Z2XFJeMgUdaeAqHS@chonkvm.lixom.net>
References: <20241220125506.3157268-1-patrice.chotard@foss.st.com>
 <c720715b-cde3-4ab4-991d-37e9ae91b16f@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c720715b-cde3-4ab4-991d-37e9ae91b16f@app.fastmail.com>
Cc: Petr Mladek <pmladek@suse.com>, Yoann Congal <yoann.congal@smile.fr>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, soc@kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/4] ARM: config: stm32: Remove useless
	flags
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

On Fri, Dec 20, 2024 at 05:47:01PM +0100, Arnd Bergmann wrote:
> On Fri, Dec 20, 2024, at 13:55, patrice.chotard@foss.st.com wrote:
> > From: Patrice Chotard <patrice.chotard@foss.st.com>
> >
> > Running "make savedefconfig" highlights that some flags are no more used,
> > remove them.
> > Remove some flags to reduce the kernel image size as STM32 MCU's board
> > embeds low amount of RAM.
> >
> > Changes in V2:
> >   _ squash patches 2-7
> >   _ split patch 1 in three parts and add epxlanations about flags removal.
> 
> Looks good to me, thanks for the update. I assume the plan is to
> have this in another pull request rather than me picking up the
> patches directly, right?

On that note, I would *love* to no longer get patches into my inbox,
and I'll start to kindly request the senders of said patches to take
me off the recipients in the future. I'm not actively part of the soc
maintainer group any more, but I'm guessing that the others would benefit
from the same.

STM32 already has a maintainer, so there's no need to send these directly
to the soc-level maintainers, as far as I can tell. And certainly not
in the to: line (vs cc), at that.

If there's reason to send them directly, such as the platform maintainer
being unavailable or the patch being urgent as a fix, a justification
to make sure they're not missed would be useful.


-Olof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
