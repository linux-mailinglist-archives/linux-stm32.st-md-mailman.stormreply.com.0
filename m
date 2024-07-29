Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE0F93FA20
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 404B9C7A827;
	Mon, 29 Jul 2024 15:58:25 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B732CC5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jul 2024 13:28:55 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-71871d5e087so2476807a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jul 2024 06:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722259734; x=1722864534;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1yL0QCQNpqeOCAknWlO99YLMk+NffPf4WTYM45aZYO8=;
 b=FIJVNWg6KMeIvzBM+RAo19ECASroqci1gmrHcjo5Yk0/lGKs3N5XNwIzUvZ+/7xSKi
 JcLm5djh1/qsqq/QwUqTqmcF12SpyUezqjCf9ZvSZmo5Dle7Yeea0tPaD/5PUXv61uDK
 ek/MkZMf/5jpnyMoLU9dWyw56AXIDNcOJbtbQm7EcaxVbiJ5OKrksPm4BRLp7FY41KPO
 LAG0DrGKAPvG39356zYzuN9aGfz/9UnjVq586DIJzTxNH0uLJiPy8w8UoSZFMOw2xd5S
 cPzedWBoQJv9+rA45i47F0FgXvWfYWpZN6YRq6Omsn7Q3NzXSUM/ivJV9a9mdE8z/t/1
 K4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722259734; x=1722864534;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1yL0QCQNpqeOCAknWlO99YLMk+NffPf4WTYM45aZYO8=;
 b=eLPCrfebGHAIfZfV9CuY7IFlmpPI2nVaVzURr2JjDdm6v8DLkx9yE54yIbpu+kWVT8
 n6wYl1u6AcmZckAirtkn3QmVSkhw1lzRAGyGYTEld/ms6jVT7KEklr3RV+FgvuMAupkP
 66VNW++VGkuWr3O7lV14H/ugxNewLvXzGmdwBUHE8Bxm6Yqhp8HmAYHhOqv63U0NitOe
 5nlx3aJz4x+r/DfThmQypkczd6cjX7qBmLoeRVcRYfx1qJmVU+7Da1Ao3cTZ8iMqSCB2
 3CofBMf2YsoKiyZSPz41zssTGVBiCsnOkJXYOK4rjshSSnQT/mO7hVhb4hDBwAfbxawn
 gizQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxhLmc+zAo1TNOBRw0ELZhzSmb/dnpAYr0evvikBLO3/5HAlpi2XNWAIaOv9Vxwnn77CJqF6+gmyb5ZraT8PVfo61XePsp47fZGIyJHtMD1RWhpqOkI8on
X-Gm-Message-State: AOJu0YydQG4c2YUg6OQnBs45vgxYhDD+1u61IfGmpFDbxWzVmFaecsTm
 DxzinEONTSwO2Rz7EzIUJHT23OAyeRHZR5IwF5kQYTe4+4XD5Yn37r32qx+zkLk=
X-Google-Smtp-Source: AGHT+IESX2PnLeI0EtJGrSeydGADF81jYh2s6zS5/LFhKulfASe7HsgEsqSl8L4xJCRK+QMMjg9fOQ==
X-Received: by 2002:a05:6a21:78a9:b0:1c1:89f8:8609 with SMTP id
 adf61e73a8af0-1c4a0e15171mr10085097637.0.1722259734258; 
 Mon, 29 Jul 2024 06:28:54 -0700 (PDT)
Received: from void.tail05c47.ts.net ([240c:c001:1:4300:752c:bb84:7d45:2db])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7edd91asm82647505ad.131.2024.07.29.06.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 06:28:53 -0700 (PDT)
Date: Mon, 29 Jul 2024 21:28:48 +0800
From: Yanjun Yang <yangyj.ee@gmail.com>
To: Philippe CORNU <philippe.cornu@foss.st.com>
Message-ID: <ZqeZEB9peRSQkOLZ@void.tail05c47.ts.net>
References: <20240129104106.43141-1-raphael.gallais-pou@foss.st.com>
 <21f4d43d-4abd-4aca-7abb-7321bcfa0f1d@foss.st.com>
 <CAE8JAfy9NtBa--DnUt2AEZPFnvjU6idj8DqUbaeLaH0DMFvuhw@mail.gmail.com>
 <e059f157-ff9c-32cb-57a6-48f2331f2555@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e059f157-ff9c-32cb-57a6-48f2331f2555@foss.st.com>
X-Mailman-Approved-At: Mon, 29 Jul 2024 15:58:21 +0000
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND v3 0/3] Update STM DSI PHY driver
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

On Fri, Jul 26, 2024 at 09:55:35AM +0200, Philippe CORNU wrote:
> 
> 
> On 7/22/24 10:38, Yanjun Yang wrote:
> > 
> > This patch (commit id:185f99b614427360) seems to break the dsi of
> > stm32f469 chip.
> > I'm not familiar with the drm and the clock framework, maybe it's
> > because there is no
> >   "ck_dsi_phy" defined for stm32f469.
> > PS:  Sorry for receiving multiple copies of this email, I forgot to
> > use plain text mode last time.
> > 
> 
> Hi,
> Thank you for letting us know that there was this error. We should have
> detected this before merging, really sorry for the problems caused by this
> patch. We will investigate the issue and get back to you as soon as
> possible. In the meantime, I think you can revert this patch in your git
> tree.
> 
> Philippe :-)
> 

Hi,
After some testing, the reason behind my problem is the parent's name of
'clk_dsi_phy' for stm32f4 is 'clk-hse' other than 'ck_hse'.  I don't
know which is the better why to fix it:
1. Change "ck_hse" to "clk-hse" in where "clk_dsi_phy" is defined.
2. Use "pll_in_khz = clk_get_rate(dsi->pllref_clk) / 1000" instead of
   "pll_in_khz = (unsigned int)(parent_rate / 1000)" when get the clock
   rate.

Both method can fix my problem. The first one might break other
platforms. Maybe I should change the clock name of 'clk-hse'. However,
I can't find the defination of this clock name for stm32f4.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
