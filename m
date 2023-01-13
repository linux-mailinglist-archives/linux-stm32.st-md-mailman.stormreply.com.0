Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0576F669CF3
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jan 2023 16:52:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A23FAC65E45;
	Fri, 13 Jan 2023 15:52:45 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4030C6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jan 2023 15:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673625163; x=1705161163;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rVAuAq0BfESy5E3fTHeb28N28gn8YJ95tDzKu9Kp8Ik=;
 b=b4Xw6jGLCnMWRj1ezJDl6OgkqdgrFnmf3gQtLn6LWy+Fy1VKF8tFVtwD
 nku9JXZReB2u49Cpjd+Ir4izT4kvz3Dk4EtPQiWSpTqKPzDW5T+JS8lFC
 wjgwZggbtGbAIEOoIMfp1eX1eqsSM7wlY5/d+EsxPw5elOF56bnaCXSG/
 AidF/7awhDsZDiFyN6pW/EO/JG7AUhebRMp2v/a+o+so7+uEVWPDyaX3P
 V/pOMZJYklkc8FRmDbmDZadCHRzWYd/ityGzIZvSNqLP+fqwqzk7e7Qh1
 +7jzFM0tSANS6/Y/4G9r9INWsIwTx1Zh1WyiXCuzMunLIzMEkZMHwHHpj A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="325279469"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="325279469"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 07:52:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="800627291"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="800627291"
Received: from ubik.fi.intel.com (HELO localhost) ([10.237.72.184])
 by fmsmga001.fm.intel.com with ESMTP; 13 Jan 2023 07:52:38 -0800
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, rcu@vger.kernel.org
In-Reply-To: <20230113001132.3375334-5-paulmck@kernel.org>
References: <20230113001103.GA3374173@paulmck-ThinkPad-P17-Gen-1>
 <20230113001132.3375334-5-paulmck@kernel.org>
Date: Fri, 13 Jan 2023 17:52:37 +0200
Message-ID: <871qnysa7u.fsf@ubik.fi.intel.com>
MIME-Version: 1.0
Cc: John Ogness <john.ogness@linutronix.de>,
 "Paul E. McKenney" <paulmck@kernel.org>, alexander.shishkin@linux.intel.com,
 kernel-team@meta.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH rcu v2 05/20] drivers/hwtracing/stm:
	Remove "select SRCU"
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

Accidentally acked the previous version. This appears to be the same.

Acked-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>

Regards,
--
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
