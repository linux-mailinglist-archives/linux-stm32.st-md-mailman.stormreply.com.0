Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B076EB91272
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Sep 2025 14:40:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66ED6C32E92;
	Mon, 22 Sep 2025 12:40:57 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8564C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 12:40:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 92108601E7;
 Mon, 22 Sep 2025 12:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133B5C4CEF0;
 Mon, 22 Sep 2025 12:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1758544855;
 bh=9EnrkUTRC3WbuAFf4lnbSzwEyBeWACdeCsxOYAwx2mg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ozGcCAjUuLnf1RgOGckV6AH965oAp/K1TY2eSbmKl/C4fNB3qo4dlWtmlSINDjjOP
 knEuUlp18RwYdjWTm6QWnSR+v+UHtYkNhp60v4aYebb3MOmMXSuvvJNHmE5LFQXLaU
 0/BlWu+1DnvN/JJh+naIMq1n1GDWeuu66LQM7q98=
Date: Mon, 22 Sep 2025 14:40:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: David.Laight@aculab.com, Rodrigo.Siqueira@amd.com, Xinhui.Pan@amd.com,
 agk@redhat.com, airlied@gmail.com, akpm@linux-foundation.org,
 alexander.deucher@amd.com, alexandre.torgue@foss.st.com,
 amd-gfx@lists.freedesktop.org, andriy.shevchenko@linux.intel.com,
 anton.ivanov@cambridgegreys.com, arnd@kernel.org,
 artur.paszkiewicz@intel.com, bp@alien8.de, christian.koenig@amd.com,
 clm@fb.com, daniel@ffwll.ch, dave.hansen@linux.intel.com,
 davem@davemloft.net, dm-devel@lists.linux.dev,
 dmitry.torokhov@gmail.com, dri-devel@lists.freedesktop.org,
 dsahern@kernel.org, dsterba@suse.com, edumazet@google.com,
 evan.quan@amd.com, farbere@amazon.com, harry.wentland@amd.com,
 hdegoede@redhat.com, hpa@zytor.com, ilpo.jarvinen@linux.intel.com,
 james.morse@arm.com, jdelvare@suse.com, jejb@linux.ibm.com,
 jernej.skrabec@gmail.com, joabreu@synopsys.com,
 johannes@sipsolutions.net, josef@toxicpanda.com,
 keescook@chromium.org, krzysztof.kozlowski@linaro.org,
 kuba@kernel.org, linus.walleij@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-staging@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-um@lists.infradead.org,
 linux@rasmusvillemoes.dk, linux@roeck-us.net,
 lorenzo.stoakes@oracle.com, luc.vanoostenryck@gmail.com,
 luto@kernel.org, maarten.lankhorst@linux.intel.com,
 mailhol.vincent@wanadoo.fr, malattia@linux.it, markgross@kernel.org,
 martin.petersen@oracle.com, mchehab@kernel.org,
 mcoquelin.stm32@gmail.com, mhiramat@kernel.org, minchan@kernel.org,
 mingo@redhat.com, mkl@pengutronix.de, mripard@kernel.org,
 pabeni@redhat.com, peterz@infradead.org, pmladek@suse.com,
 qiuxu.zhuo@intel.com, richard@nod.at, rostedt@goodmis.org,
 rric@kernel.org, sakari.ailus@linux.intel.com, samuel@sholland.org,
 senozhatsky@chromium.org, shuah@kernel.org, snitzer@kernel.org,
 sunpeng.li@amd.com, tglx@linutronix.de, tony.luck@intel.com,
 torvalds@linux-foundation.org, tzimmermann@suse.de,
 wad@chromium.org, wens@csie.org, wg@grandegger.com, x86@kernel.org
Message-ID: <2025092209-owl-whisking-03e3@gregkh>
References: <20250922103241.16213-5-farbere@amazon.com>
 <2025092200-reverb-stumble-8578@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2025092200-reverb-stumble-8578@gregkh>
Cc: stable-commits@vger.kernel.org
Subject: Re: [Linux-stm32] Patch "minmax: make generic MIN() and MAX()
 macros available everywhere" has been added to the 6.6-stable tree
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

On Mon, Sep 22, 2025 at 02:27:00PM +0200, gregkh@linuxfoundation.org wrote:
> 
> This is a note to let you know that I've just added the patch titled
> 
>     minmax: make generic MIN() and MAX() macros available everywhere
> 
> to the 6.6-stable tree which can be found at:
>     http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary
> 
> The filename of the patch is:
>      minmax-make-generic-min-and-max-macros-available-everywhere.patch
> and it can be found in the queue-6.6 subdirectory.
> 
> If you, or anyone else, feels it should not be added to the stable tree,
> please let <stable@vger.kernel.org> know about it.
> 
> 
> >From prvs=353d6d59a=farbere@amazon.com Mon Sep 22 12:35:15 2025
> From: Eliav Farber <farbere@amazon.com>
> Date: Mon, 22 Sep 2025 10:32:30 +0000
> Subject: minmax: make generic MIN() and MAX() macros available everywhere
> To: <richard@nod.at>, <anton.ivanov@cambridgegreys.com>, <johannes@sipsolutions.net>, <dave.hansen@linux.intel.com>, <luto@kernel.org>, <peterz@infradead.org>, <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <x86@kernel.org>, <hpa@zytor.com>, <tony.luck@intel.com>, <qiuxu.zhuo@intel.com>, <james.morse@arm.com>, <mchehab@kernel.org>, <rric@kernel.org>, <harry.wentland@amd.com>, <sunpeng.li@amd.com>, <Rodrigo.Siqueira@amd.com>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>, <evan.quan@amd.com>, <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>, <tzimmermann@suse.de>, <jdelvare@suse.com>, <linux@roeck-us.net>, <linus.walleij@linaro.org>, <dmitry.torokhov@gmail.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <agk@redhat.com>, <snitzer@kernel.org>, <dm-devel@lists.linux.dev>, <mailhol.vincent@wanadoo.fr>, <wg@grandegger.com>, <mkl@pengutronix.de>, <davem@davemloft.net>, <e
 du
