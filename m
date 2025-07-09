Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC52BAFEE09
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 17:49:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6498CC36B2A;
	Wed,  9 Jul 2025 15:49:45 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 008C7C36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 15:49:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 96AEE439E5;
 Wed,  9 Jul 2025 15:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04AF3C4CEEF;
 Wed,  9 Jul 2025 15:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752076182;
 bh=4eG67VwdY6yryX9Oqb584knMPMQAKXI8QBnDkqUgg/c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Cwuh3Xe61CXjMKNkToIZevUXQzpOfauMU3w1uzfo4otQHWOZURQipbRvGCdThUF2q
 ye+BL+7tfamDxzHaO7jA7S7avZDaaw7zxWQGdu2Z8nZlAR36pAQvgnpwX2PHuVDkcB
 RTej8EmaA/9GFzRVcJyLhsAyoDuOX4LVihX1tnt5GDO+qrq/9g3oVfa8sCehLBJ3rM
 CmHD+UvXKoqROd00XIWOvQBQI0LGobiTS8tdnG/z0v8vPpssCsDOGyQLGffKl/w3Bz
 RmUVNmpSsAnRnXBKGECv+Z3/pcxdtMzheiG99XWQM6obd4Z5qxcVxhBd+5MTTc0WQx
 v3451WtbhxAmw==
Date: Wed, 9 Jul 2025 16:49:33 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Message-ID: <20250709164933.47913e22@jic23-huawei>
In-Reply-To: <aG4sxEtXRw982Z9q@smile.fi.intel.com>
References: <20250708231144.971170-1-sakari.ailus@linux.intel.com>
 <20250708231152.971550-1-sakari.ailus@linux.intel.com>
 <aG4sxEtXRw982Z9q@smile.fi.intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Andy Shevchenko <andy@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Uwe =?UTF-8?B?S2xlaW5l?= =?UTF-8?B?LUvDtm5pZw==?=
 <u.kleine-koenig@baylibre.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 05/12] iio: dac: Remove redundant
 pm_runtime_mark_last_busy() calls
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

On Wed, 9 Jul 2025 11:48:04 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Wed, Jul 09, 2025 at 02:11:52AM +0300, Sakari Ailus wrote:
> > pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> > pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> > to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> > pm_runtime_mark_last_busy().  
> 
> ...
> 
> > -	if (!enable) {
> > -		pm_runtime_mark_last_busy(dev);
> > +	if (!enable)
> >  		pm_runtime_put_autosuspend(dev);
> > -	}
> >  
> >  	return 0;
> >  
> >  err_put_pm:
> > -	if (enable) {
> > -		pm_runtime_mark_last_busy(dev);
> > +	if (enable)
> >  		pm_runtime_put_autosuspend(dev);
> > -	}
> >  
> >  	return ret;  
> 
> 
> Hmm... Why not simply
> 
> 	ret = 0;
It's already zero (as last call was a regmap_update_bits() return value ) so even easier.
However, switch if (ret < 0) to if (ret) for that regmap call
to make that more obvious.

> 
> err_put_pm:
> 	if (enable)
> 		pm_runtime_put_autosuspend(dev);
> 
> 	return ret;
> 
> instead of the duplication?
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
