Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0359E369
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2019 10:58:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBC0FC24028;
	Tue, 27 Aug 2019 08:58:31 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E2C6C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2019 14:03:47 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id d16so2276428wme.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2019 07:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rNyl/GAwTmLTUNQynVbw/8SOsQqQ1R7n+k4XVH7pAfA=;
 b=MidKkLyv9HQjM9YsTFAD+JjCp0plA1IFovR06fjrPRys0G/br9M706YWoy8q4p5/+u
 KHMnu8KUpMSUR+rUPfBWFC1tcN4nmqkp824MEEu4bKTGz4TqaBozd1S1lfhlZGvURoXQ
 2iSG6SwE2o3O0d4g5BsHAAjQIRjUJD9p6MyAJMgX4QH9ynSqrn8UBIZ3TCXVJ2LbK9db
 EpUvt2+anuLDXYizRUoFQcdngZ/yDsVOEtN0fM8qnMdbPA9bQjtPBqJzQo2aiU9/HbN6
 SDkBqgZc0sCcrnr7GIF4NjYAPRRmkBwwUFWHE2aa0RrPCig66hntOKeL8+fD4F27he+P
 q2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rNyl/GAwTmLTUNQynVbw/8SOsQqQ1R7n+k4XVH7pAfA=;
 b=N8pK82DCvv/49tR0xrFugwLWrYq06O1aFkGHoZUk18o3rV/j+MvQLUqDlBrssSe2VW
 U1bXMOl2RjeNNh13aH0IhlAb1ZKqKikd7EFjskFBmarPTeY2QOKGWhWkGxPyzfF+lY4L
 zI6iJKH4OrV4FvmS/6Bv7qJot54pBhFEQBv8HZqwwMKhKIGQsH1tW3ig80VAkaQee9cL
 Nnk3Usjyo5Fis/XfRcqzGmV6SkM0Dwm5Enp7JOXME/M1uPU7AxXUgpnfwQt+0Gj6lm+T
 FtQTDGEcSK7sixPdPe/4xPTyLCU9lZX9zxll3saji4qLJqe1OSRBYL/Ba9CvrZOD9mWt
 qYow==
X-Gm-Message-State: APjAAAVh5sGVmaKndBq36bjn/pUXLY1no+TDQ608P0IAvVPggJ7lGxjd
 zKf3xshG8NNJVAA16rBNemxAiQ==
X-Google-Smtp-Source: APXvYqystIzk+HhGz6Qa4p93wRRKjwZmEcSqSZ+P4isDGvGod84XS7SVOqOw9UvX3/TfshAObReWaw==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr173265wmk.79.1566396225923;
 Wed, 21 Aug 2019 07:03:45 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
 by smtp.gmail.com with ESMTPSA id g7sm170768wme.17.2019.08.21.07.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 07:03:45 -0700 (PDT)
Date: Wed, 21 Aug 2019 15:03:41 +0100
From: Matthias Maennich <maennich@google.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20190821140341.GA126314@google.com>
References: <20190813121733.52480-1-maennich@google.com>
 <20190821114955.12788-1-maennich@google.com>
 <20190821131140.GC2349@hirez.programming.kicks-ass.net>
 <20190821133846.GC4890@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190821133846.GC4890@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 27 Aug 2019 08:58:26 +0000
