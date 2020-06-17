Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 026541FCDD4
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jun 2020 14:55:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF843C36B0D;
	Wed, 17 Jun 2020 12:55:58 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95B61C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jun 2020 12:55:56 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id q19so2197113eja.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jun 2020 05:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fOVgSeVqTVqWvUfLoOdj4nt+48hh42lucWZp1VWswtg=;
 b=Yeqd6zzMDdZVbFWpIsP+PxjtpDYV1I626fi/kZ1f2nL2TMDo6+KBzhMr8ws0zzlAzR
 voeZwmzW2vLzzxDRw5r8vB/tikAiVP1fBhfvJ2apCGj1hOtN45HOAKRPk+fZbD0UYhhY
 +5fqJUEqNEt3AiI1isQAQ2XTuLZM5HWGg4Fs0afxsPrrLurVg+2NWFefV5aS3wMw9xOz
 Hy/Fjk783S0suL0cjsze48xnklN7IVOMQOJL9rTQVgSyYAsqHspuOZZ5p1uZ3xWmC9ZO
 iu932ISd7EWylFtGcWC/l4fvgLn6Bit8ezMzSajWsSZfYX5QCF5T/dj8TbCCpolrEn7T
 zD7Q==
X-Gm-Message-State: AOAM532qjfSACE4SNmAyNqrenN0VuqFRMiJ7YQHU/GlNWlNjPXqk2pTV
 FWIQ5bXWa4IIin4zrjgHK+0=
X-Google-Smtp-Source: ABdhPJz5smjYQcDGdXsq8Ug+fgHwHPeIMnfqM9kX0E57nHrzErZZpyVOrifVPC/iAZURBZCGoIl/9Q==
X-Received: by 2002:a17:906:aad8:: with SMTP id
 kt24mr7265073ejb.527.1592398555771; 
 Wed, 17 Jun 2020 05:55:55 -0700 (PDT)
Received: from localhost (ip-37-188-158-19.eurotel.cz. [37.188.158.19])
 by smtp.gmail.com with ESMTPSA id mh14sm13501385ejb.116.2020.06.17.05.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 05:55:54 -0700 (PDT)
Date: Wed, 17 Jun 2020 14:55:53 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200617125553.GO9499@dhcp22.suse.cz>
References: <20200616015718.7812-1-longman@redhat.com>
 <fe3b9a437be4aeab3bac68f04193cb6daaa5bee4.camel@perches.com>
 <20200616230130.GJ27795@twin.jikos.cz>
 <20200617003711.GD8681@bombadil.infradead.org>
 <20200617071212.GJ9499@dhcp22.suse.cz>
 <20200617110820.GG8681@bombadil.infradead.org>
 <20200617113157.GM9499@dhcp22.suse.cz>
 <20200617122321.GJ8681@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200617122321.GJ8681@bombadil.infradead.org>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, linux-btrfs@vger.kernel.org,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, dsterba@suse.cz,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 linux-sctp@vger.kernel.org, keyrings@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org,
 James Morris <jmorris@namei.org>, kasan-dev@googlegroups.com,
 linux-wpan@vger.kernel.org, David Rientjes <rientjes@google.com>,
 Waiman Long <longman@redhat.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, linux-pm@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-integrity@vger.kernel.org,
 linux-nfs@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 0/3] mm,
	treewide: Rename kzfree() to kfree_sensitive()
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

On Wed 17-06-20 05:23:21, Matthew Wilcox wrote:
> On Wed, Jun 17, 2020 at 01:31:57PM +0200, Michal Hocko wrote:
> > On Wed 17-06-20 04:08:20, Matthew Wilcox wrote:
> > > If you call vfree() under
> > > a spinlock, you're in trouble.  in_atomic() only knows if we hold a
> > > spinlock for CONFIG_PREEMPT, so it's not safe to check for in_atomic()
> > > in __vfree().  So we need the warning in order that preempt people can
> > > tell those without that there is a bug here.
> > 
> > ... Unless I am missing something in_interrupt depends on preempt_count() as
> > well so neither of the two is reliable without PREEMPT_COUNT configured.
> 
> preempt_count() always tracks whether we're in interrupt context,
> regardless of CONFIG_PREEMPT.  The difference is that CONFIG_PREEMPT
> will track spinlock acquisitions as well.

Right you are! Thanks for the clarification. I find the situation
around preempt_count quite confusing TBH. Looking at existing users
of in_atomic() (e.g. a random one zd_usb_iowrite16v_async which check
in_atomic and then does GFP_KERNEL allocation which would be obviously
broken on !PREEMPT if the function can be called from an atomic
context), I am wondering whether it would make sense to track atomic
context also for !PREEMPT. This check is just terribly error prone.

-- 
Michal Hocko
SUSE Labs
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
