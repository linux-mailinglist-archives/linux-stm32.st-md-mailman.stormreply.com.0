Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AD4846659
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Feb 2024 04:07:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8289C6DD9F;
	Fri,  2 Feb 2024 03:07:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5440BC6DD68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Feb 2024 03:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706843273; x=1738379273;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=obWK63Zy5XJ19imquZEyMwnqRVC/TkO3K+PmbgWqdY0=;
 b=lhdOONbOk5XhLTNhB7/k/77Zas8lsBKHfaEniN1Att8gN19xdxM9Q+XC
 gVayIyxRHPc5qaqiLXc/QKbGgm6zhM0FnEmRtaFhq1158G7lBvxEMqjsN
 rwDA3jyiWRPf8ZjEeSydWPSXntY3gxXSNZv40hU2EsYHeQYTd4EZR9/Jh
 dEGsSKeMTdYQjDD65mIqCdlSzXaoEfJF7O5QUdoYGlNh3Y9ZSuQfWA3oG
 XLUphcVzkSZ8Rao2LaKvRv3c/HR6ZWS9uPawnKtUupnllQMHhZwOrxMTD
 NHxlkvOujnLEtAd/Z3Vnak2G60nQtde1EmHGl5QvTK4kKs0COOF3ejxTd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="468284146"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; d="scan'208";a="468284146"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 19:07:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="859304289"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; d="scan'208";a="859304289"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.22.55])
 ([10.247.22.55])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 19:07:40 -0800
Message-ID: <46d14e3e-a334-447f-a25c-17ed58170741@linux.intel.com>
Date: Fri, 2 Feb 2024 11:07:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <20230921121946.3025771-1-yong.liang.choong@linux.intel.com>
 <20230921121946.3025771-5-yong.liang.choong@linux.intel.com>
 <jmq54bskx4zd75ay4kf5pcdo6wnz72pxzfo5ivevleef4scucr@uw4fkfs64f3c>
 <26568944-563d-4911-8f6f-14c0162db6e9@linux.intel.com>
 <07a4aa8e-800c-4564-81c8-7cfcdddf1379@lunn.ch>
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <07a4aa8e-800c-4564-81c8-7cfcdddf1379@lunn.ch>
Cc: Voon Wei Feng <weifeng.voon@intel.com>,
 Simon Horman <simon.horman@corigine.com>, Alexei Starovoitov <ast@kernel.org>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 David E Box <david.e.box@intel.com>, Eric Dumazet <edumazet@google.com>,
 David E Box <david.e.box@linux.intel.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Tan Tee Min <tee.min.tan@linux.intel.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Wong Vee Khee <veekhee@apple.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Andrew Halaney <ahalaney@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Jean Delvare <jdelvare@suse.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Cochran <richardcochran@gmail.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 platform-driver-x86@vger.kernel.org,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 4/5] net: stmmac: enable Intel
 mGbE 1G/2.5G auto-negotiation support
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



On 29/1/2024 9:41 pm, Andrew Lunn wrote:
> Hi Choong
> 
> Please trim the text when replying. It can be hard to find actually
> replies when having to do lots and lots of page downs. Just give the
> context needed to understand your reply.
> 
> 	Andrew
Hi Andrew,

Thank you for the feedback.
I will trim the message next time.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
