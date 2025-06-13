Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 345A7AD8C12
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 14:28:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9DBDC36B3C;
	Fri, 13 Jun 2025 12:28:47 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 592B9C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 12:28:46 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-b26df8f44e6so2096958a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 05:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749817725; x=1750422525;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hUheJAvJ/QAI2j1ArBPoXkPiiSX0R8DUeLQ8vjaGCHc=;
 b=WVrCxtUx2nhfb5mpjPpwgArlzezXbWNkf2CWgACih5lT1v0N2R9wiaFS1wOUKjQmq7
 cQwfKzaNx2lDH92qXCJh8CEGtbMG0ipzwkqeQt0+8IX9uJmcgsstWe0iy+SLNpQ6wNMZ
 ulHnyjoscM9QBZoWEG+hlzzQePI58YCraK6akTijo5e2B473LgkyKv5juph6V3CAuwOa
 82JdnIHEwSKHnCvElMOHt2fb12ICKuE8g4hs5oLFseXD9Q2A48OIhE3WxTHK2BcsbGrU
 xx1x8nclvtmZB+AqXrcPRpI55W5O9wkr7xMBZStf+0+k23j7eEFma89rKFcAkO9pYqvL
 L+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749817725; x=1750422525;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hUheJAvJ/QAI2j1ArBPoXkPiiSX0R8DUeLQ8vjaGCHc=;
 b=MIDlzeKt7Xjhh48DbC/oPkeY8ikQTto7fiEVo71wCEcrI+TkM5d1rTIENICP+74SMw
 OKCdfkKJVcGwR0EV+XXoxz613uSVTXQBQ0iwaX7LoeKnGnVTayVNOzPSHFLdskkInsh2
 q4KQxqA9V8aWUD83j9mC8PgUYHgaZtnNcgSBdCckykZZwpnBD1jjOowsY9Dqvds4+FI+
 i0+UXYmcMwXg003jjIJreQQovGb0DJGEClH8aKREAL8zpJA50Ok8YQMFYwXEkXF4QDRk
 SupUJIgY4VzuanvuPg8TJ8SXbEV9alsjQe710YIcyWILLC77vy9wKF4exiL4HASqcqlo
 qSqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMYYMhzKMq34rNiaxu1ICuIBLeA02679oq2K1DmzKFF6R0mC10HkK5SZnI7WMOmFxRNgzwF0+9+9lqsg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwbWRXMnjtr7o7Hw6JQ+eBRE6Iy8LICTWOL+yqw3d6SDmguOd3V
 br03IobMKw8Lq3MKqZFqa0MGBBL2dJX8V6CHq7LnhrmmzIPx5PSCEG+f
X-Gm-Gg: ASbGncuJ5c999MIQqoKAhyRpYNxw5KqcmGBoRpJJQU74F4sFDK4bF0y/x6XAEKawrpZ
 909iOoacomR9RvqP8cw1Z0Ix0aMlNAHypFn6iCfl6K9K37Y9gDP2sBgfBfGD6rPB33PvPgCipET
 ejWl43M56+Ai6WCfo/gdys8iCO/FiK70AwJ0gNNOvmxGYwh9CH0Hl0AwHjpFQ4qYuKxm8dDMTZ6
 wQXsNKS952WytwwdJCX64J+Sgbzk1Mcw7Dvn3VZNStk4Z8pQS58pu9Eerq0y5OFbyi6zcZdxR9C
 1HH2Su/n6mDj32p6JYNn8eUPKlZHirfAZyLfd3kKmKMhQGw30jRbDsLJa9KRWw==
X-Google-Smtp-Source: AGHT+IE+gcmD/PmavjTCsZJ5Ebw+bwtrBwmaH3AIBOuyUnFsBAjlI4hGAFjqzUYV1uUOPvmBym85Fw==
X-Received: by 2002:a05:6a20:9151:b0:1fa:9819:c0a5 with SMTP id
 adf61e73a8af0-21facbb40c3mr4162006637.11.1749817724606; 
 Fri, 13 Jun 2025 05:28:44 -0700 (PDT)
Received: from localhost ([216.228.127.129]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2fe1644c92sm1565073a12.32.2025.06.13.05.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 05:28:44 -0700 (PDT)
Date: Fri, 13 Jun 2025 08:28:40 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Message-ID: <aEwZcM_leVvB0Cju@yury>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
 <20250612-byeword-update-v1-1-f4afb8f6313f@collabora.com>
 <5493fd6017de3f393f632125fad95945d1c4294c@intel.com>
 <3683577.irdbgypaU6@workhorse>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3683577.irdbgypaU6@workhorse>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Tvrtko Ursulin <tursulin@igalia.com>,
 Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-pci@vger.kernel.org,
 Shawn Lin <shawn.lin@rock-chips.com>, llvm@lists.linux.dev,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, Eric Dumazet <edumazet@google.com>,
 Bill Wendling <morbo@google.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 linux-phy@lists.infradead.org, linux-sound@vger.kernel.org,
 kernel@collabora.com, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Jaehoon Chung <jh80.chung@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-rockchip@lists.infradead.org,
 linux-pm@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-clk@vger.kernel.org, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-media@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Mark Brown <broonie@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org, Qin Jian <qinjian@cqplus1.com>,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 linux-mmc@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vinod Koul <vkoul@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Justin Stitt <justinstitt@google.com>, Andy Yan <andy.yan@rock-chips.com>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 01/20] bitfield: introduce HWORD_UPDATE
	bitfield macros
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

