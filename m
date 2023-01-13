Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A101F669855
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jan 2023 14:20:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4228EC65E45;
	Fri, 13 Jan 2023 13:20:26 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80762C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jan 2023 13:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673616024; x=1705152024;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=962ix4Kbj8py4f4DI4pmUEFzHQKzIM5X1LKxKun+ZDE=;
 b=fs+aCQh6cfIp3QAk4JN9eEkOedVJVcPzvQH4lh22pcXJGk/BXiLk9O3u
 9ALJNfbaVOsvequAnGREqW2+7oJUB6S8j3PnWWG+AFhuYRH9KSzThiVxt
 ck6FQe7d4BMrTlR1i3FJ1KBOxblPGV6zy3Cfix0qKP6tNzduugwdv8abU
 WVVImyAc5Apdm63qr3fKQpITr4+lBVSrS1iQdSA2DJ1Vxbgu8AmBlyNUk
 Fc6iKvXkLE/On7m620vI/uNeXUvBKFvzqA/WBQ6l1Ebn3TcgxmnvR01Jx
 7PVrkUXkdqOv1p1gvmGCmmoXVxqggX0/XvYyjMHYst1O7tvwwWzXvtpao A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="322689341"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="322689341"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 05:20:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="608168849"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="608168849"
Received: from ubik.fi.intel.com (HELO localhost) ([10.237.72.184])
 by orsmga003.jf.intel.com with ESMTP; 13 Jan 2023 05:20:14 -0800
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, rcu@vger.kernel.org
In-Reply-To: <20230105003813.1770367-13-paulmck@kernel.org>
References: <20230105003759.GA1769545@paulmck-ThinkPad-P17-Gen-1>
 <20230105003813.1770367-13-paulmck@kernel.org>
Date: Fri, 13 Jan 2023 15:19:50 +0200
Message-ID: <87fscetvux.fsf@ubik.fi.intel.com>
MIME-Version: 1.0
Cc: "Paul E. McKenney" <paulmck@kernel.org>, alexander.shishkin@linux.intel.com,
 kernel-team@meta.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH rcu 13/27] drivers/hwtracing/stm: Remove
	"select SRCU"
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

"Paul E. McKenney" <paulmck@kernel.org> writes:

> Now that the SRCU Kconfig option is unconditionally selected, there is
> no longer any point in selecting it.  Therefore, remove the "select SRCU"
> Kconfig statements.

Acked-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>

Thanks,
--
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
