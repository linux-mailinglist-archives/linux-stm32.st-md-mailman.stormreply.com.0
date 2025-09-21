Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 634EFB8E658
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Sep 2025 23:37:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7317C3087A;
	Sun, 21 Sep 2025 21:37:16 +0000 (UTC)
Received: from fra-out-005.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 (fra-out-005.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 [63.176.194.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DCC1C32EB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Sep 2025 21:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
 t=1758490635; x=1790026635;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w/nAd4kDSjaQjN1Dv16qY5ce7rfWNGwV0jiO1W97n90=;
 b=jzlsULJ2p5fKgIQ0eGiIPu9Sag3yI25oc5CcSAHn/13NbDHFinsf6Jzf
 bo4rEPXT9bVIktD4veBOTwKZkri4IpDOCBJdCXzVqcHiDPxCbOhc+e/5j
 bKMiJ+dDmQcWHQPoHPqM+EHrMfoE4P1JuQOQ1tWqhNvUcFwDyeNSX5mNa
 LZlG+ASVSjilsq4o5vJE9fiGhkbdvBisdWvvzVhyOYMOcphd+1mIBS1AI
 Wyd+uPV2qwlFML4CaCzI0DKl1cnbbC7gEKbVo8JmpFnXH367no6ZUgU74
 S/eTtbRxI8tiLdmFp/oeCBFk9pOc/BegW92QgsuHxcGzCOVPLS7bTorqF w==;
X-CSE-ConnectionGUID: IkzWuETbT12a0z9pqWbBLQ==
X-CSE-MsgGUID: PRMHOoNlThOyMzCGXOQDbw==
X-IronPort-AV: E=Sophos;i="6.18,283,1751241600"; 
   d="scan'208";a="2450586"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO
 smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
 by internal-fra-out-005.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 21:37:06 +0000
Received: from EX19MTAEUA002.ant.amazon.com [54.240.197.232:22107]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.21.26:2525]
 with esmtp (Farcaster)
 id e11f0e39-22b8-46a0-839c-05efcff8dbe9; Sun, 21 Sep 2025 21:37:06 +0000 (UTC)
X-Farcaster-Flow-ID: e11f0e39-22b8-46a0-839c-05efcff8dbe9
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Sun, 21 Sep 2025 21:37:03 +0000
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19D018EUA004.ant.amazon.com (10.252.50.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Sun, 21 Sep 2025 21:37:02 +0000
Received: from EX19D018EUA004.ant.amazon.com ([fe80::e53:84f8:3456:a97d]) by
 EX19D018EUA004.ant.amazon.com ([fe80::e53:84f8:3456:a97d%3]) with mapi id
 15.02.2562.020; Sun, 21 Sep 2025 21:37:02 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Greg KH <gregkh@linuxfoundation.org>
Thread-Topic: [PATCH 00/27 5.10.y] Backport minmax.h updates from v6.17-rc6
Thread-Index: AQHcKz/dRIfBoG9yrEaIjS9Ywn6sYg==
Date: Sun, 21 Sep 2025 21:37:02 +0000
Message-ID: <4f497306c58240a88c0bb001786c3ad2@amazon.com>
References: <20250919101727.16152-1-farbere@amazon.com>
 <2025092136-unelected-skirt-d91d@gregkh>
In-Reply-To: <2025092136-unelected-skirt-d91d@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.85.143.176]
MIME-Version: 1.0
Cc: "snitzer@redhat.com" <snitzer@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "malattia@linux.it" <malattia@linux.it>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "sashal@kernel.org" <sashal@kernel.org>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "kadlec@netfilter.org" <kadlec@netfilter.org>,
 "linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "pmladek@suse.com" <pmladek@suse.com>, "jdelvare@suse.com" <jdelvare@suse.com>,
 "intel-linux-scu@intel.com" <intel-linux-scu@intel.com>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "luto@kernel.org" <luto@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "sean@poorly.run" <sean@poorly.run>,
 "qiuxu.zhuo@intel.com" <qiuxu.zhuo@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netfilter-devel@vger.kernel.org" <netfilter-devel@vger.kernel.org>,
 "jack@suse.com" <jack@suse.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "Jason@zx2c4.com" <Jason@zx2c4.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>, "Chocron,
 Jonathan" <jonnyc@amazon.com>,
 "mihail.atanassov@arm.com" <mihail.atanassov@arm.com>,
 "agk@redhat.com" <agk@redhat.com>,
 "ruanjinjie@huawei.com" <ruanjinjie@huawei.com>,
 "coreteam@netfilter.org" <coreteam@netfilter.org>,
 "james.qian.wang@arm.com" <james.qian.wang@arm.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "evan.quan@amd.com" <evan.quan@amd.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "tony.luck@intel.com" <tony.luck@intel.com>, "tytso@mit.edu" <tytso@mit.edu>,
 "fw@strlen.de" <fw@strlen.de>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "jmaloy@redhat.com" <jmaloy@redhat.com>,
 "minchan@kernel.org" <minchan@kernel.org>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "brian.starkey@arm.com" <brian.starkey@arm.com>,
 "herve.codina@bootlin.com" <herve.codina@bootlin.com>,
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "clm@fb.com" <clm@fb.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "willy@infradead.org" <willy@infradead.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "kuznet@ms2.inr.ac.ru" <kuznet@ms2.inr.ac.ru>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "pablo@netfilter.org" <pablo@netfilter.org>,
 "rric@kernel.org" <rric@kernel.org>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, "bp@alien8.de" <bp@alien8.de>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "fery@cypress.com" <fery@cypress.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
 "David.Laight@aculab.com" <David.Laight@aculab.com>,
 "ngupta@vflare.org" <ngupta@vflare.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "ying.xue@windriver.com" <ying.xue@windriver.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "liviu.dudau@arm.com" <liviu.dudau@arm.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "artur.paszkiewicz@intel.com" <artur.paszkiewicz@intel.com>,
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "anton.ivanov@cambridgegreys.com" <anton.ivanov@cambridgegreys.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "richard@nod.at" <richard@nod.at>, "x86@kernel.org" <x86@kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "mingo@redhat.com" <mingo@redhat.com>, "kuba@kernel.org" <kuba@kernel.org>,
 "jdike@addtoit.com" <jdike@addtoit.com>,
 "dushistov@mail.ru" <dushistov@mail.ru>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "josef@toxicpanda.com" <josef@toxicpanda.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "dsterba@suse.com" <dsterba@suse.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 "yoshfuji@linux-ipv6.org" <yoshfuji@linux-ipv6.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "sergey.senozhatsky@gmail.com" <sergey.senozhatsky@gmail.com>,
 "robdclark@gmail.com" <robdclark@gmail.com>,
 "tipc-discussion@lists.sourceforge.net"
 <tipc-discussion@lists.sourceforge.net>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "rajur@chelsio.com" <rajur@chelsio.com>,
 "luc.vanoostenryck@gmail.com" <luc.vanoostenryck@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 00/27 5.10.y] Backport minmax.h updates
	from v6.17-rc6
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

> On Fri, Sep 19, 2025 at 10:17:00AM +0000, Eliav Farber wrote:
> > This series includes a total of 27 patches, to align minmax.h of
> > v5.15.y with v6.17-rc6.
> >
> > The set consists of 24 commits that directly update minmax.h:
> > 1) 92d23c6e9415 ("overflow, tracing: Define the is_signed_type() macro
> >    once")
>
> But this isn't in 5.15.y, so how is this syncing things up?
>
> I'm all for this, but I got confused here, at the first commit :)

It's a typo.
It should be 5.10.y and not 5.15.y.

> Some of these are also only in newer kernels, which, as you know, is
> generally a bad thing (i.e. I can't take patches only for older
> kernels.)
>
> I want these changes, as they are great, but can you perhaps provide
> patch series for newer kernels first so that I can then take these?

So you'd first like first to align 6.16 with 6.17, then 6.15 with 6.16,
then 6.12 with 6.15, then 6.6 with 6.12, and so on until we eventually
align 5.10 and even 5.4?

---
Regards, Eliav
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