On Fri, Jun 13, 2025 at 01:55:54PM +0200, Nicolas Frattaroli wrote:
> Hello,
> 
> On Friday, 13 June 2025 10:51:15 Central European Summer Time Jani Nikula wrote:
> > On Thu, 12 Jun 2025, Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:
> > > Hardware of various vendors, but very notably Rockchip, often uses
> > > 32-bit registers where the upper 16-bit half of the register is a
> > > write-enable mask for the lower half.
> > >
> > > This type of hardware setup allows for more granular concurrent register
> > > write access.
> > >
> > > Over the years, many drivers have hand-rolled their own version of this
> > > macro, usually without any checks, often called something like
> > > HIWORD_UPDATE or FIELD_PREP_HIWORD, commonly with slightly different
> > > semantics between them.
> > >
> > > Clearly there is a demand for such a macro, and thus the demand should
> > > be satisfied in a common header file.
> > >
> > > Add two macros: HWORD_UPDATE, and HWORD_UPDATE_CONST. The latter is a
> > > version that can be used in initializers, like FIELD_PREP_CONST. The
> > > macro names are chosen to not clash with any potential other macros that
> > > drivers may already have implemented themselves, while retaining a
> > > familiar name.
> > >
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > >  include/linux/bitfield.h | 47 +++++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 47 insertions(+)
> > >
> > > diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> > > index 6d9a53db54b66c0833973c880444bd289d9667b1..b90d88db7405f95b78cdd6f3426263086bab5aa6 100644
> > > --- a/include/linux/bitfield.h
> > > +++ b/include/linux/bitfield.h
> > > @@ -8,6 +8,7 @@
> > >  #define _LINUX_BITFIELD_H
> > >  
> > >  #include <linux/build_bug.h>
> > > +#include <linux/limits.h>
> > >  #include <linux/typecheck.h>
> > >  #include <asm/byteorder.h>
> > >  
> > > @@ -142,6 +143,52 @@
> > >  		(((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))	\
> > >  	)
> > >  
> > > +/**
> > > + * HWORD_UPDATE() - prepare a bitfield element with a mask in the upper half
> > > + * @_mask: shifted mask defining the field's length and position
> > > + * @_val:  value to put in the field
> > > + *
> > > + * HWORD_UPDATE() masks and shifts up the value, as well as bitwise ORs the
> > > + * result with the mask shifted up by 16.
> > > + *
> > > + * This is useful for a common design of hardware registers where the upper
> > > + * 16-bit half of a 32-bit register is used as a write-enable mask. In such a
> > > + * register, a bit in the lower half is only updated if the corresponding bit
> > > + * in the upper half is high.
> > > + */
> > > +#define HWORD_UPDATE(_mask, _val)					 \
> > > +	({								 \
> > > +		__BF_FIELD_CHECK(_mask, ((u16) 0U), _val,		 \
> > > +				 "HWORD_UPDATE: ");			 \
> > > +		(((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask)) | \
> > > +		((_mask) << 16);					 \
> > > +	})
> > 
> > i915 uses something like this for a few registers too, with the name
> > _MASKED_FIELD(). I think we could use it.
> > 
> > I do think this is clearly an extension of FIELD_PREP(), though, and
> > should be be named similarly, instead of the completely deviating
> > HWORD_UPDATE().
> > 
> > Also, we recently got GENMASK() versions with sizes, GENMASK_U16()
> > etc. so I find it inconsistent to denote size here with HWORD.
> > 
> > FIELD_PREP_MASKED_U16? MASKED_FIELD_PREP_U16? Something along those
> > lines?
> 
> Yeah, I agree the name could be better. I used HWORD_UPDATE as Yury and
> I couldn't come up with a name we liked either, and Yury suggested not
> breaking from what's already there too much. I do think making the name
> more field-adjacent would be good though, as well as somehow indicating
> that it is 16 bits of data.
 
I suggested a wonderful name that explains everything. Didn't I? It
has the only problem - it's 25 chars long. :)

So yeah, let's think once more about a better _short_ name, or just
stick to the existing naming scheme.

> > And perhaps that (and more potential users) could persuade Jakub that
> > this is not that weird after all?
> 
> I will operate under the assumption that Jakub's opinion will not change
> as he ignored the commit message that talks about multiple vendors,
> ignored the cover letter that talks about multiple vendors, and ignored
> my e-mail where I once again made it clear to him that it's multiple
> vendors, and still claims it's a Rockchip specific convention.

As far as I understood, he concerns not about number of drivers that
opencode HIWORD_UPDATE(), but that this macro is not generic enough
to live in bitfield.h. And it's a valid concern - I doubt it will
be helpful somewhere in core and arch files.

I think that creating a separate header like hw_bitfield.h, or hw_bits.h
aimed to absorb common helpers of that sort, would help to reach the
strategic goal - decreasing the level of code duplication in the driver
swamp.

Thanks,
Yury
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