>  mazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>, <alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>, <mcoquelin.stm32@gmail.com>, <krzysztof.kozlowski@linaro.org>, <malattia@linux.it>, <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>, <markgross@kernel.org>, <artur.paszkiewicz@intel.com>, <jejb@linux.ibm.com>, <martin.petersen@oracle.com>, <sakari.ailus@linux.intel.com>, <gregkh@linuxfoundation.org>, <clm@fb.com>, <josef@toxicpanda.com>, <dsterba@suse.com>, <luc.vanoostenryck@gmail.com>, <rostedt@goodmis.org>, <mhiramat@kernel.org>, <pmladek@suse.com>, <andriy.shevchenko@linux.intel.com>, <linux@rasmusvillemoes.dk>, <senozhatsky@chromium.org>, <minchan@kernel.org>, <akpm@linux-foundation.org>, <dsahern@kernel.org>, <shuah@kernel.org>, <keescook@chromium.org>, <wad@chromium.org>, <farbere@amazon.com>, <David.Laight@ACULAB.COM>, <arnd@kernel.org>, <linux-um@lists.infradead.org>, <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>, <amd-gfx@lists.freedesk
 to
>  p.org>, <dri-devel@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>, <linux-input@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>, <linux-media@vger.kernel.org>, <linux-can@vger.kernel.org>, <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, <platform-driver-x86@vger.kernel.org>, <linux-scsi@vger.kernel.org>, <linux-staging@lists.linux.dev>, <linux-btrfs@vger.kernel.org>, <linux-sparse@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>, <bpf@vger.kernel.org>, <stable@vger.kernel.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>, David Laight <David.Laight@aculab.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Message-ID: <20250922103241.16213-5-farbere@amazon.com>
> 
> From: Linus Torvalds <torvalds@linux-foundation.org>
> 
> [ Upstream commit 1a251f52cfdc417c84411a056bc142cbd77baef4 ]
> 
> This just standardizes the use of MIN() and MAX() macros, with the very
> traditional semantics.  The goal is to use these for C constant
> expressions and for top-level / static initializers, and so be able to
> simplify the min()/max() macros.
> 
> These macro names were used by various kernel code - they are very
> traditional, after all - and all such users have been fixed up, with a
> few different approaches:
> 
>  - trivial duplicated macro definitions have been removed
> 
>    Note that 'trivial' here means that it's obviously kernel code that
>    already included all the major kernel headers, and thus gets the new
>    generic MIN/MAX macros automatically.
> 
>  - non-trivial duplicated macro definitions are guarded with #ifndef
> 
>    This is the "yes, they define their own versions, but no, the include
>    situation is not entirely obvious, and maybe they don't get the
>    generic version automatically" case.
> 
>  - strange use case #1
> 
>    A couple of drivers decided that the way they want to describe their
>    versioning is with
> 
> 	#define MAJ 1
> 	#define MIN 2
> 	#define DRV_VERSION __stringify(MAJ) "." __stringify(MIN)
> 
>    which adds zero value and I just did my Alexander the Great
>    impersonation, and rewrote that pointless Gordian knot as
> 
> 	#define DRV_VERSION "1.2"
> 
>    instead.
> 
>  - strange use case #2
> 
>    A couple of drivers thought that it's a good idea to have a random
>    'MIN' or 'MAX' define for a value or index into a table, rather than
>    the traditional macro that takes arguments.
> 
>    These values were re-written as C enum's instead. The new
>    function-line macros only expand when followed by an open
>    parenthesis, and thus don't clash with enum use.
> 
> Happily, there weren't really all that many of these cases, and a lot of
> users already had the pattern of using '#ifndef' guarding (or in one
> case just using '#undef MIN') before defining their own private version
> that does the same thing. I left such cases alone.
> 
> Cc: David Laight <David.Laight@aculab.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  arch/um/drivers/mconsole_user.c                                       |    2 
>  drivers/edac/skx_common.h                                             |    1 
>  drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c                   |    2 
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h                    |   14 ++++-

Oops, nope, this patch breaks the amd driver's build :(

I'll drop this patch and stop here on this patch series.  Please fix
this up and resend the remaining ones after it builds properly.

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