Cc: kstewart@linuxfoundation.org, oneukum@suse.com,
 linux-aspeed@lists.ozlabs.org, Peter Zijlstra <peterz@infradead.org>,
 Toru Komatsu <k0ma@utam0k.jp>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 David Howells <dhowells@redhat.com>, yamada.masahiro@socionext.com,
 Will Deacon <will@kernel.org>, patches@opensource.cirrus.com,
 Michael Ellerman <mpe@ellerman.id.au>, hpa@zytor.com, joel@joelfernandes.org,
 bcm-kernel-feedback-list@broadcom.com, sam@ravnborg.org, cocci@systeme.lip6.fr,
 linux-arch@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Benjamin Fair <benjaminfair@google.com>, linux-scsi@vger.kernel.org,
 Nancy Yuen <yuenn@google.com>, Fabio Estevam <festevam@gmail.com>,
 openbmc@lists.ozlabs.org, x86@kernel.org, lucas.de.marchi@gmail.com,
 usb-storage@lists.one-eyed-alien.net, mingo@redhat.com, geert@linux-m68k.org,
 NXP Linux Team <linux-imx@nxp.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Patrick Venture <venture@google.com>, stern@rowland.harvard.edu,
 kernel-team@android.com, Ingo Molnar <mingo@kernel.org>,
 linux-rtc@vger.kernel.org, Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>,
 sspatil@google.com, linux-watchdog@vger.kernel.org, arnd@arndb.de,
 linux-kbuild@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, pombredanne@nexb.com,
 Dan Williams <dan.j.williams@intel.com>, Julia Lawall <julia.lawall@lip6.fr>,
 linux-m68k@lists.linux-m68k.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, tglx@linutronix.de, maco@android.com,
 linux-arm-kernel@lists.infradead.org, Adrian Reber <adrian@lisas.de>,
 linux-hwmon@vger.kernel.org, michal.lkml@markovi.net,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alexey Gladkov <gladkov.alexey@gmail.com>, linux-usb@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Nicolas Pitre <nico@fluxnic.net>, Patrick Bellasi <patrick.bellasi@arm.com>,
 Richard Guy Briggs <rgb@redhat.com>, maco@google.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, jeyu@kernel.org,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 00/11] Symbol Namespaces
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, 21 Aug, 06:38, Greg Kroah-Hartman wrote:
>On Wed, Aug 21, 2019 at 03:11:40PM +0200, Peter Zijlstra wrote:
>> On Wed, Aug 21, 2019 at 12:49:15PM +0100, Matthias Maennich wrote:
>> > As of Linux 5.3-rc5, there are 31205 [1] exported symbols in the kernel.
>> > That is a growth of roughly 1000 symbols since 4.17 (30206 [2]).  There
>> > seems to be some consensus amongst kernel devs that the export surface
>> > is too large, and hard to reason about.
>> >
>> > Generally, these symbols fall in one of these categories:
>> > 1) Symbols actually meant for drivers
>> > 2) Symbols that are only exported because functionality is split over
>> >    multiple modules, yet they really shouldn't be used by modules outside
>> >    of their own subsystem
>> > 3) Symbols really only meant for in-tree use
>> >
>> > When module developers try to upstream their code, it regularly turns
>> > out that they are using exported symbols that they really shouldn't be
>> > using. This problem is even bigger for drivers that are currently
>> > out-of-tree, which may be using many symbols that they shouldn't be
>> > using, and that break when those symbols are removed or modified.
>> >
>> > This patch allows subsystem maintainers to partition their exported
>> > symbols into separate namespaces, and module authors to import such
>> > namespaces only when needed.
>> >
>> > This allows subsystem maintainers to more easily limit availability of
>> > these namespaced symbols to other parts of the kernel. It can also be
>> > used to partition the set of exported symbols for documentation
>> > purposes; for example, a set of symbols that is really only used for
>> > debugging could be in a "SUBSYSTEM_DEBUG" namespace.
>>
>> I'm missing how one can prohibit these random out of tree modules from
>> doing MODULE_IMPORT_NS().
>
>Nothing, but then they are explicitly being "bad" :)
>

As a side effect of this implementation (namespace imports via modinfo
tags), imports are very visible for (out-of-tree) modules, e.g.

$ modinfo drivers/usb/storage/ums-usbat.ko
  filename:       drivers/usb/storage/ums-usbat.ko
  import_ns:      USB_STORAGE
  license:        GPL
  author:         ...
  ...

>> That is; suppose I stick all the preempt_notifier symbols in a KVM
>> namespace, how do I enforce no out-of-tree modules ever do
>> MODULE_IMPORT_NS(KVM) and gain access?
>>

That is actually a feature worth following up: Restricting the
namespaces that can be imported by modules. I am afraid it is not part
of this series, but should not be too hard once agreed how such a list
will be defined.

>> (the above would basically break virtualbox, which I knows uses preempt
>> notifiers too, but I don't give a rats arse about that)
>
>It's a huge red flag for anyone reviewing the code that this module is
>doing something it probably really should not be doing at all.  It will
>make reviewing code easier, this isn't there to try to "prevent bad
>actors" at all, sorry.
>

Cheers,
Matthias
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
