Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DDF9183E7
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2024 16:24:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 251F9C71282;
	Wed, 26 Jun 2024 14:24:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE69FC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 14:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719411874; x=1750947874;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CuHPqyAPRoQfZVkmRu3Q18KTjaKXZmJG02/XUes9hgQ=;
 b=cih0Y+pd30IkytqepMcNLuWaSg/rITcAfwpz4pvWLGKIoLAGNffgIpjC
 f5kH923ezy/jjGY1Zf5zUmu4R7CKTeCqYQpf6mUz5j7T7ftXKuGQlCSt5
 LE6p/Nknx7rvEOcrJn70gYB2TnXsqYyxr+vFlzdC/hzMiuLNgbQAJixJ9
 CnA5MZfq4M3oEEIYekbAxyUUwg49uVeXeY9ScDzJD6d6exsn7Nmosuvd2
 W6T4zju31QzBYKVPHWG+GHQBgNBvi18Gkbbabmm/Npoye9rQDdmcp00oh
 0yCFM/esBkK8S+kRSRhhmf+rTNqjNE/I281PCybNGvvcPTo4GrMfCk8wl w==;
X-CSE-ConnectionGUID: h4fLYqF2RyyuscZhn4mqmw==
X-CSE-MsgGUID: 1aek+nBpSUy4olcXlPjRcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16634419"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="16634419"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 07:24:26 -0700
X-CSE-ConnectionGUID: YVxzdlZZTNCOOsIetqYlkQ==
X-CSE-MsgGUID: wXROosdSRtqH8MtrKN2U2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="48943302"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by orviesa003.jf.intel.com with SMTP; 26 Jun 2024 07:24:23 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Wed, 26 Jun 2024 17:24:22 +0300
Date: Wed, 26 Jun 2024 17:24:22 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <ZnwkloBH6UVzPOjg@kuha.fi.intel.com>
References: <20240625-ucsi-rework-interface-v3-0-7a6c8e17be3a@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240625-ucsi-rework-interface-v3-0-7a6c8e17be3a@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nikita Travkin <nikita@trvn.ru>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/7] usb: typec: ucsi: rework glue
	driver interface
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

On Tue, Jun 25, 2024 at 05:54:25PM +0300, Dmitry Baryshkov wrote:
> The interface between UCSI and the glue driver is very low-level. It
> allows reading the UCSI data from any offset (but in reality the UCSI
> driver reads only VERSION, CCI an MESSAGE_IN data). All event handling
> is to be done by the glue driver (which already resulted in several
> similar-but-slightly different implementations). It leaves no place to
> optimize the write-read-read sequence for the command execution (which
> might be beneficial for some of the drivers), etc.
> 
> The patchseries attempts to restructure the UCSI glue driver interface
> in order to provide sensible operations instead of a low-level read /
> write calls.
> 
> If this approach is found to be acceptable, I plan to further rework the
> command interface, moving reading CCI and MESSAGE_IN to the common
> control code, which should simplify driver's implementation and remove
> necessity to split quirks between sync_control and read_message_in e.g.
> as implemented in the ucsi_ccg.c.
> 
> Note, the series was tested only on the ucsi_glink platforms. Further
> testing is appreciated.

I tested these on couple of systems that use the acpi mailbox, and
didn't see any problems. I'll be away for most of July, so if there's
nothing else, for the series:

Tested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

thanks,

-- 
heikki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
