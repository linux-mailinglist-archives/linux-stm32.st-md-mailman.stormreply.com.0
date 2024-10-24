Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AC49AE32E
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2024 12:59:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A900C78038;
	Thu, 24 Oct 2024 10:59:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69351C6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 10:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729767562; x=1761303562;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GPWavBPBtkbxSCcUdtFw4ouL78GHZ3w/+hpqcDQzX1s=;
 b=IxjMqxlWlxikwSGBaJUIFnKRmaPdXOjZoOrgnKfiH3756xPub2EHfdUT
 zCr+5gy+63DMku3jCDSC5hu+b48HSdlO58FCdalXiWVC+7W9jB+548ROu
 2HJNHyTI44p17bWksb9NzCNUUeOwFFKLil6QajoqDx99SR9qh5tXt8S49
 vkvsl46vc7TJuFD0nscpAYd4P0Z+hqeshZ0cJKJovtEsMe6FsBq1Trp9U
 8AAo7ngv4XOxe6ZcU4gwbrSk2EJIje4ePYiIpPZZXDmPJ3RgyOaOJYQgR
 kDNBGBqh9vC1nQfoy/Cr+l592zgz2UZHTnekjWYdJupm+e23vupQOmuxz Q==;
X-CSE-ConnectionGUID: dRgmyGl1T1a8r4YhXw48Vg==
X-CSE-MsgGUID: wQCZBcPBQgaFmgtqFD0/JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="33296924"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="33296924"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 03:59:14 -0700
X-CSE-ConnectionGUID: HpBa6mkBQ/6ZbUkosee+oA==
X-CSE-MsgGUID: cIPq/R23SpeaTmSzk360wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="85116587"
Received: from ubik.fi.intel.com (HELO localhost) ([10.237.72.184])
 by fmviesa005.fm.intel.com with ESMTP; 24 Oct 2024 03:59:11 -0700
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
In-Reply-To: <20241004094122.113606-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <20241004094122.113606-1-sakari.ailus@linux.intel.com>
Date: Thu, 24 Oct 2024 13:59:11 +0300
Message-ID: <87ed45vkao.fsf@ubik.fi.intel.com>
MIME-Version: 1.0
Cc: alexander.shishkin@linux.intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 15/51] stm class: Switch to
	__pm_runtime_put_autosuspend()
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

Sakari Ailus <sakari.ailus@linux.intel.com> writes:

> pm_runtime_put_autosuspend() will soon be changed to include a call to
> pm_runtime_mark_last_busy(). This patch switches the current users to
> __pm_runtime_put_autosuspend() which will continue to have the
> functionality of old pm_runtime_put_autosuspend().

Hi Sakari,

Acked-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>

Or do you want me to pick it up into my queue instead?

Regards,
--
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
